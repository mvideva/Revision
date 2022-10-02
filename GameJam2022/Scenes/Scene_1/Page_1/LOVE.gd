extends Sprite

# make the LOVE sentence appear
func appear():
	score.num_correct += 1
	$LOVE.visible = true
