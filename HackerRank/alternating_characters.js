function processData(input) {
  var inputArray = input.split('\n');
  var t = parseInt(inputArray[0]);
  var pointer = 1;
  while (pointer <= t) {
    var target = inputArray[pointer];
    var count = 0;
    for (var i=1; i<target.length; i++) {
      if (target[i] == target[i-1]) {
        count += 1;
      }
    }
    console.log(count);
    pointer += 1;
  }
} 

process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = "";
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
   processData(_input);
});
