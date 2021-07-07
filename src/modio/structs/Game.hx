package modio.structs;

typedef Game = {
	var id:Int;
	var status:SubmissionStatus;
	var submitted_by:User;
	var date_added:UnixTime;
	var date_updated:UnixTime;
	var date_live:UnixTime;
	var presentation_option:Int;
	var submission_option:Int;
	var curation_option:Int;
	var community_options:Int;
	var revenue_options:Int;
	var api_access_options:Int;
	var maturity_options:Int;
	var ugc_name:String;
	var icon:Icon;
	var logo:Logo;
	var header:HeaderImage;
	var name:String;
	var name_id:String;
	var summary:String;
	var instructions:String;
	var instruction_url:String;
	var profile_url:String;
	var tag_options:Array<{
		var name:String;
		var type:String;
		var tags:Array<String>;
		var hidden:Bool;
	}>;
}

@:enum abstract SubmissionStatus(Int) {
	var NotAccepted = 0;
	var Accepted = 1;
	var Deleted = 2;
}