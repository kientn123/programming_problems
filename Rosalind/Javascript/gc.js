/*
Computing GC content
http://rosalind.info/problems/gc/
*/

function gcContent(s) {
  var count, i;
  count = 0;
  for (i=0; i<s.length; i++) {
    if (s.charAt(i) == 'G' || s.charAt(i) == 'C') {
      count += 1;
    }
  }
  return (count * 100 / s.length).toFixed(6);
}

//console.log(gcContent('CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGACTGGGAACCTGCGGGCAGTAGGTGGAAT'));

var file = process.argv[2];
var fs = require('fs');
fs.readFile(file, {encoding: 'utf-8'}, function(err, data) {
  if (!err) {
    var lines = data.split('\n');
    var i = 0, hash = {}, current = "";
    while (i < lines.length) {
      if (lines[i].charAt(0) == '>') {
        current = lines[i].substr(1);
        hash[current] = '';
      } else {
        hash[current] += lines[i];
      }
      i += 1;
    }
    var name, item, highest = 0;
    for (item in hash) {
      if (gcContent(hash[item]) > highest) {
        highest = gcContent(hash[item]);
        name = item;
      }
    }
    console.log(name + '\n' + highest);
  } else {
    console.log('error');
  }
});
