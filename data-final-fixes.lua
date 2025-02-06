-- all prototypes that should be shrunk
local prototypes = {
  "accumulator",
  "agricultural-tower",
  "ammo-turret",
  "arithmatic-combinator",
  "artillery-turret",
  "artillery-wagon",
  "assembling-machine",
  "asteroid",
  "asteroid-collector",
  "beacon",
  "boiler",
  "burner-generator",
  "capture-robot",
  "car",
  "cargo-bay",
  "cargo-landing-pad",
  "cargo-pod",
  "cargo-wagon",
  "character",
  "character-corpse",
  "cliff",
  "combat-robot",
  "constant-combinator",
  "construction-robot",
  "container",
  "corpse",
  "curved-rail-a",
  "curved-rail-b",
  "decider-combinator",
  "display-panel",
  "electrical-energy-interface",
  "electric-pole",
  "electric-turret",
  "elevated-curved-rail-a",
  "elevated-curved-rail-b",
  "elevated-half-diagonal-rail",
  "elevated-straight-rail",
  "fish",
  "fluid-turret",
  "fluid-wagon",
  "furnace",
  "fusion-generator",
  "fusion-reactor",
  "gate",
  "generator",
  "half-diagonal-rail",
  "heat-interface",
  "heat-pipe",
  "infinity-container",
  "infinity-pipe",
  "inserter",
  "lab",
  "lamp",
  "land-mine",
  "lane-splitter",
  "legacy-curved-rail",
  "legacy-straight-rail",
  "lightning-attractor",
  "linked-belt",
  "linked-container",
  "loader",
  "loader-1x1",
  "locomotive",
  "logistic-container",
  "logistic-robot",
  "market",
  "mining-drill",
  "offshore-pump",
  "pipe",
  "pipe-to-ground",
  "power-switch",
  "programmable-speaker",
  "pump",
  "radar",
  "rail-chain-signal",
  "rail-ramp",
  "rail-signal",
  "rail-support",
  "reactor",
  "resource",
  "roboport",
  "rocket-silo",
  "segment",
  "segmented-unit",
  "selector-combinator",
  "simple-entity",
  "simple-entity-with-force",
  "simple-entity-with-owner",
  "solar-panel",
  "space-platform-hub",
  "spider-leg",
  "spider-unit",
  "spider-vehicle",
  "splitter",
  "storage-tank",
  "straight-rail",
  "temporary-container",
  "thruster",
  "train-stop",
  "transport-belt",
  "tree",
  "turret",
  "underground-belt",
  "unit",
  "unit-spawner",
  "wall"
}
    
local percent = 1 - (settings.startup["selection-box-shrink-percent"].value / 100)
local amount = settings.startup["selection-box-shrink-int"].value

for _, category in pairs(prototypes) do
  for p, prototype in pairs(data.raw[category] or {}) do

    if settings.startup["selection-collision-box-unify"].value and prototype.collision_box then
      if prototype.collision_box.left_top then
        prototype.selection_box = {
          {
            prototype.collision_box.left_top[1],
            prototype.collision_box.left_top[2]
          },
          {
            prototype.collision_box.right_bottom[1],
            prototype.collision_box.right_bottom[2]
          }
        }
      else
        prototype.selection_box = {
          {
            prototype.collision_box[1][1],
            prototype.collision_box[1][2]
          },
          {
            prototype.collision_box[2][1],
            prototype.collision_box[2][2]
          }
        }
      end
    elseif prototype.selection_box then
      if prototype.selection_box.left_top then
        prototype.selection_box = {
          {
            prototype.selection_box.left_top[1] * percent + amount,
            prototype.selection_box.left_top[2] * percent + amount
          },
          {
            prototype.selection_box.right_bottom[1] * percent - amount,
            prototype.selection_box.right_bottom[2] * percent - amount
          }
        }
      else
        prototype.selection_box = {
          {
            prototype.selection_box[1][1] * percent + amount,
            prototype.selection_box[1][2] * percent + amount
          },
          {
            prototype.selection_box[2][1] * percent - amount,
            prototype.selection_box[2][2] * percent - amount
          }
        }
      end
    end
  end
end