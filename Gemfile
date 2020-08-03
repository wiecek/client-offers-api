source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'arkency-command_bus'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'dry-struct'
gem 'dry-types'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger-entity'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rails'

group :test do
  gem 'fuubar'
  gem 'rspec-rails'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'guard-rspec'
end

group :development do
  gem 'listen'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end
