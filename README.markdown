### Describe the problem as clearly as you can

I wanted to upgrade a specific gem in our repository (activerecord-postgis-adapter). This is the entire diff:

```patch
diff --git a/Gemfile b/Gemfile
index 27df216838..8edf2f4f5c 100644
--- a/Gemfile
+++ b/Gemfile
@@ -7,7 +7,7 @@ ruby "2.7.3"
 gem "actionpack-action_caching", git: "https://github.com/rails/actionpack-action_caching.git"
 gem "active_model_serializers"
 gem "activerecord-import", "> 0.4.0"
-gem "activerecord-postgis-adapter"
+gem "activerecord-postgis-adapter", "~> 6.0", ">= 6.0.1"
 gem "analytics-ruby", "~> 2.2.8", require: "segment/analytics"
 gem "angular_rails_csrf"
 gem "angularjs-rails-resource"
```

After that, I ran the following command:

```sh
bundle update activerecord-postgis-adapter
```

### Post steps to reproduce the problem

```sh
git clone https://github.com/francois/bundler-slowness-repro.git
cd bundler-slowness-repro
bundle update activerecord-postgis-adapter
```

I tried to run with `--verbose`, with the following output:

```
$ bundle update --verbose activerecord-postgis-adapter
Running `bundle update activerecord-postgis-adapter --verbose` with bundler 2.2.16
Found changes from the lockfile, re-resolving dependencies because bundler is unlocking gems: (concurrent-ruby, i18n, minitest, thread_safe, tzinfo, zeitwerk, activesupport, activemodel, activerecord, rgeo, rgeo-activerecord, activerecord-postgis-adapter)
HTTP GET https://index.rubygems.org/versions
HTTP 206 Partial Content https://index.rubygems.org/versions
Fetching gem metadata from https://rubygems.org/
Looking up gems ["active_model_serializers", "activerecord-import", "activerecord-postgis-adapter", "analytics-ruby", "angular_rails_csrf", "angularjs-rails-resource", "auto_strip_attributes", "autoprefixer-rails", "aws-sdk-s3", "bourbon", "bower-rails", "bunny", "carmen", "carrierwave", "carrierwave-imageoptimizer", "caxlsx", "caxlsx_rails", "coffee-rails", "countries", "d3-rails", "data_migrate", "deep_cloneable", "devise", "faraday", "flag_shih_tzu", "font-awesome-rails", "foundation-icons-sass-rails", "foundation-rails", "geocoder", "google-api-client", "googlecharts", "graphql", "http_accept_language", "i18n", "i18n-js", "icalendar", "jbuilder", "jquery-easing-rails", "jquery-rails", "json", "koala", "mini_magick", "newrelic_rpm", "nokogiri", "omniauth", "omniauth-oauth2", "omniauth-rails_csrf_protection", "paranoia", "pg", "pg_search", "phony_rails", "polylines", "prawn", "prawn-table", "promoter", "pry-rails", "puma", "pundit", "rack-contrib", "rack-cors", "rack-host-redirect", "rails", "redis-rails", "request_store", "resque", "resque-heroku-signals", "resque-loner", "resque-retry", "resque-scheduler", "rgeo-geojson", "rkelly-remix", "rqrcode", "rubyzip", "sassc-rails", "select2-rails", "serviceworker-rails", "sorbet-runtime", "spreadsheet-excel", "sprockets", "state_machines-activerecord", "stripe", "twilio-ruby", "tzinfo", "uglifier", "virtus", "virtus-group", "will_paginate", "yomu", "fog-aws", "better_errors", "i18n-tasks", "rack-mini-profiler", "ruby-graphviz", "spoom", "web-console", "graphiql-rails", "annotate", "awesome_print", "bullet", "dotenv-rails", "fasterer", "guard-rspec", "parallel_tests", "pry-byebug", "rails-controller-testing", "rmagick", "rspec-collection_matchers", "rspec-instafail", "rspec-rails", "rubocop-performance", "rubocop-rails", "ruby-prof", "sorbet", "sorbet-progress", "sorbet-rails", "spring", "spring-commands-rspec", "spring-watcher-listen", "sprite-factory", "stackprof", "timecop", "capybara", "capybara-email", "database_cleaner", "factory_bot_rails", "faker", "json_expressions", "launchy", "minitest-rails", "poltergeist", "resque_spec", "rspec_junit_formatter", "rubocop-rspec", "selenium-webdriver", "simplecov", "simplecov-json", "stripe-ruby-mock", "test-prof", "webmock", "activemodel", "activesupport", "google-protobuf", "activerecord", "rollbar", "browser", "excon", "actionpack"]
Looking up gems ["faraday_middleware", "multi_json", "typhoeus", "commander", "rgeo-activerecord", "algorithms", "currencies", "jeweler", "rspec", "yard", "i18n_data", "money", "unicode_utils", "sixarm_ruby_unaccent", "aws-sdk-core", "aws-sdk-kms", "aws-sigv4", "railties", "warden", "bcrypt-ruby", "orm_adapter", "thread_safe", "bcrypt", "responders", "sass", "thor", "addressable", "rack", "multipart-post", "ruby2_keywords", "faraday-net_http", "faraday-excon", "faraday-net_http_persistent", "image_optimizer", "amq-protocol", "execjs", "htmlentities", "mimemagic", "marcel", "coffee-script", "appraisal", "sqlite3", "jsonapi", "case_transform", "jsonapi-renderer", "concurrent-ruby", "mime-types", "image_processing", "mini_mime", "ssrf_filter", "parslet", "celluloid", "hoe", "subexec", "oauth2", "hashie", "sprockets-es6", "faraday-stack", "oa-core", "oa-oauth", "oa-openid", "oa-basic", "oa-enterprise", "oa-more", "rack-protection", "ice_cube", "sass-rails", "phony", "weakling", "mini_portile", "mini_portile2", "pkg-config", "racc", "blankslate", "extlib", "httpadapter", "signet", "liquid", "sinatra", "autoparse", "uuidtools", "jwt", "retriable", "googleauth", "hurley", "memoist", "representable", "httpclient", "rexml", "google-apis-core", "google-apis-generator", "prawn-layout", "prawn-core", "prawn-format", "prawn-security", "pdf-reader", "ttfunk", "afm", "ruby-rc4", "pdf-core", "rake-compiler", "pry", "pry-doc", "rails-dom-testing", "arel", "httparty", "rufus-scheduler", "redis", "mono_logger", "rgeo", "nio4r", "hike", "tilt", "redis-namespace", "vegas", "json_pure", "sassc", "sprockets-rails", "actionmailer", "activeresource", "rake", "actionwebservice", "bundler", "actionview", "activejob", "actioncable", "activestorage", "actionmailbox", "actiontext", "test-spec", "git-version-bump", "rest-client", "net-http-persistent", "builder", "crack", "libxml-ruby", "therubyracer", "redis-actionpack", "redis-activesupport", "redis-store", "coderay", "erubis", "erubi", "rouge", "uniform_notifier", "treetop", "backports", "descendants_tracker", "axiom-types", "coercible", "equalizer", "byebug", "state_machines-activemodel", "term-ansicolor", "easy_translate", "terminal-table", "highline", "slop", "parser", "ast", "rainbow", "deepl-rb", "rails-i18n", "colorize", "ruby_parser", "webrat", "rspec-core", "rspec-expectations", "rspec-mocks", "rspec-support", "tapioca", "fog-core", "fog-json", "fog-xml", "ipaddress", "dotenv", "binding_of_caller", "debug_inspector", "bindex", "chunky_png", "rqrcode_core", "parlour", "sorbet-coerce", "method_source", "rubocop", "culerity", "rack-test", "celerity", "xpath", "regexp_parser", "sorbet-static", "guard", "guard-compat", "rubocop-ast", "database_cleaner-active_record", "mail", "parallel", "factory_bot", "listen", "simplecov-html", "docile", "lockfile", "simplecov_json_formatter", "pastel", "tty-pager", "tty-screen", "tty-tree", "em-websocket", "sfl", "faye-websocket", "http_parser.rb", "childprocess", "cliver", "websocket-driver", "hashdiff", "jimson-temp", "dante", "oj", "ffi", "libwebsocket", "websocket", "configuration", "spoon", "minitest", "minitest-test", "memcache-client", "zeitwerk", "activerecord-deprecated_finders", "rack-mount", "rack-cache", "journey", "rails-deprecated_sanitizer", "rails-html-sanitizer"]
HTTP GET https://index.rubygems.org/info/execjs
HTTP 206 Partial Content https://index.rubygems.org/info/execjs
HTTP GET https://index.rubygems.org/info/slop
HTTP 206 Partial Content https://index.rubygems.org/info/slop
Looking up gems ["ethon", "multi_xml", "jamespath", "jmespath", "aws-partitions", "aws-eventstream", "http-2", "sass-listen", "roauth", "atomic", "peterwald-git", "rubyforge", "schacon-git", "git", "gemcutter", "rdoc", "github_api", "semver", "psych", "semver2", "monetize", "public_suffix", "rack-ssl", "ruby-vips", "jsonapi-parser", "functional-ruby", "ref", "coffee-script-source", "aruba", "mime-types-data", "escape_utils", "6to5", "babel-transpiler", "babel-source", "restclient", "RubyInline", "timers", "facter", "celluloid-essentials", "celluloid-extras", "celluloid-fsm", "celluloid-pool", "celluloid-supervision", "nenv", "rspec-logsplit", "net-ldap", "rubyntlm", "pyu-ruby-sasl", "uuid", "XMLCanonicalizer", "english", "faraday-middleware", "httpauth", "oauth", "rack-openid", "ruby-openid-apps-discovery", "mongrel", "mustermann", "logging", "os", "hooks", "uber", "declarative", "declarative-option", "trailblazer-option", "win32console", "Ascii85", "hashery", "webrick", "spruz", "gems", "google-apis-discovery_v1", "jnunemaker-crack", "et-orbi", "fugit", "rails-observers", "activemodel-serializers-xml", "text-format", "netrc", "http-cookie", "http-accept", "flexmock", "mocha", "activemodel-globalid", "globalid", "em-hiredis", "abstract", "libv8", "adamantium", "redis-rack-cache", "redis-rack", "connection_pool", "safe_yaml", "formatador", "net-scp", "net-ssh", "xmlrpc", "tins", "thread", "ice_nine", "unicode-display_width", "sexp_processor", "facets", "polyglot", "state_machines", "diff-lcs", "ParseTree", "termios", "columnize", "debugger-linecache", "rb-readline", "dotenv-deployment", "hpricot", "strscan", "cucumber", "powerpack", "ruby-progressbar", "astrolabe", "jaro_winkler", "safe_type", "polyfill", "growl", "libnotify", "rb-inotify", "sys-uname", "open_gem", "lumberjack", "notiffany", "shellany", "tlsmail", "equatable", "tty-color", "database_cleaner-core", "tty-which", "verse", "strings", "rb-fchange", "rb-fsevent", "rb-kqueue", "celluloid-io", "ruby_dep", "bigdecimal", "eventmachine", "thin", "ZenTest", "multimap", "websocket-extensions", "loofah"]
HTTP GET https://index.rubygems.org/info/aws-partitions
HTTP 206 Partial Content https://index.rubygems.org/info/aws-partitions
Looking up gems ["jar-dependencies", "gobject-introspection", "rchardet", "background_process", "bcat", "rdiscount", "contracts", "event-bus", "hitimes", "celluloid-gems", "coveralls", "CFPropertyList", "sys-admin", "win32-api", "win32-dir", "windows-api", "windows-pr", "win32-security", "hocon", "macaddr", "log4r", "ruby-hmac", "cgi_multipart_eof_fix", "daemons", "fastthread", "gem_plugin", "ruby-openid", "rash", "tool", "little-plugger", "raabro", "text-hyphen", "metaclass", "domain_name", "memoizable", "hiredis", "needle", "jruby-pageant", "bcrypt_pbkdf", "rbnacl", "rbnacl-libsodium", "sync", "SexpProcessor", "gherkin", "multi_test", "cucumber-core", "gherkin3", "cucumber-wire", "cucumber-expressions", "cucumber-formatter-dots", "cucumber-gherkin", "cucumber-html-formatter", "cucumber-cucumber-expressions", "cucumber-messages", "cucumber-create-meta", "ruby_core_source", "debugger-ruby_core_source", "strings-ansi", "crass"]
Looking up gems ["glib2", "ruby-yadis", "ruby-maven", "test-unit", "ffi-win32-extensions", "mkrf", "unf", "systemu", "cucumber-tag_expressions", "cucumber-tag-expressions", "trollop", "c21e", "protobuf-cucumber", "archive-tar-minitar"]
Looking up gems ["maven-tools", "ruby-maven-libs", "power_assert", "cairo", "native-package-installer", "minitar", "minitar-cli", "unf_ext", "curses", "middleware"]
Looking up gems ["pattern-match", "red-colors", "powerbar"]
Looking up gems ["ansi"]
Resolving dependencies.............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
```

