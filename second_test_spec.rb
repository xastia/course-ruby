require 'minitest/autorun'
require 'minitest/spec'
require_relative 'test_helper'
require_relative 'homework1'

describe Student do
    let(:student) {Student.new("Dvoret", "Anastasiia", Date.new(2004, 05, 16))}

    it "#calculate_age" do 
      expect(student.calculate_age).must_equal 20
    end

    it "#get_students_by_name" do
      student1 = Student.new("Dvoretska", "Anastasiia", Date.new(2005, 05, 16))
      student2 = Student.new("Dvoret", "Anastasiia", Date.new(2004, 05, 16))
      student3 = Student.new("Dvor", "Lera", Date.new(2006, 10, 16))
      expected_array = [student1, student2]
      expect(Student.get_students_by_name("Anastasiia")).must_equal expected_array
    end

    it "#date_of_birth_validation" do
      expect {Student.new("Dvoretska", "Anastasiia", Date.new(2025, 05, 16))}.must_raise ArgumentError
    end
end