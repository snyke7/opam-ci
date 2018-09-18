FROM debian:stretch

COPY apt/ /etc/apt/
RUN apt update -y && apt install -y git rsync tar unzip m4 time curl linux-perf ocaml build-essential

RUN curl "https://github.com/ocaml/opam/releases/download/2.0.0/opam-2.0.0-x86_64-linux" -Lo /usr/local/bin/opam && chmod +x /usr/local/bin/opam

RUN useradd ci
USER ci
