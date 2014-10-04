/*
The parity of a binary word is 1 if the number of 1s in the word is odd;
otherwise, it is 0.
For example, the parity of 1011 is 1,
and the parity of 10001000 is 0.
Parity checks are used to detect single bit erros
in data storage an communication. It is fairly straightforward
to write code that computes the parity of a single 64-bit word
*/
function parity(x) {
  var result;
  while (x !== 0) {
    result ^= (x & 1);
    x >>= 1;
  }
  return result;
}

console.log(parity(10));
console.log(parity(11));
