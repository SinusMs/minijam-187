extends GridContainer

var font = load("res://assets/font/ThaleahFat.ttf")
var font_color = Color(124/255.0, 24/255.0, 60/255.0)
func _ready() -> void:
	Utils.sort_leaderboard()
	fill_grid()


func fill_grid() -> void:
	for child in get_children():
		child.queue_free()
	
	var pos_vbox = VBoxContainer.new()
	var name_vbox = VBoxContainer.new()
	var time_vbox = VBoxContainer.new()
	
	var pos: int = 1
	
	for data in Utils.leaderboard:
		var pos_label = Label.new()
		pos_label.add_theme_color_override("font_color", font_color)
		pos_label.add_theme_font_override("font", font)
		pos_label.text = str(pos)
		pos_label.show()
		add_child(pos_label)
		#add_child(pos_vbox)

		var name_label = Label.new()
		name_label.add_theme_color_override("font_color", font_color)
		name_label.add_theme_font_override("font", font)
		name_label.text = str(data[0])
		name_label.show()
		add_child(name_label)
		#add_child(name_vbox)
	
		var time_label = Label.new()
		time_label.add_theme_color_override("font_color", font_color)
		time_label.add_theme_font_override("font", font)
		time_label.text = str(round_to_dec(data[1], 3))
		time_label.show()
		add_child(time_label)
		#add_child(time_vbox)
		
		pos += 1

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
