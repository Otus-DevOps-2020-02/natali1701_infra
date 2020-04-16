## HW2 - Cпособы подключения к someinternalhost в одну команду из рабочего устройства

***Способ 1***

1) в /etc/hosts прописать ip и localhost на всех ВМ

2) Update YUM with Cloud SDK repo information:

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

3) yum install google-cloud-sdk #Install the Cloud SDK

4) export CLOUDSDK_PYTHON = python3 #без этого у меня ругался на python2

5) gcloud init - войти в свою учетную запись Google, выбрать нужный проект

6) gcloud beta compute ssh  "someinternalhost" и я попадаю из моего рабочего устройства сразу на someinternalhost

Прописать в ~/.bashrc alias someinternalhost='gcloud beta compute ssh  "someinternalhost"'

PROFIT =) вызывается даже одной командой someinternalhost

***Способ 2***

1) ssh -J  appuser@bastion appuser@someinternalhost ходим одной командой

2) в ~.ssh/config прописываем

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
 
## HW3 - Знакомство с облачной инфраструктурой и облачными сервисами

bastion_IP = 35.189.194.18 

someinternalhost_IP = 10.132.0.5

## HW4 - Основные сервисы Google Cloud Platform (GCP) 

gcloud compute instances create example-instance \
    --boot-disk-size=10GB \
    --image-family ubuntu-1604-lts \
    --image-project=ubuntu-os-cloud \
    --machine-type=g1-small \
    --tags puma-server \
    --restart-on-failure \
    --zone europe-west1-d \
    --metadata-from-file startup-script=startup-script.sh 

testapp_IP = 104.155.9.200 testapp_port = 9292

***Создание правила для firewall из консоли с помощью gcloud***

gcloud compute --project=infra-273217 firewall-rules create default-puma-server --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:9292 --source-ranges=0.0.0.0/0 --target-tags puma-server

