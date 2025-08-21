extends Node2D
var option_obj = preload("res://scenes/option.tscn")
var pos_x = [271, 543, 815]
var pos_y = 342

func _ready() -> void:
	visible = false
	Global.selector_obj = self
	
func done():
	get_tree().paused = false
	visible = false

func show_options():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true
	visible = true
	var opt = [option_obj.instantiate(), option_obj.instantiate(), option_obj.instantiate()]
	var items = [] + Global.Items
	
	for i in range(3):
		opt[i].global_position = Vector2(pos_x[i], pos_y)
		
		while true:
			items.shuffle()
			var curr = items.pop_back()
			if curr["depends"].call():
				opt[i].set_item(curr)
				add_child(opt[i])
				break;
		

	
