# Implement an algorithm to rotate A, an nxn 2D array, by 90 degree clockwise
# Assume that n = 2^k for some positive k, what is the time complexity of the
# algorithm

def rotate(mat):
    num_levels = len(mat)/2
    for level in xrange(num_levels):
        end = len(mat)-1-level
        for i in xrange(end-level):
            temp = mat[end-i][level]
            mat[end-i][level] = mat[end][end-i]
            mat[end][end-i] = mat[level+i][end]
            mat[level+i][end] = mat[level][level+i]
            mat[level][level+i] = temp

if __name__ == "__main__":
    mat = [[1,2,3,4],
           [5,6,7,8],
           [9,10,11,12],
           [13,14,15,16]]
    rotate(mat)
    for i in xrange(len(mat)):
        print mat[i]
