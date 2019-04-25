######################
# Stage: Builder
FROM ruby:2.5.1-alpine as Builder

ARG FOLDERS_TO_REMOVE
ARG BUNDLE_WITHOUT
ARG RAILS_ENV

ENV BUNDLE_WITHOUT ${BUNDLE_WITHOUT}
ENV RAILS_ENV ${RAILS_ENV}
ENV SECRET_KEY_BASE ${SECRET_KEY_BASE}
ENV RAILS_SERVE_STATIC_FILES ${RAILS_SERVE_STATIC_FILES}

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    git \
    imagemagick \
    tzdata

WORKDIR /app

# Install gems
ADD Gemfile* /app/
RUN bundle config --global frozen 1 \
 && bundle install -j4 --retry 3 \
 # Remove unneeded files (cached *.gem, *.o, *.c)
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete

# Add the Rails app
ADD . /app

# Remove folders not needed in resulting image
RUN rm -rf $FOLDERS_TO_REMOVE

###############################
# Stage Final
FROM ruby:2.5.1-alpine
LABEL maintainer="timur.vafin@flatstack.com"

ARG PORT
ARG ADDITIONAL_PACKAGES

# Add Alpine packages
RUN apk add --update --no-cache \
    postgresql-client \
    imagemagick \
    tzdata \
    file \
    $ADDITIONAL_PACKAGES

# Add user
RUN addgroup -g 1000 -S app && adduser -u 1000 -S app -G app
USER app

# Copy app with gems from former build stage
COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=app:app /app /app

# Set Rails env
ENV RAILS_LOG_TO_STDOUT true

WORKDIR /app

# Expose Server port
EXPOSE $PORT

# Save timestamp of image building
RUN date -u > BUILD_TIME

# Start up
CMD ["bundle", "exec", "rails", "server"]
