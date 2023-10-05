# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "coffee-rails", "~> 5.0", ">= 5.0.0"
gem "jbuilder", "~> 2.11", ">= 2.11.5"
gem "jquery-rails", ">= 4.5.1"
gem "pg", "~> 0.18"
gem "puma", "~> 4.3", ">= 4.3.12"
gem "rails", "~> 7.1.0"
gem "sass-rails", "~> 6.0", ">= 6.0.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platform: :mri
  gem "factory_bot_rails", "~> 5.0", ">= 5.0.0"
  gem "rspec-rails", "~> 6.0", ">= 6.0.0"
  gem "rubocop", "~> 1.11", ">= 1.11.0"
  gem "rubocop-rails", "~> 2.10", ">= 2.10.1"
  gem "rubocop-rspec", "~> 2.2", ">= 2.2.0"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring", ">= 2.0.1"
  gem "spring-watcher-listen", "~> 2.0.1"
  gem "web-console", ">= 4.2.1"
end

group :test do
  gem "capybara", "~> 2.18", ">= 2.18.0"
  gem "rails-controller-testing", "~> 1.0", ">= 1.0.5"
  gem "simplecov", "~> 0.13.0"
end

# addons
# slugs for blogs
gem "friendly_id", "~> 5.4", ">= 5.4.2"
# page object model for features
gem "site_prism", "~> 2.17", ">= 2.17.1"
# authentication
gem "devise", "~> 4.9", ">= 4.9.0"
# style
gem "bootstrap", "~> 5.0", ">= 5.0.0"
source "https://rails-assets.org" do
  gem "rails-assets-tether", ">= 1.3.3"
end
gem "font-awesome-rails", "~> 4.7", ">= 4.7.0.7"
# authorization
gem "petergate", "~> 1.9", ">= 1.9.1"
# pagination
gem "kaminari", "~> 1.2", ">= 1.2.1"
# jquery ui
gem "jquery-ui-rails", "~> 6.0", ">= 6.0.1"
# uploading files / videos / images
gem "carrierwave", "~> 1.3", ">= 1.3.2"
gem "carrierwave-aws", "~> 1.4", ">= 1.4.0"
gem "dotenv-rails", "~> 2.7", ">= 2.7.6"
gem "mini_magick", "~> 4.9", ">= 4.9.4"
# javascript elements in form
gem "cocoon", "~> 1.2", ">= 1.2.9"
# notifications
gem "gritter", "~> 1.2"
# redis
gem "redis", "~> 3.3", ">= 3.3.3"
# markdown parser
gem "redcarpet", "~> 3.5", ">= 3.5.1"
# code syntax highlighting
gem "coderay", "~> 1.1", ">= 1.1.1"
# to launch `save_and_open_page`
gem "launchy", "~> 2.5", ">= 2.5.0"
# for headless browser test
gem "poltergeist", "~> 1.18", ">= 1.18.1"

# declare ruby version for heroku
ruby "2.7.3"
