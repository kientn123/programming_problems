/*
Search a sorted array for the first element greater than k
*/
function search(arr, k) {
    if (arr.length == 0) {
        return -1;
    }
    var left = 0, right = arr.length-1, res = -1;
    while (left <= right) {
        var mid = Math.floor((left + right)/2);
        if (arr[mid] > k) {
            res = mid;
            right = mid-1;
        } else {
            left = mid+1;
        }
    }
    return res;
}
var arr = [-14,-10,2,108,108,243,285,285,401];
console.log(search(arr, 500));
console.log(search(arr, 101));
