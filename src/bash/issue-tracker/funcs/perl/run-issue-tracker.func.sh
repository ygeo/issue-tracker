# src/bash/issue-tracker/funcs/run-issue-tracker.func.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doRunIssueTracker comments ...
# ---------------------------------------------------------
doRunIssueTracker(){

	doLog "DEBUG START doRunIssueTracker"
	
	cat doc/txt/issue-tracker/funcs/perl/run-issue-tracker.func.txt
	test -z "$sleep_interval" || sleep "$sleep_interval"
	# add your action implementation code here ... 
   issue_file='/vagrant/ysg/data/scrum/daily/2017-04/2017-04-01.daily-issues.ysg.txt'
	
   # Action ... !!!
	perl src/perl/issue_tracker/script/issue_tracker.pl --issue_file $issue_file
   exit_code=$?
   doLog "INFO doRunIssueTracker exit_code $exit_code"
   test $exit_code -ne 0 && doExit $exit_code "failed to run issue_tracker.pl"  

	doLog "DEBUG STOP  doRunIssueTracker"
}
# eof func doRunIssueTracker


# eof file: src/bash/issue-tracker/funcs/run-issue-tracker.func.sh