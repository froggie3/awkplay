#!/usr/bin/awk -f

BEGIN {
    base_time = mktime(strftime("%Y") " 01 01 00 00 00 [JST]")
    day_seconds = 86400
}

function print_all(     i){
    i = deque::left
    printf "%s\n[%s]\n[%s]\n\n", deque::stack[i+1], deque::stack[i], deque::stack[i+2]
}

{
    deque::push(strftime("%Y%m%d", day_seconds * $1 + base_time))
    if (deque::count() >= 3) {
        print_all()
        deque::popleft()
    }
}
