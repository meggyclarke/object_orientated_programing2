class Person
    attr_accessor :first_name, :last_name

    def initialize (first_name, last_name)
        @first_name = first_name
        @last_name = last_name

    end

    def full_name
        "#{@first_name} #{@last_name}"
    end

    def greetings
        "Hi, I am #{full_name}"
    end

end

class Instructor < Person

    def full_name
            "Instructor #{super}"
    end

    def teach
        puts "Everything in Ruby is an object."
    end
end

class Student < Person

    def full_name
            "Sudent #{super}"
    end

    def learn
        puts "I get it"
    end
end

chris = Instructor.new("Chris", "Christopherson")
christina = Student.new("Christina", "Christmas")

puts chris.greetings
puts christina.greetings

puts chris.teach
puts christina.learn
