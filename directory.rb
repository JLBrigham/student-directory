def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  #add the student hash to the array
  students << {name: :name, cohort: :november}
  puts "Now we have #{students.count} students"
  # get another name from the user
  name = gets.chomp
  end
  # return the array of input_students
  students
end

def print_header
puts "The students of Villains Academy".center(80)
puts "-------------".center(80)
end

def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(80)
  end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students".center(80)
end

def sorted_by_cohort(students)
 sorted_by_cohort = {}

 students.each do |student|
   cohort = student[:cohort]
   name = student[:name]

   if sorted_by_cohort[cohort] == nil
     sorted_by_cohort[cohort] = [name]
     else
     sorted_by_cohort[cohort].push(name)
   end


  end

   sorted_by_cohort.each do|cohort, name|
    puts cohort.upcase
    puts name
  end

end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
sorted_by_cohort(students)
