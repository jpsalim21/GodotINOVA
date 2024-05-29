class_name GameController extends Node2D

var moedas : int = 0

signal pausando(estaPausado)
signal pegouMoeda(int)

var pause = false:
	set(value):
		pause = value
		pausando.emit(value)

func aumentarMoedas(valor):
	moedas += valor
	pegouMoeda.emit(moedas)

var configPath = "user://config.json"
var volumeMax
var volumeMusica
var volumeSFX

func _ready():
	loadFile()

func saveConfig():
	var file = FileAccess.open(configPath, FileAccess.WRITE)
	
	var configData = {}
	configData["volMax"] = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	configData["volMus"] = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Musica"))
	configData["volSFX"] = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))
	
	var json = JSON.stringify(configData)
	
	file.store_string(json)
	file.close()

func loadFile():
	if not FileAccess.file_exists(configPath):
		return
	
	var file = FileAccess.open(configPath, FileAccess.READ)
	
	var json = file.get_as_text()
	
	var saveData = JSON.parse_string(json)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), saveData["volMax"])
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"), saveData["volMus"])
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), saveData["volSFX"])
	file.close()
