extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var direction

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
@onready var life : LifeController = $LifeController

var animacaoAtual = "Idle"
var animationLock = false
var attack1 = true
var atacando = false
var direcaoAtaque

@onready var jumpBufferTimer = $JumpBuffer
var jumpInput = false
@onready var coyotteTimer = $CoyotteTime
var coyote = false

@onready var attackTimer = $AttackBuffer
var atkInput = false

func _ready():
	life.morreu.connect(_morrer)
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_select"):
		jumpBufferTimer.start()
		jumpInput = true
	
	if is_on_floor():
		coyotteTimer.start()
		coyote = true
	
	if jumpInput and coyote and !atacando:
		coyote = false
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("Atacar"):
		atkInput = true
		attackTimer.start()
	
	if atkInput and animacaoAtual != "Attack1":
		atacar()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if atacando and is_on_floor():
		velocity.x = 0
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
	anim.position = Vector2.ZERO
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
	if atacando:
		animationLock = false
		atacando = false
	_updateAnimation()

func _on_jump_buffer_timeout():
	jumpInput = false
	pass # Replace with function body.

func _on_coyotte_time_timeout():
	coyote = false
	pass # Replace with function body.

func _on_attack_buffer_timeout():
	atkInput = false
	pass # Replace with function body.

func _morrer():
	animationLock = true
	anim.position = Vector2(9, 7)
	anim.play("Die")
	set_physics_process(false)
	pass
