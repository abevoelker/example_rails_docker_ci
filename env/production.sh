#!/bin/bash

export RAILS_ENV="production"

# these are just stubbed values so Docker can build the image
export DATABASE_URL="postgresql://foo:bar@example.com:5432/baz"
export ELASTICSEARCH_URL="http://example.com:9200"
export REDIS_URL="redis://example.com:6379/0"

# Execute the commands passed to this script
# e.g. "./env.sh bundle exec rake
exec "$@"
