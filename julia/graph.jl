using Plots
gr()

# line
plot(randn(100))
# !で重ね書き
plot!(randn(100))

# scatter
scatter(rand(100), rand(100))

# hist 2d
histogram2d(randn(100000), randn(100000), nbins=20)
