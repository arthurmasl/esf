package main

import "core:math"
import rl "vendor:raylib"

Player :: struct {
  pos:      rl.Vector3,
  acc:      rl.Vector3,
  vel:      rl.Vector3,
  friction: f32,
  speed:    f32,
  angle:    f32,
}

player: Player

cube: rl.Model

init_player :: proc() {
  player.speed = 20
  player.friction = 0.9
  player.pos.y = 1

  cube = rl.LoadModelFromMesh(rl.GenMeshCube(size.x, size.y, size.z))
}

update_player :: proc() {
  player.vel *= (1 - player.friction)
  player.vel += player.acc * player.speed

  player.pos += player.vel * rl.GetFrameTime()
  player.angle = math.atan2(direction.x, direction.z) * rl.RAD2DEG - 90
}

draw_player :: proc() {
  rl.DrawModelEx(cube, camera.position, {0, 0.1, 0}, player.angle, {1, 1, 1}, rl.MAROON)

  if debug do rl.DrawCubeWiresV(player.pos, size, rl.BLACK)
}
