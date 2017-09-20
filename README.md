# letsbot

Lets encrypt auto renew bot.

Idea is origin from the repo [Lets-Encrypt-Smart-Renew](https://github.com/ScottHelme/Lets-Encrypt-Smart-Renew).

The script checkout the /etc/letsencrypt/live directory and renew the certs.

# Usage

Check your os type and using the specific web host version.

Eg, ubuntu with nginx, so using `ubuntu/letsbot-nginx.sh`

# Cronjob

```
crontab -e

0 22 * * * /letsbot/ubuntu/letsbot-nginx.sh > /var/log/letsbot.log
```

> Remember to login as root user

# Todo

Apache version.

Cert backup.
