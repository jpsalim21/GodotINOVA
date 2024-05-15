extends Node2D

@onready var texto = $RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	texto.visible = false
	set_process_unhandled_input(false)
	
func _unhandled_input(event):
	if event.is_action_pressed("E"):
		print("Salvou o jogo")
		%SaveSystem.save()

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		texto.visible = true
		set_process_unhandled_input(true)

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		texto.visible = false
		set_process_unhandled_input(false)

