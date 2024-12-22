extends Node2D

@onready var restart_ui: Panel = $UI/RestartUI
@onready var score_text: Label = $UI/ScoreValue
@onready var highest_score_value: Label = $UI/RestartUI/HighestScoreValue

func _ready() -> void:
	Global.player_score = 0;

func _on_player_player_hit() -> void:
	get_tree().paused = true
	restart_ui.visible = true	

func _on_button_pressed() -> void:
	get_tree().paused = false
	restart_ui.visible = false
	get_tree().reload_current_scene()

func _on_player_player_scored() -> void:
	Global.player_score += 1;
	
	if Global.player_score > Global.highest_player_score:
		Global.highest_player_score = Global.player_score
	
	score_text.text = str(Global.player_score)
	highest_score_value.text = str(Global.highest_player_score)

func _on_area_2d_body_entered(body: Node2D) -> void:
	_on_player_player_hit()
