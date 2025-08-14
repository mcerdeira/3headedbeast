extends Node3D


func _physics_process(delta: float) -> void:
	if !Global.GAMEOVER:
		$spikeRoller_gltf.rotation.y += (Global.scrolling_speed / 20) * delta
