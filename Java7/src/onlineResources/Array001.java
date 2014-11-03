package onlineResources;

import java.util.*;

/**
 * Print all elements in sorted order from row and column wise sorted matrix
 * Given an nxn matrix, where every row and column is sorted in non-decreasing order (to-down
 * and left-right).
 * Print all
 * elements of matrix in sorted order
 * http://www.geeksforgeeks.org/print-elements-sorted-order-row-column-wise-sorted-matrix/
 * @author kiennguyen
 *
 */
public class Array001 {

	public static void main(String[] args) {
		int[][] matrix = {{10,20,30,40},
				{15,25,35,45},
				{27,29,37,48},
				{32,33,39,50}
		};
		System.out.println(sortedOrder(matrix).toString());
	}
	
	/*
	 * Consider a matrix a an array of rows where each row is a sorted array
	 * We can sort k sorted arrays in O(Nlogk) time where N is total number of elements in
	 * k arrays.
	 * In this problem, we have n arrays and n^2 elements => O(n2logn)
	 */
	public static ArrayList<Integer> sortedOrder(int[][] matrix) {
		if (matrix.length == 0) {
			return null;
		}
		ArrayList<Integer> res = new ArrayList<>();
		PriorityQueue<Pair<Integer>> minHeap = new PriorityQueue<>(1, new Comparator<Pair<Integer>>() {
			@Override
			public int compare(Pair<Integer> o1, Pair<Integer> o2) {
				if (o1.getFirst() != o2.getFirst()) {
					return o1.getFirst().compareTo(o2.getFirst());
				} else {
					return o1.getSecond().compareTo(o2.getSecond());
				}
			}
			
		});
		int[] currentIndexAt = new int[matrix.length];
		for (int i=0; i<matrix.length; i++) {
			minHeap.add(new Pair<Integer>(matrix[i][0], i));
			currentIndexAt[i] = 1;
		}
		
		while (!minHeap.isEmpty()) {
			Pair<Integer> top = minHeap.poll();
			res.add(top.getFirst());
			int fromArray = top.getSecond();
			if (currentIndexAt[fromArray] < matrix.length) {
				minHeap.add(new Pair<Integer>(matrix[fromArray][currentIndexAt[fromArray]],
						fromArray));
				currentIndexAt[fromArray]++;
			}
		}
		
		return res;
	}
	
	private static class Pair<T> {
		private T first, second;
		public Pair(T first, T second) {
			this.first = first;
			this.second = second;
		}
		
		public T getFirst() {
			return this.first;
		}
		
		public T getSecond() {
			return this.second;
		}
	}
}
