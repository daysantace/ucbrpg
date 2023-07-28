extends Node2D
@onready var sprite = $player_sprite
@onready var scaler = load("res://scripts/scale.gd")

func _process(delta):
	# positions
	var mpos = get_viewport().get_mouse_position()
	var ppos = global_position
	var tex = "centre"

	# movement
	var speed = 45
	if Input.is_action_pressed("sprint"):
		speed = 90
	var movdir = Vector2(0, 0)

	if Input.is_action_pressed("up"):
		movdir.y = -1
	if Input.is_action_pressed("down"):
		movdir.y = 1
	if Input.is_action_pressed("left"):
		movdir.x = -1
	if Input.is_action_pressed("right"):
		movdir.x = 1
	
	# decide what sprite to load for poland
	# if pourando is moving
	if movdir != Vector2(0,0):
		if movdir == Vector2(0, 1):
			tex = "down"
		elif movdir == Vector2(1, 1):
			tex = "downright"
		elif movdir == Vector2(1, 0):
			tex = "right"
		elif movdir == Vector2(1, -1):
			tex = "upright"
		elif movdir == Vector2(0, -1):
			tex = "up"
		elif movdir == Vector2(-1, -1):
			tex = "upleft"
		elif movdir == Vector2(-1, 0):
			tex = "left"
		elif movdir == Vector2(-1, 1):
			tex = "downleft"
	elif ppos.distance_to(mpos) >= 100:
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
	else:
		pass
	
	position += movdir*delta*speed
	# render sprite
	sprite.texture = load("res://assets/textures/poland/poland_"+tex+".png")
