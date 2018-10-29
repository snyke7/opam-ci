FROM debian:stretch

# apt configuration and package installation
COPY apt/ /etc/apt/
RUN apt update -y && apt install -y git rsync tar unzip m4 time curl linux-perf strace ocaml build-essential

# opam installation
WORKDIR /tmp
RUN git clone -b ralf https://github.com/rjbou/opam
WORKDIR opam
RUN git reset --hard 875aa13167e5df2d254334a745f066eabe86b647
RUN ./configure && make lib-ext && make && make install
WORKDIR /tmp
RUN rm -rf opam

# prepare CI environment
WORKDIR /
RUN useradd ci
USER ci
