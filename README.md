# Deploy Instructions


1. Sign into heroku / or create an account
    * Create an api key
2. Sign into github, and fork this repo
    * In your new repo, create the following secrets
        * HEROKU_API_KEY `the api key you just created`
        * HEROKU_APP_NAME `the heroku app name (it should not exist)`
        * HEROKU_EMAIL `the email attached to your heroku account`

3. After the secrets are created, push an empty commit to kick off github actions
    * `git commit --allow-empty -m "Empty test commit"`

4. Watch the deploy in github actions

5. Once the deploy is finished, go to the heroku app, expand config vars, and grab the value for `ADMIN_USERS`
    * Also copy your heroku url (can be found under `open app`)
6. login into the application with that username and password `alerta`

7. create a new admin user (be sure to add it as an `admin`) / document the
   password somewhere safe

8. log off and log back in with the new admin user
9. remove all api keys
10. remove all user accounts
11. create a new admin api key


12. Go back to your cli and initialize the heroku cli
    * [the heroku cli tools](https://devcenter.heroku.com/articles/heroku-command-line)
    * issue the following commands
        * heroku login
        * heroku git:remote -a <myappname>

13. run `heroku config:edit`
    * remove the lines
        * `ADMIN_KEY=...`
        * `ADMIN_USERS=...`
    * Edit the line
        * `ALERTA_API_KEY=...`
        * erase the old api key, and insert the one your created in sted 11
    * Add the following lines
        * DASHBOARD_URL=<heroku-url>
        * If you want to use pushover
            * PUSHOVER_TOKEN=<pushover token>
            * PUSHOVER_USER=<pushover user>


14. Enjoy!
