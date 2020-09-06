## PREPARE DOCKER IMAGE

*Read full post at https://docs.docker.com/get-started/part2/*

##### Assumption

`PROJECT_DIR` is project's directory. This folder contains `Dockerfile`.

##### Define a container with Dockerfile

In `Dockerfile`:

```dockerfile
FROM ubuntu:latest
RUN apt-get update
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install wget -y
RUN apt-get install nano -y
RUN apt-get install ssh -y
RUN apt-get remove openssh-client openssh-server -y
RUN apt-get install openssh-client openssh-server -y
RUN service ssh start
WORKDIR /root
RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz
RUN tar -xvf hadoop-2.7.3.tar.gz
EXPOSE 50070
ADD ./site /root
```

##### Build image

`docker build --tag IMAGE_NAME:TAG_NAME PROJECT_DIR`

##### Run your image as a container

`docker run --publish HOST_PORT:CONTAINER_PORT --detach --name CONTAINER_NAME IMAGE_NAME:TAG_NAME`

There are a couple of common flags here:

- `--publish` asks Docker to forward traffic incoming on the host’s port to the container’s port.
- `--detach` asks Docker to run this container in the background.
- `--name` specifies a name with which you can refer to your container in subsequent commands, in this case `CONTAINER_NAME`.

Example: 

`docker run -it --publish 1050:1050 --detach --name corba corba:latest`

To open Terminal:

`docker exec -it mycont /bin/sh; exit`

## IN THE CONTAINER

#### Continue to config Hadoop

In container's Terminal:

```terminal
cd hadoop-2.7.3/etc/hadoop
nano hadoop-env.sh
# Edit the line contain export JAVAHOME to
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

cd hadoop-2.7.3
bin/hadoop namenode -format

ssh-keygen -t rsa #Press enter for each line 
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod og-wx ~/.ssh/authorized_keys
service ssh start # Or try: service ssh restart 
ssh localhost # Check

cd hadoop-2.7.3/sbin
./start-all.sh

# Check Hadoop services
jps
```

#### Load data

In container's Terminal:

```
cd ~
mkdir testdata && cd testdata
wget http://www.gutenberg.org/files/2701/2701-0.txt

cd ~/hadoop-2.7.3
bin/hadoop dfs -copyFromLocal ~/testdata /testdata
bin/hadoop dfs -ls /testdata

# Run the word count example
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar wordcount /testdata /testdata-output
```

