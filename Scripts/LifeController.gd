extends Node

class_name LifeController

signal tomouDano(vida)
signal morreu

@export var _vidaMax = 100
var _vida
var morto = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_vida = _vidaMax
	pass # Replace with function body.

func alterarVida(qtd : int):
	_vida = _vida + qtd
	print("Vida: " + str(_vida) + " no " + name)
	if(qtd < 0):
		if(_vida <= 0):
			if not morto:
				morreu.emit()
				morto = true
		tomouDano.emit(_vida)
