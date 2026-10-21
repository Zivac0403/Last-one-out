extends Control


func _on_button_back_pressed() -> void:
	print("Back button pressed")
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_button_confirm_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/host_join.tscn")
