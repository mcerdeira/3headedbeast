extends Area2D
@export var kind = ""
var pos_center = Vector2(0, -64)
var pos_left = Vector2(-64, 0)
var pos_right = Vector2(64, 0)
var goto_position = null
var switch_speed = 0.5
var ttl_total = 0.0
var ttl = 0.0
var bullet_obj = preload("res://scenes/bullet.tscn")

func _ready() -> void:
	if !get_parent().shadow:
		$sprite.animation = kind
		if kind == "blue":
			ttl_total = 0.2
		elif kind == "green":
			ttl_total = 0.4
		elif kind == "purple":
			ttl_total = 1.0
	
func _physics_process(delta: float) -> void:
	if goto_position != null:
		position = lerp(position, goto_position, switch_speed) 
		if position.distance_to(goto_position) <= switch_speed:
			position = goto_position
			goto_position = null
	else:
		if !get_parent().shadow:
			if position == pos_center:
				ttl -= 1 * delta
				shoot()
			
func shoot():
	if ttl <= 0 and !get_parent().jumping and get_parent().lock_ctrls <= 0:
		ttl = ttl_total
		if kind == "blue":
			var bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.UP
			bullet.set_color($sprite.animation)
			bullet.dmg = 10
			get_parent().get_parent().add_child(bullet)
		elif kind == "green":
			var bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.UP
			bullet.set_color($sprite.animation)
			bullet.dmg = 7
			get_parent().get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(0.1, -1)
			bullet.set_color($sprite.animation)
			bullet.dmg = 7
			get_parent().get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(-0.1, -1)
			bullet.set_color($sprite.animation)
			bullet.dmg = 7
			get_parent().get_parent().add_child(bullet)
		if kind == "purple":
			var bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.UP
			bullet.set_color($sprite.animation)
			bullet.dmg = 50
			get_parent().get_parent().add_child(bullet)
