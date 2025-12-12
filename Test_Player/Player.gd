extends CharacterBody3D

var speed = WALK_SPEED
const WALK_SPEED = 4.0
const SPRINT_SPEED = 7.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.003

@onready var camera:Camera3D = $Camera3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		# Rotate player on Y axis (horizontal mouse movement)
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		# Rotate camera on X axis (vertical mouse movement)
		camera.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		# Clamp camera rotation to prevent flipping
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)

func _physics_process(delta: float) -> void:
	# Add the gravity #
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump #
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle Sprint #
	if Input.is_action_pressed("sprint"):
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED
	
	if Input.is_action_just_pressed("Torch"):
		$SpotLight3D.visible = not $SpotLight3D.visible

	# Get the input direction and handle the movement/deceleration #
	# As good practice, you should replace UI actions with custom gameplay actions #
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 7.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 7.0)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)
	
	move_and_slide()
