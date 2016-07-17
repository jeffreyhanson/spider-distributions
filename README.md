Distribution of funnel web spiders on Fraser Island
===================================================

[Jeffrey O. Hanson](wwww.jeffrey-hanson.com)

Correspondance should be addressed to [jeffrey.hanson@uqconnect.edu.au](mailto:jeffrey.hanson@uqconnect.edu.au)

Source code for the manuscript entitled "_Distribution of funnel web spiders on Fraser Island_". 

[Click here]() to download the manuscript. *Please note that it is as a joke and should not be taken seriously.*

Fork this repository and execute `make clean && make all` rerun all computational analyses.

### Repository overview

* article
	+ manuscript main text, figures and tables
* data
	+ _raw_: raw data used to run the analysis
	+ _intermediate_: results generated during processing (eg. BayeScan output files)
	+ _final_: results used in the paper
* code
	+ [_R_](www.r-project.org): scripts used to run the analysis 
	+ _parameters_: files used to run analysis in [TOML format](https://github.com/toml-lang/toml)
	+ [_rmarkdown_](wwww.rmarkdown.rstudio.com) files used to compile them manuscript

### Software required

* Operating system
	+ Ubuntu (Trusty 14.04 LTS)
* Programs
	+ R (version 3.2.3)
	+ GNU make
	+ pandoc
	+ pandoc-citeproc
	+ LaTeX