When I cancelled the job after a while, I received the following backtrace:

```
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/shared_helpers.rb:158:in `block in trap'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolution.rb:335:in `-'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolution.rb:335:in `block in build_details_for_unwind'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolution.rb:334:in `select'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolution.rb:334:in `build_details_for_unwind'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolution.rb:294:in `unwind_for_conflict'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolution.rb:700:in `attempt_to_filter_existing_spec'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolution.rb:672:in `attempt_to_activate'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolution.rb:254:in `process_topmost_state'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolution.rb:182:in `resolve'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/molinillo/lib/molinillo/resolver.rb:43:in `resolve'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/resolver.rb:59:in `start'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/resolver.rb:23:in `resolve'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/definition.rb:282:in `resolve'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/definition.rb:185:in `specs'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/definition.rb:173:in `resolve_remotely!'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/installer.rb:291:in `resolve_if_needed'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/installer.rb:83:in `block in run'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/process_lock.rb:12:in `block in lock'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/process_lock.rb:9:in `open'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/process_lock.rb:9:in `lock'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/installer.rb:72:in `run'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/installer.rb:24:in `install'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/cli/update.rb:69:in `run'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/cli.rb:307:in `block in update'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/settings.rb:114:in `temporary'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/cli.rb:306:in `update'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/thor/lib/thor/command.rb:27:in `run'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/thor/lib/thor/invocation.rb:127:in `invoke_command'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/thor/lib/thor.rb:392:in `dispatch'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/cli.rb:30:in `dispatch'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/vendor/thor/lib/thor/base.rb:485:in `start'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/cli.rb:24:in `start'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/exe/bundle:49:in `block in <top (required)>'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/lib/bundler/friendly_errors.rb:130:in `with_friendly_errors'
/Users/francois/.rvm/gems/ruby-2.7.3/gems/bundler-2.2.16/exe/bundle:37:in `<top (required)>'
/Users/francois/.rvm/gems/ruby-2.7.3/bin/bundle:23:in `load'
/Users/francois/.rvm/gems/ruby-2.7.3/bin/bundle:23:in `<main>'
/Users/francois/.rvm/gems/ruby-2.7.3/bin/ruby_executable_hooks:22:in `eval'
/Users/francois/.rvm/gems/ruby-2.7.3/bin/ruby_executable_hooks:22:in `<main>'
```

