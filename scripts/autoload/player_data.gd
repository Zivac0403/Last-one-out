extends Node

const SAVE_PATH := "user://player_data.cfg"

var player_name: String = ""
var avatar_index: int = 0


func _ready() -> void:
	load_player_data()


func load_player_data() -> void:
	var config := ConfigFile.new()
	var error := config.load(SAVE_PATH)

	if error != OK:
		# Datoteka još ne postoji pri prvom pokretanju.
		return

	player_name = config.get_value("player", "name", "")
	avatar_index = config.get_value("player", "avatar_index", 0)


func save_player_data() -> void:
	var config := ConfigFile.new()

	config.set_value("player", "name", player_name)
	config.set_value("player", "avatar_index", avatar_index)

	var error := config.save(SAVE_PATH)
	if error != OK:
		push_error("Spremanje podataka igrača nije uspjelo.")
