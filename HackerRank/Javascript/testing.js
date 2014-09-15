// var readline = require('readline');
// var rl = readline.createInterface({
// 	input: process.stdin, output: process.stdout
// });
// var t=0, data;
// rl.on('line', function(cmd) {
// 	if (t == 1) {
// 		data = cmd.split(" ");
// 	} else {
// 		data = cmd;
// 	}
// 	t += 1;
// 	console.log(data);
// })

var file = process.argv[2];
var fs = require('fs');
fs.readFile(file, {encoding: 'utf-8'}, function(err, data) {
	if (!err) {
		var lines = data.split('\n');
		console.log("line1: " + lines[0]);
		console.log('line2: ' + lines[1]);
	} else {
		console.log('error');
	}
});
