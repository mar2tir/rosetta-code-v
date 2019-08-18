module main
import os
const (
  MaxDisks = 31 // more than 31 is not useful if the pole array is used with i32 aka int
)
// move_one prints which single disk is moved and updates the array of pole height in number of disks
fn move_one(disk,from,to int, pole [] int)
{
  println('Move disk $disk from pole $from to pole $to')
  pole[0]++ // 0 pole: the counter for moves
  pole[from]--
  pole[to]++
  println(pole)
}
// move disks until MaxDisks each: Only smaller disks can be moved on an empty pole or on a bigger disks 
fn move(disks,from,via,to int,pole mut [] int) { 
  if disks == 1 {
    move_one(disks,from,to, pole)
  }
  if disks > 1 {
    move(disks - 1,from,to,via,mut pole) // recursion
    move_one(disks,from,to, pole)        // works only without "mut pole", why?
    move(disks - 1,via,from,to,mut pole) // recursion
  }   
}
// main start of program
fn main(){
  println('Towers of Hanoi: How many disks(1-$MaxDisks) from pole 1 to pole 3?')
  line := os.get_line()
  diskn := line.int()

  mut pole := [0, diskn, 0, 0]
  println(pole)

  if diskn > MaxDisks || diskn < 1 {
    println('error: $line is not in range 1 to $MaxDisks disks.')
  } else {
    move(diskn,1,2,3,mut pole)
  }
}
