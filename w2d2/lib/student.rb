class Student
  attr_accessor :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end
  
  def name
    first_name + ' '  + last_name
  end
  
  def enroll(course)
  
    if @courses.include?(course)
      return nil
    end
    if has_conflict?(course)
      raise "course causes conflict!"
    end
    @courses << course
    course.students << self
  end
  
  def course_load
    course_load = Hash.new(0)
    courses.each do |course|
      course_load[course.department] += course.credits
    end
    course_load
  end
  
  def has_conflict?(course)
    courses.each do |other_course| 
      if other_course.conflicts_with?(course)
        return true
      end
    end
    false
  end
  
end
