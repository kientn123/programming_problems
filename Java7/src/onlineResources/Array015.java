package onlineResources;

import java.util.Comparator;
import java.util.TreeSet;

/**
 * Print the elements of an array in the decreasing frequency if 2 numbers have same frequency, then
 * print the one which came 1st
 * @author kiennguyen
 *
 */
public class Array015 {

	public static void main(String[] args) {

	}
	
	public static void frequencies(int[] arr) {
		TreeSet<Node<Integer, Integer, Integer>> tree = 
				new TreeSet<>(new Comparator<Node<Integer, Integer, Integer>>() {

			@Override
			public int compare(Node o1, Node o2) {
				if ((int)o1.t > (int)o2.t) { 
					return 1;
				} else if ((int)o1.t < (int)o2.t) {
					return -1;
				} else {
					return (int)o1.u > (int)o2.u ? -1 : 1;
				}
			}
			
		});
		
		for (int i=0; i<arr.length; i++) {
			
		}
	}
	
	private static class Node<T, U, V> {
		private T t;
		private U u;
		private V v;
		
		public Node(T t, U u, V v) {
			this.t = t; this.u = u; this.v = v;
		}
		
		public T getT() { return t; }
	}

}
