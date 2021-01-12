>If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?
>
>```ruby
>class Person
>  def initialize(name)
>		@name = name
>  end
>end
>
>bob = Person.new('Robert Smith')
>rob = Person.new('Robert Smith')
>```
>
>Firstly we do not want to compare `bob == rob` as it will return false. This is because we are comparing individual objects as opposed to their names. There's a couple of ways we can approach this problem. Either way we need to define a getter method for each objects name (stored in the `@name` instance variable) by invoking ruby's built in method `attr_reader`, passing to it a symbol argument of the instance variable we want to get (which in this case would be `:name`). 
>
>We can then either compare both objects on line 9 like so: `bob.name == rob.name` which will return `true` as we are relying on `String#==` which compares if the value of 2 strings are the same (and returns true if it is).
>
>The other alternative would be to define our own Equality `#==` method within the `Person` class. We could implement it like so:
>
>```ruby
>def ==(other)
>  name == other.name		# relying on String#== instance method
>end
>```
>
>The original equality method we were relying on is now overridden by `Person#==`. We can now compare both objects on line 9 like so: `bob == rob` . This gives us a much cleaner syntax and compares each objects name within the method definition, which returns `true`.

> Create an empty class named Cat.
>
> ```ruby
> class Cat
> end
> ```
>
> To create a class we simply use the keyword `class` followed by the name of the class `Cat`, which must start with a capital letter. We finish the class with an `end` keyword.

> Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.
>
> ```ruby
> class Cat
> end
> kitty = Cat.new
> ```
>
> On line 3 we have instantiated a new object from the `Cat` class by invoking the `new` method. We've then assigned the `Cat` object to the variable `kitty`.

>Identify all custom defined objects that act as collaborator objects within the code.
>
>```ruby
>class Person
>  def initialize(name)
>    @name = name
>  end
>end
>
>class Cat
>  def initialize(name, owner)
>    @name = name
>    @owner = owner
>  end
>end
>
>sara = Person.new("Sara")
>fluffy = Cat.new("Fluffy", sara)
>```
>
>a collaborator object is an object that's set to another objects state / instance variable to work in conjunction with the class they're associated with. A custom object is an object that is not apart of the built-in ruby objects and has been custom-created for the program. The new `Person` object instantiated and assigned to `sara` on line 12 is considered to be a custom object. On line 15 The new `Cat` object `fluffy` is instantiated via the `new` method with the custom object `sara` passed in as an argument. `sara` is then assigned and set to `fluffy`'s instance variable `@owner` on line 10 which means `sara` now acts as a collaborator object to `fluffy`

>>What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.
>
>```ruby
>class Pet
>    attr_reader :name
>
>    def initialize(name)
>        @name = name.to_s
>    end
>
>    def to_s
>        "My name is #{name.upcase}."
>      end
>  end
>
>name = 'Fluffy'
>fluffy = Pet.new(name)
>puts fluffy.name
>puts fluffy
>puts fluffy.name
>puts name
>```
>
>Here we removed the destructive method invocation `upcase!` on the instance variable `@name` on line 9 within the `Pet#to_s` definition and instead invoked the getter method `name` and chained the non-destructive method `upcase` on line 9. That way when we need to invoke `Fluffy.name` or `name` on line 17 or 18 it will return the original String object `Fluffy` initialized on line 13 and set to the `@name` instance variable on line 5. It is important not to tamper or invoke destructive methods on raw data stored in instance variables as it can lead to permanent consequences.

>What will the following code output?
>
>```ruby
>class Animal
>def initialize(name)
>  @name = name
>end
>
>def speak
>  puts sound
>end
>
>def sound
>  "#{@name} says "
>  end
>end
>
>class Cow < Animal
>  def sound
>  super + "moooooooooooo!"
>  end
>end
>
>daisy = Cow.new("Daisy")
>daisy.speak
>```
>
>on line 21 we instantiated a new `Cow` object called `daisy`  via the `new` method, passing in the string `"Daisy"` as an argument. `new` invokes the `Cow#initialize` method, inherited from the Cow's superclass `Animal` and assigns `"Daisy"` to the `@name` instance variable on line 5. When we invoke `#speak` on `daisy` on line 22 the method lookup path first searches the calling object's class (in this case `Cow`) for the `speak` method. Since it does not find it, the lookup path then searches its superclass - `Animal`, which we locate a `speak` method and it is then invoked on `daisy`.  On line 7 within the `#speak` method although it is not explicitly written, when there is no specified object that invokes an instance method, the calling object invokes the method, which in this case it's `daisy.sound`. And then we start the whole method lookup path again, this time searching for `#sound`. Fortunately `#sound` is located within the calling objects class `Cow` and it is invoked on `daisy`. However the `super` keyword is used within the `Cow#sound` method definition. `super` invokes the superclass method with the same name - `Animal#sound`. `Animal#sound` returns the string `"Daisy says "` and the string `"mooooooooooo!"` is concatenated onto it via the `String#+` method. The final output reads `"Daisy says moooooooooo!"`  

