# gets the docker image of ruby 2.5 and lets us build on top of that
FROM ruby:2.6.5-slim

# install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev

# create a folder /hoopla-rails-metrics-quiz-master in the docker container and go into that folder
RUN mkdir /hoopla-rails-metrics-quiz-master
WORKDIR /hoopla-rails-metrics-quiz-master

# Copy the Gemfile and Gemfile.lock from app root directory into the /myapp/ folder in the docker container
COPY Gemfile /hoopla-rails-metrics-quiz-master/Gemfile
#COPY Gemfile.lock /hoopla-rails-metrics-quiz-master/Gemfile.lock

# Run bundle install to install gems inside the gemfile
#RUN gem update --system
#RUN gem install bundler -v 2.0.1
RUN bundle install

# Copy the whole app
COPY . /hoopla-rails-metrics-quiz-master

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# Configure an entry point, so we don't need to specify
# "bundle exec" for each of our commands.
ENTRYPOINT ["bundle", "exec"]

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["rails", "server", "-b", "0.0.0.0"]
