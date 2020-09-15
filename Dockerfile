FROM ruby:2.6.1

# set app name is api-product:dev

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENV RAILS_ENV='development'
ENV RAKE_ENV='development'

COPY . /usr/src/app
RUN gem install bundler && bundle install
EXPOSE 3000