# frozen_string_literal: true

source "http://rubygems.org"

gemspec

group :development, :test do
  gem "autoprefixer-rails",   "~> 10.4.7.0"
  gem "byebug",               "~> 11.1.3", platforms: %i[mri mingw x64_mingw]
  gem "capybara",             "~> 3.37.1"
  gem "image_processing",     "~> 1.2"
  gem "kaminari",             "~> 1.2.2"
  gem "puma",                 "~> 5.6.4"
  gem "rubocop",              "~> 1.30.1", require: false
  gem "rubocop-performance",  "~> 1.14", require: false
  gem "selenium-webdriver",   "~> 4.2.1"
  gem "sqlite3",              "~> 1.4.2", "!= 1.4.3"
end

group :development do
  gem "listen",       "~> 3.7.1"
  gem "web-console",  "~> 4.2.0"
end

group :test do
  gem "coveralls",                "~> 0.8.23", require: false
  gem "diffy",                    "~> 3.4.1"
  gem "equivalent-xml",           "~> 0.6.0"
  gem "mocha",                    "~> 1.14.0", require: false
  gem "rails-controller-testing", "~> 1.0.5"
end
