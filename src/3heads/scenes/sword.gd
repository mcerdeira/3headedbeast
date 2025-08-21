extends Area2D
var dmg = 1
var ttl = Global.sword_ttl
var kind = "sword"
var shoot = false

func _ready() -> void:
	add_to_group("bullets")
	visible = false

func _physics_process(delta: float) -> void:
	if !Global.GAMEOVER:
		ttl -= 1 * delta
		if ttl <= 0:
			ttl = Global.sword_ttl
			shoot = !shoot
		
		if shoot:
			visible = true
			rotation_degrees += 1500 * delta
		else:
			visible = false
			rotation_degrees = 0
	else:
		queue_free()
