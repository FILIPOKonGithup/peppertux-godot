extends AnimatedSprite2D

# Some of this code is from an earlier version of PepperTux back in 2024.

var is_collected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".play("normal")
	$Animations.play("normal")

# Called when Tux enters the Area2D
func _on_player_detection_body_entered(body) -> void:
	if body.is_in_group("Tux") and not is_collected:
		is_collected = true
		collect()

# Called when it's called in the script.
func collect():
	Global.total_coins += 1
	$Animations.play("collect")
	$Sound.play()
	await get_tree().create_timer(0.2).timeout
	hide()
	await get_tree().create_timer(1).timeout
	queue_free()
