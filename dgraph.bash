new_urxvt_dgraph_zero () {
	urxvt -display dgraph_zero -e docker run -it -p 5080:5080 -p 6080:6080 -p 8080:8080 -p 9080:9080 -p 8000:8000 -v ~/dgraph:/dgraph --name dgraph dgraph/dgraph dgraph zero
}
new_urxvt_dgraph () {
	urxvt -dsplay new_urxvt_dgraph -e docker exec -it dgraph dgraph alpha --lru_mb 2048 --zero localhost:5080
}
new_urxvt_dgraph_ui_rattel () {
	urxvt -dsplay new_urxvt_dgraph -e docker exec -it dgraph dgraph-ratel
}

run_dgraph_with_ui () {
	new_urxvt_dgraph_zero
	new_urxvt_dgraph
	new_urxvt_dgraph_ui_rattel
}
run_dgraph () {
	new_urxvt_dgraph_zero
	new_urxvt_dgraph
}

