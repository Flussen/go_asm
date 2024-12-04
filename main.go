package main

import "fmt"

//go:noescape
func ProcessArray(array []int32, length int, increment int32)

func main() {
	arr := []int32{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	fmt.Println("after:", arr)

	ProcessArray(arr, len(arr), 10)

	fmt.Println("before:", arr)
}
