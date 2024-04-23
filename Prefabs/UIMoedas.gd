class_name Pontuacao extends Control

@onready var texto : RichTextLabel = $RichTextLabel


func atualizarMoedas(moedas):
	texto.text = str(moedas)
