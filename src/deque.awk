@namespace "deque"

function count() {
    return right - left
}

function is_empty() {
    return count() == 0
}

function _log(msg) {
    if (debug) logging::_log(msg)
}

function _log_counter(  op) {
    _log("["op "]: left = " left " right = " right)
}

function pop() {
    if (is_empty()) {
        logging::error_log("poped from empty stack")
        return
    }
    delete stack[--right]
    _log_counter("pop")
}

function popleft() {
    if (is_empty()) {
        logging::error_log("poped from empty stack")
        return
    }
    delete stack[left++]
    _log_counter("popleft")
}

function push(item) {
    stack[right++] = item
    _log_counter("push")
}

function stack_dump(     i, err){
    err = "/dev/stderr"
    i = left
    if (is_empty()) {
        _log("[dump] (empty)")
        return
    }

    printf "[dump] %s", stack[i++] > err
    while (i <= right)
        printf " %s", stack[i++] > err
    print "" > err
}

BEGIN {
    debug = 0
    left = 1
    right = 1
}