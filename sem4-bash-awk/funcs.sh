#!/bin/bash

# 6) функция для проверки существования каталога
dir_exists() {
    if [[ -d "$1" ]]; then
        echo "$d exists"
    else
        echo "$d does not exist"
    fi
}

# 7) подсчет строк
lines_count() {
    wc -l < $1
}

# 8) поиск по каталогу + расширению
find_files() {
  find "$1" -name "*.$2"
}

# 9) добавить дату и сообщение в файл
log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') $*" >> app.log
}

# 10) анализатор логов
count_level() {
  grep -c "$2" "$1"
}