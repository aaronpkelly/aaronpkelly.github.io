# pros

- a dead simple language to pick up
- compiles to a single, tiny binary with no external dependencies (standard library and runtimes)
- extremely low memory + cpu footprint
- very fast

# cons
- garbage collector, not too great at big scales, this is where Rust shines with better memory management

# official resources

- https://go.dev: homepage
- https://go.dev/solutions/#use-cases
	- https://go.dev/solutions/clis
		- https://pkg.go.dev/github.com/spf13/cobra?tab=overview
			- note: on NIXOS, this does install, but the binary won't be put on your path - it will be at _/home/aaron/go/bin/cobra_
		- https://pkg.go.dev/github.com/spf13/viper?tab=overview
- go docs: https://go.dev/doc/
	- read the go source code of the libraries you're using!
		- e.g. https://pkg.go.dev/net/http
- https://pkg.go.dev/ package search
	- https://pkg.go.dev/github.com/rthornton128/goncurses ncurses!

# unofficial resources

effective go
https://golang.org/doc/effective_go

go by example:
https://gobyexample.com/

w3schools has go stuff - good on them!
https://www.w3schools.com/go/index.php