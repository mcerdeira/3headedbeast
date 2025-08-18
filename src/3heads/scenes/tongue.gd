extends Node2D
var tongue_part_obj = preload("res://scenes/tongue_part.tscn")
var ttl = Global.tongue_ttl
var shoot = false

func _physics_process(delta: float) -> void:
	ttl -= 1 * delta
	if ttl <= 0:
		ttl = Global.tongue_ttl
		shoot = !shoot
	
	if shoot:
		var t = tongue_part_obj.instantiate()
		t.direction = get_parent().direction
		get_parent().add_child(t)
