extends Node

#POTENTIAL OPTIONS FOR THE OPTIONS SCREEN
var option_basic: bool = true
var option_chauv: bool = true

#Rules dictionary. Every rule has a name and goes here.
enum rules { CHAUVANIST, NONSENSE }
var offenses = {}

#Validity Flags
#This indicates whether the Sultan accepts things happening 
#whether or not he likes it. May or may not get used!
#var slay_valid: bool = false
#var burn_valid: bool = false

func ponder(subject, object, verb):
    #Initialize total offense back to 0 and clean the dictionary.
    #Also maybe use the validity flags if used.
    #var slay_valid: bool = false
    #var burn_valid: bool = false
    var offense: int = 0
    var boredom: int = 0
    var confusion: int = 0
    offenses = {}

#############
#RULES BEGIN#
#############

    #Broad Logic Rules 
    if option_basic == true:
        #Action requiring animation.
        if verb.action == true && subject.animate_now == false:
            print("A" + subject.card_name + "can't do that!")
            offenses[rules.ACTION_NONSENSE] = true
            offense += 3
            return offense
        #Verbs requiring animate objects.    
        if verb.targetanimate == true && object.animate_now == false:
            #Logic regarding what can be legitimately slain.
            if (verb is Slew):
                if object.dead == true:
                    print("Wasn't" + object.card_name + "already dead?") 
                    offenses[rules.SLEW_ALREADY_DEAD] = true
                    offense += 3
                    return offense
                if object.animate_now == false:
                    print("And just how does the" + subject.card_name + "plan to kill a" + object.card_name + "?") 
                    offenses[rules.SLEW_UNKILLABLE] = true
                    offense += 3
                return offense            
        #Verbs requiring animate objects.
            if (verb is Married):
                offenses[rules.MARRIED_INANIMATE] = true
                offense += 3
                return offense
            if (verb is Pursued):
                offenses[rules.PURSUED_INANIMATE] = true
                offense += 3
                return offense
            if (verb is Spoke_With):
                offenses[rules.SPOKE_WITH_INANIMATE] = true
                offense += 3
                return offense
            else:
                offenses[rules.GENERIC_NONSENSE] = true
                offense += 3
                return offense
    
    #RULES Governing the possible but unreasonable.
    
    
    
    
#Initial chauvinism rule. REVIEW LATER MAYBE
    if (verb is Slew):
        if (subject.female == true
        && subject.monster == false
        && object.female == false):
            print("a woman could never overpower a man")
            offenses[rules.CHAUVANIST] = true
            offense += 1     
            
#SET STATES
 #   if (verb is Slay) && object.dead == false:
  #      object.dead = true
   #     print("I suppose" + object.card_name + "is dead.")     
            
#Return total value of offenses!    
    return offense
