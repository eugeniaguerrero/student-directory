def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  #create an empty array
  students = []
  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  #get the first name
  puts "What is the name of the student?"
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
  puts "What cohort to they belong to?"
  cohort = gets.chomp
  if cohort.empty?
    cohort = "March"
  #makes sure the given string is converted to a symbol
  elsif !cohorts.include? cohort.downcase.to_sym
    until cohorts.include? cohort.downcase.to_sym
      puts "I didn't understand that. Please try again."
      cohort = gets.chomp
    end
  end
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "Please enter another student's name (or hit return to finish)."
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
