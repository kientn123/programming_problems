/*
Write a function that takes as input a set of words and prints groups of anagrams for
those words
*/
function groupsAnagrams(arr) {
    if (arr.length == 0) {
        return;
    }
    var hash = {};
    for (var i=0; i<arr.length; i++) {
        var s = arr[i].split("").sort().join("");
        if (hash[s] == undefined) {
            hash[s] = [];
        }
        hash[s].push(arr[i]);
    }
    for (s in hash) {
        if (hash[s].length > 1) {
            console.log(hash[s]);
        }
    }
}
var arr = ["abc", "cba", "abd", "dab", "bac", "abe"];
groupsAnagrams(arr);
