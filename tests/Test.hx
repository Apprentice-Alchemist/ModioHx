import utest.Assert;
import utest.Async;

class Test extends utest.Test{
    final client:modio.Client;
    public override function new(client:modio.Client){
        super();
        this.client = client;
    }
    public function testMe(async:Async){
        async.setTimeout(3000);
        client.endpoints.getMe().then(function(u){
            Assert.pass();
            async.done();
        }).catchError(function(e){
            Assert.fail();
            async.done();
        });
    }
}