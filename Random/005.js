/*
Place n numbers from 1 to n in 2n positions, each number appears twice
in such a way that there are exactly n numbers of cells in two placed
locations of number 'n'
*/
// Apply backtracking idea
function solve(n) {
  var res = new Array(2 * n);
  var bool = new Array(n+1);
  function backtrack(pos) {
    if (pos >= 2*n) {
      return true;
    }
    if (res[pos] != undefined) {
      return backtrack(pos+1);
    }
    var i;
    for (i=1; i<=n; i++) {
      if (bool[i]==undefined) {
        if (pos+1+i<2*n && res[pos]==undefined && res[pos+1+i]==undefined) {
          res[pos] = i;
          res[pos + i + 1] = i;
          bool[i] = true;

          if (backtrack(pos+1)) {
            return true;
          }
          res[pos] = undefined;
          res[pos + i + 1] = undefined;
          bool[i] = undefined;
        }
      }
    }
    return false;
  }

  backtrack(0);
  return res;
}
console.log(solve(7));
