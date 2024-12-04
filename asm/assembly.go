package asm

//go:noescape
func ProcessArray(array []int32, length int, increment int32)

//go:noescape
func AddMultipleArrays(arrays []*int32, numArrays int, length int, result []int32)
