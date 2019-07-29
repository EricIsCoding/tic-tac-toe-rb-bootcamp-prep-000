WIN_COMBINATIONS = [
 [0, 1, 2],
 [3, 4, 5],
 [6, 7, 8],
 [8, 4, 0],
 [6, 4, 2],
 [0, 3, 6],
 [1, 4, 7],
 [8, 5, 2]
]
board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
 user_input.to_i - 1
end

def move(board, input_to_index, character = "X")
  board[input_to_index] = character
end

def position_taken?(board, index)
if board[index] == " "
 return board[index] != " "
 elsif board[index] == ""
 return board[index] != ""
 elsif board[index] == nil
 return board[index] != nil
 elsif board[index] == "X"
 return board[index] == "X"
 elsif board[index] == "O"
 return board[index] == "O"
end
end
def valid_move?(board, index)
if !position_taken?(board,index) && index <= 8 && index >= 0
  return true
end
end
def turn(board)
 puts "Please enter 1-9:"
 user_input = gets.strip
 index = input_to_index(user_input)
   if valid_move?(board, index)
     move(board, index)
     puts display_board(board)
   else
     puts "Please enter 1-9:"
   end
end
def turn_count(board)
turns = 0
while turns <= 9
board.each do |position|
 if position == "X" || position == "O"
 turns += 1
end
end
return turns
end
end
def current_player(board)
 if turn_count(board) % 2 == 0
   return "X"
 else return "O"
end
end
def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return win_combination
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win_combination
   end
 end
 false
end
def full?(board)
 board.none?{|space| space == " "}
end
def draw?(board)
 if won?(board) == false && full?(board) == true
   return true
 else false
 end
end
def over?(board)
 if won?(board) || full?(board) || draw?(board)
   return true
 else
   return false
 end
end
def winner(board)
WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return "X"
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return "O"
   elsif won?(board) == false
   return nil
   end
 end
end
def play(board)
input = gets
until over?(board) == true
puts false
end
end