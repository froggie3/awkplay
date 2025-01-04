#!/usr/bin/awk -f

function help_then_exit() {
    print "usage: anybloat [NUMBER | --help]"
    exit 0;
}


BEGIN {
    MAX_LIMIT = (2 ^ 31) - 1
    n = 1

    if (ARGC < 2) help_then_exit()

    for (i = 1; i < ARGC; i++) 
        if (ARGV[i] ~ /[0-9]+/) 
            n = ARGV[i]

    srand()
    for (i = 0; i < n; i++)
        print int(rand() * MAX_LIMIT)
}
