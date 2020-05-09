# function
function sin_3(x)
    return sin(x)^3
end

# multiple dispatches
function func_1(x::Int64)
    return x^4 - x^3 + x^2 + x
end

function func_1(x::Float64)
    return x^4 - x^3 + x^2 + x + 0.1
end

function func_2(x)::Int64
    temp = e^x
    return trunc(Int64, temp)
end

# simple way
func_3(x) = cos(x)^2

# anonymous function
answer = map(x -> sin(x)^2 + cos(x)^2, [pi, pi/2, pi/4])

println(sin_3(pi/4))
println(func_1(2))
println(func_1(2.0))
println(func_2(2))
println(func_3(0))
println(answer)
