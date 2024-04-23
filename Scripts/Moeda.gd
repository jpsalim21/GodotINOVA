extends Area2D

signal pegouItem

@export var valor = 10

func _on_body_entered(body):
	if body.name == "Player":
		if %GameController: %GameController.aumentarMoedas(valor)
		queue_free()
