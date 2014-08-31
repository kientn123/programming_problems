#In DNA strings, symbols 'A' and 'T' are complements of each other, as are 
#'C' and 'G'.

#The reverse complement of a DNA string s is the string sc formed by 
#reversing the symbols of s, then taking the complement of each symbol 
#(e.g., the reverse complement of "GTCA" is "TGAC").

#Given: A DNA string s of length at most 1000 bp.

#Return: The reverse complement sc of s.

#Sample dataset:
#AAAACCCGGT

#Sample output:
#ACCGGGTTTT

import sys
def convert(char):
  	mapping = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
  	return mapping[char]

def reversecompliment(dna):
  	return ''.join(reversed(map(convert, dna)))

if __name__ == '__main__':
  	if len(sys.argv) == 2:
    	f = open(sys.argv[1], 'r')
    	print reversecompliment(f.readline().strip())
