def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def input_students
  puts "Please enter the names of the student. To finish, press enter twice."
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is their hobby?"
    hobby = gets.chomp.downcase
    puts "What is their nationality?"
    nationality = gets.chomp
    #add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, nationality: nationality}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "Please enter the names of the student. To finish, press enter twice."
    name = gets.chomp
  end
  #return the array of students
  students
end

# then we print the list of students

def print(students)
# prints and indexes each student's name
i = 0
while i < students.count
  # #{i+1} allows the count to start from 1 instead of 0
    puts """#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} cohort).
Likes #{students[i][:hobby]} and is #{students[i][:nationality]}."""
    i += 1
    end
end

# finally, we print the total count of students
def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
