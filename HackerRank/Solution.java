/*
https://www.hackerrank.com/challenges/minimum-draws/submissions/code/1988594
*/

import java.util.*;
import java.io.*;

public class Solution {
  public static void main (String[] args) throws IOException {
    BufferedReader reader = new BufferedReader(
      new InputStreamReader(System.in));
    int t = Integer.parseInt(reader.readLine().trim());
    for (int i=0; i<t; i++) {
      int pairs = Integer.parseInt
        (reader.readLine().trim());
      System.out.println(minDraws(pairs));
    }
  }

  private static int minDraws(int pairs) {
    return pairs + 1;
  }
}
