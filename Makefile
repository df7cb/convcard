DVIPSFLAGS=-t landscape

all: cc_walsh.ps cc_inv_bergen.ps cc_basic.ps cc_forumd.ps

cc_walsh.dvi: miniDBV.sty
cc_inv_bergen.dvi: miniDBV.sty

%.dvi: %.tex
	latex $<
	latex $<

%.ps: %.dvi
	#dvips $(DVIPSFLAGS) -o - $< | pstops '2:0,1U(21cm,29.7cm)' > $@
	dvips $(DVIPSFLAGS) -o - $< > $@

clean:
	rm -f cc_*.ps cc_*.dvi *.aux *.log
