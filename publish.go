package main

import (
	"bufio"
	"context"
	"fmt"
	scp "github.com/bramvdbogaerde/go-scp"
	"github.com/bramvdbogaerde/go-scp/auth"
	"golang.org/x/crypto/ssh"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

const SOURCE_DIR string = "/home/aaron/src/aaronpkelly.github.io/_posts/"

func main() {

	var TEMP_DIR, err = ioutil.TempDir("", "posts")

	if err != nil {
		log.Fatal(err)
	}

	const PRIVATE_KEY string = "/home/aaron/.ssh/id_ed25519"
	// const PRIVATE_KEY string = "/home/aaron/.ssh/id_ed25519_passwordless.pub"

	files, err := os.ReadDir(SOURCE_DIR)

	os.Mkdir(TEMP_DIR, 0750)

	if err != nil {
		log.Fatal(err)
	}

	for _, file := range files {

		// fmt.Println("analysing " + file.Name())

		// don't bother opening the file if it's not markdown
		if !strings.Contains(file.Name(), ".md") {
			continue
		}

		f, err := os.Open(SOURCE_DIR + file.Name())

		// Close the file after it has been copied
		defer f.Close()

		if err != nil {
			log.Fatal(err)
		}

		scanner := bufio.NewScanner(f)
		scanner.Scan()

		// only publish if the first line of the file contains the publish tag
		if strings.Contains(scanner.Text(), "#publish") {

			fmt.Printf("publishing " + file.Name() + "\n")

			outfile, err := os.Create(TEMP_DIR + "/" + filepath.Base(f.Name()))
			defer outfile.Close()

			// write the tags
			outfile.WriteString(scanner.Text())

			for scanner.Scan() {
				text := scanner.Text()

				if strings.Contains(text, ".md") {
					text = strings.Replace(text, ".md", "", -1)
				}
				outfile.WriteString(text + "\n")
			}

			err = scpUsingOS(outfile)

			if err != nil {
				log.Fatal(err)
			}
		}
	}

	cleanup()
}

func cleanup() {
	os.TempDir()
}

func scpUsingOS(outfile *os.File) error {

	cmd := exec.Command("scp", outfile.Name(), "prose.sh:/")
	// fmt.Printf("transferring %s\n", path.Base(outfile.Name()))
	err := cmd.Run()

	if err != nil {
		log.Fatal(err)
	}

	return err
}

func scpUsingMethod1(f *os.File, privateKey string) error {
	// Use SSH key authentication from the auth package
	// we ignore the host key in this example, please change this if you use this library
	clientConfig, _ := auth.PrivateKey("aaron", privateKey, ssh.InsecureIgnoreHostKey())

	// For other authentication methods see ssh.ClientConfig and ssh.AuthMethod

	// Create a new SCP client
	client := scp.NewClient("prose.sh:22", &clientConfig)

	// Close client connection after the file has been copied
	defer client.Close()

	// Connect to the remote server
	err := client.Connect()
	if err != nil {
		fmt.Println("Couldn't establish a connection to the remote server ", err)
		return err
	}

	err = client.CopyFromFile(context.Background(), *f, "/", "0655")

	if err != nil {
		fmt.Println("Error while copying file ", err)
	}

	return err
}
