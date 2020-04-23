jcfachini/lamp5.6
==========

![docker_logo](https://raw.githubusercontent.com/fauria/docker-lamp/master/docker_139x115.png)

[![Docker Pulls](https://img.shields.io/docker/pulls/jcfachini/lamp5.6?style=plastic)](https://hub.docker.com/r/jcfachini/lamp5.6/)

This Docker container implements a LAMP stack with PHP5.6 for legacy applications.

How to use
----

#### Create a temporary container for testing purposes:

```
 docker run -i -t --rm -p [hostPort]:80 -v [hostPath]:/var/www/html jcfachini/lamp5.6:1.0 bash

```
