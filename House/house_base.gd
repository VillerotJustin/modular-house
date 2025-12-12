extends StaticBody3D

class_name HouseBase

enum Direction {NORTH, EAST, WEST, SOUTH, TOP, BOTTOM}

@export_group("Connection Points")
@export var north_connections: Array[Marker3D] = []
@export var east_connections: Array[Marker3D] = []
@export var west_connections: Array[Marker3D] = []
@export var south_connections: Array[Marker3D] = []
@export var top_connections: Array[Marker3D] = []
@export var bottom_connections: Array[Marker3D] = []

@export_group("Room Scenes")
@export var lateral_rooms: Array[PackedScene] = []
@export var top_rooms: Array[PackedScene] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Build and instantiate rooms
	randomize()
	
	# Process all connection points
	_attach_rooms_to_connections(north_connections, Direction.NORTH)
	_attach_rooms_to_connections(east_connections, Direction.EAST)
	_attach_rooms_to_connections(west_connections, Direction.WEST)
	_attach_rooms_to_connections(south_connections, Direction.SOUTH)
	_attach_rooms_to_connections(top_connections, Direction.TOP)
	_attach_rooms_to_connections(bottom_connections, Direction.BOTTOM)

func _attach_rooms_to_connections(connection_points: Array[Marker3D], direction: Direction) -> void:
	for connection_point in connection_points:
		if connection_point == null:
			continue
			
		var room_scene: PackedScene
		
		# Choose room type based on direction
		if direction == Direction.TOP or direction == Direction.BOTTOM:
			if top_rooms.size() > 0:
				room_scene = top_rooms[randi() % top_rooms.size()]
		else:
			if lateral_rooms.size() > 0:
				room_scene = lateral_rooms[randi() % lateral_rooms.size()]
		
		# Instantiate and attach room
		if room_scene != null:
			var room_instance = room_scene.instantiate()
			add_child(room_instance)
			
			# Position room at connection point using setup method if it's a SideRoom
			if room_instance is SideRoom:
				room_instance.setup(Direction.keys()[direction], connection_point)
			else:
				# Fallback for non-SideRoom scenes
				room_instance.global_transform = connection_point.global_transform
				print_debug("Warning: Attached room is not a SideRoom, using fallback positioning.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
