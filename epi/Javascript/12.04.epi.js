/*
Search a cyclically sorted array.
Design an O(logn) algorithm for finding the position of the smallest element in a cyclically
sorted array. Assume all elements are distinct
*/
function searchForSmallest(arr) {
    if (arr.length == 0) {
        return;
    }
    var left = 0, right = arr.length - 1;
    while (left <= right) {
        var mid = Math.floor((left + right)/2);
        console.log({
            left: left, right: right
        });
        if (arr[mid] < arr[left]) {
            right = mid;
        } else if (arr[mid] > arr[left]) {
            left = mid + 1;
        } else {
            return arr[left] < arr[right] ? left : right;
        }
    }
}

var arr = [378,478,550,631,103,203,220,234,279,368];
console.log(searchForSmallest(arr));
