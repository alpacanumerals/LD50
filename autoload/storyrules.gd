extends Node

#POTENTIAL OPTIONS FOR THE OPTIONS SCREEN
var option_basic: bool = true
#var option_strict: bool = false
var option_gender: bool = true

#Rules dictionary. Every rule has a name and goes here.
enum rules { ACTION_NONSENSE, SLEW_ALREADY_DEAD, SLEW_UNKILLABLE, MARRIED_INANIMATE, 
SPOKE_WITH_INANIMATE, GENERIC_NONSENSE, CHAUVANIST, TWIN_CONFUSED, TWIN_SUBJECTASSIGNED, 
TWIN_OBJECTASSIGNED, TWIN_REVERSETRANSFORM, ACTION_DEAD, }
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

    #RULES of logic: option_basic should never be turned off.
    #These instantly break the story without resolving anything else.
    if option_basic == true:
        #Action requiring animation.
        if verb.action == true:
            if subject.animate_now == false:
                print("A" + subject.card_name + "can't do that!")
                offenses[rules.ACTION_NONSENSE] = true
                offense += 3
                return offense
            if subject.dead_now == true:
                print("Wasn't" + subject.card_name + "already dead?")
                offenses[rules.ACTION_DEAD] = true
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

                
    #Unassigned Twin Handling.
    if (subject is Twin):
        if empty(subject.twinassign) and object.animate == true:
            if verb is Married or Had or Stole or Rewarded or Climbed or Threw:
                offenses[rules.TWIN_CONFUSED] = true
                offense += 1    
                confusion += 1     
            else:
                 #Most actions assign the twin through presumption.       
                offenses[rules.TWIN_SUBJECTASSIGNED] = true
                subject.twinassign = [object.id]
                subject.female_now = object.female
                subject.fiery_now = object.fiery
                subject.handy_now = object.handy
                subject.huge_now = object.huge
                subject.resourceful_now = object.resourceful
                subject.weak_now = object.weak              
                
    if (object is Twin):
        if empty(object.twinassign) and subject.animate == true:
            if verb is Stole:
                offenses[rules.TWIN_CONFUSED] = true
                offense += 1    
                confusion += 1     
            if verb is Turned_Into:
                #Plot device where someone swaps with their twin to elope etc.
                offenses[rules.TWIN_REVERSETRANSFORM] = true
                subject.marriageable_now = true
                subject.noble_now = false
            else:
                #Most actions assign the twin through presumption.       
                offenses[rules.TWIN_OBJECTASSIGNED] = true
                object.twinassign = [subject.id]
                object.female_now = subject.female
                object.fiery_now = subject.fiery
                object.handy_now = subject.handy
                object.huge_now = subject.huge
                object.resourceful_now = subject.resourceful
                object.weak_now = subject.weak               
   
    #The Chauvinism Rule. Doesn't like women doing adventurous things.
    if option_gender == true:
        if subject.female_now == true:
            if verb.adventure == true:
                print("But why is a woman doing that anyway?")
                offenses[rules.CHAUVANIST] = true
                offense += 1 
                

    #RULES per action.
    if (verb is Burned):
        if subject.fiery_now == false && subject.magical_now == false && subject.handy_now == false:
            if subject.aflame_now == true:
                offenses[rules.BURNED_CLEVER] = true
                offense -= 1
            else:    
                offenses[rules.BURNED_UNREASONABLE] = true
                offense += 1
        if subject.hatelist.has(object.id):
            offenses[rules.BURNED_HATELIST] = true
            offense -= 1
        object.aflame_now = true
        return offense
    
    if (verb is Climbed):
        if subject.huge_now == true && object.huge_now == false:
            offenses[rules.CLIMBED_OVEROVERSIZE] = true
            offense -= 2
        elif (subject.huge_now == false && object.huge_now == false 
        || subject.huge_now == true && object.huge_now == true && object.structure_now == false):
            offenses[rules.CLIMBED_OVERSIZE] = true
            offense -= 1
        return offense
        
#SET STATES
 #   if (verb is Slay) && object.dead == false:
  #      object.dead = true
   #     print("I suppose" + object.card_name + "is dead.")     
            
#Return total value of offenses!    
    return offense
