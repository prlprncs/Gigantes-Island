extends PanelContainer


signal slot_touched( index: int)

@onready var texture_rect = $MarginContainer/TextureRect
@onready var quantity_label = $quantityLabel

func set_slot_data(slot_data: SlotData) -> void:
	var item_data = slot_data.item_data
	texture_rect.texture = item_data.texture
	#tooltip_text = "%\n%s" % [item_data.name, item_data.description]
	
	if slot_data.quantity > 1:
		quantity_label.text =  "x%s" % slot_data.quantity
		quantity_label.show()	
	else:
		quantity_label.hide()

func _on_gui_input(event):
	if event is InputEventScreenTouch:
		slot_touched.emit(get_index())
