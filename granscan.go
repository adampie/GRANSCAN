package main

import (
    "fmt"

    "github.com/adampie/go-wrapper-linux-tools"
)

func main() {
    //fmt.Printf(gwlt.InternalIP())
    //fmt.Printf(gwlt.ExternalIP())

	fmt.Printf(gwlt.Uptime()+"\n")
	fmt.Printf(gwlt.UsersLoggedin()+"\n")
}
