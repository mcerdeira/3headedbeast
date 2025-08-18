extends Area2D
@export var kind = ""
var ttl_total = 0.0
var ttl = 0.0
var bullet_obj = preload("res://scenes/bullet.tscn")
var position_prev = null
var rotation_prev = null

func _ready() -> void:
	position_prev = global_position
	rotation_prev = $sprite.rotation_degrees
	kind = Global.pick_random(["blue", "green", "purple"])
	$sprite.animation = kind
	if kind == "blue":
		ttl_total = 0.2
	elif kind == "green":
		ttl_total = 0.4
	elif kind == "purple":
		ttl_total = 1.0

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
			bullet.direction = Vector2.RIGHT.rotated($sprite.rotation)
			bullet.set_color($sprite.animation)
			bullet.dmg = 10
			get_parent().get_parent().add_child(bullet)
		elif kind == "green":
			var bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.RIGHT.rotated($sprite.rotation)
			bullet.set_color($sprite.animation)
			bullet.dmg = 7
			get_parent().get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(1, -0.1).rotated($sprite.rotation)
			bullet.set_color($sprite.animation)
			bullet.dmg = 7
			get_parent().get_parent().add_child(bullet)
			
			bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2(1, 0.1).rotated($sprite.rotation)
			bullet.set_color($sprite.animation)
			bullet.dmg = 7
			get_parent().get_parent().add_child(bullet)
		if kind == "purple":
			var bullet = bullet_obj.instantiate()
			bullet.global_position = global_position
			bullet.direction = Vector2.RIGHT.rotated($sprite.rotation)
			bullet.set_color($sprite.animation)
			bullet.dmg = 50
			get_parent().get_parent().add_child(bullet)
