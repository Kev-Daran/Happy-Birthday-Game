extends CharacterBody2D

@export var follow_speed := 400
@export var player: Node2D
@export var animation_tree : AnimationTree
var playback : AnimationNodeStateMachinePlayback
var direction
var is_moving := false

func _ready():
	# Get the state machine playback from the animation tree
	if animation_tree:
		playback = animation_tree.get("parameters/playback")

func _physics_process(delta: float) -> void:
	if not player:
		return
	
	var distance_to_player = player.global_position.distance_to(global_position)
	
	if State.status != "INTRO" and State.status != "SPIEL_OVER" and distance_to_player > 30:
		# Calculate movement
		direction = (player.global_position - global_position).normalized()
		global_position += direction * follow_speed * delta
		
		$Sprite2D.flip_h = true if direction.x < 0 else false
		
		is_moving = true
		
		if animation_tree:
			animation_tree.set("parameters/idle/blend_position", direction)
			animation_tree.set("parameters/walk/blend_position", direction)
		
		# Play walking animation
		if playback and playback.get_current_node() != "walk":
			playback.travel("walk")
	else:
		is_moving = false
		
		# Play idle animation
		if playback and playback.get_current_node() != "idle":
			playback.travel("idle")
