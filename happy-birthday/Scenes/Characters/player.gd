extends CharacterBody2D

@export var speed : float = 400
@export var animation_tree : AnimationTree
var playback : AnimationNodeStateMachinePlayback
var direction

func _ready() -> void:
	playback = animation_tree["parameters/playback"]


func _physics_process(delta: float):
	# Input
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if velocity != Vector2.ZERO:
		$Sprite2D.flip_h = 1 if velocity.x < 0 else 0
	
	move_and_slide()
	select_animation()
	update_animation_parameters()
	

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
