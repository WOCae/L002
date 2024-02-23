extends Node2D
#時間の表示
var elapsed_time:float
var elapsed_time_ph:float

@onready var Camera = $Camera2D # カメラ.
#@export var speed = 5
var moveCam: float = 0 
const moveTime = 0.5 

func _process(delta):
	elapsed_time += delta	
	$elapsed_time.text = "経過時間"+"%7.1f" % elapsed_time	


	var velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		Camera.position.y -= 100*delta # moveup

	if Input.is_action_pressed("ui_down"):
		Camera.position.y += 100*delta # movedown

	if Input.is_action_pressed("ui_left"):
		Camera.position.x -= 100*delta # moveleft

	if Input.is_action_pressed("ui_right"):
		Camera.position.x += 100*delta # moveright

	if Input.is_action_pressed(("ui_select"))|| Input.is_action_pressed(("start")):
	# 画面揺らす
		Camera.offset = Vector2.ZERO
		moveCam -= delta
		if moveCam < 0:
			var rate = moveCam / moveTime
			var vx = 64 * rate
			var vy = 16 * rate
			Camera.offset.x = randi_range(-vx, vx)
			Camera.offset.y = randi_range(-vy, vy)
			return

	Camera.offset = Vector2.ZERO
	moveCam = 0

func _physics_process(delta):
	elapsed_time_ph += delta	
	$elapsed_time_ph.text = "経過時間"+"%7.1f" % elapsed_time_ph		
