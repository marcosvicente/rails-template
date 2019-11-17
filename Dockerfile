MAINTAINER marcosvicentesiqueira@gmail.com
FROM ruby:2.6.3
FROM mysql
from ubuntu:18.04
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && apt-get clean
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
