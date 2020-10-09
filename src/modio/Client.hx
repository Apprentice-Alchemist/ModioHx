package modio;

import haxe.http.HttpMethod;
import modio.endpoints.Endpoints;

@:expose
@:allow(modio)
class Client {
	public static var inst(default, null):Client;

	private var token:String;
    private var oauth:Null<String>;
	public var endpoints(default, null):Endpoints;

	/**
	 * [Description]
	 * @param tkn
     * @throws (modio.Error) 
	 */
	public function new(tkn:String,?oauth:String) {
		token = tkn;
        inst = this;
        this.oauth = oauth;
		endpoints = new Endpoints(this);
	}

	public function emailRequest(mail:String, cb:Int->Void) {
		/*var req = new haxe.Http("https://api.mod.io/v1/oauth/emailrequest");
			req.addParameter("api_key",token);
			req.addParameter("email",mail);
			req.addHeader("Content-Type", "application/x-www-form-urlencoded");
		 */
		throw new haxe.Exception("Not supported yet!");
	}
}
