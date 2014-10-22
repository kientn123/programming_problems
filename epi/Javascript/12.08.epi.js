/*
Search in two sorted arrays
You are given two sorted arrays A and B of lengths m and n, respectively, and a positive
integer k in [1, m+n]. Design an algorithm that runs in O(logk) time for computing the k-th
smallest element in array formed by merging A and B. Array elements may be duplicated
within and between A and B
*/
function findKInTwoSortedArrays(a, b, k) {
    // Assume valid inputs
    // Idea: find h, number of elements which are less than k in A by doing binary search
    // on h.
    // If k <= a.length: 0 <= h <= k
    // else: max(k-b.length, 0) <= h <= a.length
    var left, right;
    if (k <= a.length) {
        left = 0; right = k;
    } else {
        left = Math.max(k-b.length, 0);
        right = a.length;
    }
    while (left <= right) {
        var mid = Math.floor((left+right)/2);
        if (mid<=k-1 && a[mid]<b[k-1-mid]) {
            left = mid+1;
        } else if (mid >= 1 && a[mid-1] > b[k-mid]) {
            right = mid-1;
        } else {
            if (mid == 0) {
                return b[k-1];
            } else if(mid == k) {
                return a[k-1];
            } else {
                return Math.max(a[mid-1], b[k-1-mid]);
            }
        }
    }
}

var a = [1,3,5,7,9,11];
var b = [2,4,6,8,10];
var a1 = [1,2,3,4];
var b1 = [5,6,7,8,9];
console.log(findKInTwoSortedArrays(a, b, 6));
console.log(findKInTwoSortedArrays(a1, b1, 4));
