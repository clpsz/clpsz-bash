# !/bin/bash

reset_git_repository () {
    git_dir=$1
    git_ref=$2

    cd $git_dir
    git reset --hard
    git clean -fd
    git checkout master
    git pull --prune
    git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D || true
    git checkout --track $git_ref
}

match_re() {
    line=$1
    pattern=$2
    if [[ $line =~ $pattern ]]; then
        echo 'true'
    else
        echo 'false'
    fi
}
# [[ $(match_re hello hello) = "true" ]] && echo 'true'
# [[ $(match_re hello "hel.*") = "true" ]] && echo 'true'
# [[ $(match_re hello "hel.*1") = "false" ]] && echo 'false'


get_re_group1() {
    line=$1
    pattern=$2
    [[ $line =~ $pattern ]]
    echo ${BASH_REMATCH[1]}
}

get_re_group2() {
    line=$1
    pattern=$2
    [[ $line =~ $pattern ]]
    echo ${BASH_REMATCH[2]}
}
# get_re_group2 "hello world" "(hello) (.*)"
