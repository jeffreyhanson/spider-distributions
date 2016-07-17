#### set default error message
# parse args
args <- commandArgs(TRUE)
if (length(args)>0) {
	print(args)
	if (grepl('MODE',args))
		MODE <- strsplit(grep('MODE', args, value=TRUE), '=', fixed=TRUE)[[1]][[2]]
}
	
#### Load pacakges
# load CRAN packages
suppressMessages(library(stats))
suppressMessages(library(ggmap))
suppressMessages(library(magrittr))
suppressMessages(library(R2jags))
suppressMessages(library(RColorBrewer))
suppressMessages(library(fields))
suppressMessages(library(Hmisc))
suppressMessages(library(data.table))
suppressMessages(library(grid))
suppressMessages(library(gridExtra))
suppressMessages(library(plotrix))
suppressMessages(library(plyr))
suppressMessages(library(dplyr))
suppressMessages(library(tidyr))
suppressMessages(library(pander))
suppressMessages(library(vegan))
suppressMessages(library(rgdal))
suppressMessages(library(rgeos))
suppressMessages(library(raster))
suppressMessages(library(testthat))
suppressMessages(library(parallel))
suppressMessages(library(rworldxtra))
suppressMessages(library(doParallel))
suppressMessages(library(english))
suppressMessages(library(session))
suppressMessages(library(maptools))
suppressMessages(library(RcppTOML))
suppressMessages(library(knitr))
suppressMessages(library(lazyWeave))
suppressMessages(library(broom))

# set pander options
panderOptions('knitr.auto.asis', FALSE)

# set seed for reproducibility
set.seed(500)

# set default select method
select <- dplyr::select

### Load functions
for (x in dir(file.path('code', 'R', 'functions'), full.names=TRUE)) source(x)

### set parameters
if (!exists('MODE')) MODE <- 'debug'
cat('MODE = ',MODE,'\n')
general.params.LST <- parseTOML('code/parameters/general.toml')

# save workspace
save.session('data/intermediate/00-initialization.rda', compress='xz')


