extends RigidBody2D

class_name Pipes

const PIPES_SPEED = 300;

func _ready() -> void:
	_set_initial_position()

func _process(delta: float) -> void:
	position.x -= PIPES_SPEED * delta

func _set_initial_position() -> void:
	var screen = DisplayServer.window_get_size();
	position.x = screen.x + 5;
	position.y = randi_range(160, -160)

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_2d_body_entered(player: Player) -> void:
	player.score()
