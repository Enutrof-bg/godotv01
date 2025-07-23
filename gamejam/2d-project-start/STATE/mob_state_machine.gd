class_name MobStateMachine
extends Node

@export var initial_state: MobState

var current_state :MobState
var states:= {}
var mob_ui :MobUI

func init(mob: MobUI) ->void:
	for child in get_children():
		if child is MobState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.mob_ui = mob

	if initial_state:
		initial_state.enter()
		current_state = initial_state
		
func state_mode():
	print("test123132")
	#current_state.enter()
	if current_state:
		#mob_ui.color.color = Color.ORANGE
		#print("test1")
		print("test123132")
		current_state.enter()

func _on_transition_requested(from: MobState, to: MobState.State) -> void:
	if from != current_state:
		return
	
	var new_state: MobState = states[to]
	if not new_state:
		return

	if current_state:
		current_state.exit()
		
	new_state.enter()
	current_state = new_state
