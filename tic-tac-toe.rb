board = {}
user = 'o'

def draw(our_board)
  i = 0
  while i < 9 do
    puts if i % 3 == 0
    value = our_board[i]
    if value
      print "[ #{value} ] "
    else 
      print "[ #{i} ] "
    end
    i += 1
  end
  puts
end


loop do
  draw(board)
  print "Where do you want to place your #{user}? "
  field = gets.chomp.to_i

  if board[field]
    puts "You stupid woman! Can't you see the field is occupied? "
    next
  end  
  if field == 9
    puts "NEIN!"
    next
  end
  if field < 0 || field > 8
    puts "You stupid woman! Can't you count for France? "
    next
  end
  board[field] = user
  
  if user == 'o'
    user = 'x'
  else
    user = 'o'
  end
end