>The below code would work, but it is problematic. What is wrong with this code, and how can you fix it?
>
>```ruby
>class Wedding
>  attr_reader :guests, :flowers, :songs
>
>  def prepare(preparers)
>    preparers.each do |preparer|
>     case preparer
>     when Chef
>       preparer.prepare_food(guests)
>     when Decorator
>       preparer.decorate_place(flowers)
>     when Musician
>       preparer.prepare_performance(songs)
>     end
>    end
>  end
>end
>
>class Chef
>  def prepare_food(guests)
>  # implementation
>  end
>end
>
>class Decorator
>  def decorate_place(flowers)
>  # implementation
>  end
>end
>
>class Musician
>  def prepare_performance(songs)
>  #implementation
>  end
>end
>```
>
>The above code particularly the `Wedding#prepare` method has too many dependencies on other classes and relies on knowing too much about each of their implementation methods, creating a possible 'god object'. If we added a new class, we'd have to add both the class and their method invocation to the case statement `preparer`, which would bloat our `#prepare` method and give too much knowledge to the `wedding` object.  
>
>We can reduce dependencies by using polymorphism through duck typing. Duck typing (after the old adage If it looks like a duck and quacks like a duck - it must be a duck) allows any object regardless of class to respond to the same interface (method invocation), provided it has its own copy of the method defined in its public interface.
>
> ```ruby
>class Wedding
>  attr_reader :guests, :flowers, :songs
>
>  def prepare(preparers)
>    preparers.each { |preparer| preparer.prepare_wedding(self) }
>  end
>end
>
>class Chef
>  def prepare_wedding(wedding)
>    prepare_food(wedding.guests)
>  end
>  
>  def prepare_food(guests)
>  # implementation
>  end
>end
>
>class Decorator
>  def prepare_wedding(wedding)
>    decorate_place(wedding.flowers)
>  end
>  
>  def decorate_place(flowers)
>  # implementation
>  end
>end
>
>class Musician
>  def prepare_wedding(wedding)
>    prepare_food(wedding.guests)
>  end
>  
>  def prepare_performance(songs)
>  # implementation
>  end
>end
> ```
>
>Here each object instantiated from their respective classes looks after its own behavior by having its own `#prepare_wedding` interface. The `wedding` object itself is passed into each object's `#prepare_wedding` so it can be uniquely operated on. Within the body of each classes `#prepare_wedding`, we can finally introduce their unique implementation. By keeping each object's implementation to itself, it greatly reduces dependencies throughout the program, adds potential for method access control and creates flexibility for more classes without continuously changing the `Wedding`'s public interface.

>What change(s) do you need to make to the below code in order to get the expected output?
>
>```ruby
>class Character
>  attr_accessor :name
>
>  def initialize(name)
>  	@name = name
>  end
>
>	def speak
>  	"#{@name} is speaking."
>  end
>end
>
>class Knight < Character
>  def name
>  	"Sir " + super
>  end
>end
>
>sir_gallant = Knight.new("Gallant")
>sir_gallant.name # => "Sir Gallant"
>sir_gallant.speak # => "Sir Gallant is speaking."
>```
>
>The object that called the `#speak` method is the `Knight` object `sir_gallant`, which is instantiated on line 19. If we change `@name` to `name` on line 9 `name` is a getter method invocation. In Ruby if an instance method's caller is not specified (which in the case of `name` it isn't) it defaults to `self` aka the calling object `sir_gallant` . `sir_gallant.name` triggers Ruby's method lookup path and first looks for `#name` in the calling object's class - `Knight`. Since a `#name` instance method is found it is invoked. Within the body of `Knight#name` on line 15 the string `"Sir "` is concatenated to `super` - a keyword that invokes the superclass method with the same name. `Character#name` returns `"Gallant"` thus `Knight#name` returns `"Sir Gallant"`, which is interpolated on line 9 in the `#speak` definition. `#speak` returns the string `"Sir Gallant is speaking"` from its invocation on line 21.

