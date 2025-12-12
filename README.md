# Modular House System

A modular procedural house generation system built with Godot 4. This project demonstrates a flexible system for creating randomized houses by connecting modular room pieces.

## 🎥 Demo

<!-- Add your YouTube video link here -->
[![Watch the demo](https://img.youtube.com/vi/VBxvN-by2-M/maxresdefault.jpg)](https://www.youtube.com/watch?v=VBxvN-by2-M)

## 🎮 Features

- **Modular Room System**: Build houses from individual room components
- **Procedural Generation**: Rooms are randomly selected and placed at connection points
- **Multiple Room Types**: Support for lateral rooms (sides) and top rooms (upper floors)
- **Color-Coded Rooms**: Currently includes Red, Blue, Green, and Yellow room variants
- **Directional Connections**: Supports North, East, West, South, Top, and Bottom connection points
- **First-Person Controller**: Mouse-look camera controls for exploring generated houses

## 🏗️ Project Structure

```
modular-house/
├── House/
│   ├── HouseBase.tscn           # Main house base scene
│   ├── house_base.gd            # House generation logic
│   └── Side_Rooms/
│       ├── side_room.gd         # Base side room script
│       ├── side_room_red.tscn   # Red room variant
│       ├── side_room_blue.tscn  # Blue room variant
│       ├── side_room_green.tscn # Green room variant
│       └── side_room_yellow.tscn # Yellow room variant
├── Test_Player/
│   ├── Player.gd                # Player controller script
│   └── TestPlayer.tscn          # Player scene
└── world.tscn                   # Main world scene
```

## 🔧 How It Works

### House Base System

The `HouseBase` class manages the procedural generation:

1. **Connection Points**: Marker3D nodes define where rooms can attach
2. **Room Assignment**: Rooms are randomly selected from available PackedScenes
3. **Automatic Positioning**: Rooms align their connection points with the house base

### Side Room System

Each `SideRoom`:
- Contains a `Connection` Marker3D for alignment
- Uses the `setup()` method to position itself relative to the house base
- Can be customized with different colors and layouts

### Player Controls

- **Mouse Movement**: Look around (captured mouse mode)
- **WASD**: Move forward/backward/strafe
- **Space**: Jump

## 🚀 Getting Started

1. Clone this repository
2. Open the project in Godot 4.x
3. Run the `world.tscn` scene
4. Explore the procedurally generated house!

## 📝 Adding New Rooms

To create a new room variant:

1. Duplicate an existing room scene (e.g., `side_room_red.tscn`)
2. Rename it appropriately (e.g., `side_room_purple.tscn`)
3. Change the material's `albedo_color` to your desired color
4. Update the node name (e.g., `Side_Room_Purple`)
5. Add the new scene to the `lateral_rooms` array in `HouseBase.tscn`

## 🛠️ Technical Details

- **Engine**: Godot 4.x
- **Language**: GDScript
- **Physics**: StaticBody3D for rooms, CharacterBody3D for player
- **Materials**: StandardMaterial3D with custom colors

## 📋 TODO

- [ ] Add more room variants
- [ ] Implement room types (bedroom, kitchen, etc.)
- [ ] Add furniture and props
- [ ] Improve collision detection
- [ ] Add exterior walls
- [ ] Implement save/load for generated houses
- [ ] Add procedural decoration

## 📄 License

See the [LICENSE](LICENSE) file for details.

## 👤 Author

**Justin Villerot**

- GitHub: [@VillerotJustin](https://github.com/VillerotJustin)

---

*Built with Godot Engine*