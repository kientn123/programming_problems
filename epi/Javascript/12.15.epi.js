/*
Find the duplicate and the missing elements
Let A be an array of n integers in Zn, with exactly one element t appearing twice. This
implies that exactly one element m in Zn is missing from A. How would you comput t and
m in O(n) time and O(1) space?
*/
function findMissingAndDuplicate(arr) {
    var xorAll = 0;
    for (var i=0; i<arr.length; i++) {
        xorAll ^= (i ^ arr[i]);
    }
    console.log(xorAll);
    // After the for loop, xorAll is m^t
    var diff = xorAll & (~ (xorAll-1));
    console.log(diff);
    var tORm = 0;
    for (i=0; i<arr.length; i++) {
        if (diff & i) {
            tORm ^= i;
        }
        if (diff & arr[i]) {
            tORm ^= arr[i];
        }
    }
    console.log(tORm);
    for (i=0; i<arr.length; i++) {
        if ((tORm ^ arr[i]) == 0) {
            console.log("that is: " + arr[i]);
            console.log("Found duplicate first");
            return {
                duplicate: tORm, missing: xorAll ^ tORm
            };
        }
    }
    console.log("Found missing first");
    return {
        duplicate: xorAll ^ tORm, missing: tORm
    };
}

var arr = [4,2,6,8,1,5,9,5,7,0];
console.log(findMissingAndDuplicate(arr));
