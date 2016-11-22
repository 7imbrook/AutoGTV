FROM ubuntu

RUN apt-get update && apt-get install -y ruby-full
RUN apt-get install -y git
RUN gem install bundler

WORKDIR /app

COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY ./ /app
RUN cd certs && ./gen.sh

ENTRYPOINT /app/entrypoint.sh
CMD []
