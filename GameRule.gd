extends Node

var touch: bool = false
var target_time_scale := 1.0  # Целевое значение time_scale

func _on_AddScoreTime_timeout() -> void:
	Global.score += 1
	if Global.road_speed < 700:
		Global.road_speed += 10

func _process(delta: float) -> void:
	# Устанавливаем цель замедления или ускорения
	if touch == false:
		target_time_scale = 0.1
	else:
		target_time_scale = 1.0

	# Плавно приближаем Engine.time_scale к target_time_scale за ~30 мс
	var speed := 1.0 / 0.1  
	if Global.CurrentScene == "Game":
		Engine.time_scale = lerp(Engine.time_scale, target_time_scale, speed * delta)
	else:
		Engine.time_scale = 1
