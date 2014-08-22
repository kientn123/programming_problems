/*
https://www.hackerrank.com/challenges/handshake
*/

import java.io.*;
import java.util.*;

public class HandShake {
  public static void main(String[] args) throws IOException {
    BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
    int t = Integer.parseInt(reader.readLine().trim());
    for (int i=0; i<t; i++) {
      int people = Integer.parseInt(reader.readLine().trim());
      System.out.println(handShakes(people));
    }
  }

  private static int handShakes(int people) {
    return people * (people - 1) / 2;
  }
}
