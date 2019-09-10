extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED=50

var velocity=Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	velocity=Vector2(0, 0)

	if Input.is_action_pressed("ui_left"):
		velocity.x-=SPEED
	
	if Input.is_action_pressed("ui_right"):
		velocity.x+=SPEED
	
	if Input.is_action_pressed("ui_up"):
		velocity.y-=SPEED
	
	if Input.is_action_pressed("ui_down"):
		velocity.y+=SPEED

func _physics_process(delta):
	move_and_slide(velocity)

	for i in get_slide_count():
		var collision = get_slide_collision(i)

		if collision.collider.is_in_group("TrucPasToucher"):
			get_tree().reload_current_scene()
				
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
