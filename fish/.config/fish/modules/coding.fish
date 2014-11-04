# aliases for teh happy coding

#alias_w a_grep "ack --python --ignore-dir=env "
alias_w a_grep "ack --ignore-dir=env "

function a_replace -a grep_line original_value replace_value -d "replace stuff usinf ack"
	a_grep -l --print0 "$grep_line" | xargs -0 -n 1 sed -i -e 's/'"$original_value"'/'"$replace_value"'/g'
end
