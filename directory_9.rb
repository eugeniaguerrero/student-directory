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
    students << {name: name, cohort: cohort}
    if students.count > 1
      puts "Now we have #{students.count} students."
    else
      puts "Now we have #{students.count} student."
    end
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
 students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
 end
end
# finally, we print the total count of students
def print_footer(names)
  if students.count > 1
    puts "Overall, we have #{names.count} great students."
  else
    puts "Overall, we have #{names.count} great student."
  end
end

def interactive_menu
  students = []
  loop do #goes back to step 1 after an action has been taken
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
    when "1" #input the students
      students = input_students
    when "2" #show the students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #this will cause the program to end
    else
      puts "I do not know what you meant, try again."
    end
   end
  end

interactive_menu
