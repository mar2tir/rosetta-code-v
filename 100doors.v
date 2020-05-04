fn main() {
	nr := 100
	mut is_open := [0].repeat(nr)
	for pass := 0; pass < nr; pass++ {
		for door := pass; door < nr; door += pass + 1 {
			is_open[door] = (is_open[door] + 1) % 2
		}
	}
	for door := 0; door < 100; door++ {
		if is_open[door] == 1 {
			println('door ${door+1} is open')
		} else {
			println('door ${door+1} is closed')
		}
	}
}