### Which command did you run?

```sh
bundle update activerecord-postgis-adapter
```

### What were you expecting to happen?

That Bundler would find a solution within a few minutes.

### What actually happened?

After 24 hours, no solution had been found. The repository references 330+ direct and transitive dependencies.

### If not included with the output of your command, run `bundle env` and paste the output below

## Environment

```
Bundler             2.2.16
  Platforms         ruby, x86_64-darwin-20
Ruby                2.7.3p183 (2021-04-05 revision 6847ee089d7655b2a0eea4fee3133aeacd4cc7cc) [x86_64-darwin20]
  Full Path         /Users/francois/.rvm/rubies/ruby-2.7.3/bin/ruby
  Config Dir        /Users/francois/.rvm/rubies/ruby-2.7.3/etc
RubyGems            3.1.6
  Gem Home          /Users/francois/.rvm/gems/ruby-2.7.3
  Gem Path          /Users/francois/.rvm/gems/ruby-2.7.3:/Users/francois/.rvm/rubies/ruby-2.7.3/lib/ruby/gems/2.7.0
  User Home         /Users/francois
  User Path         /Users/francois/.gem/ruby/2.7.0
  Bin Dir           /Users/francois/.rvm/gems/ruby-2.7.3/bin
Tools
  Git               2.31.1
  RVM               1.29.12-next (master)
  rbenv             not installed
  chruby            not installed
  rubygems-bundler  (1.4.5)
```

## Bundler Build Metadata

```
Built At          2021-04-09
Git SHA           3d7bfaff25
Released Version  true
```

## Gemfile

### Gemfile

```ruby
# frozen_string_literal: true
source "https://rubygems.org"
git_source(:bus_git) { |repo_name| "https://{redacted}:{redacted}@github.com/Bus-com/#{repo_name}.git" }

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
gem "deep_cloneable" # Deep cloning, dup with association
gem "devise"
gem "error_handler", path: "error_handler", require: "error_handler"
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
gem "metrics",       path: "metrics",       require: "metrics"
gem "mini_magick"
gem "money",         path: "money",         require: "money"
gem "netsuite-adapter",  path: "netsuite-adapter",  require: "netsuite/adapter"
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
gem "protos",        path: "protos",        require: "protos"
gem "pry-rails"
gem "puma"
gem "pundit"
gem "rack-contrib", require: "rack/contrib"
gem "rack-cors", require: "rack/cors"
gem "rack-host-redirect"
gem "rails", "~> 6.0.3"
gem "redis-rails"
gem "relay",         path: "relay",         require: "relay"
gem "request_store"
gem "resque", "= 1.27.4"
gem "resque-heroku-signals", "1.27.4.3"
gem "resque-loner" # ActionListeners don't want duplicate jobs
gem "resque-retry"
gem "resque-scheduler"
gem "revisable",     path: "revisable",     require: "revisable"
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
gem "value_object",  path: "value_object",  require: "value_object"
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
```

### Gemfile.lock

