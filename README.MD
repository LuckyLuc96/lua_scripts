# Various Lua Scripts for ALE Azerothcore Lua engine

This repository contains various Lua scripts written for use with [ALE](https://github.com/azerothcore/mod-ale#-documentation).

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
- Allows configuration via at the top of the lua file and `world.conf` two settings of the player speed.

### Configuration

Inside the script:
- `baseSpeed`: Sets the baseline run speed (7.0 is normal), 7.7 reflects a value of 1.1 player speed inside world.conf and is my preferred setting.

- *Any of the below can be disabled at the top of the file by setting the variable to false (lowercase).*
- `toggleShapeshiftSpeeds`: Enables special speed for shapeshift forms.
    - This also auto teaches the shapeshift forms to their respective classes on creation/levelup
- `toggleMountLevelTen`: Automatically teaches racial mount at level 10.
- `toggleFasterDead`: Increases movement speed while dead.

---

## Auto Guild

This is a simple script that will add a newly created player into the guild when they first log in. This is server wide and is intended for servers that have a starter or default guild. Currently only supports adding players to one single guild, not faction specifc guilds. The guild must exist for this plugin to do anything.

### Configuration

Change the name of the default guild in the script from "FaeHaven" to the name of your guild. Rank 0 can also be changed to a higher value, but is not recommended.

---

## Digital Gathering

This doesn't do anything yet.
This script is a work in progress and will allow users to mine ore and gather herbs from a distance and remain mounted.
This still needs work and will probably require a way to tell eluna to use/deplete the gathering node and simulate the loot you would get by giving it to the player. Through testing I don't think it's possible to target a game object with a spell via eluna at this time.

---

## TBC_skip

This doesn't do anything yet.

It'll add an NPC or event that will increase a level 58 character to level 68 and give some basic gear AND professions to entirely skip TBC leveling. Professions, if skipped, will only increase if that player has maxed the classic variations. Just an idea at this point. I don't like leveling in TBC if you cannot guess.
Might add gold + flying skill too

---

## Author

**Jessica McCrea**

Github link: [LuckyLuc96](https://github.com/LuckyLuc96)