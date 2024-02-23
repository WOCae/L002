extends Node2D
#import File

func _ready():
	
	#ファイルの書込み
	var string1 = "testLine1\ntestLine2"
	var file1 = FileAccess.open("string.txt", FileAccess.WRITE)
	file1.store_string(string1)		
	file1.close()

	#ファイルの読み込み	
	var file2 = FileAccess.open("data.txt", FileAccess.READ)
	var line = file2.get_csv_line()
	while line.size() >= 3:
		# 横方向の項目数が足りない場合は終了
		print("colm1: %s" % line[0])
		print("colm2: %s" % line[1])
		print("colm3: %s" % line[2])
		print("colm4: %s" % line[3])		
		line = file2.get_csv_line()
	file2.close()
