ДЗ  host bastion

1)Подключние к someinternalhost в одну команду: ssh someinternalhost

Создаем файл ~/.ssh/config с описание хостов, пользователей и команд:

Host bastion
hostname 35.204.48.189
user dima

Host someinternalhost
hostname 10.164.0.3
user dima
proxycommand ssh bastion -W %h:%p

При подлключении на someinternalhost видим, что наша ssh-сессия открыта с bastionhost (см файл https://github.com/Otus-DevOps-2018-11/ugaidmitry_infra/blob/master/someinternalhost.png)


    VPN-сервер Pritunl:

bastion_IP = 35.204.48.189
someinternalhost_IP = 10.164.0.3

Подключение к Pritunl серверу с рабочего хоста: sudo openvpn --config cloud-bastion.vpn


Д.З 7

- Получены практические навыки работы с packer

- Создан шаблон packer для подготовки reddit-base образа. Шаблон находится в файле packer/ubuntu16.json. 
- Чувствительные переменные вынесены в файл переменных packer/variables.json.example


