FROM debian:stretch

COPY apt-pins/* /etc/apt/preferences.d/
RUN echo "deb http://httpredir.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable.list

RUN apt update -y && apt install -y --no-install-recommends git m4 time curl linux-perf opam ocaml rsync

RUN useradd ci
USER ci
