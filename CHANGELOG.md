# Unreleased

* Add health_check gem for check that rails is up
* Update Rails to 4.2.7.1
* Update Ruby to 2.3.1
* Update Nokogiri gem to get rid of vulnerabilities
* Update Rails to get rid of vulnerabilities
  ([#200](https://github.com/fs/rails-base-api/pull/200))
* Update Rails and Devise to get rid of vulnerabilities
  ([#198](https://github.com/fs/rails-base-api/pull/198))
* Switch off static assets serve
  ([#192](https://github.com/fs/rails-base-api/pull/192))
* Update Rails to 4.2.4 and Ruby to 2.2.3
  ([#193](https://github.com/fs/rails-base-api/pull/193))
* Sync Rubocop rules with Rails-Base
* Replace custom token authentication strategy with [simple_token_authentication](https://github.com/gonzalo-bulnes/simple_token_authentication)
  ([#184](https://github.com/fs/rails-base-api/pull/184))
* Add id to error response
  ([#183](https://github.com/fs/rails-base-api/pull/183))
* Upgrade Active Model Serializer to 0.10.0.rc2
  ([#182](https://github.com/fs/rails-base-api/pull/182))
* Rename bin/bootstrap to bin/setup
  ([#180](https://github.com/fs/rails-base-api/pull/180))
* Replace zeus with [Spring](https://github.com/rails/spring) for fast Rails actions via pre-loading
* Provide full resource for all requests
  ([#176](https://github.com/fs/rails-base-api/pull/176))
* Introduce `rails_api_format` gem. Currently it makes standard error responses,
  in the future all API format related changes will be made by this gem.
  ([#85](https://github.com/fs/rails-base-api/pull/85))
* Filter headers in docs to make it less chatty
  ([#177](https://github.com/fs/rails-base-api/pull/177))
* Move `sessions` resource to `v1` namespace
  ([#175](https://github.com/fs/rails-base-api/pull/175))
* Replace unsupported [interactor-rails](https://github.com/collectiveidea/interactor-rails) with [interactor](https://github.com/collectiveidea/interactor)
  ([#151](https://github.com/fs/rails-base-api/pull/151))
* Update Ruby to 2.2.2 and dependencies: rubocop
  ([#173](https://github.com/fs/rails-base-api/pull/173))
* Update Rails API to 0.4.0
  ([#171](https://github.com/fs/rails-base-api/pull/171))
* Update Rspec and dependencies: guard-rspec, rspec_api_documentation.
  Remove minitest from dependencies after update of shoulda-matchers.
  ([#170](https://github.com/fs/rails-base-api/pull/170))
* Update Rails to 4.2.3 dependencies: ActiveModelSerializer, Devise, Bullet
  ([#169](https://github.com/fs/rails-base-api/pull/169))
* Add `CHANGELOG.md` and `CONTRIBUTING.md`
  ([#167](https://github.com/fs/rails-base-api/pull/167))
