# irssi vs weechat

i've used irssi and i like it

however https://christine.website/ uses weechat

i will try weechat

# my username

`zoinks` is my main nick registered on liba

i also have grouped my `akelly` nick/username to my account, which i like because it maps to my sr.ht account name

you can just switch to it after logging in:

	/nick akelly

# chat.sr.ht coming soon

https://sourcehut.org/blog/2021-10-15-whats-cooking-october-2021/

# irc.libera.chat

`irc.libera.chat` is the irc server successor to freenode!

- go to https://libera.chat for more info about this server
- use the webchat to connect to an irc server: https://web.libera.chat/

good channels:

- sr.ht


# weechat

	/help server
	/server add libera irc.libera.chat
	/connect libera
	/nick zoinks
	/msg NickServ IDENTIFY <ZOINKS_PASSWORD>
	/join #sr.ht

## scripts

see https://christine.website/blog/irc-stuff-nixos-2021-05-29

weechat doesn't remember your channels, but you can add scripts tell it to


	/set script.scripts.download_enabled on
	# sort channels
	/script install autosort.py
	# save channels on exit
	/script install autojoin.py
	# save currently joined channels
	/autojoin --run
	/save


# freenode no more

I used to mainly hang out on irc.freenode.net under the handle _zoinks_

join!: https://webchat.freenode.net/#sr.ht

## ebooks

https://www.reddit.com/r/Piracy/comments/2oftbu/guide_the_idiot_proof_guide_to_downloading_ebooks/

> For ebooks, I know of two servers that host channels dedicated to ebook downloads. One is "Undernet", the other is "IRChighway". While both have their uses, **IRChighway** is the one you want to use 90% of the time. The selection is generally more robust, the channels are more stable, and the downloads are faster. You generally only want to use Undernet if you can't find the ebook you're looking for on IRChighway. Sometimes you can get lucky and one will have a book if the other does not.

>  while on IRChighway, you can join "**ebooks**".

## irchighway

> irc://irc.irchighway.net
> 
> The ports we support are **6660** to **6669** and **7000**. For connections through **SSL** use port **6697** or **9999**.Fh

https://webchat.irchighway.net/

## undernet

irc.undernet.org

[](https://www.undernet.org/servers.php)

> On Undernet, you can either go with "Bookz" or "ebooks", 

https://chat.undernet.org/