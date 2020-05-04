// these examples, respectively, refer to integer, float, boolean, and string objects
example1 := 3
example2 := 3.0
example3 := true
mut example4 := 'hello'

// not posible, example1 not mutable
// example1 = 4
println(example1)
println(example2)
println('$example2')
println(example3)
println(example4)
// example4 now changed.
example4 = 'goodbye'
