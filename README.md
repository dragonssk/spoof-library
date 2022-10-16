# Spoof Library
Easily create index and newindex property spoofs

Open-sourced

# Example Script

```lua
local local_player = game.Players.LocalPlayer
local speed_spoof = spoof(local_player.Character.Humanoid, 'WalkSpeed')
local_player.Character.Humanoid.WalkSpeed = 50
wait(10)
speed_spoof:Destroy()
```

# Documentation
