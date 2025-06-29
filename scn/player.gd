extends CharacterBody2D

# Переменные для касания
var target_pos: Vector2 = Vector2.ZERO
var is_touching := false

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			target_pos = event.position
			is_touching = true
			GameRule.touch = true
		else:
			is_touching = false
			GameRule.touch = false
	elif event is InputEventScreenDrag:
		target_pos = event.position
		is_touching = true

@warning_ignore("unused_parameter")
func _physics_process(delta):
	Global.player_pos = self.position

	# Для ПК с мышью — если нет касания
	if not is_touching and Input.get_mouse_button_mask() != 0:
		target_pos = get_global_mouse_position()
		is_touching = true
	elif Input.get_mouse_button_mask() == 0:
		is_touching = false

	# Если нет активного касания — стоим на месте
	if not is_touching:
		velocity = Vector2.ZERO

		return

	var direction = target_pos - global_position

	var distance_x = abs(direction.x)
	var distance_y = abs(direction.y)

	if distance_x < 0.1 and distance_y < 0.1:
		velocity = Vector2.ZERO
		return

	var dir_x = 0.0
	var dir_y = 0.0
	if distance_x > 0.1:
		dir_x = sign(direction.x)
	if distance_y > 0.1:
		dir_y = sign(direction.y)

	# Скорость по X (одинаковая для любого направления)
	var speed_x = min(Global.car["speed_x"], distance_x * 20)

	# Скорости для Y направлений
	var speed_y_up = Global.car["speed_upy"]
	var speed_y_down = Global.car["speed_downy"]

	var speed_y = 0.0
	if dir_y < 0:
		speed_y = min(speed_y_up, distance_y * 20)
	elif dir_y > 0:
		speed_y = min(speed_y_down, distance_y * 20)

	velocity = Vector2(dir_x * speed_x, dir_y * speed_y)
	move_and_slide()
