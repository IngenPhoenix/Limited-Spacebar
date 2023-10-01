extends Node2D

@onready var upgradeSelect: Control = $UpgradeSelect

@export var events: Array[PackedScene] = []

var instArray

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(3).timeout
	_select_array()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _select_array():
	if GameManager.gameStarted:
		var randValue = events[randi() % events.size()]
		GameManager.score += 500
		_instantiate_array(randValue)


func _instantiate_array(array: PackedScene):
	if array == null:
		print("Error: Array was null")
		_select_array()
	else:
		var instantiate = array.instantiate()
		self.add_child(instantiate)
		instantiate.global_position = Vector2(0,0)
		
		instArray = instantiate
		
	_activate_array(instArray)

func _activate_array(array: Node2D):
	await get_tree().create_timer(1).timeout
	array._activate_children()


func _on_speed_pressed() -> void:
	get_tree().paused = false
	
	GameManager.player.speed += 50
	upgradeSelect.hide()
	
