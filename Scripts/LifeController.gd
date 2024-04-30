extends Node

class_name LifeController

signal tomouDano(vida, direcao)
signal morreu

@export var _vidaMax = 100
var _vida
var morto = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_vida = _vidaMax
	pass # Replace with function body.

func alterarVida(qtd : int, dir):
	_vida = _vida + qtd
	if(qtd < 0):
		if(_vida <= 0):
			if not morto:
				morreu.emit()
				morto = true
		tomouDano.emit(_vida, dir)
