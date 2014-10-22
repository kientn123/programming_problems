/*
Write a method that takes a sorted array A and a key k and returns the index
of the first occurrence of k in A. Return -1 if k doesn't appear in A.
*/
function search_first_appearence(arr, k) {
    if (arr.length == 0) {
        return -1;
    }
    var left = 0, right = arr.length - 1;
    while (left <= right) {
        var mid = Math.floor((left + right)/2), runner;
        if (arr[mid] == k) {
            runner = mid;
            while (runner >= 0 && arr[runner] == k) {
                runner--;
            }
            return runner+1;
        } else if (arr[mid] > k) {
            runner = mid;
            while (runner >= left && arr[runner] == arr[mid]) {
                runner--;
            }
            right = runner;
        } else {
            runner = mid;
            while (runner <= right && arr[runner] == arr[mid]) {
                runner++;
            }
            left = runner;
        }
    }
    return -1;
}

var arr = [-14,-10,2,108,108,243,285,285,401];
console.log(search_first_appearence(arr, 285));
console.log(search_first_appearence(arr, 243));
console.log(search_first_appearence(arr, 401));
