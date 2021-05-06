FROM ruby:2.6.5

ENV BUNDLER_VERSION='2.1.4'
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -y \
  nodejs  \
  postgresql-client


RUN mkdir /api
WORKDIR /api
COPY Gemfile /api/Gemfile
COPY Gemfile.lock /api/Gemfile.lock

RUN gem install bundler -v $BUNDLER_VERSION

RUN bundler install

COPY . /api
