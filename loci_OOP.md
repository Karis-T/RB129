#### <u>Master Bedroom</u>: Equivalence & Fake Operators

- **hat and coat stand:**
- **lamp:**
- **shelf**
- **window**
- **rug**
- **bed**
- **lamp**
- **side table**
- **wardrobe**

#### <u>Bathroom</u>: Modules

- **toilet:** Like classes modules are containers for shared behavior.
- **shower:** Classes in Ruby however can only provide single inheritance whereas Modules are Ruby's way of providing multiple inheritance via mixins. 
- **towel rail:** Mixins are when we mix in as many modules as we like into any class via the include method. This is where we extend the module's functionality to the objects of that class. This is known as interface inheritance. 
- **sink:** When we don't want to create duplication in our code or when we wish to restrict some methods to a subclass and not its superclass, interface inheritance are an ideal candidate over class inheritance.
- **sink plant:** Unlike classes however Modules cannot instantiate objects. 
- **bath:**  They instead have a "has a" relationship with objects. eg. The dog "has a" ability to swim. 
- **bath flowers:** Modules aren't just for mixins, they can also be used to construct namespaces. This is where we can group related classes together under a module to prevent collision with other similarly named modules. To locate a class in a module we first qualify it with the modules name followed by :: and then the class name.
- **window:**  We can also use modules to contain methods that seem out of place with your code. These are called module methods and are invoked directly on the module itself Be careful not to include these into your classes as they cannot be invoked by the class or its object.

#### <u>Family/Dining</u>: Objects

- **dining table & chairs**: Objects are instantiated from classes, which are like the blueprint that makes up an object
- **floor lamp:** Objects are instantiated from classes via new method invocation on the desired class. new creates an instance of that class and then triggers its constructor - the initialize method, passing through any arguments from new through to initialize as local variables. These variables are assigned to instance variables which track the object's state. This whole process returns a new object.
- **sliding door:** instance variables prefixed with an @ symbol and are used to track the state of an object - what an object is like. They are scoped at the object level meaning each object has their own copy which does not crossover to other objects of the same class. They exist as long as the object exists which is why they reference nil if they are not initialized. 
- **Christmas tree:** instance methods represents the behavior of an object and are used to operate on the state of the object. They are invoked directly on the object themselves.
- **table lamp 1:**
- **shelf:**
- **table lamp 2:**
- **tv:**
- **plants:** 
- **window:** 
- **couch:** 
- **rug:**

#### <u>Kitchen</u>: Classes, & OOP

- **table & chairs**: What is OOP? A paradigm that uses Containers to store data In order to deal with the growing size and complexities of bigger programs.
- **Blue pot plant:**  Instead of having to deal with waves of errors if we made a change because there's too many dependencies, these containers work together as the sum of small-moving parts, building a more stable reliable program
- **sliding door**: benefits of OOP: 
  - think more abstractly about the program you're writing, 
  - easier to conceptualize objects as nouns. 
  - expose only the functionality to parts of the code that need it
  - reduces duplication in our code
  -  build apps faster with pre written code
  - complexity is more easily managed with small moving parts
- **counter**: Class define objects. Think of classes as a mold and objects are what produced out of these molds. 
- **kitchen sink**:
- **window**:
- **stove**:
- **range hood**:
- **bin**
- **fridge**
- **2nd counter**
- **microwave**

#### **<u>Study</u>: Method Access Control, Lookup Path, Accidental Overriding**

- **shelf**:
- **floor lamp**:
- **keyboard**:
- **window**:
- **desk**:
- **desk lamp**:
- **2nd desk**:
- **2nd desk lamp**:
- **bin**:

#### **<u>Guest Bedroom</u>: to_s, self, super, constants**

- **step ladder**:
- **side table**:
- **lamp:**
- **window:**
- **bed:**
- **mirror:**