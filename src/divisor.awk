#!/usr/bin/awk -f

function output_divisors(n, divisors,    key, i, divs_count) {
    divs_count = length(divisors)
    i = 1
    printf "%d: %d", n, divisors[i++]
    for (; i <= divs_count; i++) {
        printf " %d", divisors[i]
    }
    print ""
}

function divisor(n,    divisors, i, j, another_i) {
    j = 1
    for (i = 1; i * i <= n; i++) {
        if (n % i == 0) {
            divisors[j++] = i
            another_i = n / i
            if (i != another_i) {
                divisors[j++] = another_i
            }
        }
    }

    asort(divisors)
    output_divisors(n, divisors)
}

function _log(msg,    stderr) {
    logging::_log(msg)
}

function error_log(msg,    stderr) {
    logging::_log(msg)
}

function is_number(input) {
    if (!input) {
        error_log("empty input")
        return 1
    } else if (input !~ /[0-9]+/) {
        error_log("‘" input "’ is not a number")
        return 1
    } else if (input <= 0)  {
        error_log("must be 1 or more")
        return 1
    }

    return 0
}

function validate_stdin(input) {
    return is_number(input)
}

function validate_argv(input) {
    if (input == "-") {
        return 0
    } 

    return is_number(input)
}

function handle_argv(input,   line, stdin) {
    stdin = "/dev/stdin"

    if (input == "-") {
        if ((getline line < stdin) > 0) {
            input = line
        } else {
            error_log("failed to get a line")
            return
        }
    }

    if (validate_argv(input) != 0) {
        return
    }

    divisor(input)
}


function do_all(    i) {
    for (i = 1; i < ARGC; i++) {
        handle_argv(ARGV[i])
    }
}

BEGIN {
    if (ARGC == 2 && ARGV[1] == "-") {
        # do nothing in BEGIN
        delete ARGV[1]
    } else if (ARGC > 1) {
        do_all()
        exit 0
    }
}

$1 ~ /[0-9]+/ && $1 > 0 {
    divisor($1)
    next
}

{
    if (validate_stdin($1) != 0) {
        next
    }
    divisor($1)
}

