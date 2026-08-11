// raylib_koka.c
#include <raylib.h>

// ------------------------------------------------------------------
// Window management
// ------------------------------------------------------------------

kk_unit_t kk_init_window(int32_t width, int32_t height, kk_string_t title, kk_context_t* ctx) {
    kk_ssize_t len = kk_string_len(title, ctx);
    const char* ctitle = kk_string_cbuf_borrow(title, &len, ctx);
    InitWindow(width, height, ctitle);
    kk_string_drop(title, ctx);
    return kk_Unit;
}

kk_unit_t kk_close_window(kk_context_t* ctx) {
    CloseWindow();
    return kk_Unit;
}

bool kk_window_should_close(kk_context_t* ctx) {
    return WindowShouldClose();
}

bool kk_is_window_ready(kk_context_t* ctx) {
    return IsWindowReady();
}

bool kk_is_window_fullscreen(kk_context_t* ctx) {
    return IsWindowFullscreen();
}

kk_unit_t kk_toggle_fullscreen(kk_context_t* ctx) {
    ToggleFullscreen();
    return kk_Unit;
}

kk_unit_t kk_set_window_title(kk_string_t title, kk_context_t* ctx) {
    const char* ctitle = kk_string_cbuf_borrow(title, NULL, ctx);
    SetWindowTitle(ctitle);
    kk_string_drop(title, ctx);
    return kk_Unit;
}

kk_unit_t kk_set_window_size(int32_t width, int32_t height, kk_context_t* ctx) {
    SetWindowSize(width, height);
    return kk_Unit;
}

int32_t kk_get_screen_width(kk_context_t* ctx) {
    return GetScreenWidth();
}

int32_t kk_get_screen_height(kk_context_t* ctx) {
    return GetScreenHeight();
}

// ------------------------------------------------------------------
// Drawing
// ------------------------------------------------------------------

kk_unit_t kk_begin_drawing(kk_context_t* ctx) {
    BeginDrawing();
    return kk_Unit;
}

kk_unit_t kk_end_drawing(kk_context_t* ctx) {
    EndDrawing();
    return kk_Unit;
}

