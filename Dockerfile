FROM    rubyisbeautiful/centos6-ruby-2.2.3:latest

MAINTAINER <Bryan Taylor> bcptaylor@gmail.com

COPY . /usr/src/app
WORKDIR /usr/src/app
RUN bundle install

EXPOSE 4567

CMD rackup -p 4567