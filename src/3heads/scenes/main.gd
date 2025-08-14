extends Node2D
var ttl_total = 9.0
var ttl = 5.0
var ttl_enemy = 1.0
var ttl_enemy_total = 3.0
var block_obj = preload("res://scenes/next_block.tscn")
var spikes_obj = preload("res://scenes/spikes.tscn")

func _ready() -> void:
	Global.GAMEOVER = false
	Global.scrolling_speed = Global.scrolling_speed_total
	Global.current_level_max = 100.0
	Global.current_level_val = 0.0

func _physics_process(delta: float) -> void:
	if Global.GAMEOVER:
		Global.scrolling_speed = 0
		if Input.is_action_just_pressed("restart"):
			Global.GAMEOVER = false
			get_tree().reload_current_scene()
	
	if Global.scrolling_speed > 0:
		ttl_enemy -= 1 * delta
		if ttl_enemy <= 0:
			ttl_enemy = ttl_enemy_total
			var enemy = spikes_obj.instantiate()
			enemy.global_position = Vector2(randf_range(32, 1152 - 32) , -760)
			add_child(enemy)
		
		ttl -= 1 * delta
		if ttl <= 0:
			ttl = ttl_total
			var block = block_obj.instantiate()
			block.global_position = Vector2(randf_range(32, 1152 - 32) , -760)
			add_child(block)

			ttl_enemy = ttl_enemy_total
			var enemy = spikes_obj.instantiate()
			enemy.global_position = block.global_position
			add_child(enemy)
		
