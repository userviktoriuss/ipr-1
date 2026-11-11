#!/bin/bash

# вывести первый столбец
awk '{print $1}' employees.txt

# вывести имя сотрудника и зарплату
awk '{print $1, $3}' employees.txt

# вывести сотрудников с зарплатой больше 100000
awk '$3 > 100000 {print $1, $2, $3}' employees.txt

# работа с csv
awk -F',' '{print $1, $2}' employees.csv

# каждая строка в файле вместе с номером
awk '{ print NR,$0}' employees.txt

# 6) количество сотрудников отдела it
awk '$2 == "IT" {sum += 1} END {print sum}' employees.txt

# 7) сумма зарплат всех сотрудников
awk '{sum += $3} END {print sum}' employees.txt

# 8) средняя зарплата сотрудников
awk '{sum += $3} END {print sum/NR}' employees.txt

# 9) сотрудник с максимальной зарплатой
awk '(NR == 1 || max < $3) {max=$3; name=$1} END {print name, max}' employees.txt

# 10) кол-во сотрудников в каждом отделе
awk '{cnt[$2]++} END {for (dep in cnt) print dep, cnt[dep]}' employees.txt
