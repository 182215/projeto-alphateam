extends KinematicBody2D


const MOVE_SPEED = 200
const JUMP_FORCE = 1000
const GRAVITY = 50
const MAX_FALL_SPEED = 500

var y_velo = 0

func _physics_process(delta):
	var move_dir = 0
	var grounded = is_on_floor()
	var no_chao = $RayL.is_colliding() or $RayR.is_colliding()
	
	
	if Input.is_action_pressed("ui_right"):
		move_dir += 1
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "walk"
		
		
	elif Input.is_action_pressed("ui_left"):
		move_dir -= 1
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "walk"
	else:
		$AnimatedSprite.animation = "idle"
	
	if grounded and Input.is_action_pressed("jump"):
		y_velo = - JUMP_FORCE
		
	move_and_slide(Vector2 (move_dir * MOVE_SPEED, y_velo), Vector2(0,-1))
	
	y_velo += GRAVITY
	
	if grounded and y_velo >= 0:
		y_velo = 5
	
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
		
		
