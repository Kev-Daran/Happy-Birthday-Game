extends CharacterBody2D

@export var speed : float = 400
@export var animation_tree : AnimationTree
var playback : AnimationNodeStateMachinePlayback
var direction

func _ready() -> void:
	playback = animation_tree["parameters/playback"]
	$InteractLabel.text = "Press [Space]"
	$InteractLabel.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if $RayCast2D.is_colliding():
			var actionable = $RayCast2D.get_collider()
			actionable.action()
			return



func _physics_process(_delta: float):
	# Movement
	if Input.is_action_pressed("right"):
		direction.x = 1
		direction.y = 0
	elif Input.is_action_pressed("left"):
		direction.x = -1
		direction.y = 0
	elif Input.is_action_pressed("down"):
		direction.y = 1
		direction.x = 0
	elif Input.is_action_pressed("up"):
		direction.y = -1
		direction.x = 0
	else:
		direction = Vector2.ZERO
	velocity = direction * speed
	
	# Flipping sprite based on direction
	if velocity != Vector2.ZERO:
		$Sprite2D.flip_h = 1 if velocity.x < 0 else 0
	
	move_and_slide()
	select_animation()
	update_animation_parameters()
	
	
	# Collisions
	if $RayCast2D.is_colliding():
		$InteractLabel.visible = true
	else:
		$InteractLabel.visible = false
	

func select_animation():
	if velocity == Vector2.ZERO:
		playback.travel("idle")
	else:
		playback.travel("walk")

func update_animation_parameters():
	if direction == Vector2.ZERO:
		return

	animation_tree["parameters/idle/blend_position"] = direction
	animation_tree["parameters/walk/blend_position"] = direction
