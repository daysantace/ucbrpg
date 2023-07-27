extends Camera2D

func _process(_delta):
	var viewport_height = get_viewport_rect().size.y
	zoom = viewport_height/360
	make_current()
