extends Control

@onready var menuMaster = $MarginContainer/VBoxContainer
@onready var configuracoes = $MarginContainer/VBoxContainer2

func _ready():
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		GC.pause = not GC.pause
		visible = GC.pause

func _on_resume_pressed():
	GC.pause = false
	visible = false

func _on_configuracoes_pressed():
	menuMaster.visible = false
	configuracoes.visible = true

func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://Cenas/MenuInicial.tscn")

func _on_voltar_config_pressed():
	menuMaster.visible = true
	configuracoes.visible = false


func _on_master_vol_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	pass # Replace with function body.

func _on_music_vol_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"), value)
	pass # Replace with function body.


func _on_effect_vol_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
	pass # Replace with function body.
