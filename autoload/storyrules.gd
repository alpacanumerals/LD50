extends Node

#POTENTIAL OPTIONS FOR THE OPTIONS SCREEN
var option_chauv: bool = true

#Rules dictionary. Every rule has a name and goes here.
enum rules { CHAUVANIST, NONSENSE }
var offenses = {}

#Validity Flags
#This indicates whether the Sultan accepts things happening.
var slay_valid: bool = false
var burn_valid: bool = false

func ponder(subject, object, verb):
    #Initialize total offense back to 0 and clean the dictionary.
    var offense: int = 0
    offenses = {}



#############
#RULES BEGIN#
#############

#ACTION RULES
#Action requires animation.
    if verb.intent == true && subject.animate == false:
        print("A" + subject.card_name + "can't do that!")
        offenses[rules.NONSENSE] = true
        offense += 3

    
#Subject is dead.



#Initial chauvinism rule. REVIEW LATER MAYBE
    if (verb is Slay):
        if (subject.female == true
        && subject.monster == false
        && object.female == false):
            print("a woman could never overpower a man")
            offenses[rules.CHAUVANIST] = true
            offense += 1     
            
#SET STATES
    if (verb is Slay) && object.dead == false:
        object.dead = true
        print("I suppose" + object.card_name + "is dead.")     
            
#Return total value of offenses!    
    return offense

