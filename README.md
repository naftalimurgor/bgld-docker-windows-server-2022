bgld Windows server 2022 Docker Image setup
===================
<p align="center">
  <img width="300" height="300" src="https://github.com/naftalimurgor/bgld-docker-windows-server-2022/blob/main/Bitgesell.png">
</p>

Docker image that runs the Bitgesell bgld node in a container for easy deployment for Windows Server 2022 environment.


Requirements
------------

* Physical machine, cloud instance, or VPS that supports Docker i.e. Vultr, Digital Ocean, KVM or XEN based VMs) running Windows Server 2022 release

* At least 10 GB to store the block chain files (and always growing!)
* At least 500 MB + 1 GB swap file

Quick Start
-----------

1. Run an instance of Bitegesell node as follows:

        docker run -dp 8454:8454 naftalimurgor/bgld-windows-server:latest

2. Verify that the container is running and bgld node is downloading the blockchain

        $ docker ps
        CONTAINER ID   IMAGE                COMMAND   CREATED         STATUS         PORTS                                                 NAMES
        304e5a74a539   naftalimurgor/bgld-windows-server   "BGLd"    5 seconds ago   Up 3 seconds   0.0.0.0:8454->8454/tcp, :::8454->8454/tcp, 8455/tcp   naughty_greider

3. You can then access the daemon's output thanks to the [docker logs command]( https://docs.docker.com/reference/commandline/cli/#logs)

        docker logs -f bgld

4. Install optional init scripts for upstart and systemd are in the `init` directory.


Documentation
-------------

* Additional documentation in the [docs folder](https://github.com/naftalimurgor/bgld-docker-windows-server-2022/tree/main/docs).
