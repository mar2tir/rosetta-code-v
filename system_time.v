import time

fn main() {    
    t := time.now()
    s := t.unix_time()
    // String representation
    println(t)

    // Unix time (number of seconds that have elapsed since 1970-01-01)
    println(s)

    // There are different formats
    // YYYY-MM-DD HH:MM:SS
    println(t.format_ss())
}