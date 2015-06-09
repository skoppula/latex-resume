file=resume
author=skanda
totalfile=${author}-${file}

pdf: 
		pdflatex --shell-escape -jobname=${totalfile} ${file}.tex

read:
		evince ${totalfile}.pdf &

clean:
		rm -rf *.log *.aux missfont.log _minted* texput.log *.out

mpc:
		pdflatex --shell-escape -jobname=${totalfile} ${file}.tex
		rm -rf *.log *.aux missfont.log _minted* texput.log *.out
		evince ${totalfile}.pdf &

