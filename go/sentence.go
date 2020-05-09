package main

import "fmt"

func main() {
	// if
	var a int = 0
	if a == 0 {
		fmt.Println("a=0")
	}else if a == 1{
		fmt.Println("a=1")
	}else{
		fmt.Println("a!=0, a!=1")
	}

	// if 前処理
	if b := 10; b > a{
		fmt.Println("b > a")
	}else{
		fmt.Println("b <= a")
	}

}