```
GIT
  remote: https://github.com/Bus-com/has_multilingual_attributes.git
  revision: 5cf32178530c229f29bfcb659192fab9679b31b1
  specs:
    has_multilingual_attributes (1.1.0)
      i18n (~> 1.6.0)

GIT
  remote: https://github.com/Bus-com/mandrill-api-ruby
  revision: cd51fbd58a108069c5f4b5391a6ecd34802c6f6e
  branch: master
  specs:
    mandrill-api (1.0.53)
      excon
      json (>= 2.3.0)

GIT
  remote: https://github.com/rails/actionpack-action_caching.git
  revision: 7bdfa663274a2620dde8daad7dcb995c1cfef840
  specs:
    actionpack-action_caching (1.2.1)
      actionpack (>= 4.0.0)

GIT
  remote: https://github.com/rails/rails-perftest
  revision: 47ad3f202cfe41f78c7c30733c8eb8df9b33d8e9
  branch: master
  specs:
    rails-perftest (0.0.7)

PATH
  remote: ./error_handler
  specs:
    error_handler (1.1.0)
      activemodel (>= 5.2.2, < 7)
      browser
      newrelic_rpm (~> 6.2)
      rollbar (~> 3.1)

PATH
  remote: ./metrics
  specs:
    metrics (1.0.0)
      request_store (>= 1.4.1, < 1.6.0)

PATH
  remote: ./money
  specs:
    money (1.0.0)
      activemodel
      activesupport

PATH
  remote: ./netsuite-adapter
  specs:
    netsuite-adapter (0.2.0)
      activerecord (~> 6.0)

PATH
  remote: ./protos
  specs:
    protos (1.0.0)
      activemodel (>= 5.2.2)
      google-protobuf (~> 3.15.8)

PATH
  remote: ./relay
  specs:
    relay (1.0.0)
      activemodel (>= 5.2.2.1)
      activesupport (>= 5.2.2.1)
      bunny (>= 2.14.3)
      metrics (>= 1.0.0)
      protos (>= 1.0.0)

PATH
  remote: ./revisable
  specs:
    revisable (0.2.5)
      request_store

PATH
  remote: ./value_object
  specs:
    value_object (1.0.0)

GEM
  remote: https://rubygems.org/
  specs:
    actioncable (6.0.3.5)
      actionpack (= 6.0.3.5)
      nio4r (~> 2.0)
      websocket-driver (>= 0.6.1)
    actionmailbox (6.0.3.5)
      actionpack (= 6.0.3.5)
      activejob (= 6.0.3.5)
      activerecord (= 6.0.3.5)
      activestorage (= 6.0.3.5)
      activesupport (= 6.0.3.5)
      mail (>= 2.7.1)
    actionmailer (6.0.3.5)
      actionpack (= 6.0.3.5)
      actionview (= 6.0.3.5)
      activejob (= 6.0.3.5)
      mail (~> 2.5, >= 2.5.4)
      rails-dom-testing (~> 2.0)
    actionpack (6.0.3.5)
      actionview (= 6.0.3.5)
      activesupport (= 6.0.3.5)
      rack (~> 2.0, >= 2.0.8)
      rack-test (>= 0.6.3)
      rails-dom-testing (~> 2.0)
      rails-html-sanitizer (~> 1.0, >= 1.2.0)
    actiontext (6.0.3.5)
      actionpack (= 6.0.3.5)
      activerecord (= 6.0.3.5)
      activestorage (= 6.0.3.5)
      activesupport (= 6.0.3.5)
      nokogiri (>= 1.8.5)
    actionview (6.0.3.5)
      activesupport (= 6.0.3.5)
      builder (~> 3.1)
      erubi (~> 1.4)
      rails-dom-testing (~> 2.0)
      rails-html-sanitizer (~> 1.1, >= 1.2.0)
    active_model_serializers (0.10.12)
      actionpack (>= 4.1, < 6.2)
      activemodel (>= 4.1, < 6.2)
      case_transform (>= 0.2)
      jsonapi-renderer (>= 0.1.1.beta1, < 0.3)
    activejob (6.0.3.5)
      activesupport (= 6.0.3.5)
      globalid (>= 0.3.6)
    activemodel (6.0.3.5)
      activesupport (= 6.0.3.5)
    activerecord (6.0.3.5)
      activemodel (= 6.0.3.5)
      activesupport (= 6.0.3.5)
    activerecord-import (1.0.8)
      activerecord (>= 3.2)
    activerecord-postgis-adapter (6.0.1)
      activerecord (~> 6.0)
      rgeo-activerecord (~> 6.0)
    activestorage (6.0.3.5)
      actionpack (= 6.0.3.5)
      activejob (= 6.0.3.5)
      activerecord (= 6.0.3.5)
      marcel (~> 0.3.1)
    activesupport (6.0.3.5)
      concurrent-ruby (~> 1.0, >= 1.0.2)
      i18n (>= 0.7, < 2)
      minitest (~> 5.1)
      tzinfo (~> 1.1)
      zeitwerk (~> 2.2, >= 2.2.2)
    addressable (2.7.0)
      public_suffix (>= 2.0.2, < 5.0)
    amq-protocol (2.3.2)
    analytics-ruby (2.2.8)
    angular_rails_csrf (4.5.0)
      railties (>= 3, < 7)
    angularjs-rails-resource (2.3.1)
    annotate (3.1.1)
      activerecord (>= 3.2, < 7.0)
      rake (>= 10.4, < 14.0)
    ast (2.4.2)
    auto_strip_attributes (2.6.0)
      activerecord (>= 4.0)
    autoprefixer-rails (10.2.4.0)
      execjs
    awesome_print (1.9.2)
    aws-eventstream (1.1.0)
    aws-partitions (1.429.0)
    aws-sdk-core (3.112.0)
      aws-eventstream (~> 1, >= 1.0.2)
      aws-partitions (~> 1, >= 1.239.0)
      aws-sigv4 (~> 1.1)
      jmespath (~> 1.0)
    aws-sdk-kms (1.42.0)
      aws-sdk-core (~> 3, >= 3.112.0)
      aws-sigv4 (~> 1.1)
    aws-sdk-s3 (1.89.0)
      aws-sdk-core (~> 3, >= 3.112.0)
      aws-sdk-kms (~> 1)
      aws-sigv4 (~> 1.1)
    aws-sigv4 (1.2.2)
      aws-eventstream (~> 1, >= 1.0.2)
    axiom-types (0.1.1)
      descendants_tracker (~> 0.0.4)
      ice_nine (~> 0.11.0)
      thread_safe (~> 0.3, >= 0.3.1)
    bcrypt (3.1.16)
    better_errors (2.9.1)
      coderay (>= 1.0.0)
      erubi (>= 1.0.0)
      rack (>= 0.9.0)
    bindex (0.8.1)
    bourbon (7.0.0)
      thor (~> 1.0)
    bower-rails (0.12.0)
    browser (5.3.1)
    builder (3.2.4)
    bullet (6.1.4)
      activesupport (>= 3.0.0)
      uniform_notifier (~> 1.11)
    bunny (2.17.0)
      amq-protocol (~> 2.3, >= 2.3.1)
    byebug (11.1.1)
    capybara (3.35.3)
      addressable
      mini_mime (>= 0.1.3)
      nokogiri (~> 1.8)
      rack (>= 1.6.0)
      rack-test (>= 0.6.3)
      regexp_parser (>= 1.5, < 3.0)
      xpath (~> 3.2)
    capybara-email (3.0.2)
      capybara (>= 2.4, < 4.0)
      mail
    carmen (1.1.3)
      activesupport (>= 3.0.0)
    carrierwave (2.1.1)
      activemodel (>= 5.0.0)
      activesupport (>= 5.0.0)
      addressable (~> 2.6)
      image_processing (~> 1.1)
      mimemagic (>= 0.3.0)
      mini_mime (>= 0.1.3)
      ssrf_filter (~> 1.0)
    carrierwave-imageoptimizer (1.5.0)
      carrierwave (>= 0.8, < 2.2)
      image_optimizer (~> 1.6)
    case_transform (0.2)
      activesupport
    caxlsx (3.0.4)
      htmlentities (~> 4.3, >= 4.3.4)
      mimemagic (~> 0.3)
      nokogiri (~> 1.10, >= 1.10.4)
      rubyzip (>= 1.3.0, < 3)
    caxlsx_rails (0.6.2)
      actionpack (>= 3.1)
      caxlsx (>= 3.0)
    childprocess (3.0.0)
    chunky_png (1.4.0)
    cliver (0.3.2)
    coderay (1.1.3)
    coercible (1.0.0)
      descendants_tracker (~> 0.0.1)
    coffee-rails (5.0.0)
      coffee-script (>= 2.2.0)
      railties (>= 5.2.0)
    coffee-script (2.4.1)
      coffee-script-source
      execjs
    coffee-script-source (1.12.2)
    colorize (0.8.1)
    commander (4.5.2)
      highline (~> 2.0.0)
    concurrent-ruby (1.1.8)
    countries (3.0.1)
      i18n_data (~> 0.10.0)
      sixarm_ruby_unaccent (~> 1.1)
      unicode_utils (~> 1.4)
    crack (0.4.5)
      rexml
    crass (1.0.6)
    d3-rails (5.9.2)
      railties (>= 3.1)
    dante (0.2.0)
    data_migrate (6.7.0)
      rails (>= 5.0)
    database_cleaner (2.0.1)
      database_cleaner-active_record (~> 2.0.0)
    database_cleaner-active_record (2.0.0)
      activerecord (>= 5.a)
      database_cleaner-core (~> 2.0.0)
    database_cleaner-core (2.0.1)
    declarative (0.0.20)
    declarative-option (0.1.0)
    deep_cloneable (3.1.0)
      activerecord (>= 3.1.0, < 7)
    descendants_tracker (0.0.4)
      thread_safe (~> 0.3, >= 0.3.1)
    devise (4.7.3)
      bcrypt (~> 3.0)
      orm_adapter (~> 0.1)
      railties (>= 4.1.0)
      responders
      warden (~> 1.2.3)
    diff-lcs (1.4.4)
    docile (1.3.4)
    dotenv (2.7.6)
    dotenv-rails (2.7.6)
      dotenv (= 2.7.6)
      railties (>= 3.2)
    equalizer (0.0.11)
    erubi (1.10.0)
    et-orbi (1.2.4)
      tzinfo
    excon (0.79.0)
    execjs (2.7.0)
    factory_bot (6.1.0)
      activesupport (>= 5.0.0)
    factory_bot_rails (6.1.0)
      factory_bot (~> 6.1.0)
      railties (>= 5.0.0)
    faker (2.17.0)
      i18n (>= 1.6, < 2)
    faraday (1.3.0)
      faraday-net_http (~> 1.0)
      multipart-post (>= 1.2, < 3)
      ruby2_keywords
    faraday-net_http (1.0.1)
    fasterer (0.9.0)
      colorize (~> 0.7)
      ruby_parser (>= 3.14.1)
    ffi (1.14.2)
    flag_shih_tzu (0.3.23)
    fog-aws (3.9.0)
      fog-core (~> 2.1)
      fog-json (~> 1.1)
      fog-xml (~> 0.1)
      ipaddress (~> 0.8)
    fog-core (2.2.3)
      builder
      excon (~> 0.71)
      formatador (~> 0.2)
      mime-types
    fog-json (1.2.0)
      fog-core
      multi_json (~> 1.10)
    fog-xml (0.1.3)
      fog-core
      nokogiri (>= 1.5.11, < 2.0.0)
    font-awesome-rails (4.7.0.7)
      railties (>= 3.2, < 7)
    formatador (0.2.5)
    foundation-icons-sass-rails (3.0.0)
      railties (>= 3.1.1)
      sass-rails (>= 3.1.1)
    foundation-rails (5.5.1.2)
      railties (>= 3.1.0)
      sass (>= 3.3.0, < 3.5)
    fugit (1.3.9)
      et-orbi (~> 1.1, >= 1.1.8)
      raabro (~> 1.3)
    gems (1.2.0)
    geocoder (1.6.6)
    globalid (0.4.2)
      activesupport (>= 4.2.0)
    google-api-client (0.53.0)
      google-apis-core (~> 0.1)
      google-apis-generator (~> 0.1)
    google-apis-core (0.2.0)
      addressable (~> 2.5, >= 2.5.1)
      googleauth (~> 0.14)
      httpclient (>= 2.8.1, < 3.0)
      mini_mime (~> 1.0)
      representable (~> 3.0)
      retriable (>= 2.0, < 4.0)
      rexml
      signet (~> 0.14)
    google-apis-discovery_v1 (0.1.0)
      google-apis-core (~> 0.1)
    google-apis-generator (0.1.2)
      activesupport (>= 5.0)
      gems (~> 1.2)
      google-apis-core (~> 0.1)
      google-apis-discovery_v1 (~> 0.0)
      thor (>= 0.20, < 2.a)
    google-protobuf (3.15.8)
    google-protobuf (3.15.8-universal-darwin)
    google-protobuf (3.15.8-x86_64-linux)
    googleauth (0.14.0)
      faraday (>= 0.17.3, < 2.0)
      jwt (>= 1.4, < 3.0)
      memoist (~> 0.16)
      multi_json (~> 1.11)
      os (>= 0.9, < 2.0)
      signet (~> 0.14)
    googlecharts (1.6.12)
    graphiql-rails (1.7.0)
      railties
      sprockets-rails
    graphql (1.12.6)
    guard (2.16.2)
      formatador (>= 0.2.4)
      listen (>= 2.7, < 4.0)
      lumberjack (>= 1.0.12, < 2.0)
      nenv (~> 0.1)
      notiffany (~> 0.0)
      pry (>= 0.9.12)
      shellany (~> 0.0)
      thor (>= 0.18.1)
    guard-compat (1.2.1)
    guard-rspec (4.7.3)
      guard (~> 2.1)
      guard-compat (~> 1.1)
      rspec (>= 2.99.0, < 4.0)
    hashdiff (1.0.1)
    hashie (4.1.0)
    highline (2.0.3)
    htmlentities (4.3.4)
    http_accept_language (2.1.1)
    httparty (0.16.2)
      multi_xml (>= 0.5.2)
    httpclient (2.8.3)
    i18n (1.6.0)
      concurrent-ruby (~> 1.0)
    i18n-js (3.8.1)
      i18n (>= 0.6.6)
    i18n-tasks (0.9.34)
      activesupport (>= 4.0.2)
      ast (>= 2.1.0)
      erubi
      highline (>= 2.0.0)
      i18n
      parser (>= 2.2.3.0)
      rails-i18n
      rainbow (>= 2.2.2, < 4.0)
      terminal-table (>= 1.5.1)
    i18n_data (0.10.0)
    icalendar (2.7.0)
      ice_cube (~> 0.16)
    ice_cube (0.16.3)
    ice_nine (0.11.2)
    image_optimizer (1.8.0)
    image_processing (1.12.1)
      mini_magick (>= 4.9.5, < 5)
      ruby-vips (>= 2.0.17, < 3)
    ipaddress (0.8.3)
    jbuilder (2.11.2)
      activesupport (>= 5.0.0)
    jmespath (1.4.0)
    jquery-easing-rails (0.0.2)
      railties (>= 3.1.0)
    jquery-rails (4.4.0)
      rails-dom-testing (>= 1, < 3)
      railties (>= 4.2.0)
      thor (>= 0.14, < 2.0)
    json (2.5.1)
    json_expressions (0.9.0)
    jsonapi-renderer (0.2.2)
    jwt (2.2.2)
    koala (3.0.0)
      addressable
      faraday
      json (>= 1.8)
    launchy (2.5.0)
      addressable (~> 2.7)
    listen (3.2.1)
      rb-fsevent (~> 0.10, >= 0.10.3)
      rb-inotify (~> 0.9, >= 0.9.10)
    loofah (2.9.0)
      crass (~> 1.0.2)
      nokogiri (>= 1.5.9)
    lumberjack (1.2.4)
    mail (2.7.1)
      mini_mime (>= 0.1.1)
    marcel (0.3.3)
      mimemagic (~> 0.3.2)
    memoist (0.16.2)
    method_source (1.0.0)
    mime-types (1.25.1)
    mimemagic (0.3.10)
      nokogiri (~> 1)
      rake
    mini_magick (4.11.0)
    mini_mime (1.0.2)
    mini_portile2 (2.5.0)
    minitest (5.14.4)
    minitest-rails (6.0.1)
      minitest (~> 5.10)
      railties (~> 6.0.0)
    mono_logger (1.1.0)
    multi_json (1.15.0)
    multi_xml (0.6.0)
    multipart-post (2.1.1)
    mustermann (1.1.1)
      ruby2_keywords (~> 0.0.1)
    nenv (0.3.0)
    newrelic_rpm (6.15.0)
    nio4r (2.5.7)
    nokogiri (1.11.2)
      mini_portile2 (~> 2.5.0)
      racc (~> 1.4)
    nokogiri (1.11.2-x86_64-darwin)
      racc (~> 1.4)
    nokogiri (1.11.2-x86_64-linux)
      racc (~> 1.4)
    notiffany (0.1.3)
      nenv (~> 0.1)
      shellany (~> 0.0)
    oauth2 (1.4.4)
      faraday (>= 0.8, < 2.0)
      jwt (>= 1.0, < 3.0)
      multi_json (~> 1.3)
      multi_xml (~> 0.5)
      rack (>= 1.2, < 3)
    omniauth (2.0.3)
      hashie (>= 3.4.6)
      rack (>= 1.6.2, < 3)
      rack-protection
    omniauth-oauth2 (1.7.1)
      oauth2 (~> 1.4)
      omniauth (>= 1.9, < 3)
    omniauth-rails_csrf_protection (1.0.0)
      actionpack (>= 4.2)
      omniauth (~> 2.0)
    orm_adapter (0.5.0)
    os (1.1.1)
    parallel (1.20.1)
    parallel_tests (3.5.0)
      parallel
    paranoia (2.4.3)
      activerecord (>= 4.0, < 6.2)
    parlour (5.0.0)
      commander (~> 4.5)
      parser
      rainbow (~> 3.0)
      sorbet-runtime (>= 0.5)
    parser (3.0.0.0)
      ast (~> 2.4.1)
    pdf-core (0.9.0)
    pg (1.2.3)
    pg_search (2.3.5)
      activerecord (>= 5.2)
      activesupport (>= 5.2)
    phony (2.18.8)
    phony_rails (0.14.13)
      activesupport (>= 3.0)
      phony (> 2.15)
    poltergeist (1.18.1)
      capybara (>= 2.1, < 4)
      cliver (~> 0.3.1)
      websocket-driver (>= 0.2.0)
    polyfill (1.9.0)
    polylines (0.4.0)
    prawn (2.4.0)
      pdf-core (~> 0.9.0)
      ttfunk (~> 1.7)
    prawn-table (0.2.2)
      prawn (>= 1.3.0, < 3.0.0)
    promoter (0.9.5)
      httparty
      json
    pry (0.13.0)
      coderay (~> 1.1)
      method_source (~> 1.0)
    pry-byebug (3.9.0)
      byebug (~> 11.0)
      pry (~> 0.13.0)
    pry-rails (0.3.9)
      pry (>= 0.10.4)
    public_suffix (4.0.6)
    puma (5.2.2)
      nio4r (~> 2.0)
    pundit (2.1.0)
      activesupport (>= 3.0.0)
    raabro (1.4.0)
    racc (1.5.2)
    rack (2.2.3)
    rack-contrib (2.3.0)
      rack (~> 2.0)
    rack-cors (1.1.1)
      rack (>= 2.0.0)
    rack-host-redirect (1.3.0)
      rack
    rack-mini-profiler (2.3.1)
      rack (>= 1.2.0)
    rack-protection (2.1.0)
      rack
    rack-test (1.1.0)
      rack (>= 1.0, < 3)
    rails (6.0.3.5)
      actioncable (= 6.0.3.5)
      actionmailbox (= 6.0.3.5)
      actionmailer (= 6.0.3.5)
      actionpack (= 6.0.3.5)
      actiontext (= 6.0.3.5)
      actionview (= 6.0.3.5)
      activejob (= 6.0.3.5)
      activemodel (= 6.0.3.5)
      activerecord (= 6.0.3.5)
      activestorage (= 6.0.3.5)
      activesupport (= 6.0.3.5)
      bundler (>= 1.3.0)
      railties (= 6.0.3.5)
      sprockets-rails (>= 2.0.0)
    rails-controller-testing (1.0.5)
      actionpack (>= 5.0.1.rc1)
      actionview (>= 5.0.1.rc1)
      activesupport (>= 5.0.1.rc1)
    rails-dom-testing (2.0.3)
      activesupport (>= 4.2.0)
      nokogiri (>= 1.6)
    rails-html-sanitizer (1.3.0)
      loofah (~> 2.3)
    rails-i18n (6.0.0)
      i18n (>= 0.7, < 2)
      railties (>= 6.0.0, < 7)
    railties (6.0.3.5)
      actionpack (= 6.0.3.5)
      activesupport (= 6.0.3.5)
      method_source
      rake (>= 0.8.7)
      thor (>= 0.20.3, < 2.0)
    rainbow (3.0.0)
    rake (13.0.3)
    rb-fsevent (0.10.3)
    rb-inotify (0.10.1)
      ffi (~> 1.0)
    redis (4.2.5)
    redis-actionpack (5.2.0)
      actionpack (>= 5, < 7)
      redis-rack (>= 2.1.0, < 3)
      redis-store (>= 1.1.0, < 2)
    redis-activesupport (5.2.0)
      activesupport (>= 3, < 7)
      redis-store (>= 1.3, < 2)
    redis-namespace (1.8.0)
      redis (>= 3.0.4)
    redis-rack (2.1.3)
      rack (>= 2.0.8, < 3)
      redis-store (>= 1.2, < 2)
    redis-rails (5.0.2)
      redis-actionpack (>= 5.0, < 6)
      redis-activesupport (>= 5.0, < 6)
      redis-store (>= 1.2, < 2)
    redis-store (1.9.0)
      redis (>= 4, < 5)
    regexp_parser (2.1.1)
    representable (3.0.4)
      declarative (< 0.1.0)
      declarative-option (< 0.2.0)
      uber (< 0.2.0)
    request_store (1.5.0)
      rack (>= 1.4)
    responders (3.0.1)
      actionpack (>= 5.0)
      railties (>= 5.0)
    resque (1.27.4)
      mono_logger (~> 1.0)
      multi_json (~> 1.0)
      redis-namespace (~> 1.3)
      sinatra (>= 0.9.2)
      vegas (~> 0.1.2)
    resque-heroku-signals (1.27.4.3)
      resque (= 1.27.4)
    resque-loner (1.3.0)
      resque (~> 1.0)
    resque-retry (1.7.4)
      resque (>= 1.25, < 3.0)
      resque-scheduler (~> 4.0)
    resque-scheduler (4.4.0)
      mono_logger (~> 1.0)
      redis (>= 3.3)
      resque (>= 1.26)
      rufus-scheduler (~> 3.2)
    resque_spec (0.18.1)
      resque (>= 1.26.0)
      rspec-core (>= 3.0.0)
      rspec-expectations (>= 3.0.0)
      rspec-mocks (>= 3.0.0)
    retriable (3.1.2)
    rexml (3.2.5)
    rgeo (2.1.1)
    rgeo-activerecord (6.2.1)
      activerecord (>= 5.0)
      rgeo (>= 1.0.0)
    rgeo-geojson (2.1.1)
      rgeo (>= 1.0.0)
    rkelly-remix (0.0.7)
    rmagick (4.2.2)
    rollbar (3.1.2)
    rqrcode (1.2.0)
      chunky_png (~> 1.0)
      rqrcode_core (~> 0.2)
    rqrcode_core (0.2.0)
    rspec (3.10.0)
      rspec-core (~> 3.10.0)
      rspec-expectations (~> 3.10.0)
      rspec-mocks (~> 3.10.0)
    rspec-collection_matchers (1.2.0)
      rspec-expectations (>= 2.99.0.beta1)
    rspec-core (3.10.1)
      rspec-support (~> 3.10.0)
    rspec-expectations (3.10.1)
      diff-lcs (>= 1.2.0, < 2.0)
      rspec-support (~> 3.10.0)
    rspec-instafail (1.0.0)
      rspec
    rspec-mocks (3.10.2)
      diff-lcs (>= 1.2.0, < 2.0)
      rspec-support (~> 3.10.0)
    rspec-rails (5.0.1)
      actionpack (>= 5.2)
      activesupport (>= 5.2)
      railties (>= 5.2)
      rspec-core (~> 3.10)
      rspec-expectations (~> 3.10)
      rspec-mocks (~> 3.10)
      rspec-support (~> 3.10)
    rspec-support (3.10.2)
    rspec_junit_formatter (0.4.1)
      rspec-core (>= 2, < 4, != 2.12.0)
    rubocop (1.11.0)
      parallel (~> 1.10)
      parser (>= 3.0.0.0)
      rainbow (>= 2.2.2, < 4.0)
      regexp_parser (>= 1.8, < 3.0)
      rexml
      rubocop-ast (>= 1.2.0, < 2.0)
      ruby-progressbar (~> 1.7)
      unicode-display_width (>= 1.4.0, < 3.0)
    rubocop-ast (1.4.1)
      parser (>= 2.7.1.5)
    rubocop-performance (1.10.1)
      rubocop (>= 0.90.0, < 2.0)
      rubocop-ast (>= 0.4.0)
    rubocop-rails (2.9.1)
      activesupport (>= 4.2.0)
      rack (>= 1.1)
      rubocop (>= 0.90.0, < 2.0)
    rubocop-rspec (2.2.0)
      rubocop (~> 1.0)
      rubocop-ast (>= 1.1.0)
    ruby-graphviz (1.2.5)
      rexml
    ruby-prof (1.4.3)
    ruby-progressbar (1.11.0)
    ruby-vips (2.0.17)
      ffi (~> 1.9)
    ruby2_keywords (0.0.4)
    ruby_parser (3.15.1)
      sexp_processor (~> 4.9)
    rubyzip (2.3.0)
    rufus-scheduler (3.6.0)
      fugit (~> 1.1, >= 1.1.6)
    safe_type (1.1.1)
    sass (3.4.25)
    sass-rails (6.0.0)
      sassc-rails (~> 2.1, >= 2.1.1)
    sassc (2.0.1)
      ffi (~> 1.9)
      rake
    sassc-rails (2.1.2)
      railties (>= 4.0.0)
      sassc (>= 2.0)
      sprockets (> 3.0)
      sprockets-rails
      tilt
    select2-rails (4.0.13)
    selenium-webdriver (3.142.7)
      childprocess (>= 0.5, < 4.0)
      rubyzip (>= 1.2.2)
    serviceworker-rails (0.6.0)
      railties (>= 3.1)
    sexp_processor (4.15.2)
    shellany (0.0.1)
    signet (0.14.0)
      addressable (~> 2.3)
      faraday (>= 0.17.3, < 2.0)
      jwt (>= 1.5, < 3.0)
      multi_json (~> 1.10)
    simplecov (0.21.2)
      docile (~> 1.1)
      simplecov-html (~> 0.11)
      simplecov_json_formatter (~> 0.1)
    simplecov-html (0.12.3)
    simplecov-json (0.2.3)
      json
      simplecov
    simplecov_json_formatter (0.1.2)
    sinatra (2.1.0)
      mustermann (~> 1.0)
      rack (~> 2.2)
      rack-protection (= 2.1.0)
      tilt (~> 2.0)
    sixarm_ruby_unaccent (1.2.0)
    sorbet (0.5.6346)
      sorbet-static (= 0.5.6346)
    sorbet-coerce (0.2.7)
      polyfill (~> 1.8)
      safe_type (~> 1.1, >= 1.1.1)
      sorbet (>= 0.4.4704)
      sorbet-runtime (>= 0.4.4704)
    sorbet-progress (0.3.0)
      rainbow (= 3.0)
      sorbet (>= 0.4.4314)
      sorbet-runtime (>= 0.4.4314)
    sorbet-rails (0.7.2)
      method_source (>= 0.9.2)
      parlour (>= 4.0.1)
      parser (>= 2.7)
      sorbet-coerce (>= 0.2.6)
      sorbet-runtime (>= 0.5)
    sorbet-runtime (0.5.6346)
    sorbet-static (0.5.6346-universal-darwin-14)
    sorbet-static (0.5.6346-universal-darwin-15)
    sorbet-static (0.5.6346-universal-darwin-16)
    sorbet-static (0.5.6346-universal-darwin-17)
    sorbet-static (0.5.6346-universal-darwin-18)
    sorbet-static (0.5.6346-universal-darwin-19)
    sorbet-static (0.5.6346-universal-darwin-20)
    sorbet-static (0.5.6346-x86_64-linux)
    spoom (1.0.9)
      colorize
      sorbet (~> 0.5.5)
      sorbet-runtime
      thor (>= 0.19.2)
    spreadsheet-excel (0.3.5.1)
    spring (2.1.1)
    spring-commands-rspec (1.0.4)
      spring (>= 0.9.1)
    spring-watcher-listen (2.0.1)
      listen (>= 2.7, < 4.0)
      spring (>= 1.2, < 3.0)
    sprite-factory (1.7.1)
    sprockets (3.7.2)
      concurrent-ruby (~> 1.0)
      rack (> 1, < 3)
    sprockets-rails (3.2.2)
      actionpack (>= 4.0)
      activesupport (>= 4.0)
      sprockets (>= 3.0.0)
    ssrf_filter (1.0.7)
    stackprof (0.2.16)
    state_machines (0.5.0)
    state_machines-activemodel (0.8.0)
      activemodel (>= 5.1)
      state_machines (>= 0.5.0)
    state_machines-activerecord (0.8.0)
      activerecord (>= 5.1)
      state_machines-activemodel (>= 0.8.0)
    stripe (5.30.0)
    stripe-ruby-mock (3.0.1)
      dante (>= 0.2.0)
      multi_json (~> 1.0)
      stripe (> 5, < 6)
    terminal-table (3.0.0)
      unicode-display_width (~> 1.1, >= 1.1.1)
    test-prof (1.0.2)
    thor (1.1.0)
    thread_safe (0.3.6)
    tilt (2.0.10)
    timecop (0.9.4)
    ttfunk (1.7.0)
    twilio-ruby (5.49.0)
      faraday (>= 0.9, < 2.0)
      jwt (>= 1.5, <= 2.5)
      nokogiri (>= 1.6, < 2.0)
    tzinfo (1.2.9)
      thread_safe (~> 0.1)
    uber (0.1.0)
    uglifier (4.2.0)
      execjs (>= 0.3.0, < 3)
    unicode-display_width (1.7.0)
    unicode_utils (1.4.0)
    uniform_notifier (1.14.1)
    vegas (0.1.11)
      rack (>= 1.0.0)
    virtus (1.0.5)
      axiom-types (~> 0.1)
      coercible (~> 1.0)
      descendants_tracker (~> 0.0, >= 0.0.3)
      equalizer (~> 0.0, >= 0.0.9)
    virtus-group (0.3.0)
      virtus (>= 1.0.0)
    warden (1.2.9)
      rack (>= 2.0.9)
    web-console (4.1.0)
      actionview (>= 6.0.0)
      activemodel (>= 6.0.0)
      bindex (>= 0.4.0)
      railties (>= 6.0.0)
    webmock (3.12.1)
      addressable (>= 2.3.6)
      crack (>= 0.3.2)
      hashdiff (>= 0.4.0, < 2.0.0)
    websocket-driver (0.7.3)
      websocket-extensions (>= 0.1.0)
    websocket-extensions (0.1.5)
    will_paginate (3.3.0)
    xpath (3.2.0)
      nokogiri (~> 1.8)
    yomu (0.1.10)
      mime-types (~> 1.23)
    zeitwerk (2.4.2)

PLATFORMS
  ruby
  x86_64-darwin-18
  x86_64-linux

DEPENDENCIES
  actionpack-action_caching!
  active_model_serializers
  activerecord-import (> 0.4.0)
  activerecord-postgis-adapter
  analytics-ruby (~> 2.2.8)
  angular_rails_csrf
  angularjs-rails-resource
  annotate (~> 3.1.1)
  auto_strip_attributes
  autoprefixer-rails
  awesome_print
  aws-sdk-s3
  better_errors
  bourbon
  bower-rails
  bullet
  bunny
  capybara
  capybara-email
  carmen
  carrierwave
  carrierwave-imageoptimizer
  caxlsx
  caxlsx_rails
  coffee-rails (~> 5.0.0)
  countries
  d3-rails
  data_migrate
  database_cleaner
  deep_cloneable
  devise
  dotenv-rails
  error_handler!
  factory_bot_rails
  faker
  faraday (~> 1.3.0)
  fasterer
  flag_shih_tzu
  fog-aws
  font-awesome-rails
  foundation-icons-sass-rails
  foundation-rails (~> 5.5.1.0)
  geocoder
  google-api-client (~> 0.53.0)
  googlecharts
  graphiql-rails
  graphql (>= 1.9.11)
  guard-rspec (~> 4.7)
  has_multilingual_attributes (>= 1.0)!
  http_accept_language (~> 2.1)
  i18n (~> 1.6.0)
  i18n-js
  i18n-tasks
  icalendar
  jbuilder (~> 2.11)
  jquery-easing-rails
  jquery-rails
  json (>= 2.3.0)
  json_expressions
  koala
  launchy
  mandrill-api!
  metrics!
  mini_magick
  minitest-rails
  money!
  netsuite-adapter!
  newrelic_rpm
  nokogiri (~> 1.11.2)
  omniauth
  omniauth-oauth2 (>= 1.1.1)
  omniauth-rails_csrf_protection (~> 1.0)
  parallel_tests
  paranoia
  pg (~> 1.2.3)
  pg_search
  phony_rails
  poltergeist
  polylines
  prawn
  prawn-table
  promoter
  protos!
  pry-byebug
  pry-rails
  puma
  pundit
  rack-contrib
  rack-cors
  rack-host-redirect
  rack-mini-profiler (~> 2.3.1)
  rails (~> 6.0.3)
  rails-controller-testing
  rails-perftest!
  redis-rails
  relay!
  request_store
  resque (= 1.27.4)
  resque-heroku-signals (= 1.27.4.3)
  resque-loner
  resque-retry
  resque-scheduler
  resque_spec
  revisable!
  rgeo-geojson
  rkelly-remix
  rmagick
  rqrcode
  rspec-collection_matchers
  rspec-instafail
  rspec-rails (~> 5.0.1)
  rspec_junit_formatter
  rubocop-performance
  rubocop-rails
  rubocop-rspec
  ruby-graphviz
  ruby-prof (>= 0.17.0)
  rubyzip (< 2.3.1)
  sassc-rails (~> 2.1.2)
  select2-rails
  selenium-webdriver
  serviceworker-rails
  simplecov
  simplecov-json
  sorbet
  sorbet-progress
  sorbet-rails
  sorbet-runtime
  spoom
  spreadsheet-excel
  spring
  spring-commands-rspec
  spring-watcher-listen (~> 2.0.0)
  sprite-factory
  sprockets (< 4)
  stackprof (>= 0.2.9)
  state_machines-activerecord
  stripe (= 5.30.0)
  stripe-ruby-mock
  test-prof (~> 1.0)
  timecop
  twilio-ruby
  tzinfo
  uglifier (>= 1.3.0)
  value_object!
  virtus
  virtus-group
  web-console (= 4.1.0)
  webmock
  will_paginate (~> 3.3.0)
  yomu

RUBY VERSION
   ruby 2.7.3p183

BUNDLED WITH
   2.2.16
```

```
$ bundle config
Settings are listed in order of priority. The top value will be used.
```
