FROM debian:stretch

# apt configuration and package installation
COPY apt/ /etc/apt/
RUN apt update -y && apt install -y git rsync tar unzip m4 time curl linux-perf strace ocaml build-essential bubblewrap

# opam installation
RUN curl "https://github.com/ocaml/opam/releases/download/2.0.5/opam-2.0.5-x86_64-linux" -Lo /usr/local/bin/opam && chmod +x /usr/local/bin/opam

# prepare CI environment
WORKDIR /
RUN useradd ci
USER ci
