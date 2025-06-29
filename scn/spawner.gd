extends Node2D

# Укажи путь к сцене, которую нужно спавнить
@export var object_to_spawn: PackedScene

# Спавн-точки
@onready var spawn_points = [
	$SpawnPoint1,
	$SpawnPoint2,
	$SpawnPoint3,
	$SpawnPoint4
]

# Таймер
@onready var spawn_timer = $Timer

func _ready():
	randomize()
	_start_timer()



func _start_timer():
	var interval = randi_range(-5, 1)
	spawn_timer.wait_time = interval
	spawn_timer.start()

func spawn_object():
	# Рандомная точка спавна
	var spawn_point = spawn_points[randi() % spawn_points.size()]
	var obj = object_to_spawn.instantiate()
	obj.position = spawn_point.global_position
	add_child(obj)


func _on_timer_timeout() -> void:
	spawn_object()
	_start_timer()
