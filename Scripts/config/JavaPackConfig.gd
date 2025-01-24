extends Object

class_name JavaPackConfig

#
#
#@returns Dictionary{sampleName,isValidated}
static func retrieve_java_sample_names() -> Dictionary:
	var samplesFolder = DirAccess.open("user://java_samples")
	if samplesFolder == null:
		push_warning("java samples folder does not exist, creating new one")
		DirAccess.open("user://").make_dir("java_samples")
		return {}
	
	var samples = {}
	
	for dir in samplesFolder.get_directories():
		samples[dir.get_basename() + "." + dir.get_extension()] = is_sample_verified(dir.get_basename())
		
	return samples
	
	
	
static func is_sample_verified(sampleVersion:String) -> bool:
	return false
	
static func is_sample_supported(sampleVersion:String) -> bool:
	return false
	
static func validate_java_sample() -> bool:
	#use md5 checksum on sample path
	push_error("validate_java_sample not yet implemented")
	return false
