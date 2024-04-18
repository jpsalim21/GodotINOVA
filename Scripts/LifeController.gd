extends Node

class_name LifeController

signal tomouDano
signal morreu

@export var _vidaMax = 100
var _vida

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func alterarVida(qtd : int):
	_vida += qtd
	if(qtd < 0):
		tomouDano.emit()
		if(_vida <= 0):
			morreu.emit()
