/*
Search in a 2D sorted array
Let A be an nxn 2D array where rows and columns are sorted in increasing order. Design an
efficient algorithm that decides whether a number n appears in A.
*/
function search(arr, n) {
    if (arr.length == 0) {
        return;
    }
    // Assume input is valid
    var res = {row: 0, col: arr[0].length-1};
    while (res.row <= arr.length-1 && res.col >= 0) {
        if (arr[res.row][res.col] == n) {
            return res;
        } else if (arr[res.row][res.col] > n) {
            res = {row: res.row, col: res.col-1};
        } else {
            res = {row: res.row+1, col: res.col};
        }
    }
    return {row: -1, col: -1};
}

var arr = [[1,2,3,4,5,6,7],
           [8,9,10,11,12,13,14],
           [15,16,17,18,19,20,21]];
console.log(search(arr, 18));
console.log(search(arr, 22));
