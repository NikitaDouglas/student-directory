@students = [] # an empty array accessible to all methods

def print_header
   puts "\nThe students of Villains Academy",
        "-----------"
end

def print_students_list(students)
  @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall we have #{@students.count} great students."
end

def input_students
  puts "Please enter the names of the students",
        "To finish, just hit return twice."
  name = gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :November}
    puts "Now we have #{@students.count}"
    name = gets.chomp
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym}
    end
  file.close
end

def print_menu
  puts "\n1. Input the students.",
       "2. Show the students.",
       "3. Save the list to students.csv",
       "4. Load the list from students.csv",
       "9. Exit."
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "\nI don't know what you mean, please try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

#nothing happens until we call the methods
interactive_menu
