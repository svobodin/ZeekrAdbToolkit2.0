#!/bin/bash

# Создаем папку decompiled в текущей директории
OUTPUT_FOLDER="decompiled"
mkdir -p "$OUTPUT_FOLDER"

# Перебираем все APK файлы в текущей папке и декомпилируем их
for apk_file in *.apk; do
    if [ -f "$apk_file" ]; then
        echo "Декомпиляция $apk_file..."
        apktool d -f -o "$OUTPUT_FOLDER/$(basename "$apk_file" .apk)" "$apk_file"

        # Удаляем всё, кроме папки res
        decompiled_folder="$OUTPUT_FOLDER/$(basename "$apk_file" .apk)"
        find "$decompiled_folder" -mindepth 1 -maxdepth 1 ! -name 'res' -exec rm -rf {} +
    fi
done

echo "Все APK файлы декомпилированы и очищены."