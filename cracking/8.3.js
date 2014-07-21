function getSubsets(s) {
  var toReturn = [];
  if (s.length === 0) {
    toReturn.push([]);
  }
  else if (s.length === 1) {
    toReturn = [[], s];
  }
  else {
    var sub = getSubsets(s.slice(0, s.length-1));
    for (var e in sub) {
      toReturn.push(sub);
      var e1 = e.slice(0, e.length).push(s[s.length-1]);
      toReturn.push(e1);
    }
    sub.push(s[s.length-1]);
  }
  return toReturn;
}

s = [1, 2, 3, 4, 5];
console.log(getSubsets(s));
