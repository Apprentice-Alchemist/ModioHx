package modio.structs;

@:using(modio.structs.ObjectArray.OATools)
typedef ObjectArray<T> = {
	var data:Array<T>;
	var result_count:Int;
	var result_offset:Int;
	var result_limit:Int;
	var result_total:Int;
};

class OATools {
	public static function iterator<T>(o:ObjectArray<T>):Iterator<T> {
		return o.data.iterator();
	}
}