FROM       abevoelker/ruby
MAINTAINER Abe Voelker <abe@abevoelker.com>

ENV RAILS_ENV production

# Add 'web' user which will run the application
RUN adduser web --home /home/web --shell /bin/bash --disabled-password --gecos ""

# Separate Gemfile ADD so that `bundle install` can be cached more effectively
ADD Gemfile      /var/www/
ADD Gemfile.lock /var/www/
RUN chown -R web:web /var/www &&\
  mkdir -p /var/bundle &&\
  chown -R web:web /var/bundle
RUN su -c "cd /var/www && bundle install --path /var/bundle --deployment --without development test" -s /bin/bash -l web

# Add application source
ADD . /var/www
RUN chown -R web:web /var/www

USER web

# Precompile assets
RUN cd /var/www &&\
  ./env/production.sh bundle exec rake assets:precompile

WORKDIR /var/www

CMD ["bundle", "exec", "rails", "s"]
