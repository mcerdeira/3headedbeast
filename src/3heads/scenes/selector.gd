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
	get_tree().paused = true
	visible = true
	var opt = [option_obj.instantiate(), option_obj.instantiate(), option_obj.instantiate()]
	var items = [] + Global.Items
	
	for i in range(3):
		opt[i].global_position = Vector2(pos_x[i], pos_y)
		items.shuffle()
		opt[i].set_item(items.pop_back())
		add_child(opt[i])
	
