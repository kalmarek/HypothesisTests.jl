using HypothesisTests, Base.Test

@test isapprox(pvalue(ExactPermutationTest([1,2,3],[4,5,6],mean), tail=:both), 1.0)
@test isapprox(pvalue(ExactPermutationTest([4,5,6],[1,2,3],mean), tail=:both), 1.0)
@test isapprox(pvalue(ExactPermutationTest([1,2,3],[4,5,6],mean), tail=:left), 0.05)
@test isapprox(pvalue(ExactPermutationTest([4,5,6],[1,2,3],mean), tail=:right), 0.05)

srand(12345)
@test isapprox(pvalue(ApproximatePermutationTest([1,2,3],[4,5,6],mean,100), tail=:both), 1.0)
@test isapprox(pvalue(ApproximatePermutationTest([4,5,6],[1,2,3],mean,100), tail=:both), 1.0)
@test isapprox(pvalue(ApproximatePermutationTest([1,2,3],[4,5,6],mean,100), tail=:left), 0.08)
@test isapprox(pvalue(ApproximatePermutationTest([4,5,6],[1,2,3],mean,100), tail=:right), 0.07)
