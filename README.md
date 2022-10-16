# Spoof Library
Easily create index and newindex property spoofs

# Loader

```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/dragonssk/spoof-library/main/source.lua', true))()
```

## Example

```lua
local local_player = game.Players.LocalPlayer
local speed_spoof = spoof(local_player.Character.Humanoid, 'WalkSpeed')
local_player.Character.Humanoid.WalkSpeed = 50
wait(10)
speed_spoof:Destroy() -- Sets walkspeed back to spoofed walkspeed, and removes spoofs
```

# Documentation

## Spoofing

```lua
function spoof(self: Instance, property: string): table
    return spoofer
end
```

## De-spoofing

```lua
spoofer:Destroy()
```

## Setting fake property

```lua
spoofer:SetFake(value: any, keep_type: bool)
```
