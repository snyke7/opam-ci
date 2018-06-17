FROM debian:stretch

RUN apt -y update && apt install -y git opam aspcud m4 time curl linux-perf

RUN useradd ci
USER ci
