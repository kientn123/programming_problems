/*
Given a big tree (millions nodes) and a small tree. Determine if the big tree
contains the small one
*/
function contain(t1, t2) {
  if (t2 == null || t2 == undefined) {
    return true;
  } else if (t1 == null || t1 == undefined) {
    return false;
  } else {
    if (t1.data == t2.data) {
      return match(t1, t2);
    } else {
      return contain(t1.left, t2) || contain(t1.right, t2);
    }
  }
}

function match(t1, t2) {
  if (t2 == null || t2 == undefined) {
    return true;
  } else if (t1 == null || t1 == undefined) {
    return false;
  } else if (t1.data == t2.data) {
    return match(t1.left, t2.left) && match(t1.right, t2.right);
  } else {
    return false;
  }
}

function Node(data) {
  this.data = data;
}

var one, two, three, four, five, six, seven, eight, nine, ten,
    afour, aeight, anine, aten;
one = new Node(1); two = new Node(2); three = new Node(3);
four = new Node(4); five = new Node(5); six = new Node(6);
seven = new Node(7); eight = new Node(8); nine = new Node(9);
ten = new Node(10);

one.left = two; one.right = three; two.left = four; two.right = five;
three.left = six; three.right = seven;
four.left = eight; four.right = nine; nine.right = ten;

afour = new Node(4); aeight = new Node(8); anine = new Node(9);
aten = new Node(10);
afour.left = aeight; afour.right = anine; anine.right = new Node(11);
console.log(contain(one, afour));
