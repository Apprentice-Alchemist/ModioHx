import haxe.ds.BalancedTree;
import haxe.Json;
import modio.Client;

class Main {
	public static function main() {
		final auth = haxe.Json.parse(sys.io.File.getContent("auth.json"));
		final client = new Client(auth.modio_key, auth.oauth);
		client.endpoints.getGames().then(gs -> {
			for (g in gs)
				trace(g.name);
		}).catchError(e -> trace(e));
		// client.endpoints.makeRequest({
		// 	path: "/batch",
		// 	method: Post,
		// 	// data: Json.stringify({
		// 	// 	batch: []
		// 	// })
		// 	data: '"batch[0][relative_url]": "v1/games/11/mods"
		// 	"batch[0][method]": "GET"'
		// }).then(x -> trace(x)).catchError(e -> trace(e));
		// var auth = haxe.Json.parse(sys.io.File.getContent("auth.json"));
		// var client = new Client(auth.modio_key, auth.oauth);
		// final runner = new utest.Runner();
		// utest.ui.Report.create(runner);
		// runner.addCase(new Test(client));
		// runner.run();
	}
}
