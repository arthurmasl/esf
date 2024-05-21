package main

import rl "vendor:raylib"

turbo: bool
key_pressed: bool

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
  if is_key_down() {
    if rl.IsKeyDown(.E) do player.acc.z += 1
    if rl.IsKeyDown(.D) do player.acc.z -= 1
    if rl.IsKeyDown(.S) do player.acc.x -= 1
    if rl.IsKeyDown(.F) do player.acc.x += 1

    if rl.IsKeyDown(.SPACE) do player.acc.y += 1
    if rl.IsKeyDown(.Z) do player.acc.y -= 1
  }

  if rl.IsKeyPressed(.T) do turbo = !turbo

  if player.acc != 0 do player.acc = rl.Vector3Normalize(player.acc)
}
