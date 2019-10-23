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
    man_decision = 0
    fight_decision = 0
    charlie_decision = 0

    if(foodNum < 0.5)
        bridge_decision = 1
        puts "You do not have enough food to take the long route.  Therefore you have to cross the bridge."
        puts enter
        gets
    else
        bridge_decision = make_bridge_decision()
    end

    if(bridge_decision == 1)
        puts "You take the route towards the bridge.  As you trek through across the cars and the storm, you hear yelling in the distance."
        puts enter
        gets

        wp0d1 = game_states['Waypoint0'][0]
        wp0d2 = game_states['Waypoint0'][1]
        if(wp0d1 == 1)
            if(wp0d2 == 1)
                puts "You encounter the same boy you saved earlier.  He is now in cuffs and being ordered around by an armed man."
                puts enter
                gets
            else
                puts "You encounter the same boy you decided not to give food to. He is now in cuffs and being ordered around by an armed man."
                puts enter
                gets
            end
        else
            puts "You encounter a boy who is in cuffs and being ordered around by an armed man."
            puts enter
            gets
        end

        puts "The armed man notices you and stops moving.  He yells at you \'Nothing to see here.  Move along now and nothing will happen to you.\'"
        puts enter
        gets

        man_decision = make_man_decision()
        if(man_decision == 1)
            puts "\'You FOOL! YOU MADE THE WRONG CHOICE! PREPARE TO DIE!.\'"
            puts enter
            gets
            battle_decision = make_battle_decision(game_states)
            game_states['Morality'] += 1
            charlie_decision = make_charlie_decision(true)
            if(charlie_decision)
                game_states['CharlieSaved'] = true
                charlie_decision = 1
                puts "Charlie has joined your team!"
                puts enter
                gets
                puts "You continue on the bridge until you reach the end."
                puts enter
                gets
            else
                puts "You bid farewell to Charlie and continue on your way until you reach the end of the bridge."
                puts enter
                gets
                charlie_decision = 0
            end
        else
            game_states['Morality'] -= 1
            game_states['CharlieSaved'] = false
            puts "You let the man be and continue along the bridge until you reach the end."
            puts enter
            gets
        end
    else
        puts "You take the route going the long way around the bridge."
        puts enter
        gets

        puts "As you trek across the long path you didn't realize that it would take days to pass and consumed a good portion of your food."
        puts enter
        gets

        game_states['Food'] -= 0.5
    end

    game_states['Waypoint1'] = [bridge_decision, man_decision, fight_decision, charlie_decision]
    return game_states
end

def make_bridge_decision()
    puts "Press 1 to cross the bridge or press 2 to go around."
    bridge_decision = gets.chomp.to_i
    if(bridge_decision == 1 || bridge_decision == 2)
        return bridge_decision
    else
        make_bridge_decision()
    end
end

def make_man_decision()
    puts "You have a decision to make.  Will you approach the man or will you walk around?  Press 1 to approach and press 2 to walk around."
    man_decision = gets.chomp.to_i
    if(man_decision == 1 || man_decision == 2)
        return man_decision
    else
        make_man_decision()
    end
end

def make_battle_decision(game_states)
    enter =  "--Press enter to continue--"
    if(game_states['Weapon'] == 0)
        wp0d1 = game_states['Waypoint0'][0]
        wp0d2 = game_states['Waypoint0'][1]
        if(wp0d1 == 1 && wp0d2 == 1)
          game_states['Pet'] -= 0.25
        else
          game_states['Pet'] -= 0.5
        end
        game_states['Weapon'] = 1
        puts "You stick Oreo on the armed man who attempts to fight Oreo off.  He is able to get a few swings off on Oreo; however, Oreo's fighting prowess enables him to latch on to the armed man's neck and stays there until the man dies."
        puts enter
        gets
        puts "You pick up the crobar from the dead body and now you have a weapon."
        puts enter
        gets
        return 3;
    end
    puts "The man takes out a crobar and starts to charge at you.  Do you force Oreo to stay back and take on the armed man on your own or do you fight alongside your trusted companion Oreo?  Press 1 to attack solo or press 2 to attack together."
    battle_decision = gets.chomp.to_i
    if(battle_decision == 1)
        game_states['Health'] -= 0.5
        puts "You pull your sword out and have Oreo stay put for his safety.  You both swing and the man manages to swing faster and lands a heavy blow to your ribs, feeling cracks underneath.  As he lands his blunted blow, you manage to stab him through the heart, instantly disarming him."
        puts enter
        gets

        return battle_decision
    elsif (battle_decision == 2)
        game_states['Health'] -= 0.25
        game_states['Pet'] -= 0.25

        puts "You pull your sword out and have you and Oreo charge at him at the same time.  Oreo makes contact with him first and lands a bite to the mans leg.  The man responds by swining his crobar and landing a hefty blow on Oreo's side.  He quickly turns his head towards you approach."
        puts enter
        gets

        puts "You both swing and the man manages to swing faster and lands a heavy blow to your ribs, feeling cracks underneath.  As he lands his blunted blow, you manage to stab him through the heart, instantly killing him."
        puts enter
        gets

        return battle_decision
    else
        make_battle_decision(game_states)
    end
end

def make_charlie_decision(firstSend)
    enter =  "--Press enter to continue--"
    if(firstSend)
      puts "After killing the armed man you rummage through his body until you find the keys for the cuffs that the boy is in.  You use the key and let the boy free.  You ask him his name."
      puts enter
      gets

      puts "\'The name is Charlie.  ORIGIN STORY HERE.\'"
      puts enter
      gets
    end

    puts "You have a decision to make.  Would you like to take Charlie along with you on your journey?  [Y/n]"
    charlie_decision = gets.chomp
    if(charlie_decision.downcase == "y")
      return true;
    elsif(charlie_decision.downcase == "n")
      return false;
    else
      make_charlie_decision(false)
    end
end
