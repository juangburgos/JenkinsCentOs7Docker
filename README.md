## Jenkins CentOS7 Docker

Dockerfile used to create Jenkins docker based on CentOS7. The original Dockerfile and resources were cloned from:

* <https://github.com/jenkinsci/docker>

* <https://github.com/jenkinsci/docker/blob/master/Dockerfile-centos>

Just modified parent:

```dockerfile
# FROM centos
FROM centos:centos7
```

Build by changing to this directory and:

```bash
chmod +x install-plugins.sh
chmod +x jenkins.sh
chmod +x jenkins-support
chmod +x plugins.sh
chmod +x tini-shim.sh
docker build --rm -t juangburgos/jenkins-centos7
```