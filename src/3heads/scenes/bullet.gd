extends Area2D
@export var speed: float = 1200.0
var ttl = 3.0
var direction = Vector2.ZERO
var dmg = 1

func set_color(color):
	$sprite.animation = color
	$sprite/sprite2.animation = color

func _physics_process(delta):
	if direction != Vector2.ZERO:
		ttl -= 1 * delta
		if ttl <= 0:
			visible = false
			explode(true)
			
		position += direction.normalized() * speed * delta
		
func explode(die):
	if die:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area and area.is_in_group("spikes"):
		area.hit(dmg)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
