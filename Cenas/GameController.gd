class_name GameController extends Node2D

var moedas : int = 0

signal pegouMoeda(int)

func aumentarMoedas(valor):
	moedas += valor
	pegouMoeda.emit(moedas)
