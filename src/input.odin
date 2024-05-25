package main

import "core:fmt"
import rl "vendor:raylib"

key_pressed: bool

JUMP_HEIGHT :: 5
JUMP_POWER :: 2

is_key_down :: proc() -> bool {
  return(
    rl.IsKeyDown(.E) ||
    rl.IsKeyDown(.D) ||
    rl.IsKeyDown(.S) ||
    rl.IsKeyDown(.F) ||
    rl.IsKeyDown(.SPACE) ||
    rl.IsKeyDown(.Z) \
  )
}

is_key_up :: proc() -> bool {
  return(
    rl.IsKeyUp(.E) &&
    rl.IsKeyUp(.D) &&
    rl.IsKeyUp(.S) &&
    rl.IsKeyUp(.F) &&
    rl.IsKeyUp(.SPACE) &&
    rl.IsKeyUp(.Z) \
  )
}

handle_input :: proc() {
  if rl.IsKeyPressed(.U) do debug = !debug

  player.acc = {}
  if rl.IsKeyDown(.E) do player.acc.x += 1
  if rl.IsKeyDown(.D) do player.acc.x -= 1
  if rl.IsKeyDown(.S) do player.acc.z -= 1
  if rl.IsKeyDown(.F) do player.acc.z += 1

  if rl.IsKeyDown(.SPACE) {
    player.acc.y += JUMP_POWER
  }

  if in_air && rl.IsKeyDown(.Z) {
    player.acc.y -= JUMP_POWER
  }

  if rl.IsKeyPressed(.T) {
    turbo = !turbo
  }

  if player.acc != 0 do player.acc = rl.Vector3Normalize(player.acc)
}
