extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playing == false:
		play()

func _increase_speed():
	pitch_scale += DifficultyCurve.difficultyRating / 12
