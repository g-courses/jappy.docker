## JAPPY: Educational resource for programming classes in **JA**va, c**PP** (C++) and p**Y**thon

JAPPY is a development environment designed as an educational resource for programming classes using Java, C++ or Python. It can be used independently through a) a Jupyter client connected to port `8888/tcp` or b) using the VSCode IDE with the *devcontainer* plugin.

### Using a Jupyter client

To use JAPPY with a Jupyter client, you must use the [_docker-compose_](jupyter.only/docker-compose.yml) file available in the [_jupyter.only_](jupyter.only/) directory.

```
services:
  jappy:
    image: gastudil/courses:jappy-jupyter
    container_name: dev-jappy
    hostname: dev-jappy
    ports:
      - 8888:8888
    volumes:
      - ./workspace:/home/devuser/workspace
    ...
```

When deploying this setup, docker compose maps the container port `8888/tcp` to port `8888/tcp` of the host as specified in the compose file.

#### Deploy with docker compose

```
$ docker compose up -d
```

When you run this command, the following output is expected:

><pre>
>[+] Running 2/2
> ✔ Network jupyteronly_back_net  Created                                                                                               0.0s 
> ✔ Container dev-jappy           Started  
></pre>

**Note:** The docker compose file maps the local directory named `workspace` to the `/home/devuser/workspace` directory located in the container. This allows work files to be stored in the container and persisted on the host.

Optionally, you can check that containers are running and port mapping:

```
$ docker compose ps
```
><pre>
>NAME        IMAGE                            COMMAND                  SERVICE   CREATED          STATUS          PORTS
>dev-jappy   gastudil/courses:jappy-jupyter   "/usr/bin/supervisor…"   jappy     42 seconds ago   Up 41 seconds   80/tcp, 0.0.0.0:8888->8888/tcp
><pre>

Navigate to `http://localhost:8888` in your web browser to access Jupyter server. This jupyter server contains the kernels for Python, Java and C++.

Finally, to stop and remove the containers:

```
$ docker compose down
```
