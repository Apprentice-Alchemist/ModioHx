package modio.structs;

typedef Game = {
    var id:Int;
    var status:Int;
    var submitted_by:Dynamic; // TODO change to user!
    var date_added:Int;
    var date_updated:Int;
    var date_live:Int;
    var presentation_option:Int;
    var submission_option:Int;
    var curation_option:Int;
	var community_options:Int;
	var revenue_options:Int;
    var api_access_options:Int;
    var maturity_options:Int;
    var ugc_name:String;
    // TODO var icon:Icon;
    // TODO var logo:Logo;
    // TODO var header:HeaderImageObject
    var name:String;
    var name_id:String;
    var summary:String;
    var instructions:String;
    var instruction_url:String;
    var profile_url:String;
    // TODO var tag_options:GameTagOptions;
}
