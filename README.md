[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


# After deploy, issue `heroku config:edit` and create in the blanks here, then deploy
```
ADMIN_PASSWORD=random_string
ADMIN_USERS=random_user_id
SECRET_KEY=long_random_string
DASHBOARD_URL=<heroku-url>
```

Grab the api key after logging in with the random username / password
run `heroku config:edit` again, and fill in the blanks

```
# the api key created above
ALERTA_API_KEY=<api-key>
# this is the heroku url assigned to your instance
# pushover config values
PUSHOVER_TOKEN=<pushover token>
PUSHOVER_USER=<pushover user>
```
