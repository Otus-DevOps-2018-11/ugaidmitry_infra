ДЗ 5

1)Подключние к someinternalhost в одну команду: ssh someinternalhost
Создаем файл ~/.ssh/config с описание хостов, пользователей и команд:
Host bastion
hostname 35.204.48.189
user dima

Host someinternalhost
hostname 10.164.0.3
user dima
proxycommand ssh bastion -W %h:%p

    VPN-сервер Pritunl Параметры подключения:

bastion_IP = 35.204.48.189
someinternalhost_IP = 10.164.0.3



