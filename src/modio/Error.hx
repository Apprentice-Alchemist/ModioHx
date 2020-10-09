package modio;

class Error extends haxe.Exception {
	override public function new(message:String, ?previous:Error) {
		super(message, previous);
	}

	override function toString():String {
		return 'Modio Error : ${super.toString()}';
	}
}
