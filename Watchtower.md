# Watchtower

# Notifications

## Send email updates



```
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_POLL_INTERVAL=600 \
  -e WATCHTOWER_NOTIFICATIONS=email \
  -e WATCHTOWER_NOTIFICATION_EMAIL_FROM=admin@aaronkelly.dev \
  -e WATCHTOWER_NOTIFICATION_EMAIL_TO=admin@aaronkelly.dev \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.migadu.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=admin@aaronkelly.dev \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=$WATCHTOWER_PASS \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=587 \
  -e WATCHTOWER_NOTIFICATION_EMAIL_DELAY=2 \
  containrrr/watchtower
  ```
  
Export your mailbox password to the environment varialbe `WATCHTOWER_PASS`. 

See https://containrrr.dev/watchtower/notifications/