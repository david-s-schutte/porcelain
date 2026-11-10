extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 2
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var delta_passed = 0

var velocity = Vector3.ZERO
export var waypoint = Vector3.ZERO


func _ready():
	pass

func _init():
	pass

func _physics_process(delta):
	var direction = Vector3.ZERO
	if global_transform.origin.distance_to(waypoint) >= 0.1 :
		direction.x = waypoint.x - global_transform.origin.x
		direction.z = waypoint.z - global_transform.origin.z
	else:
		print("found waypoint")
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		look_at(translation + direction, Vector3.UP)
#
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)