>What will this return, and why?
>
>```ruby
>class Animal
>	attr_accessor :name
>
>	def initialize(name)
>		@name = name
>	end
>end
>
>class GoodDog < Animal
>  def initialize(color)
>  	super
>  	@color = color
>  end
>end
>
>bruno = GoodDog.new("brown") 
>p bruno.name
>```
>
>When we instantiate a new `Dog` object called `bruno` on line 16 we do so via the `new` method invocation. `new` automatically triggers the `Dog#initialize` method and sends through any arguments that were passed into `new`to `Dog#initialize` as parameters - in this case `"brown"` is being referenced by `color` on line 10. Within the `Dog#initialize` method on line 11 the `super` keyword is used without parentheses, which when done takes all the parameters of the current method definition `Dog#initialize`-  and invokes the superclass method with the same name - `Animal#initialize` with those same parameters. It is here that the string `"brown"`referenced by `color` is now also referenced by `name` parameter on line 4. The local variable `name` is then set to the instance variable `@name`.  Since `@name` has a getter method indicated by `attr_accessor :name` (which exposes the string stored in `@name`), when we invoke `#name` on `bruno` on line 17, which will return `"brown"` 

> Make the changes necessary in order for this code to return the expected values
>
>```ruby
>class FarmAnimal
>    def speak
>      	"#{self.class} says "
>    end
>end
>
>class Sheep < FarmAnimal
>    def speak
>      	super + "baa!"
>    end
>end
>
>class Lamb < Sheep
>    def speak
>      	super + "baaaaaaa!"
>    end
>end
>
>class Cow < FarmAnimal
>    def speak
>      	super + "mooooooo!"
>    end
>end
>
>Sheep.new.speak # => "Sheep says baa!"
>Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
>Cow.new.speak # => "Cow says mooooooo!"
>```

>What is the return value, and why?
>
>```ruby
>class Person
>  def get_name
>  	@name                    
>  end
>end
>
>bob = Person.new
>bob.get_name                  # => ??
>```
>
>`nil` because `@name` was not initialized. Unlike local variables, instance variables exist for as long as the object exists. While a new `Person` object called `bob` was instantiated on line 7, there was no initialization of its `@name` state. Since `@name` doesn't track anything it returns `nil` when referenced by it's getter method `get_name` invoked on `bob` on line 8  

>How do you get this code to return “swimming”? What does this demonstrate about instance variables?
>
>```ruby
>module Swim
>	def enable_swimming
>		@can_swim = true
>	end
>end
>
>class Dog
>	include Swim
>
>  def swim
>  	"swimming!" if @can_swim
>  end
>end
>
>teddy = Dog.new
>teddy.enable_swimming
>teddy.swim 
>```
>
>This code returns `"swimming!"` by invoking `#enable_swimmming` on the `Dog` object stored in `teddy` *before* you invoke the `#swim` method on `teddy`. `#enable_swimming` is an instance method that initializes `@can_swim` and is assigned to the object `true`. If you didn't invoke `#enable_swimming` on `teddy` the `@can_swim` instance variable on line 11 references `nil`. This is because instance variables exist for as long as the object exists, but when they're not initialized,  they're not referencing anything so they just return `nil`.

>What would the below code return, and why?
>
>```ruby
>class Vehicle
>	@@wheels = 4
>
>	def self.wheels
>		@@wheels
>	end
>end
>
>Vehicle.wheels                              # => ??
>
>class Motorcycle < Vehicle
>	@@wheels = 2
>end
>
>Motorcycle.wheels                           # => ??
>Vehicle.wheels                              # => ??
>
>class Car < Vehicle
>end
>
>Car.wheels                                  # => ??
>```
>
>Class variables are scoped at the class level and this is indicated on line 9 when `Vehicle.wheels` returns `4`. This is expected as `@@wheels` within the method definition `self.wheels` references the integer `4` , which was initialized on line 2.  However when we create `Motorcycle` that subclasses from `Vehicle` on lines 11 to 13, it reassigns the `@@wheels` class variable to the integer `2`. Since subclasses inherit the methods of its superclass, this is indicated on lines 15 and 16 when we reference `Motorcycle.wheels` and `Vehicle.wheels` which both return `2`. Lastly when we create the class `Car` which also subclasses from `Vehicle`, there's no edit made to `@@wheels` within it. So when we invoke the `wheels` method on `Car` on line 21 it still references `2`. This is an example of Ruby's unique class variable functionality in that each class and its respective subclasses inherit and pass around only 1 copy of a class variable. As long as any class through inheritance has access to a given class variable, they have the ability to permanently alter what it references. 

