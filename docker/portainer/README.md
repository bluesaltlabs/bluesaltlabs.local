# Portainer

Describes how to run portainer on `docker-server.local` host.


Right now I'm just running this per [the documentation](https://docs.portainer.io/start/install-ce/server/docker/linux#deployment):

```bash
docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  --name=portainer \
  # --hostname=portainer.docker-server.local \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data portainer/portainer-ce:lts
```
