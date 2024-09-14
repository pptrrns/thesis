#!/bin/sh

echo "Running pre-commit hook in directory: $(pwd)"

for bib_file in $(find . -type f -name "*.bib"); do
  if [ -f "$bib_file" ]; then
    echo "Tidying $bib_file"
    # Pasar el archivo como argumento directamente sin "--modify" ya que bibtex-tidy lo modifica automáticamente
    bibtex-tidy --curly --numeric --months --modify --space=4 --tab --strip-enclosing-braces --sort=key --duplicates=doi --omit=abstract,keywords --drop-all-caps --sort-fields=author,title,year --remove-empty-fields --escape --encode-urls references.bib
  fi
done

echo "Pre-commit hook completed."
