package main

import "core:fmt"
import "core:math"
import rl "vendor:raylib"

debug := false

width := i32(1280)
height := i32(1412)
size := rl.Vector3{2, 2, 2}

main :: proc() {
  rl.SetConfigFlags(rl.ConfigFlags{.WINDOW_RESIZABLE, .WINDOW_UNFOCUSED})
  rl.InitWindow(width, height, "game prototype")

  rl.SetWindowPosition(rl.GetMonitorWidth(0), 0)
  rl.SetTargetFPS(rl.GetMonitorRefreshRate(1) * 3)

  width = rl.GetScreenWidth()
  height = rl.GetScreenHeight()

  init()

  for !rl.WindowShouldClose() {
    update()
    draw()
  }
}

init :: proc() {
  init_terrain()
  init_camera()
}

update :: proc() {
  handle_input()
  update_player()
  update_camera()
}

draw :: proc() {
  rl.BeginDrawing()
  rl.ClearBackground(rl.BLACK)
  rl.BeginMode3D(camera)

  draw_terrain()
  draw_camera()

  rl.EndMode3D()
  draw_camera()

  rl.DrawFPS(10, 10)
  rl.EndDrawing()
}
