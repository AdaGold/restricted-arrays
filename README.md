# Restricted-Array
Assignment: Develop common methods on data structure using a restricted array.
restricted_array.rb provides the RestrictedArray class to be used.
RestrictedArray allows you to:
1. Create an integer array of default size (i.e. 20) or of the size provided in the parameter.
   All integer values are randomly initialized in the range of 1-221.
2. Get the value at a given index using `array[index]` format.
3. Update the value at a given index using `array[index]` format.
None of the other methods available in the Ruby Array class are available in the RestrictedArray class.

## Exercise
Implement the methods in using_restricted_array.rb. Methods to implement are:
- *length* - which calculates the length of the integer array and returns it.
             Note: The restricted_array is terminated by `nil` i.e. `array[length] = nil`
- *print_array* - which prints each integer value separated by space on the same line
- *reverse* - which reverses the values in the array in place
- *search* - which looks for a given integer value in the array. Returns true if found, false otherwise.
             Note: do not assume that the array is sorted.
- *binary_search* - which looks for a given integer value in the array. Returns true if found, false otherwise.
             Note: Assume that the array is sorted in ascending order.
- *find_largest* - Finds and returns the largest value element in the integer array.
- *find_smallest* - Finds and returns the smallest value element in the integer array.

For each method, add a comment above it to explain the time complexity and the space complexity of each method.
