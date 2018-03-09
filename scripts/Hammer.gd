extends Area

onready var animation = $Animation

signal nail_hit

func _ready():
	connect("area_entered", self, "_on_area_entered")
	pass


func _input(event):
	if (event is InputEventMouseButton or InputEventScreenTouch) and event.is_pressed():
		animation.play("hit")


func _on_area_entered(area):
	if area.is_in_group("Nails"):
		emit_signal("nail_hit")
	
	
