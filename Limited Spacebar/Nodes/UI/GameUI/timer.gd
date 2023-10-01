extends Control

@onready var anim: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("timer")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not GameManager.upgradeScreen:
		if not anim.is_playing():
			anim.play("timer")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "timer":
		DifficultyCurve.difficultyRating += 0.5
		await get_tree().create_timer(0.1).timeout
		Music._increase_speed()
		GameManager.upgradeScreen = true
#		anim.play("timer")
