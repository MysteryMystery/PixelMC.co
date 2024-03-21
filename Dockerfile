FROM ruby:3.2.2 as build

WORKDIR /build

COPY . .

RUN gem install --default bundler -v '~> 2.5.6'

RUN bundle install 
RUN JEKYLL_ENV=production jekyll build


FROM nginx:1.24.0-alpine as serve
COPY --from=build /build/_site  /usr/share/nginx/html
COPY nginx.conf  /etc/nginx/conf.d/default.conf

EXPOSE 80