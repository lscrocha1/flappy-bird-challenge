extends Node

const pipes = preload("res://scenes/pipes.tscn")

func _on_timer_timeout() -> void:
	var pipe = pipes.instantiate()
	add_child(pipe)
