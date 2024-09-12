#!/bin/sh

echo "Running rm-tex.sh"

find . -type f \( -name "*.xdv" -o -name "*.aux" -o -name "*.log" -o -name "*.lot" -o -name "*.out" -o -name "*.ilg" -o -name "*.idx" -o -name "*.ind" -o -name "*.toc" -o -name "*.bbl" -o -name "*.blg" -o -name "*.fdb_latexmk" -o -name "*.fls" -o -name "*.lof" -o -name "*.synctex(busy)" -o -name "*.synctex.gz" \) -delete

echo "rm-tex.sh completed"