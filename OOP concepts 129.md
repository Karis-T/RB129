## Classes, objects, Encapsulation, Collaborator objects & Method Access Control

#### What is encapsulation? How does encapsulation relate to the public interface of a class?

> Encapsulation is the hiding of data away from the rest of our codebase to prevent misuse from the outside world. It is a form of data protection and provides necessary boundaries to keep our working code safe, revealing only what is absolutely necessary - (the public interface / public methods) to users . 

> Encapsulation lets us hide the internal representation of an object away from the outside and only expose the methods/attributes that the users of the object need - ie. the public interface. While Ruby's instance variables (states) are strictly encapsulated within an object, its methods by default are available to anyone who knows the name of the class or object.  Method access control offers an extra layer of protection to hide implementation methods - methods that do the heavy work in the class, or methods that simply shouldn't be made available to those outside the class.

> Encapsulation is when we hide pieces of functionality away from the rest of our code base , preventing access and misuse of the data. It is a form of data protection so that it can't be manipulated unless intended. It defines the boundaries of our application and allows our code to achieve new levels of complexity. Ruby (like many other OO languages) accomplishes this by only exposing the necessary interfaces (to interact with those objects)

>The public interface of a class is the public facing methods that can be accessed by anyone who knows the class or name of its instance. The rest of our functionality within the class should be encapsulated or hidden away from the outside to prevent misuse. To do this in Ruby we use Method Access control by placing any code we wish to conceal under a the `private` access modifier. This will prevent any access to methods outside the class.

> ```ruby
> class Dog
>   def initialize(n)
>     @nickname = n
>   end
> 
>   def greeting
>     "#{nickname.capitalize} says Woof Woof!"
>   end
> 
>   private
>   	attr_reader :nickname
> end
> 
> dog = Dog.new("rex")
> puts dog.greeting # Displays: Rex says Woof Woof!
> ```
>
> In the example above, we do not want the `Dog` object assigned to `dog` to directly gain access to the getter method `nickname` provided by `attr_reader:nickname` on line 11.  This is why we've placed the access modifier `private` above it on line 10 which only allows `nickname` to be invoked from within the class. If we want to access the value of `nickname` outside the class we can only do so with the `#greeting` method. This is all the information we want seen outside the class, thus making `#greeting` our public interface for `Dog` objects. (`#initialize` is implicitly private)

#### What is an object? How do you initialize a new object ? How do you create an instance of a class? What is instantiation? What is a constructor method? What is an instance variable, and how is it related to an object? What is an instance method? What is the scoping rule for instance variables?

> An object is instantiated from a class and contains a set of attributes and behaviors based on what is prescribed in the class. If a class is like a mold, then an object is what is produced from the mold. 
>
> To initialize a new object in Ruby we must invoke the `new` method on a preexisting class with a defined `#initialize` (constructor) method. `new` will first instantiate an object and then trigger `#initialize`, passing any arguments from `new` onto `#initialize` and assigning them to parameters. These parameters act as local variables which are then set to instance variables within the `#initialize` method. This sets up our newly instantiated object with states that are tracked using instance variables. An object is returned from this process.
>
> Instantiation is the process of creating an object (or an instance) from its given class. This is usually done by invoking the `new` method on the class you wish to create an object from.
>
> A constructor is a method that "sets up" or initializes the state of an object. In Ruby we use the `#initialize` method as a constructor - which typically assigns various instance variables to the object.
>
> Each object has their own copy of an instance variable, which helps track their state. Instance variables exist for as long as the object exists. For example if you wish to attach a name to the object you've initialized it can be tracked via an instance variable, typically placed inside Ruby's constructor method `#initialize`. Instance variables are scoped at the object level, which means they cannot be directly referenced outside a class. Should we need to though we can create special accessor methods to gain access to their value outside the class.
>
> Instance methods can only be used/invoked by an instance of the class and represent the behavior of all the objects from that class. They are used to manipulate the state of an object and pertain to object level detail

#### How do you see if an object has instance variables?

