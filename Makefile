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

.PHONY: test
