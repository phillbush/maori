SRCS = 0intro.txt 1fonetica.txt 2morfologia.txt 3sintaxe.txt 4vocabulario.txt
DOCS = ${SRCS:.txt=.pdf}

.SUFFIXES: .txt .ms .ps .pdf .html

all: ${DOCS}

.ps.pdf:
	ps2pdf $< $@

.ms.ps:
	 <$< pic | tbl | troff -ms -mpictures | dpost >$@

.txt.ms:
	<$< incipit -T ms >$@

clean:
	-rm *.ms *.ps *.pdf

.PHONY: all clean
