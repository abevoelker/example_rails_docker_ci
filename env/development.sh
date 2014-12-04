#!/bin/bash

export RAILS_ENV="development"

export POSTGRES_USER="${POSTGRES_ENV_USERNAME}"
export POSTGRES_PASS="${POSTGRES_ENV_PASSWORD}"
export POSTGRES_HOST="${POSTGRES_PORT_5432_TCP_ADDR}"
export POSTGRES_PORT="5432"
export DATABASE_NAME="example_rails_docker_ci_development"

export DATABASE_URL="postgresql://${POSTGRES_USER}:${POSTGRES_PASS}@${POSTGRES_HOST}:${POSTGRES_PORT}/${DATABASE_NAME}"
export ELASTICSEARCH_URL="http://${ELASTICSEARCH_PORT_9200_TCP_ADDR}:9200"
export REDIS_URL="redis://${REDIS_PORT_6379_TCP_ADDR}:6379/0"

# Execute the commands passed to this script
# e.g. "./env.sh bundle exec rake
exec "$@"
