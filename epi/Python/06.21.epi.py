# The Sudoku checker problem
# Check whether 9x9 2D array representing a partially completed Sudoku is valid
# Specifically, check that no row, column, and 3x3 2D subarray contains duplicates
# A 0-value in the 2D array indicates that entry is blank
def is_valid(sudoku):
    for i in xrange(len(sudoku)):
        if not isOK(i, i, 0, 8, sudoku):
            return False
        if not isOK(0,8,i,i,sudoku):
            return False
    for i in xrange(3):
        for j in xrange(3):
            if not isOK(3*i, 3*i+2, 3*j, 3*j, sudoku):
                return False
    return True
def isOK(row_begin, row_end, col_begin, col_end, mat):
    hashmap = {}
    for i in xrange(row_begin, row_end+1):
        for j in xrange(col_begin, col_end+1):
            if mat[i][j] != 0 and mat[i][j] in hashmap:
                print "failed at " + str(i) + " and " + str(j)
                return False
            hashmap[mat[i][j]] = 1
    return True

if __name__ == "__main__":
    sudoku = [[5,3,0,0,7,0,0,0,0],
              [6,0,0,1,9,5,0,0,0],
              [0,9,8,0,0,0,0,6,0],
              [8,0,0,0,6,0,0,0,3],
              [4,0,0,8,0,3,0,0,1],
              [7,0,0,0,2,0,0,0,6],
              [0,6,0,0,0,0,2,8,0],
              [0,0,0,4,1,9,0,0,5],
              [0,0,0,0,8,0,0,7,9]]
    print is_valid(sudoku)
