package require csv

set fd [open "./file/num.csv" r]

while { ![eof $fd] } {
	  gets $fd line
      set list_line [::csv::split $line ","]
	  foreach element $list_line {
          puts $element
      }
}