extends Node2D

signal open_menu
@onready var menu: NinePatchRect = $menu



func _on_menu_button_pressed() -> void:
	open_menu.emit()


func _on_continue_button_pressed() -> void:
	menu.hide()


func _on_options_button_pressed() -> void:
	pass
	

func _on_quit_button_pressed() -> void:
	get_tree().quit()
