#!/usr/bin/env fish

# Experiment on implementing multiprocessing/subshell experience using fish shell.

################################################################################
#echo Started new lib process: %self , (status current-command), (status filename), $argv, (status current-commandline)
################################################################################

function _car
	if test (count $argv) -gt 1;
		for arg in $argv[1..(math (count $argv) - 1)]
			echo $arg
		end
	end
end

function _cdr
	if test (count $argv) -gt 1;
		for arg in $argv[2..(count $argv)]
			echo $arg
		end
	end
end

function _min
	math min (string join ', ' $argv)
end

function _max
	math max (string join ', ' $argv)
end

################################################################################

function _echo_color
	echo (
		set_color $argv[1]
		echo (_cdr $argv)
		set_color normal
	) >&2
end

function _info
	_echo_color cyan $argv
end

function _error
	_echo_color red $argv
end

function _success
	_echo_color green $argv
end

################################################################################

function _parallel
	set -f cmd_part
	set -f items
	set -f arg_type "cmd_part"
	set -f fail_first 0
	set -f verbose 0
	set -f exec_fish_code 0
	for arg in $argv
		set -l cmd_len (count $cmd_part)
		if test $cmd_len -eq 0 -a "'$arg'" = "'--help'"
			echo
			echo (status filename) "_parallel [--jobs=JOBS] [--fail-first] [--verbose] [-c]"
			echo "    [command] [arguments] {} [arguments] ::: [values to iterate]"
			echo
			echo '{} - is an optional placeholder for iterable value'
			echo '     (otherwise it will be placed as a last argument)'
			exit 0
		else if test $cmd_len -eq 0 -a "'$arg'" = "'-c'"
			set -f exec_fish_code 1
		else if test $cmd_len -eq 0 -a "'$arg'" = "'--fail-first'"
			set -f fail_first 1
		else if test $cmd_len -eq 0 -a "'$arg'" = "'--verbose'"
			set -f verbose 1
		else if test $cmd_len -eq 0 ; and string match -- '--jobs=*' $arg > /dev/null
			set -f jobs (echo $arg | cut -d= -f2)
		else if test $arg = ":::"
			set -f arg_type "items"
		else
			set -f -a $arg_type $arg
		end
	end
	test -z "$jobs" ; and set -f jobs (nproc)
	test "$jobs" -gt 0 ; or begin
		_error "Jobs must be > 0, not `$jobs`"
		return 1
	end
	test $exec_fish_code -gt 0 ; and set -f cmd_part fish -c $cmd_part

	function _p_echo --inherit-variable verbose
		test $verbose -gt 0 ; and echo $argv
	end

	function _p_info --inherit-variable verbose
		test $verbose -gt 0 ; and _info $argv
	end

	function _p_success --inherit-variable verbose
		test $verbose -gt 0 ; and _success $argv
	end

	set -g pids
	set -g killed_pids
	set -g num_running 0
	_p_info "Items received: `$items` for command: `$cmd_part`"
	for item in $items
		set -f cmd
		for arg in $cmd_part
			if string match -r -- '{}' $arg > /dev/null
				set -f arg_to_add (string replace -r --all -- '{}' $item $arg)
			else
				set -f arg_to_add $arg
			end
			set -f -a cmd $arg_to_add
		end
		_p_info ":Starting: $run_in_subshell $cmd &"
		$run_in_subshell $cmd &
		set -l spawned_pid $last_pid
		set -g -a pids $spawned_pid
		set -g num_running (math $num_running + 1)
		function _on_proc_exit_$spawned_pid --on-process-exit $spawned_pid --inherit-variable fail_first
			set -g num_running (math $num_running - 1)
			set -f pid $argv[2]
			set -f code $argv[3]
			set -f msg_type (test $code -ne 0 ; and echo _error ; or echo _p_info)
			$msg_type "pid $pid exited with status $code"
			contains $pid $killed_pids ; and return
			test $code -ne 0 ; and set -g -a killed_pids $pid
			if test $code -ne 0 -a $fail_first -eq 1
				_error "Exiting! ($pids)"
				for p in $pids
					if not contains $p $killed_pids
						_error "Killing $p ..."
						set -g -a killed_pids $p
						kill $p
					end
				end
			end
		end
		#echo "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS ($num_running/$jobs)"
		while test $num_running -ge "$jobs"
			_p_echo "WWWWWWWWWWWWWWWWWWAITINGGGGGGGGGGG........... ($num_running/$jobs)"
			wait --any
			_p_echo "WAITED>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ($num_running/$jobs)"
		end
	end

	wait
	if test (count $killed_pids) -ne 0
		_error "Items ($items) failed to execute ($killed_pids)"
		return 1
	end
	_p_success "Items ($items) finished processing"
end

################################################################################

set -f ARG_IMPORT "--import"
set -f ARG_RUN "--run"

if test (count $argv) -gt 1 -a "$argv[1]" = "$ARG_IMPORT"
	set -f _main_file (_cdr $argv)
else
	set -f _main_file (status filename)
end
set -g run_in_subshell $_main_file $ARG_RUN


function main --inherit-variable _main_file --inherit-variable ARG_IMPORT
	if test (count $argv) -gt 1 -a "$argv[1]" = "$ARG_IMPORT"
		true
	else if test (count $argv) -lt 1
		_error "ERROR: you should define `main()` function"
		echo
		echo "Available options:"
		set -l main_file_first_part $_main_file[1]
		for func in (functions --names --all)
			if test (functions --details $func) = "$main_file_first_part" \
					-a $func != "main" \
					-a $func != "_main"
				echo $func
			end
		end
		return 1
	else
		#_info "Running $argv:"
		$argv
	end
end


function _main --inherit-variable ARG_RUN
	if test "$argv[1]" = "$ARG_RUN"
		set -f run (_cdr $argv)
		$run
	else
		main $argv
	end
end


#set -f parent_argv $argv
#function windown --on-process-exit %self --inherit-variable parent_argv
#    echo $argv
#    #test $argv[1] = "PROCESS_EXIT" && return
#    if test (count $parent_argv) -gt 1 -a "$parent_argv[1]" = "$ARG_IMPORT"
#        true
#    else
#        _main $parent_argv || exit 1
#    end
#end

_main $argv  # this should be at the very bottom
# END ##########################################################################
