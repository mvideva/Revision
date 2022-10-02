extends KinematicBody2D

export(int) var speed = 500.0

func _physics_process(delta):
	
	# restart game?
	if Input.is_action_pressed("ui_cancel"):
		get_tree().reload_current_scene()
	
	var velocity = Vector2.ZERO
	
	var pace = 1.0
	velocity = Vector2()
	# movement control
	if Input.is_action_pressed("ui_right"):
		velocity.x += pace
	if Input.is_action_pressed("ui_left"):
		velocity.x -= pace
	if Input.is_action_pressed("ui_down"):
		velocity.y += pace
	if Input.is_action_pressed("ui_up"):
		velocity.y -= pace
	
	# makes diagonal movement the same speed
	velocity = velocity.normalized()
	
	# continue to face last direction
	if velocity == Vector2.ZERO:
		# idle state
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		# walk state
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationTree.set("parameters/Walk/blend_position", velocity)
		move_and_slide(velocity * speed)
	
	
