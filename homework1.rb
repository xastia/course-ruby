require 'date'


class Student
    attr_accessor :last_name, :first_name, :date_of_birth

    
    @@students = []

    def initialize(last_name, first_name, date_of_birth)
        if date_of_birth >= Date.today 
            raise ArgumentError, 'Not valid date of birth'
        end

        @last_name = last_name
        @first_name = first_name
        @date_of_birth = date_of_birth
        add_student
    end

    def add_student
    
        existing_student = @@students.find do |student|
          student.first_name == first_name &&
          student.last_name == last_name &&
          student.date_of_birth == date_of_birth
        end
      
        @@students.push(self) unless existing_student
      
      
    end

    def remove_student
        @@students.delete(self)
    end

    def calculate_age
        today = Date.today
        
        age = if (today.month > date_of_birth.month) || (today.month == date_of_birth.month && today.day >= date_of_birth.day)
                today.year - date_of_birth.year
              else
                today.year - date_of_birth.year - 1
              end
        age
    end

     
    def self.get_students_by_age(age)
        @@students.select { |student| student.calculate_age == age }

    end

    def self.get_students_by_name(name)
        @@students.select { |student| student.first_name == name }
    end
    
end



