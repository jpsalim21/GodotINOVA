class_name GameController extends Node2D

var moedas : int = 0

var volume = 100

signal pausando(estaPausado)
signal pegouMoeda(int)

var pause = false:
	set(value):
		pause = value
		pausando.emit(value)

func aumentarMoedas(valor):
	moedas += valor
	pegouMoeda.emit(moedas)


