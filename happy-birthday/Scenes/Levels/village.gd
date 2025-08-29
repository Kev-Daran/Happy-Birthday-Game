extends Node2D

func _process(_delta: float) -> void:
	if State.status == "KEY_FOUND":
		$"house_disappearing fence".clear()
		
	if State.status == "TARGET_OPENED":
		$"final_disappearing fence".clear()
