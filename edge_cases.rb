class A
  @@value = 1 # A class variable
  def self.value # An accessor method for it
    @@value
  end
end

print A.value # Display value of A's class variable

class B < A
  @@value = 2 # Subclass alters shared class variable
end

print A.value # Superclass sees altered value

class C < A
  @@value = 3 # Another alters shared variable again
end

print A.value # 1st subclass sees value from 2nd subclass

class MyClass
  @@name = "Jose"

  def name
    @@name
  end

  def age
    @@age
  end
end

class YourClass < MyClass
  @@age = 24
end

class HisClass < MyClass
  @@name = "Vahid"
  @@age = 21
end

test = MyClass.new
p test.name # @@name initalized in MyClass but is reassigned by HisClass, which MyClass sees the change made
p test.age  # NameError MyClass has not initialized the @@age variable

test = YourClass.new
p test.name # @@name initalized in MyClass but is reassigned by HisClass, which YourClass sees the change made
p test.age  # NameError MyClass has not initialized the @@age variable

test = HisClass.new
p test.name # @@name initalized in MyClass but is reassigned by HisClass
p test.age  # NameError since MyClass doesn't initialize the @@age variable, scoped at the class level

# all classes and subclasses have only 1 copy of a given class variable. Subclasses can make a change to it