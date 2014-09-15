var mod = Math.pow(10, 9) + 7;
function makeVector(k, arr) { // for small cases
  var result, i;
  result = [];
  for (i=0; i<15; i++) {
    make(i, result, k, arr);
  }
  return result;
}

function make(n, result, k, arr) {
  var i;
  if (n == 0) {
    if (arr.indexOf(1) != -1) {
      result[n] = 1;
    } else {
      result[n] = 0;
    }
  } else {
    if (arr.indexOf(n+1) != -1) {
      result[n] = 1;
    } else {
      result[n] = 0;
    }
    for (i=0; i<k; i++) {
      if (n-arr[i] >= 0) {
        result[n] = (result[n] % mod + result[n - arr[i]] % mod) % mod;
      }
    }
  }
}

function makeMatrix(k, arr) {
  var result, i, j;
  result = [];
  result[0] = [];
  for (i=0; i<15; i++) {
    if (arr.indexOf(i+1) != -1) {
      result[0][i] = 1;
    } else {
      result[0][i] = 0;
    }
  }
  for (i=1; i<15; i++) {
    result[i] = [];
    for (j=0; j<15; j++) {
      if (i == j+1) {
        result[i][j] = 1; 
      } else {
        result[i][j] = 0;
      }
    }
  }
  return result;
}

function matrixMultipliesMatrix(m1, m2) {
  if (m1[0].length != m2.length) {return 'invalid input';}
  var result = [], i, j, m;
  for (i=0; i<m1.length; i++) {
    result[i] = [];
  }
  for (i=0; i<m1.length; i++) {
    for (j=0; j<m2[0].length; j++) {
      result[i][j] = 0;
      for (m=0; m<m1[0].length; m++) {
        result[i][j] = (result[i][j] + (m1[i][m] * m2[m][j]) % mod) % mod
      }
    }
  }
  return result;
}

function matrixMultipliesVector(m, v) {
  if (m[0].length != v.length) {
    return 'invalid input';
  }
  var result = [], i, k;
  for (i=0; i<m.length; i++) {
    result[i] = 0;
    for (k=0; k<v.length; k++) {
      result[i] = (result[i] + (m[i][k] * v[k]) % mod) % mod;
    }
  }
  return result;
}

function powerMatrix(m, n) {
  if (n==1) {
    return m;
  }
  var result, f;
  f = powerMatrix(m, Math.floor(n/2));
  result = matrixMultipliesMatrix(f, f);
  if (n%2 == 1) {
    result = matrixMultipliesMatrix(result, m);
  } 
  return result;
}

function solve(n, k, arr) {
  var matrix, vector, multiMatrix, resultVector;
  matrix = makeMatrix(k, arr);
  //console.log(matrix);
  vector = makeVector(k, arr);
  vector.reverse();
  console.log(vector);
  if (n <= 0) {
    return 0;
  } else if (n <= 15) {
    return (vector[15-n] * 2) % mod;
  } else {
    multiMatrix = powerMatrix(matrix, n-15);
    //console.log(multiMatrix);
    resultVector = matrixMultipliesVector(multiMatrix, vector);
    //console.log(resultVector);
    return (resultVector[0] * 2) % mod;
  }
}

var m1 = [[1,1],[1,0]];
//console.log(matrixMultipliesMatrix(m1, m1));
//console.log(matrixMultipliesVector(m1, [5,3]));
//console.log(matrixMultipliesMatrix([[2,1],[1,1]], m1)); 
//console.log(powerMatrix(m1, 5));
console.log(solve(100, 4, [1, 2, 3, 4]));