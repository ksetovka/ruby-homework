def add_employee(employees)
  puts '[Add an employee]'
  print 'Full name: '
  full_name = gets.chomp
  print 'ID: '
  id = gets.chomp
  print 'Is the person a [p]rogrammer, [o]ffice manager? '
  person = gets.chomp
  employee = {
    full_name: full_name,
    id: id
  }
  if person == 'p'
    print 'What languages do they know? '
    employee[:languages] = gets.chomp.split(",")
  elsif person == 'o'
    print 'What office do they manage? '
    employee[:office] = gets.chomp
  end 
 
  employees << employee
end

def view_employees(employees)
  sorted_employees(employees).each do |employee|
    puts "#{employee[:full_name]}, #{employee[:id]}, #{employee[:languages]}, #{employee[:office]}"
  end
end

def sorted_employees(employees)
 print 'Sort by: first name or last name? '
 fifi = gets.chomp
 employees.sort_by do |employee|
   name_parts = employee[:full_name].split(' ')

   if fifi == "f"
     name_parts.first
   else
     name_parts.last
   end
 end
end

def edit_employees(employees)
 puts '[Edit an employee]'
 print 'id: '
 id = gets.chomp
 employee = employees.find { |x| x[:id] == id }
 puts "Current name: #{employee[:full_name]}"
 print 'Full name: '
 full_name = gets.chomp
 puts "Current ID: #{employee[:id]}"
 print 'ID: '
 id = gets.chomp
 if employee[:languages]
   puts "Current languages: #{employee[:languages]}"
   print 'What languages do they know? '
    employee[:languages] = gets.chomp.split(",")
 elsif employee[:office]
   puts "Current office: #{employee[:office]}"
   print 'What office do they manage? '
    employee[:office] = gets.chomp
 end
 employee[:full_name] = full_name
 employee[:id] = id
end

def quit
  puts 'Goodbye!'
  exit
end

def print_help
  puts '[HELP]'
  puts 'Enter one of the following:'
  puts 'a - to add a new employee'
  puts 'v - to view existing employees'
  puts 'e - to edit existing employees'
  puts 'q - to quit the program'
end

employees = []

# Main program starts here

puts 'Employee-o-matic 4000'

loop do
  print 'What do you want to do? '
  action = gets.downcase[0]

  case action
  when 'a' then add_employee(employees)
  when 'v' then view_employees(employees)
  when 'e' then edit_employees(employees)
  when 'q' then quit
  else
    print_help
  end
end
