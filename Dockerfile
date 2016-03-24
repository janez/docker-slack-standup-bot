FROM ruby:2.2.4

LABEL Description="slack-standup-bot (`master`) from ruby:2.2.4"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# See https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  git \
  postgresql-client \
  nodejs \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /srv
WORKDIR /srv
RUN git clone https://github.com/sofetch/slack-standup-bot.git
WORKDIR /srv/slack-standup-bot

ENV RAILS_ENV production
RUN bundle install --without development test

COPY wait-pg-and-start.sh /srv/slack-standup-bot/wait-pg-and-start.sh
COPY start-rails.sh /srv/slack-standup-bot/start-rails.sh
RUN chmod +x /srv/slack-standup-bot/wait-pg-and-start.sh /srv/slack-standup-bot/start-rails.sh

# THE FOLLOWING SECTION MUST BE EDITOR BEFOR BUILDING THE IMAGE

ENV FETCH_BOT_DATABASE_PASSWORD=password
ENV SECRET_KEY_BASE=5ac49f40dff32480affdf061d6afc379f221bb44ac028520451a64071eec9643974989bcf9a1fd0cd6ba55f3615e6e7a1f298bfc1ef43fc0a503c1d67858b0cd
ENV STANDUPBOT_USERNAME=master
ENV STANDUPBOT_SECRET=master

#ENV MAILER_ADDRESS
#ENV MAILER_PORT 1025
#ENV MAILER_AUTHENTICATION
#ENV MAILER_USERNAME
#ENV MAILER_PASSWORD
#ENV MAILER_DOMAIN

EXPOSE 3030
