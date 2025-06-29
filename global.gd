extends Node
var player_hp = 1
var player_pos
var road_speed = 1500
var npc_car_speed = road_speed*2
var score: int
var CurrentScene: String
var MaxScore: int
var player := {
	"id": 1,
	"name": "ENTER NAME...",
	"telegram_id": 1,
	"rang": "THANKS FOR INSTALLATION",
	"lvl": 1,
	"MaxScore": 0
}

var car := {
	"color": "db is dead",
	"upgrade":{
		"acceleration": 2,
		"braking": 2,
		"turning": 2,
	},
	"speed_upy": 1.1,
	"speed_downy": 1.1,
	"speed_x": 1.1
}

var config := {
	"sound": true,
	"language": "en"
}


func _ready() -> void:
	DB._load()
	car.speed_upy = road_speed * car.upgrade.acceleration
	car.speed_downy = road_speed * car.upgrade.braking
	car.speed_x = road_speed * car.upgrade.turning
	var MS = player["MaxScore"]
	MaxScore = MS

	

# Called every frame. 'delta' is3 the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if player_hp < 1:
		if score > MaxScore:
			MaxScore = score
			player.MaxScore = MaxScore
		DB._save()
		player_hp = 1
		get_tree().change_scene_to_file("res://scn/end.tscn")
	
#	print(player["MaxScore"], score)
