extends Node2D
var ttl = 5.0
var ttl_total = 9.0
var ttl_enemy = 1.0
var ttl_enemy_total = 3.0
var item_obj = preload("res://scenes/item_xp.tscn")

func _ready() -> void:
	Global.GAMEOVER = false
	Global.scrolling_speed = Global.scrolling_speed_total
	Global.current_level_max = 5.0
	Global.current_level_val = 0.0

func _physics_process(delta: float) -> void:
	if Global.GAMEOVER:
		Global.scrolling_speed = 0
		if Input.is_action_just_pressed("restart"):
			Global.GAMEOVER = false
			get_tree().reload_current_scene()
	else:
		ttl -= 1 * delta
		if ttl <= 0:
			ttl = ttl_total
			#1152(36)x648
			var item = item_obj.instantiate()
			var x = randi_range(2, 35) * 32
			var y = randi_range(3, 19) * 32
			
			item.global_position = Vector2(x, y)
			add_child(item)
