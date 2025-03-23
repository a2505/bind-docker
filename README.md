### Build docker image
```shell
git clone https://github.com/a2505/bind-docker.git

cd bind-docker

docker build -t bind-docker .
```
### Run
```shell
docker run -d \
  -p 53:53/tcp -p 53:53/udp \
  -v $(pwd)/.bind/etc:/etc/bind \
  -v $(pwd)/.bind/var:/var/bind \
  --name bind-server \
  bind-docker
```
