class_name LifeUI extends Control

@onready var hearts = [
	$GridContainer/TextureRect,
	$GridContainer/TextureRect2,
	$GridContainer/TextureRect3,
	$GridContainer/TextureRect4,
	$GridContainer/TextureRect5
]

func atualizaVidaUI(vidaAtual, _dir):
	print("Chamou dano")
	for i in range(0, vidaAtual):
		hearts[i].visible = true
	
	for i in range(vidaAtual, 5):
		hearts[i].visible = false
