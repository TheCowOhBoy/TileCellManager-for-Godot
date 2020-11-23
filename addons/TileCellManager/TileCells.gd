tool
extends Control

onready var icon = $"HBoxContainer/Icon"
onready var Name = $"HBoxContainer/VBoxContainer/HBoxContainer2/LineEdit"
onready var Id = $"HBoxContainer/VBoxContainer/HBoxContainer4/Label"
onready var z_index = $"HBoxContainer/VBoxContainer/HBoxContainer3/SpinBox"
onready var Modulation = $"HBoxContainer/VBoxContainer/HBoxContainer9/ColorPickerButton"
var a = []

func populate_infos(infoarray):
	a = infoarray
	icon.set_item_icon(0,a[0])
	icon.set_item_icon_region(0,a[1])
	Name.text = a[2]
	Id.text = str(a[3])
	z_index.value = a[4].get_tileset().tile_get_z_index(a[3])
	Modulation.color = a[4].get_tileset().tile_get_modulate(a[3])
func _on_LineEdit_text_changed(new_text):
	if a.size() != 0:
		if a[2] != new_text:
			a[4].get_tileset().tile_set_name(a[3], new_text)



func _on_SpinBox_value_changed(value):
	if a.size() != 0:
		if z_index.value != a[4].get_tileset().tile_get_z_index(a[3]):
			a[4].get_tileset().tile_set_z_index(a[3], value)


func _on_ColorPickerButton_color_changed(color):
	if a.size() != 0:
		if Modulation.color != a[4].get_tileset().tile_get_modulate(a[3]):
			a[4].get_tileset().tile_set_modulate(a[3], color)
