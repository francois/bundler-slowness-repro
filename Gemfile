# frozen_string_literal: true
source "https://rubygems.org"
git_source(:bus_git) { |repo_name| "https://815afc332acbcf4ce674af2261135dfec9e9114f:x-oauth-basic@github.com/Bus-com/#{repo_name}.git" }

ruby "2.7.3"

gem "actionpack-action_caching", git: "https://github.com/rails/actionpack-action_caching.git"
gem "active_model_serializers"
gem "activerecord-import", "> 0.4.0"
gem "activerecord-postgis-adapter", "~> 6.0", ">= 6.0.1"
gem "analytics-ruby", "~> 2.2.8", require: "segment/analytics"
gem "angular_rails_csrf"
gem "angularjs-rails-resource"
gem "auto_strip_attributes"
gem "autoprefixer-rails"
gem "aws-sdk-s3"
gem "bourbon"
gem "bower-rails"
gem "bunny"
gem "carmen" # carmen-rails for locale?
gem "carrierwave"
gem "carrierwave-imageoptimizer"
gem "caxlsx"
gem "caxlsx_rails"
gem "coffee-rails", "~> 5.0.0"
gem "countries" # Managing currencies
gem "d3-rails"
gem "data_migrate"
gem "deep_cloneable" # Deep clonning, dup with association
gem "devise"
gem "error_handler", path: "./error_handler", require: "error_handler"
gem "faraday", "~> 1.3.0"
gem "flag_shih_tzu" # Binary flags for models
gem "font-awesome-rails"
gem "foundation-icons-sass-rails"
gem "foundation-rails", "~> 5.5.1.0"
gem "geocoder"
gem "google-api-client", "~> 0.53.0", require: false
gem "googlecharts"
gem "graphql", ">= 1.9.11"
gem "has_multilingual_attributes", ">= 1.0", git: "https://github.com/Bus-com/has_multilingual_attributes.git"
gem "http_accept_language", "~> 2.1"
gem "i18n", "~> 1.6.0"
gem "i18n-js"
gem "icalendar"
gem "jbuilder", "~> 2.11"
gem "jquery-easing-rails"
gem "jquery-rails"
gem "json", ">= 2.3.0" # CVE-2020-10663
gem "koala", require: false
gem "mandrill-api", git: "https://github.com/Bus-com/mandrill-api-ruby", branch: "master" # Transactional Email through MailChimp
gem "metrics",       path: "./metrics",       require: "metrics"
gem "mini_magick"
gem "money",         path: "./money",         require: "money"
gem "netsuite-adapter",  path: "./netsuite-adapter",  require: "netsuite/adapter"
gem "newrelic_rpm"
gem "nokogiri", "~> 1.11.2" # CVE-2019-11068
gem "omniauth"
gem "omniauth-oauth2",   ">= 1.1.1" # resolves CVE-2012-6134
gem "omniauth-rails_csrf_protection", "~> 1.0" # part of CVE-2015-9284
gem "paranoia" # Soft delete
gem "pg", "~> 1.2.3"
gem "pg_search"
gem "phony_rails"
gem "polylines" # To decode Google Maps Polylines
gem "prawn"
gem "prawn-table"
gem "promoter", require: false
gem "protos",        path: "./protos",        require: "protos"
gem "pry-rails"
gem "puma"
gem "pundit"
gem "rack-contrib", require: "rack/contrib"
gem "rack-cors", require: "rack/cors"
gem "rack-host-redirect"
gem "rails", "~> 6.0.3"
gem "redis-rails"
gem "relay",         path: "./relay",         require: "relay"
gem "request_store"
gem "resque", "= 1.27.4"
gem "resque-heroku-signals", "1.27.4.3"
gem "resque-loner" # ActionListeners don't want duplicate jobs
gem "resque-retry"
gem "resque-scheduler"
gem "revisable",     path: "./revisable",     require: "revisable"
gem "rgeo-geojson" # Encode and decode GEO in Json
gem "rkelly-remix"
gem "rqrcode"
gem "rubyzip", "< 2.3.1"
gem "sassc-rails", "~> 2.1.2"
gem "select2-rails"
gem "serviceworker-rails"
gem "sorbet-runtime"
gem "spreadsheet-excel"
gem "sprockets", "< 4"
gem "state_machines-activerecord"
gem "stripe", "5.30.0"
gem "twilio-ruby"
gem "tzinfo"
gem "uglifier", ">= 1.3.0"
gem "value_object",  path: "./value_object",  require: "value_object"
gem "virtus"
gem "virtus-group"
gem "will_paginate", "~> 3.3.0" # paginate
gem "yomu"

group :production do
  gem "fog-aws"
end

group :development do
  gem "better_errors"
  gem "i18n-tasks"
  gem "rack-mini-profiler", "~> 2.3.1"
  gem "ruby-graphviz"
  gem "spoom" # for sorbet

  # access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console", "4.1.0"

  # graphql in-browser query editor
  gem "graphiql-rails"
end

group :development, :test do
  gem "annotate", "~> 3.1.1"
  gem "awesome_print"
  gem "bullet" # N+1 Queries
  gem "dotenv-rails"
  gem "fasterer"
  gem "guard-rspec", "~> 4.7"
  gem "parallel_tests"
  gem "pry-byebug"
  gem "rails-controller-testing"
  gem "rmagick"
  gem "rspec-collection_matchers"
  gem "rspec-instafail"
  gem "rspec-rails", "~> 5.0.1"
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "ruby-prof", ">= 0.17.0", require: false
  gem "sorbet"
  gem "sorbet-progress"
  gem "sorbet-rails"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "sprite-factory"
  gem "stackprof", ">= 0.2.9", require: false
  gem "timecop"
end

group :test do
  gem "capybara"
  gem "capybara-email"
  gem "database_cleaner"
  gem "factory_bot_rails", require: false
  gem "faker"
  gem "json_expressions"
  gem "launchy"
  gem "minitest-rails"
  gem "poltergeist"
  gem "rails-perftest", git: "https://github.com/rails/rails-perftest", branch: "master"
  gem "resque_spec"
  gem "rspec_junit_formatter", require: false
  gem "rubocop-rspec"
  gem "selenium-webdriver"
  gem "simplecov",      require: false
  gem "simplecov-json", require: false
  gem "stripe-ruby-mock"
  gem "test-prof", "~> 1.0"
  gem "webmock", require: "webmock/rspec"
end
