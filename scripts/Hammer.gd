extends Area

onready var animation = $Animation

signal nail_hit
var is_nail_hit = false

func _ready():
	connect("area_entered", self, "_on_area_entered")
	pass


func _input(event):
	if (event is InputEventMouseButton or InputEventScreenTouch) and event.is_pressed():
		animation.play("hit")


func _on_area_entered(area):
	if area.is_in_group("Nails"):
		if area.already_hit:
			print("End the game because of nail")
			return
		is_nail_hit = true
		emit_signal("nail_hit")
	

func check_nail_hit():
	if is_nail_hit:
		print("we are all good")
	else:
		print("End the game")
	
	is_nail_hit = false


