extends Area2D

@export var waitTime: float

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var music: AudioStreamPlayer = $Music

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.disabled = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _activate():
	anim.speed_scale = waitTime + (DifficultyCurve.difficultyRating / 5)
	
	
	if anim.speed_scale > 2:
		anim.speed_scale = 2
	
	anim.play("activate")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "activate":
		call_deferred("_disable")

func _disable():
	anim.play("activated")
	music.play()
		
	await get_tree().create_timer(0.25).timeout
	$CollisionShape2D.queue_free()
	queue_free()

