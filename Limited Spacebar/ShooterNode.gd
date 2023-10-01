extends Node2D

func _activate_children():
	pass

func _destroy():
	get_parent()._select_array()
	queue_free()
