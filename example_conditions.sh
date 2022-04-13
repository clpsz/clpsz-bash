# !/bin/bash


regex='(.*): (.*)'

IFS=$'\n'
for line in `head -11 .gitlab-ci.yml | grep '^  .*' | grep -o '[A-Z].*'`; do
    [[ $line =~ $regex ]] || continue
    IFS=': ' read -ra ADDR <<< "$line"
    var=${BASH_REMATCH[1]}
    val=`echo ${BASH_REMATCH[2]} | cut -c2- | rev | cut -c2- | rev`
    export $var=$val
done

## check suffix, prefix
var='hello-world'

if [[ $var == *-world ]]; then
    echo 'has -world suffix'
fi
if [[ $var == hello-* ]]; then
    echo 'has hello- prefix'
fi
echo

## substitution
var='hello-world'
var_replace_suffix=${var%-world}
var_replace_prefix=${var#hello-}
echo $var_replace_suffix
echo $var_replace_prefix
echo

## check last command return value
unknown_command
if [ $? -ne 0 ]; then
    echo 'command error'
fi
echo 'reach line after error'
