#! /bin/bash
VERSION=jenkins-2.230-1.1.noarch.rpm
yum localinstall -y $VERSION
systemctl start jenkins
if [ $? -eq 0 ] 
  then
    echo "successfully installed"
  else
    echo "failed"
    echo "please make sure 8080 not been used"
    exit
fi
echo "password as below:"
cat /var/lib/jenkins/secrets/initialAdminPassword 
echo "access jenkins with IP:8080"
echo "after begin to download the plugins, you can update the default.json to speedup the download, remember to restart jenkins"
echo "file dir is /var/lib/jenkins/updates/"
echo "sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json"
