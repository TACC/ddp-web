FROM ubuntu:24.04

RUN apt update && apt upgrade -y
RUN apt install gcc \
                make \
                libssl-dev \
                libreadline-dev \
                libffi-dev \
                zlib1g-dev \
                libsqlite3-dev \
                curl \
                git \
                nginx -y

RUN apt install ruby-dev \
                rbenv \
                yarn -y

RUN rbenv install 3.1.2 && rbenv global 3.1.2
ENV PATH="/root/.rbenv/shims:${PATH}" 
ENV PATH="/root/.rbenv/versions/3.1.2/bin:${PATH}"
RUN gem install rails bundler

WORKDIR /root
RUN git clone https://github.com/TACC/ddp-web \
    && cd ddp-web \
    && bundle install

WORKDIR /root/ddp-web
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

