=begin
https://www.hackerrank.com/challenges/icecream-parlor
=end

def binary_search(arr, n)
  left = 0; right = arr.length - 1
  while true
    if left == right
      return left if arr[left] == n
      return -1
    end
    mid = (right + left)/2
    if n == arr[mid]
      return mid
    else
      if arr[mid] < n
        left = mid + 1
      else
        right = mid - 1
      end
    end
  end
end

a = [1, 3, 6, 9, 10, 14]
puts binary_search(a, 8)
