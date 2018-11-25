FROM ruby:2.4
MAINTAINER Ludmilla Aires<ludaires@gmail.com>
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /maintenance_app
WORKDIR /maintenance_app
COPY Gemfile /maintenance_app/Gemfile
COPY Gemfile.lock /maintenance_app/Gemfile.lock
RUN bundle install
COPY . /maintenance_app
CMD [ "shotgun" ]