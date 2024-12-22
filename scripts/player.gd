extends CharacterBody2D

class_name Player

signal player_hit
signal player_scored

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	_check_collision()
	_move_player(delta)
	
func _move_player(delta: float) -> void:
	velocity += get_gravity() * delta
	
	if rotation_degrees < 80:
		rotation_degrees += 1.5

	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		rotation_degrees = -50
		
	move_and_slide()

func _check_collision() -> void:
	var collision = get_last_slide_collision()
	
	if collision:
		emit_signal("player_hit")

func score() -> void:
	emit_signal("player_scored")
