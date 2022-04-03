extends Card
class_name Twin

const card_name: String = "Twin"
const texture: StreamTexture = preload("res://assets/noun/twin.png")


const aflame: bool = false
const airborne: bool = false
const animate: bool = true
const buried: bool = false
const dead: bool = false
const female: bool = false
const fiery: bool = false
const found: bool = false
const handy: bool = true
const huge: bool = false
const magical: bool = false
const noble: bool = false
const resourceful: bool = true
const structure: bool = false
const weak: bool = false
const marriageable: bool = true
const lovelist = []
const hatelist = []

var lovelist_now
var hatelist_now
var marriageable_now
var aflame_now
var airborne_now
var animate_now
var buried_now
var dead_now
var female_now
var fiery_now
var found_now
var handy_now
var huge_now
var magical_now
var noble_now
var resourceful_now
var structure_now
var weak_now

var twinassign = []

func _init(new_id):
    id = new_id

    aflame_now = aflame
    airborne_now = airborne
    animate_now = animate
    buried_now = buried
    dead_now = dead
    female_now = female
    fiery_now = fiery
    found_now = found
    handy_now = handy
    huge_now = huge
    magical_now = magical
    noble_now = noble
    resourceful_now = resourceful
    structure_now = structure
    weak_now = weak
    marriageable_now = marriageable
    lovelist_now = lovelist
    hatelist_now = hatelist
    twinassign = []
