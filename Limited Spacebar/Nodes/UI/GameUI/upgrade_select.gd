extends Control


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.upgradeScreen == true:
		get_tree().paused = true
		show()


func _on_speed_pressed() -> void:
	GameManager.player.speed += 50
	hide()
	
	GameManager.upgradeScreen = false
	get_tree().paused = false
	
	GameManager.score += 1000
	
func _on_dashes_pressed() -> void:
	GameManager.maxSpaces += 1
	GameManager.spacesPressed = 0
	hide()
	
	GameManager.upgradeScreen = false
	get_tree().paused = false
	
	GameManager.score += 1000
	
func _on_points_pressed() -> void:
	GameManager.player.health = 3
	hide()
	
	GameManager.upgradeScreen = false
	get_tree().paused = false

	GameManager.score += 1000
