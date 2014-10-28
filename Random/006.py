# Lucky numbers are subset of integers.
# Take the set of integers:
# 1,2,3,4,5,6,7,8,9,10,...
# First, delete every second number, we get following reduced set
# 1,3,5,7,9
# Now, delete every third number, we get
# 1,3,7,9
# Given a number, determine if it is lucky?
# Nice solution
# http://www.geeksforgeeks.org/lucky-numbers/
def is_lucky(n):
    counter = 2
    position = n
    while position >= counter:
        if position % counter == 0:
            return False
        position -= position/counter
        counter += 1
    return True

if __name__ == "__main__":
    print is_lucky(9)
    print is_lucky(19)
