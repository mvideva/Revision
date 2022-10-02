extends KinematicBody2D

var background_loop
#hello
func _ready():
	background_loop = get_tree().get_root().get_node("End_True").get_node("Story").get_node("AnimationPlayer")
	background_loop.play("Story")
