# Various Lua Scripts for Eluna Engine

This repository contains various Lua scripts written for use with [Eluna](https://elunaluaengine.github.io/), the Lua engine extension for various server cores. These scripts are designed to enhance gameplay, add automation, or modify default behavior in a World of Warcraft emulator environment.

## Faster Mounts

This is the most prominent script in the collection. It adjusts mount and travel form speeds greatly.

### Features

- Adjusts player speed when mounted, flying, or dead.
- Auto-learns mount spells at level 10 for each race.
- Applies custom movement speeds for:
  - Travel Form (Druid)
  - Ghost Wolf (Shaman)
- Respects various aura-based mount speed modifiers (e.g., Crusader Aura, Pursuit of Justice).
- Automatically learns travel forms for the druid and shaman.
- Allows full configuration via toggles and `world.conf` base speed.

### Configuration

Inside the script:
- `baseSpeed`: Sets the baseline run speed (7.0 is normal).

- *Any of the below can be disabled at the top of the file by setting the variable to false (lowercase).*
- `toggleShapeshiftSpeeds`: Enables special speed for shapeshift forms.
- `toggleMountLevelTen`: Automatically teaches racial mount at level 10.
- `toggleFasterDead`: Increases movement speed while dead.


---

## Digital Gathering

This script is a work in progress and will allow users to mine ore and gather herbs from a distance and remain mounted.
This still needs work and will probably require a way to tell eluna to use/deplete the gathering node and simulate the loot you would get by giving it to the player. Through testing I don't think it's possible to target a game object with a spell via eluna at this time.


---

## Faster Crafting

Still early in development. The goal is to allow for faster crafting while in safe areas, and I believe that to do this I'll simply give a haste effect to players while in a safe zone. This could have side effects, such as giving a bonus power to defenders if their city is under attack. 




---

## Author

**Christian McCrea**
GitHub: [LuckyLuc96](https://github.com/LuckyLuc96)

---

## Related

- [AzerothCore](https://www.azerothcore.org/)
- [Eluna Engine](https://elunaluaengine.github.io/)


