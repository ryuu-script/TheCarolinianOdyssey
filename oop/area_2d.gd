extends Area2D

@onready var label = $Label
@onready var timer = $Timer
func change_scene():
	get_tree().change_scene_to_file("res://new.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer.time_left:
		label.text = "K-On"
	else:
		label.text = ""
	pass
