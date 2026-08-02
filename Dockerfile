FROM ruby:3.4.5

# Instalar dependencias del sistema
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Directorio de trabajo
WORKDIR /app

# Instalar gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copiar el proyecto
COPY . .

# Entorno de producción
ENV RAILS_ENV=production
ENV RACK_ENV=production

# Compilar assets (Tailwind + Propshaft)
RUN SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

# Puerto de Render
EXPOSE 10000

# Arrancar Rails
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "10000"]