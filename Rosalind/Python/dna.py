#A string is simply an ordered collection of symbols selected from some alphabet
#and formed into a word; the length of a string is the number of symbols that
#it contains.

#An example of a length 21 DNA string (whose alphabet contains the symbols
#'A', 'C', 'G', and 'T') is "ATGCTTCAGAAAGGTCTTACG."

#Given: A DNA string s of length at most 1000 nt.

#Return: Four integers (separated by spaces) counting the respective
#number of times that the symbols 'A', 'C', 'G', and 'T' occur in s.

#Sample Dataset:
#AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC
#Sample Output:
#20 12 17 21

import sys
def dna_count(dna):
  mapping = { 'A': 0, 'C': 1, 'G': 2, 'T': 3}
  result = [0] * 4
  for char in dna:
    result[mapping[char]] += 1
  return '{0} {1} {2} {3}'.format(str(result[0]), str(result[1]), str(result[2]), str(result[3]))

if __name__ == '__main__':
  if len(sys.argv) == 2:
    f = open(sys.argv[1], 'r')
    dna = f.readline().strip()
    print dna_count(dna)
