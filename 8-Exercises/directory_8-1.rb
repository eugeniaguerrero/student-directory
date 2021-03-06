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

# and then we print the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
 students.each.with_index(1) do |student, index|
  puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
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
