# *省略
x = 1
2x+1

# 組み込み pi
pi

# type
typeof(64)
typeof(3.14)

# isa
y = 4
isa(y, Int64)

# e表記
n = 6.023e23

# 組み込み sin
2sin(pi/2)

# 組み込み e
e^2

# 複素数
z = complex(2.0, 1.0)
real(z)
imag(z)
abs(z)
abs2(z)
angle(z)

# 配列
a = [1 2 3]
# インデックスは0からでなく1から
a[1]
b = [1 4 7; 2 5 8; 3 6 9]
b[2, 1]
b[end, end]
length(b)
size(b)

col = Float64[1, 2, 3]
row = Float64[1, 2, 3]
mat = Float64[1 2 3; 4 5 6; 7 8 9]
dot(row, col)
mat*col

# char
s = 'A'
ss = "String"
println("All you need is $ss")
println(s * ss)
