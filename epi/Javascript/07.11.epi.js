/*
Implement Elias Gamma Encoding
The Elias Gamma Encoding of a positive integer n is computed as follows:
- Write n in binary to form string b
- Subtract 1 from the number of bits written in the first step, and add that
many zeroes to the beginning of string b
*/
function toBinaryString(n) {
  var res = "";
  while (n>0) {
    if (n&1) {
      res = "1" + res;
    } else {
      res = "0" + res;
    }
    n >>= 1;
  }
  return res;
}

function encodeEliasGamma(n) {
  var binary = toBinaryString(n);
  return Array(binary.length).join("0")+binary;
}

function encodeEliasGammaAList(arr) {
  var res = "", i;
  for (i=0; i< arr.length; i++) {
    res += encodeEliasGamma(arr[i]);
  }
  return res;
}

function binaryToDecimal(target) {
  var i, res=0;
  for (i=0; i<target.length; i++) {
    res = res*2 + parseInt(target[i]);
  }
  return res;
}

function decode(str) {
  var count=0, res=[], i=0, target;
  while (i<str.length) {
    if (str[i]==0) {
      count++;
      i++;
    } else {
      target = str.substr(i, count+1);
      res.push(binaryToDecimal(target));
      i += count+1;
      count=0;
    }
  }
  return res;
}

console.log(encodeEliasGammaAList([10,11,12]));
console.log(decode("000101000010110001100"));
console.log(binaryToDecimal("1011"));
