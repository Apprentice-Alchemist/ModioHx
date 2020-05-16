package modio.endpoints;

import modio.Client;

class Endpoints{
    public static var api_path:String = "https://api.mod.io/";
    public static var api_version:String = "v1/";

    public var client:Client;
    public static function new(c:Client){
        this.client = c;
    }
	public static function makeRequest(url:String,cb:(sc:Int, data:Dynamic) -> Void){

    }
    public function getGames(cb:(sc:Int,data:Dynamic)->Void){

    }
	public function getGame(id:Int, cb:(sc:Int, data:Dynamic) -> Void){

    }
	public function getMods(cb:(sc:Int, data:Dynamic) -> Void){

    }
}