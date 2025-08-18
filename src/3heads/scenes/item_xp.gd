extends Area2D

func _ready() -> void:
	add_to_group("xp_item")


func _on_area_entered(area: Area2D) -> void:
	if area and area.is_in_group("player_head"):
		Global.check_levelup()
		queue_free()
