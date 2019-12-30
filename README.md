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
docker build --rm -t juangburgos/jenkins-centos7 .
```

## Jenkings CentOS7 Docker with Qt

First build the previous *Dockerfile* first to use it as a base.

### With Qt 5.6.3

```bash
cd qt5.6.3
docker build --rm -t juangburgos/jenkins-centos7-qt5.6.3 .
```

### With Qt 5.13.2

```bash
cd qt5.13.2
docker build --rm -t juangburgos/jenkins-centos7-qt5.13.2 .
```
