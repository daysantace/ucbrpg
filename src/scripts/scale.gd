extends Node2D


# figure out scale
func scale():
	# get screen size
	var wsize = get_viewport().size
	var ww = wsize.x
	var wh = wsize.y
	var scaletimes = 1
		
	# calculate how many times bigger screen is to 640x360
	var wtimes = round(ww/640)
	var htimes = round(wh/360)
	if wtimes >= htimes:
		scaletimes = htimes
	else:
		scaletimes = wtimes
	
	if wh < 360 or ww < 640: # catch for small screens
		scaletimes = 1
	
	print("Scale %sscaletimes")
	return scaletimes
