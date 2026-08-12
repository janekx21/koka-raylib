import std/num/int32
import std/num/float64
import raylib

struct player
  pos : vector2

fun draw-player(player : player)
  draw-circle2(player.pos, 8.0, blue)

// This is just for testing out some stuff
fun main() {
  init-window(800.i32, 450.i32, "raylib + koka")
  set-target-fps(60.i32)
  var x_ := 0.0
  var player := Player(Vector2(200.0,200.0))
  while (fn() !(window-should-close()))
    val dt = get-frame-time()
    x_ := x_ + dt*64.0
    begin-drawing()
    clear-background(raywhite)
    draw-circle2(Vector2(x_, 225.0), 50.0, red)
    draw-rectangle(Rect(20.0, 20.0, 200.0, 80.0), sky-blue)
    draw-text("Hello from Koka!", 20.i32, 120.i32, 20.i32, black)

    if is-key-down(key-down) then
      player := player(pos = Vector2(player.pos.x,player.pos.y + dt * 64.0))// player.pos.y + dt * 64.0
    
    draw-player(player)

      

    
    draw-fps(10.i32, 10.i32)
    end-drawing()
  
  close-window()
}
