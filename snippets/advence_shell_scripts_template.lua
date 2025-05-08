local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local sn = ls.snippet_node

ls.add_snippets("sh", {
	s(
		"adv",
		fmta(
			[=[
#!/usr/bin/env bash

# Set -euo pipefail:  Exit immediately if a command exits with a non-zero status.
# -e: Exit if a command exits with a non-zero status.
# -u: Treat unset variables as an error.
# -o pipefail:  If a command in a pipeline fails, the whole pipeline fails.
set -euo pipefail

# Initialize variables to store the optional arguments and flags.
name=""
age=""
verbose=false
help_flag=false

# Use getopt to parse the command-line options.
# -o vh:  Defines short options v and h (flags, no arguments).
# -n:  Defines short option n, which requires an argument.
# -a:  Defines short option a, which requires an argument.
# --long "name:,age:,verbose,help": Defines the long options.
#   name: and age: indicate these options require arguments.
OPTIONS=$(getopt -o vhn:a: --long "verbose,help,name:,age:" -- "$@")

# Use eval and set to process the options and arguments.  This updates
# the script's positional parameters ($1, $2, etc.) based on the parsed options.
eval set -- "$OPTIONS"

# Loop through the options and arguments.  We use a while loop and a
# case statement to handle each one.
while true; do
	case "$1" in
	-v | --verbose)
		verbose=true
		shift # Move to the next argument
		;;
	-h | --help)
		help_flag=true
		shift
		;;
	-n | --name)
		name="$2"
		shift 2 # Move past the option and its argument
		;;
	-a | --age)
		age="$2"
		shift 2
		;;
	--)
		shift # Move past the "--" marker, which separates options from non-option arguments.
		break # Exit the while loop
		;;
	*)
		echo "Internal error!" # This should not happen, but it's good to have.
		exit 1
		;;
	esac
done

# Check if the help flag was set. If so, display usage and exit.
if "$help_flag"; then
	echo "Usage: ./script.sh [-v|--verbose] [-h|--help] [-n <lt>name<gt>|--name=<lt>name<gt>] [-a <lt>age<gt>|--age=<lt>age<gt>] <lt>args<gt>"
	echo "  -v, --verbose   Enable verbose output."
	echo "  -h, --help      Display this help message."
	echo "  -n, --name <lt>name<gt>  Specify the name."
	echo "  -a, --age <lt>age<gt>    Specify the age."
	echo "  <lt>args<gt>          required arguments."
	exit 0
fi

# Flags
echo -e "
Flags:"
$verbose && echo "Verbose mode is ON"

#  Example of using the optional arguments.
echo -e "
optional arguments"
[ -n "$name" ] || name="some things"
[ -n "$age" ] || age=1

if [ -n "$name" ] && [ -n "$age" ]; then
	echo "Hello, $name! You are $age years old."
fi

# positional arguments
echo -e "
Position argument: "

for i in $@; do
	echo $i
done
<finish>

exit 0
		]=],
			{
				lt = t("<"),
				gt = t(">"),
				finish = i(0),
			}
		)
	),
})
