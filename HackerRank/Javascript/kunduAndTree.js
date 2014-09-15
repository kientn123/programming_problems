function dfs(graph) {
  var componentNum = 0;
  var components = {};
  function search(s) {
    var i;
    if (components[s] == undefined) {
      components[s] = componentNum;
      //console.log('components[' + s + '] = ' + componentNum);
      //console.log('graph[' + s + '] = ' + graph[s])
    }
    for (i=0; i<graph[s].length; i++) {
      if (components[graph[s][i]] == undefined) {
        search(graph[s][i]);
      }
    }
  };
  for (var aNode in graph) {
    if (components[aNode] == undefined) {
      search(aNode);
      componentNum += 1;
    }
  }
  return components;
}

function calculateSum(components) {
  var mod = 1000000007;
  var connectedComponents = {}
  for (var nod in components) {
    var component = components[nod];
    if (connectedComponents[component] == undefined) {
      connectedComponents[component] = 0;
    }
    connectedComponents[component] += 1;
  }
  var sum = 0, i, node;
  for (node in connectedComponents) {
    sum += connectedComponents[node];
  }
  //console.log(connectedComponents);
  var ans = Math.pow(sum, 3) % mod;
  //console.log(ans)
  for (node in connectedComponents) {
    ans = (ans - Math.pow(connectedComponents[node], 3)) % mod;

    if (ans < 0) ans += mod;
    //console.log('answer for ' + node + ": " + ans);
    ans = (ans - 3 * Math.pow(connectedComponents[node], 2)
        * (sum - connectedComponents[node])) % mod;
    if (ans < 0) ans += mod;
    //console.log('answer for ' + node + ": " + ans);
  }
  return ans / 6;
}

var graph = {
  1: [2], 2:[1], 3:[], 4:[5], 5:[4]
}
console.log(graph);
console.log(calculateSum(dfs(graph)));
