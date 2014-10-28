/*
Find height of binary tree represented by Parent array
A given array represents a tree in such a way that the array value gives the
parent node of that particular index. The value of the root index would be -1.
Find the height of the tree
Input: parent[] = [1,5,5,2,2,-1,3]
Ouput: 4
*/
function solve(parent) {
  // create a depth array represent the depth at every node
  // root at depth 1
  var depth = new Array(parent.length);
  var i;

  function findDepth(i) {
    if (parent[i] == -1) {
      if (depth[i] == undefined) {
        depth[i] = 1;
      }
    } else if (depth[i] == undefined) {
      depth[i] = findDepth(parent[i]) + 1;
    }
    return depth[i];
  }

  function findDepthV2(i) {
    if (depth[i] != undefined) {
      return;
    }
    if (parent[i] == -1) {
      depth[i] = 1;
      return;
    }
    if (depth[parent[i]] == undefined) {
      findDepthV2(parent[i]);
    }
    depth[i] = depth[parent[i]] + 1;
  }

  for (i=0; i<parent.length; i++) {
    if (depth[i] == undefined) {
      findDepthV2(i);
    }
  }

  return { depth: Math.max.apply(null, depth), list: depth };
}

console.log(solve([1,5,5,2,2,-1,3]));
console.log(solve([-1,0,0,1,1,3,5]));
