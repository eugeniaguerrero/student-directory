def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

# then we print the list of students
# with a method which prints a student's name if it starts with T
def print(students)
# loops through each student
  students.each_with_index() do |student, index|
# if the name begins with letter
  if student[:name].downcase.start_with? 't' #checks if name start with T
    puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
# finally, we print the total count of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
