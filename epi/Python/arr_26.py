# Itentify the celebrity
# Let F be an nxn Boolean 2D list representing the "knows" relation for
# n people - F[a][b] is true iff a knows b. There is a celebrity who everybody
# knows him, but he doesn't know anyone. Design an O(n) algorithm to find
# that celebrity
def find_celebrity(f):
    i = 0
    j = 1
    while j < len(f):
        if f[i][j]:
            i = j
            j += 1
        else:
            j += 1
    # Assume that there is exactly one celebrity
    return i

if __name__ == '__main__':
    f = [[1, 0, 0, 1, 0],
         [0, 0, 1, 1, 0],
         [1, 0, 0, 1, 0],
         [0, 0, 0, 1, 0],
         [1, 0, 0, 1, 0]]
    print find_celebrity(f)
