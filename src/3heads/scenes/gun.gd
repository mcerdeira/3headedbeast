extends Area2D
@export var kind = ""
var ttl_total = 0.0
var ttl = 0.0
var speed = 0
var bullet_obj = preload("res://scenes/bullet.tscn")
var sword_obj = preload("res://scenes/sword.tscn")
var position_prev = null
var rotation_prev = null

func _ready() -> void:
	position_prev = global_position
	rotation_prev = $sprite.rotation_degrees
	$sprite.animation = kind
	if kind == "blue":
		ttl_total = Global.blue_ttl_total
		ttl = ttl_total
		speed = 800
	elif kind == "green":
		ttl_total = Global.green_ttl_total
		ttl = ttl_total
		speed = 800
	elif kind == "purple":
		ttl_total = Global.purple_ttl_total
		ttl = ttl_total
		speed = 300
	elif kind == "yellow":
		var sword = sword_obj.instantiate()
		add_child(sword)

func update_body(prev, rot):
	position_prev = global_position
	rotation_prev = $sprite.rotation_degrees
	
	global_position = prev
	$sprite.rotation_degrees = rot

func _physics_process(delta: float) -> void:
	ttl -= 1 * delta
	shoot()
			
func shoot():
	if ttl <= 0:
		ttl = ttl_total
		if kind == "blue":
			var bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))
			bullet.set_color($sprite.animation)
			bullet.speed = speed
			bullet.dmg = Global.blue_dmg
			get_parent().add_child(bullet)
		elif kind == "green":
			var bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.UP
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.green_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.DOWN
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.green_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.LEFT
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.green_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.RIGHT
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.green_dmg
			get_parent().add_child(bullet)
		if kind == "purple":
			var bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.UP
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(0.5, -1)
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(-0.5, -1)
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.DOWN
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(0.5, 1)
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(-0.5, 1)
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.LEFT
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(-1, 0.5)
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(-1, -0.5)
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.RIGHT
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(1, -0.5)
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(1, 0.5)
			bullet.speed = speed
			bullet.set_color($sprite.animation)
			bullet.dmg = Global.purple_dmg
			get_parent().add_child(bullet)
