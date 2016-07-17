## global variables
# set parameters for inference 
# MODE=release 
# set parameters for debugging code
MODE=release

# main operations
all: analysis manuscript

clean:
	@rm -f *.aux *.bbl *.blg *.log *.pdf *.bak *~ *.Rout */*.Rout */*.pdf */*.aux */*.log *.rda */*.rda */*/*.rda data/intermediate/*.rda data/intermediate/*.Rout
	@rm data/intermediate/structure -rf
	@rm data/intermediate/bayescan -rf
	@rm data/intermediate/pcadapt -rf
	@rm code/rmarkdown/article_files/figure-latex/* -f
	@rm code/rmarkdown/supporting_information_files/figure-latex/* -f
	@rm code/rmarkdown/supporting_information.tex -f
	@rm code/rmarkdown/supporting_information.md -f
	@rm code/rmarkdown/supporting_information.docx -f
	@rm code/rmarkdown/supporting_information.pdf -f
	@rm code/rmarkdown/article.md -f
	@rm code/rmarkdown/article.pdf -f
	@rm article/*.csv -f

# commands for generating manuscript
manuscript: article

article: article/article.pdf

article/article.pdf: code/rmarkdown/article.Rmd code/rmarkdown/references.bib code/rmarkdown/reference-style.csl
	R -e "rmarkdown::render('code/rmarkdown/article.Rmd')"
	mv code/rmarkdown/article.pdf article/
	rm article/article.md -f
	rm article/article.utf8.md -f

# commands for running analysis
analysis: data/final/results.rda

data/final/results.rda: data/intermediate/03-*.rda code/R/analysis/04-*.R
	R CMD BATCH --no-restore --no-save code/R/analysis/04-*.R
	mv *.Rout data/intermediate/

data/intermediate/03-*.rda: data/intermediate/02-*.rda code/R/analysis/03-*.R code/parameters/jags.toml
	R CMD BATCH --no-restore --no-save code/R/analysis/03-*.R
	mv *.Rout data/intermediate/

data/intermediate/02-*.rda: data/intermediate/01-*.rda code/R/analysis/02-*.R
	R CMD BATCH --no-restore --no-save code/R/analysis/02-*.R
	mv *.Rout data/intermediate/

data/intermediate/01-*.rda: data/intermediate/00-*.rda code/R/analysis/01-*.R
	R CMD BATCH --no-restore --no-save code/R/analysis/01-*.R
	mv *.Rout data/intermediate/

data/intermediate/00-*.rda: code/R/analysis/00-*.R code/parameters/general.toml data/raw/*
	R CMD BATCH --no-restore --no-save '--args MODE=$(MODE)' code/R/analysis/00-*.R
	mv *.Rout data/intermediate/



