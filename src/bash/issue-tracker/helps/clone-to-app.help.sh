# src/bash/issue-tracker/funcs/clone-to-app.help.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doHelpCloneToApp comments ...
# ---------------------------------------------------------
doHelpCloneToApp(){

	doLog "DEBUG START doHelpCloneToApp"
	
	cat doc/txt/issue-tracker/helps/clone-to-app.help.txt
	
	test -z "$sleep_interval" || sleep "$sleep_interval"
	# add your action implementation code here ... 
	# Action !!!

	doLog "DEBUG STOP  doHelpCloneToApp"
}
# eof func doHelpCloneToApp


# eof file: src/bash/issue-tracker/funcs/clone-to-app.help.sh
