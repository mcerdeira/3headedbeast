extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area and area.is_in_group("player_out"):
		if area.get_parent().global_position.x > 300:
			area.get_parent().global_position.x = 0
		else:
			area.get_parent().global_position.x = 1152
