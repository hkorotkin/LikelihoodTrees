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

InferDNATreeWithBootstrappingAndPartitions_solution <- function (input.path = "inst/extdata/", input.file = "dna.phy", input.partition = "dna12_3.partition.txt", output.path="~/Desktop/", output.name = "dna1", random.seed=12345, boot.seed=12345, model="GTRGAMMA", boot=100) {
	system(paste("cp ", input.path, input.file, " ", output.path,input.file, sep=""))
	system(paste("cp ", input.path, input.partition, " ", output.path,input.partition, sep=""))
	cur.wd <- getwd()
	setwd(output.path)
	raxml.call <- paste("raxmlHPC -f a  -k -m ", model, " -p ", random.seed, " -x ", boot.seed, " -q ", input.partition, " -# ", boot, " -s ", input.file, " -n ", output.name, sep="")
	status <- system(raxml.call)
	
	ml.tree <- read.tree(paste("RAxML_bestTree.",output.name, sep=""))
	ml.with.bs.tree <- read.tree(paste("RAxML_bipartitions.",output.name, sep=""))
	bs.trees <- read.tree(paste("RAxML_bootstrap.",output.name, sep=""))
	setwd(cur.wd)
	return(list( ml.tree=ml.tree, ml.with.bs.tree=ml.with.bs.tree, bs.trees))
}