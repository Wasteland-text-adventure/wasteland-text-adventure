# FUNCTIONS
# IMPORTED FILES
require_relative 'wp0_decisions2'

def get_waypoint0_result(game_states)
    enter =  "--Press enter to continue--"
    wp0_decision1 = make_wp0_decision1(true)

    if(wp0_decision1 == 1)
        game_states['Food'] = 1
        puts "You grabbed some food."
        puts enter
        gets
    elsif(wp0_decision1 == 2)
        game_states['Weapon'] = 1
        puts "You quickly run to the armory and quickly rummage through the cases and realize there's a revolver in one of them."
        puts enter
        gets

        puts "Before you can find any more useful weapons, you realzie that the building is collapsing and you and Oreo quickly exit."
        puts enter
        gets

        puts "Reazling that the revolver you found holds no ammo, you and Oreo are glad that you're both safely outside, and thus  continuing the journey to find your daughter"
        puts enter
        gets
    else
        puts "You try getting both but are unsuccessful."
        puts enter
        gets
    end

    wp0_decision2 = make_wp0_decision2(true, game_states)

    if(wp0_decision1 == 1)
        if(wp0_decision2 == 1)
            game_states['Food'] = 0.5
            game_states['ChildSaved'] = true
            game_states['Morality'] = 1
            puts "You gave the child food and dropped him off at the hospital.  He is extremely grateful for your help."
            puts enter
            gets
        else
            game_states['Morality'] = -1
            puts "You decide to move on without helping him."
            puts enter
            gets
        end
    elsif(wp0_decision1 == 2)
        if(wp0_decision2 == 1)
            game_states['Food'] = 1
            game_states['Morality'] = -1
            puts "You were successful in mugging the man and taking all his belongings."
            puts enter
            gets

            puts "Inside the backpack you find some food for you and Oreo."
            puts enter
            gets
        else
            game_states['Morality'] = 1
            puts "You leave the man be."
            puts enter
            gets
        end
    else
        if(wp0_decision2 == 1)
            game_states['Health'] = 0.5
            game_states['Morality'] = 1
            puts "You were successful in running away but you were injured in the escape."
            puts enter
            gets
        else
            game_states['Pet'] = 0.5
            game_states['Morality'] = -1
            game_states['Food'] = 0.5
            game_states['Weapon'] = 1
            puts "You stick your dog on them and Oreo was successful in killing them.  However, Oreo is injured in the process."
            puts enter
            gets

            puts "You scavenge their body and find some food and take their weapon."
            puts enter
            gets
        end
    end

    return game_states
end

def make_wp0_decision1(firstSend)
   enter =  "--Press enter to continue--"
   if(firstSend)
       puts "You can either go to the left to the kitchen to grab some food."
       puts enter
       gets
       puts "Or you can go to the right to the armory to grab a weapon."
       puts enter
       gets
       puts "Or you can try to grab both."
       puts enter
       gets
   end
   puts "Choose 1 for food, 2 for weapon, or 3 for both."
   decision = gets.chomp.to_i
   if decision == 1 || decision == 2 || decision == 3
       return decision
   else
       return make_wp0_decision1(false)
   end
end

def make_wp0_decision2(firstSend, states)
    enter =  "--Press enter to continue--"
    if(firstSend)
        puts "You leave the building as it crumbles behind you."
        puts enter
        gets
    end
    if(states['food'] == 1)
        if(firstSend)
            food_second_decision()
        end
        puts "Press 1 to give the child food and take him to the hosptial or press 2 to continue on."
        decision = gets.chomp.to_i
        if decision == 1 || decision == 2
            return decision
        else
            return make_wp0_decision2(false, states)
        end
    elsif (states['weapon'] == 1)
        if(firstSend)
            weapon_second_decision()
        end
        puts "Press 1 to attempt mug him or Press 2 to let him go and check inside the grocery store."
        decision = gets.chomp.to_i
        if decision == 1 || decision == 2
            return decision
        else
            return make_wp0_decision2(false, states)
        end
    else
        if(firstSend)
            none_second_decision()
        end
        puts "Press 1 to attempt to run away or Press 2 to stick your dog on him."
        decision = gets.chomp.to_i
        if decision == 1 || decision == 2
            return decision
        else
            return make_wp0_decision2(false, states)
        end
    end
end
