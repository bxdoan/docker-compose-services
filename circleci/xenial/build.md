# Pull/push from and to Docker Hub
ref. https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html

## Login Docker Hub from command

```bash
docker login --username=bxdoans
```
and type your password following that

## 
```bash
docker tag bxdoan/circleci:xenial bxdoan/circleci:xenial
docker push bxdoan/circleci:xenial
```