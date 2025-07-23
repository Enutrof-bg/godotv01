class_name MobState
extends Node

enum State {MODE1, MODE2, MODE3}

signal transition_requested(from: MobState, to: State)

@export var state: State

var mob_ui :MobUI

func state_mode() ->void:
	pass
