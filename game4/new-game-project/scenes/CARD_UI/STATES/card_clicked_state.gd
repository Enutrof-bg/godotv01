extends CardState

func enter() ->void:
	#if not card_ui.is_node_ready():
		#await card_ui.ready
	
	#card_ui.reparent_requesed.emit(card_ui)
	card_ui.color.color = Color.ORANGE
	card_ui.state.text = "CLICKED"
	card_ui.drop_point_detector.monitoring = true
	
func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.State.DRAGGING)
		
		
