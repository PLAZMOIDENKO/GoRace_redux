extends Node2D

@onready var MaxScore: Label = $Control/MaxScore

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.CurrentScene = "Menu"
	MaxScore.text = "max score: " + str(Global.MaxScore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scn/game.tscn")
