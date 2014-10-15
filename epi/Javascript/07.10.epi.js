/*
Implement run-length encoding
Run-length encoding (RLE) compression offers a fast way to do efficient on the
flight compression and decompression of strings. The idea is simple - encode
successive repeated chracters by the repetition count and the characters.
For example, the RLE of 'aaaabcccaa' is '4a1b3c2a'. The decoding of '3e4f2e'
returns 'eeeffffee'.
*/
function encoding(s) {
  var res = "", i, count=1;
  for (i=0; i<s.length-1; i++) {
    if (s[i] == s[i+1]) {
      count++
    } else {
      res += count.toString() + s[i];
      count = 1;
    }
  }
  res += count.toString() + s[i];
  return res;
}

function decoding(s) {
  var res = "", i, count = 0;
  for (i=0; i<s.length; i++) {
    if (!isNaN(parseInt(s[i]))) {
      count = count*10 + parseInt(s[i]);
      //console.log(count);
    } else {
      res += Array(count+1).join(s[i]);
      //console.log(res);
      count = 0;
    }
  }
  return res;
}

console.log(encoding('aaaabcccaa'));
console.log(decoding('13e14f12e'));
