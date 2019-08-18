module main
import os
import time
import gx
import gg
import glfw  
const (Size  = 600
       MaxDisks = 31)
struct Context {
  gg *gg.GG
}
fn (ctx &Context) draw_disk(disk,fromx,tox,fromy,toy int) {
  disk_xsize := disk * Size/3 / MaxDisks
  ctx.gg.draw_rect( (fromx-1) * Size/3 + Size/6 -disk_xsize/2, Size- fromy*Size / MaxDisks, disk_xsize , Size / MaxDisks, gx.Black) //clear from disk
  ctx.gg.draw_rect( (tox - 1) * Size/3 + Size/6 -disk_xsize/2, Size- toy * Size / MaxDisks, disk_xsize , Size / MaxDisks, gx.rgb(disk*8,8*MaxDisks-8*disk,0)) 
} 
// move_one disk and print and draw it
// pole array is not required for recursive algorithm - just for visulisation ctx
fn move_one(disk,from,to int, pole [] int, ctx &Context)
{ pole[0]++ //counter for moves up to 2³¹ with datatype int as i32
  println('Move disk $disk from pole $from to pole $to')
  pole[to]++
  gg.post_empty_event() 
  ctx.draw_disk(disk,from,to,pole[from],pole[to])
  ctx.gg.render()
  pole[from]--
  println(pole)
  time.sleep_ms(12) //change ms depending on graphic timing issues 
  //os.get_line() //comment out to move faster, but with graphic timing issues
}
fn move(disks,from,via,to int,pole mut [] int, ctx &Context) { 
  if disks == 1 {
    move_one(disks,from,to, pole, ctx)
  }
  if disks > 1 {
    move(disks - 1,from,to,via,mut pole, ctx)
    move_one(disks,from,to, pole, ctx)
    move(disks - 1,via,from,to,mut pole, ctx)
  }   
}
fn main(){
  println('============= Towers of Hanoi =============')
  println('push <return> for moves or <ctrl-C> to stop')
  println('How many disks(1-$MaxDisks) from pole 1 to pole 3?')
  line := os.get_line()
  diskn := line.int()
  glfw.init()
  ctx:= &Context{ 
    gg: gg.new_context(gg.Cfg {
      width: Size 
      height: Size 
      use_ortho: true 
      create_window: true 
      window_title: 'Towers of Hanoi' 
      window_user_ptr: ctx 
      always_on_top: true
    })
  }  
  gg.clear(gx.Black)
  mut pole := [0, diskn, 0, 0]
  println(pole)
  if diskn > MaxDisks || diskn < 1 {
    println('error: $line is not in range 1 to $MaxDisks disks.')
    exit
  } else {
    //draw tower on pole 1
    for diski:=0;diski <= diskn; diski++ {    
    ctx.draw_disk(diski,0,1,0,1+diskn-diski)
  }
  move(diskn,1,2,3,mut pole, ctx)
  os.get_line() // wait for <return>
  }
}
