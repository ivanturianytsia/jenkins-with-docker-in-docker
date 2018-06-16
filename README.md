# Jenkins 2 with Docker in Docker
For building Docker images with Jenkins 2
## Usage

### 1. Create docker volume
``` sh
docker volume create jenkins-data
```

### 2. Set correct permissions
Next command is **only for docker-machine** setup.
You shouldn't run next command if you are deploying elsewhere, just make sure the *jenkins-data* volume has correct permission for *jenkins* user to read and write on the volume.

In addition, install jq if you didn't do that before.
JQ is a bash application that parses json output.
``` sh
docker-machine ssh <YOUR DOCKER MACHINE> sudo chown -R 1000:1000 $(docker volume inspect jenkins-data | jq '.[0].Mountpoint')
```

### 3. Run the container
```
docker container run \
  --publish 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --mount source=jenkins-data,target=/var/jenkins_home \
  --name jenkins \
  -d \
  --rm \
  ivanturianytsia/jenkins-with-docker-in-docker:latest
```

### 4. Get the admin password
It is required when loggin into Jenkins 2 for the first time.
```
docker container exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
