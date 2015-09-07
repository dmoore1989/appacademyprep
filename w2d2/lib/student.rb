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
    unless courses.include?(course) && student.has_conflict?
      courses << course
      course.students << self
    end
    raise
  end
  
  def course_load
    course_load = {}
    courses.each do |course|
    if course_load[course.department] == nil
      course_load[course.department] = course.credits
    else
      course_load[course.department] += course.credits
    end
    end
    course_load
  end
  
  def has_conflict(course)
    courses.each {|other_course| course.conflicts_with?(other_course)}
  end
    
end
