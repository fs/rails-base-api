Project name
-

Third-party service badges (if available)
[![Semaphore](https://semaphoreapp.com/api/v1/projects/0e00006725dcea00b179fab81a1b1bdaf9a64816/106819/shields_badge.png)](https://semaphoreapp.com/fs/rails-base-api)

Project description.

Dependencies
-

Information about external dependencies (redis, mongo, postgres, etc) and how you can obtain them (via homebrew, apt-get or from ftp).

Information about ruby and rails versions.

- PostgreSQL 10.6
  - `brew install postgres`
- Ruby 2.5.1
  - `rbenv install 2.5.1`
- Rails 5

Quick Start
-

Clone this repo:

```
git clone git@github.com:account/repo.git
cd repo
```

Run setup script

```
bin/setup
```

Scripts
-

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally
* `bin/doc` - should be used to generate API documentation

Documentation & Examples
-

Where is documentation and examples (e.g. `./docs`)?

Continuous Integration
-

CI service info and status (if available).
Add a link to a project page on [Semaphore](http://semaphoreapp.com).

Staging
-

Location and other info about staging servers.

Production
-

Location and other info about production servers.

Third-party services
-

Code Climate, etc

Workflow
-

Information about base branch, branch naming, commit messages, specs and pull requests. Check out our [guides](https://github.com/fs/guides/tree/master/development/maintain-existing-project/workflow).
