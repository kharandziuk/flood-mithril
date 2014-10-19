.PHONY: all code
all:
	python -m SimpleHTTPServer 8000

code:
	watchify -t coffeeify assets/app.coffee -o static/bundle.js

