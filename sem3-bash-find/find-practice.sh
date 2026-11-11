#!/usr/bin/env bash

# ----------------- find -----------------

# найти обычные файлы с расширением .csv или .json
find . -type f \( -name "*.csv" -o -name "*.json" \)

# Найти все .log-файлы, кроме файлов, имя которых начинается с debug
find . -type f -name "*.log" ! -name "debug*"

# Найти .log-файлы больше 5 МБ, изменённые за последние 3 дня
find . -type f -name "*.log" -size +5M -mtime 3

# Найти .tmp-файлы старше 30 дней и удалить их
find . -type f -name "*.tmp" -mtime +30 -delete

# Найти .log-файлы больше 10 МБ и вывести размер и путь каждого файла
find . -type f -name "*.log" -size +10M -exec du -h {} +;

# ----------------- grep -----------------

# В файле app.log найти все строки, содержащие ERROR
grep "ERROR" app.log

# Найти error независимо от регистра: ERROR, Error, error
grep -i "error" app.log

# Найти строки с ERROR и показать номер каждой найденной строки
grep -n "ERROR" app.log

# Определить, сколько строк файла содержит ERROR
grep -c "ERROR" app.log

# Вывести все строки файла, кроме содержащих DEBUG
grep -v "DEBUG" app.log

# Найти строки, содержащие ERROR или WARN
grep -E "ERROR|WARN" app.log

# Найти слово error, но не считать совпадениями error_code, errors и другие части слов
grep -iw "error" app.log

# Найти ERROR во всех файлах каталога logs и его подкаталогах
grep -rn "ERROR" ./logs

# Рекурсивно найти ERROR только в файлах с расширением .log
grep -r --include="*.log" "ERROR" .

# Найти в access.log все IPv4-подобные адреса и вывести только найденные значения, а не строки целиком
grep -oE "([0-9]{1,3}\.){3}([0-9]{1,3}})" access.log

# ----------------- wc -----------------

# Определить количество строк в файле app.log
wc -l app.log

# Определить количество слов в файле app.log
wc -w app.log

# Определить размер содержимого файла data.txt в байтах
wc -c data.txt

# Посчитать количество строк отдельно в app.log, error.log и access.log, а также получить общее количество
wc -m app.log

# Посчитать количество строк отдельно в app.log, error.log и access.log, а также получить общее количество
wc -l app.log error.log access.log

# Определить количество строк app.log, содержащих ERROR
grep "ERROR" app.log | wc -l

# Определить количество уникальных строк в users.txt
sort users.txt | uniq | wc -l

# Определить количество обычных файлов в текущем каталоге и всех подкаталогах
find . -type f | wc -l

# Определить количество файлов с расширением .log во всём каталоге logs
find ./logs -type f -name "*.logs" | wc -l

# Найти ERROR во всех .log-файлах каталога logs и определить общее количество найденных строк
grep -r --include="*.log" "ERROR" ./logs | wc -l


# ----------------- uniq -----------------
# В файле users.txt удалить повторяющиеся соседние строки
uniq users.txt

# Получить список уникальных пользователей, даже если одинаковые строки находятся в разных местах файла
sort users.txt | uniq

# Показать каждое уникальное имя пользователя и количество его появлений
sort users.txt | uniq -c
