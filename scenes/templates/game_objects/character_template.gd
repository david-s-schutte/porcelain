extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 2
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

export var wait_time = 5.0
var delta_passed = 0

var velocity = Vector3.ZERO
var waypoint = Spatial.new()

func randomise_position(obj):
	obj.global_transform.origin.x = rand_range(-50, 50)
	obj.global_transform.origin.z = rand_range(-50, 50)

func _ready():	
	randomise_position(waypoint)

func _physics_process(delta):
	var direction = Vector3.ZERO
	if global_transform.origin.distance_to(waypoint.global_transform.origin) >= 0.01 :
		direction.x = waypoint.global_transform.origin.x - global_transform.origin.x
		direction.z = waypoint.global_transform.origin.z - global_transform.origin.z
	else:
		print("found waypoint")
		randomise_position(waypoint)
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		look_at(translation + direction, Vector3.UP)
#
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)
