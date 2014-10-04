/*
remove duplicate characters in a string without using any additional buffer
*/

function remove(s) {
  if (s == null || s == undefined) {
    return 'invalid input';
  } else if (s.length == 1) {
    return 'no duplicates, only 1 character';
  } else {
    var tail = 1;
    for (var i=0; i<s.length; i++) {
      for (var j=0; j<tail; j++) {
        if (s[i] == s[j]) {
          break;
        }
      }
      if (j == tail) {
        s[tail] == s[i];
        tail++;
      }
    }
    for (var i=tail; i<s.length; i++) {
      s[i] = null;
    }
  }
}

var s = ['a', 'b', 'c', 'a', 'c', 'c'];
remove(s);
console.log(s);
