/*
Convert from Roman to Decimal
*/
function romanToDecimal(str) {
  var values = {
    I: 1, V: 5, X: 10, L: 50,
    C: 100, D: 500, M: 1000
  }

  var res = values[str[str.length-1]], i;
  for (i=str.length-2; i>=0; i--) {
    if (values[str[i]] < values[str[i+1]]) {
      res -= values[str[i]];
    } else {
      res += values[str[i]];
    }
  }

  return res;
}

console.log(romanToDecimal("LIX"));
