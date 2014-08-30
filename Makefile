.PHONY: db

db: list.json
	echo 'jo'
list.json: list.html
	./extract
list.html:
	./fetchdata

clean:
	rm list.html list.json
