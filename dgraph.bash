new_urxvt_dgraph_zero_from_new () {
	local _name="dgraph_zero"
	urxvt -T $_name -e $SHELL -i -c 'docker run -it -p 5080:5080 -p 6080:6080 -p 8080:8080 -p 9080:9080 -p 8000:8000 -v ~/dgraph:/dgraph --name dgraph dgraph/dgraph dgraph zero;$SHELL -i'
}

new_urxvt_dgraph_alpha () {
	local _name="dgraph_alpha"
	urxvt -T $_name -e $SHELL -i -c 'docker exec -it dgraph dgraph alpha --lru_mb 2048 --zero localhost:5080;$SHELL -i'
}
new_urxvt_dgraph_ui_ratel () {
	local _name="dgraph_ratel_ui"
	urxvt -T $_name -e $SHELL -i -c 'docker exec -it dgraph dgraph-ratel;$SHELL -i'
}

remove_dgraph () {
	docker container rm dgraph
}
stop_dgraph () {
	docker container stop dgraph
}
start_dgraph () {
	docker container start dgraph
}

run_dgraph_with_ui () {
	run_dgraph
	new_urxvt_dgraph_ui_ratel &
}
run_dgraph () {
	stop_dgraph 2>/dev/null; docker start dgraph || new_urxvt_dgraph_zero_from_new &
	new_urxvt_dgraph_alpha &
}

