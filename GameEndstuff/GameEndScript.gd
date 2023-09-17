extends Node

var state = 2
#1=good 2=neutral 3=stress 4=evilend
# Called when the node enters the scene tree for the first time.
func _ready():
	if(GlobalVars.good > GlobalVars.stress && GlobalVars.good > GlobalVars.bad):
		state = 1
	if(GlobalVars.good < GlobalVars.stress && GlobalVars.stress > GlobalVars.bad):
		state = 3
	if(GlobalVars.bad > GlobalVars.stress && GlobalVars.good < GlobalVars.bad):
		state = 4
	pass # Replace with function body.
	$herostats.text = GlobalVars.giveStringamnt()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(state == 1):
		$GoodEnd.visible = true
	if(state ==2):
		$NeutralEnd.visible = true
	if(state ==3):
		$StressEnd.visible =true
	if(state==4):
		$EvilEnd.visible = true
	pass


func _on_button_pressed():
	GlobalVars.runs +=1
	GlobalVars.resetPlayer()
	get_tree().change_scene_to_file("res://EventsFolder/3EventsScene.tscn")
	pass # Replace with function body.
