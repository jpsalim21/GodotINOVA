extends CharacterBody2D

## Atenção para os layers de física
# Colocar o layer 1 e 2 para plataformas
# Colocar o layer 2 para personagens
# Colocar o layer 3 para colisão de hitbox

var speed = 100.0
var hitSpeed = 200.0
@onready var rayCast : RayCast2D = $RayCast2D
@onready var sprite : Sprite2D = $Sprite2D
@onready var hitTimer : Timer = $HitTimer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var movimentando = true

func _ready():
	var life : LifeController = $LifeController
	life.morreu.connect(morrer)
	life.tomouDano.connect(tomouHit)
	GC.pausando.connect(pausar)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if not rayCast.is_colliding() and is_on_floor():
		_flip()
	
	if movimentando:
		velocity.x = speed
	else:
		velocity.x = hitSpeed
	
	move_and_slide()

func _flip():
	speed *= -1
	rayCast.position.x = -rayCast.position.x
	sprite.flip_h = !sprite.flip_h
	pass

func morrer():
	queue_free()

func tomouHit(_vida, dir):
	hitTimer.start()
	hitSpeed = abs(hitSpeed) * dir
	movimentando = false

func _on_hit_timer_timeout():
	movimentando = true
	pass # Replace with function body.

func pausar(estaPausado):
	set_physics_process(not estaPausado)
