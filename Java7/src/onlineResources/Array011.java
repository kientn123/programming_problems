package onlineResources;
import java.util.*;

/**
 * Create a matrix with alternating rectangles of X and O
 * http://www.geeksforgeeks.org/create-a-matrix-with-alternating-rectangles-of-0-and-x/
 * @author kiennguyen
 *
 */
public class Array011 {

	public static void main(String[] args) {
		char[][] res = makeMatrix(6, 7);
		for (int i=0; i<res.length; i++)
			System.out.println(Arrays.toString(res[i]));
	}
	
	public static char[][] makeMatrix(int row, int col) {
		if (row<1 || col<1) return null;
		int numLevels = Math.min(row, col)/2;
		char[][] res = new char[row][col];
		char letter = 'X';
		for (int level = 0; level<numLevels; level++) {
			int colBegin = level, colEnd = col-1-level;
			for (int i=0; i<=colEnd-colBegin; i++) {
				res[colBegin][colBegin+i] = letter;
				res[row-1-colBegin][colBegin+i] = letter;
			}
			int rowBegin = level, rowEnd = row-1-level;
			for (int i=0; i<=rowEnd-rowBegin; i++) {
				res[rowBegin+i][rowBegin] = letter;
				res[rowBegin+i][col-1-rowBegin] = letter;
 			}
			letter = letter == 'X' ? 'O' : 'X';
		}
		if (Math.min(row, col) % 2 == 1) {
			if (row > col) {
				for (int i=0; i<row-2*numLevels; i++)
					res[numLevels+i][numLevels] = letter;
			} else {
				for (int i=0; i<col-2*numLevels; i++)
					res[numLevels][numLevels+i] = letter;				
			}
		}
		return res;
	}
}
