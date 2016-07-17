## load .rda
session::restore.session('data/intermediate/02-process-data.rda')

## load parameters
jags.params.LST <- parseTOML('code/parameters/jags.toml')

## setup jags
# model file
cat('
model {
	# Priors
	lambda ~ dunif(0, 50)
	p ~ dunif(0, 1)
	
	# Likelihood
	for (i in 1:n.sites) {
		# True state model for the only partially observed true state
		site.number[i] ~ dpois(lambda) # True abundance state N at site i
		for (j in 1:n.visits) {
			# Observation model for the actual observations
			obs.MTX[i,j] ~ dbin(p, site.number[i]) # Counts at i and j
		}
		site.occupancy[i] <-step(site.number[i]-1) # Occurrence indicator
	}
	
	# Derived quantities
	total.number <- sum(site.number[]) # Total population size ar R sites
}
', file='data/intermediate/jags_model.txt')


## run jags
jags.fit <- jags(
	data=list('n.sites'=nrow(obs.MTX), 'n.visits'=ncol(obs.MTX), 'obs.MTX'=obs.MTX), 
	init=function() {list('site.number'=(apply(obs.MTX, 1, max)+1))},
	parameters.to.save=c('p','lambda', 'site.occupancy', 'site.number', 'total.number'),
	model.file='data/intermediate/jags_model.txt',
	n.iter=jags.params.LST[[MODE]]$iterations, n.chains=jags.params.LST[[MODE]]$chains,
	n.burnin=jags.params.LST[[MODE]]$burnin, n.thin=jags.params.LST[[MODE]]$thin
) 

## save .rda
save.session('data/intermediate/03-statistical-analysis.rda', compress='xz')

 
 
