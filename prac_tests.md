**ell1 Explain how the element getter (reference) and setter methods work, and their corresponding syntactical sugar.**

Element references and element assignment although appear to be Ruby operators are actually methods that you can define in any class. This is done using ruby's syntactical sugar and makes element getters appear from this `arr.[](2)` to this `arr[2]` and assignment from this `arr.[]=(2, "c")` to `arr[2] = "c"` , making it far more readable. Element referencing and assignment is only really necessary to define if you are creating a class/object that represents a collection and you'd like to add or refer to one/some of its elements. 

```ruby
class Company
  attr_reader :name, :employees
  
  def initialize(name)
    @name = name
    @employees = []
  end
  
  def [](index)
    employees[index]
  end
  
  def []=(index, value)
    employees[index] = value
  end
end

sally = Person.new("Sally", "32", "Manager")

green_food_co = Company.new("Green Food Co")
green_food_co[0] = sally
green_food_co[0]	#=> #<Person:0x00005590c33b0250 @name="Sally", @age="32", @position="Manager">
```

Here we have a class `Company` that defines element reference/getter from lines 9-11 and element assignment/setter lines 13-16. We can use it for the class's collection - `@employees` which currently points to an empty array. Ruby recognizes these methods and allows us to use syntactical sugar on indicated on lines 21 and 22. We can now add employee `sally` - a custom object from the person class and reference an employee without making a call to the `employees` getter method. The last line returns the employee located at index `0` which is our newly assigned employee - the `sally` object 

**2 In class inheritance, when would it be good to override a method?**

It's appropriate to override a method when we require a subclass to have more fine-grained, detailed behavior than that of its superclass. Superclass's typically have more basic behavior, and there are times where we need something more specific that pertains to the subclass and its instances.

```ruby
class Mammal
  def move
    #basic moving implementation for all Mammals
  end
end

class Whale < Mammal
  def move
    #specific moving implementation for whales
  end
end
```

In this example shown above we define 2 classes `Mammal` and `Whale`. `Whale` is a subclass of `Mammal` and therefore inherits all of its behavior. However we know that a `Whale` moves differently than most mammals as they are aquatic creatures. This is why we must redefine its `move` method which will supply more specific implementation of how `Whale` object's actually move.

**3 How do objects encapsulate state?**

objects encapsulate their state using instance variables. Instance variables are prefixed with an `@` symbol and are scoped at the object level. What this implies is that each object contains its own set of variables that do not crossover to other objects nor can be accessed outside of itself. In order to access an objects state we have to create getter methods to expose an instance variable to the outside.

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

chad = Person.new("Chad")
@name		#=> nil
```

 Here `@name` cannot be referenced outside the object, and if it is it will return `nil`. This is Ruby's way of encapsulating an object. The only way we can expose its state is to create a getter method `name` or use the `instance_variable_get` method like so: `chad.instance_variable_get(:@name)` 

**4 What is polymorphism? Explain two different ways to implement polymorphism.**

Poly means "many" and morph means "forms". Polymorphism is the idea that any object regardless of class is able to respond to a common4 interface (method invocation) provided that they have the same named method defined in their class. Typically this will produce different results based on the implementation prescribed in the class.

One form of polymorphism is through class inheritance, where different objects have a superclass but can respond to one method invocation:

```ruby
class Animal
  def eat
    #basic animal eating implementation
  end
end

class Fish < Animal
  def eat
   # specific fish eating implementation 
  end
end

class Cat < Animal
  # specific cat eating implementation
end

def eat_food(animal)
  animal.eat
end

[Animal.new, Fish.new, Cat.new].each {|animal| eat_food(animal)}
```

Here on line 20 we've instantiated 3 different  `Animal` class that each have an `eat` method. The `Cat` and `Fish` object overrides the basic `eat` method and implements its own specific version. All three objects although different the client code treats it like a generic `Animal` object and respond to the same interface (method invocation) `eat_food` by passing itself into the method as an argument. Because each `animal` has an `eat` method available to it, each object invokes its own method producing different outcomes.

The other form of polymorphism is through "duck typing", which refers to the old adage: 'if it quacks like a duck - we can treat it like a duck'. Duck typing doesn't doesn't concern itself with what class an object is, just the behavior/methods available to the object. Like inheritance polymorphism, duck typing has a single interface it responds to:

```ruby
class House
  attr_reader :bricks, :pipes, :lights
  # ...rest of class ommitted for brevity
  def build(subcontractors)
    subcontractors.each {|subcontractor| subcontractor.build_house(self)}
  end
end

class Bricklayer
  def build_house(house)
    lay_bricks(house.bricks)
  end
  
  def lay_bricks(bricks)
    #implementation
  end
end

class Plumber
  def build_house(house)
    install_plumbing(house.pipes)
  end
  
  def install_plumbing(pipes)
    #implementation
  end
end

class Electrician
  def build_house(house)
    install_lighting(house.lights)
  end
  
  def install_lighting(lights)
    #implementation
  end
end
```





**6 Why use self, and how does self change depending on the scope it is used in?**

**7 What are the scoping rules for class variables? What are the two main behaviors of class variables?**

**8 What is encapsulation? How does encapsulation relate to the public interface of a class?**

**9 What is duck typing? How does it relate to polymorphism - what problem does it solve?**

**10 When defining a class, we usually focus on state and behaviors. What is the difference between these two concepts?**

**11 What is the method lookup path?**

**12 What is a collaborator object, and what is the purpose of using collaborator objects in OOP?**

**13 What is an accessor method? How do you decide whether to reference an instance variable or a getter method?**

**14 Why does the .change_info method not work as expected here?**

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      
# => Sparky weighs 10 lbs and is 12 inches tall.
```