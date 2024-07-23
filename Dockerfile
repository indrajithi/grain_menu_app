# Use the official Ruby image as a base image
FROM ruby:3.1.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Set an environment variable where the Rails app is installed to inside of Docker image
ENV RAILS_ROOT /var/www/menu_app
RUN mkdir -p $RAILS_ROOT 

# Set working directory
WORKDIR $RAILS_ROOT

# Setting env up
ENV RAILS_ENV='development'
ENV RACK_ENV='development'

# Adding gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 4

# Adding project files
COPY . .

# Precompile assets and run other necessary Rails tasks
RUN bundle exec rake assets:precompile

EXPOSE 3000

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
