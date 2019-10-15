require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/restricted_array'
require_relative '../lib/using_restricted_array'

describe "restricted array" do
  it "length method" do
    # Arrange
    size = 5
    my_integer_array = RestrictedArray.new(size)

    # Act
    my_integer_array_length = length(my_integer_array)

    # Assert
    expect(my_integer_array_length).must_equal size
  end

  it "linear search method - value exists in the middle, in the array" do
    # Arrange
    size = 9
    my_integer_array = RestrictedArray.new(size)
    value_to_find = 220
    middle_index = size / 2
    my_integer_array[middle_index] = value_to_find

    # Act
    found = search(my_integer_array, size, value_to_find)

    # Assert
    expect(found).must_equal true
  end

  it "linear search method - value exists at the last index in the array" do
    # Arrange
    size = 7
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i
    end
    value_to_find = 220
    my_integer_array[size - 1] = value_to_find

    # Act
    found = search(my_integer_array, size, value_to_find)

    # Assert
    expect(found).must_equal true
  end

  it "linear search method - value does not exist in array" do
    # Arrange
    size = 4
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i
    end
    value_to_find = 220

    # Act
    found = search(my_integer_array, size, value_to_find)

    # Assert
    expect(found).must_equal false
  end

  it "find largest in unsorted array" do
    # Arrange
    size = 17
    my_integer_array = RestrictedArray.new(size)

    # Act
    largest = find_largest(my_integer_array, size)

    sort(my_integer_array, size) # Arrange (for assert)

    # Assert
    expect(largest).must_equal my_integer_array[size - 1]
  end

  it "find largest in sorted array" do
    # Arrange
    size = 14
    my_integer_array = RestrictedArray.new(size)
    sort(my_integer_array, size)

    # Act
    largest = find_largest(my_integer_array, size)

    # Assert
    expect(largest).must_equal my_integer_array[size - 1]
  end

  it "find smallest in unsorted array" do
    # Arrange
    size = 12
    my_integer_array = RestrictedArray.new(size)

    # Act
    smallest = find_smallest(my_integer_array, size)

    sort(my_integer_array, size) # Arrange (for assert)

    # Assert
    expect(smallest).must_equal my_integer_array[0]
  end

  it "find smallest in sorted array" do
    # Arrange
    size = 11
    my_integer_array = RestrictedArray.new(size)
    sort(my_integer_array, size)

    # Act
    smallest = find_smallest(my_integer_array, size)

    # Assert
    expect(smallest).must_equal my_integer_array[0]
  end

  it "reverse array - odd count" do
    # Arrange
    size = 9
    my_integer_array = RestrictedArray.new(size)
    test_array = Array.new(size)
    size.times do |i|
      test_array[i] = my_integer_array[i]
    end
    test_array.reverse!

    # Act
    reverse(my_integer_array, size)

    # Assert
    expect(length(my_integer_array)).must_equal size
    size.times do |i|
      expect(my_integer_array[i]).must_equal test_array[i]
    end
  end

  it "reverse array - even count" do
    # Arrange
    size = 8
    my_integer_array = RestrictedArray.new(size)
    test_array = Array.new(size)
    size.times do |i|
      test_array[i] = my_integer_array[i]
    end
    test_array.reverse!

    # Act
    reverse(my_integer_array, size)

    # Assert
    expect(length(my_integer_array)).must_equal size
    size.times do |i|
      expect(my_integer_array[i]).must_equal test_array[i]
    end
  end

  it "find largest in sorted, reversed array" do
    # Arrange
    size = 14
    my_integer_array = RestrictedArray.new(size)
    sort(my_integer_array, size)
    reverse(my_integer_array, size)

    # Act
    largest = find_largest(my_integer_array, size)

    # Assert
    expect(largest).must_equal my_integer_array[0]
  end

  it "find smallest in sorted, reversed array" do
    # Arrange
    size = 11
    my_integer_array = RestrictedArray.new(size)
    sort(my_integer_array, size)
    reverse(my_integer_array, size)

    # Act
    smallest = find_smallest(my_integer_array, size)

    # Assert
    expect(smallest).must_equal my_integer_array[size - 1]
  end

  it "linear search method on sorted, reversed array - value exists in the array" do
    # Arrange
    size = 13
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i * 10
    end
    value_to_find = 0
    reverse(my_integer_array, size)

    # Act
    found = search(my_integer_array, size, value_to_find)

    # Assert
    expect(found).must_equal true
  end

  it "binary search method - value exists at the last index in the array" do
    # Arrange
    size = 13
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i * 10
    end
    value_to_find = (size - 1) * 10

    # Act
    found = binary_search(my_integer_array, size, value_to_find)

    # Assert
    expect(found).must_equal true
  end

  it "binary search method - value exists at the middle index in the array" do
    # Arrange
    size = 15
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i * 10
    end
    value_to_find = (size/2) * 10

    # Act
    found = binary_search(my_integer_array, size, value_to_find)

    # Assert
    expect(found).must_equal true
  end

  it "binary search method - value does not exist in the array" do
    # Arrange
    size = 15
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i * 10
    end
    value_to_find = size * 10

    # Act
    found = binary_search(my_integer_array, size, value_to_find)

    # Assert
    expect(found).must_equal false
  end
end
