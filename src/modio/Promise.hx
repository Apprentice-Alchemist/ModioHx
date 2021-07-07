package modio;

/**
 * A promise. ***DOES NOT BEHAVE LIKE JS PROMISES!***
 */
class Promise<R, E> {
	private var onDone:Null<R->Void>;
	private var onError:Null<E->Void>;
	/**
	 * Create a new promise
	 * @param init 
	 */
	public function new(init:(done:(R->Void),error:(E->Void))->Void) {
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

	/**
	 * **RETURNS ITSELF, not a different promise!**
	 * *Remember, this isn't a js promise*
	 * @param cb 
	 * @return Promise<R, E> 
	 */
	public function then(cb:R->Void):Promise<R, E> {
		onDone = cb;
		return new Promise((done, error) -> {
			
		});
	}

	public function catchError(cb:E->Void) {
		onError = cb;
	}
}
