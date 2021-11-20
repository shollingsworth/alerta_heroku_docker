SHELL := /bin/bash
.ONESHELL:
.SHELLFLAGS += -e

tail:
	heroku logs --tail

deploy:
	git push heroku master

edit:
	heroku config:edit

local:
	docker-compose up --force-recreate
