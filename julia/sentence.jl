function main()
    # if
    x = 4.0
    y = 5.0

    if x < y
        println("x < y")
    elseif x > y
        println("x > y")
    else
        println("x = y")
    end
    println(x < y ? "x < y" : "x > y or x = y")

    # for
    for i in 1:4
        println(i)
    end

    for n in [238, 456, 109]
        println(n)
    end

    # while
    s = 1
    while s < 5
        println(s)
        s += 1
    end
end

main()