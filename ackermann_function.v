module main

fn ackermann(m, n u32) u32 {
	if m == 0 {
		return n + 1
	} else if n == 0 {
		return ackermann(m - 1, 1)
	} else {
		return ackermann(m - 1, ackermann(m, n - 1))
	}
}

fn main() {
        for m := 0; m <= 4; m++ {
                for n := 0; n < 6 - m; n++ {
                        println('Ackermann($m, $n) = ${ackermann(m, n)}')
                }
        }
}
 