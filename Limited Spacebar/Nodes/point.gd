extends Area2D

var screenWidth = 1150
var screenHeight = 650

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	
	position.x = randf_range(0, screenWidth)
	position.y = randf_range(0, screenHeight)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	randomize()
	if area.is_in_group("Player"):
		
		position.x = randf_range(0, screenWidth)
		position.y = randf_range(0, screenHeight)
	
		GameManager.score += 500

func _on_body_entered(body: Node2D) -> void:
	randomize()
	if body.is_in_group("Player"):
		
		position.x = randf_range(0, screenWidth)
		position.y = randf_range(0, screenHeight)
		
		GameManager.score += 500
