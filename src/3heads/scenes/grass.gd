extends ParallaxBackground

func _physics_process(delta: float) -> void:
	scroll_base_offset.y += Global.scrolling_speed * delta
