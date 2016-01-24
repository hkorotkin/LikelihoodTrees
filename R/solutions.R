#Do analysis on morphology.
InferMorphologyTree_solution <- function(input.path = "inst/extdata/", input.file = "binary.phy", output.path="~/Desktop/", output.name = "morpho1", random.seed=12345, model="ASC_BINGAMMA", other='--asc-corr=lewis') {
	system(paste("cp ", input.path, input.file, " ", output.path,input.file, sep=""))
	cur.wd <- getwd()
	setwd(output.path)
	raxml.call <- paste("raxmlHPC -m ", model, " -p ", random.seed, " -s ", input.file, " ", other, " -n ", output.name, sep="")
	status <- system(raxml.call)
	parsimony.tree <- read.tree(paste("RAxML_parsimonyTree.",output.name, sep=""))
	ml.tree <- read.tree(paste("RAxML_bestTree.",output.name, sep=""))
	setwd(cur.wd)
	return(list(parsimony.tree=parsimony.tree, ml.tree=ml.tree))
}

