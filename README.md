# Introduction

This _Docker_ image provides [slack-standup-bot](http://www.sofetch.io/products/standup-bot-open-source).

This image follow the _Docker_ [Best Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)


# References

 * [Quickstart: Docker Compose and Rails](https://docs.docker.com/compose/rails/)
 * [Standup-Bot](https://github.com/sofetch/slack-standup-bot)


# Quick Start

## Pre-requisites

You must already have installed `docker` and `docker-compose`.

For storing the db data we create first a dedicated volume:

```
docker volume create --name standup_pgdata
```

## Building and Starting the Image

```
docker-compose build
docker-compose up -d
```

Then open http://localhost:3030/.

# Potential Improvements

 * Use `ARG` for some environment variables
 * Use _Apache_ as proxy (_Docker_ image _httpd:2.4_)
