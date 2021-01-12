A class defines an object. Think of it like a blueprint or mould for an object. Objects are what are produced out of those moulds, they are instantiated from classes.

```ruby
class Dog
  def initialize(name)
    @name = name
  end
  
  def sound
    puts "#{@name} barks!"
  end
end

ollie = Dog.new("Ollie")
ollie.sound
```