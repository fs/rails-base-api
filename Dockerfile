######################
# Stage: Builder
FROM ruby:2.5.1-alpine as Builder

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    git \
    imagemagick \
    tzdata

WORKDIR /app

# Install gems
ARG BUNDLE_WITHOUT
ENV BUNDLE_WITHOUT ${BUNDLE_WITHOUT}

COPY Gemfile* /app/
RUN bundle install -j4 --retry 3 \
 # Remove unneeded files (cached *.gem, *.o, *.c)
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete

# Add the Rails app
COPY . /app/

# Remove folders not needed in resulting image
ARG FOLDERS_TO_REMOVE
RUN rm -rf $FOLDERS_TO_REMOVE

###############################
# Stage Final
FROM ruby:2.5.1-alpine
LABEL maintainer="timur.vafin@flatstack.com"

# Add Alpine packages
ARG ADDITIONAL_PACKAGES
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
COPY --from=Builder --chown=app:app /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=app:app /app/ /app/

WORKDIR /app

# Expose Server port
EXPOSE 3000

# Set Rails env
ENV RAILS_LOG_TO_STDOUT true

# Start up
CMD ["bundle", "exec", "rails", "server"]
