package main

import (
	"fmt"

	"github.com/Flussen/go_asm/asm"
)

func main() {
	arr1 := []int32{1, 2, 3, 4}
	arr2 := []int32{10, 20, 30, 40}
	arr3 := []int32{100, 200, 300, 400}

	result := make([]int32, len(arr1))

	arrays := []*int32{
		&arr1[0],
		&arr2[0],
		&arr3[0],
	}

	asm.AddMultipleArrays(arrays, len(arrays), len(arr1), result)

	fmt.Println("result:", result)
}
