extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$playerstats.text = GlobalVars.giveStringamnt()
	pass


func _on_gonextbutton_pressed():
	GlobalVars.runs +=1
	GlobalVars.resetPlayer()
	get_tree().change_scene_to_file("res://EventsFolder/3EventsScene.tscn")
	pass # Replace with function body.
