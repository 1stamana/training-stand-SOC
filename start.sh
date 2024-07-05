#!/bin/bash
sleep 30
# Путь к файлу журнала
log_path="/var/log/mysql/general.log"

# Регулярное выражение для поиска строки запроса UPDATE
pattern="UPDATE wp_posts SET post_content = '(.*?)' WHERE ID = 1"

# Текст, на который нужно заменить найденную строку
replacement="flag"

# Основной цикл, который будет выполняться каждую секунду
while true; do
    if grep -qE "${pattern}" "$log_path"; then
        # Выполнение SQL-запроса к базе данных
        mariadb -u root -p123 wordpress333 -e "UPDATE wp_posts SET post_content = '${replacement}' WHERE ID = 1"
        sleep 1
    else
        echo "Шаблон не найден в файле лога."
        sleep 1
    fi
done
 

# Запуск переданных команд на выполнение в текущем окружении