>Describe the error and provide two different ways to fix it.
>
>```ruby
>module Maintenance
>	def change_tires
>		"Changing #{WHEELS} tires."
>	end
>end
>
>class Vehicle
>	WHEELS = 4
>end
>
>class Car < Vehicle
>	include Maintenance
>end
>
>a_car = Car.new
>a_car.change_tires             
>```
>
>edit `WHEELS` on line 3 to either `Vehicle::WHEELS` or `Car::WHEELS`. When it comes to constants, if they are being referenced outside the class they were initialized, they must be qualified with a prefix of the class they were initialized in followed by `::` which tells Ruby where to locate the constant. In this case `WHEELS` constant can either be prefixed with the class `Vehicle` or `Car` as `Vehicle` is where `WHEELS` was first initialized and `Car` via inheritance has access to the `WHEELS` constant too.

>Name the parameter bed_type and implement the modification so that Car continues to only accept one argument.
>
>```ruby
>class Vehicle
>  attr_reader :year
>
>  def initialize(year)
>	  @year = year
>  end
>end
>
>class Truck < Vehicle
>  attr_reader :bed_type
>  
>  def initialize(year, bed_type)
>    super(year)
>    @bed_type = bed_type
>  end
>end
>
>class Car < Vehicle
>end
>
>truck1 = Truck.new(1994, 'Short')
>puts truck1.year
>puts truck1.bed_type
>
>```
>
>When we invoke the `new` method on `Truck` on line 16, it instantiates a new `Truck` object and invokes the objects `#initialize` instance method, and passes any arguments onto to `Truck#initialize`. To avoid repetition we send the local variable `year` up to its super classes `Vechicle#initialize` method using the `super` keyword and set it to `@year` instance variable to be tracked. Since `Car` objects also inherit the `Vehicle#initialize` method and only accept one argument, this is now satisfied. The remainder `bed_type` parameter can be resolved within the `Truck#initialize` method.

>Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be the value of speed.
>
>```ruby
>class Vehicle
>    def start_engine
>      'Ready to go!' 
>    end
>end
>
>class Truck < Vehicle
>	def start_engine(speed)
>  		super() + " Drive #{speed}, please!"
>	end
>end
>
>truck1 = Truck.new
>puts truck1.start_engine('fast')
>
># Expected output:
># Ready to go! Drive fast, please!
>```
>
>`super` keyword with closed empty parentheses sends no parameters to its corresponding superclass method `Vehicle#start_engine`, but still invokes it. This way we can append the functionality of `Vehicle#start_engine`'s return value to the rest of the code in `Truck#start_engine` which will output `Ready to go! Drive fast, please!` from `puts truck1.start_engine('fast')` invocation on line 14

>When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?
>
>```ruby
>module Speed
>	def go_fast
>		puts "I am a #{self.class} and going super fast!"
>	end
>end
>
>class Car
>	include Speed
>	def go_slow
>		puts "I am safe and driving slow."
>	end
>end
>
>Car.new.go_fast # => I am a Car and going super fast!
>```
>
>Here `self` within any instance method refers to the calling object - which in this case is an instance of the `Car` class instantiated on line 14. the `#class` instance method invoked on `self` on line 3 returns the object's class - `Car`. `self.class` is then interpolated into the string: `I am a Car and going super fast!`, which is inevitably returned when we invoke `#go_fast` on the instance of `Car` on line 14.  

>What will this return, and why?
>
>```ruby
>module Drivable
>  def self.drive
>  	"is this possible"
>  end
>end
>
>class Car
>	include Drivable
>end
>
>p Car.drive
>```
>
>The above will return a `NoMethodError` because `self` in the method definition on line 2 refers to the module it is defined within instead of the class it is mixed into via the `include` method on line 8. `self.drive` is considered to be a module method and is the same as defining `Driveable.drive`. As a rule if you plan on defining module methods, they should not be mixed into any class, as they are not accessible to the class they were included into and can lead to errors like the above. 

