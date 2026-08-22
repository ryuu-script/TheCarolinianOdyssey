extends CharacterBody2D


func _physics_process(delta: float) -> void:
	var SPEED = 300
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	velocity.y = direction_y * SPEED
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	var area2d = $Area2D
	var bodies = area2d.get_overlapping_areas()
	
	for x in bodies:
		if x != self:
			x.timer.start(1)
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				if x.has_method("change_scene"):
					x.change_scene()
			
