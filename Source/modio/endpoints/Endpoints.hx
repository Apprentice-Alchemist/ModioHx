package modio.endpoints;

import modio.Client;

class Endpoints {
	public static var api_path:String = "https://api.mod.io/";
	public static var api_version:String = "v1/";

	public var client:Client;

	public function new(c:Client) {
		this.client = c;
	}

	public static function makeRequest(url:String, cb:(sc:Int, data:Dynamic) -> Void) {}

	public function getGames(cb:(sc:Int, data:Dynamic) -> Void) {}

	public function getGame(id:Int, cb:(sc:Int, data:Dynamic) -> Void) {}

	public function getMods(cb:(sc:Int, data:Dynamic) -> Void) {}

	public static inline function codeToResponse(c:Int):String {
		switch c {
			case 200:
				return "OK -- Your request was successful."
			case 201:
				return "Created -- Resource created, inspect Location header for newly created resource URL."
			case 204:
				return "No Content -- Request was successful and there was no data to be returned."
			case 400:
				return "Bad request -- Server cannot process the request due to malformed syntax or invalid request message framing."
			case 401:
				return "Unauthorized -- Your API key/access token is incorrect, revoked, or expired."
			case 403:
				return "Forbidden -- You do not have permission to perform the requested action."
			case 404:
				return "Not Found -- The requested resource could not be found."
			case 405:
				return "Method Not Allowed -- The method of your request is incorrect."
			case 406:
				return "Not Acceptable -- You supplied or requested an incorrect Content-Type."
			case 410:
				return "Gone -- The requested resource is no longer available."
			case 422:
				return "Unprocessable Entity -- The request was well formed but unable to be followed due to semantic errors."
			case 429:
				return "Too Many Requests -- You have made too many requests, inspect headers for reset time."
			case 500:
				return "Internal Server Error -- The server encountered a problem processing your request. Please try again."
			case 503:
				return "Service Unavailable -- We're temporarily offline for maintenance. Please try again later."
			default:
				return "Unknown code"
		}
	}
}

abstract RCode(Int) {
	@:from static function IntToRCode(i:Int)
		return new RCode(i);

	@:from static function StringToRCode(i:String)
		return new RCode(Std.parseInt(i));

	public var code:Int;

	inline function new(i:Int)
		code = i;

	@:to function toString()
		return Endpoints.codeToResponse(code);
}
