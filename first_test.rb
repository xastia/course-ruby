require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'homework1'

Minitest::Reporters.use! [
                           Minitest::Reporters::SpecReporter.new,
                           Minitest::Reporters::HtmlReporter.new(
                            reports_dir: 'reports',
                            report_filename: 'test_results.html',
                            clean: true,
                            add_timestamp: true
                           )
                         ]

class FirstTest < Minitest::Test
    
    def test_calculate_age
        student = Student.new("Dvoretska", "Anastasiia", Date.new(2005, 05, 16))
        assert_equal(student.calculate_age, 19, "Age must be 19!!")
    end

    def test_raising_error
        assert_raises "Not valid date of birth" do
            Student.new("Dvoretska", "Anastasiia", Date.today)
        end
    end

    def test_get_students_by_age
        student1 = Student.new("Dvoretska", "Anastasiia", Date.new(2005, 05, 16))
        student2 = Student.new("Dvoret", "Anastasiia", Date.new(2004, 05, 16))
        student3 = Student.new("Dvor", "Anastasiia", Date.new(2005, 10, 16))
        expected_array = [student1, student3]
        assert_equal expected_array, Student.get_students_by_age(19)

    end
end

