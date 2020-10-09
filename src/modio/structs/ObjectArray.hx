package modio.structs;

typedef ObjectArray<T> = {
	var data:Array<T>;
	var result_count:Int;
	var result_offset:Int;
	var result_limit:Int;
	var result_total:Int;
};
