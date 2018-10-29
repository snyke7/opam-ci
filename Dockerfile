FROM debian:stretch

# apt configuration and package installation
COPY apt/ /etc/apt/
RUN apt update -y && apt install -y git rsync tar unzip m4 time curl linux-perf ocaml build-essential

# opam installation
WORKDIR /tmp
RUN git clone -b iris https://github.com/RalfJung/opam
WORKDIR opam
RUN ./configure && make lib-ext && make && make install
WORKDIR /tmp
RUN rm -rf opam

# prepare CI environment
WORKDIR /
RUN useradd ci
USER ci
