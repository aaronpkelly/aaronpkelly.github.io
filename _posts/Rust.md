# pros and cons

## pros

- amazingly fast, performance is unparalleled
- amazingly safe

## cons

- can be amazingly complicated

# projects
Keep track of your todo's: https://todo.sr.ht/~aaronkelly/programming/1

The official docs are great. And funny! Whoever writes them has a great sense of humour****.

# rustup
On MX Linux their rust package is a bit behind. I used the rustup script from rust's own website, does the trick NICLEY. Stable channel

# testing
Rust is a bit different in that you don't use separate files to test other files, your tests live in the same file as your source code.

By default, only the `main.rs` and `lib.rs` files are compiled for any folder, and any files that they reference as a module, e.g. `mod myUtils`

# docker
Instead of the official Rust image `rust:latest`, the image `ekidd/rust-musl-builder:stable` is used.

The reason for this is Alpine is built around `musl-libc`, and an executable using the official Rust docker image won’t work.

# my rust projects 
I have an CLI client called 'crust' that I want to use to interact with my API ('Dorknet').  This is a good place to pour all my learning

# newsletters
https://this-week-in-rust.org/

# videos
https://invidio.us/watch?nojs=1&v=LiIoE8ArACs -  RustFest Zürich 2017 - Type-safe & high-perf distributed actor systems with Rust by Anselm Eickhoff 

# resources
https://doc.rust-lang.org/book/
https://doc.rust-lang.org/stable/rust-by-example/
https://github.com/rust-lang/rustlings/
https://news.ycombinator.com/item?id=22448933 -> https://fasterthanli.me/blog/2020/a-half-hour-to-learn-rust/
https://news.ycombinator.com/item?id=23924467 -> https://github.com/Dhghomon/easy_rust
https://readrust.net/
https://www.rust-lang.org/learn
https://news.ycombinator.com/item?id=23809188 -> https://tourofrust.com/00_en.html
https://play.rust-lang.org/ - code playground - great place to experiment

## REPLs

A wild REPL appears! These are very handy for embedding into blog posts. Here's one:

<iframe height="400px" width="100%" src="https://repl.it/@aaronpkelly/DramaticHighPatch?lite=true" scrolling="no" frameborder="no" allowtransparency="true" allowfullscreen="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-same-origin allow-scripts allow-modals"></iframe>

# resources
https://wiki.alopex.li/RustStarterKit2020