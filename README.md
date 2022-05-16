This is the docker image for [Iris CI](https://gitlab.mpi-sws.org/iris/ci).

Here's how to update this image on Docker Hub:
```
git checkout opam2
git pull
docker build -t ralfjung/opam-ci:opam2 .
docker login
docker push ralfjung/opam-ci:opam2
```
