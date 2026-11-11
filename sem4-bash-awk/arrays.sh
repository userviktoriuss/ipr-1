#!/bin/bash

# 1
servers=(web db cache)
echo "${servers[1]}"

# 2
servers=(web db cache)
echo "${servers[@]}"

# 3
servers=(web db cache)
echo "${#servers[@]}"

# 4
servers=(web db cache)
servers+=(backup)
echo "${#servers[@]}"

# 5
todo

# 6) првоерить, есть ли db в массиве
found=no
for s in "${servers[@]}"; do
    if [[ "$s"=="db" ]]; then
        found=yes; break;
    fi
done

echo "$found"

# 7) вывести из массива числа больше 50
nums=(10 20 30 40 50 60 70)
for n in "${nums[@]}"; do
    if [[ $n -gt 50 ]]; then
        echo "$n"
    fi
done


# 9)
mapfile -d '' files < <(find . -type f -name "*.log" -print0)
printf '%s\n' "${files[@]}"

# 10)
mapfile -t users < <(sort -u users.txt)
printf '%s\n' "${users[@]}"
