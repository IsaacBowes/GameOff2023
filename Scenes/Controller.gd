extends CharacterBody2D

const SPEED = 300.0
var currentMorph = null
var nextMorph = null
var currentMorphImage: Sprite2D
var nextMorphImage: Sprite2D
var morphList = []
var availableMorphs = [preload("res://Scenes/drop_1.tscn"),("res://Scenes/drop_2.tscn")]
@onready var control = $"../Control"


func _ready():
	for scene in availableMorphs:
		add_child(scene.instance())
	spawnMorphs()


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	currentMorph = morphList[0]
	nextMorph = morphList[1]
	currentMorphImage = currentMorph.texture
	nextMorphImage = nextMorph.texture
	

	if currentMorph == null:
		spawnMorphs()
	else: 
		if Input.is_action_just_released("drop"):
			currentMorph.isSleeping = false
	

	move_and_slide()

func spawnMorphs():
	if morphList.is_empty():
		morphList.resize(1)
		morphList.fill(availableMorphs.pick_random())
		
func removeMorph():
	morphList.remove_at(0)
	morphList.insert(1, availableMorphs.pick_random())

