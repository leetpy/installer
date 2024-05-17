#!/bin/bash

# check user
if [ "$UID" -ne 0 ]; then
    echo "You are not running as root, please run as root and try again."
    exit 1
fi

# install createrepo rpms
rpm -qi createrepo &> /dev/null
if [ $? -ne 0 ]; then
    rpm -ivh rpms/createrepo/*.rpm
fi

# copy rpms
mr_dir="/var/lib/mr_repo"
if [ -d ${mr_dir} ]; then
    mv ${mr_dir} ${mr_dir}.$(date +"%Y%m%d%H%M%S")
fi

mv rpms ${mr_dir}

# copy repo files
repo_file="/etc/yum.repos.d/mr.repo"
if [ -f ${repo_file} ]; then
    rm -rf ${repo_file}
fi
mv config/mr.repo ${repo_file}

# make repo
cd ${mr_dir}
createrepo .
cd -

# add alias
cat /root/.bashrc | grep -w 'xyum' &> /dev/null
if [ $? -ne 0 ]; then
  echo 'alias xyum="yum --disablerepo=* --enablerepo=mr"' >> /root/.bashrc
fi

source /root/.bashrc