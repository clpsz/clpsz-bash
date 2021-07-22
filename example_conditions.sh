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
