extends CharacterBody2D


const SPEED = 300.0
const currentMorph = null
const nextMorph = null


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	#if currentMorph == null:
		#spawnMorphs()
	#else: 
		#if Input.get_axis("drop"):
			#currentMorph.isSleeping = false;
	

	move_and_slide()

#func spawnMorphs():
