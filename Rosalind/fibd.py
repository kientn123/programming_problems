'''
Recall the definition of the Fibonacci numbers from “Rabbits and Recurrence Relations”, which followed the recurrence relation Fn=Fn−1+Fn−2 and assumed that each pair of rabbits reaches maturity in one month and produces a single pair of offspring (one male, one female) each subsequent month.

Our aim is to somehow modify this recurrence relation to achieve a dynamic programming solution in the case that all rabbits die out after a fixed number of months. See Figure 4 for a depiction of a rabbit tree in which rabbits live for three months (meaning that they reproduce only twice before dying).

Given: Positive integers n<=100 and m<=20.

Return: The total number of pairs of rabbits that will remain after the n-th month if all rabbits live for m months.

Sample dataset: 6 3
sample output: 4
'''
import sys
def fibd(n, m):
  babies = {1: 1, 2: 0, 3: 1}
  ''' babies[n] = babies[n-2] + babies[n-3] '''
  total = {1: 1, 2: 1, 3: 2}
  
