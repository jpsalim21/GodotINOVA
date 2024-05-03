extends Node2D

@export var proximaFase : String




func _on_area_2d_body_entered(body):
	if body.name == "Player":
		changeScene()

func changeScene():
	get_tree().change_scene_to_file.bind(proximaFase).call_deferred()
