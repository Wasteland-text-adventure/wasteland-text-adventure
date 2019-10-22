# IMPORTED FILES
require_relative 'waypoint0'
require_relative 'waypoint1'

# VARIABLES
enter =  "--Press enter to continue--"
game_states = {
     'Morality' => 0,
     'Food' => 0,
     'Weapon' => 0,
     'Pet' => 1, # true means alive
     'Health' => 1,
     'ChildSaved' => false,
     'Waypoint' => 0
 }

 def translate_game_states(game_states)
     foodStr = ''
     foodNum = game_states['Food']
     if(foodNum == 1)
        foodStr = "You are fully packed with food."
     elsif (foodNum >= 0.5)
        foodStr = "You have sufficient food."
     elsif (foodNum >= 0.25)
        foodStr = "You are running low on food."
     else
        foodStr = "You have no food."
     end

     weaponStr = ''
     weaponNum = game_states['Weapon']
     if(weaponNum == 1)
        weaponStr = "You have a weapon."
     else
        weaponStr = "You have no weapon."
     end

     healthStr = ''
     healthNum = game_states['Health']
     if(healthNum == 1)
        healthStr = "You are fully healed."
    elsif (healthNum >= 0.75)
        healthStr = "You are slightly hurt."
    elsif (healthNum >= 0.5)
        healthStr = "You are moderately hurt."
    elsif (healthNum >= 0.25)
        healthStr = "You are severely hurt."
     else
        healthStr = "You are dead."
     end

     petStr = ''
     petNum = game_states['Pet']
     if(petNum == 1)
        petStr = "Oreo is fully healed."
    elsif (healthNum >= 0.75)
        petStr = "Oreo is slightly hurt."
    elsif (healthNum >= 0.5)
        petStr = "Oreo is moderately hurt."
    elsif (healthNum >= 0.25)
        petStr = "Oreo is severely hurt."
     else
        petStr = "Oreo is dead."
     end

     puts foodStr
     puts weaponStr
     puts healthStr
     puts petStr
 end

 def waypoint_check(game_states, status)
     healthNum = game_states['Health']
     petNum = game_states['Pet']
     foodNum = game_states['Food']
     if(status < 1)
         if((healthNum < 1 || petNum < 1) && foodNum > 0)
             puts "Would you like to eat some food and rest to heal yourself and Oreo? [Y/n]"
             decision = gets.chomp
             if(decision.downcase == 'y')
                 foodNum -= 0.25
                 petNum += 0.25
                 healthNum += 0.25
                 petNum = petNum > 1 ? 1 : petNum
                 healthNum = healthNum > 1 ? 1 : healthNum
             elsif(decision.downcase == 'n')
             else
                 waypoint_check(game_states, 0)
             end
         end
     end
     game_states['Health'] = healthNum
     game_states['Pet'] = petNum
     game_states['Food'] = foodNum
     if(foodNum < 1)
         puts "Would you like to eat venture into the wasteland to try to find some food? [Y/n]"
         decision = gets.chomp
         if(decision.downcase == 'y')
             #MAKE WASTELAND FUNCTION
         elsif(decision.downcase == 'n')
         else
             waypoint_check(game_states, 1)
         end
     end
     game_states['Health'] = healthNum
     game_states['Pet'] = petNum
     game_states['Food'] = foodNum
 end

# STORY
puts "Welcome to our post-apocalyptic adventure!"
puts enter
gets

puts "To create the setting, you are with your Husky named Oreo"
puts enter
gets

puts "You thought your daughter has died but then you discover clue that she may be alive"
puts enter
gets

puts "Thus you're on a journey to find her with Oreo"
puts enter
gets

puts "Now you're in a police station that is quickly collapsing "
puts enter
gets

puts "You either have to do one of these decisions"
puts enter
gets

game_states = get_waypoint0_result(game_states)
game_states['Waypoint'] = 1
translate_game_states(game_states)
waypoint_check(game_states, 0)
