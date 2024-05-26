package main

import "core:math"
import rl "vendor:raylib"

Player :: struct {
  acc: rl.Vector3,
}

SPEED_NORMAL :: 0.05
SPEED_TURBO :: 0.2

player: Player

turbo: bool
fly: bool

in_air: bool
down: bool

update_player :: proc() {
  if fly do return

  if camera.position.y > 1 {
    in_air = true
  }

  if camera.position.y <= 1 {
    in_air = false
    down = false
  }

  if in_air && !down && camera.position.y >= JUMP_HEIGHT {
    down = true
  }

  if in_air && !down {
    player.acc.y += JUMP_POWER
  }

  if in_air && down {
    player.acc.y -= JUMP_POWER
  }
}
