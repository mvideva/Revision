extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')

# if on and selected, go to next scene
func _input(event):
	if event.is_action_pressed("ui_accept") and active:
		get_tree().change_scene("res://Scenes/Scene2.tscn")

# check if body has entered/exited
func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true
func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false
