#!/usr/bin/awk -f

BEGIN {
    "date +'%Y'" | getline year
}

function print_all(     i){
    i = deque::left
    printf "%s\n[%s]\n[%s]\n\n", deque::stack[i+1], deque::stack[i], deque::stack[i+2]
}

{
    sprintf("date --date='%d0101 %+d day' +%%F", year, $1) | getline line
    deque::push(line)
    if (deque::count() >= 3) {
        print_all()
        deque::popleft()
    }
}
