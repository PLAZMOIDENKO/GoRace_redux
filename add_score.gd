extends Node2D
@onready var timer: Timer = $Timer

#func _ready() -> void:
#	position = Global.player_pos

func spawn():
	add_child(self)
func _on_timer_timeout() -> void:
	queue_free()
