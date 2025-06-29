extends Node2D
@onready var Anim: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.CurrentScene = "BootAnim"



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scn/menu.tscn")
