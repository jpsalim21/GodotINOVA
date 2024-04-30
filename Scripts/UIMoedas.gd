class_name Pontuacao extends Control

@onready var texto : RichTextLabel = $RichTextLabel
var tween : Tween

func atualizarMoedas(moedas):
	texto.text = str(moedas)
	tween = create_tween()
	tween.tween_property(texto, "scale", Vector2(1.5,1.5), 0.1)
	tween.tween_property(texto, "scale", Vector2.ONE, 0.1)
