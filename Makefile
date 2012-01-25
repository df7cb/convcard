DVIPSFLAGS=-t landscape

CC = $(wildcard cc_*.tex)
PS = $(patsubst %.tex,%.ps,$(CC))
PDF = $(patsubst %.tex,%.pdf,$(CC))

#quick: cc_moscito05.dvi

all: $(PDF)
ps: $(PS)
pdf: $(PDF)

cc_walsh.dvi: miniDBV2.sty defense.tex
cc_inv_bergen.dvi: miniDBV.sty
cc_moscito05.dvi: miniDBV2.sty defense.tex

%.dvi: %.tex
	latex $<
	latex $<

%.ps: %.dvi
#	dvips $(DVIPSFLAGS) -o - $< | pstops '2:0,1U(21cm,29.7cm)' > $@
	dvips $(DVIPSFLAGS) -o - $< > $@

cc_kantner_berg.pdf: miniDBVzocker.sty

%.pdf: %.tex
	pdflatex $<
	pdflatex $<

clean:
	rm -f $(PS) $(PDF) cc_*.dvi *.aux *.log
