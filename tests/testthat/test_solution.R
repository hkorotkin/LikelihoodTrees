test_that("InferMorphologyTree_solution",{
	results <- InferMorphologyTree_solution(output.path=temp.dir())
	expect_is(results$parsimony.tree, "phylo")
	expect_is(results$ml.tree, "phylo")
	expect_true(is.null(results$parsimony.tree$edge.length))
	expect_false(is.null(results$ml.tree$edge.length))
})

test_that("InferDNATreeWithBootstrappingAndPartitions_solution",{
	results <- InferDNATreeWithBootstrappingAndPartitions_solution(output.path=temp.dir())
	expect_is(results$ml.tree, "phylo")
	expect_false(is.null(results$ml.with.bs.tree$node.label))
	expect_equals(length(results[[3]]), 100)
})

