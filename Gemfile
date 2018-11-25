source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'    
gem 'sinatra-flash'
gem 'pg', '0.19.0'


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
    gem 'sqlite3'
end

group :production do 
    # gem 'pg'
end