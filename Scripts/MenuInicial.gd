extends Control

@onready var menuPadrao = $MarginContainer/VBoxContainer
@onready var menuConfig = $MarginContainer/ConfigMenu

func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://Cenas/Cena.tscn")

func _on_sair_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_opcoes_pressed():
	menuPadrao.visible = false
	menuConfig.visible = true
	pass # Replace with function body.


func _on_voltar_config_pressed():
	menuPadrao.visible = true
	menuConfig.visible = false
	GC.saveConfig()

func _on_master_vol_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func _on_music_vol_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"), value)
	pass # Replace with function body.

func _on_effect_vol_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
	pass # Replace with function body.

func _on_window_size_item_selected(index):
	DisplayServer.window_set_size(GC.resolucoes.values()[index])
	pass # Replace with function body.

func _on_window_mode_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	pass # Replace with function body.
