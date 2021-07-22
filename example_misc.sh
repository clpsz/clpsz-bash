# !/bin/bash

example_dummy() {
    :
}

example_break_string() {
    line="hello;world"
    IFS=';' read -ra parts <<< "$line"
    echo ${parts[0]}
    echo ${parts[1]}
}

example_use_map() {
    declare -A mapping=(\
        ["accounting"]="corebank-modelbank-accounting"\
        ["cif"]="corebank-modelbank-cif"\
        ["connector"]="corebank-modelbank-connector"\
        ["sequence"]="corebank-modelbank-sequence"\
        ["ensemble"]="corebank-modelbank-ensemble"\
        ["syndicatedLoan"]="corebank-modelbank-syndicated-loan"\
        ["teller9"]="corebank-smart-teller9"\
    )

    for key in "${!mapping[@]}"; do
        val="${mapping[$key]}"
        echo "$key=$val"
    done
}

example_concurrent() {
    # run tech parameters
    declare -a pids

    for gap in 5 10 15; do
        sleep $gap &
        pids+=($!)
    done
    wait "${pids[@]}"
}

example_switch_case() {
    fruit=$1

    case $fruit in
    apple)
        echo 'the fruit is apple'
        ;;

    pear | banana)
        echo 'the fruit is pear or banana'
        ;;

    *)
        echo 'the fruit is something unknown'
        ;;
    esac
}

example_use_args() {
    echo "all args are: $@"
    echo "script name is : $0"
    echo "first arg is: $1"
}
# example_use_args 11 22 33

example_duration() {
    SECONDS=0
    sleep 3
    duration=$SECONDS
    echo $duration
    sleep 1
    duration=$SECONDS
    echo $duration
}
