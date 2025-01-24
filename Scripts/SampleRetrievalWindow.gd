extends Window 

class_name SampleRetrievalWindow

@onready var installedSamplesList = $"Control/Panel/TabContainer/TAB_JAVA_SAMPLES/VBoxContainer/ScrollContainer/InstalledSamplesList"

static func create() -> SampleRetrievalWindow:
	var sampleRetrievalWindow: SampleRetrievalWindow = load("res://Windows/SampleManager/SampleManagerWindow.tscn").instantiate() 
	sampleRetrievalWindow.show()
	return(sampleRetrievalWindow)
	

func _ready():
	var samples = JavaPackConfig.retrieve_java_sample_names()
	for sample in samples:
		var sampleLabel = Label.new()
		sampleLabel.text = sample + ("" if samples[sample] else "*")
		installedSamplesList.add_child(sampleLabel)
		
	pass

func _on_close_requested():
	queue_free()
