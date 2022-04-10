extends Node


func _ready():
	load_main_menu()
	
func load_main_menu():
	$MainMenu/Text/Option/Start.connect("pressed", self, "on_new_game_pressed")
	$MainMenu/Text/Option/Exit.connect("pressed", self, "on_quit_pressed")
	
func on_new_game_pressed():
	$MainMenu.queue_free()
	var game_scene = load("res://Scene/MainScenes/GameScene.tscn").instance()
	game_scene.connect("game_finished", self, "unload_game")
	add_child(game_scene)
	 
func on_quit_pressed():
	get_tree().quit()

func unload_game(result):
	$GameScene.queue_free()
	var main_menu = load("res://Scene/MainMenu/MainMenu.tscn").instance()
	add_child(main_menu)
	load_main_menu()