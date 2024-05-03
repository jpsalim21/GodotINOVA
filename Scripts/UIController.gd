extends CanvasLayer

@onready var pontuacao : Pontuacao = $Pontuacao
@onready var life : LifeUI = $LifeUI

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = %Player/LifeController
	if GC:
		GC.pegouMoeda.connect(pontuacao.atualizarMoedas)
		print(GC.moedas)
		pontuacao.atualizarMoedas(GC.moedas)
	if player:
		player.tomouDano.connect(life.atualizaVidaUI)
