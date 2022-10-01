extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')

func _process(delta):
	$Outline.visible = active

# dialog
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('sampleText')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('sampleText', self, 'unpause')
			get_tree().paused = false
			add_child(dialog)
			#get_tree().paused = false

func unpause(timeline_name):
	get_tree().paused = false

# check if body has entered/exited
func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true
func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false



