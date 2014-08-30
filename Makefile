.PHONY: show

show: games.html
	firefox games.html
games.html: list.json
	./transform > games.html
list.json: list.html
	./extract > list.json
list.html:
	./fetchdata > list.html

clean:
	rm list.html list.json games.html
