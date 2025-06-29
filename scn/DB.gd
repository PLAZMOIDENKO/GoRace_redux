extends Node

const SAVE_PATH := "user://UPlayForge_GoRaceREDUX.json"

func _init():
	if not FileAccess.file_exists(SAVE_PATH):
		# деф дата если проебал файл
		var default_data = {
			"player": {
				"id": 1,
				"name": "ENTER NAME...",
				"telegram_id": 1,
				"rang": "THANKS FOR INSTALLATION",
				"lvl": 1,
				"MaxScore": 0
			},
			"car": {
				"color": "defs",
				"upgrade": {
					"acceleration": 1.2,
					"braking": 1.1,
					"turning": 1.2
				}
			}
		}
		_save_json(default_data)


func _load():
	var data = _load_json()
	if data:
		if data.has("player"):
			Global.player = data.player
			if not Global.player.has("MaxScore"):
				Global.player["MaxScore"] = 0
			# 👇 добавь эту строку, чтобы MaxScore после загрузки был доступен отдельно
			Global.MaxScore = Global.player["MaxScore"]
			
		if data.has("car"):
			Global.car = data.car




func _save():
	var data = {
		"player": Global.player,
		"car": Global.car
	}
	_save_json(data)


# ————— Вспомогательные функции ————— #

func _load_json() -> Dictionary:
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var text := file.get_as_text()
		var result: Variant = JSON.parse_string(text)
		if typeof(result) == TYPE_DICTIONARY:
			return result
		else:
			push_error("Ошибка чтения JSON: не словарь")
	return {}

func _save_json(data: Dictionary) -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		var text := JSON.stringify(data, "\t") # с отступами
		file.store_string(text)
		file.close()
