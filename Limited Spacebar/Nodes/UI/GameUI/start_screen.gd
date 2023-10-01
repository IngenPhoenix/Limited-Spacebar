extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		print("heo")
		get_tree().change_scene_to_file("res://Scenes/map.tscn")


func _on_play_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("heo")
		get_tree().change_scene_to_file("res://Scenes/map.tscn")
