extends Area2D
@export var speed: float = 200.0
var ttl_total = 0.3
var ttl = ttl_total
var direction = Vector2.RIGHT
var dmg = 1

func set_color(color):
	$sprite.animation = color
	$sprite/sprite2.animation = color

func _physics_process(delta):
	if Input.is_action_just_pressed("left"):
		direction = Vector2.LEFT
		$sprite.rotation_degrees = -180
	elif Input.is_action_just_pressed("right"):
		direction = Vector2.RIGHT
		$sprite.rotation_degrees = 0
	elif Input.is_action_just_pressed("up"):
		direction = Vector2.UP
		$sprite.rotation_degrees = 270
	elif Input.is_action_just_pressed("down"):
		direction = Vector2.DOWN
		$sprite.rotation_degrees = 90

	ttl -= 1 * delta
	if ttl <= 0:
		position += direction.normalized() * 32
		ttl = ttl_total
