package modio.structs;

typedef ModFile = {
	var id:Int;
	var mod_id:Int;
	var date_added:UnixTime;
	var date_scanned:UnixTime;
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
		var date_expires:UnixTime;
	};
}

@:enum abstract VirusStatus(Int) {
	var NotScanned;
	var ScanComplete;
	var InProgress;
	var TooLargeToScan;
	var FileNotFound;
	var ErrorScanning;

	inline function toString():String {
		return switch this {
			case 0: "Not scanned";
			case 1: "Scan complete";
			case 2: "In progress";
			case 3: "Too large to scan";
			case 4: "File not found";
			case 5: "Error Scanning";
			default: "Unknown Status";
		}
	}
}
