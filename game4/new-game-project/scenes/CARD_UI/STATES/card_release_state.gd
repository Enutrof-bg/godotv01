extends CardState

func enter() ->void:
	#var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	#if ui_layer:
		#card_ui.reparent(ui_layer)
	#if not card_ui.is_node_ready():
		#await card_ui.ready
	
	#card_ui.reparent_requesed.emit(card_ui)
	card_ui.color.color = Color.DARK_MAGENTA
	card_ui.state.text = "RELEASED"
	#card_ui.drop_point_detector.monitoring = true
	
#func on_input(event: InputEvent) -> void:
	#var mouse_motion := event is InputEventMouseMotion
	#var cancel = event.is_action_pressed("right_mouse")
	#var confirm = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse")
		#
	#if mouse_motion:
		#card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
		#
	#if cancel:
		#transition_requested.emit(self, CardState.State.BASE)
	#elif confirm:
		#get_viewport().set_input_as_handled()		
		#transition_requested.emit(self, CardState.State.RELEASED)
