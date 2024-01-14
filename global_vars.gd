extends Node

var winner = "blank"
var scoreUp : int
var scoreDown : int


func setwinner_up(score: int):
	winner = "up"
	scoreUp = score
	

func setwinner_down(score: int):
	winner = "down"
	scoreDown = score

func setwinner_draw():
	winner = "draw"
