@students = [] #an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    if @students.count > 1
      puts "Now we have #{@students.count} students."
    else
      puts "Now we have #{@students.count} student."
    end
    name = gets.chomp #get another name from the user
  end
end

# and then we print the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list(students)
 @students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
 end
end
# finally, we print the total count of students
def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students."
  else
    puts "Overall, we have #{@students.count} great student."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
    case selection
    when "1" #input the students
      input_students
    when "2" #show the students
      show_students
    when "3"
      save_students
    when "9"
      exit #this will cause the program to end
    else
      puts "I do not know what you meant, try again."
    end
   end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
