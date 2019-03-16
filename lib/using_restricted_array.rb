require_relative "restricted_array.rb"

# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity:linear or O(n), n is the value_to_find of items in the array or the length of the input array
# Space complexity: O(1)
def length(array)
  i = 0
  until array[i] == nil
    i += 1
  end
  return i
end

# Prints each integer values in the array
# Time complexity: linear or O(n)
# Space complexity: O(1)
def print_array(array)
  len = length(array)
  i = 0
  while i < len
    print array[i]
    print " "
    i += 1
  end
  puts
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: linear or O(n)
# Space complexity: O(1)
def search(array, length, value_to_find)
  length.times do |i|
    if array[i] == value_to_find
      return true
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: linear or O(n)
# Space complexity: O(1)
def find_largest(array, length)
  largest_number = array[0]
  length.times do |i|
    if array[i] > largest_number
      largest_number = array[i]
    end
  end
  return largest_number
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: linear or O(n)
# Space complexity: O(1)
def find_smallest(array, length)
  smallest_number = array[0]
  length.times do |i|
    if smallest_number > array[i]
      smallest_number = array[i]
    end
  end
  return smallest_number
end

# Reverses the values in the integer array in place
# Time complexity: O(n)
# Space complexity: O(1)
def reverse(array, length)
  n = 1
  (length / 2).times do |i|
    temp = 0
    temp = array[i]
    array[i] = array[length - n]
    array[length - n] = temp
    n += 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n), logarithmic
# Space complexity: O(1)
def binary_search(array, length, value_to_find)
  if length == 0
    return false
  end
  low_point = 0
  high_point = length - 1
  while low_point < high_point
    mid = (low_point + high_point) / 2
    if array[mid.floor] == value_to_find
      return true
    elsif array[mid.floor] > value_to_find
      high_point = mid - 1
    elsif low_point = mid + 1
    end
  end
  if low_point < high_point
    return false
  end
  if array[low_point] == value_to_find
    return true
  else
    return false
  end
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the value_to_find ofarray in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total value_to_find of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - narray
    min_index = index # assume index is where the next minimally value is
    temp_index = index + 1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1array
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end

## --- END OF METHODS ---
