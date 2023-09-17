extends CharacterBody2D

var enemyHP = 40
var enemyATK = 4
var SPEED = 10.0
var timerflag= 50

func _physics_process(delta):
	timerflag -=1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	velocity = Vector2.RIGHT * SPEED
	var collision = move_and_collide(velocity)
	if(collision):
		self.position = Vector2(10.0,0.0)
		if(timerflag <= 0):
			GlobalVars.hp -= enemyATK
			enemyHP -= GlobalVars.atk
			timerflag = 50
			print(enemyHP)
			print(GlobalVars.hp)
		
#		velocity = Vector2.LEFT * 300
#		move_and_slide()
#		print(collision)
		

func _on_area_2d_body_entered(body):
	print("HEY TRUE")
	pass # Replace with function body.


func _on_area_2d_area_entered(area):
	print("HEY FALSE")
	pass # Replace with function body.
