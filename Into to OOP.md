# Intro to OOP

---

## Procedural vs OOP:

**Object Definition:** an entity that contains *both* data and behavior
(the word *both* is the key difference between OOP and procedural)

- we already think in terms of objects: when you look at a person, you see that person as an object.
- an object is defined by 2 terms:
  - attributes - (a person has attributes (eye color, age, height etc))
  - behaviors  - (a person can walk, talk, breath etc)
- in procedural programming, code is placed in global methods where they become like "black boxes" , in that inputs go in and outputs come out.
- data is placed into separate structures and is manipulated by global method invocation

```ruby
def some_method(word) 				 # blackbox
  "hi " + "word"
end

some_method("there") 					 # inputs go in
=> "hi there" 								# outputs go out
```

- In procedural attributes and behaviors are normally separated. 
- In OOP however, attributes and behaviors are contained within s single object.

```ruby
class Dog
  def initialize(color, type) 									# attributes
    @color = color
    @type = type
  end
  
  def bark																		# behaviours
    "Woof!"
  end
end

ollie = Dog.new("white and brown", "mixed corgi") # attributes and behaviours are contained in a single object
```

```ruby
def bark																							# behaviours
	"Woof!"
end

ollie =  {color: "white and brown", type: "mixed corgi"} 	# attributes separated from behaviours
ollie[:sound] = bark
=> "woof!"
```

- in procedural programming the data is often separated from the procedures and often times the data is global - so its easy to modify the data that's outside your code.
- This means access to the data is uncontrolled and unpredictable (variables (data) have access to global methods)
- Because of the lack of control over who has access to the data, testing and debugging becomes more difficult

```ruby
def bark																		# global method
	"Woof!"
end

ollie =  {animal: "dog", breed: "corgi mix"} 	 # ollie is a dog that has access to the bark method
ollie[:sound] = bark
=> "woof!"

gussy = {animal: "cat", breed: "tabby"}				# gussy is a cat that also has access to the bark method
gussy[:sound] = bark
=> "woof!"																	# too much access leads to unpredicatable results 
```

- when properly designed, there's no such thing as global data in an OO model. This fact provides a high amount of data integrity in OO systems.
- objects are much more than primitive data structures/types like integers and strings. 
- Although objects contain entities like integers and strings - which are used to represent attributes, they also contain methods, which represents behaviours.
- In an object, methods are used to perform operations on the data as as well as other actions.
- You can also control access to members of an object (both attributes/methods) which means they can be hidden from other objects

```ruby
class MyObject
  attr_reader :math
  def initialize
    @math = Maths.new(5, 2)
  end
end
class Maths
  attr_accessor :int1 , :int2 
  def initialize(int1, int2)
  	@int1 = int1
  	@int2 = int2
  end
  
  def sum
    @int1 + @int2
  end
end
my_object = MyObject.new
```

- For instance, an object called `math` might contain two integers: `int1` and `int2`. `Math` also contains the necessary methods to set and retrieve the values of `int1` and `int2`. It might also contain a method called `sum` to add the two integers together.
- restricting access to certain attributes/methods is called **data hiding**
- By combining the attributes and methods inside the same entity, which in OO is known
  as **encapsulation**,we can control access to the data in the `math` object. 
- By defining these integers as off-limits, *another logically unconnected function cannot manipulate the integers* `int1` and `int2`—only the `math` object can do that.
- If another object—for example, `my_object`—wants to gain access to the
  `sum` of `int1` and `int2`? It asks the `math` object: `my_object` sends a message to the `math` object.
- **Two objects communicate with each other via their methods** .
- The message is really a call to the `math` object’s `sum` method.
- The `sum` method then returns the value to `my_object`.

```ruby
my_object.math.sum	# my_object calls the math object and asks for it's sum
=> 7							 # math object sums numbers and returns it to my_object
```

- `my_object` does not need to know how the `sum` is calculated.
- With this design methodology in place, you can change how the `math` object calculates the `sum` without making a change to `my_object` 
- Calculating the `sum` is not the responsibility of `my_object`—it’s the `math` object’s responsibility.
- As long as `my_object` has access to the `math` object, it can send the appropriate
  messages and obtain the proper result. 
- In general, **objects should not manipulate the internal data of other objects** (that is, `my_object` should not directly change the value of `int1` and `int2`)

## From Procedural to OOP:

- in Procedural programming, you'd normally have to separate the data of a system from the operations that manipulate the data. 
- For example, if you want to send information across a network, only the relevant data is sent with the expectation that the program at the other end of the network pipe knows what to do with it.
- The advantage of OO programming is that the data and the operations that
  manipulate the data (the code) are both encapsulated in the object. 
- For example, when an object is transported across a network, the entire object, including the data and behavior, goes with it. 

## What is an object?

- Objects are the building blocks of an OO program. 
- A program that uses OO technology is basically a collection of objects.
- The data stored within an object represents the state of the object. 
- In OO programming terminology, this data is called attributes. 
- The attributes contain the information that differentiates between the various objects,
- The behavior of an object is what the object can do. 
- In procedural languages the behavior is defined by procedures, functions, and subroutines. 
- In OO programming terminology these behaviors are contained in methods, and you invoke a method by sending a message to it. 
- an object can set and return the values of the various attributes it has. This is called getters and setters.
- when another object needs this information, it can send a message to an object and ask it what its attributes are.
- In .NET techniques, the getters and setters are actually considered properties of the data itself.
- In this approach, the getters and setters are actually properties of the attributes—in this
  case, Name. Regardless of the approach, the purpose is the same—controlled access to the attribute.
- The concept of getters and setters supports the concept of data hiding. 
- other objects should not directly manipulate data within another object, the getters and setters provide controlled access to an object’s data. 
- Getters and setters are sometimes called accessor methods and mutator methods, respectively.
- Note that we are only showing the interface of the methods, and not the implementation.

```ruby
class Employee
  attr_accessor :ssn, :gender, :dob
  def initialize(ssn, gender, dob)
    @ssn = ssn
    @gender = gender
    @dob = dob
  end
end

class Payroll
  def pay(ssn)
  end
  def calculate_pay
  end
end

company_payroll = Payroll.new
jenny = Employee.new(124200, "female", "12/11/1999")
```

- the Payroll object `company_payroll` contains a method called `CalculatePay()` that calculates the pay for a specific employee.
- Among other information, the `company_payroll` must obtain the Social Security number of the employee `jenny`.
- To get this information, `company_payroll` must send a message to `jenny` (in this case, the `ssn` method). 

```ruby
company_payroll.pay(jenny.ssn)
```

- Basically, this means that the Payroll object calls the `ssn` method of the Employee object. The employee object -- `jenny`--recognizes the message and returns the requested information.

