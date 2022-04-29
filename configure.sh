#!/bin/sh

yum -y install centos-release-openstack-xena
yum -y upgrade

# Install OpenStack command line client
yum -y install python3-openstackclient jq

# Install MinIO client
curl -o /usr/bin/mc -L https://dl.min.io/client/mc/release/linux-amd64/mc
chmod 755 /usr/bin/mc

