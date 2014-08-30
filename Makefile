.PHONY: show

show: games.html
	firefox games.html
games.html:
	./transform > games.html
list.json: list.html
	./extract
list.html:
	./fetchdata

clean:
	rm list.html list.json
