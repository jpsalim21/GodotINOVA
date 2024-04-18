extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

var animacaoAtual = "Idle"


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	_updateAnimation()

func _updateAnimation():
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
	