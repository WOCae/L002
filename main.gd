extends Node2D
var elapsed_time:float
var elapsed_time_ph:float

func _process(delta):
	elapsed_time += delta	
	$elapsed_time.text = "経過時間"+"%7.1f" % elapsed_time	

func _physics_process(delta):
	elapsed_time_ph += delta	
	$elapsed_time_ph.text = "経過時間"+"%7.1f" % elapsed_time_ph		
