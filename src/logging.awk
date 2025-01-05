@namespace "logging"

function _log(msg,    stderr) {
    stderr = "/dev/stderr"
    print "debug:", msg >> stderr
}

function error_log(msg,    stderr) {
    stderr = "/dev/stderr"
    print "error:", msg >> stderr
}