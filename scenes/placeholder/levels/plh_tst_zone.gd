extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var wait_time = 5.0
var delta_passed = 0

func randomise_position(obj):
	obj.global_transform.origin.x = rand_range(-5, 5)
	obj.global_transform.origin.z = rand_range(-5, 5)
	print(obj.global_transform.origin)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomise_position($char_navigation/waypoint)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$camera_position.global_transform.origin.x = $character_template.global_transform.origin.x
	if delta_passed >= wait_time :
		randomise_position($char_navigation/waypoint)
		delta_passed = 0
	else:
		delta_passed += delta
#	$camera_position.global_transform.origin.z = $character_template.global_transform.origin.z
