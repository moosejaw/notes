#devops #docker #troubleshooting #cpu_architecture

First encountered: 2024-04-03

### Problem

The following error occurred when attempting to deploy a container in ECS:

```
exec /usr/local/bin/docker-entrypoint.sh: exec format error
```

### Overview

The system that built the container image has a different CPU architecture than the system attempting to run the container.

* https://stackoverflow.com/a/69636473

### Resolution

Ensure the machine building the image and running the container are using the same CPU architectures.

To resolve in ECS, the task definition was updated to use CPU architecture 'X86_64'.

When building locally, processors can 'emulate' other CPU architectures:

```sh
docker buildx build --platform=linux/amd64 .
```
