extends Node2D


# figure out scale
func screenscale():
	# get screen size
	var wsize = get_viewport().size
	var ww = wsize.x
	var wh = wsize.y
	var scaletimes = 1
	
	# rescale screen if smaller than 640x360
	if wh > 360:
		get_tree().get_root().set_size(Vector2(ww,360))
	if ww > 640:
		get_tree().get_root().set_size(Vector2(640,wh))
		
	# calculate how many times bigger screen is to 640x360
	var wtimes = round(ww/640)
	var htimes = round(wh/360)
	if wtimes >= htimes:
		scaletimes = htimes
	else:
		scaletimes = wtimes
	return scaletimes
