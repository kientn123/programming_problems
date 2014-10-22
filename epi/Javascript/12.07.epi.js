/*
Compute the real square root
*/
function compare(a, b) {
    var val = Math.abs(a - b);
    if (val <= 0.01) {
        return 0;
    } else if (a < b) {
        return -1;
    } else {
        return 1;
    }
}

function squareRoot(floatNum) {
    if (floatNum < 0) {
        return;
    }
    var left, right;
    if (floatNum < 1) {
        left = floatNum; right = 1;
    } else {
        left = 1; right = floatNum;
    }
    while (compare(left, right) == -1) {
        var mid = (left + right) / 2;
        if (compare(Math.pow(mid, 2), floatNum) == 0) {
            return mid;
        } else if (compare(Math.pow(mid, 2), floatNum) == 1) {
            right = mid;
        } else {
            left = mid;
        }
    }
    return left;
}

console.log(squareRoot(300));
