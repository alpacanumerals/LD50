extends Node

#POTENTIAL OPTIONS FOR THE OPTIONS SCREEN
var option_chauv: bool = true

#Rules dictionary. Every rule has a name and goes here.
enum rules { CHAUVANIST }
var offenses = {}

func ponder(subject, object, verb):
    #Initialize total offense back to 0 and clean the dictionary.
    var offense: int = 0
    offenses = {}

#############
#RULES BEGIN#
#############

#ACTION RULES




#Subject is dead.



#Initial chauvinism rule. REVIEW LATER MAYBE
    if (verb is Slay):
        if (subject.female == true
        && subject.monster == false
        && object.female == false):
            print("a woman could never overpower a man")
            offenses[rules.CHAUVANIST] = true
            offense += 1     
            
#Return total value of offenses!    
    return offense

