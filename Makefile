file=resume
author=skanda
totalfile=${author}-${file}

pdf: 
		latex --shell-escape -jobname=${totalfile} ${file}.tex
		dvipdfm ${totalfile}.dvi
		rm *.dvi

read:
		open ${totalfile}.pdf &

clean:
		rm -rf *.log *.aux missfont.log _minted* texput.log *.out *.dvi

mpc:
		latex --shell-escape -jobname=${totalfile} ${file}.tex
		dvipdfm ${totalfile}.dvi
		rm -rf *.log *.aux missfont.log _minted* texput.log *.out *.dvi
		open ${totalfile}.pdf &

