extends Control




func _on_button_host_pressed() -> void:
	print("Odabran Host")

func _on_button_join_pressed() -> void:
	print("Odabran Join")


func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/player_setup.tscn")
