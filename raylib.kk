// raylib.kk
// Koka bindings for raylib (core window, shapes, text, timing, input).
// Scope: no textures, models, 3D camera, audio, or shaders yet -- those
// need explicit resource lifetime design (Load/Unload) and are a follow-up.

module raylib

import std/num/int32
import std/num/float64

extern import
  c file "raylib_koka.c"

// ----------------------------------------------------------------------
// Effect alias
// ----------------------------------------------------------------------
// ui       : touches the graphics system
// st<global>: mutates raylib's internal global engine state
// ndet     : results depend on the outside world (e.g. window-should-close)
pub alias raylib-io = <ui, st<global>, ndet>

// ----------------------------------------------------------------------
// Core value types
// ----------------------------------------------------------------------
// These exist only on the Koka side -- they are never passed across the
// FFI boundary as structs. The C shim always takes/returns flat scalars.

// TODO use int type instead of int32, easier to use

pub struct vector2
  x : float64
  y : float64

// TODO rename to color
pub struct rgba
  r : int32
  g : int32
  b : int32
  a : int32

pub struct rect
  x : float64
  y : float64
  w : float64
  h : float64

// A handful of raylib's built-in colors (see raylib.h for the full list;
// they're trivial to add: RAYWHITE is { 245, 245, 245, 255 }, etc.)
pub val raywhite    = Rgba(245.i32, 245.i32, 245.i32, 255.i32)
pub val white       = Rgba(255.i32, 255.i32, 255.i32, 255.i32)
pub val black       = Rgba(0.i32, 0.i32, 0.i32, 255.i32)
pub val light-gray  = Rgba(200.i32, 200.i32, 200.i32, 255.i32)
pub val gray        = Rgba(130.i32, 130.i32, 130.i32, 255.i32)
pub val dark-gray   = Rgba(80.i32, 80.i32, 80.i32, 255.i32)
pub val red         = Rgba(230.i32, 41.i32, 55.i32, 255.i32)
pub val green       = Rgba(0.i32, 228.i32, 48.i32, 255.i32)
pub val blue        = Rgba(0.i32, 121.i32, 241.i32, 255.i32)
pub val yellow      = Rgba(253.i32, 249.i32, 0.i32, 255.i32)
pub val gold        = Rgba(255.i32, 203.i32, 0.i32, 255.i32)
pub val orange      = Rgba(255.i32, 161.i32, 0.i32, 255.i32)
pub val pink        = Rgba(255.i32, 109.i32, 194.i32, 255.i32)
pub val purple      = Rgba(200.i32, 122.i32, 255.i32, 255.i32)
pub val sky-blue    = Rgba(102.i32, 191.i32, 255.i32, 255.i32)
pub val lime        = Rgba(0.i32, 158.i32, 47.i32, 255.i32)
pub val magenta     = Rgba(255.i32, 0.i32, 255.i32, 255.i32)
pub val blank       = Rgba(0.i32, 0.i32, 0.i32, 0.i32)

// A few common raylib keyboard key codes (raylib.KeyboardKey).
// These are stable GLFW-style key codes; add more as needed by copying
// the integer values straight from raylib.h's KeyboardKey enum.
pub val key-space     : int32 = 32.i32
pub val key-escape    : int32 = 256.i32
pub val key-enter     : int32 = 257.i32
pub val key-tab       : int32 = 258.i32
pub val key-backspace : int32 = 259.i32
pub val key-right     : int32 = 262.i32
pub val key-left      : int32 = 263.i32
pub val key-down      : int32 = 264.i32
pub val key-up        : int32 = 265.i32

// Mouse buttons (raylib.MouseButton)
pub val mouse-button-left   : int32 = 0.i32
pub val mouse-button-right  : int32 = 1.i32
pub val mouse-button-middle : int32 = 2.i32

// ----------------------------------------------------------------------
// Window management
// ----------------------------------------------------------------------

pub extern init-window(width: int32, height: int32, title: string) : raylib-io ()
  c "kk_init_window"

pub extern close-window() : raylib-io ()
  c "kk_close_window"

pub extern window-should-close() : raylib-io bool
  c "kk_window_should_close"

pub extern is-window-ready() : raylib-io bool
  c "kk_is_window_ready"

pub extern is-window-fullscreen() : raylib-io bool
  c "kk_is_window_fullscreen"

pub extern toggle-fullscreen() : raylib-io ()
  c "kk_toggle_fullscreen"

pub extern set-window-title(title: string) : raylib-io ()
  c "kk_set_window_title"

pub extern set-window-size(width: int32, height: int32) : raylib-io ()
  c "kk_set_window_size"

