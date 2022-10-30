# DevcampPortfolio

[Tutorial](https://www.udemy.com/professional-rails-5-development-course)

> This is a Ruby on Rails 5 application that allows users to create their own
portfolios.

## Features

- Real time chat engine for comments
- Blog
- Portfolio
- Drag and drop interface

## TODO

*NOTE*: These are things that are updated from the tutorial base application

- [x] Fix responsive issues with navbar on "main" pages
- [x] Fix navbar dropdown on blog and portfolio pages
- [x] Update Pages to separate controllers with index or show actions
- [x] Add testing
- [x] Remove scaffolded files that are unnecessary
- [x] Add model validations
- [x] Remove API code in controllers where unneeded
- [x] Remove custom route for portfolios show
- [x] Update blogs#toggle_status to its own controller
- [x] Update styles for better responsiveness
- [x] Fix tweets styles
- [x] Update brands so they return you to home
- [x] Add form for creating Topics
- [x] Update styles on Topics index
- [x] Reduce amount of time gritter notification stay visible
- [x] Improve documentation (especially `#no doc`)
- [x] Add admin controls of topics (edit, destroy)
- [x] Order sidebar topics by count of blogs
- [ ] Add shared error alert partial
- [ ] Improve consistency in style including navs and color schemes
- [ ] DRY up admin actions in blogs and topics
- [ ] DRY up nav bars
- [ ] Add SEO keywords to blog model (maybe portfolio as well)

## Tutorial add ons

- [FriendlyId](https://github.com/norman/friendly_id) for slugs in Blog urls
- [Devise](https://github.com/plataformatec/devise) for authentication
- [Bootstrap](https://github.com/twbs/bootstrap-rubygem) for styling
- [Petergate](https://github.com/elorest/petergate) for authorization
- [FontAwesome](https://github.com/bokmann/font-awesome-rails) for icons
- [Kaminari](https://github.com/kaminari/kaminari) for pagination
- [HTML5 Sortable](https://github.com/lukasoppermann/html5sortable) for sorting
  portfolio items
- [jQuery UI Rails](https://github.com/jquery-ui-rails/jquery-ui-rails) required
  for HTML5 Sortable
- [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) for file
  uploading
- [CarrierWave AWS](https://github.com/sorentwo/carrierwave-aws) for AWS storage
  of uploaded files
- [MiniMagick](https://github.com/minimagick/minimagick) for image manipulation
- [dotenv](https://github.com/bkeepers/dotenv) for storing environment variables
- [cocoon](https://github.com/nathanvda/cocoon) for JS elements in forms
- [gritter](https://github.com/RobinBrouwer/gritter) for notices and alerts
- [Redis](https://github.com/redis/redis-rb) for use with action cable for
  comments
- [Redcarpet](https://github.com/vmg/redcarpet) for markdown parsing
- [CodeRay](https://github.com/rubychan/coderay) for code syntax highlighting

## My add ons

- [RuboCop](https://github.com/bbatsov/rubocop) for linting
- [rspec-rails](https://github.com/rspec/rspec-rails) for testing
- [Rails::Controller::Testing](https://github.com/rails/rails-controller-testing)
  for controller testing
- [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails) for
  test data
- [SimpleCov](https://github.com/colszowka/simplecov) for test coverage
  reporting
- [Capybara](https://github.com/teamcapybara/capybara) for acceptance testing
- [SitePrism](https://github.com/natritmeyer/site_prism) for page object models
  for feature specs
- [SimpleCov](https://github.com/colszowka/simplecov) for code coverage analysis
- [Launchy](https://github.com/copiousfreetime/launchy) for launching screen
  captures automatically when testing
