// Write a function that takes an array A of length n and an index i into A,
// and rearranges the elements such that all elements less than A[i] appear
// first, followed by elements equal to A[i], followed by elements greater
// than A[i]. Your algorithm should have O(1) space complexity and O(n) time
// complexity.

fn main() {
    let mut arr: Vec<int> = vec![5i, 2i, 3i, 4i, 1i];
    national_flag(&mut arr, 2);
    println!("{}", arr);
}

fn national_flag(arr: &mut Vec<int>, i: uint) {
    if arr.len() <= 1 { return; }
    let target: int = arr[i];
    swap(arr, 0, i);
    let mut cur: uint = 1;
    let mut runner: uint = 1;
    while runner < arr.len() {
        if arr[runner] < target {
            swap(arr, cur, runner);
            cur += 1;
        }
        runner += 1;
    }
    swap(arr, 0, cur-1);
}

fn swap(arr: &mut Vec<int>, i: uint, j: uint) {
    if i != j {
        let tmp: int = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}
