extends CanvasLayer

@onready var pontuacao : Pontuacao = $Pontuacao

# Called when the node enters the scene tree for the first time.
func _ready():
	var gc : GameController = %GameController
	if gc:
		gc.pegouMoeda.connect(pontuacao.atualizarMoedas)
