FROM debian:stretch

RUN apt -y update && apt install -y git opam m4 time

RUN useradd ci
USER ci
