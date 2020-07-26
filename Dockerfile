FROM ubuntu:latest

MAINTAINER Vasco Santos <jvosantos@gmail.com>

ARG AWS_VERSION="2.0.22"

RUN apt-get update \
  && apt-get install -y ca-certificates curl unzip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_VERSION}.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip

