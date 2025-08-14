extends Area2D
var life = 0
var no_scroll = 0.0
var exp = 0

func _ready() -> void:
	life = Global.pick_random([100, 150, 200, 250])
	exp = life / 10
	add_to_group("spikes")

func _physics_process(delta: float) -> void:
	$life.text = str(life)
	if no_scroll <= 0:
		global_position.y += Global.scrolling_speed / 2 * delta
	else:
		$sprite.material.set_shader_parameter("on", true)
		no_scroll -= 1 * delta
		if no_scroll <= 0:
			$sprite.material.set_shader_parameter("on", false)

func _on_area_entered(area: Area2D) -> void:
	if area and area.is_in_group("players") and area.jumping == false:
		Global.GAMEOVER = true

func hit(dmg):
	life -= dmg
	no_scroll = 0.1
	if life <= 0:
		Global.current_level_val += exp
		queue_free()
