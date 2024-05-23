package main

import rl "vendor:raylib"

COUNT :: 100
RANGE :: 400

Terrain :: struct {
  pos:  rl.Vector3,
  size: rl.Vector3,
}

terrain_large: [COUNT]Terrain
terrain_small: [COUNT]Terrain

init_terrain :: proc() {
  for &terrain in terrain_large {
    width := f32(10)
    height := f32(rl.GetRandomValue(20, 70))

    terrain.pos = {
      f32(rl.GetRandomValue(-RANGE, RANGE)),
      height / 2,
      f32(rl.GetRandomValue(-RANGE, RANGE)),
    }
    terrain.size = {width, height, width}
  }

  for &terrain in terrain_small {
    width := f32(rl.GetRandomValue(1, 2))
    height := f32(rl.GetRandomValue(1, 2))

    terrain.pos = {
      f32(rl.GetRandomValue(-RANGE, RANGE)),
      height / 2,
      f32(rl.GetRandomValue(-RANGE, RANGE)),
    }
    terrain.size = {width, height, width}
  }
}

draw_terrain :: proc() {
  rl.DrawPlane({}, RANGE * 10, rl.DARKGRAY)

  for &terrain in terrain_large {
    rl.DrawCubeV(terrain.pos, terrain.size, rl.GRAY)
    if debug do rl.DrawCubeWiresV(terrain.pos, terrain.size, rl.BLACK)
  }

  for &terrain in terrain_small {
    rl.DrawCubeV(terrain.pos, terrain.size, rl.LIGHTGRAY)
    if debug do rl.DrawCubeWiresV(terrain.pos, terrain.size, rl.BLACK)
  }

  // if debug do rl.DrawGrid(RANGE, 2)
}
