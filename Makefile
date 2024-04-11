.PHONY : all clean help settings

COUNT=bin/countwords.py
RUN_COUNT=python3 $(COUNT) 
DATA = $(wildcard data/*.txt)
RESULTS=$(patsubst data/%.txt, results/%.csv,$(DATA))
COLLATE=bin/collate.py
PLOT=bin/plotcounts.py

## all : regenerate all results. 
all : results/collated.png

## results/collated.png: plot the collated results
results/collated.png : results/collated.csv
	python3 $(PLOT) $< --outfile $@

## results/%.csv : regenerate results for any book
results/collated.csv : $(RESULTS) $(COLLATE)
	mkdir -p results
	python3 $(COLLATE) $(RESULTS) > $@

## results/%.csv : regenerate results for any book
results/%.csv : data/%.txt $(COUNT) 
	python3 $(COUNT) $< > $@

# Remove all generated files 
clean: 
	rm -f results/*.csv

## settings : show variables' values
settings : 
	@echo COUNT: $(COUNT)
	@echo DATA: $(DATA)
	@echo RESULTS : $(RESULTS)
	@echo COLLATE : $(COLLATE)

## help : show this message. 
help : 
	@grep '^##' ./Makefile

