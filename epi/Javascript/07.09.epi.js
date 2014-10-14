/*
Write a string sinusoidally
*/
function snakeStringOf(s) {
  var i, res = "";
  for (i=1; i<s.length; i+=4) {
    res += s[i];
  }
  for (i=0; i<s.length; i+=2) {
    res += s[i];
  }
  for (i=3; i<s.length; i+=4) {
    res += s[i];
  }
  return res;
}

console.log(snakeStringOf("Hello World!"));
