extends RigidBody2D


@onready var velocity_height: Label = %VelocityHeight
@onready var bounce_counter: Label = %Bounce_Counter
@onready var ball: RigidBody2D = %Ball

var shrink = 0.9
var min = 0.1



var last_click_time = 0.0
var double_click_threshold = 0.3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 1.0

	
	#var launch_force = Vector2(300, 500)
	#apply_impulse(launch_force)
	
#func _ready() -> void:
	#var angle = 15
	#var speed = 100
	#var direction = Vector2(cos(deg_to_rad(angle)), -sin(deg_to_rad((angle))))
	#apply_impulse(direction * speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = linear_velocity
	var height = position.y
	velocity_height.text = "Velocity: %s\nHeight: %.1f" % [velocity, height]
	

	
	
	#bounce_counter.text = 



func launch(angle_degrees: float, power: float):
	var angle_rad = deg_to_rad(angle_degrees)
	var direction = Vector2(cos(angle_rad), -sin(angle_rad))
	apply_impulse(direction * power)

func _input(event):
	
	if event.is_action_pressed("Reverse"):
		gravity_scale = -1.0
	
	if event is InputEventMouseButton and event.is_pressed():
		var speed = 1000
		var direction = (event.position - position).normalized()
		apply_impulse(direction * speed)
		


	


func _on_launch_pressed() -> void:
	var launch_force = Vector2(1000, 1000)
	apply_impulse(launch_force)

func _on_reset_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lab_4.tscn")
	pass
func _on_h_slider_changed() -> void:
	pass
