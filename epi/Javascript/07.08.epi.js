/*
Compute all valid IP addresses
*/
function computeIPAddresses(str) {
  var res = [];

  function compute(str, numPeriodsLeft, result) {
    console.log("numPeriodsLeft: "+numPeriodsLeft);
    console.log("temp result: "+result);
    if (numPeriodsLeft == 0) {
      result += str;
      res.push(result);
    } else {
      for (var i=1; i<str.length-numPeriodsLeft+1; i++) {
        compute(str.slice(i), numPeriodsLeft-1, result+str.slice(0,i)+".");
      }
    }
  }

  compute(str, 3, "");
  return res;
}

console.log(computeIPAddresses("19216811"));
