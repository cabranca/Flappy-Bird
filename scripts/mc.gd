extends Area2D

const JUMP_VELOCITY = -300.0
const GRAVITY = 1200.0

var ySpeed
var collided

func _ready():
	ySpeed = 0

func _physics_process(delta):
	if collided:
		return
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		ySpeed = JUMP_VELOCITY
	else:
		ySpeed += gravity * delta

	position.y += ySpeed * delta + gravity * pow(delta, 2)


func _on_area_entered(_area):
	collided = true
