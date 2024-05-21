package main

import "core:fmt"
import rl "vendor:raylib"

camera: rl.Camera3D
center: rl.Vector2
cursor: rl.Vector2
direction: rl.Vector3

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
  cursor = rl.GetMousePosition()
  direction = rl.Vector3{cursor.x, 0, cursor.y} - rl.Vector3{center.x, 0, center.y}

  camera.target = player.pos
  camera.position = {player.pos.x, player.pos.y + 20, player.pos.z + 50}

  ray = rl.GetMouseRay(rl.GetMousePosition(), camera)

  // rl.UpdateCamera(&camera, .FIRST_PERSON)
}

draw_camera :: proc() {
  // rl.DrawCircleV(rl.GetMousePosition(), 5, rl.PURPLE)
  // rl.DrawRay(ray, rl.PURPLE)
  // rl.DrawLine3D(player.pos, ray.position, rl.PURPLE)
}
