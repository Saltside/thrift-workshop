FROM ruby:2.3

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
RUN bundle install

COPY . /app

CMD [ "ls", "/app" ]
