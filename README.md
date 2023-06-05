# ChangeIP DNS Updater

Docker container to run DNS updates to a ChangeIP.com account.

Differently from [https://github.com/arnaubennassar/docker-changeip-updater](https://github.com/arnaubennassar/docker-changeip-updater), this container run a bash script periodically to check and update the ip address.

GitHub repository: [https://github.com/ivanvaccari/docker-changeip-updater](https://github.com/ivanvaccari/docker-changeip-updater)

## Quick Start
Set the following env variables with your ChangeIP.com account info:

```bash
export CHANGEIP_USERNAME=user
export CHANGEIP_PASSWORD=password
export CHANGEIP_RECORD=myrecord.example.com
export UPDATE_INTERVAL=10 #seconds between checks. Defaults to 20 seconds
export LOGLEVEL=2 # verboseness levels. 0 = disable logs, 1 = show only update logs, 2 = maximum verbosity. Defaults to 2.
```

Then pull the latest image and run a one-off container to execute the script:

```bash
docker pull ivaccari/changeip-updater
docker run --rm -it                 \
    -e "CHANGEIP_USERNAME=user"     \
    -e "CHANGEIP_PASSWORD=passwod"  \
    -e "CHANGEIP_RECORD=record"     \
    -e "UPDATE_INTERVAL=60"         \
    ivaccari/changeip-updater
```

## Docker-compose
Use the following configuration:

```yml
changeip:
    container_name: changeipupdater
    image: ivaccari/changeip-updater
    environment:
      - TZ=Europe/Rome
      - CHANGEIP_USERNAME=user
      - CHANGEIP_PASSWORD=password
      - CHANGEIP_RECORD=myrecord.example.com
      - UPDATE_INTERVAL=60
    restart: always
```

## Timezone

The timezone is currently set to 'Etc/UTC' but can be changed via the ```TZ``` env variable in the Dockerfile.

## Logs

To view logs, use the docker utility: `docker logs -f CONTAINER` 

## FAQ
- Q: I'm getting "BAD AUTH".
  A: Check your credentials. Check for special chars which might broke passing via env variables.
  Escape `$` with another `$` (becomes `$$`).

## Build images

Just run `./build.sh`


