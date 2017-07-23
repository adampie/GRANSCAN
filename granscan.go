package main

import (
    "fmt"

    "github.com/adampie/go-wrapper-linux-tools"
)

func main() {
	// CPU TEST

	// MEMORY TEST

	// NETWORK TEST

	// STORAGE TEST

	// INFO TEST
	fmt.Printf(gwlt.Uptime()+"\n")
	fmt.Printf(gwlt.UsersLoggedin()+"\n")
	fmt.Printf(gwlt.ListCPU()+"\n")
	fmt.Printf(gwlt.ListHardware()+"\n")
	fmt.Printf(gwlt.ListSCSI()+"\n")
	fmt.Printf(gwlt.ListUSB()+"\n")
}
