/*
Find k largest elements
Design an algorithm for computing the k-th largest element in a sequence of elements. It
should run in O(n) expected time where n is the length of teh sequence, which is not known
in advance. The value k is known in advance. Your algorithm should print the k-th largest
element after the sequence has ended. It should use O(k) additional storage.
*/
function findKLargestElements(arr, k) {
    if (arr.length == 0) {
        return;
    }
    var res = [];
    for (var i=0; i<k; i++) {
        res.push(arr[i]);
    }
    while (i < arr.length) {
        var count = 0;
        while (arr[i] != undefined && count < k) {
            res.push(arr[i]);
            i++;
            count++;
        }
        res = resize(res, k);
    }
    return res;
}

function resize(arr, k) {
    partition(arr, k);
    return arr.slice(0,k);
}

function partition(arr, k) {
    doPartition(arr, k, 0, arr.length-1);
}

function doPartition(arr, k, start, end) {
    var randomIndex = random(start, end);
    swap(arr, start, randomIndex);
    var target = arr[start];
    var runner = start+1;
    var curr = start+1;
    while (runner <= end) {
        if (arr[runner] > target) {
            swap(arr, curr, runner);
            curr++;
        }
        runner++;
    }
    swap(arr, start, curr-1);
    if (curr-1 == k) {
        return;
    } else if (curr-1 > k) {
        doPartition(arr, k, start, curr-2);
    } else {
        doPartition(arr, k, curr, end);
    }
}

function random(a, b) {
    return Math.floor(Math.random() * (b-a+1)) + a;
}

function swap(arr, i, j) {
    var temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

var arr = [5,7,4,1,3,2,8,6,9,0];
console.log(findKLargestElements(arr, 2));
