/*
Compute the integer square root
Write a function which takes a nonnegative integer k and returns the largest integer s such
that s^2 <= k. Assume k >= 0
*/
function squareRoot(n) {
    var left = 0, right = n;
    while (left <= right) {
        var mid = Math.floor((left + right)/2);
        if (Math.pow(mid, 2) > n) {
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }
    return right;
}

console.log(squareRoot(16));
console.log(squareRoot(300));
