package main

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

init_player :: proc() {
  player.speed = 20
  player.friction = 0.9
  player.pos.y = 1
}

update_player :: proc() {
  player.vel *= (1 - player.friction)
  player.vel += player.acc * player.speed

  player.pos += player.vel * rl.GetFrameTime()
  player.angle = -rl.Vector2LineAngle(center, rl.GetMousePosition())
}

draw_player :: proc() {
  rl.DrawCubeV(player.pos, size, rl.MAROON)
  if debug do rl.DrawCubeWiresV(player.pos, size, rl.BLACK)
}
