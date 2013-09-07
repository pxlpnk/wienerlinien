source 'https://rubygems.org'

gemspec

gem 'rake'

group :development do
  gem 'pry'
  gem 'pry-debugger'
  gem 'dotenv'
  gem 'guard'
  gem 'guard-rspec'
end

group :test, :development do
  gem 'reek'
  gem 'rubocop'
end

group :test do
  gem 'rspec'
  gem 'vcr'
  gem 'mutant', git: 'https://github.com/mbj/mutant.git'
end
