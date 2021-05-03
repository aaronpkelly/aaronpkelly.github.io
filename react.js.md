I've never tried react (I don't really try javascript libraries), but when I saw [this hn article](https://news.ycombinator.com/item?id=27016630), I couldn't wait any longer! It was really expanding on what [Static website hosting](Static%20website%20hosting.md) websites could do (querying a SQL database from a browser *remotely* and only downloading the minimum amount of data needed), and it also had a cool code snippet runner XD

# create-react-app
following the instructions here: https://reactjs.org/docs/create-a-new-react-app.html

	$ nix-shell -p nodejs nodePackages.npm
	$ npx create-react-app create-react-app

Yep, no problems! I just created my first react app. Now, if only I had an IDE...

# webstorm
Webstorm does offer a way to `init` a new react app, but it's very bare-bones. Better to import the create-react-app and go from there.

When importing the project into webstorm... nothing happens. I think it's because node+npm aren't installed by default on my nix machine... by default it uses its own node binary, which won't work on Nix.

So after installing it, I can find where the binary is:

	$ readlink -f $(which node)
	/nix/store/vcj1r5r35k59rvg9kk3sxnikc4zmfh2l-nodejs-14.16.1/bin/node

After adding that location to _Settings -> Node.js and NPM_, and creating a run configuration for `npm start`, it works fine :)


# adding runnable code snippets
This is my inspiration: https://phiresky.github.io/blog/2021/hosting-sqlite-databases-on-github-pages/

I'll need to use pandoc + [panpipe](https://hackage.haskell.org/package/panpipe)

There is this guy that talks about it: http://chriswarbo.net/projects/activecode/index.html

# see also

https://en.wikipedia.org/wiki/React_(JavaScript_library)