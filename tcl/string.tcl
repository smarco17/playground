set para "abcdefghijklmnopqrstuvwxyz"
set num "123456789"

append str $para $num
puts $str

set len_para [string length $para]
puts $len_para

set range_para [string range $para 1 4]
puts $range_para

set find_para [string first "cd" $para]
puts $find_para