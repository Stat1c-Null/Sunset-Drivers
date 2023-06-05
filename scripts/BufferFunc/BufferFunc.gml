function SaveString(_string, filename){
	var buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1)
	buffer_write(buffer, buffer_string, _string)
	buffer_save(buffer, filename)
	buffer_delete(buffer)
}

function LoadString(filename) {
	var buffer = buffer_load(filename)
	var _string = buffer_read(buffer, buffer_string)
	
	buffer_delete(buffer)
	return _string
}