function processData(input) {
  var inputA = input.split('\n');
  var store = {0: 1,1: 1, 2: 1, 3: 1};
  var times = parseInt(inputA[0]);
  for (var i=1; i<inputA.length; i++) {
    var n = parseInt(inputA[i]);
    var ways = numOfWays(n, store);
    //console.log("ways: " + ways);
    var count = 0;
    for (var j=2; j<=ways; j++) {
      if (isPrime(j)) {
        count += 1;
      }
    }
    console.log(count);
  }
} 

function numOfWays(n, store) {
  if (store[n] != undefined) {
    return store[n];
  } else {
    store[n] = numOfWays(n-1, store) + numOfWays(n-4, store);
    return store[n];
  }
}

function isPrime(n) {
  if (n <=1 ) { return false; }
  var limit = Math.round(Math.sqrt(n));
  for (var i=2; i<=limit; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
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

