package main

import rl "vendor:raylib"

COUNT :: 300
RANGE :: 200

Terrain :: struct {
  pos:  rl.Vector3,
  size: rl.Vector3,
}

terrain: [COUNT]Terrain

init_terrain :: proc() {
  for &terrain in terrain {
    height := f32(rl.GetRandomValue(5, 15))

    terrain.pos = {
      f32(rl.GetRandomValue(-RANGE, RANGE)),
      height / 2,
      f32(rl.GetRandomValue(-RANGE, RANGE)),
    }
    terrain.size = {f32(rl.GetRandomValue(5, 15)), height, f32(rl.GetRandomValue(5, 15))}
  }
}

draw_terrain :: proc() {
  rl.DrawPlane({}, 500, rl.DARKGREEN)

  for &terrain in terrain {
    rl.DrawCubeV(terrain.pos, terrain.size, rl.GRAY)
    if debug do rl.DrawCubeWiresV(terrain.pos, terrain.size, rl.BLACK)
  }

  if debug do rl.DrawGrid(100, 5)
}
