#!/bin/bash

docker rm -f jenkins

docker run -d --name jenkins \
--restart always \
--dns 172.16.0.200 \
-p 8080:8080 \
-p 50000:50000 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
quay.io/uvelyster/jenkins

# Add Group and docker binary
# docker exec -u 0 jenkins groupadd -g 991 docker
# docker exec -u 0 jenkins usermod -aG 991 jenkins
# docker cp /usr/bin/docker jenkins:/usr/bin/docker

# docker restart jenkins
