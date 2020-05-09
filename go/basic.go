package main

import "fmt"
import "reflect"

type Person struct{
	age int
	height float32
	weight float32
	name string
}

func main() {
	// 変数宣言
	var a float64 = 0
	var b = 1.0
	fmt.Println(a + b)
	fmt.Println(reflect.TypeOf(a + b))

	// 文字列
	var s string = "Hello, Go."
	fmt.Println(s)

	// 配列
	var arrayInt[2] int
	arrayInt[0] = 1
	arrayInt[1] = 2
	arrayFloat := [3] float64{1., 2., 3.}
	fmt.Println(arrayInt)
	fmt.Println(arrayFloat)

	// スライス
	var sliceString[] string
	sliceString = append(sliceString, "Hello", "Go")
	sliceFloat := [] float64{3.2, 2.3, 8.9}
	fmt.Println(sliceString)
	fmt.Println(sliceFloat)

	// 構造体
	var me Person
	me.age = 24
	me.height = 177.0
	me.weight = 60.0
	me.name = "shusaku"
	fmt.Println(me)

	// マップ
	m := map[string] float32 {"x": 12.0, "y": 2.2}
	fmt.Println(m)

	// ポインタ
	var p *float64
	p = &b
	fmt.Println(p)
	fmt.Println(*p)

	// 型のキャスト
	var w int64 = 320
	var v float64 = 640.2
	fmt.Println(float64(w) + v)

	// 空インターフェース
	var obj interface{}
	obj = 1
	fmt.Println(obj)
	obj = "Go"
	fmt.Println(obj)

	// 型アサーション
	var assert interface{}
	assert = 1.0
	value, ok := assert.(float64)
	fmt.Println(value, ok)

}
