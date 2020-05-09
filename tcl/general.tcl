# 改行なし
puts -nonewline "Hello World!";
# Hello World
puts "Hello World!";

# 変数
## 数値
### 整数
set num_i -177;
puts $num_i;
### 小数
set num_d 0.123;
puts $num_d;
### 指数
set num_e 1.1e+10;
puts $num_e;

## 文字列
set str Hello;
puts $str;

# 演算
set res_plus [expr 1 + 1];
puts $res_plus;
set res_minus [expr 1 - 1];
puts $res_minus;
set res_mul [expr 2 * 2];
puts $res_mul;
set res_div [expr 2 / 2];
puts $res_div;
set res_per [expr 3 % 2];
puts $res_per;