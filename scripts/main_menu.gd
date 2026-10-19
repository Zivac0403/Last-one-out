extends Control


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/player_setup.tscn")


func _on_rules_button_pressed() -> void:
	print("Otvaranje pravila igre")


func _on_settings_button_pressed() -> void:
	print("Otvaranje postavki")
