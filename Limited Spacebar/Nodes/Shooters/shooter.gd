extends Node2D

@export var bullet: PackedScene

@onready var travelPos: Marker2D = $TravelPos
@onready var anim: AnimationPlayer = $AnimationPlayer

@onready var turret: RayCast2D = $Turret


@export var shootDelay: float

var canShoot: bool = false
var hasReloaded: bool = true


var startPos = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startPos = global_position
	_start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if canShoot:
		_shoot()

func _start():
	var tween = create_tween()
	tween.tween_property(self, "global_position", travelPos.global_position, 0.25)
	
	await get_tree().create_timer(0.25).timeout
	anim.play("rotate")
	
	canShoot = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "rotate":
		var tween = create_tween()
		tween.tween_property(self, "global_position", startPos, 0.2)
		
		await get_tree().create_timer(0.2).timeout
		
		get_parent()._destroy()

func _shoot():
	if hasReloaded:
		var newBullet = bullet.instantiate()
		get_tree().current_scene.add_child(newBullet)
		newBullet.global_position = global_position
		newBullet.global_rotation = turret.global_rotation
		
		
		hasReloaded = false
		await get_tree().create_timer(shootDelay - (DifficultyCurve.difficultyRating / 3)).timeout
		hasReloaded = true
