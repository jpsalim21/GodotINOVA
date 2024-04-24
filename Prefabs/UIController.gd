extends CanvasLayer

@onready var pontuacao : Pontuacao = $Pontuacao
@onready var life : LifeUI = $LifeUI

# Called when the node enters the scene tree for the first time.
func _ready():
	var gc : GameController = %GameController
	var player = %Player/LifeController
	if gc:
		gc.pegouMoeda.connect(pontuacao.atualizarMoedas)
	if player:
		player.tomouDano.connect(life.atualizaVidaUI)
