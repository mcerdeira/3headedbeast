extends Area2D
var speed: float = 1200.0
var ttl = 0.1
var direction = Vector2.ZERO
var dmg = 1

func _ready() -> void:
	add_to_group("bullets")

func _physics_process(delta):
	if direction != Vector2.ZERO:
		if direction == Vector2.RIGHT:
			direction = Vector2(1, randf_range(-0.1, 0.1))
		if direction == Vector2.LEFT:
			direction = Vector2(-1, randf_range(-0.1, 0.1))
		if direction == Vector2.UP:
			direction = Vector2(randf_range(-0.1, 0.1), -1)
		if direction == Vector2.DOWN:
			direction = Vector2(randf_range(-0.1, 0.1), 1)
		
		ttl -= 1 * delta
		if ttl <= 0:
			visible = false
			queue_free()
			
		position += direction.normalized() * speed * delta
		
func _on_area_entered(area: Area2D) -> void:
	if area and area.is_in_group("spikes"):
		area.hit(dmg)
