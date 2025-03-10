@tool
extends Control

var vpainter
var ui_sidebar

@export var button_path:NodePath
var button

func _enter_tree():
	button = get_node(button_path)
	button.connect("toggled", self._set_ui_sidebar)

func _exit_tree():
	button = get_node(button_path)
	button.disconnect("toggled", self._set_ui_sidebar)

func set_vp(value:EditorPlugin):
	vpainter = value

func _show():
	button.set_pressed(false)
	self.show()
	pass

func _hide():
	button.set_pressed(false)
	self.hide()
	ui_sidebar.hide()
	pass

func _set_ui_sidebar(value):
	if value:
		ui_sidebar.set_process_input(true)
		vpainter.edit_mode = true
		ui_sidebar.show()
	else:
		ui_sidebar.set_process_input(false)
		ui_sidebar.hide()
		vpainter.edit_mode = false
		vpainter.brush_cursor.visible = false
