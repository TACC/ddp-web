FROM ubuntu:24.04

RUN apt update && apt upgrade -y
RUN apt install curl \
                gcc \
                git \
                libffi-dev \
                libreadline-dev \
                libsqlite3-dev \
                libssl-dev \
                libyaml-dev \
                make \
                nginx \
                zlib1g-dev -y

RUN apt install ruby-dev \
                rbenv \
                yarn -y

RUN rbenv install 3.1.2 && rbenv global 3.1.2
ENV PATH="/root/.rbenv/shims:${PATH}" 
ENV PATH="/root/.rbenv/versions/3.1.2/bin:${PATH}"
RUN gem install rails bundler

WORKDIR /root
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . ./ddp-web/
WORKDIR /root/ddp-web
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

