FROM ruby:2.3

RUN apt-get update && apt-get -y install git-core

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
RUN bundle install

COPY . /app

CMD [ "ls", "/app" ]
