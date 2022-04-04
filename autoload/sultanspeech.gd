extends Node

var finalopinion = []
var line

func speak():
    finalopinion.clear()
    if Storyrules.offenses.has(Storyrules.rules.CAT_LIFE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.RESOURCEFUL_ESCAPEBURIAL):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TWIN_CONFUSED):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TWIN_SUBJECTASSIGNED):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TWIN_OBJECTASSIGNED):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.TWIN_REVERSETRANSFORM):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.ACTION_DEAD):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.ACTION_NONSENSE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_GENERIC):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_FICKLEWOMAN):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SWORD):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_MAGICWARRIORPRINCESS):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SLAYHUGE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SLEWWITHSWORD):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SLEWWITHMAGIC):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_SLAY):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_THROW):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_TURNTOF):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.CHAUVANIST_TURN):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.GENERIC_NONSENSE):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.BURNED_CLEVER):
        line = "."
        finalopinion.append(line)
    if Storyrules.offenses.has(Storyrules.rules.BURNED_UNREASONABLE):
        line = "."
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
