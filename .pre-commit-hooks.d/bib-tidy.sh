#!/bin/sh

echo "Running pre-commit hook in directory: $(pwd)"

for bib_file in $(find . -type f -name "*.bib"); do
  if [ -f "$bib_file" ]; then
    echo "Tidying $bib_file"
    # Pasar el archivo como argumento directamente sin "--modify" ya que bibtex-tidy lo modifica automáticamente
    bibtex-tidy --curly --numeric --months --modify --space=4 --tab --strip-enclosing-braces --sort --drop-all-caps "$bib_file"
  fi
done

echo "Pre-commit hook completed."