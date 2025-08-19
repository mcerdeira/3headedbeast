extends Sprite2D
var current_item = null

func set_item(item):
	current_item = item
	$lbl_title.text = item.title
	$lbl_description.text = item.description
	$icon.animation = item.icon
	
func select_this():
	current_item["action"].call()

func _on_btn_select_pressed() -> void:
	select_this()
	get_parent().done()
