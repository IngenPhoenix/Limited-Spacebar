extends Area2D

var speed: float = 2000.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement = Vector2.RIGHT.rotated(rotation) * speed * delta
	global_position += movement


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	await get_tree().create_timer(0.1).timeout
	queue_free()
