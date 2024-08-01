extends Node2D


const SPEED = 80 #22
@onready var game_manager = $"../../GameManager"




func _process(delta):
	position.y += SPEED * delta
	

	# check if food is on floor, if so delte food item
	if position.y >= 0:
		queue_free()


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		print(body)
		game_manager.add_point()
		queue_free()

