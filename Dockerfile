FROM docker.io/library/ruby:2.2.3 AS builder
WORKDIR /app
COPY . /app
RUN bundle install
RUN ENV=production bundle exec middleman build

FROM docker.io/library/nginx AS web
COPY --from=builder /app/build/ /usr/share/nginx/html/
