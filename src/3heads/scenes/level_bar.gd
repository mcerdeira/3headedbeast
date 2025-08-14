extends Node2D

func _physics_process(delta: float) -> void:
	$bar.scale.x = Global.current_level_val / Global.current_level_max
