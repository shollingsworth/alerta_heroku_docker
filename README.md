[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


# After deploy, issue `heroku config:edit` and create in the blanks here, then deploy
Grab the api key after logging in with the random username / password
run `heroku config:edit` again, and fill in the blanks

```
DASHBOARD_URL=<heroku-url>
# the api key created above
ALERTA_API_KEY=<api-key>
# this is the heroku url assigned to your instance
# pushover config values
PUSHOVER_TOKEN=<pushover token>
PUSHOVER_USER=<pushover user>
```
