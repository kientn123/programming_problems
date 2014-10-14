/*
Compute all mnemonics for a phone number
*/
function mnemonics(str) {
  var hash = {
    '2': ['A', 'B', 'C'],
    '3': ['D', 'E', 'F'],
    '4': ['G', 'H', 'I'],
    '5': ['J', 'K', 'L'],
    '6': ['M', 'N', 'O'],
    '7': ['P', 'Q', 'R', 'S'],
    '8': ['T', 'U', 'V'],
    '9': ['W', 'X', 'Y', 'Z']
  };

  var res = [];

  function compute(aStr, start, store) {
    if (start >= aStr.length) {
      res.push(store)
    } else {
      list = hash[aStr[start]];
      for (var i=0; i<list.length; i++) {
        console.log("char is: " + list[i]);
        compute(aStr, start+1, store.concat([list[i]]));
      }
    }
  };

  compute(str, 0, []);
  return res;
}

console.log(mnemonics('23').length);
