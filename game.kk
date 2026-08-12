import std/num/int32
import std/num/float64
import raylib

struct player
  pos : vector2
  vel : vector2

fun draw(player : player)
  draw-circle2(player.pos, 16.0, blue)
  draw-text(player.vel.show(), 40.i32, 40.i32, 20.i32, black)

fun update(player : player, dt : float64) : raylib-io player
  var vel-add := raylib/zero
  if is-key-down(key-down) then vel-add := vel-add + down
  if is-key-down(key-up) then vel-add := vel-add + up
  if is-key-down(key-right) then vel-add := vel-add + right
  if is-key-down(key-left) then vel-add := vel-add + left
  val vel-len = vel-add.len()
  if vel-len > 0.0 then vel-add := vel-add * (1.0 / vel-len)
  vel-add := vel-add * 8.0
 
  player(pos = player.pos + player.vel * dt * 64.0, vel = vel-add * 0.1 + player.vel * 0.9)
  

// This is just for testing out some stuff
fun main() {
  init-window(800.i32, 450.i32, "raylib + koka")
  set-target-fps(144.i32)
  var player := Player(Vector2(200.0,200.0), raylib/zero)
  while (fn() !(window-should-close()))
    val dt = get-frame-time()
    begin-drawing()
    clear-background(raywhite)
    // draw-circle2(Vector2(x_, 225.0), 50.0, red)
    draw-rectangle(Rect(20.0, 20.0, 200.0, 80.0), sky-blue)
    draw-text("Hello from Koka!", 20.i32, 120.i32, 20.i32, black)

    player := player.update(dt)
    player.draw()
         
    draw-fps(10.i32, 10.i32)
    end-drawing()
  
  close-window()
}
