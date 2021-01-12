## Classes and Objects

```ruby
class Person
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end
  
bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
```

1. first we define a class called `Person` form lines 1-7. `Person` defines 3 instance methods, The `#initialize` method spanning lines 4-6, the `name` (getter) method and the `name=` (setter) method both on line 2.
2. When we invoke the `new` method on `Person` it creates a new `Person` object which is stored in the local variable `bob`.  `new` also automatically invokes the `#initialize` method and assigns its string argument `'bob'` to the `#initialize` parameter `name` on line 4. `name` then stores this value into the instance variable `@name` which is used to keep track of `bob`'s name state. 
3. the `attr_accessor :name` method invocation on line 2 automatically create a getter and setter method for `@name`. These methods can retrieve (get) and/or change the state (set) of `@name` outside the class. This is evident on lines 10-12 where we invoke `name` on `bob` which returns the string `'bob'` followed by setting `@name`'s' state with the string `'Robert'`. Although this looks like reassignment in action this is actually the setter method invocation `name=` where `'Robert'` is passed in as an argument. 

