extends Node

#@onready var playerstuff 
var speed = 3
var box
# Called when the node enters the scene tree for the first time.
func _ready():
	##playerstuff = $CombatPanel/PlayerArea
	$playerhpbar.max_value = GlobalVars.hp
	$EnemyHPBar.max_value = $CombatPanel/Playerbody.enemyHP
	GlobalVars.maxhp = GlobalVars.hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$playerhpbar.value = GlobalVars.hp
	$EnemyHPBar.value = $CombatPanel/Playerbody.enemyHP
	checkDeath()
	
	pass

func checkDeath():
	if($CombatPanel/Playerbody.enemyHP <= 0):
		get_tree().change_scene_to_file("res://GameEndstuff/GameEnd.tscn")
	if(GlobalVars.hp <= 0):
		get_tree().change_scene_to_file("res://BattleScene/DeathScene.tscn")
