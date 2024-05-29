extends Node

var savePath = "user://saveGodotInova.json"

@onready var player = %Player

func _ready():
	loadFile()

func save():
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	
	if not file:
		print("File não existe")
		return
	
	var saveData = {}
	saveData["position:x"] = player.global_position.x
	saveData["position:y"] = player.global_position.y
	
	var json = JSON.stringify(saveData)
	
	file.store_string(json)
	file.close()

func loadFile():
	if not FileAccess.file_exists(savePath):
		return
	
	var file = FileAccess.open(savePath, FileAccess.READ)
	
	var json = file.get_as_text()
	
	var saveData = JSON.parse_string(json)
	
	player.global_position.x = saveData["position:x"]
	player.global_position.y = saveData["position:y"]
	file.close()
