a single-file database - pretty incredible.

i tried using Couchbase, and it was so resource-intensive I was sickened beyond reproach

# importing text files

(Information harvested from my now deleted git.sr.ht/sqlite repo ~,~)

> You should ideally be reading my post on sqlite for this command, but it's a common enough operation I do I thought I'd include it here

Using the `.import` command with a SQLite import table:

- enter the container
- create a file, e.g. `import_me.txt`
- put your text data into the file
- exit the container
- attach to the container, you should be at the sql> prompt
- run `.import --ascii /root/import_me.txt import` (you can also use `--csv`)

then you can copy the column contents of this import table to the target column:

	instructions go here!