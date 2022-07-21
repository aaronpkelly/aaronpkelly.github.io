package main

import (
	"bufio"
	"fmt"
	scp "github.com/bramvdbogaerde/go-scp"
	"github.com/bramvdbogaerde/go-scp/auth"
	"golang.org/x/crypto/ssh"
	"log"
	"os"
	"strings"
)

func main() {

	const SOURCE_DIR string = "_posts/"
	const PRIVATE_KEY string = "/home/aaron/.ssh/id_ed25519"

	// Use SSH key authentication from the auth package
	// we ignore the host key in this example, please change this if you use this library
	clientConfig, _ := auth.PrivateKey("aaron", PRIVATE_KEY, ssh.InsecureIgnoreHostKey())

	// Create a new SCP client
	client := scp.NewClient("prose.sh:22", &clientConfig)

	// Connect to the remote server
	err := client.Connect()
	if err != nil {
		fmt.Println("Couldn't establish a connection to the remote server ", err)
		return
	} else {
		fmt.Println("Remote server version: " + string(client.Conn.ServerVersion()))
	}

	files, err := os.ReadDir(SOURCE_DIR)

	if err != nil {
		log.Fatal(err)
	}

	for _, file := range files {
		f, err := os.Open(SOURCE_DIR + file.Name())
		defer f.Close()

		if err != nil {
			log.Fatal(err)
		}

		scanner := bufio.NewScanner(f)

		for scanner.Scan() {
			text := scanner.Text()
			if strings.Contains(text, ".md") {
				text = strings.Replace(text, ".md", "", -1)

			}
		}
	}

}
