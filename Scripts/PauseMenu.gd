extends Control

@onready var menuMaster = $MarginContainer/VBoxContainer
@onready var configuracoes = $MarginContainer/VBoxContainer2

@onready var sliderMaster : HSlider = $MarginContainer/VBoxContainer2/MasterVol
@onready var sliderMusic : HSlider = $MarginContainer/VBoxContainer2/MusicVol
@onready var sliderEffect : HSlider = $MarginContainer/VBoxContainer2/EffectVol

func _ready():
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		GC.pause = not GC.pause
		visible = GC.pause
		if visible:
			_on_voltar_config_pressed()

func _on_resume_pressed():
	GC.pause = false
	visible = false

func _on_configuracoes_pressed():
	sliderEffect.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))
	sliderMusic.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Musica"))
	sliderMaster.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	menuMaster.visible = false
	configuracoes.visible = true

func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://Cenas/MenuInicial.tscn")

func _on_voltar_config_pressed():
	GC.saveConfig()
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
