extends Node

var finalopinion = []
var line
var catno

func speak(subject_id, verb_id, object_id):
    var subject = Story.cards[subject_id]
    var verb = Story.cards[verb_id]
    var object = Story.cards[object_id]
    
    finalopinion.clear()
    if Storyrules.offenses.has(Storyrules.rules.CAT_LIFE):
        line = "Well I suppose the Cat's still got lives left."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.RESOURCEFUL_ESCAPEBURIAL):
        line = "Ah a resourceful "+subject.card_name+". I knew they wouldn't be buried so easily."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TWIN_CONFUSED):
        line = "What? Whose twin? This makes no sense!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TWIN_SUBJECTASSIGNED):
        line = "Hmm, so it is the "+object.card_name+"'s twin."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TWIN_OBJECTASSIGNED):
        line = "Hmm, so it is the "+subject.card_name+"'s twin."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TWIN_REVERSETRANSFORM):
        line = "Hmph, so they've taken the place of their twin to escape their responsibilities."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.ACTION_DEAD):
        line = "Wasn't the " + object.card_name + " already dead?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.ACTION_NONSENSE):
        line = "A " + subject.card_name + " can't do that!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_GENERIC):
        if subject is Princess:
            line = "Hmph. Why is a princess doing that anyway?"
        else:
            line = "Hmph. Why is a woman doing that anyway?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_FICKLEWOMAN):
        line = "Hmph. Such is the fickleness of a woman's emotions!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SWORD):
        line = "And? What shall a "+subject.card_name+" do with a sword?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_MAGICWARRIORPRINCESS):
        line = "Well, given at this point they're a Magical Warrior "+subject.card_name+", I suppose it's to be expected."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SLAYHUGE):
        line = "And just how does she expect to slay a "+object.card_name+"?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SLEWWITHSWORD):
        line = "Slain by that sword she got hold of is it?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SLEWWITHMAGIC):
        line = "Slain by sorcery I suppose."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SLAY):
        line = "I don't see how she could've slain them."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_THROW):
        line = "Just up and threw them bodily did she? Nonsense!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_TURNTOF):
        line = "So the "+subject.card_name+" has become a woman?! Preposterous!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_TURN):
        line = "Just like that the "+subject.card_name+" is longer a woman?! Preposterous!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.GENERIC_NONSENSE):
        line = "That doesn't make any sense!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.BURNED_CLEVER):
        line = "Oh I see, because the "+subject.card_name+" was set on fire before. Very clever."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.BURNED_UNREASONABLE):
        line = "I don't see how it could burn them but whatever."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.BURNED_HATELIST):
        line = "And the "+subject.card_name+" lit the "+object.card_name+" they despised on fire. I like it."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.BURNED):
        line = "I suppose now the "+object.card_name+" is ablaze."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CLIMBED_OVEROVERSIZE):
        line = "I can't even picture how a "+subject.card_name+" climbs a "+object.card_name+"."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CLIMBED_OVERSIZE):
        line = "Don't you think the "+subject.card_name+" is a bit large to climb the "+object.card_name+"?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.DESPISED_INCONSISTENT):
        line = "I thought the "+subject.card_name+" loved the "+object.card_name+"?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.DESPISED_CAT):
        line = "I also don't appreciate those who despise cats."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_FROMNOWHERE):
        line = "Really? The "+subject.card_name+" just fell onto the "+object.card_name+" from nowhere?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_CLEVER):
        line = "So the "+subject.card_name+" landed on the "+object.card_name+"? Clever."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_DAMOCLES):
        line = "Ah, the Sword above the Throne. So close to home. I appreciate it."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_ALREADY):
        line = "Didn't that fall over already?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_BURNINGSTRUCTURE):
        line = "Ah, the burning "+subject.card_name+" collapses."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_RUBBLE):
        line = "Now the "+object.card_name+" is buried in rubble."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_CRUSHEDBY):
        line = "The "+object.card_name+" crushed beneath the enormous "+subject.card_name+"."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.HAD_STRANGE):
        line = "I don't see how a "+subject.card_name+" can have a "+object.card_name+"."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.LOVED_INCONSISTENT):
        line = "I thought the "+subject.card_name+" despised the "+object.card_name+"?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.LOVED_CAT):
        line = "One who appreciates cats is a protagonist."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_BOTHALREADY):
        line = "Hmph! Weren't they both already married?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_SUBJECTALREADY):
        line = "Hmph, wasn't the "+subject.card_name+" already married?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_OBJECTALREADY):
        line = "Hmph, wasn't the "+object.card_name+" already married?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_BADMATCH):
        line = "A person of noble standing with a commoner? I don't approve."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_YURINO):
        line = "But they're both women! P-Preposterous!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_YAOIMAYBE):
        line = "Hmph. Yes. I suppose that is a fascinating match."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_Y_IS_FINE):
        line = "Excellent! A good match! I appreciate it very much."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_POLITICAL):
        line = "Hah! Forced together by politics no doubt, despite their antipathy."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_BOTHHATE):
        line = "There was antipathy between the two as I recall. A marriage of convenience."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_LOVEGROSS):
        line = "Hmph! As if nobility marry for love!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_SAPPY):
        line = "So they love each other very much and are married. One expects such a sappy story from you."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_NOBUILDUP):
        line = "So they just got married all of a sudden? Bah!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_SPICY):
        line = "As I recall one's love is requitted only by hate. This will be a fascinating relationship I'm sure."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REVIVED_CAT):
        catno = 9-subject.catdeaths
        line = "Ah of course, our friend still has "+catno.string()+" lives remaining."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REVIVED_CATDEAD):
        line = "Oh to hell with it! The cat is dead!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REVIVED_DEUSEX):
        line = "Really, do all your characters simply come back to life when it's convenient?!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REVIVED_USEMAGIC):
        line = "Hmph. Revived through sorcery I suppose."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REWARDED_DUBIOUS):
        line = "Just what would they have as a worthwhile reward for a "+object.card_name+"?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_ALREADY_DEAD):
        line = "Wasn't the " + object.card_name + " already dead?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_UNKILLABLE):
        line = "And just how does the " + subject.card_name + " plan to kill a " + object.card_name + "?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_COURTSPICE):
        line = "The "+subject.card_name+" slays the "+object.card_name+"? Ah! The spice of court intrigue!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_HIGHLYTOPICAL):
        line = "Sometimes such acts are appropriate. I hope you understand..."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_HIGHLYTOPICAL2):
        line = "But of course, I hope this doesn't mean you are planning something..."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_UNSPICYREGICIDE):
        line = "Truly? Such an ignoble death does not be befit a king!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_STRANGE):
        line = "I am not certain how they managed that."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_SUICIDE_CAT):
        line = "Hmph, the ever mysterious cat. But it always returns."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_SUICIDE_KING):
        line = "A king dead by his own hand?! Nonsense! It must have been treachery!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_SUICIDE):
        line = "By their own hand. Such a way to go."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_LOVE):
        line = "I do recall that "+subject.card_name+" loved "+object.card_name+". I do hope it was necessary."
        finalopinion.append(line)   
    if Storyrules.offenses.has(Storyrules.rules.SLEW_HATE):
        line = "Well! The "+subject.card_name+" has certainly made good on their antipathy towards the "+object.card_name+"!"
        finalopinion.append(line)   
    if Storyrules.offenses.has(Storyrules.rules.SLEW_CAT):
        line = "To slay a cat is to be cursed with misfortune."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.STOLE_HUGE):
        line = "And just how have they stolen that?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.STRUCK_HUGEDEAD):
        line = "I suppose, having been struck by a "+subject.card_name+", the "+object.card_name+" is now dead."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.STRUCK_LOVE):
        line = "To strike one's love is not the way!"
        finalopinion.append(line)   
    if Storyrules.offenses.has(Storyrules.rules.STRUCK_HATE):
        line = "The "+subject.card_name+"'s antipathy towards "+object.card_name+" is certainly palpable."
        finalopinion.append(line)   
    if Storyrules.offenses.has(Storyrules.rules.THREW_HUGE):
        line = "And just how have they managed to throw a "+object.card_name+"?!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.THREW_NOHANDS):
        line = "And just how does a "+subject.card_name+" manage to throw anything?!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.THREW_HATE):
        line = "Well, that's one way to show you despise them."
        finalopinion.append(line)      
    if Storyrules.offenses.has(Storyrules.rules.THREW):
        line = "I suppose the "+object.card_name+" is now sailing through the air."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TURN_NOMAGIC):
        line = "Just up and transformed into something else did they? Ridiculous!"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TURN_INTO):
        line = "So the "+subject.card_name+" has turned into a "+object.card_name+"..."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_INANIMATE):
        line = "And who presided over that ceremony? A tree?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.PURSUED_INANIMATE):
        line = "Doesn't sound like it will be much of a chase."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SPOKE_WITH_INANIMATE):
        line = "I'm sure it was a terrific conversation."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.KING_MISFORTUNE):
        line = "But I do not appreciate such a thing happening to a king."
        finalopinion.append(line)
    return finalopinion
