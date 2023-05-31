
function saveJsonToFile(){
	/// saveJsonToFile(json, filename)

	/// Saves a JSON string to a file.

	/// @param {string} json - The JSON string to be saved.
	/// @param {string} filename - The name of the file to save.

	var json = argument[0];
	var filename = argument[1];

	// Open the file for writing
	var file = file_text_open_write(filename);

	if (file != -1)
	{
	    // Write the JSON string to the file
	    file_text_write_string(file, json);
    
	    // Close the file
	    file_text_close(file);
	}
	else
	{
	    show_debug_message("Failed to open file: " + filename);
	}

}