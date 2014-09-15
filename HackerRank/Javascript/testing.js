var readline = require('readline');
var rl = readline.createInterface({
	input: process.stdin, output: process.stdout
});
var t=0, data;
rl.on('line', function(cmd) {
	if (t == 1) {
		data = cmd.split(" ");
	} else {
		data = cmd;
	}
	t += 1;
	console.log(data);
})