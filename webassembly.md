# WebAssembly from Scratch: From FizzBuzz to DooM

I saw [this post](http://yperambulator.s3-website-eu-west-1.amazonaws.com/) and the tutorials that this guy gives is great: https://github.com/diekmann/wasm-fizzbuzz

gave me inspiration to create browser-based games that could be as simple or as powerful as I liked

an important note for the comments:

> Just a point for the first chapters: you are not required to run your own local server (even if things push in that direction)
> You can include the wasm as an ArrayBuffer or as a base64 encoded string and hardcode it in the javascript. Now it will run even in a static html.

# rust and webassembly book
awesome: https://rustwasm.github.io/docs/book/

# coding a WebAssembly interpreter to play a game
very fun, recommended from the first comment of that hacker news article
https://www.youtube.com/watch?v=r-A78RgMhZU

## using nix-shell to make and play the fizzbuzz

	git clone https://github.com/diekmann/wasm-fizzbuzz ~/src
	nix-shell -p rustup wabt binaryen
	cd ~/src/wasm-fizzbuzz/rust
	make
	curl -LO https://redbean.dev/redbean-1.4.com
	chmod +x redbean-1.4.com
	zip redbean-1.4.com index.html fizzbuzz.wasm
	./redbean-1.4.com -vv
	firefox localhost:8080
	
note: you may need to run `rustup target add wasm32-unknown-unknown`

## and doom?

### 1

nix-shell -p rustup wabt binaryen clang_11 llvmPackages_10.llvm musl

  = note: /nix/store/cp1sa3xxvl71cypiinw2c62i5s33chlr-binutils-2.35.1/bin/ld: /home/aaron/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/libstd-b6b48477bfa8c673.rlib(std-b6b48477bfa8c673.std.8gvvorxe-cgu.0.rcgu.o): undefined reference to symbol '__res_init@@GLIBC_2.2.5'
          /nix/store/cp1sa3xxvl71cypiinw2c62i5s33chlr-binutils-2.35.1/bin/ld: /nix/store/hp8wcylqr14hrrpqap4wdrwzq092wfln-glibc-2.32-37/lib/libc.so.6: error adding symbols: DSO missing from command line
          collect2: error: ld returned 1 exit status
          
### 2
nix-shell -p rustup wabt binaryen clang_11 llvmPackages_10.llvm

ln -s /nix/store/q54f4p1q7cpq5800f84sxxv8gwfkh2i2-llvm-11.1.0/bin/llvm-ar ~/tmpbin/llvm-ar-10
ln -s /nix/store/q0imwzfh8xbkgslv3grmn9ja127837kv-llvm-10.0.1/bin/llvm-ranlib ~/tmpbin/llvm-ranlib-10

PATH=$PATH:/home/aaron/tmpbin/
change makefile

 note: rust-lld: error: unknown file type: d_main.o