/*
Find the min and max simultaneously
Find the min and max elements from an array of n>0 elements using no more than
Math.ceil(3n/2)-2 comparisons
*/
function minMaxOf(a, b) {
    if (a < b) {
        return {min: a, max: b};
    } else {
        return {min: b, max: a};
    }
}

function findMinMax(arr) {
    if (arr.length == 0) {
        return;
    } else if (arr.length == 1) {
        return {min: arr[0], max: arr[0]};
    }
    var res = {min: arr[0], max: arr[1]};
    for (var i=2; i+1<arr.length; i+=2) {
        var values = minMaxOf(arr[i], arr[i+1]);
        res = {
            min: minMaxOf(res.min, values.min).min,
            max: minMaxOf(res.max, values.max).max
        };
    }
    if (i==arr.length-1) {
        res = {
            min: minMaxOf(res.min, arr[i]).min,
            max: minMaxOf(res.max, arr[i]).max
        };
    }
    return res;
}
var arr = [2,3,4,5,1,8,6,7,9,10,13,12,14,15]
var arr1 = [2,3,4,5,1,8,6,7,9,10,13,12,14]
console.log(findMinMax(arr));
console.log(findMinMax(arr1));
