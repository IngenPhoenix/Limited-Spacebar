extends Node

var gameStarted: bool = false
var upgradeScreen: bool = false
var isDead: bool = false

var maxSpaces: int = 3
var spacesPressed: int

var score: int
var highScore: int

var player

func _process(_delta: float) -> void:
	if get_tree().current_scene.name == "StartScreen":
		spacesPressed = 0
	else:
		return

func _reload():
	maxSpaces = 3
	spacesPressed = 0
