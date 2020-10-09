package modio.structs;

typedef ModStats = {
	var mod_id:Int;
	var popularity_rank_position:Int;
	var popularity_rank_total_mods:Int;
	var downloads_total:Int;
	var subscribers_total:Int;
	var ratings_total:Int;
	var ratings_positive:Int;
	var ratings_negative:Int;
	var ratings_percentage_positive:Int;
	var ratings_weighted_aggregate:Float;
	var ratings_display_text:String;
	var date_expires:Int;
}