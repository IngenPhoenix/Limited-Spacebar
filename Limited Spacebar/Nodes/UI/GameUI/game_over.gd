extends Control

@onready var score: Label = $Score
@onready var highscore: Label = $Highscore

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.isDead:
		show()
		
		score.text = "Score:" + str(GameManager.score)
		
		if GameManager.score > GameManager.highScore:
			highscore.text = "Highscore:" + str(GameManager.score)
			GameManager.highScore = GameManager.score
		else:
			highscore.text = "Highscore:" + str(GameManager.highScore)


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	GameManager.isDead = false
	GameManager.score = 0
	hide()
	
	GameManager._reload()