>Why are we seeing this unexpected output? Make changes to the code so that we see the appropriate behavior.
>
>```ruby
>module EmailFormatter
>  def email
>  	"#{first_name}.#{last_name}@#{domain}"
>  end
>end
>
>module EmailSender
>  def email(msg, sender, recipient)
>  	# contrived implementation for now
>  	puts "Delivering email to #{recipient} from #{sender} with message: #{msg}"
>  end
>end
>
>class User
>	attr_accessor :first_name, :last_name, :domain
>	include EmailFormatter
>	include EmailSender
>end
>
>u = User.new
>u.first_name = "John"
>u.last_name = "Smith"
>u.domain = "example.com"
>
>p u.email
>```
>
>line 25 returns an `ArgumentError` because there are two `#email` instance methods `EmailSender` and `EmailFormatter` modules that are "mixed in" into the class `User` via the `include` method.  When `#email` is invoked on an instance of `User` on line 25, ruby searches the method lookup path for an `#email` method. It first looks in the objects class and since it doesn't find it, it then searches the last module that was included in the class-, which in this case is `EmailSender`.  `EmailSender#email` is found and invoked, but since this method takes 3 parameters, it was expecting 3 arguments to be passed into the invocation on line 25. This is why the `ArgumentError` is thrown.  Presumably the call on line 25 was intended to invoke the `EmailFormatter#email`  method. This can easily be remedied by switching line 16 and 17 around, so `EmailFormatter` is included last in the `User` class thus will be invoked first. If we do that the code works and `"John.Smith@example.com"` is output to the screen.

>Why does the .change_info method not work as expected here?
>
>```ruby
>class GoodDog
>  attr_accessor :name, :height, :weight
>
>  def initialize(n, h, w)
>  	@name = n
>  	@height = h
>  	@weight = w
>  end
>
>  def speak
>  	"#{name} says arf!"
>  end
>
>  def change_info(n, h, w)
>  	name = n
>  	height = h
>  	weight = w
>  end
>
>  def info
>  	"#{name} weighs #{weight} and is #{height} tall."
>  end
>end
>
>sparky.change_info('Spartacus', '24 inches', '45 lbs')
>puts sparky.info      
># => Sparky weighs 10 lbs and is 12 inches tall.
>```
>
>Because on lines 14 to 18 within the `change_info` method definition we have intended to invoke the `name=` `height=` and `weight=` setter methods but Ruby has mistaken this code as local variable initialization so the `change_info` method does not update the state of the object as outputted from line 26. To distinguish between setting a method and local variable initialization within a class, simply prefix the setter method with `self.`. When this is done, the object state will be updated and the code will work as expected. It outputs `Spartacus weighs 45 lbs and is 24 inches tall` when we invoke the `Kernel#puts` method on `sparky.info`. 

>What code snippet can replace the "omitted code" comment to produce the indicated result? 
>
>```ruby
>class Person
>	attr_writer :first_name, :last_name
>
>  def full_name
>  	"#{first_name} #{last_name}"
>  end
>end
>
>mike = Person.new
>mike.first_name = 'Michael'
>mike.last_name = 'Garcia'
>mike.full_name # => 'Michael Garcia'
>```
>
>we can return the full name of the `Person` object `mike` by interpolating the `first_name` and `last_name` getter methods with a space in-between. As a result the string `"Michael Garcia"` is returned from invoking the `full_name` method on `mike`.

>The last line in the above code should return "A". Which method(s) can we add to the Student class so the code works as expected?
>
>```ruby
>class Student
>	attr_accessor :name, :grade
>
>  def initialize(name)
>  	@name = name
>  	@grade = nil
>  end
>  
>  def change_grade(value)
>    self.grade = value
>  end
>end
>
>priya = Student.new("Priya")
>priya.change_grade('A')
>priya.grade # => "A"
>```
>
>The class `Student` requires the instance method `change_grade` to be defined so it can be invoked on line 15.  

