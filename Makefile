TARGET := main
TEX := uplatex
BIBTEX := upbibtex

.PHONY: all clean distclean

all: $(TARGET).pdf

#$(TARGET).dvi: $(TARGET).pdf

clean:
	$(RM) *.aux *.log *.dvi ${TARGET}.pdf

%.pdf: %.dvi
	dvipdfmx $<

%.dvi: %.tex
	${TEX} -interaction=batchmode $(TARGET)
	-${BIBTEX} $(TARGET)
	${TEX} -interaction=batchmode $(TARGET)
	${TEX} -interaction=batchmode $(TARGET)
