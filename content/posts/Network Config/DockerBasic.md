Execute the following command to download the official `ubuntu` image to your computer:

```
docker pull ubuntu
```

To see the images that have been downloaded to your computer, type:

```
docker images
```

As an example, let’s run a container using the latest image of Ubuntu. The combination of the **-i**and **-t** switches gives you interactive shell access into the container:

```
docker run -it ubuntu
```

To exit the container, type `exit` at the prompt.

To view the **active ones**, use:

```
docker ps
```

To view all containers — active and inactive, run `docker ps` with the `-a` switch:

```
docker ps -a
```

To view the latest container you created, pass it the `-l` switch:

```
docker ps -l
```

To start a stopped container, use `docker start`, followed by the container ID or the container’s name. Let’s start the Ubuntu-based container with the ID of `d9b100f2f636`:

```
docker start d9b100f2f636
```

To stop a running container, use `docker stop`, followed by the container ID or name. This time, we’ll use the name that Docker assigned the container, which is `sharp_volhard`:

```
docker stop sharp_volhard
```

To open Terminal:

`docker exec -it mycont /bin/sh; exit`