> To see if an object contains any instance variables you can invoke the `#instance_variables` method on it like so
>
> ```ruby
> sparky = GoodDog.new("Sparky") #instantiated object from the GooDog class
> sparky.instance_variables => [:name] 
> ```
>
> This will return an array of symbols representing the various initialized instance variables the object contains

#### What is a class? What is the relationship between a class and an object? How is defining a class different from defining a method?

> A class is like the blueprint of an object. Classes define the states and behaviors of an object - basically what the object is like (instance variables) and what it can do (instance methods). Objects are instantiated from classes. To define a class we use the `class` keyword followed by a capitalized name of the class using camel case. This different from defining a method which is with the `def` keyword followed by a snake case name of the method. Both however are finished with the word `end`

#### When defining a class, we usually focus on state and behaviors. What is the difference between these two concepts? 

> The state of the object is typically what the object "is like" which is tracked by instance variables. Whereas behaviors focus on what an object can do - its instance methods.

#### Objects do not share state, but they do share behaviors. The values in instance variables (states) are different, but they can call the same instance methods (behaviors) defined in the class. Explain the idea that a class groups behaviors.

> Each object instantiated from a particular class receive their own copy of instance variables which are used to track the differences in their state. One `Person` object for example could have `@eye_color = 'blue'`, where as the other `Person` object can have `@eye_color = 'brown'`. While `Person` objects have different states, they should be able to do the same things, such as `walk`, `breathe`, `talk` and so on. This is why objects of the same class share common behavior, and are defined as instance methods grouped within their respective classes.

#### How do objects encapsulate state?

> via its instance variables because they are scoped at the object level and cannot be directly referenced outside it.

#### What is the difference between classes and objects?

> classes group common behaviors whereas objects encapsulate state

#### How can we expose information about the state of the object using instance methods?

>we can place our instance variable inside an instance method so it can be exposed to the outside. This is known as a getter method and can be created manually via method definition or automatically using Ruby's built-in method `attr_reader` passing in a symbol of the instance variable name as an argument.

#### What is a collaborator object, and what is the purpose of using collaborator objects in OOP?

> Collaborator objects are objects that are stored as state within another object. They're called collaborator objects because they work in conjunction (or in collaboration) with the class they are associated with. They play an important role in OO design because they represent the connections between various actors in your program.  

#### Why should a class have as few public methods as possible?

> It lets us simplify using that class (public interface) and protect data from unwanted changes from the outer world. 

#### What is the private method call used for?

> the `private` method is an access modifier that makes any methods below it private, thus preventing them from being accessed outside the class. Its used for methods that are doing the work in a class but don't need to be made available to the rest of the program.

#### What is the protected method used for?

> If you want an in-between approach that can be accessible like a `public` method from inside the class but inaccessible outside the class just like a `private` method. 

#### What are two rules of protected methods?

> 1. `protected` are accessible just like `public` methods are from inside the class
> 2. `protected` methods act just like `private` methods from outside the class 

#### Classes also have behaviors not for objects (class methods). How do you define a class method?

> Class methods are defined differently than instance methods. The method name is prepended with `self` eg. `self.genereic_greeting`. In this case `self` refers to the name of the class. 

#### When writing the name of methods in normal/markdown text, how do you write the name of an instance method? A class method?

> a class method is prefixed with `self.` eg. `def self.some_class_method; end`, where `self` refers to the class name. Whereas instance methods have no prefix eg. `def some_instance_method; end`.  Snake casing should be used  with no capital letters (unless you wish to use the name of the class instead of `self`) both use the `def` and `end` keyword to define them.

## Polymorphism, inheritance, method lookup path & duck-typing

#### What is polymorphism? Explain two different ways to implement polymorphism.

> Polymorphism stands for "many forms". It represents many types of data being able to respond to the same public interface and produce different results. You can achieve polymorphism through inheritance and through duck typing. Module mixins are also another way to achieve polymorphism by way of having different types of objects responding to the same method invocations in a module.

