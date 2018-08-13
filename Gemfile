source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem 'sqlite3'
gem 'rack-flash3'

group :test do 
    gem 'rspec'
    gem 'capybara'
    gem 'rack-test'
    gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :development do
    gem 'shotgun'
    gem 'pry'
    gem 'tux'
end