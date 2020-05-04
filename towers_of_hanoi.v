module main
import os
const (
  max_disks = 31 
 )
 // more than 31 is not useful if the pole array is used with i32 aka int
// move_one prints which single disk is moved and updates the array of pole height in number of disks
fn move_one(disk,from,to,no_via int, poles []int) []int
{
println('Move disk $disk from pole $from to pole $to')
mut pole := poles
pole[0]++ 
// 0 pole: the counter for moves
pole[from]--
pole[to]++
println(pole) 
return (pole)
}
// move disks until max_disks each: Only smaller disks can be moved on an empty pole or on a bigger disks 
fn move(disks,from,via,to int,pole []int) []int { 
  if disks == 1 {
    p := move_one(disks,from,to,via, pole)
    return (p)
    }
  if disks > 1 {
    p1 :=  move(disks - 1,from,to,via, pole) // recursion
    p2:= move_one(disks,from,to,via, p1)
    p3 := move(disks - 1,via,from,to, p2) // recursion
    return(p3)
  }   
}
// main start of program
fn main(){
  print('Towers of Hanoi: How many disks(1-$max_disks) from pole 1 to pole 3?')
  line := os.get_line()
  diskn := line.int()
  mut pole := []int{len:4}
  pole[1] += diskn
  println(pole)

  if diskn > max_disks || diskn < 1 {
    println('error: $line is not in range 1 to $max_disks disks.')
  } else {
    pole = move(diskn,1,2,3,pole)
  }
}
