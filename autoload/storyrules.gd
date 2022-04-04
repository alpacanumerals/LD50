extends Node

#POTENTIAL OPTIONS FOR THE OPTIONS SCREEN
var option_basic: bool = true
#var option_strict: bool = false
var option_gender: bool = true

#Rules dictionary. Every rule has a name and goes here.
enum rules { ACTION_NONSENSE, SLEW_ALREADY_DEAD, SLEW_UNKILLABLE, MARRIED_INANIMATE, 
SPOKE_WITH_INANIMATE, GENERIC_NONSENSE, CHAUVANIST, TWIN_CONFUSED, TWIN_SUBJECTASSIGNED, 
TWIN_OBJECTASSIGNED, TWIN_REVERSETRANSFORM, ACTION_DEAD, CAT_LIFE, CHAUVANIST_FICKLEWOMAN,
CLIMBED_OVERSIZE, CLIMBED_OVEROVERSIZE, BURNED_CLEVER, BURNED_UNREASONABLE, DESPISED_INCONSISTENT,
DESPISED_CAT, FELL_FROMNOWHERE, FELL_CLEVER, FELL_DAMOCLES, FELL_ALREADY, FELL_BURNINGSTRUCTURE,
FELL_RUBBLE, CHAUVANIST_SWORD, HAD_PEDDLER, HAD_STRANGE, LOVED_INCONSISTENT, LOVED_CAT, FOO, FOO }
var offenses = {}

#Validity Flags
#This indicates whether the Sultan accepts things happening 
#whether or not he likes it. May or may not get used!
#var slay_valid: bool = false
#var burn_valid: bool = false


#these apply the rules when they happen to cut down pasta
func revive_cat_rule(thing):
    thing.catdeaths += 1
    thing.dead_now = false
    offenses[rules.CAT_LIFE] = true

func animate_action_rule(thing):
    print("A" + thing.card_name + "can't do that!")
    offenses[rules.ACTION_NONSENSE] = true
    return 3
    
