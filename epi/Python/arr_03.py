# Multiply two big integers
# Write a function that takes two strings representing integers, an returns an
# integer representing their product
def multiply(a, b):
    is_negative = False
    if a[0] == '-':
        is_negative = not is_negative
        reversed_a = a[-1:0:-1]
    else:
        reversed_a = a[::-1]
    if b[0] == '-':
        is_negative = not is_negative
        reversed_b = b[-1:0:-1]
    else:
        reversed_b = b[::-1]
    print reversed_a, reversed_b
    product = [0]*(len(a)+len(b))
    for i in xrange(len(reversed_a)):
        for j in xrange(len(reversed_b)):
            product[i+j] += (ord(reversed_a[i]) - ord('0')) * \
                (ord(reversed_b[j]) - ord('0'))
            product[i+j+1] += product[i+j]/10
            product[i+j] %= 10
    res = ''.join(map(str, product))
    print type(res)
    if is_negative:
        res += '-'
    #print type(is_negative)
    #res += '-'
    print res
    return res[::-1]

if __name__ == '__main__':
    a = '193707721'
    b = '-761838257287'
    print multiply(a, b)
