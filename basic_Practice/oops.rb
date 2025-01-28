# classic example of class and objects
# Child class Dog is inheriting properties of Parent class Animal 
# making instance of the class dog we can call parent's class (Animal) methods
# but you can't call child class methods from parent class
class Animal

    def bark
        puts "This Animal can bark!"
    end

    def legs
        puts "This Animal have 4 legs"
    end
end

class Dog < Animal

    def name
        puts "My name is bunny"
    end
end

# Dog.new.legs
# Animal.new.name


# Encapsulation
# Private and Protected methods can't be accessed outside the class
class BankAccount

    def initialize(balance)
        @balance = balance
    end
    

    def deposit(amount)
        @balance += amount
        puts "Deposit is done Successfully"
    end

    def withDraw(amount)
        if amount > balance
            puts "Insufficient funds"
        elsif
            amount -= balance
            puts "Your trasaction is been updated"
        end
    end

    def display_balance
        puts "Current balance: #{@balance}"
    end

    protected

    def update_balance(amount)
        @balance += amaount
        puts "Your balance is been updated"
    end
end

# account = BankAccount.new(100)
# account.update_balance(50)
# amaount.display_balance

# Polymorphism

class Animal

    def speak
        raise "Subclass must implement speak method"
    end
end

class Dog < Animal
    def speak
        puts "Dog is speaking"
    end
end

class Cat < Animal
    def speak
        puts "Cat also can speak"
    end
end

animals = [Dog.new, Cat.new]
animals.each {|animal| animal.speak}

# Abstraction

class Shape
    def initialize(radius)
        @radius = radius
    end


    def Area(radius)
        raise "This method will overridden"
    end
end

class Cricle < Shape
    def Area(radius)
       r = 3.14 * @radius * @radius
       return r
    end
end

xy = Cricle.new(5).Area(5)

# puts "radius of the circle: #{xy}"

# circle = Cricle.new(5)
# xx = circle.Area
# puts "This is the area of the circle: #{xx}"


class Animal
    def speak
        puts "Animal Speak"
    end

    private
    def eat
        puts "Animal eat"
    end


end

class Dog < Animal
    def dog_eat
        eat
    end
end

dog = Dog.new
dog.dog_eat