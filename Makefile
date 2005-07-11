DVIPSFLAGS=-t landscape

PS = cc_walsh.ps cc_inv_bergen.ps cc_basic.ps cc_forumd.ps
PDF = $(patsubst %.ps,%.pdf,$(PS))

#quick: cc_walsh.ps

all: $(PS) $(PDF)

cc_walsh.dvi: miniDBV2.sty
cc_inv_bergen.dvi: miniDBV.sty

%.dvi: %.tex
	latex $<
	latex $<

%.ps: %.dvi
#	dvips $(DVIPSFLAGS) -o - $< | pstops '2:0,1U(21cm,29.7cm)' > $@
	dvips $(DVIPSFLAGS) -o - $< > $@

%.pdf: %.tex %.dvi
	pdflatex $<

clean:
	rm -f $(PS) $(PDF) cc_*.dvi *.aux *.log
