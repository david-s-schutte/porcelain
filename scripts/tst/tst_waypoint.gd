extends Spatial

export var wait_time = 5.0
var delta_passed = 0

func randomise_position(obj):
	obj.global_transform.origin.x = rand_range(-5, 5)
	obj.global_transform.origin.z = rand_range(-5, 5)
	print(obj.global_transform.origin)

func _ready():	
	randomise_position(self)

func _physics_process(delta):
	if delta_passed >= wait_time :
		randomise_position(self)
		delta_passed = 0
	else:
		delta_passed += delta
