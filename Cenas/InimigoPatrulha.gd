extends CharacterBody2D

## Atenção para os layers de física
# Colocar o layer 1 e 2 para plataformas
# Colocar o layer 2 para personagens
# Colocar o layer 3 para colisão de hitbox

var speed = 100.0
@onready var rayCast : RayCast2D = $RayCast2D
@onready var sprite : Sprite2D = $Sprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if not rayCast.is_colliding() and is_on_floor():
		_flip()
	
	velocity.x = speed
	
	move_and_slide()

func _flip():
	speed *= -1
	rayCast.position.x = -rayCast.position.x
	sprite.flip_h = !sprite.flip_h
	pass
