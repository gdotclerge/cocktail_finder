
class RunHelper

def self.welcome_message
  puts
  puts "* * * * * * * * * * * * * * * * * * * *"
  puts "*   Welcome to the Cocktail Finder!   *"
  puts "* * * * * * * * * * * * * * * * * * * *"
  puts
end

def self.get_ingredient_input
  @@ingredient_input = STDIN.gets.chomp
end

def self.ingredient_input
  @@ingredient_input
end

def self.ask_for_ingredient_input
  puts
  puts "What ingredient should your drink have?"
  puts
  RunHelper.get_ingredient_input
end

def self.ask_for_new_ingredient_input
  puts
  puts "What new ingredient should your drink have?"
  puts
  RunHelper.get_ingredient_input
end



def self.return_array_of_drink_objects_with_ingredient_input
  # returns array of drinks that contain ingredient
  # given in self.get_what_would_you_like
  # itterate thru all drinks and find drinks cotaining
  # ingredient1_input.
  if Ingredient.all.find do |ingredient|
    ingredient.name.downcase.include?(RunHelper.ingredient_input.downcase)
  end == nil
  @@array_of_drink_objects = []
  else
  @@array_of_drink_objects = Ingredient.all.find do |ingredient|
    ingredient.name.downcase.include?(RunHelper.ingredient_input.downcase)
  end.drinks.uniq
end
end

def self.refine_array_of_drink_objects_with_new_ingredient_input
  ingredient_obj = Ingredient.all.find do |ingredient|
    ingredient.name.downcase.include?(RunHelper.ingredient_input.downcase)
  end
    @@array_of_drink_objects = @@array_of_drink_objects.select do |drink|
      drink.ingredients.include?(ingredient_obj)
    end
end

# Ingredient.all.find do |ingredient|
#   ingredient.name.downcase.include?(RunHelper.ingredient_input.downcase)
# end


def self.list_drinks_in_array_of_drink_objects
  @@array_of_drink_objects.each {
    |drink|
    puts drink.name
  }
end

def self.get_users_drink
  @@drink_input = STDIN.gets.chomp
end

def self.users_drink
  @@drink_input
end

def self.asks_for_users_drink
  puts
  puts "What recipe would you like to see? Please type name as seen above"
  puts
  RunHelper.get_users_drink
end

def self.recipe_for_users_drink
  drink = Drink.all.find do |drink|
    drink.name.downcase == @@drink_input.downcase
  end
  if drink
  drink.measurements.each do |measurement|
    puts measurement.amount + Ingredient.find(measurement.ingredient_id).name
  end
  puts drink.recipe
  else
  puts
  puts "Thats not a drink."
  RunHelper.asks_for_users_drink
end
end

def self.start
  RunHelper.welcome_message
  RunHelper.ask_for_ingredient_input
  puts
  puts "Your current drink list has #{RunHelper.return_array_of_drink_objects_with_ingredient_input.count} drinks."
  puts "Type 'list' to see the list, 'add' to further refine the list by a new ingredient, or 'start over' to return to the start."
  puts "Typing 'exit' will exit this app."
  puts
  answer = STDIN.gets.chomp
  until answer.downcase == "exit"
    case answer.downcase
      when "list"
        puts
        RunHelper.list_drinks_in_array_of_drink_objects
        puts
        puts "Would you like to see a recipe? Yes or No"
        puts
        # until list_answer == "list" || "add ingredient"
          list_answer = ""
          until list_answer.downcase == "yes" || list_answer.downcase == "no"
          list_answer = STDIN.gets.chomp
          case list_answer.downcase
          when "yes"
            RunHelper.asks_for_users_drink
            RunHelper.recipe_for_users_drink
          when "no"
            break
          else
            puts
            puts "Please enter Yes or No"
            puts
          end
        end
      puts
      puts "Would you like to see your 'list' again, 'add' an ingredient, or 'start over'?"
      puts "Typing 'exit' will exit this app."
      puts
      answer = STDIN.gets.chomp
      when "add"
      RunHelper.ask_for_new_ingredient_input
      RunHelper.refine_array_of_drink_objects_with_new_ingredient_input
      puts
      puts "Your new drink list now has #{RunHelper.refine_array_of_drink_objects_with_new_ingredient_input.count} drinks."
      puts "Type 'list' to see the list, 'add' to further refine the list by a new ingredient, or 'start over' to return to the start."
      puts "Typing 'exit' will exit this app."
      puts
      answer = STDIN.gets.chomp
      when "start over"
        RunHelper.ask_for_ingredient_input
        puts
        puts "Your current drink list has #{RunHelper.return_array_of_drink_objects_with_ingredient_input.count} drinks."
        puts "Type 'list' to see the list, 'add' to further refine the list by a new ingredient, or 'start over' to return to the start."
        puts "Typing 'exit' will exit this app."
        puts
        answer = STDIN.gets.chomp
      when "exit"
        break
      else
        puts "Please choose either 'list', 'add' an ingredient, or 'start over'."
        puts "Typing 'exit' will exit this app."
        puts
        answer = STDIN.gets.chomp
      end
end
end

end
