/*
Design an algorithm for computing the k-th largest element in an array A that runs in
O(n) expected time.
*/
function findKLargestElement(arr, k) {
    if (arr.length < k) {
        return;
    }
    return findHelper(arr, k, 0, arr.length - 1);
}

function findHelper(arr, k, start, end) {
    if (start == end) {
        return arr[start];
    }
    var index = random(start, end);
    swap(arr, start, index);
    var target = arr[start];
    var runner = start + 1;
    var curr = start + 1;
    while (runner <= end) {
        if (arr[runner] < target) {
            swap(arr, runner, curr);
            curr++;
        }
        runner++;
    }
    swap(arr, start, curr-1);
    if (curr-1 == k-1) {
        return arr[curr-1];
    } else if (curr-1 < k-1) {
        return findHelper(arr, k, curr, end);
    } else {
        return findHelper(arr, k, start, curr-2);
    }
}

function swap(arr, i, j) {
    if (i != j) {
        var temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}

// Return a random integer in [a, b)
function random(a, b) {
    return Math.floor(Math.random() * (b-a+1)) + a;
}

var arr = [4,5,3,2,6,9,1,7,10,8];
console.log(findKLargestElement(arr, 3));
