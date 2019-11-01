FROM ruby:2-alpine

COPY . /app/
RUN gem install pact-provider-verifier && apk add --no-cache bash

WORKDIR /app

CMD pact-provider-verifier help

RUN chmod +x verify-folder.sh

CMD tail -f /dev/null
