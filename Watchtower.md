# Watchtower

# Notifications

## Send email updates

This checks for updates every hour. I previously had this checking every 2-10 mins, but recent changes to the Docker Hub registry have rate limited pull requests

```
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_POLL_INTERVAL=3600 \
  -e WATCHTOWER_NOTIFICATIONS=email \
  -e WATCHTOWER_NOTIFICATION_EMAIL_FROM=aaronkelly@fastmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_TO=admin@aaronkelly.dev \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.fastmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=aaronkelly@fastmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=$WATCHTOWER_PASS \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=587 \
  -e WATCHTOWER_NOTIFICATION_EMAIL_DELAY=2 \
  containrrr/watchtower
  ```
  
Export your mailbox password to the environment variable `WATCHTOWER_PASS`. 

See https://containrrr.dev/watchtower/notifications/