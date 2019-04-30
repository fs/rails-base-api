## Project name

[![Semaphore](https://semaphoreapp.com/api/v1/projects/0e00006725dcea00b179fab81a1b1bdaf9a64816/106819/shields_badge.png)](https://semaphoreapp.com/fs/rails-base-api)

## Project description

## Dependencies

* Postgresql 11.2
* Ruby 2.5.1
* Rails 5.2.2.1

## Quick Start

1. Clone this repo `git clone git@github.com:account/repo.git`
2. Run setup script `bin/setup`
3. Run specs `bin/ci`
3. Run server `bin/server`

## Scripts

* `bin/setup` - build Docker image and prepare DB
* `docker-compose up --detach` - to run server locally
* `docker-compose exec app bin/rspec` - runs RSpec tests
* `docker-compose exec app bin/quality` - runs rubocop, brakeman, and bundle-audit
* `docker-compose exec app bin/doc` - generates API documentation


## Documentation & Examples

Where is documentation and examples (e.g. `./docs`)?

## Continuous Integration

CI service info and status (if available).
Add a link to a project page on [Semaphore](http://semaphoreapp.com).

## Staging

Location and other info about staging servers.

## Production

