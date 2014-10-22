/*
Search a sorted array for A[i] == i
Design an efficient algorithm that takes a sorted array A of distinct numbers, and returns
an index i such that A[i] = i; if no such index exists, return -1
*/
function search(arr) {
    if (arr.length == 0) {
        return -1;
    }
    var left = 0, right = arr.length - 1;
    while (left <= right) {
        var mid = Math.floor((left + right)/2);
        if (arr[mid] == mid) {
            return mid;
        } else if (arr[mid] < mid) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1
}

var arr = [-2,0,2,3,6,7,9,10,15,20];
console.log(search(arr));
