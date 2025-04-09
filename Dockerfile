FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y bison flex libreadline-dev libc6-dev libfl-dev wget vim make gcc curl git build-essential

RUN useradd -m expl
USER expl

WORKDIR /home/expl
