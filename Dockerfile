FROM ruby:3.4.5

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libyaml-dev \
    libsqlite3-dev \
    sqlite3 \
    nodejs \
    npm

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]