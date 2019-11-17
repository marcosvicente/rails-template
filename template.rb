def gems_test 
  gem_group :development, :test do
    gem "rspec-rails"
    gem 'ffaker'
    gem 'rspec-rails'
    gem 'database_cleaner'
    gem 'capybara'
    gem 'factory_bot_rails'
  end

  gem_group :test do
    gem 'webdrivers'
    gem 'chromedriver-helper'
    gem 'rails-controller-testing'
    gem 'shoulda-matchers', '~> 3.1'
    gem 'simplecov'
  end

end


def config_test 
  gems_test
end


def main
  config_test
end

main