kk_unit_t kk_clear_background(int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    ClearBackground((Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    return kk_Unit;
}

kk_unit_t kk_begin_scissor_mode(int32_t x, int32_t y, int32_t width, int32_t height, kk_context_t* ctx) {
    BeginScissorMode(x, y, width, height);
    return kk_Unit;
}

kk_unit_t kk_end_scissor_mode(kk_context_t* ctx) {
    EndScissorMode();
    return kk_Unit;
}

// ------------------------------------------------------------------
// Timing
// ------------------------------------------------------------------

kk_unit_t kk_set_target_fps(int32_t fps, kk_context_t* ctx) {
    SetTargetFPS(fps);
    return kk_Unit;
}

double kk_get_frame_time(kk_context_t* ctx) {
    return (double)GetFrameTime();
}

double kk_get_time(kk_context_t* ctx) {
    return GetTime();
}

int32_t kk_get_fps(kk_context_t* ctx) {
    return GetFPS();
}

// ------------------------------------------------------------------
// Shapes
// ------------------------------------------------------------------

kk_unit_t kk_draw_pixel(double x, double y, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    DrawPixelV((Vector2){ (float)x, (float)y }, (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    return kk_Unit;
}

kk_unit_t kk_draw_line(double x1, double y1, double x2, double y2, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    DrawLineV((Vector2){ (float)x1, (float)y1 }, (Vector2){ (float)x2, (float)y2 },
              (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    return kk_Unit;
}

kk_unit_t kk_draw_line_ex(double x1, double y1, double x2, double y2, double thick, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    DrawLineEx((Vector2){ (float)x1, (float)y1 }, (Vector2){ (float)x2, (float)y2 }, (float)thick,
               (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    return kk_Unit;
}

kk_unit_t kk_draw_circle(double cx, double cy, double radius, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    DrawCircleV((Vector2){ (float)cx, (float)cy }, (float)radius,
                (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    return kk_Unit;
}

kk_unit_t kk_draw_circle_lines(double cx, double cy, double radius, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    DrawCircleLinesV((Vector2){ (float)cx, (float)cy }, (float)radius,
                      (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    return kk_Unit;
}

kk_unit_t kk_draw_rectangle(double x, double y, double w, double h, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    DrawRectangleRec((Rectangle){ (float)x, (float)y, (float)w, (float)h },
                      (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    return kk_Unit;
}

kk_unit_t kk_draw_rectangle_lines(double x, double y, double w, double h, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    DrawRectangleLinesEx((Rectangle){ (float)x, (float)y, (float)w, (float)h }, 1.0f,
                          (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    return kk_Unit;
}

// kk_unit_t kk_draw_rectangle_rounded(double x, double y, double w, double h, double roundness, int32_t segments, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
//     DrawRectangleRounded((Rectangle){ (float)x, (float)y, (float)w, (float)h }, (float)roundness, segments,
//                           (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
//     return kk_Unit;
// }

// kk_unit_t kk_draw_triangle(double x1, double y1, double x2, double y2, double x3, double y3, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
//     DrawTriangle((Vector2){ (float)x1, (float)y1 }, (Vector2){ (float)x2, (float)y2 }, (Vector2){ (float)x3, (float)y3 },
//                  (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
//     return kk_Unit;
// }

kk_unit_t kk_draw_poly(double cx, double cy, int32_t sides, double radius, double rotation, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    DrawPoly((Vector2){ (float)cx, (float)cy }, sides, (float)radius, (float)rotation,
             (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    return kk_Unit;
}

bool kk_check_collision_recs(double x1, double y1, double w1, double h1, double x2, double y2, double w2, double h2, kk_context_t* ctx) {
    return CheckCollisionRecs((Rectangle){ (float)x1, (float)y1, (float)w1, (float)h1 },
                               (Rectangle){ (float)x2, (float)y2, (float)w2, (float)h2 });
}

bool kk_check_collision_circles(double x1, double y1, double r1, double x2, double y2, double r2, kk_context_t* ctx) {
    return CheckCollisionCircles((Vector2){ (float)x1, (float)y1 }, (float)r1, (Vector2){ (float)x2, (float)y2 }, (float)r2);
}

bool kk_check_collision_point_rec(double px, double py, double x, double y, double w, double h, kk_context_t* ctx) {
    return CheckCollisionPointRec((Vector2){ (float)px, (float)py }, (Rectangle){ (float)x, (float)y, (float)w, (float)h });
}

// ------------------------------------------------------------------
// Text
// ------------------------------------------------------------------

kk_unit_t kk_draw_text(kk_string_t text, int32_t x, int32_t y, int32_t fontSize, int32_t r, int32_t g, int32_t b, int32_t a, kk_context_t* ctx) {
    const char* ctext = kk_string_cbuf_borrow(text, NULL, ctx);
    DrawText(ctext, x, y, fontSize, (Color){ (unsigned char)r, (unsigned char)g, (unsigned char)b, (unsigned char)a });
    kk_string_drop(text, ctx);
    return kk_Unit;
}

kk_unit_t kk_draw_fps(int32_t x, int32_t y, kk_context_t* ctx) {
    DrawFPS(x, y);
    return kk_Unit;
}

int32_t kk_measure_text(kk_string_t text, int32_t fontSize, kk_context_t* ctx) {
    const char* ctext = kk_string_cbuf_borrow(text, NULL, ctx);
    int32_t result = MeasureText(ctext, fontSize);
    kk_string_drop(text, ctx);
    return result;
}

// ------------------------------------------------------------------
// Input: keyboard
// ------------------------------------------------------------------

bool kk_is_key_pressed(int32_t key, kk_context_t* ctx)  { return IsKeyPressed(key); }
bool kk_is_key_down(int32_t key, kk_context_t* ctx)     { return IsKeyDown(key); }
bool kk_is_key_released(int32_t key, kk_context_t* ctx) { return IsKeyReleased(key); }
bool kk_is_key_up(int32_t key, kk_context_t* ctx)       { return IsKeyUp(key); }
int32_t kk_get_key_pressed(kk_context_t* ctx)           { return GetKeyPressed(); }

// ------------------------------------------------------------------
// Input: mouse
// ------------------------------------------------------------------

bool kk_is_mouse_button_pressed(int32_t button, kk_context_t* ctx)  { return IsMouseButtonPressed(button); }
bool kk_is_mouse_button_down(int32_t button, kk_context_t* ctx)     { return IsMouseButtonDown(button); }
bool kk_is_mouse_button_released(int32_t button, kk_context_t* ctx) { return IsMouseButtonReleased(button); }
bool kk_is_mouse_button_up(int32_t button, kk_context_t* ctx)       { return IsMouseButtonUp(button); }

double kk_get_mouse_x(kk_context_t* ctx) { return (double)GetMouseX(); }
double kk_get_mouse_y(kk_context_t* ctx) { return (double)GetMouseY(); }
double kk_get_mouse_wheel_move(kk_context_t* ctx) { return (double)GetMouseWheelMove(); }
