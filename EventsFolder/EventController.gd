extends Node2D

var eventArr = []
var time =4
var currentEvent: eventresource
var rng = RandomNumberGenerator.new() 

#1 implmenet battle system
#2 implement event calling system
#implement endings 

# Called when the node enters the scene tree for the first time.
func _ready():
	eventArr=[]
	callEvent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hideButtons()
	pass

func callNextPhase(): 
	$"Black background/b1".visible = false
	$"Black background/b2".visible = false 
	$"Black background/b3".visible = false
	$"Black background/b4".visible = false
	$AnimationPlayer/goOnBackground.visible=true

func callEvent(): 
	$AnimationPlayer.play("TextAppearance")
	if(time == 0):
		callNextPhase()
		#logic to go to next phase appears.
	var randum = rng.randi_range(1,8)
	if(eventArr.has(randum)):
				callEvent()
				return
	match(randum):
		1:
			currentEvent = ResourceLoader.load("res://Misc/EventHolder/lake.tres")
			eventArr.push_back(1)
		2:
			currentEvent = ResourceLoader.load("res://Misc/EventHolder/Minotaur.tres")
			eventArr.push_back(2)
		3: 
			currentEvent = ResourceLoader.load("res://Misc/EventHolder/Ghost.tres")
			eventArr.push_back(3)
		4: 
			currentEvent = ResourceLoader.load("res://Misc/EventHolder/LostChild.tres")
			eventArr.push_back(4)
		5: 
			currentEvent = ResourceLoader.load("res://Misc/EventHolder/MysteriousArtifact.tres")
			eventArr.push_back(5)
		6: 
			currentEvent = ResourceLoader.load("res://Misc/EventHolder/Sinner.tres")
			eventArr.push_back(6)
		7: 
			currentEvent = ResourceLoader.load("res://Misc/EventHolder/Riddle.tres")
			eventArr.push_back(7)
		8: 
			currentEvent = ResourceLoader.load("res://Misc/EventHolder/Mirror.tres")
			eventArr.push_back(8)
	assignEvent()
	time -=1

func assignEvent():
	$"Black background/b1/l1".text = currentEvent.l1text
	$"Black background/b2/l2".text = currentEvent.l2text
	$"Black background/b3/l3".text = currentEvent.l3text
	$"Black background/b4/l4".text = currentEvent.l4text
	$AnimationPlayer/Introductiontext.text = currentEvent.baseText

func _on_b_1_pressed():
	GlobalVars.increaseStat(3)
	callEvent()



func _on_b_2_pressed():
	GlobalVars.increaseStat(1)
	callEvent()



func _on_b_3_pressed():
	GlobalVars.increaseStat(1)
	GlobalVars.increaseStat(1)
	GlobalVars.increaseStat(1)
	GlobalVars.increaseStat(4)
	callEvent()


func _on_b_4_pressed():
	GlobalVars.increaseStat(1)
	GlobalVars.increaseStat(1)
	GlobalVars.increaseStat(1)
	GlobalVars.increaseStat(5)
	GlobalVars.increaseStat(5)
	callEvent()


func _on_gonextbutton_pressed():
	get_tree().change_scene_to_file("res://BattleScene/MainBattle.tscn")
	pass # Replace with function body.

func hideButtons(): 
	if(GlobalVars.runs >= 2):
		$"Black background/b3".visible = true
	if(GlobalVars.runs >= 4):
		$"Black background/b4".visible = true