func dead_action_rule(thing):
    print("Wasn't" + thing.card_name + "already dead?")
    offenses[rules.ACTION_DEAD] = true
    return 3

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
    
    #CAT CHECK
    #Is the cat alive or dead?
    if object is Cat and object.dead_now == true and object.catdeaths < 9:
        revive_cat_rule(object)
    if subject is Cat and subject.dead_now == true and subject.catdeaths < 9:
        revive_cat_rule(subject)
        
    #RULES of logic: option_basic should never be turned off.
    #These instantly break the story without resolving anything else.
    if option_basic == true:
        #Action requiring animation.
        if verb.action == true:
            if subject.animate_now == false:
                offense += animate_action_rule(subject)
                return offense
            if subject.dead_now == true:
                offense += dead_action_rule(subject)
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
        if subject.twinassign.empty() and object.animate == true:
            if verb is Married or Had or Stole or Rewarded or Climbed or Threw:
                offenses[rules.TWIN_CONFUSED] = true
                offense += 1
                confusion += 1
            else:
                 #Most actions assign the twin through presumption.       
                offenses[rules.TWIN_SUBJECTASSIGNED] = true
                subject.twinassign = [object.id]
                subject.female_now = object.female_now
                subject.fiery_now = object.fiery_now
                subject.handy_now = object.handy_now
                subject.huge_now = object.huge_now
                subject.resourceful_now = object.resourceful_now
                subject.weak_now = object.weak_now
                
    if (object is Twin):
        if object.twinassign.empty() and subject.animate == true:
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
                object.female_now = subject.female_now
                object.fiery_now = subject.fiery_now
                object.handy_now = subject.handy_now
                object.huge_now = subject.huge_now
                object.resourceful_now = subject.resourceful_now
                object.weak_now = subject.weak_now
        elif object.twinassign.empty() and subject is Sword:
            object.twinassign = [subject.id]
            object.animate_now = false
            object.handy_now = false
            object.resourceful_now = false
            
    #The General Chauvinism Rule. Doesn't like women doing adventurous things.
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
                offense += 2
        if subject.hatelist.has(object.id):
            offenses[rules.BURNED_HATELIST] = true
            offense -= 1
        object.aflame_now = true
        return offense
    
    if (verb is Climbed):
        if subject.huge_now == true && object.huge_now == false:
            offenses[rules.CLIMBED_OVEROVERSIZE] = true
            offense += 2
        elif (subject.huge_now == false && object.huge_now == false
        || subject.huge_now == true && object.huge_now == true && object.structure_now == false):
            offenses[rules.CLIMBED_OVERSIZE] = true
            offense += 1
        return offense
        
    if (verb is Despised):
        if subject.lovelist_now.has(object.id):
            if subject.female == false:
                offenses[rules.DESPISED_INCONSISTENT] = true
                offense += 1
            if subject.female == true:
                if option_gender == true:
                    offenses[rules.CHAUVANIST_FICKLEWOMAN] = true
                else:
                    offenses[rules.DESPISED_INCONSISTENT] = true
                    offense += 1
            subject.lovelist_now.remove(subject.lovelist_now.find(object.id))
        if object is Cat and not subject is Cat:
            offenses[rules.DESPISED_CAT]
            offense += 1
        subject.hatelist_now.append(object.id)
        return offense
    
    if (verb is Fell_Upon):
        if (subject.animate == false and subject.structure_now == false and subject.airborne_now == false
         and not (subject is Sword and object is King)):
            offenses[rules.FELL_FROMNOWHERE] = true
            offense += 2
        if subject.airborne_now == true:
            offenses[rules.FELL_CLEVER] = true
            offense -= 1
        if subject is Sword and object is King:
            offenses[rules.FELL_DAMOCLES] = true
            offense -= 1
        if subject.structure_now == true:
            if subject.buried_now == true:
                offenses[rules.FELL_ALREADY] = true
                offense += 2
            if subject.aflame_now == true:
                offenses[rules.FELL_BURNINGSTRUCTURE] = true
                offense -= 1                
            else:
                offenses[rules.FELL_RUBBLE] = true
            subject.buried_now == true
            object.buried_now == true
        return offense
    
    if (verb is Found):
        if object is Sword and subject.handy_now == true:
            subject.weak_now = false
        if object is Magic:
            subject.magical_now = true
        if object.structure_now == false and object.buried_now == true:
            object.buried_now = false
        object.found_now = true
        return offense
        
    if (verb is Had):
        if object is Sword and subject.handy_now == true:
            subject.weak_now = false
            if option_gender == true and subject.female == true:
                offenses[rules.CHAUVANIST_SWORD] = true
                offense += 1
        if object is Magic:
            subject.magical_now = true
            
        if object is King and subject is Queen:
            object.marriageable_now = false
            subject.marriageable_now = false
        if object is Queen and subject is King:
            object.marriageable_now = false
            subject.marriageable_now = false
        if object is King or Queen and subject is Prince or Princess:
            object.marriageable_now = false
        if object is Prince or Princess and subject is King or Queen:
            subject.marriageable_now = false
            
        if subject is Peddler and not object is Magic or Cat or Fox or Twin:
            offenses[rules.HAD_PEDDLER] = true
            offense += 2
        if (subject is Magic) or (subject is object) or (subject is Sword and not object is Twin or Magic):
            offenses[rules.HAD_STRANGE] = true
            offense += 2
        return offense
        
    if (verb is Loved):
        if subject.hatelist_now.has(object.id):
            if subject.female == false:
                offenses[rules.LOVED_INCONSISTENT] = true
                offense += 1
            if subject.female == true:
                if option_gender == true:
                    offenses[rules.CHAUVINIST_FICKLEWOMAN] = true
                else:
                    offenses[rules.LOVED_INCONSISTENT] = true
                    offense += 1
            subject.hatelist_now.remove(subject.hatelist_now.find(object.id))
        if object is Cat:
            offenses[rules.LOVED_CAT] = true
            offense -= 1
        subject.lovelist_now.append(object.id)
        return offense
        
    if (verb is Married):
        #MARITAL STATUS CHECK
        if subject.marriageable_now == false and object.marriageable_now == false:
            offenses[rules.MARRIED_BOTHALREADY] = true
            offense += 3
        elif subject.marriageable_now == false:
            offenses[rules.MARRIED_SUBJECTALREADY] = true
            offense += 2
        elif object.marriageable_now == false:
            offenses[rules.MARRIED_OBJECTALREADY] = true
            offense += 2
        #SUITABILITY CHECK
        if ((subject.noble_now == true and object.noble_now == false) or
        (subject.noble_now == false and object.noble_now == true)):
            offenses[rules.MARRIED_BADMATCH] = true
            offense += 1
        #GENDERCHECK
        if option_gender == true:
            if subject.female_now == true and object.female_now == true:
                offenses[rules.MARRIED_YURINO] = true
                offense += 1
            if subject.female_now == false and object.female_now == false:
                offenses[rules.MARRIED_YAOIMAYBE] = true
        else:
            if subject.female_now == object.female_now:
                offenses[rules.MARRIED_Y_IS_FINE] = true
        #RELATIONSHIPS CHECK    
        if subject.noble_now == 
        
        
        #SET MARITAL STATUS
        subject.marriageable_now = false
        object.marriageable_now = false
        return offense 
            
    #PURSUED
    #REVIVED
    #REWARDED
    #SLEW
    #SPOKE WITH
    #STOLE
    #STRUCK
    
    
    if (verb is Threw):
        if subject.weak_now == true:
    
    
    #TURNED_INTO
    
    #if (verb is Visited):
    #return offense    
    
    print("SOMETHING WENT WRONG HOLY SHIT OFFENSE SHOULD HAVE BEEN RETURNED BY NOW AHHH")
    return offense
