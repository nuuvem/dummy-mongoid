# Use the official Ruby image with version 3.0.7
FROM ruby:3.0.7

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs

# Set the working directory inside the Docker container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the gem dependencies
RUN bundle install

# Copy the entire app into the container
COPY . .

# Expose port 3000 to the host
# EXPOSE 3000

# Start the Rails server
# CMD ["rails", "server", "-b", "0.0.0.0"]