pub extern get-screen-width() : raylib-io int32
  c "kk_get_screen_width"

pub extern get-screen-height() : raylib-io int32
  c "kk_get_screen_height"

// ----------------------------------------------------------------------
// Drawing
// ----------------------------------------------------------------------

pub extern begin-drawing() : raylib-io ()
  c "kk_begin_drawing"

pub extern end-drawing() : raylib-io ()
  c "kk_end_drawing"

pub extern clear-background(color: rgba) : raylib-io ()
  c "kk_clear_background"

pub extern begin-scissor-mode(x: int32, y: int32, width: int32, height: int32) : raylib-io ()
  c "kk_begin_scissor_mode"

pub extern end-scissor-mode() : raylib-io ()
  c "kk_end_scissor_mode"

// ----------------------------------------------------------------------
// Timing
// ----------------------------------------------------------------------

pub extern set-target-fps(fps: int32) : raylib-io ()
  c "kk_set_target_fps"

pub extern get-frame-time() : ndet float64
  c "kk_get_frame_time"

pub extern get-time() : ndet float64
  c "kk_get_time"

pub extern get-fps() : ndet int32
  c "kk_get_fps"

// ----------------------------------------------------------------------
// Shapes (2D)
// ----------------------------------------------------------------------

// TODO cleanup extern functions

