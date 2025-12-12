extends StaticBody3D

class_name SideRoom

@onready var connecter: Marker3D = $Connection

func setup(direction: String, house_connecter: Marker3D) -> void:
	# initialize the room in the world, place it so that the connecter are on the same place and the room is well oriented
	if connecter == null:
		return
		
	var translation: Vector3 = global_position - connecter.global_position
	
	# Rotate the instance
	match direction:
		"NORTH":
			rotate(Vector3.UP, -PI/2)
			global_position = house_connecter.global_position + translation.rotated(Vector3.UP, -PI/2)
		"SOUTH":
			rotate(Vector3.UP, PI/2)
			global_position = house_connecter.global_position + translation.rotated(Vector3.UP, PI/2)
		"WEST":
			global_position = house_connecter.global_position + translation
		"EAST":
			rotate(Vector3.UP, PI)
			global_position = house_connecter.global_position + translation.rotated(Vector3.UP, PI)
	
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
