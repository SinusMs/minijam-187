extends GridContainer


func _ready() -> void:
	Utils.sort_leaderboard()
	fill_grid()


func fill_grid() -> void:
	var pos_vbox = VBoxContainer.new()
	var name_vbox = VBoxContainer.new()
	var time_vbox = VBoxContainer.new()
	
	var pos: int = 1
	
	for data in Utils.leaderboard:
		var pos_label = Label.new()
		pos_label.text = str(pos)
		pos_label.show()
		add_child(pos_label)
		#add_child(pos_vbox)

		var name_label = Label.new()
		name_label.text = str(data[0])
		name_label.show()
		add_child(name_label)
		#add_child(name_vbox)
	
		var time_label = Label.new()
		time_label.text = str(data[1])
		time_label.show()
		add_child(time_label)
		#add_child(time_vbox)
		
		pos += 1
		
		
