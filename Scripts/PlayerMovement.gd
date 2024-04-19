extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var direction

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

var animacaoAtual = "Idle"
var animationLock = false
var attack1 = true
var atacando = false
var direcaoAtaque


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_select") and is_on_floor() and !atacando:
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("Atacar") and animacaoAtual != "Attack1":
		atacar()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if(atacando):
		velocity.x = direcaoAtaque * (SPEED / 2)
	else:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	_updateAnimation()
	
func atacar():
	if animationLock: return
	if attack1:
		attack1 = false
		animationLock = true
		anim.play("Attack1")
		animacaoAtual = "Attack1"
	else:
		attack1 = true
		animationLock = true
		anim.play("Attack2")
		animacaoAtual = "Attack2"
	atacando = true
	direcaoAtaque = -1 if anim.flip_h else 1

func _updateAnimation():
	if animationLock: return
	if velocity.y != 0:
		if animacaoAtual != "Jump":
			animacaoAtual = "Jump"
			anim.play("Jump")
	elif velocity.x != 0:
		if animacaoAtual != "Run":
			animacaoAtual = "Run"
			anim.play("Run")
	else:
		if animacaoAtual != "Idle":
			animacaoAtual = "Idle"
			anim.play("Idle")
	if velocity.x > 0:
			anim.flip_h = false
	elif velocity.x < 0:
		anim.flip_h = true

func _on_animated_sprite_2d_animation_finished():
	animationLock = false
	atacando = false
	_updateAnimation()
