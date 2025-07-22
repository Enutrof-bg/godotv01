class_name  CardUI
extends Control

signal reparent_requesed(which_card_ui: CardUI)

@onready var color: ColorRect = $Color
@onready var state: Label = $State
