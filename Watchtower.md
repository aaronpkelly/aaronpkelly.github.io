# Watchtower

# Notifications
## Send email on container restart
https://containrrr.dev/watchtower/notifications/
```
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_POLL_INTERVAL=60 \
  -e WATCHTOWER_NOTIFICATIONS=email \
  -e WATCHTOWER_NOTIFICATION_EMAIL_FROM=aaronkelly@fastmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_TO=aaronkelly@fastmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.fastmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=aaronkelly@fastmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=$WATCHTOWER_PASS \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=587 \
  -e WATCHTOWER_NOTIFICATION_EMAIL_DELAY=2 \
  containrrr/watchtower
  ```
  
	  