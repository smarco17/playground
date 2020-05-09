# リスト
set num1 [list 134 222 392]

proc get_sum { list_num } {
    set sum 0
    foreach element $list_num {
        incr sum $element
        puts $element
    }
    puts $sum
}

get_sum $num1

set list_str [split "127, 10, 785" ","]
puts [lindex $list_str 0]