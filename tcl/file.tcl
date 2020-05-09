# ファイルの操作
set f_name_r "./file/read.txt"
set f_name_w "./file/write.txt"
set f_name_r_cp "./file_copy/read_copy.txt"
set f_name_w_cp "./file_copy/write_copy.txt"

## 削除
file delete $f_name_r_cp

## コピー -force : 上書き
## file copy -force f_name_r f_name_r_cp
file copy $f_name_r $f_name_r_cp

proc f_get_sum {f_name} {
  if { [file exists $f_name] } {
    set fd [open $f_name r]
    set row 0
    set sum 0

    while { ![eof $fd] } {
	  gets $fd line
      set sum [expr $sum + $line]
	  puts $line
      incr row
    }
    close $fd
    puts "$row lines."
    puts "sum : $sum"
  }
}

f_get_sum $f_name_r