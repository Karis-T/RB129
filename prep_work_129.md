# RB129 Prep work

### Why do we need Classes and objects?

- As software began to grow in size and complexity, data became more difficult to maintain as even the smallest of changes could create ripples of errors. This is largely due to too many dependencies throughout the program.

- To combat this, Objects were created as containers for data that can be changed and manipulated without affecting the entire program. In Ruby objects encapsulate their states, adding a new layer of security, making it even more difficult for data to be tampered with unless deliberate access has been given.
- In order to create an object however we need to create a class first as it functions as the blueprint for objects, including what attributes the object should be made of and what it can do. 

### How do we use classes and objects in Ruby?

- To create a custom object we must first define the class first.

  ```ruby
  class GoodDog
  end
  ```

- In ruby to define a class we use the keyword `class` followed by the name of the class beginning with a capital letter. We then finish the class with an `end` statement.

- Then we can create an instance/object of the `GoodDog` class:

  ```ruby
  sparky = GoodDog.new
  ```

- By invoking the `new` method on `GoodDog`,  a `GoodDog` object is returned and stored in the variable `sparky`. `sparky` is now an object/instance of the class `GoodDog`.

### Why do we need  attr_*  to create setter and getter methods?

- Often we need to reference and update the attributes of an object outside its class but since Ruby object attributes are naturally encapsulated (ie. stored in instance variables which cannot be referenced outside a given class), it's not such a straight forward process. 
- This is where accessor methods come in.  Accessor methods are made purely for the purposes of referencing (getting) and updating (setting) the attributes or states of an object. 
- Because getter and setter methods are so commonplace in OO programming, Ruby has a built-in way to automatically create them using the `attr_accessor` method.

### How do we invoke setters and getters in Ruby?

#### a) outside a class

- Traditionally getters and setters are setup like this:

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def set_name=(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.get_name							=> "Sparky"
sparky.set_name = "Spartacus"
puts sparky.get_name							=> "Spartacus"
```

- In this example `sparky` is an instance of the `GoodDog` class
- if we want to access `sparky`'s name we can define a getter method inside the `GoodDog` class called `get_name`, which allows us to reference and return the value stored in `@name`. This is indicated on line 16 when we invoke the `get_name` instance method on `sparky` which outputs `Sparky`
- If we want to update `sparky`'s name we can define a setter method also inside the `GoodDog` class called `set_name=`, which takes an argument that is reassigned to the `@name`instance variable and returns the newly assigned value `Spartacus`. Ruby allows special syntax so it looks like reassignment on line 17, but it is actually a setter method invocation. The setter change is evident on line 18 when we invoke the `get_name` instance method on `sparky` which outputs `Spartacus`  

```ruby
class GoodDog
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end
```
- as mentioned before since getters and setter methods are so common, Ruby has a method `attr_accessor` which can take multiple symbol arguments and automatically creates trivial getters and setters, reducing time and length of our code. 
- If you just want a getter method you can use the method `attr_reader` and if you just need a setter method use `attr_writer`

#### b) inside a class

- replace instance variables with getter methods in the class code if you've altered the appearance of the state but you wish to preserve its original value.

```ruby
def ssn
  # converts '123-45-6789' to 'xxx-xx-6789'
  'xxx-xx-' + @ssn.split('-').last
end
```



- prefix setter methods with `self` so ruby can differentiate between a setter method and initializing a local variable.  `self` inside an instance method refers to the object that invoked the method.

```ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```

- this can be useful when doing multiple setter reassignments as in the example above. Instead of invoking 3 setter methods we can just invoke 1 and pass all the new values into the method.  all 3 states are updated in one go thanks to the setter methods.

### Why do we need Instance methods vs. class methods? 

- Instance methods are invoked directly on objects and are used to expose and alter the object's states(instance variables). Instance methods of a given class are like the behaviors of an object -- what an object can do.
- class methods on the other hand are invoked on the class itself and are prefixed with `self.` when defining. If we require functionality that does not pertain to objects/states we can use a class method.

### How do we use instance & class methods in Ruby?

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
sparky.speak
```

- we can use instance methods to expose the states of objects as seen on lines 6 to 8. Within the `speak` method definition we can access the value stored in the instance variable `@name` and invoke it directly on an object of the `GoodDog` class as shown on line 12. `sparky.speak` will therefore return the string `"Sparky, says arf!"`

```ruby
class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs   # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => 2
```

- class methods as mentioned before work well when we require functionality that doesn't pertain to objects or their states. 
- The code above is a good example of this, where we want to count the number of `GoodDog` objects that are instantiated. To do this we need to place a class variable `@@number_of_dogs` in the `#initialize` method will increment its value by 1 every time we instantiate a new object with  `#new`. since the `new` method automatically invokes `#initialize `  and since there are 2 GoodDog objects instantiated on lines 15 and 16 if we invoke the `total_number_of_dogs` on `GoodDog` it returns the current_value stored in  `@@number_of_dogs`, which is `2`  

### Why do we need Method Access Control? 

### How do we use Method Access Control in Ruby?

2. Why do we need to reference and set instance variables vs. using getters and setters? How do we do it in Ruby?
3. Why do we need Class inheritance? How do we use class inheritance in Ruby?  
4. Why do we need encapsulation? How do we use encapsulation in Ruby?
5. Why do we need polymorphism? How do we use polymorphism in Ruby?
6. Why do we need Modules? How do we work with modules in Ruby?
7. Why do we need a Method lookup path? How do we use it in Ruby?
8. Why do we need self? How do we use self in Ruby?
9. Why do we need Fake operators and equality? How do we work with Fake operators and equality in Ruby? 
11. Why do we need collaborator objects? How do we work with collaborator objects in Ruby?