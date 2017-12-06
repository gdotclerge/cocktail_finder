class RunHelper

def self.get_username
  @@username_input = STDIN.gets.chomp
end

def self.username_input
  @@username_input
end

def self.set_current_user
  @@current_user =
  User.all.find { |user|
    user.name.downcase == RunHelper.username_input.downcase
  }
end

def self.current_user
  @@current_user
end

def self.welcome_and_set_or_create_user
  puts "Hey, who are you?"
  RunHelper.get_username
  if RunHelper.set_current_user
    puts "Welcome back #{RunHelper.username_input}!"
    RunHelper.set_current_user
  else
    puts "Welcome to our app, #{RunHelper.username_input}!"
    User.create(name: "#{RunHelper.username_input}")
  end
end

def self.get_ingredient_input
  @@ingredient_input = STDIN.gets.chomp
end

def self.ingredient_input
  @@ingredient_input
end

def self.ask_for_ingredient_input
  puts
  puts "What ingredient your drink should have?"
  puts
  RunHelper.get_ingredient_input
end

def self.ask_for_new_ingredient_input
  puts
  puts "What new ingredient your drink should have?"
  puts
  RunHelper.get_ingredient_input
end

def self.return_array_of_drink_objects_with_ingredient_input
  # returns array of drinks that contain ingredient
  # given in self.get_what_would_you_like
  # itterate thru all drinks and find drinks cotaining
  # ingredient1_input.
  @@array_of_drink_objects = Ingredient.all.find { |ingredient|
    ingredient.name.downcase == RunHelper.ingredient_input.downcase
  }.drinks
end

def self.refine_array_of_drink_objects_with_new_ingredient_input
    @@array_of_drink_objects = @@array_of_drink_objects.select { |drink|
      drink.ingredients.include?(Ingredient.all.find { |ingredient|
        ingredient.name.downcase == RunHelper.ingredient_input.downcase
      })
    }
end


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
  RunHelper.get_users_drink
end

def self.recipe_for_users_drink
  Drink.all.find { |drink|
    drink.name.downcase == @@drink_input.downcase
  }.recipe
end

def self.name
  RunHelper.ask_for_ingredient_input
  puts
  puts "Your current drink list has #{RunHelper.return_array_of_drink_objects_with_ingredient_input.count} drinks."
  puts "Type 'list' to see the list, 'add ingredient' to further refine the list, or 'start over' to return to the start."
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
            puts RunHelper.recipe_for_users_drink
          when "no"
            break
          else
            puts
            puts "Would you like to see a recipe? Please enter Yes or No"
            puts
          end
        end
      puts
      puts "Would you like to see your 'list' again, 'add ingredient', or 'start over'?"
      puts "Typing 'exit' will exit this app."
      puts
      answer = STDIN.gets.chomp
      when "add ingredient"
      RunHelper.ask_for_new_ingredient_input
      RunHelper.refine_array_of_drink_objects_with_new_ingredient_input
      puts "Your new drink list now has #{RunHelper.return_array_of_drink_objects_with_ingredient_input.count} drinks."
      puts "Type 'list' to see the list, 'add ingredient' to further refine the list, or 'start over' to return to the start."
      puts "Typing 'exit' will exit this app."
      puts
      answer = STDIN.gets.chomp
      when "start over"
        RunHelper.ask_for_ingredient_input
        puts
        puts "Your current drink list has #{RunHelper.return_array_of_drink_objects_with_ingredient_input.count} drinks."
        puts "Type 'list' to see the list, 'add ingredient' to further refine the list, or 'start over' to return to the start."
        puts "Typing 'exit' will exit this app."
        puts
        answer = STDIN.gets.chomp
      when "exit"
        break
      else
        puts "Please choose either 'list', 'add ingredient', or 'start over'."
        puts "Typing 'exit' will exit this app."
        puts
        answer = STDIN.gets.chomp
      end
end
end

end
