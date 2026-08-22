extends Control


@onready var student = $student
@onready var teacher = $teacher
@onready var attack = $attack
@onready var block = $block
@onready var label = $Label
@onready var timer = $Timer
var turns_played = 0


# Called when the node enters the scene tree for the first time.
func on_attack():
	if turns_played % 2 == 0:
		var random = randi_range(1, 100) 
		var miss_chance = 100 - student.charisma
		if (random > miss_chance):
			teacher.value -= student.attack
			label.text = "dealt " + str(student.attack)
		else:
			label.text = "missed"
		turns_played += 1
		timer.start(1)
	

func _ready() -> void:
	attack.pressed.connect(on_attack)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer.time_left == 0:
		if turns_played % 2 == 1:
			if teacher.value <= 25:
				teacher.value += 30
				label.text = "teacher healed for 30"
			else:
				student.value -= 10
				label.text = "you took 10 damage"
			turns_played += 1
	pass
