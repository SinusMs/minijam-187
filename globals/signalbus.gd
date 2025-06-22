extends Node


signal level_started

signal egg_broke

signal egg_laid

signal start_game

signal finish_game
signal restart_game

signal pickup_picked(type: Pickup)

signal name_entered(name: String)

## Move Progress bar to [param progress]%
signal MoveProgressBar(progress: float); 
