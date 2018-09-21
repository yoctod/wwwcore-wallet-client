.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	wwwcore-wallet-client.min.js

clean:
	rm wwwcore-wallet-client.js
	rm wwwcore-wallet-client.min.js

wwwcore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

wwwcore-wallet-client.min.js: wwwcore-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
