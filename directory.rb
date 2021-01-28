@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is their cohort"
  cohort = gets.chomp
  if cohort.empty?
    cohort = "default"
  end
  #add the student hash to the array
  @students << {name: name, cohort: cohort}

  if @students.count == 1
  puts "Now we have #{@students.count} student. Give me the next name"
  else
    puts "Now we have #{@students.count} students. Give me the next name"
  # get another name from the user
  end
  # get another name from the user
  name = gets.chomp
  end
  # return the array of input_students
end


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit #this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
end
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
interactive_menu
