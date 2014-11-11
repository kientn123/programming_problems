package leetcode;
import java.util.*;
/**
 * https://oj.leetcode.com/problems/permutation-sequence/
 * @author kiennguyen
 *
 */
public class PermutationSequence {

	public static void main(String[] args) {
		System.out.println(getPermutation(3, 3));
	}
	
	public static String getPermutation(int n, int k) {
        ArrayList<Integer> res = new ArrayList<Integer>();
        for (int i=0; i<n; i++) res.add(i+1);
        for (int i=0; i<k-1; i++) nextPermutation(res);
        StringBuffer sb = new StringBuffer();
        for (int i=0; i<n; i++) sb.append(res.get(i));
        return sb.toString();
    }
    
    public static void nextPermutation(ArrayList<Integer> arr) {
        int index=arr.size()-2;
        while (index>=0) {
            if (arr.get(index)<arr.get(index+1)) break;
            index--;
        }
        if (index<0) return;
        int toSwap=index+1;
        while (toSwap<=arr.size()-1) {
            if (arr.get(toSwap)>arr.get(index)) toSwap++;
            else break;
        }
        swap(arr, index, toSwap-1);
        flip(arr, index+1, arr.size()-1);
//        System.out.println(arr);
    }
    
    public static void swap(ArrayList<Integer> arr, int begin, int end) {
        if (begin!=end) {
            int temp = arr.get(begin);
            arr.set(begin, arr.get(end));
            arr.set(end, temp);
        }
    }
    
    public static void flip(ArrayList<Integer> arr, int begin, int end) {
        for (int i=0; i<=(begin-end)/2; i++) {
            swap(arr, begin+i, end-i);
        }
    }
}
