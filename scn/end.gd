extends Node2D
var scr = Global.score
@onready var score: Label = $Control/Score
@onready var max_score: Label = $Control/MaxScore

func _ready() -> void:
	score.text = "score: " + str(Global.score)
	max_score.text = "MAX SCORE: " + str(Global.MaxScore)


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scn/game.tscn")


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scn/menu.tscn")
