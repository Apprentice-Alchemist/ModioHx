package modio.structs;

typedef ModFile = {
	var id:Int;
	var mod_id:Int;
	var date_added:Int;
	var date_scanned:Int;
	var virus_status:Int;
	var virus_positive:Int;
	var virustotal_hash:String;
	var filesize:Int;
	var filehash:{
		var md5:String;
	};
	var filename:String;
	var version:String;
	var changelog:String;
	var metadata_blob:String;
	var download:{
		var binary_url:String;
		var date_expires:Int;
	};
}