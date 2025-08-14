extends Area2D
var speed = 500.0
var jumping = false
var lock_ctrls = 0.0
var main_kind = "blue"
@export var shadow = false

func _ready() -> void:
	if !shadow:
		Global.player_obj = self
		add_to_group("players")
		
func landing():
	jumping = false

func _physics_process(delta: float) -> void:
	if Global.GAMEOVER:
		queue_free()
		
	if shadow:
		global_position.x = Global.player_obj.global_position.x - 10
	
	if !jumping:
		var areas = get_overlapping_areas()
		for area in areas:
			if area.is_in_group("nextblock") and area.kind == main_kind:
				Global.current_level_val += 1 * delta
				global_position.x = area.global_position.x
				lock_ctrls = 0.3
				Global.shaker_obj.shake(13.0, 0.3)

	rotation_degrees = 0
	lock_ctrls -= 1 * delta
	if !jumping and Input.is_action_pressed("right"):
		if lock_ctrls <= 0:
			rotation_degrees = 5
			global_position.x += speed * delta
	elif !jumping and Input.is_action_pressed("left"):
		if lock_ctrls <= 0:
			rotation_degrees = -5
			global_position.x -= speed * delta
	if Input.is_action_just_pressed("jump"):
		if !jumping:
			$collider.set_deferred("disabled", true)
			jumping = true
			if shadow:
				$shrink.play("new_animation")
			else:
				z_index = 90
				Global.scrolling_speed = Global.scrolling_speed / 3
				$jump.play("new_animation")
	
	if Input.is_action_just_pressed("switch_R"):
		$gun1.goright()
		$gun2.goright()
		$gun3.goright()
	elif Input.is_action_just_pressed("switch_L"):
		$gun1.goleft()
		$gun2.goleft()
		$gun3.goleft()

func _on_jump_animation_finished(anim_name: StringName) -> void:
	jumping = false
	$collider.set_deferred("disabled", false)
	z_index = 0
	Global.scrolling_speed = Global.scrolling_speed_total

func _on_shrink_animation_finished(anim_name: StringName) -> void:
	jumping = false
