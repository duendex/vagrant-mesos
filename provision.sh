## Install Mesos prerequisites
apt-get update
apt-get install --force-yes -y zookeeperd default-jre python-setuptools python-protobuf curl python-pip 
 
## Install Mesos
curl -fL http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.19.0~ubuntu14.04%2B1_amd64.deb -o /tmp/mesos.deb
dpkg -i /tmp/mesos.deb
 
## Install the updated Mesos Python egg, for use in authoring frameworks
curl -fL http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.19.0_rc2-py2.7-linux-x86_64.egg -o /tmp/mesos.egg
easy_install /tmp/mesos.egg
 
## Install Deimos
pip install deimos
 
## Install the Marathon Deb package, built from this branch:
##   https://github.com/mesosphere/marathon/tree/wip-container-info
curl -fL http://downloads.mesosphere.io/marathon/marathon_0.5.0-xcon2_noarch.deb -o /tmp/marathon.deb
dpkg -i /tmp/marathon.deb
 
## To configure Mesos to use Deimos, you need to set the contents
## of two files:
 
mkdir -p /etc/mesos-slave
echo /usr/local/bin/deimos | sudo dd of=/etc/mesos-slave/containerizer_path
echo external              | sudo dd of=/etc/mesos-slave/isolation
 
 
## Install Docker
apt-get install --force-yes -y linux-image-extra-"$(uname -r)" 
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo 'deb http://get.docker.io/ubuntu docker main' | sudo dd of=/etc/apt/sources.list.d/docker.list
apt-get update
apt-get install --force-yes -y lxc-docker 
 
## It might be helpful to pre-cache the `libmesos` Docker image,
## used for custom executors:
sudo docker pull libmesos/ubuntu:13.10
 
