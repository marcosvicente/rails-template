# config rails
def source_paths
  [__dir__]
end

def config_bundle
  run "rm -r Gemfile"
  copy_file "gemtemplate", "Gemfile"
  mailcatcher_config

end

def mailcatcher_config
  run "gem install mailcatcher"
  say "install mailcatcher"
end

def robocop
  copy_file "robocop.yml" ".robocop.yml"
end

def environments_development
  run "rm -r config/environments/development.rb"
  copy_file "config/environments/development.rb", "config/environments/development.rb"

end

def config_rspec
  rails_command "generate rspec:install"
  say "config rspec"

end

def config_test_support
  # get a rails helper config
  run "spec/rails_helper.rb"
  copy_file "spec/rails_helper.rb", force: true

  # create path support
  run "mkdir spec/support"

  # database_cleaner
  run "touch spec/support/database_cleaner.rb"
  copy_file "spec/support/database_cleaner.rb","spec/support/database_cleaner.rb", force: true

  # factory_bot_rails
  run "touch spec/support/factory.rb"
  copy_file "spec/support/factory.rb","spec/support/factory.rb", force: true

  # simplecov
  run "touch spec/support/simplecov.rb"
  copy_file "spec/support/simplecov.rb","spec/support/simplecov.rb", force: true

  # capybara
  run "touch spec/support/capybara.rb"
  copy_file "spec/support/capybara.rb","spec/support/capybara.rb", force: true

  # shoulda_mathers
  run "touch spec/support/shoulda_mathers.rb"
  copy_file "spec/support/shoulda_mathers.rb","spec/support/shoulda_mathers.rb", force: true

  say "created a rspec support files"

end

def config_test 
  config_rspec
  config_test_support
  # remove mine test
  run "rm -rf test/"

end


def main
  config_bundle
  environments_development
  config_test

end

main
