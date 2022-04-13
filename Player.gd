extends KinematicBody2D

var curHp: int = 10
var maxHP: int = 10
export var moveSpeed: int = 250

var vel : Vector2 = Vector2()
var facingDir : Vector2  = Vector2()

onready var rayCast : RayCast2D = get_node("RayCast2D")
onready var animPlayer = $AnimationPlayer
onready var sprite = $Sprite

func _physics_process(delta):
	vel = Vector2()
	
	#inout
	if Input.is_action_pressed("move_down"):
		vel.y += 1
		facingDir = Vector2.DOWN;
	if Input.is_action_pressed("move_up"):
		vel.y -= 1
		facingDir = Vector2.UP;
	if Input.is_action_pressed("move_left"):
		sprite.scale.x = -2
		vel.x -= 1
		facingDir = Vector2.LEFT;
	if Input.is_action_pressed("move_right"):
		sprite.scale.x = 2
		vel.x += 1
		facingDir = Vector2.RIGHT;
	vel = vel.normalized()
	move_and_slide(vel * moveSpeed)
	if(vel != Vector2.ZERO):
		animPlayer.play("Walk_R_L")
	else:
		animPlayer.play("Idle")
