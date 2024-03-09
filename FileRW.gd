extends Node2D
#import File

func _ready():
	
	#ファイルの書込み
	var string1 = "testLine1\ntestLine2"
	var file1 = FileAccess.open("string.txt", FileAccess.WRITE)
	file1.store_string(string1)		
	file1.close()

	#ファイルの読み込み	 CSVのラインとして読み込み
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

	#テキストでの読み込み
	var file = FileAccess.open("res://data.txt", FileAccess.READ)
	var line2 = file.get_as_text()
	#print(line.size())
	print("line2:\n",line2)	
	var row1 = line2.split("\n") #行の取得
	var colum1 = row1[0].split(",") #列の取得
	print("row1:",row1[0]) #取得行を表示
	print("colum1:",colum1[0]) #行内の列ごとの値を表示
		
	file.close()
	
