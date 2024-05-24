package main

import "core:fmt"
import "core:math"
import rl "vendor:raylib"

camera: rl.Camera3D
center: rl.Vector2
cursor: rl.Vector2
direction: rl.Vector3

speed := f32(SPEED_NORMAL)

SPEED_NORMAL :: 0.05
SPEED_TURBO :: 0.5
SENS :: f32(0.1)

init_camera :: proc() {
  center = {f32(width / 2), f32(height / 2)}
  camera = {
    position   = {0, 1, 10},
    target     = {0, 2, 0},
    up         = {0, 1, 0},
    fovy       = 60,
    projection = .PERSPECTIVE,
  }

  rl.DisableCursor()
}

update_camera :: proc() {
  speed = turbo ? SPEED_TURBO : SPEED_NORMAL

  rl.UpdateCameraPro(
    &camera,
    {player.acc.x * speed, player.acc.z * speed, player.acc.y * speed},
    {rl.GetMouseDelta().x * SENS, rl.GetMouseDelta().y * SENS, 0},
    0,
  )

  if camera.position.y >= 1.1 {
    in_air = true
  }
  if camera.position.y <= 1 {
    in_air = false
    down = false
  }
}

draw_camera :: proc() {
  rl.DrawCircleV(center, 3, rl.MAROON)
}
