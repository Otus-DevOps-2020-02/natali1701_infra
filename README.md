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

testapp_IP = 104.155.9.200

testapp_port = 9292

***Создание правила для firewall из консоли с помощью gcloud***

gcloud compute --project=infra-273217 firewall-rules create default-puma-server --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:9292 --source-ranges=0.0.0.0/0 --target-tags puma-server

