test:
	bin/rails test

lint:
	bundle exec rubocop

check: lint test

lint-fix:
	bundle exec rubocop -A

deploy:
	git push heroku main

ci-setup:
	yarn install
	bundle install --without production development
	RAILS_ENV=test bin/rails db:prepare

start:
	bin/rails s

console:
	bin/rails console

reset:
	bin/rails db:drop
	bin/rails db:create
	bin/rails db:migrate
	bin/rails db:seed

install:
	bundle install
	yarn install

up: install reset start

.PHONY: test
