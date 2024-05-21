package main

import "core:fmt"
import rl "vendor:raylib"

camera: rl.Camera3D
center: rl.Vector2
cursor: rl.Vector2
direction: rl.Vector3

ray: rl.Ray

SPEED :: f32(0.3)
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
  rl.UpdateCameraPro(
    &camera,
    {player.acc.z * SPEED, player.acc.x * SPEED, player.acc.y * SPEED},
    {rl.GetMouseDelta().x * SENS, rl.GetMouseDelta().y * SENS, 0},
    rl.GetMouseWheelMove() * 2,
  )
}

draw_camera :: proc() {
  rl.DrawCircleV(center, 3, rl.MAROON)
}
