extends Node2D

func _activate_children():
	for i in self.get_children():
		i._activate()

func _physics_process(delta: float) -> void:
	if get_child_count() == 0:
		call_deferred("_process_over")

func _process_over():
	get_parent()._select_array()
	queue_free()
