FROM juangburgos/jenkins-centos7

# set root user to allow yum install
USER root

# downloads first
RUN yum -y install wget && \
mkdir /tmp/downloads && \
cd /tmp/downloads && \
wget https://download.qt.io/archive/qt/5.6/5.6.3/qt-opensource-linux-x64-5.6.3.run && \
wget https://download.qt.io/official_releases/qt-installer-framework/3.1.1/QtInstallerFramework-linux-x64.run && \
wget https://github.com/probonopd/linuxdeployqt/releases/download/6/linuxdeployqt-6-x86_64.AppImage && \
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-2.3.1-14.el7.x86_64.rpm && \
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libxkbcommon-x11-0.7.1-3.el7.x86_64.rpm && \
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/postgresql-devel-9.2.24-4.el7_8.x86_64.rpm && \
wget http://www6.atomicorp.com/channels/atomic/centos/6/x86_64/RPMS/mysqlclient16-5.1.59-2.el6.art.x86_64.rpm && \
wget https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_64/Packages/p/p7zip-16.02-10.el7.x86_64.rpm && \
wget https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_64/Packages/p/p7zip-plugins-16.02-10.el7.x86_64.rpm && \
wget https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz

# missing dependencies
RUN yum -y update && \
yum -y group install "Development Tools" && \
yum -y install \
git \
kernel-headers kernel-devel \
mesa-libGL-devel \
glibc.i686 \
fuse \
fuse-devel \
ncurses \
ncurses-devel

# some qt-installer dependencies
RUN cd /tmp/downloads && \
yum install -y unixODBC-2.3.1-14.el7.x86_64.rpm && \
yum install -y libxkbcommon-x11-0.7.1-3.el7.x86_64.rpm && \
yum install -y postgresql-devel-9.2.24-4.el7_8.x86_64.rpm && \
yum install -y mysqlclient16-5.1.59-2.el6.art.x86_64.rpm && \
yum install -y p7zip-16.02-10.el7.x86_64.rpm && \
yum install -y p7zip-plugins-16.02-10.el7.x86_64.rpm && \
yum install -y pulseaudio-libs-devel && \
yum install -y gstreamer-plugins-base && \
yum install -y mariadb-devel

# newer cmake
RUN cd /tmp/downloads && \
tar -zxvf cmake-3.6.2.tar.gz && \
cd cmake-3.6.2 && \
./bootstrap --prefix=/usr/local && \
make && \
make install && \
cd ..

# install qt and qt-tools
COPY qt5.6.3-headless.qs /tmp/downloads/qt5.6.3-headless.qs
COPY qtifw-3.1.1-headless.qs /tmp/downloads/qtifw-3.1.1-headless.qs
RUN cd /tmp/downloads && \
chmod +x qt-opensource-linux-x64-5.6.3.run && \
chmod +x QtInstallerFramework-linux-x64.run && \
./qt-opensource-linux-x64-5.6.3.run -platform minimal --script qt5.6.3-headless.qs --verbose && \
./QtInstallerFramework-linux-x64.run -platform minimal --script qtifw-3.1.1-headless.qs --verbose && \
mv linuxdeployqt-6-x86_64.AppImage /opt/Qt/5.6.3/gcc_64/bin/linuxdeployqt && \
chmod +x /opt/Qt/5.6.3/gcc_64/bin/linuxdeployqt

RUN \
ln -s /opt/Qt/5.6.3/gcc_64/bin/qmake /usr/bin/qmake && \
ln -s /opt/Qt/5.6.3/gcc_64/bin/linuxdeployqt /usr/bin/linuxdeployqt && \
ln -s /opt/QtIFW-3.1.1/bin/binarycreator /usr/bin/binarycreator

# install jq to ba able to parse REST API responses from bash
RUN cd /tmp/downloads && \
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
mv jq-linux64 /usr/bin/jq && \
chmod +x /usr/bin/jq

# cleanup
RUN rm -rf /tmp/downloads

# set jenkins user back
USER ${user}
