extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$camera_position.global_transform.origin.x = $character_template.global_transform.origin.x
#	$camera_position.global_transform.origin.z = $character_template.global_transform.origin.z
