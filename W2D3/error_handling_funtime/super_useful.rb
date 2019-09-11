# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "Cannot convert argument into integer"
  end
end 

# PHASE 3
class WrongFruitError < StandardError
  def message
    puts "Wrong fruit"
  end 
end 
class CoffeeError < StandardError
  def message
    puts "I like coffee but I want fruit"
  end 
end 

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise WrongFruitError
  end 
   
  
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => error
    error.message
    retry
  rescue WrongFruitError => error
    error.message
  end 

end  


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5
      raise ArgumentError.new("Need to know someone for at least 5 years to be a best friend")
    elsif name.length <= 0
      raise ArgumentError.new("Name cannot be empty") 
    elsif fav_pastime.length <= 0
      raise ArgumentError.new("Favorite pastime cannot be empty")
    end

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


