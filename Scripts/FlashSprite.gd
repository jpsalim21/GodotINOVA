extends Node2D

@export var flashColor : Color
var defaultColor : Color
@onready var time = $Timer

@export var lifeController : LifeController

# Called when the node enters the scene tree for the first time.
func _ready():
	defaultColor = self_modulate
	lifeController.tomouDano.connect(_flash)
	pass # Replace with function body.

func _flash(_valor, _dir):
	self_modulate = flashColor
	time.start()

func _on_timer_timeout():
	print("Retornou para cor principal")
	self_modulate = defaultColor
	pass # Replace with function body.
