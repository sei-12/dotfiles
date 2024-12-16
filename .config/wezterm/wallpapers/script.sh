#!/bin/bash


source ./venv/bin/activate

target_dir="./downloads/猫使ビィ フリー立ち絵素材/"

for file in $(ls "$target_dir" | grep png); do
	python3 main.py "$target_dir$file" 100 50 1900 1900 ./dist
done
