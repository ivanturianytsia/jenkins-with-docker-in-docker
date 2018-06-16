# Jenkins 2 with Docker in Docker
For building Docker images with Jenkins 2
## Usage
``` sh
docker volume create jenkins-data

docker container run \
  --publish 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --mount source=jenkins-data,target=/var/jenkins_home \
  --name jenkins \
  -d \
  --rm \
  ivanturianytsia/jenkins-with-docker-in-docker:latest

# Get the admin password
docker container exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
