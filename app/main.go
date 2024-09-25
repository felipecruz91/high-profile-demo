package main

import (
	"fmt"

	"google.golang.org/grpc/codes"
)

var abortedCode = codes.Aborted

func main() {
	fmt.Println("hi")
	fmt.Println(abortedCode)
}
