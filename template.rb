# config rails
def source_paths
  [__dir__]
end

def config_bundle
  run "rm -r Gemfile"
  copy_file "gemtemplate", "Gemfile"

end

def database
  run "rm -r config/database.yml"
  copy_file "config/database.yml", "config/database.yml"

end

def require_system
  run "sudo apt-get install graphviz advancecomp gifsicle jhead jpegoptim libjpeg-progs optipng pngcrush pngquant"

end

def utils_dev
  # mailcatcher
  run "gem install mailcatcher"
  say "install mailcatcher"

  # robocop
  run "gem install rubocop-performance"
  copy_file "rubocop.yml", ".rubocop.yml"

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

def devops
  copy_file "Dockerfile", "Dockerfile"
  say "docker build ."
end

def readme
  run "rm -rf README.md"
  copy_file "readme_rails.md", "README.md"
end

def main
  config_bundle
  environments_development
  database
  utils_dev
  config_test
  devops
  readme

end

main
