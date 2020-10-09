import modio.Client;

class Main {
	public static function main() {
		
		var auth = haxe.Json.parse(sys.io.File.getContent("auth.json"));
		var client = new Client(auth.modio_key, auth.oauth);
		final runner = new utest.Runner();
		utest.ui.Report.create(runner);
		runner.addCase(new Test(client));
		runner.run();
	}
}
