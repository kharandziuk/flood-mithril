.PHONY: all code install
all:
	python -m SimpleHTTPServer 8000

code: install css
	watchify -t coffeeify assets/*.coffee -o static/bundle.js

install:
	npm install

css:
	mkdir -p static && cp assets/app.css static/

