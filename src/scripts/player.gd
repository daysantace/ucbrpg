extends Node2D
@onready var sprite = $player_sprite
@onready var scaler = load("res://scripts/scale.gd")

func _process(delta):
	# positions
	var mpos = get_viewport().get_mouse_position()
	var ppos = global_position
	var tex = "centre"
	# decide what sprite to load for poland
	# if the cursor is near polska
	if ppos.distance_to(mpos) <= 40:
		pass

	# otherwise cursor is far from polen
	if ppos.distance_to(mpos) >= 100:
		var direction = ((360 + int(rad_to_deg(atan2(mpos.y - ppos.y, mpos.x - ppos.x)))) % 360)
		direction+=90
		if direction >= 360:
			direction-=360
			
		# decide correct appearance
		if direction >= 22.5 and direction < 67.5:
			tex = "upright"
		elif direction >= 67.5 and direction < 112.5:
			tex = "right"
		elif direction >= 112.5 and direction < 157.5:
			tex = "downright"
		elif direction >= 157.5 and direction < 202.5:
			tex = "down"
		elif direction >= 202.5 and direction < 247.5:
			tex = "downleft"
		elif direction >= 247.5 and direction < 292.5:
			tex = "left"
		elif direction >= 292.5 and direction < 337.5:
			tex = "upleft"
		else:
			tex = "up"	
	
	# movement
	var speed = 45*3
	if Input.is_action_pressed("sprint"):
		speed = 90*3
	var move_dir = (mpos - global_position).normalized()
	position += move_dir * speed * delta
	# render sprite
	sprite.texture = load("res://assets/textures/poland/poland_"+tex+".png")
	
	# scale
	self.scale = Vector2(3,3)
	
	# primary camera
	get_viewport().camera = $camera
