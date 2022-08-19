#!/usr/bin/env bash
if [ $2 -eq 1 ]
then
jupyter nbconvert --to markdown  "$1/notebook.ipynb" --template codecellhider
elif [ $2 -eq 2 ]
then
jupyter nbconvert --to markdown  "$1/notebook.ipynb" --no-prompt --no-input
else
jupyter nbconvert --to markdown  "$1/notebook.ipynb"
fi
cat "$1/header.md" | grep -Pzo "(?s)(\-{3}(.*?)\-{3})" | sed 's/\x0/\n\n/g' | cat - "$1/notebook.md" | sed "s/notebook_files/files/g" > "$1/index.md"
rm -r "$1/files"
mv "$1/notebook_files" "$1/files"
rm "$1/notebook.md"
