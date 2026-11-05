extends Control

@onready var name_input: LineEdit = $CenterContainer/VBoxContainer/LineEditName
@onready var name_error_label: Label = $CenterContainer/VBoxContainer/NameErrorLabel

func _ready() -> void:
	avatar_preview.custom_minimum_size = Vector2(160, 160)
	avatar_preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	avatar_preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	name_input.text = PlayerData.player_name
	update_avatar()

func _on_name_changed(new_text: String) -> void:
	PlayerData.player_name = new_text.strip_edges()
	PlayerData.save_player_data()

func _on_button_back_pressed() -> void:
	print("Back button pressed")
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_button_confirm_pressed() -> void:
	var entered_name := name_input.text.strip_edges()
	if entered_name.is_empty():
		name_error_label.text = "Upiši ime igrača."
		name_error_label.visible = true
		name_input.grab_focus()
		return
	PlayerData.player_name = entered_name
	PlayerData.save_player_data()
	get_tree().change_scene_to_file("res://Scenes/host_join.tscn")


func _on_line_edit_name_text_changed(new_text: String) -> void:
	name_error_label.visible = false
	name_error_label.text = ""
	PlayerData.player_name = new_text.strip_edges()
	PlayerData.save_player_data()

const AVATARS: Array[Texture2D] = [
	preload("res://assets/avatars/avatar1.jpg"),
	preload("res://assets/avatars/avatar2.jpg")
]

@onready var avatar_preview: TextureRect = $CenterContainer/VBoxContainer/TextureRectAvatar

func update_avatar() -> void:
	avatar_preview.texture = AVATARS[PlayerData.avatar_index]

func _on_button_next_pressed() -> void:
	PlayerData.avatar_index = (PlayerData.avatar_index + 1) % AVATARS.size()
	PlayerData.save_player_data()
	update_avatar()




func _on_button_previous_pressed() -> void:
	PlayerData.avatar_index = (PlayerData.avatar_index - 1 + AVATARS.size()) % AVATARS.size()
	PlayerData.save_player_data()
	update_avatar()
