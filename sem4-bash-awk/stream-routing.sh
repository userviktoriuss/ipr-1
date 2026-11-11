#!/bin/bash

# 6) развести stderr и stdout по разным файлам
ls /tmp /nos_such_file 1> out.txt 2> err.txt

# 7) stdout и stderr в 1 файл
ls /tmp /nos_such_file > all.txt 2>&1

# 8) вывод на экран и запись в файл одновременно
ls /tmp | tee all.txt

# 9) Добавить текущую дату в events.log, одновременно выводя её в терминал
date | tee -a events.log

# 10) Найти 5 самых частых IP в access.log, показать результат и сохранить в top_ip.txt
awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -n 5 | tee top_ip.txt
