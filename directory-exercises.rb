#  #we put all the students into an array
#  students = [
#  {name: "Dr. Hannibal Lector", cohort: :november},
#  {name: "Darth Vader", cohort: :november},
#  {name: "Nurse Ratched", cohort: :november},
#  {name: "Michael Corleone", cohort: :november},
#  {name: "Alex DeLarge", cohort: :november},
#  {name: "The Wicked Witch of the West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "Freddy Kreuger", cohort: :november},
#  {name: "The Joker", cohort: :november},
#  {name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november}
# ]

def print_header
   puts "The students of Villains Academy",
        "-----------"
end

def print(students, letter)
  students.each do |student|
    if student[:name][0] == letter.upcase
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students."
end

def input_students
  puts "Please enter the names of the students",
        "To finish, just hit return twice."
  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :November}
    puts "Now we have #{students.count}"
    name = gets.chomp
  end
  students
end

#nothing happens until we call the methods
students = input_students
print_header
print(students, "a")
print_footer(students)
