package modio.endpoints;

import modio.structs.*;
import modio.Client;

private class RequestError extends modio.Error {
	public var code:Int;
	public var msg:String;

	override public function new(code, message) {
		super(message);
		this.code = code;
		this.msg = Endpoints.codeToResponse(code);
	}

	override function toString() {
		return 'Error Code : $code => $msg';
	}
}

class Endpoints {
	public static var api_path:String = "https://api.mod.io/";
	public static var api_version:String = "v1/";

	public var client:Client;

	public function new(c:Client) {
		this.client = c;
	}

	public function makeRequest(path:String):Promise<Dynamic, RequestError> {
		return new Promise(function(f, e) {
			var status:Int = 0;
			final req = new haxe.Http(api_path + haxe.io.Path.normalize(api_version + path));
			req.addHeader("Content-Type", "application/x-www-form-urlencoded");
			if (client.oauth != null) {
				req.addHeader("Authorization", 'Bearer ${client.oauth}');
			}
			req.addParameter("api_key", client.token);
			req.onData = d -> f(haxe.Json.parse(d));
			req.onStatus = s -> status = s;
			req.onError = err -> e(new RequestError(status, err));
			req.request();
		});
	}

	public function getMe():Promise<User, RequestError> {
		return new modio.Promise(function(r, e) {
			makeRequest("/me").then(r).catchError(e);
		});
	}

	public function getGame(id:Int):Promise<modio.structs.Game, RequestError> {
		return new Promise(function(fullfill, error) {
			makeRequest('/games/$id').then(fullfill).catchError(error);
		});
	}

	public function getGames():Promise<ObjectArray<Game>, RequestError> {
		return new Promise(function(fullfill, error) {
			makeRequest('/games').then(fullfill).catchError(error);
		});
	}

	public function getMods(game_id:Int):Promise<ObjectArray<Mod>, RequestError> {
		return new Promise(function(fullfill,error){
			makeRequest('/games/$game_id/mods').then(fullfill).catchError(error);
		});
	}

	public static inline function codeToResponse(c:Int):String {
		switch c {
			case 200:
				return "OK -- Your request was successful.";
			case 201:
				return "Created -- Resource created, inspect Location header for newly created resource URL.";
			case 204:
				return "No Content -- Request was successful and there was no data to be returned.";
			case 400:
				return "Bad request -- Server cannot process the request due to malformed syntax or invalid request message framing.";
			case 401:
				return "Unauthorized -- Your API key/access token is incorrect, revoked, or expired.";
			case 403:
				return "Forbidden -- You do not have permission to perform the requested action.";
			case 404:
				return "Not Found -- The requested resource could not be found.";
			case 405:
				return "Method Not Allowed -- The method of your request is incorrect.";
			case 406:
				return "Not Acceptable -- You supplied or requested an incorrect Content-Type.";
			case 410:
				return "Gone -- The requested resource is no longer available.";
			case 422:
				return "Unprocessable Entity -- The request was well formed but unable to be followed due to semantic errors.";
			case 429:
				return "Too Many Requests -- You have made too many requests, inspect headers for reset time.";
			case 500:
				return "Internal Server Error -- The server encountered a problem processing your request. Please try again.";
			case 503:
				return "Service Unavailable -- We're temporarily offline for maintenance. Please try again later.";
			default:
				return "Unknown code";
		}
	}
}

abstract RCode(Int) {
	@:from static function IntToRCode(i:Int)
		return new RCode(i);

	@:from static function StringToRCode(i:String)
		return new RCode(Std.parseInt(i));

	inline function new(i:Int)
		this = i;

	@:to function toString():String
		return Endpoints.codeToResponse(this);
}
