extends Control

@onready var dash: Label = $Dash
@onready var health: Label = $Health
@onready var score: Label = $Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not GameManager.isDead:
		dash.text = "Dash: " + str(GameManager.maxSpaces -GameManager.spacesPressed)
		score.text = "Score: " +  str(GameManager.score)
		health.text = "Health: " +  str(GameManager.player.health)
