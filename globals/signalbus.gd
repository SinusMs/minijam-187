extends Node


signal level_started

signal egg_broke

signal pickup_picked(type: Pickup)

signal name_entered(name: String)

## Move Progress bar to [param progress]%
signal MoveProgressBar(progress: float); 

signal trigger_persuer();
