@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
    exit #this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
end
end

def input_students
  get_student_name
  # while the name is not empty, repeat this code
  while !@name.empty? do
    puts "What is their cohort"
  @cohort = STDIN.gets.chomp
  if @cohort.empty?
    @cohort = "default"
  end
  #add the student hash to the array
  add_students
  student_count
  # get another name from the user
@name = STDIN.gets.chomp
end
end
  # return the array of input_students



def show_students
  print_header
  print_student_list
  print_footer
end


def print_header
puts "The students of Villains Academy".center(80)
puts "-------------".center(80)
end

def print_student_list
  @students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(80)
  end
end

def print_footer
puts "Overall, we have #{@students.count} great students".center(80)
end

def save_students
#open the file for writing
file = File.open("students.csv", "w")
#iterate over the array of save_students
@students.each do |student|
  student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
end
file.close
puts "You successfully saved the students to the file."
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(',')
    add_students
  end
  file.close
puts "You successfully loaded the students to the file"
end

def try_load_students(filename = "students.csv")
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
puts "Loaded #{@students.count} from #{filename}"
else
  puts "Sorry, #{filename} doesn't exist.}"
  exit
end
end

def add_students
  @students << {name: @name, cohort: @cohort}
end

def student_count
  if @students.count == 1
  puts "Now we have #{@students.count} student. Give me the next name"
  else
    puts "Now we have #{@students.count} students. Give me the next name"
  # get another name from the user
  end
end

def get_student_name
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
end

#def get_student_cohort
  #while !@name.empty? do
    #puts "What is their cohort"
  #@cohort = STDIN.gets.chomp
  #if @cohort.empty?
    #@cohort = "default"
  #end
#end
#@name = STDIN.gets.chomp
#end

try_load_students
interactive_menu
#def sorted_by_cohort(students)
 #sorted_by_cohort = {}

 #students.each do |student|
   #cohort = student[:cohort]
   #name = student[:name]

   #if sorted_by_cohort[cohort] == nil
     #sorted_by_cohort[cohort] = [name]
     #else
     #sorted_by_cohort[cohort].push(name)
   #end


  #end

   #sorted_by_cohort.each do|cohort, name|
    #puts cohort.upcase
    #puts name
  #end

#end


#nothing happens until we call the methods
