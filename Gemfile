# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "coffee-rails", "~> 4.2", ">= 4.2.2"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", ">= 4.3.5"
gem "pg", "~> 0.18"
gem "puma", "~> 3.12", ">= 3.12.2"
gem "rails", "~> 5.0.7", ">= 5.0.7.2"
gem "sass-rails", "~> 5.0", ">= 5.0.7"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platform: :mri
  gem "factory_girl_rails", "~> 4.9", ">= 4.9.0"
  gem "rspec-rails", "~> 3.9", ">= 3.9.0"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "rubocop", "~> 0.65.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.7.0"
end

group :test do
  gem "capybara", "~> 2.18", ">= 2.18.0"
  gem "rails-controller-testing", "~> 1.0", ">= 1.0.4"
  gem "simplecov", "~> 0.13.0"
end

# addons
# slugs for blogs
gem "friendly_id", "~> 5.2"
# page object model for features
gem "site_prism", "~> 2.17", ">= 2.17.1"
# authentication
gem "devise", "~> 4.7", ">= 4.7.1"
# style
gem "bootstrap", "~> 4.3", ">= 4.3.1"
source "https://rails-assets.org" do
  gem "rails-assets-tether", ">= 1.3.3"
end
gem "font-awesome-rails", "~> 4.7", ">= 4.7.0.5"
# authorization
gem "petergate", "~> 1.7"
# pagination
gem "kaminari", "~> 1.1", ">= 1.1.1"
# jquery ui
gem "jquery-ui-rails", "~> 6.0", ">= 6.0.1"
# uploading files / videos / images
gem "carrierwave", "~> 1.0"
gem "carrierwave-aws", "~> 1.1"
gem "dotenv-rails", "~> 2.7", ">= 2.7.5"
gem "mini_magick", "~> 4.9", ">= 4.9.4"
# javascript elements in form
gem "cocoon", "~> 1.2", ">= 1.2.9"
# notifications
gem "gritter", "~> 1.2"
# twitter
gem "twitter", "~> 6.1"
# redis
gem "redis", "~> 3.3", ">= 3.3.3"
# markdown parser
gem "redcarpet", "~> 3.4"
# code syntax highlighting
gem "coderay", "~> 1.1", ">= 1.1.1"
# to launch `save_and_open_page`
gem "launchy", "~> 2.4", ">= 2.4.3"
# for headless browser test
gem "poltergeist", "~> 1.18", ">= 1.18.1"

# declare ruby version for heroku
ruby "2.4.0"
