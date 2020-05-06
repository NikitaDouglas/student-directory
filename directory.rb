require 'csv'

@students = [] # an empty array accessible to all methods


#show_students methods

def show_students
  show_students_header
  show_students_list
  show_students_footer
end

def show_students_header
   puts "\nThe students of Villains Academy",
        "-----------"
end

def show_students_list
  @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def show_students_footer
  puts "\nOverall we have #{@students.count} great students."
end

#input students
def input_students
  puts "\nPlease enter the names of the students.",
        "To finish, just hit return twice."

  loop  do
    name = STDIN.gets.chomp
    break if name.empty?
    add_student(name, "November")
    puts "Now we have #{@students.count}"
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

#add students
def save_students
  CSV.open(@filename, "w") do |file|
    @students.each do |student|
      file << ([student[:name], student[:cohort]])
    end
  end
  puts "\nStudents saved to #{@filename}."
end

#load students
def load_file
  CSV.open(@filename, "r") do |file|
    file.each do |line|
      name, cohort = line
      add_student(name, cohort)
    end
  end
  puts "Loaded #{@students.count} from #{@filename}."
end

def try_load_file
  @filename = ARGV.first
  if @filename.nil?
    @filename = "students.csv"
  end

  if File.exists?(@filename)
    load_file()
  else
    puts "Sorry #{@filename} doesn't exist."
  end
end

def print_menu
  puts "\n1. Input the students.",
       "2. Show the students.",
       "3. Save the list to students.csv.",
       "4. Load the students from students.csv",
       "9. Exit."
end

def choose_file(use)
  puts "\nPlease enter the name of the file you'd like to #{use}.",
       "The default file is students.csv.",
       "If you'd like to use the default, just hit return twice."
  file = STDIN.gets.chomp
    if !file.empty?
      @filename = file
    else
      @filename = "students.csv"
    end
end


def pick_option(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      choose_file("save")
      save_students
    when "4"
      choose_file("load")
        if @filename == "students.csv"
          puts "\nThe file #{@filename} is already loaded."
        else
          load_file
        end
    when "9"
      puts "\nThanks for using the Student Directory - bye!\n"
      exit
    else
      puts "\nI don't know what you mean, please try again."
  end
end

#menu
def interactive_menu
  loop do
    print_menu
    pick_option(STDIN.gets.chomp)
  end
end

#nothing happens until we call the methods
try_load_students
interactive_menu
