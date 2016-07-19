## load .rda
session::restore.session('data/intermediate/01-load-data.rda')

### clean data
# remove extra rows
inp.DF %<>% filter(!is.na(Hole_Diameter))
# remove super large holes
inp.DF %<>% filter(Hole_Diameter < 100)
# remove rows missing transect numbers
inp.DF %<>% filter(Transect_Number != '')

### extract data for real holes
hole.DF <- filter(inp.DF, Hole_Diameter > 0)

### generate visit/transect table
# create initial table
visit.DF <- inp.DF %>% 
	group_by(Transect_Number,Date) %>%
	mutate(start=min(Time,na.rm=TRUE), end=max(Time,na.rm=TRUE)) %>%
	filter(Hole_Diameter > 0) %>%
	group_by(Transect_Number,Date) %>%
	summarise(observed=length(Date), start=first(start), end=first(end)) %>%
	mutate(search_time=as.numeric(difftime(end, start, units='mins')))

# add in missing zeros
all.dates <- unique(visit.DF$Date)
visit.DF <- ddply(visit.DF, c('Transect_Number'), function(x) {
	for (i in all.dates) {
		if (!i %in% x$Date) {
			x <- rbind(x, data.frame(Transect_Number=x$Transect_Number[1], Date=i, observed=0, start=NA, end=NA, search_time=NA))
		}
	}
	return(x)
}) %>% arrange(as.numeric(Transect_Number), Date)

# double counts in transects 9-16 because only one side was sampled in a visit
visit.DF$observed[which(as.numeric(visit.DF$Transect_Number)>8)] <- visit.DF$observed[which(as.numeric(visit.DF$Transect_Number)>8)]*2

### create matrix for jags
obs.MTX <- matrix(0, ncol=length(all.dates), nrow=n_distinct(visit.DF$Transect_Number))
for (i in seq_len(nrow(visit.DF))) {
	obs.MTX[as.numeric(visit.DF$Transect_Number[i]),match(visit.DF$Date[i], all.dates)] <- visit.DF$observed[i]
}

## save .rda
save.session('data/intermediate/02-process-data.rda', compress='xz')

 
