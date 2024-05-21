package main

import "core:fmt"
import "core:math"
import rl "vendor:raylib"

camera: rl.Camera3D
center: rl.Vector2
cursor: rl.Vector2
direction: rl.Vector3

speed := f32(0.5)

SPEED_NORMAL :: 0.5
SPEED_TURBO :: 2
SENS :: f32(0.1)

init_camera :: proc() {
  center = {f32(width / 2), f32(height / 2)}
  camera = {
    position   = {0, 20, 50},
    target     = {0, 0, 0},
    up         = {0, 10, 0},
    fovy       = 85,
    projection = .PERSPECTIVE,
  }

  rl.DisableCursor()
}

update_camera :: proc() {
  // camera.fovy = turbo ? 90 : 85
  speed = turbo ? SPEED_TURBO : SPEED_NORMAL

  rl.UpdateCameraPro(
    &camera,
    {player.acc.z * speed, player.acc.x * speed, player.acc.y * speed},
    {rl.GetMouseDelta().x * SENS, rl.GetMouseDelta().y * SENS, 0},
    0,
  )
}

draw_camera :: proc() {
  rl.DrawCircleV(center, 3, rl.MAROON)
}
