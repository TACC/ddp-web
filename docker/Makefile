all: build run
TAG ?= 1.0.0

build:
	docker build -t wjallen/ddp-web:$(TAG) .

run:
	docker run --rm -p 3000:3000 wjallen/ddp-web:$(TAG)

test:
	docker run --rm -it wjallen/ddp-web:$(TAG) /bin/bash

push:
	docker push wjallen/ddp-web:$(TAG)
