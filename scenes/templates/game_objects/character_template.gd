extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 2
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var velocity = Vector3.ZERO
export(Vector3) var waypoint

func _physics_process(delta):
	var direction = Vector3.ZERO
	if global_transform.origin.distance_to(waypoint) >= 0.01 :
		direction.x = global_transform.origin.x - waypoint.x
		direction.z = global_transform.origin.z - waypoint.z
#
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		look_at(translation + direction, Vector3.UP)
#
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)
