def sum_to(n)
  return nil if n.negative?
  return 0 if n == 0
  return 1 if n == 1

  sum_to(n - 1) + n
end
# Test Cases
p sum_to(5)  == 15
p sum_to(1)  == 1
p sum_to(9)  == 45
p sum_to(-8).nil?

def add_numbers(nums)
  return nil if nums.empty?
  return nums[0] if nums.length == 1

  nums[0] + add_numbers(nums [1..])
end

# Test Cases
p add_numbers([1, 2, 3, 4]) == 10
p add_numbers([3]) == 3
p add_numbers([-80, 34, 7]) == -39
p add_numbers([]).nil?

def factorial(n)
  return 1 if n == 1

  n * factorial(n - 1)
end

def gamma_fnc(n)
  return nil if n.zero?
  return 1 if n == 1

  factorial(n - 1)
end

# Test Cases
p gamma_fnc(0).nil?
p gamma_fnc(1)  == 1
p gamma_fnc(4)  == 6
p gamma_fnc(8)  == 5040

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?

  flavors[0] == favorite || ice_cream_shop(flavors[1..], favorite)
end

# Test Cases
p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon') == false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea') == true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'],
                 'pistachio') == false
p ice_cream_shop(['moose tracks'], 'moose tracks') == true
p ice_cream_shop([], 'honey lavender') == false

def reverse(str)
  return str if str.length <= 1
  reverse(str[1..]) + str[0]
end

# Test Cases
p reverse("house") == "esuoh"
p reverse("dog") == "god"
p reverse("atom") == "mota"
p reverse("q") == "q"
p reverse("id") == "di"
p reverse("") == ""
