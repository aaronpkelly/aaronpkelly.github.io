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
    --folder-structure {:%Y/%Y-%m-%d} \\
    --username testuser@example.com \\
    --password pass1234 \\
    --size original \\
    --auto-delete
```

