extends Control

var progress_start: int;
var progress_end: int;
var progress_current: int;
var time_total: float = 0.0;

func _ready():
    progress_start = $"CanvasLayer/Panel/TextureRect".position.x;
    progress_end = progress_start + $"CanvasLayer/Panel".size.x - 16;


func _process(delta):
    time_total += delta;
    $"CanvasLayer/Panel/TextureRect".position.x = lerp(progress_start, progress_end, time_total / 10);
    pass

func move_chicken_icon() -> void:
    pass