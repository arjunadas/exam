#!/bin/bash
#1. получаем список файлов
ls -d /etc/*.conf  > /tmp/list.txt

#2. помещаем их в архив tar.gz.

# задаём формат времени
name=$(date '+%Y-%m-%dT%T')

# получаем путь для сохранения
read -p "Введите путь, куда вы хотите поместить архив. Например: /tmp/arch  " path_name

# создаём папку
mkdir -p $path_name

# создаём архив, и складываем его в $path_name
tar -czf $path_name/archive-$name.tar.gz -T /tmp/list.txt


# получить КОЛ-ВО файлов в папке
a=$(ls $path_name | wc -l)

# если файлов в папке больше 5, удаляем самый старый архив
if [ $a -gt 5 ]; then
echo "файлов больше 5, удаляем самый старый архив"
find $path_name/ -type f -printf "%T@ %p\n" | sort -n | head -n 1 | awk '{print $2}' | xargs rm -f
fi

