## load .rda
session::restore.session('data/intermediate/00-initialization.rda')

## load data
# load spider observations
inp.PTHS <- dir('data/raw/observations', pattern='^.*CSV$', recursive=TRUE, full.names=TRUE)
inp.DF <- ldply(inp.PTHS, fread, data.table=FALSE)
names(inp.DF)[7] <- 'Transect_Number'
names(inp.DF) <- gsub(' ', '_', names(inp.DF), fixed=TRUE)
inp.DF <- inp.DF %>% mutate(
	Time=as.POSIXct(strptime(Time, '%I:%M:%S %p')),
	Hole_Diameter=as.numeric(Hole_Diameter),
	Longitude=as.numeric(Longitude),
	Latitude=as.numeric(Latitude)
)

# load transect locations
transect.DF <- fread('data/raw/transect_landmarks/transect_landmarks.csv', data.table=FALSE)

# load walking path
walk.SHP <- shapefile('data/raw/walking_track/walkLNS') %>%
	spTransform(CRS('+init=epsg:4326')) %>%
	gLineMerge() %>%
	SpatialLinesDataFrame(data=data.frame(id=1))

## save .rda
save.session('data/intermediate/01-load-data.rda', compress='xz')

