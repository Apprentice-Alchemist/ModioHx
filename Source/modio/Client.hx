package modio;

import haxe.http.HttpMethod;
import modio.endpoints.Endpoints;

class Client {
	public static var inst:Client;

	public var token:String;
	public var endpoints:Endpoints;

	public function new(tkn:String) {
		token = tkn;
        inst = this;
        endpoints = new Endpoints(this);
    }
    public function emailRequest(mail:String,cb:Int -> Void){
        var req = new haxe.Http("https://api.mod.io/v1/oauth/emailrequest");
        req.addParameter("api_key",token);
        req.addParameter("email",mail);
        req.addHeader("Content-Type", "application/x-www-form-urlencoded");
        throw new haxe.Exception("Not supported yet!");
        
    }
}
