package main

import rl "vendor:raylib"

COUNT :: 100
RANGE :: 3000

Terrain :: struct {
  pos:  rl.Vector3,
  size: rl.Vector3,
}

terrain: [COUNT]Terrain

init_terrain :: proc() {
  for &terrain in terrain {
    width := f32(25)
    height := f32(rl.GetRandomValue(20, 70))

    terrain.pos = {
      f32(rl.GetRandomValue(-RANGE, RANGE)),
      height / 2,
      f32(rl.GetRandomValue(-RANGE, RANGE)),
    }
    terrain.size = {width, height, width}
  }
}

draw_terrain :: proc() {
  rl.DrawPlane({}, RANGE, rl.DARKGREEN)

  for &terrain in terrain {
    rl.DrawCubeV(terrain.pos, terrain.size, rl.GRAY)
    rl.DrawCubeWiresV(terrain.pos, terrain.size, rl.BLACK)
  }

  if debug do rl.DrawGrid(RANGE, 10)
}
