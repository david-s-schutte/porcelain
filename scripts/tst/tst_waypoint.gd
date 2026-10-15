extends Spatial


var positions = Vector3(5, 2, 5)

export var wait_time = 5.0
var delta_passed = 0
var current_pos_index = 0
var position = Vector3(0, 2, 0)

func randomise_positions():
	for pos in positions:
		print(pos)
	delta_passed = 0

# Called when the node enters the scene tree for the first time.
func _ready():	
	global_transform.origin = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_transform.origin = position
	
	if delta_passed < wait_time:
		delta_passed += delta
	else:
		delta_passed = 0
		position = Vector3(rand_range(-5, 5), 2, rand_range(-5, 5))
		global_transform.origin = position
