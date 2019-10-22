

def get_waypoint1_result(game_states)
    enter =  "--Press enter to continue--"

    puts "You arrive at a grocery store and decide to check it out. You walk in and notice that there is no food left, as you walk through the aisles the shelves are empty.  All you notice are a few cans open that have bugs crawling out. As you finish walking through the aisles you decide to check behind the counter to see if you can find anything useful to you."
    puts enter
    gets

    puts "You spot a few cabinets that havent been look through and a register. You open the cabinets and unfortunately dont find anything useful, then you move towards the register. When you go to open the register you notice something odd; a coin that seems familiar, that you know belongs to your daughter."
    puts enter
    gets

    puts "You quickly grab it, inspect it, and Oreo barks with recognition thus giving you a sense of hope. You pocket the coin and you proceed to leave the grocery store and continue on your journey."
    puts enter
    gets

    puts "You travel along the desolate main highway until you arrive at a bridge.  A dust storm is brewing halfway along the bridge making it impossible to see what lies ahead."
    puts enter
    gets

    puts "You have a decision to make.  You can continue along the bridge into the unknown abyss or you can go around the long way.  Both ways require you to go through the storm.  However, the end around path will require you to consume your food."
    puts enter
    gets

    foodNum = game_states['Food']
    bridge_decision = 0
    if(foodNum < 0.5)
        bridge_decision = 1
        puts "You do not have enough food to take the long route.  Therefore you have to cross the bridge."
        puts enter
        gets
    else
        bridge_decision = make_bridge_decision()
    end

    if(bridge_decision == 1)
        puts "You take the route towards the bridge"
        puts enter
        gets

        puts "As you trek through across the cars and the storm, you realize a glint in a distance"
        puts enter
        gets

        puts "Curious, you come closer the the object, you realize it's a relfection that is coming from a necklace that a little girl is wearing"
        puts enter
        gets

        puts "Accompanying the little girl, you notice a man is holding her through a chain and the little girl distressed"
        puts enter
        gets

        
    else
        puts "You do not have enough food to take the long route.  Therefore you have to cross the bridge."
        puts enter
        gets
    end

    return game_states
end

def make_bridge_decision()
    enter =  "--Press enter to continue--"
    puts "Press 1 to cross the bridge or press 2 to go around."
    bridge_decision = gets.chomp.to_i
    if(bridge_decision == 1 || bridge_decision == 2)
        return bridge_decision
    else
        make_bridge_decision()
    end
end
