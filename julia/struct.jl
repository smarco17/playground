mutable struct Basic
    s::String
    x::Float64
    y::Float64
end

function main()
    basic = Basic("basic", 12.0, 33.0)
    println(fieldnames(basic))
    println(basic.s)
    println(basic.x)
    println(basic.y)
end

main()
