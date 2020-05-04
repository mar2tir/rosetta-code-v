module main

fn ackermann(n, m u32) u32 {
	if n == 0 {
		return m + 1
	} else if m == 0 {
		return ackermann(n - 1, 1)
	} else {
		return ackermann(n - 1, ackermann(n, m - 1))
	}
}

fn main() {
	print('ackermann(0, 0)')
	println(ackermann(0, 0))
	print('ackermann(1, 1)')
	println(ackermann(1, 1))
	print('ackermann(2, 2)')
	println(ackermann(2, 2))
	print('ackermann(3, 3)')
	println(ackermann(3, 3))
	print('ackermann(4, 0)')
	println(ackermann(4, 0))
	print('ackermann(3, 4)')
	println(ackermann(3, 4))
	print('ackermann(3, 11)')
	println(ackermann(3, 11))
	print('ackermann(3, 13)')
	println(ackermann(3, 13))
	print('ackermann(4, 1)')
	println(ackermann(4, 1))
}
