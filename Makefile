DVIPSFLAGS=-t landscape

all: cc_walsh.ps cc_inv_bergen.ps

cc_walsh.dvi: miniDBV.sty
cc_inv_bergen.dvi: miniDBV.sty

clean:
	rm -f cc_*.ps cc_*.dvi *.aux *.log
