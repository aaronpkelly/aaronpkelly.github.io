icloud only lets you store 5GB worth of data before it starts asking you to pay for more. The bulk of these are photos/videos

There is a great tool that allows you to download photos+videos: https://github.com/icloud-photos-downloader/icloud_photos_downloader

You can then upload them to S3 (which I have), and then go to iCloud photos via the webapp and delete them - currently I'm just deleting the big videos

The docker command for using this tool is straightforward and works very well (note: I've removed the `--recent 500` option,  and also set my `username` and `password` to my apple credentials):

```
docker run -it --rm --name icloud \\
    -v $(pwd)/Photos:/data \\
    -v $(pwd)/cookies:/cookies \\
    -e TZ=America/Los\_Angeles \\
    icloudpd/icloudpd:latest \\
    icloudpd --directory /data \\
    --cookie-directory /cookies \\
    --username **** \\
    --password **** \\
    --auto-delete
```

Note: `--auto-delete` doesn't delete the photos/videos you download, it just empties the Recently Deleted folder

The above command uses **defaults** for everything else, like image size. You can see what the defaults are here:

	Usage: icloudpd <options>
	
	  Download all iCloud photos to a local directory
	
	Options:
	  -d, --directory <directory>     Local directory that should be used for
	                                  download
	  -u, --username <username>       Your iCloud username or email address
	  -p, --password <password>       Your iCloud password (default: use PyiCloud
	                                  keyring or prompt for password)
	  --cookie-directory </cookie/directory>
	                                  Directory to store cookies for
	                                  authentication (default: ~/.pyicloud)
	  --size [original|medium|thumb]  Image size to download (default: original)
	  --live-photo-size [original|medium|thumb]
	                                  Live Photo video size to download (default:
	                                  original)
	  --recent INTEGER RANGE          Number of recent photos to download
	                                  (default: download all photos)
	  --until-found INTEGER RANGE     Download most recently added photos until we
	                                  find x number of previously downloaded
	                                  consecutive photos (default: download all
	                                  photos)
	  -a, --album <album>             Album to download (default: All Photos)
	  -l, --list-albums               Lists the avaliable albums
	  --skip-videos                   Don't download any videos (default: Download
	                                  all photos and videos)
	  --skip-live-photos              Don't download any live photos (default:
	                                  Download live photos)
	  --force-size                    Only download the requested size (default:
	                                  download original if size is not available)
	  --auto-delete                   Scans the "Recently Deleted" folder and
	                                  deletes any files found in there. (If you
	                                  restore the photo in iCloud, it will be
	                                  downloaded again.)
	  --only-print-filenames          Only prints the filenames of all files that
	                                  will be downloaded (not including files that
	                                  are already downloaded.)(Does not download
	                                  or delete any files.)
	  --folder-structure <folder_structure>
	                                  Folder structure (default: {:%Y/%m/%d}). If
	                                  set to 'none' all photos will just be placed
	                                  into the download directory
	  --set-exif-datetime             Write the DateTimeOriginal exif tag from
	                                  file creation date, if it doesn't exist.
	  --smtp-username <smtp_username>
	                                  Your SMTP username, for sending email
	                                  notifications when two-step authentication
	                                  expires.
	  --smtp-password <smtp_password>
	                                  Your SMTP password, for sending email
	                                  notifications when two-step authentication
	                                  expires.
	  --smtp-host <smtp_host>         Your SMTP server host. Defaults to:
	                                  smtp.gmail.com
	  --smtp-port <smtp_port>         Your SMTP server port. Default: 587 (Gmail)
	  --smtp-no-tls                   Pass this flag to disable TLS for SMTP (TLS
	                                  is required for Gmail)
	  --notification-email <notification_email>
	                                  Email address where you would like to
	                                  receive email notifications. Default: SMTP
	                                  username
	  --notification-script PATH      Runs an external script when two factor
	                                  authentication expires. (path required:
	                                  /path/to/my/script.sh)
	  --log-level [debug|info|error]  Log level (default: debug)
	  --no-progress-bar               Disables the one-line progress bar and
	                                  prints log messages on separate lines
	                                  (Progress bar is disabled by default if
	                                  there is no tty attached)
	  --threads-num INTEGER RANGE     Number of cpu threads -- deprecated. To be
	                                  removed in future version
	  --version                       Show the version and exit.
	  -h, --help                      Show this message and exit.