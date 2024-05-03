extends Area2D

signal pegouItem

@export var valor = 10
@onready var som = $AudioStreamPlayer2D
var pego = false

func _on_body_entered(body):
	if pego: return
	if body.name == "Player":
		if GC: GC.aumentarMoedas(valor)
		som.play()
		pego = true
		visible = false
		


func _on_audio_stream_player_2d_finished():
	queue_free()
