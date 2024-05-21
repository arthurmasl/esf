package main

import "core:fmt"
import rl "vendor:raylib"

camera: rl.Camera3D
center: rl.Vector2
ray: rl.Ray

init_camera :: proc() {
  center = {f32(width / 2), f32(height / 2)}
  camera = {
    position   = {0, 20, 50},
    target     = {0, 0, 0},
    up         = {0, 10, 0},
    fovy       = 45,
    projection = .PERSPECTIVE,
  }

}

update_camera :: proc() {
  camera.target = player.pos
  camera.position = {player.pos.x, player.pos.y + 20, player.pos.z + 50}

  ray = rl.GetMouseRay(rl.GetMousePosition(), camera)

  // rl.UpdateCamera(&camera, .FIRST_PERSON)
  // rl.UpdateCameraPro(&camera, player.pos, 0, 1)
}

draw_camera :: proc() {
  rl.DrawRay(ray, rl.PURPLE)
  rl.DrawCircleV(rl.GetMousePosition(), 5, rl.PURPLE)

  rl.DrawLine3D(player.pos, ray.position, rl.PURPLE)
}
