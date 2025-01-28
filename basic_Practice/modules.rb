# Modules is like a tool box with the collection of various methods and constants
# Modules have 2 main purpose
# 1. Mixin modules 
# 2. Namespace modules

module Greetable
    def greet(name)
        puts "hello, #{name}"
    end
end

class Person
extend Greetable

    attr_accessor :name
    def initialize(name)
        @name = name
    end
end 

class Dog
    extend Greetable
    attr_accessor :name

    def initialize(name)
        @name = name
    end
end

# p = Person.new("Aman")
# p.greet

# Person.greet("Aman")


module Greetable
    def greet(name)
      puts "Hello, #{name} from the module!"
    end
end
  
class Person
    prepend Greetable
  
    attr_accessor :name
    
    def initialize(name)
      @name = name
    end
  
    def greet(name)
      puts "Hello, #{name} from the class!"
    end
end
  
  class Dog
    prepend Greetable
  
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  
    def greet(name)
      puts "Hello, #{name} from the class!"
    end
  end
  
  p = Person.new("Alice")
  p.greet("Alice")  

  Pr = Person.greet("aman")
  
  d = Dog.new("Buddy")
  d.greet("Buddy")  