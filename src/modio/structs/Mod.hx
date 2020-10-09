package modio.structs;

typedef Mod = {
	var id:Int;
	var game_id:Int;
	var status:Int;
	var visible:Int;
	var submitted_by:User;
	var date_added:Int;
	var date_updated:Int;
	var date_live:Int;
	var maturity_option:Int;
	var logo:Logo;
	var homepage_url:String;
	var name:String;
	var name_id:String;
	var summary:String;
	var description:String;
	var description_plaintext:String;
	var metadata_blob:String;
	var profile_url:String;
	var media:ModMedia;
	var modfile:ModFile;
	var metadata_kvp:Array<{
		var metakey:String;
		var metavalue:String;
	}>;
	var tags:Array<{
		var name:String;
		var date_added:Int;
	}>;
	var stats:ModStats;
}