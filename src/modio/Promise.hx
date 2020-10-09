package modio;

class Promise<R, E> {
	private var onDone:Null<R->Void>;
	private var onError:Null<E->Void>;

	public function new(init:(R->Void)->(E->Void)->Void) {
		haxe.Timer.delay(function() {
			init(function(ret:R) {
				if (onDone != null)
					onDone(ret);
			}, function(err:E) {
				if (onError != null)
					onError(err);
			});
		}, 0);
	}

	public function then(cb:R->Void):Promise<R, E> {
		onDone = cb;
		return this;
	}

	public function catchError(cb:E->Void):Promise<R, E> {
		onError = cb;
		return this;
	}
}
