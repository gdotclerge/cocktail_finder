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

def self.get_what_would_you_like
  @@ingredient1_input = STDIN.gets.chomp
end

def self.ingredient1_input
  @@ingredient1_input
end

def self.return_drinks_you_would_like
  Drink.all.select { |drink|
    drink.ingredients.include? RunHelper.ingredient1_input
  }
end


end