> Polymorphism is the ability for different types of data to be able to respond to a common interface (objects of different types respond to the same method invocation). For instance if we have a method that expects argument objects that have a `move` method, we can pass it any type of argument provided that it has a compatible `move` method. This leads to more reusable, maintainable code.
>
> ```ruby
> class Animal
>   def eat
>     # generic eat method
>   end
> end
> 
> class Fish < Animal
> end
> 
> class Cat < Animal
> end
> 
> 
> array_of_animals = [Fish.new, Cat.new]
> array_of_animals.each do |animal| 
>   animal.eat
> end
> ```
>
> Thanks to inheritance, any animal inheriting from `Animal` superclass has access to the its interface. The `eat` method and can be used despite the animals are of different types. In the array of different objects they are both treated like a generic object that can respond to the method invocation `eat`.
>
> ```ruby
> class Wedding
>   attr_reader :guests, :flowers
> 
>   def prepare(preparers)
>     preparers.each do |preparer|
>       preparer.prepare_wedding(self)
>     end
>   end
> end
> 
> class Chef
>   def prepare_wedding(wedding)
>     prepare_food(wedding.guests)
>   end
> 
>   def prepare_food(guests)
>     #implementation
>   end
> end
> 
> class Decorator
>   def prepare_wedding(wedding)
>     decorate_place(wedding.flowers)
>   end
> 
>   def decorate_place(flowers)
>     # implementation
>   end
> end
> ```
>
> Even though none of these classes are inherited, polymorphism is still at play in the sense that each class must define a `prepare_wedding` method and implement it in their own way. If we add another preparer all we need to do is create a class and implement a `prepare_wedding` to perform its own required actions. It allows each object to look after its own implementation thus reducing dependencies.

#### What is duck typing? How does it relate to polymorphism - what problem does it solve?

>Duck typing doesn't concern itself with the class of an object; instead its concerned with what methods are available to the object. If the object "quacks" like a "duck" then we can treat it like a "duck"

#### What is inheritance? What is the difference between a superclass and a subclass? When is it good to use inheritance? Give an example of how to use class inheritance. Give an example of using the super method, both with and without an argument. Give an example of overriding: when would you use it? In inheritance, when would it be good to override a method?

