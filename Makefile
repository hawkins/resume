# Get today's date for use in the resume name
DATE = $(shell date +%Y-%m-%d)
RESUME = Josh_Hawkins_Resume_$(DATE).pdf

# xelatex can be easily installed via TeX Live
# See https://www.tug.org/texlive/acquire-netinstall.html
TEX = xelatex

all: resume

$(RESUME): resume.tex resume.cls
	$(TEX) $<
	mv resume.pdf $(RESUME)
	$(RM) *.log *.aux *.out
	
resume: $(RESUME)

clean:
	-$(RM) *.pdf