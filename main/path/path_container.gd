extends HBoxContainer

func _ready() -> void:
	for i in range(constants.MAX_PATH_LENGTH):
		var new_linkbutton := LinkButton.new()
		var new_label := Label.new()
		new_label.text = "/"
		new_linkbutton.visible = false
		new_label.visible = false
		add_child(new_linkbutton)
		add_child(new_label)
	pass # Replace with function body.

func set_path(path:Array):
	for i in range(get_child_count()):
		i = i as int
		var c:Control = get_child(i) as Control
		if(i/2 < len(path)):
			c.visible = true
			if(i%2 == 0):
				c = c as LinkButton
				c.text = path[i/2] as String
		else:
			c.visible = false

