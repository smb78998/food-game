extends Node

var location = Vector2(-30,-30)
var score = 0 
@onready var score_label = $ScoreLabel
var spawn_object = preload("res://scences/food_1.tscn")

func add_point():
	score += 1;
	score_label.text = str(score);
	$AudioStreamPlayer.play()

func _process(delta):
	
	var pause = randf_range(.5,2.0)
	
	if($spawnerTimer.time_left==0):
		spawn() 
		$spawnerTimer.wait_time = randf_range(.5,2.5)
		$spawnerTimer.start()

func random():
	var x = randf_range(-130,130)
	var y = -140
	location = Vector2(x,y)

func spawn():
	random() 
	var obj = spawn_object.instantiate()
	obj.position = location
	add_child(obj)
