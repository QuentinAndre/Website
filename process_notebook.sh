#!/usr/bin/env bash
if [ $2 -eq 1 ]
then
jupyter nbconvert --to markdown  "$1/notebook.ipynb" --template CodeCellHider
else
jupyter nbconvert --to markdown  "$1/notebook.ipynb"
fi
cat "$1/index.md" | grep -Pzo "(?s)(\-{3}(.*?)\-{3})" | sed 's/\x0/\n\n/g' | cat - "$1/notebook.md" > "$1/index.md"
rm "$1/notebook.md"