:: safely sets an environment variable to an arbitrary string
:: that may contain other environment variables, the output of
:: other commands, and inline strings.
:: Examples:
:: - safe-set var_name=$other_var
:: - safe-set var_name=$other_var inside text
:: - safe-set var_name=${var_1}_concat_${var_2}
:: - safe-set var_name=$(command to get output from)
:: - safe-set var_name=${dynamic_variable_name_$other}
:: - safe-set var_name=${my_var_$(get-name.cmd $gn_param<input text)[$index]}
:: - safe-set "var name"=${var with spaces}
:: - safe-set "var name"=$(xpto.cmd "param with spaces"< text with spaces and $var ! )
:: - safe-set "var name=$(xpto.cmd ""escaped double quotes""< text with spaces and $var ! )"
