extends AnimatedSprite2D

@export var flashColor : Color
var defaultColor : Color
@onready var time = $Timer

@export var lifeController : LifeController

# Called when the node enters the scene tree for the first time.
func _ready():
	defaultColor = self_modulate
	lifeController.tomouDano.connect(_flash)
	pass # Replace with function body.

func _flash(valor):
	self_modulate = flashColor
	time.start()

func _on_timer_timeout():
	self_modulate = defaultColor
	pass # Replace with function body.
