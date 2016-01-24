test_that("InferMorphologyTree_solution",{
	results <- InferMorphologyTree_solution()
	expect_is(results$parsimony.tree, "phylo")
	expect_is(results$ml.tree, "phylo")
	expect_true(is.null(results$parsimony.tree$edge.length))
	expect_false(is.null(results$ml.tree$edge.length))
})

