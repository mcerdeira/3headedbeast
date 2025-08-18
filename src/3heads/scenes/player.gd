extends Area2D
@export var speed: float = 200.0
var ttl_total = 0.2
var ttl = ttl_total
var direction = Vector2.RIGHT
var dmg = 1
var body = []
var position_prev = null
var rotation_prev = null

func _ready() -> void:
	position_prev = global_position
	rotation_prev = $sprite.rotation_degrees
	body.append($"../gun")

func set_color(color):
	$sprite.animation = color
	$sprite/sprite2.animation = color

func _physics_process(delta):
	if direction != Vector2.RIGHT and Input.is_action_just_pressed("left"):
		direction = Vector2.LEFT
		$sprite.rotation_degrees = -180
	elif direction != Vector2.LEFT and Input.is_action_just_pressed("right"):
		direction = Vector2.RIGHT
		$sprite.rotation_degrees = 0
	elif direction != Vector2.DOWN and Input.is_action_just_pressed("up"):
		direction = Vector2.UP
		$sprite.rotation_degrees = 270
	elif direction != Vector2.UP and Input.is_action_just_pressed("down"):
		direction = Vector2.DOWN
		$sprite.rotation_degrees = 90

	ttl -= 1 * delta
	if ttl <= 0:
		position += direction.normalized() * 32
		update_body()
		position_prev = global_position
		rotation_prev = $sprite.rotation_degrees
		ttl = ttl_total

func update_body():
	var prev = position_prev
	var rot = rotation_prev
	for b in body:
		if b:
			b.update_body(prev, rot)
			prev = b.position_prev
			rot = b.rotation_prev
