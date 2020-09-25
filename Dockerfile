# Deep distro in sync with CI builder! We run perf inside the container, needs to work with host kernel.
FROM debian:stretch

# apt configuration and package installation
COPY apt/ /etc/apt/
# gmp: needed by Coq
# python: needed by z3 (for RefinedC)
# mpfr: needed by Cerberus (for RefinedC)
RUN apt update -y && apt install -y git rsync tar unzip m4 time curl linux-perf strace ocaml build-essential bubblewrap gawk libgmp-dev python2.7 python3 libmpfr-dev

# opam installation
RUN curl "https://github.com/ocaml/opam/releases/download/2.0.7/opam-2.0.7-x86_64-linux" -Lo /usr/local/bin/opam && chmod +x /usr/local/bin/opam

# prepare CI environment
WORKDIR /
RUN useradd ci
USER ci