>In the example above, why would the following not work?
>
>```ruby
>def change_grade(new_grade)
>	grade = new_grade
>end
>```
>
>because Ruby interprets line 2 as a local variable being initialized. To indicate a setter method, prefix `grade` with `self.`. This tells Ruby you are invoking the setter method `grade=` and passing in `new_grade` as an argument. This will update the instance variable `@grade` which is stored within `grade=` and the changes can now be seen on line 16 via the getter method `grade` being invoked on the Student object `priya`.

>Given the below usage of the Person class, code the class definition.
>
>```ruby
>class Person
>  attr_accessor :name
>  
>  def initialize(name)
>    @name = name
>  end
>end
>
>bob = Person.new('bob')
>bob.name                  # => 'bob'
>bob.name = 'Robert'
>bob.name                  # => 'Robert'
>```

>Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now. Hint: let first_name and last_name be "states" and create an instance method called name that uses those states.
>
>```ruby
>class Person
>  attr_accessor :first_name, :last_name
>  def initialize(str)
>    @first_name, @last_name = str.split
>    @last_name = '' unless @last_name
>  end
>  
>  def name
>    "#{first_name} #{last_name}".strip
>  end
>end
>
>bob = Person.new('Robert')
>p bob.name                  # => 'Robert'
>p bob.first_name            # => 'Robert'
>p bob.last_name             # => ''
>bob.last_name = 'Smith'
>bob.name                  # => 'Robert Smith'
>```

>Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.
>
>```ruby
>class Person
>  attr_accessor :first_name, :last_name
>  def initialize(str)
>    @first_name, @last_name = str.split
>    @last_name = '' unless @last_name
>  end
>  
>  def name
>    "#{first_name} #{last_name}".strip
>  end
>  
>  def name=(full_name)
>  	@first_name, @last_name = full_name.split
>  end
>end
>
>bob = Person.new('Robert')
>bob.name                  # => 'Robert'
>bob.first_name            # => 'Robert'
>bob.last_name             # => ''
>bob.last_name = 'Smith'
>bob.name                  # => 'Robert Smith'
>
>bob.name = "John Adams"
>bob.first_name            # => 'John'
>bob.last_name             # => 'Adams'
>```

>What will this return, and why?
>
>```ruby
>class Animal
>  def initialize(name)
>  	@name = name
>  end
>end
>
>class Dog < Animal
>  def initialize(name); end
>
>  def dog_name
>	  "bark! bark! #{@name} bark! bark!"    
>  end
>end
>
>teddy = Dog.new("Teddy")
>puts teddy.dog_name                       # => ??
>```
>
>the code on line 16 outputs `"bark! bark!  bark! bark!"`. This is because the instance variable `@name` interpolated in the string within the `dog_name` method definition on line 11 was never initialized and therefore returns `nil`. When the `Dog` object `teddy` was instantiated on line 15 via the `new` method, `new` automatically triggers the objects `#initialize` method: `Dog#initialize`. Since it exists it overrides the superclass version `Animal#initialize` and is invoked instead. `Dog#initialize` however does not initialize `@name` instance variable which has the ability to track an objects state, in this case the string "Teddy" assigned to the local variable `name`. It therefore references `nil`.

>What is wrong with the code below? What principle about getter/setter methods does this demonstrate?
>
>```ruby
>class Cat
>  attr_accessor :name
>
>  def initialize(name)
>  	@name = name
>  end
>
>  def rename(new_name)
>  	name = new_name
>  end
>end
>
>kitty = Cat.new('Sophie')
>p kitty.name # "Sophie"
>kitty.rename('Chloe')
>p kitty.name # "Chloe"
>```
>
>The `Cat#rename` method won't work because Ruby will mistake line 9 for local variable initialization rather than invoking the setter method `#name=`. To fix the code prefix the setter method with `self.` so line 16 will now work as expected and return / output `"Chloe"`

>You can see in the make_one_year_older method we have used self. What does self refer to here?
>
>```ruby
>class Cat
>  attr_accessor :type, :age
>
>  def initialize(type)
>    @type = type
>    @age  = 0
>  end
>
>  def make_one_year_older
>    self.age += 1
>  end
>end
>```
>
>Since `self` is placed within the instance method `make_one_year_older`, it refers to the the calling object - an instance of the `Cat` class.

