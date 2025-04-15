# Nextcloud All-in-One

[Original Repository](https://github.com/nextcloud/all-in-one)
[dir location docs](https://github.com/nextcloud/all-in-one?tab=readme-ov-file#how-to-change-the-default-location-of-nextclouds-datadir)

This docker container is intended to run on the `windows-server` host.


## Initial Run

From the windows command prompt, navigate to the directory containing the docker-compose file for this project. Run the docker compose file with the following command:

```shell
docker compose -p nextcloud-aio-mastercontainer up --build -d
```