> Inheritance is where a class inherits the behaviors of another class. The class inheriting the behavior is called the subclass and the class it inherits from is called the superclass. This gives us the ability to define more basic classes with large reusability and smaller subclasses for more fine-grained, detailed behaviors.
>
> Inheritance can be a great way to remove duplication in your code base. It means that if you find yourself writing the same logic over and over again in your programs, there are ways to extract that logic to one place for reuse.
>
> ```ruby
> class Animal
>   def speak
>     "The #{self.class.downcase} is making noise!"
>   end
> end
> 
> class Dog < Animal
> end
> 
> class Cat < Animal
> end
> ```
>
> Here is an example of both Cat and Dog subclasses are inheriting from the Animal superclass using the `<` symbol when defining the class. This means that all the methods in the `Animal` class are available to the `Dog` and `Cat` class for use. They typically share a is-a relationship ie - a cat is-an animal. We extract methods from the subclass to the superclass to allow to maximize reusability and to uphold the DRY principle (Don't repeat yourself). In this case now both `Cat` and `Dog` objects can use the `speak` method
>
> `super` is a keyword that searches the method lookup path for a method with the same name, then invokes it. 
>
> ```ruby
> class Animal
>   attr_accessor :name
> 
>   def initialize(name)
>     @name = name
>   end
> end
> 
> class Cat < Animal
>   def initialize(name, breed)
>     super(name)
>     @breed = breed
>   end
> end
> 
> kitty = Cat.new("Princess","Russian Blue") 
> #<Cat:0x007fb40b1e6718 @name="Princess", @breed="Russian Blue">
> ```
>
> Here we have created two instance variables `@name` in the superclass and `@breed` in the subclass. When we instantiate a new `Cat` object via the `new` method it triggers the `Cat#initialize` method in the objects class if there is one, passing any arguments from `new` through to it. In this case however we want to assign the `name` local variable to the instance variable `@name` in the superclass. To do this we use the reserved keyword `super` which searches the lookup path for the first method with the same name then invokes it - automatically passing any arguments it has to it. `Animal#initialize` is now invoked and sets `name` to `@name`. We return back to our `Cat#initialize` method and set the last variable `breed` to `@breed`. This process returns the `Cat` object with all its instance variables tracked indicated on line 17.
>
> Since subclasses may have differing behaviors eg. Bulldogs cant swim while other dog breeds can, this is where we will need to override the `swim` method from its superclass `Dog`

#### What is Accidental method overriding?

> Every class you create automatically subclasses from class `Object`. `Object` is built into Ruby and comes with many critical methods. All the methods defined in object are available in all classes (except for Kernel and Basic Object). This means that if you accidentally override a method that was originally defined in the `Object` class it can have far-reaching effects on your code. 

#### What is a module? What is a mixin? When creating a hierarchical structure, under what circumstance would a module be useful? What is interface inheritance, and under what circumstance would it be useful in comparison to class inheritance? What is namespacing and how do you instantiate a an object of a class contained in a module? Describe the use of modules as containers. How does Ruby provide the functionality of multiple inheritance?

>A module is a collection of behaviors that's usable in other classes via mixins. 
>
>A mixin is literally when a module is "mixed in" to a class using the `include` method invocation followed by the name of the module that you want the functionality from
>
>Sometimes not all subclasses share the same behavior enough to extract it to a superclass. In this case we'd opt to use a mixin instead of class inheritance. For example `Dolphin`, `Dog` and `Camel` subclasses would all inherit from the class `Mammal`, but camels can't swim whereas dolphins and dogs can. It wouldn't make sense to put a `swim` method into the `Mammal` superclass, so this is where we'd mixin a `swim` module method into the classes that can swim.
>
>class inheritance: one type inherits the behaviors of another type. The result is a new type specializing in the type of the superclass. 
>
>interface inheritance: The class doesn't inherit from another type rather it inherits the interface provided by a mixin module. The result isn't a specialized form of the module.
>
>- if the class has an "is-a" relationship choose class inheritance, if it's a "has-a" relationship choose interface inheritance.
>- you can only subclass from one class (class inheritance) but you can mix in as many modules (interface inheritance) as you like.
>- You cannot instantiate modules (but you can with classes). But you can use modules for name spacing and grouping common methods together
>
>namespacing in the context of modules means to use a module to group related classes so they're easily recognizable in our code and that they don't collide with other similarly name classes in our codebase. To instantiate an object from a class within the module we append the class name to the module name with two colons `::` then invoke the `new` method:
>
>```ruby
>module Mammal
>  class Dog
>    def speak(sound)
>      p "#{sound}"
>    end
>  end
>end
>
>buddy = Mammal::Dog.new
>buddy.speak('Arf!')           # => "Arf!"
>```
>
>Module methods are when a module is used as a container to house methods. This is very useful for methods that seem out of place in your code. Defining methods this way means you can call them directly from the module:
>
>```ruby
>module Mammal
>  def self.out_of_place_method(num)
>    num ** 2
>  end
>end
>
>value = Mammal.out_of_place_method(4)
>value = Mammal::some_out_of_place_method(4) # they can be invoked like this too
>```
>
>Ruby supports multiple inheritance by way mixing in behaviours. A subclass can only class from one parent but it can mix in as many modules as it likes.

#### Why should methods in mixin modules be defined without using self. in the definition?

>Methods in mixin modules should be defined without `self` because the class its included in will only be able to access the method by invoking the module name followed by the method. Also it will only be available as a module method and not an instance method.
>
>```ruby
>module Drivable
>  def self.drive    #this will only be able to be invoked as a module method
>  end
>end
>
>class Car
>  include Drivable  #cannot be invoked as an instance method
>end
>
>bobs_car = Car.new
>bobs_car.drive
>```
>
>To remedy this remove all `self` in the definition of a module (unless you intend to use them as module methods)

#### What is the method lookup path? How is the method lookup path affected by module mixins and class inheritance? How do you find the lookup path for a class? 

>The method lookup path is the order in which Ruby will traverse the class hierarchy to look for methods to invoke. For example, say you have a `Bulldog` object called `bud` and you call: `bud.swim`. Ruby will first look for a method called `swim` in the `Bulldog` class, then traverse up the chain of super-classes (and modules); it will invoke the first method called `swim` and stop its traversal.
>
>In our simple class hierarchy, it's pretty straight forward. Things can quickly get complicated in larger libraries or frameworks. To see the method lookup path, we can use the `.ancestors` class method.
>
>```ruby
>Bulldog.ancestors       # => [Bulldog, Dog, Pet, Object, Kernel, BasicObject]
>```
>
>Note that this method returns an array, and that all classes sub-class from `Object`. 
>
>if we included a few modules into the bulldog class like so:
>
>```ruby
>module Walkable; end
>module Fetchable; end
>
>class Bulldog < Dog
>  include Walkable
>  include Fetchable
>end
>  
>Bulldog.ancestors #=>[Bulldog, Fetchable, Walkable, Dog, Pet, Object, Kernel, BasicObject]
>```
>
>As we can see any modules included in the current class are inserted in the method lookup chain based on order of inclusion, with the last included module looked at first. Included modules insert themselves before the superclass, thus will be consulted first when trying to locate a method. If the located method is found it will be executed otherwise a `NoMethodError` will be returned.

#### Are class variables accessible to subclasses? Why is it recommended to avoid the use of class variables when working with inheritance?

>Because there is only one copy of the class variable across all sub-classes. any change made to this variable from any subclass it has, permanently alters what this variable is referencing

#### Is it possible to reference a constant defined in a different class?How are constants used in inheritance?What is lexical scope?When dealing with code that has modules and inheritance, where does constant resolution look first?

>unlike class or instance variables, we can actually reference the `LEGS` constant from the `Dog` class. To do so, we tell Ruby where `LEGS` is by using `::`, which is the namespace resolution operator.
>
>you can use `::` on classes, modules or constants
>
>A constant initialized in a super-class is inherited by the sub-class, and can be accessed by both class and instance methods.
>
>```ruby
>class Dog
>  LEGS = 4
>end
>
>class Cat
>  def legs
>    Dog::LEGS                               # added the :: namespace resolution operator
>  end
>end
>
>kitty = Cat.new
>kitty.legs                                  # => 4
>```
>
>```ruby
>module Maintenance
>  def change_tires
>    "Changing #{WHEELS} tires."
>  end
>end
>
>class Vehicle
>  WHEELS = 4
>end
>
>class Car < Vehicle
>  include Maintenance
>end
>
>a_car = Car.new
>a_car.change_tires                          # => NameError: uninitialized constant Maintenance::WHEELS
>```
>
>Constants are not evaluated at runtime so their lexical scope (where they are situated in the code) is important. the code in the method `change_tires` is in the `Maintenance`module which is where constant resolution will look first.   

#### What is the namespace resolution operator?

>It's the `::` operator that appends the name of the constant to the name of the class or module. It tells Ruby to find where the constant was initialized.

## Setters and getters

#### What is an accessor method?

>a method created for the purposes of exposing or setting a value of an instance variable outside the object (since instance variables are scoped at the object level)

#### What is a getter method?

>a method created for the purposes of exposing an instance variable's reference outside the object. It is defined conventionally by using the name of the instance variable and then placing the respective instance variable inside it. 

#### What is a setter method? What does it return?

>a method created for the purposes of setting a string, integer etc to an instance variable outside the object. it returns the updated value. It is defined conventionally by using the name of the instance variable and `=` as a suffix which ruby recognizes and allows us to write it like assignment syntax. It takes one parameter which becomes the newly assigned value to the instance variable.

#### What is attr_accessor?

>because defining getter and setter methods can take up a lot of room in our program and they're quite commonplace Ruby has a built-in way to automatically create these getter and setter methods for us, using `attr_accessor` method.  The `attr_accessor` method takes a symbol as an argument, which it uses to create the method name for the getter and setter methods

#### How do you decide whether to reference an instance variable or a getter method?

>If you are making changes to/do not wish to expose the raw data stored in the instance variable, its a good idea to reference the getter method in our instance methods instead of the instance variable. That way we can keep all the alterations made to the instance variable in one place - within the getter method. 
>
>Performing calculations in accessor methods can be convenient if that's the only place you need the calculation to be performed.

#### What are two different ways that the getter method allows us to invoke the method in order to access an instance variable?

>Manually define the method eg:
>
>```ruby
>def name
>  @name
>end
>```
>
>or automatically create one using the `attr_reader` method eg:
>
>```ruby
>attr_reader :name
>```

#### When you have a mixin and you use a ruby shorthand accessor method, how do you write the code (what order do you write the getter/setters and the mixin)? What about using a constant?

>module/constant, accessor method, everything else in a class

#### When using getters and setters, in what scenario might you decide to only use a getter, and why is this important?

>When adding getters and setters, it's easy to get carried away and simply add `#attr_accessor` for every instance variable. However, doing this can have negative implications. When you have sensitive information that you don't want changed outside the class (like a ssn or a phone number) this is when a setter is not required

#### When might it make sense to format the data or prevent destructive method calls changing the data by using a custom getter or setter method?

> when its a variable you do not want to mutate eg calling `reverse!` on a name

## Instance methods vs. class methods, self, Calling methods with self, More about self,

When would you call a method with self?

>When you are using a setter method inside a class (otherwise it can be mistake for local variable initialization)

What are class methods?

>These are methods invoked directly on the class itself and pertain only to class level detail, not objects. They typically work in conjunction with class variables, which are scoped at the class level and keep track of class detail. If need be class variables can be exposed to the outside using class methods.

What is the purpose of a class variable?

> class variables keep track of class level detail and are scoped at the class level.

What is a constant variable?

>Constants are variables that you typically don't want to change. They can be declared anywhere in your program and are conventionally written in all uppercase letters, but only need to be capitalized for Ruby to recognize it as a constant.

What is the default to_s method that comes with Ruby, and how do you override this? What are some important attributes of the to_s method?

>by default the `to_s` method returns the name of the object's class and an encoding of the object ID.  You can override this method by defining it in your own custom class. if you've instantiated an object in that class and invoke `to_s` on it, the method lookup path will then search and find your method instead of the default one (in the `Object` class)

From within a class, when an instance method uses self, what does it reference?

> In this context, `self` refers to the object that invoked the method (the calling object)

What happens when you use self inside a class but outside of an instance method?

>`self` outside an instance method but inside a class refers to the class name itself. Used in this way it can define class methods.

Why do you need to use self when calling private setter methods?

>>Regardless if its private or not using a method without `self` inside a class is mistaken for local variable initialization

Why use self, and how does self change depending on the scope it is used in?

>Inside an instance method use `self` when invoking setter methods from within a class. This is to let Ruby know you are invoking a method instead of initializing a local variable. Outside an instance method but inside a class use `self` to define a class method otherwise Ruby will mistake it for defining an instance variable.

Why is it generally a bad idea to override methods from the Object class, and which method is commonly overridden?

>Because the `Object` class comes with many critical methods that are available to all classes in Ruby that when overridden, can have far devastating consequences on your application. The only method that can be overridden easily without any major side effects is the `to_s` method.

What happens when you call the p method on an object? And the puts method?

>`p` and `puts` invoke the `to_s` method and if not redefined in your class will return the object's class name followed by an an encoding of the objects ID. 

What are the scoping rules for class variables? What are the two main behaviors of class variables?

>class variables are scoped at the class level and exhibit 2 behaviours:
>
>1. all objects from a class share 1 copy of the class variable (objects can access these variables by instance methods)
>2. class methods can access class variables regardless of where it's initialized in the class

What are the scoping rules for constant variables?

> constant variables have lexical scope (meaning where its syntax is written in the program)

How does sub-classing affect instance variables?

>as long as the instance variable is initialized, it can be referenced in any instance method in its superclass. If an instance variable is initialized using `initialize` in the superclass and then `initialize` is overridden in its subclass, the instance variable will not be initialized and returns `nil` if exposed.

Self refers to the ______ _______.

> calling object

How do you print the object so you can see the instance variables and their values along with the object?

>```ruby
>class Cat
>  attr_accessor :name
>
>  def initialize(name)
>    @name = name
>  end
>
>  def identify
>    self
>  end
>end
>
>kitty = Cat.new('Sophie')
>p kitty.identify
>```
>
>Either invoke the `puts` method on the object without defining a `to_s` method in your class or create an instance method and place `self` inside the body.

How do you override the to_s method? What does the to_s method have to do with puts?

>puts automatically invoked the `to_s` method whatever object its trying to print to the screen. You can override the the default `Object#to_s` method by defining it in your own class and specifying the intended output of your object.

What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

> ruby docs: `Object#to_s`

Why is it generally safer to use an explicit self. caller when you have a setter method unless you have a good reason to use the instance variable directly?

>calling the setter method, if available, is safer since using the instance variable bypasses any checks or operations performed by the setter. eg:
>
>```ruby
>def mileage=(miles)
>  @mileage = miles.to_i
>end
>```

## Fake Operators and Equality

#### What is a fake operator?

>Thanks to Ruby's liberal syntax, a lot of operators are actually ruby methods and are only made to look like operators. 

#### How does equivalence work in Ruby?

>Equivalence is about finding out if two objects (from the same data type) hold the same **value**. Typically we can check if the value is equivalent by invoking the `#==` method, but it depends how it's been redefined in the object's class. If `#==` hasn't been overridden in a given class it will resort to the default `BasicObject#==` method, which checks to see if two variables are pointing to the same object / space in memory.

#### How do you determine if two variables actually point to the same object?

>To determine if two variables are pointing to the same object, use either the `BasicObject#equal?` method or invoke `Object#object_id` on both objects and compare them using the `Integer#==` method.

#### What is == in Ruby? How does == know what value to use for comparison?

>`#==` is an instance method available to all objects in Ruby. Ruby gives it a special syntax to make it look like an operator sin instead of invoking it like this `str1.==(str2)` it can be written more naturally like `str1 == str2`. Both do the same thing. The original `==` method is defined in the `BasicObject` class, which is the parent class for *all* classes in Ruby.  However `BasicObject#==` works just like the `equal?` method which tests to see if two variables are pointing to the same object. This means that every object in ruby has == method but each class should define the `==` method to specify what to compare.

#### Is it possible to compare two objects of different classes?

>Yes observe this built in method for `Integer` objects which compares if the `Integer` object `45` and the `Float` object `45.00` hold the same value.
>
>```ruby
>45 == 45.00                 # => true
>```
>
>Because `#==` is an instance method you can implement it however you wish

#### What do you get “for free” when you define a == method?

>`#!=` "not equal to" method

#### What is the equal? method?

> the default implementation for `BasicObject#==` is the same as `BasicObject#equal?` and also similar to comparing two `object_id`s in that it evaluates to true if two variables are pointing to the same object. It's recommended that this method is not overridden. Unlike `==` it's not used very often. 

#### What is interesting about the #object_id method and its relation to symbols and integers?

>if two symbols or two integers hold the same value, they are also the same object. They are immutable and therefore have a performance optimization over other data types likes strings etc. This is why symbols are preferred as hash keys

#### What is the === method?

>`#===` is used implicitly by `case` statements and only needs to be defined in your custom class if you anticipate using `case` statements with your instances. `Object#===` is always available to all objects and by default works the same as `BasicObject#==` or `Basic#equal?` in that it only evaluates to true if two variables are pointing to the same object. In other classes however `#===` typically defined as a membership or matching operator - ie "does this object belongs in this group?"
>
>```ruby
>num = 25
>
>if (1..50) === num					# does 25 belong in 1..50 ?
>  puts "small number"
>elsif (51..100) === num			# does 25 belong in 51..100 ?
>  puts "large number"
>else
>  puts "not in range"
>end
>```
>
>```ruby
>String === "hello" # => true				#is "hello" an instance of String class? true
>String === 15      # => false				#is 15 an instance of string class? false
>```

#### What is the eql? method?

> `eql?` determines if two objects contain the same value and if they're of the same class. its implicitly used by `Hash` to determine if two hashes have to same key/value pairs. By default in the `Object` class it `eql?` is similar to `#==`.

#### When do comparison methods make the most sense to implement?

>If you'd like to have really nice syntax for comparing custom objects you can implement the `>`  or `<` methods
>
>```ruby
>class Person
>  attr_reader :name, :age
>
>  def initialize(name, age)
>    @name = name
>    @age = age
>  end
>  
>  def >(other)
>    age > other.age
>  end
>end
>
>bob = Person.new("Bob", 49)
>kim = Person.new("Kim", 33)
>
>puts "bob is older than kim" if bob > kim
>```
>
>instead of comparing `bob.age > kim.age` we could just define an `>` instance method (`<` is not automatically defined) and pass in the other object, which in this case is `kim`. Within `Person#>` we can rely on the `Integer#>` method to compare the age of each object and will return `true` if the object's `age` that invoked the method is greater than the argument's `age`

#### When do shift methods make the most sense?

>implementing the shift method `<<` makes the most sense when the class represents a collection.
>
>```ruby
>class Company
>  attr_accessor :name, :employees
>  
>  def initialize(name="New Company")
>    @name = name
>    @employees = []
>  end
>  
>  def <<(person)
>    employees.push(person)				# relying on Array#<< method
>  end
>end
>
>dan = Person.new("Dan")
>fast_food_co = Company.new("Fast Food Co.")
>fast_food_co << dan
>
>fast_food_co.inspect       # => #<Company:0x007fe08c209530 @name="Fast Food Co."...>
>```
>
>By defining `Company#<<` we provide a very clean interface for adding employees to a `Company` object.

#### When should we implement a `+` method for our own objects?

>```ruby
>green_food_co = Company.new("Green Food Co.")
>green_fast_food_co = green_food_co + fast_food_co
>```
>
>```ruby
>def +(other)
>  new_company = Company.new
>  new_company.employees = employees + other.employees #relying on Array#+ method
>  new_company
>end
>```
>
>Looking at Ruby's built in library, the `#+` methods are usually for incrementing a value by the value's argument (like `Integer#+`) or for concatenating an object to the objects argument like (`String#+` or `Array#+`) to which they all return a new object.
>
>The functionality of the `+` should be either incrementing or concatenation with the argument. While you can implement it however you wish it's a good idea to follow the general usage of the standard libraries.
>
>Above we see that our `Company#+` method returns a new `Company` object with two previous company's employees concatenated to each other. This is stored in the variable `green_fast_food_co` , an amalgamation of the two companies. We can now update its name accordingly using our `name=` setter method:
>
>```ruby
>green_fast_food_co.name = "Green Fast Food Co."
>```

#### Explain how the element reference getter and element assignment setter methods work, and their corresponding syntactical sugar.

>Ruby gives uses syntactical sugar to make element reference and assignment look more natural, but it can also be hard to understand where this kind of code comes from.
>
>```ruby
>array = ["a", "b", "c", "d"]
>array[2] 					# => "c"
>array.[](2) 			# => "c"		# Array element reference
>array[4] = "e"		# => "e"
>array.[]=(4, "e")	# => "e"		# Array element assignment
>```
>
>If we want to define element setter and getter instance methods in our class we have to make sure we're working with a class that represents a collection.
>
>```ruby
>class Company
>  # ...rest of code ommitted for brevity
>  
>	def [](idx)
>    employees[idx]					# relying on Array#[] 
>  end
>  
>  def []=(idx, obj)
>    employees[idx] = obj		# relying on Array#[]=
>  end
>end
>
>fast_food_co.employees # => an array of 3 Person objects
>
>fast_food_co[0] 			 # => #<Person:0x007fe08c209530 @name="Dan">
>fast_food_co[3] = Person.new("Julie")
>fast_food_co[3] 			 # => #<Person:0x001ge06d208532 @name="Julie">
>```
>
>We are taking advantage of the fact that `@employees` is an array so we can push the work to `Array#[]` and `Array#[]=` instance methods. We can now do element reference and assignment using `Company#[]` and `Company#[]=` which adds much more readability to our code.

#### Explain why fake operators are used

> Because many of ruby's operators are in fact instance methods, we can implement them in our classes and take advantage of the special syntax for our own objects. However If we do that, we must be careful to follow conventions established in the Ruby standard library. Otherwise, using those methods will be very confusing.