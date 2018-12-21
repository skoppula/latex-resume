#!/bin/bash

file="resume"
author="skanda"
totalfile="$author-$file"

# Compile the tex file
pdflatex --shell-escape -jobname=$totalfile ${file}.tex

cd papers-page
./build.sh
cd ..

echo "pdftk ${file}.pdf papers-page/papers.pdf output ${file}-with-papers.pdf"
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dAutoRotatePages=/None -sOutputFile="${totalfile}-with-papers-page.pdf" ${totalfile}.pdf papers-page/skanda-papers.pdf

# Cleanup the junk
rm -rf *.log *.aux missfont.log _minted* texput.log *.out *.dvi

if [ "$(uname)" == "Darwin" ]; then
    open ${totalfile}.pdf &
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    evince ${totalfile}.pdf &
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo 'Windows not supported!'
fi
