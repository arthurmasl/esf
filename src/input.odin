package main

import rl "vendor:raylib"

handle_input :: proc() {
  if rl.IsKeyPressed(.U) do debug = !debug

  player.acc = {}
  if rl.IsKeyDown(.E) do player.acc.z += 1
  if rl.IsKeyDown(.D) do player.acc.z -= 1
  if rl.IsKeyDown(.S) do player.acc.x -= 1
  if rl.IsKeyDown(.F) do player.acc.x += 1

  if rl.IsKeyDown(.SPACE) do player.acc.y += 1
  if rl.IsKeyDown(.Z) do player.acc.y -= 1

  if player.acc != 0 do player.acc = rl.Vector3Normalize(player.acc)
}
