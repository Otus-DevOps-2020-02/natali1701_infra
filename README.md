# natali1701_infra
natali1701 Infra repository
## 2 способа подключения к someinternalhost в одну команду из рабочего устройства
***Способ 1***
1)в /etc/hosts прописать ip и localhost на всех ВМ
2)Update YUM with Cloud SDK repo information:
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
3)yum install google-cloud-sdk #Install the Cloud SDK
4)export CLOUDSDK_PYTHON = python3 #без этого у меня ругался на python2
5)gcloud init - войти в свою учетную запись Google, выбрать нужный проект
6)gcloud beta compute ssh  "someinternalhost" и я попадаю из моего рабочего устройства сразу на someinternalhost

Прописать в ~/.bashrc alias someinternalhost='gcloud beta compute ssh  "someinternalhost"'
PROFIT =) вызывается даже одной командой someinternalhost

***Способ 2***
1)ssh -J  appuser@bastion appuser@someinternalhost ходим одной командой
2)в ~.ssh/config прописываем
Host bastion
        HostName bastion
        IdentityFile ~/.ssh/appuser
        User appuser

Host someinternalhost
        HostName someinternalhost
        IdentityFile ~/.ssh/appuser
        Port 22
        User appuser
        ProxyCommand ssh -q -W %h:%p bastion

3) [root@git ~]# ssh someinternalhost
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.15.0-1058-gcp x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage


0 packages can be updated.
0 updates are security updates.


Last login: Mon Apr  6 06:39:27 2020 from 10.132.0.3


bastion_IP = 35.189.194.18
someinternalhost_IP = 10.132.0.5

