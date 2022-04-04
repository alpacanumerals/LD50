extends Node

var finalopinion = []
var line

func speak(subject, object, verb):
    finalopinion.clear()
    if Storyrules.offenses.has(Storyrules.rules.CAT_LIFE):
        line = "Well I suppose the Cat's still got lives left."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.RESOURCEFUL_ESCAPEBURIAL):
        line = "Ah a resourceful hero. I knew they wouldn't be buried so easily."
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
        line = "Wasn't the " + object.card_name + "already dead?"
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.ACTION_NONSENSE):
        line = "The " + object.card_name + "can't do that!"
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
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CLIMBED_OVEROVERSIZE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CLIMBED_OVERSIZE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.DESPISED_CAT):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.DESPISED_INCONSISTENT):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_FROMNOWHERE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_CLEVER):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_DAMOCLES):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_ALREADY):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_BURNINGSTRUCTURE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_RUBBLE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.FELL_CRUSHEDBY):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.HAD_STRANGE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.LOVED_INCONSISTENT):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.LOVED_CAT):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_BOTHALREADY):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_SUBJECTALREADY):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_OBJECTALREADY):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_BADMATCH):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_YURINO):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_YAOIMAYBE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_Y_IS_FINE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_POLITICAL):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_BOTHHATE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_LOVEGROSS):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_SAPPY):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_NOBUILDUP):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_SPICY):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REVIVED_CAT):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REVIVED_CATDEAD):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REVIVED_DEUSEX):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REVIVED_USEMAGIC):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.REWARDED_DUBIOUS):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_ALREADY_DEAD):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_UNKILLABLE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_COURTSPICE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_HIGHLYTOPICAL):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_UNSPICYREGICIDE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_STRANGE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_SUICIDE_CAT):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_SUICIDE_KING):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_SUICIDE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SLEW_CAT):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.STOLE_HUGE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.STRUCK_HUGEDEAD):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.THREW_HUGE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.THREW_NOHANDS):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TURN_NOMAGIC):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TURN_INTO):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.MARRIED_INANIMATE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.PURSUED_INANIMATE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.SPOKE_WITH_INANIMATE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.KING_MISFORTUNE):
        line = "."
        finalopinion.append(line)
    return finalopinion
