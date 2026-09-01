# latexmk configuration for the Deedy CV/Resume template
# Build:   latexmk
# Clean:   latexmk -c
$pdf_mode = 5; # Generate PDF via XeLaTeX
$xelatex = 'xelatex -file-line-error -interaction=nonstopmode -synctex=1 %O %S';
$bibtex_use = 0; # No bibliography
$clean_ext = 'synctex.gz xdv run.xml';
