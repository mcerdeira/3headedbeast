extends Node3D

func _physics_process(delta: float) -> void:
	$diamond_teamRed_gltf.rotation_degrees.y += 200 * delta
	$diamond_teamRed_gltf.rotation_degrees.z += 200 * delta
