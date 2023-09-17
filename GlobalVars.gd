extends Node

var runs =0
var evilOptions = false
var stressOptions = false

var hp = 5
var atk = 1 
var good = 0
var stress = 0
var bad = 0

var maxhp = 0

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	enableEvilflag()
	enableStressFlag()
	pass
	
func increaseStat(type): 
	var ram = rng.randi_range(1,3)
	match type:
		1:
			hp += ram
			atk += ram
		3: 
			good += ram
		4: 
			stress += ram
		5: 
			bad += ram
		_: 
			pass

func enableEvilflag():
	if(runs > 4):
		evilOptions = true
	
func enableStressFlag():
	if(runs > 2):
		stressOptions = true
		
func giveStringamnt(): 
	var str1 = "HP: %s \n ATK: %s \n Good level: %s \n Stress level: %s \n Evil level: %s" 
	var str2 =str1 % [maxhp, atk, good, stress, bad]
	return str2

func resetPlayer():
	hp = 5
	atk =1
	good = 0
	bad = 0
	stress = 0
