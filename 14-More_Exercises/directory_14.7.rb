require 'csv'

@students = [] #an empty array accessible to all methods

def add_students
  @students << {name: @name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  #get the first name
  @name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !@name.empty? do
    #add the student hash to the array
    add_students
    if @students.count > 1
      puts "Now we have #{@students.count} students."
    else
      puts "Now we have #{@students.count} student."
    end
    @name = STDIN.gets.chomp #get another name from the user
  end
end

# and then we print the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
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
    process(STDIN.gets.chomp)
  end
end

def process(selection)
    case selection
    when "1" #input the students
      input_students
    when "2" #show the students
      puts "Here are the students:"
      show_students
    when "3"
      save_students
      puts "The list of student(s) has been saved."
    when "4"
      puts "Loading the list of student(s)..."
      load_students
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
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  #open the file for writing
 CSV.open("students.csv", "w") do |csv|
  @students.each do |student| #iterate over the array of students
    student_data = [student[:name], student[:cohort]]
    csv << student_data
  end
 end
 puts "Saving student data..."
end

def load_students(filename = "students.csv")
  CSV.foreach(filename, "r").each do |name, cohort|
  @students << {name: name, cohort: cohort.to_sym}
 end
puts "Loading students..."
end

#@students << {name: row[0], cohort: row[1].to_sym}

def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil? #open students.csv if no argument is given
    load_students("students.csv")
    puts "Loaded #{@students.count} students from students.csv."
  elsif File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} students from #{filename}."
  else #if it doesn't exist
    puts "Sorry, #{filename} does not exist."
    exit #quit the program
  end
end

try_load_students
interactive_menu
