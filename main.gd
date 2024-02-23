extends Node2D
var elapsed_time:float
var elapsed_time_ph:float

@onready var _camera = $Camera2D # カメラ.
@export var speed = 5
var _tShake: float = 0 # 画面揺らすタイマー.
const TIMER_SHAKE = 0.5 # 0.5秒の間揺らす
func _process(delta):
	elapsed_time += delta	
	$elapsed_time.text = "経過時間"+"%7.1f" % elapsed_time	


	var velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		_camera.position.y -= 100*delta # moveup

	if Input.is_action_pressed("ui_down"):
		_camera.position.y += 100*delta # movedown

	if Input.is_action_pressed("ui_left"):
		_camera.position.x -= 100*delta # moveleft

	if Input.is_action_pressed("ui_right"):
		_camera.position.x += 100*delta # moveright

	#position += velocity.normalized() * speed

	if Input.is_action_pressed(("ui_select"))|| Input.is_action_pressed(("start")):
	# 画面揺らす
		_camera.offset = Vector2.ZERO
		_tShake -= delta
		if _tShake < 0:
			var rate = _tShake / TIMER_SHAKE
			var vx = 64 * rate
			var vy = 16 * rate
			_camera.offset.x = randi_range(-vx, vx)
			_camera.offset.y = randi_range(-vy, vy)
			# 画面揺れ中はリスタートできなくする.
			return

	_camera.offset = Vector2.ZERO
	_tShake = 0

func _physics_process(delta):
	elapsed_time_ph += delta	
	$elapsed_time_ph.text = "経過時間"+"%7.1f" % elapsed_time_ph		
