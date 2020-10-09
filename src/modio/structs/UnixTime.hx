package modio.structs;

abstract UnixTime(Float){
	@:from public static function fromUnix(i:Int)
		return new UnixTime(i);
    @:from public static function fromHaxeDate(d:Date)
        return new UnixTime(d.getTime() / 1000);
    public function new(i:Float)
        this = i;

	@:to function toHaxeDate():Date
		return Date.fromTime(this * 1000);
    @:to function toString():String
		return Date.fromTime(this * 1000).toString();
}