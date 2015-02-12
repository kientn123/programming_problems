# Identify positions attacked by rooks
def identify(lst):
    # Go over the map to find the first existence of rook
    marked_i = 0
    marked_j = 0
    for i in xrange(len(lst)):
        found = 0
        for j in xrange(len(lst)):
            if lst[i][j] == 0:
                marked_i = i
                marked_j = j
                found = 1
                break
        if found:
            break

    print "coordinates: " + str(marked_i) + ", " + str(marked_j)
    # Use the row marked_i and column marked_j to store the rows and columns
    # that contain 0
    for i in xrange(len(lst)):
        for j in xrange(len(lst)):
            if lst[i][j] == 0:
                lst[marked_i][j] = 0
                lst[i][marked_j] = 0
    for i in xrange(len(lst)):
        print lst[i]
    print ['*']*len(lst)
    # Go over the map and fill in 0 for a place that can be attacked
    for i in xrange(len(lst)):
        for j in xrange(len(lst)):
            if i - marked_i and j - marked_j:
                if lst[i][marked_j] == 0 or lst[marked_i][j] == 0:
                    lst[i][j] = 0

    for i in xrange(len(lst)):
        for j in xrange(len(lst)):
            lst[i][marked_j] = 0
            lst[marked_i][j] = 0

if __name__ == '__main__':
    lst = [[1,0,1,1,1,1,1,1],
         [1,1,1,1,1,1,1,1],
         [1,1,1,1,1,1,1,1],
         [1,1,1,1,1,0,1,1],
         [1,1,1,0,1,1,1,1],
         [1,1,1,1,1,1,1,1],
         [0,1,1,1,1,0,1,1],
         [1,1,1,1,1,1,1,1]]
    identify(lst)
    for i in xrange(len(lst)):
        print lst[i]
