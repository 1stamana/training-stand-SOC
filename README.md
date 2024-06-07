## Требования

Для успешной установки и использования учебного стенда вам понадобятся:

- Среда виртуализации VirtualBox
- Vagrant для автоматизации развертывания
- Минимум 8 ГБ ОЗУ и 60 ГБ свободного места на жестком диске
- Доступ в интернет для загрузки необходимых пакетов и обновлений

## Описание
Для разворачивания стенда необходимо выполнить предустановку программного обеспечения vagrant из репозитория в обход блокировок.
`https://hashicorp-releases.yandexcloud.net/vagrant/`

Скачать образы виртуальных машин по ссылке

Образы виртуальных машин и `vagrantfile` должны быть в одной директории.

В директории с vagrantfile выполить:

`vagrant up`

Разворачивание стенда займет от 5 минут, не считая времени загрузки образов.
______
## Как начать
Для запуска атаки необходимо выполнить команду:

`vagrant ssh attack -c "cd /home && sudo ./main.sh"`

Чтобы начать процесс отслеживания действии злоумшленника, необходимо создать пользователя в elasticsearch:

`vagrant ssh elk -c '/home/./elastic.sh'`

Kibana будет доступа по адресу `127.0.0.1:5601`

