# Use the official Ruby image as a base image
FROM ruby:3.1.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn sqlite3

# Set environment variable for Rails app directory
ENV RAILS_ROOT /var/www/menu_app
RUN mkdir -p $RAILS_ROOT

# Set working directory
WORKDIR $RAILS_ROOT

# Set default environment
ARG RAILS_ENV=development
ENV RAILS_ENV=$RAILS_ENV
ENV RACK_ENV=$RAILS_ENV

# Set default secret_key_base
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

# Adding gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 4

# Adding project files
COPY . .

RUN mkdir -p db && touch db/production.sqlite3
# Precompile assets and run other necessary Rails tasks
RUN bundle exec rake assets:precompile
RUN bundle exec rake db:create db:migrate db:seed

# Expose the port that Rails will run on
EXPOSE 8080

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]
