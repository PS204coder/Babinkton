extends Node2D

signal open_menu



func _on_menu_button_pressed() -> void:
	open_menu.emit()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