pub extern xdraw-pixel(x: float64, y: float64, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
  c "kk_draw_pixel"
pub fun draw-pixel(pos: vector2, color: rgba) : raylib-io ()
  xdraw-pixel(pos.x, pos.y, color.r, color.g, color.b, color.a)

pub extern xdraw-line(x1: float64, y1: float64, x2: float64, y2: float64, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
  c "kk_draw_line"
pub fun draw-line(start: vector2, end: vector2, color: rgba) : raylib-io ()
  xdraw-line(start.x, start.y, end.x, end.y, color.r, color.g, color.b, color.a)

pub extern xdraw-line-ex(x1: float64, y1: float64, x2: float64, y2: float64, thick: float64, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
  c "kk_draw_line_ex"
pub fun draw-line-ex(start: vector2, end: vector2, thick: float64, color: rgba) : raylib-io ()
  xdraw-line-ex(start.x, start.y, end.x, end.y, thick, color.r, color.g, color.b, color.a)

pub extern xdraw-circle(cx: float64, cy: float64, radius: float64, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
  c "kk_draw_circle"
pub fun draw-circle(center: vector2, radius: float64, color: rgba) : raylib-io ()
  xdraw-circle(center.x, center.y, radius, color.r, color.g, color.b, color.a)

pub extern draw-circle2(center: vector2, radius: float64, color: rgba) : raylib-io ()
  c "kk_draw_circle_2"

pub extern xdraw-circle-lines(cx: float64, cy: float64, radius: float64, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
  c "kk_draw_circle_lines"
pub fun draw-circle-lines(center: vector2, radius: float64, color: rgba) : raylib-io ()
  xdraw-circle-lines(center.x, center.y, radius, color.r, color.g, color.b, color.a)

pub extern xdraw-rectangle(x: float64, y: float64, w: float64, h: float64, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
  c "kk_draw_rectangle"
pub fun draw-rectangle(rectangle: rect, color: rgba) : raylib-io ()
  xdraw-rectangle(rectangle.x, rectangle.y, rectangle.w, rectangle.h, color.r, color.g, color.b, color.a)

pub extern xdraw-rectangle-lines(x: float64, y: float64, w: float64, h: float64, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
  c "kk_draw_rectangle_lines"
pub fun draw-rectangle-lines(rectangle: rect, color: rgba) : raylib-io ()
  xdraw-rectangle-lines(rectangle.x, rectangle.y, rectangle.w, rectangle.h, color.r, color.g, color.b, color.a)

// extern xdraw-rectangle-rounded(x: float64, y: float64, w: float64, h: float64, roundness: float64, segments: int32, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
//   c "kk_draw_rectangle_rounded"

// pub fun draw-rectangle-rounded(rectangle: rect, roundness: float64, segments: int32, color: rgba) : raylib-io ()
//   xdraw-rectangle-rounded(rectangle.x, rectangle.y, rectangle.w, rectangle.h, roundness, segments, color.r, color.g, color.b, color.a)

// extern xdraw-triangle(x1: float64, y1: float64, x2: float64, y2: float64, x3: float64, y3: float64, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
//   c "kk_draw_triangle"
// pub fun draw-triangle(v1: vector2, v2: vector2, v3: vector2, color: rgba) : raylib-io ()
//   xdraw-triangle(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y, color.r, color.g, color.b, color.a)

pub extern xdraw-poly(cx: float64, cy: float64, sides: int32, radius: float64, rotation: float64, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
  c "kk_draw_poly"
pub fun draw-poly(center: vector2, sides: int32, radius: float64, rotation: float64, color: rgba) : raylib-io ()
  xdraw-poly(center.x, center.y, sides, radius, rotation, color.r, color.g, color.b, color.a)

pub extern xcheck-collision-recs(x1: float64, y1: float64, w1: float64, h1: float64, x2: float64, y2: float64, w2: float64, h2: float64) : raylib-io bool
  c "kk_check_collision_recs"
pub fun check-collision-recs(a: rect, b: rect) : raylib-io bool
  xcheck-collision-recs(a.x, a.y, a.w, a.h, b.x, b.y, b.w, b.h)

pub extern xcheck-collision-circles(x1: float64, y1: float64, r1: float64, x2: float64, y2: float64, r2: float64) : raylib-io bool
  c "kk_check_collision_circles"
pub fun check-collision-circles(center1: vector2, radius1: float64, center2: vector2, radius2: float64) : raylib-io bool
  xcheck-collision-circles(center1.x, center1.y, radius1, center2.x, center2.y, radius2)

pub extern xcheck-collision-point-rec(px: float64, py: float64, x: float64, y: float64, w: float64, h: float64) : raylib-io bool
  c "kk_check_collision_point_rec"
pub fun check-collision-point-rec(point: vector2, rectangle: rect) : raylib-io bool
  xcheck-collision-point-rec(point.x, point.y, rectangle.x, rectangle.y, rectangle.w, rectangle.h)

// ----------------------------------------------------------------------
// Text (default font only -- custom font loading is a follow-up)
// ----------------------------------------------------------------------

pub extern xdraw-text(text: string, x: int32, y: int32, font-size: int32, r: int32, g: int32, b: int32, a: int32) : raylib-io ()
  c "kk_draw_text"
pub fun draw-text(text: string, x: int32, y: int32, font-size: int32, color: rgba) : raylib-io ()
  xdraw-text(text, x, y, font-size, color.r, color.g, color.b, color.a)

pub extern draw-fps(x: int32, y: int32) : raylib-io ()
  c "kk_draw_fps"

pub extern measure-text(text: string, font-size: int32) : raylib-io int32
  c "kk_measure_text"

// ----------------------------------------------------------------------
// Input: keyboard
// ----------------------------------------------------------------------

pub extern is-key-pressed(key: int32) : raylib-io bool
  c "kk_is_key_pressed"

pub extern is-key-down(key: int32) : raylib-io bool
  c "kk_is_key_down"

pub extern is-key-released(key: int32) : raylib-io bool
  c "kk_is_key_released"

pub extern is-key-up(key: int32) : raylib-io bool
  c "kk_is_key_up"

pub extern get-key-pressed() : raylib-io int32
  c "kk_get_key_pressed"

// ----------------------------------------------------------------------
// Input: mouse
// ----------------------------------------------------------------------

pub extern is-mouse-button-pressed(button: int32) : raylib-io bool
  c "kk_is_mouse_button_pressed"

pub extern is-mouse-button-down(button: int32) : raylib-io bool
  c "kk_is_mouse_button_down"

pub extern is-mouse-button-released(button: int32) : raylib-io bool
  c "kk_is_mouse_button_released"

pub extern is-mouse-button-up(button: int32) : raylib-io bool
  c "kk_is_mouse_button_up"

pub extern xget-mouse-x() : raylib-io float64
  c "kk_get_mouse_x"

pub extern xget-mouse-y() : raylib-io float64
  c "kk_get_mouse_y"

pub fun get-mouse-position() : raylib-io vector2
  Vector2(xget-mouse-x(), xget-mouse-y())

pub extern xget-mouse-wheel-move() : raylib-io float64
  c "kk_get_mouse_wheel_move"
pub fun get-mouse-wheel-move() : raylib-io float64 { xget-mouse-wheel-move() }


// This is just for testing out some stuff
fun main() {
  init-window(800.i32, 450.i32, "raylib + koka")
  set-target-fps(60.i32)
  var x := 0.0
  while (fn() !(window-should-close()))
    val dt = get-frame-time()
    x := x + dt*64.0
    begin-drawing()
    clear-background(raywhite)
    draw-circle2(Vector2(x, 225.0), 50.0, red)
    draw-rectangle(Rect(20.0, 20.0, 200.0, 80.0), sky-blue)
    draw-text("Hello from Koka!", 20.i32, 120.i32, 20.i32, black)
    draw-fps(10.i32, 10.i32)

    end-drawing()
  
  close-window()
}
