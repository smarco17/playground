set sum 0

for {set i 0} {$i < 10} {incr i} {
  incr sum $i
}

puts $sum

if {$sum > 0} {
    puts "plus"
} else {
    puts "zero or minus"
}
