extends Area2D

@export var lifeController : LifeController

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	var script = area as Hitbox
	if (script):
		var dir = 1
		if area.global_position.x > global_position.x: dir = -1
		lifeController.alterarVida(-script.dano, dir)
	pass # Replace with function body.
