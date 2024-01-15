extends CharacterBody2D

@export var speed = 400
const GRAVITY = 200.0
const WALK_SPEED = 75
const JUMP = 100



func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

@warning_ignore("unused_parameter")
func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	var motion = velocity * delta
	move_and_collide(motion)

	if Input.is_action_pressed("left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y = -JUMP
		

	move_and_slide()
	
func _ready():
	pass

