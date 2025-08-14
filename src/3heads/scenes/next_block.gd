extends Area2D
var long = false
var long_ttl = 0.0
var done = false
var kind = ""

func _ready() -> void:
	add_to_group("nextblock")
	kind = Global.pick_random(["green", "blue", "purple"])
	$sprite.animation = kind
	long_ttl = Global.pick_random([1, 2, 3, 4, 5])

func _physics_process(delta: float) -> void:
	if !long or done:
		global_position.y += Global.scrolling_speed * delta
		if global_position.y >= 752 and !done:
			long = true
	else:
		long_ttl -= 1 * delta
		if long_ttl <= 0:
			done = true
