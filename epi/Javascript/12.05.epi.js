/*
Search a sorted array of unknown length
Let A be a sorted array. The length of A is not known in advance; accessingA[i] for i
beyond the end of the array throws an exception. Design an algorithm that takes A and
a key k and returns an index i such that A[i] = k; return -1 if k doesn't appear in A.
In case of javascript: the exception things can be translated to A[i] being undefined
*/
function search(arr, k) {
    var p = 0;
    while (true) {
        var index = (1 << p) - 1;
        if (arr[index] == undefined) {
            break;
        }
        var val = arr[index];
        if (val == k) {
            return index;
        } else if (val < k) {
            p++;
        } else {
            break;
        }
    }

    var left = Math.max(0, 1 << (p-1)), right = (1<<p) - 2;
    while (left <= right) {
        var mid = (left + right)/2;
        if (arr[mid] == undefined) {
            right = mid - 1;
        } else if (arr[mid] == k) {
            return mid;
        } else if (arr[mid] < k) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1;
}

var arr = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
console.log(search(arr, 12));
console.log(search(arr, 18));
