extends CanvasLayer
var tween = create_tween()
var text_to_display = "This is the text to appear."

func _ready():
	$Label.visible_ratio = 0.0
	tween.tween_property($Label, "visible_ratio", 1.0, 10.0) 
	tween.play()
	
#This is hell, I have to escape this place. 
#This will be my chance. 
#I will reach the wings of freedom on the horizon, 
#and if I necessary I will pay the price,
#so my children will!
