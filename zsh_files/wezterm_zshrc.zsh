
if [ $TERM_PROGRAM != "WezTerm" ]; then
	return
fi



function __wezterm_set_user_var(){
	printf "\033]1337;SetUserVar=%s=%s\007" $1 `echo -n $2 | base64`
}



function hello_set_user_var(){
	__wezterm_set_user_var "hello" "world"
}


alias __BUILTIN_SSH=$(which ssh)

EVENT_NAME="custom_background_events"


function __ssh_end(){
	__wezterm_set_user_var $EVENT_NAME "ssh_end"
}


function ssh(){
	__wezterm_set_user_var $EVENT_NAME "ssh_start"
	trap __ssh_end 2
	__BUILTIN_SSH $@
	__ssh_end

	trap 2
}


__wezterm_set_user_var $EVENT_NAME "initialize"
