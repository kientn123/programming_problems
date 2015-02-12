# Design an algorithm that takes as input two teams and the heights of the players in the teams and checks
# if it is possible to place players to take the photo subject to the placement constraint
# Constraint: A team photo consists of a front row and back row of players. A player in the back row must be
# taller than the player in front of him. All players in a row ust be from the same team.
def can_arrange(a_list_1, a_list_2):
    if len(a_list_1) == 0 or len(a_list_2) == 0 or (len(a_list_1) != len(a_list_2)):
        return False
    a_list_1.sort()
    a_list_2.sort()
    signal = a_list_1[0] - a_list_2[0]
    if signal == 0:
        return False
    for i in xrange(len(a_list_1)):
        if (a_list_1[i] - a_list_2[i]) * signal <= 0:
            return False
    return True

if __name__ == "__main__":
    a1 = [2,8,4,0]
    a2 = [1,6,10,3]
    print can_arrange(a1, a2)
