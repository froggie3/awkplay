@namespace "deque"

function count() {
    return right - left
}

function is_empty() {
    return count() == 0
}

function pop(   err, ret) {
    err = "/dev/stderr"
    if (is_empty()) {
        print "poped from empty stack" > err
        return
    }
    ret = stack[right-1]
    delete stack[right-1]
    --right
    return ret
}

function popleft(   err, ret) {
    err = "/dev/stderr"
    if (is_empty()) {
        print "poped from empty stack" > err
        return
    }
    ret = stack[left]
    delete stack[left]
    left++
    return ret
}

function push(item) {
    stack[right++] = item
}

function pushleft(item) {
    stack[--left] = item
}

function stack_dump(     i, err){
    err = "/dev/stderr"
    i = left
    if (is_empty()) return

    printf "[dump] %s", stack[i++] > err
    while (i <= right)
        printf " %s", stack[i++] > err
    print "" > err
}

function clear() {
    delete stack
    left = 0
    right = 0
}

function test_pushleft() {
    clear()
    pushleft("a")
    if (left != -2 && right != 0) print "test_pushleft: test failed"
}

function test_push() {
    clear()
    push("a")
    # left, right will be the position where the next call writes at
    if (left != 0 && right != 2) print "test_push: test failed"
}

function test_pop(    actual) {
    clear()
    push("a")
    push("b")
    push("c")
    pop()
    pop()
    pop()
    if (left != 0 && right != 0) print "test_pop: test failed"
}

function test_pop_item(    actual) {
    clear()
    push("a")
    push("b")
    push("c")
    pop()
    pop()
    actual = pop()
    if (actual != "a") print "test_pop_item: test failed"
}

function test_popleft(  actual) {
    clear()
    push("a")
    push("b")
    push("c")
    popleft()
    popleft()
    popleft()
    if (left != 3 && right != 3) print "test_popleft: test failed"
}

function test_popleft_item(  actual) {
    clear()
    push("a")
    push("b")
    push("c")
    popleft()
    actual = popleft()
    if (actual != "b") print "test_popleft_item: test failed"
}

BEGIN {
    test_push()
    test_pushleft()
    test_pushleft()
    test_pop()
    test_pop_item()
    test_popleft()
    test_popleft_item()
    clear()
}