>On which lines in the following code does self refer to an instance of the MeMyselfAndI class referenced by i rather than the class itself? Select all that apply.
>
>```ruby
>class MeMyselfAndI
>  self
>
>  def self.me
>  	self
>  end
>
>  def myself
>  	self
>  end
>end
>
>i = MeMyselfAndI.new
>```
>
>line 9 because `self` inside an instance method refers to the calling object `i`. Every other `self` is outside an instance method but inside the class which indicates the class itself: `MeMyselfAndI`

>Continuing with our Person class definition, what does the below print out?
>
>```ruby
>class Person
>  attr_accessor :name
>
>  def initialize(n)
>  	@name = n
>  end
>end
>
>bob = Person.new("Robert Smith")
>puts "The person's name is: #{bob}"
>```
>
>`The persons name is #<Person:0x00000002a88ef8>` which is the object class and an encoding of the objects ID"

>Let's add a to_s method to the class: Now, what does the below output?
>
>```ruby
>class Person
>	# ... rest of class omitted for brevity
>
>	def to_s
>		name
>	end
>end
>
>bob = Person.new("Robert Smith")
>puts "The person's name is: #{bob}"
>```
>
>`The person's name is: Robert Smith`. This is because interpolation and `Kernel#puts` uses the `to_s` method which has been overridden to display the name of the `Person` object.

>Why does this code not have the expected return value?
>
>```ruby
>class Student
>  attr_accessor :grade
>
>  def initialize(name, grade=nil)
>  	@name = name
>  end
>end
>
>ade = Student.new('Adewale')
>ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
>```
>
>when we reference the `Student` object stored in `ade` it returns and encoding of the objects class and id followed by the instance variables initialized. In this case `@name` is present because it was initialized when `new` invoked the objects `#initialize` method, however `@grade = grade` is absent and therefore it's not initialized. This has nothing to do with `@grade` referencing `nil` as all uninitialized instance variables do when an object is created.

>How can you make this code function? How is this possible?
>
>```ruby
>class Person
>	attr_accessor :name, :age
>
>	def initialize(name, age)
>  	@name = name
>  	@age = age
>	end
>end
>
>bob = Person.new("Bob", 49)
>kim = Person.new("Kim", 33)
>puts "bob is older than kim" if bob > kim
>```
>
>right now on line 12  `#>` is trying to compare if one `Person` object is greater than the other `Person` object. This doesn't make sense of course and will return a `NoMethodError` because in Ruby `#>` is actually a method (not an operator) that's currently undefined in its method lookup path. The good news is we can define `#>` for our custom objects. The intent here is to compare the `age` of `Person` objects `bob` and `kim`. This means we can write something like this:
>
>```ruby
>def >(other)
>  age > other.age				#this code is relying on the Integer#> method
>end
>```
>
>In the method definition above `bob` will invoke the `#>` method and pass in `kim` as an argument. Then both objects can compare `age` instead of the objects themselves. Since `age` references an integer we are relying on the `Integer#>` method. The end result on line 12 gives us a really nice syntax for comparing objects. Note that `#<` is not automatically defined when we define `#>`.

>```ruby
>my_hash = {a: 1, b: 2, c: 3}
>my_hash << {d: 4}  
>```
>
>`#<<` is not a method defined by the Hash class or any other of its ancestors in its method lookup path

>What does the Team#+ method currently return? What is the problem with this? How could you fix this problem?
>
>```ruby
>class Team
>  attr_accessor :name, :members
>
>  def initialize(name)
>    @name = name
>    @members = []
>  end
>
>  def <<(person)
>    members.push person
>  end
>
>  def +(other_team)
>    members + other_team.members
>  end
>end
>
># we'll use the same Person class from earlier
>
>cowboys = Team.new("Dallas Cowboys")
>cowboys << Person.new("Troy Aikman", 48)
>
>niners = Team.new("San Francisco 49ers")
>niners << Person.new("Joe Montana", 59)
>dream_team = cowboys + niners               # what is dream_team?
>```
>
>While this technically works, it doesn't return a new collection object like the conventional standard library does.
>
>for example `Array+` concatenates 2 array objects together and returns a new array object. Ideally you want to do the same for the Team object, since it works like a collection object and may cause confusion otherwise. To do so we can redefine `Team+` like this:
>
> ```ruby
>def +(other)
>  new_team = Team.new("new team")
>  new_team.members = members + other.members
>  new_team
>end
> ```
>
>Now our `#+` returns a new `Team` object with all the `members` concatenated into its state.

