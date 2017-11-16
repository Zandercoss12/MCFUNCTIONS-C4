## This function runs everything ##

## Crafting C4 ##
scoreboard players tag @e[type=item] add craftC4 {Item:{id:"minecraft:redstone_block",Count:4b},OnGround:1b}
scoreboard players tag @e[type=item] add craftC42 {Item:{id:"minecraft:tnt",Count:5b},OnGround:1b}
execute @e[tag=craftC4] ~ ~ ~ execute @e[tag=craftC42,r=1,c=1] ~ ~ ~ summon item ~ ~ ~ {Item:{id:"minecraft:tnt",Count:1b,tag:{display:{Name:"C4",Lore:["DO NOT PLACE DOWN", "Throw [DROP] on the ground to place."],ench:[id:-1s]}}},Tags:["killcraftC4"}
execute @e[tag=killcraftC4] ~ ~ ~ kill @e[tag=craftC4,r=1,c=1]
execute @e[tag=killcraftC4] ~ ~ ~ kill @e[tag=craftC42,r=1,c=1]

## Placing C4 ##
scoreboard players tag @e[type=item,tag=!killcraftC4] add setC4 {Item:{id:"minecraft:tnt",tag:{display:{Name:"C4",Lore:["DO NOT PLACE DOWN", "Throw [DROP] on the ground to place."],ench:[id:-1s]}}},OnGround:1b}
execute @e[tag=setC4] ~ ~ ~ summon leash_knot ~ ~ ~ {Tags:["placeC4"]}
execute @e[tag=setC4] ~ ~ ~ kill @s
execute @e[tag=placeC4] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"C4",CustomNameVisible:0b,Invulnerable:1b,Marker:1b,Invisible:1b,NoGravity:1b,PersistenceRequired:1b,Tags:["c4"]}
execute @e[tag=placeC4] ~ ~ ~ kill @s

## C4 Detonator ##
scoreboard players tag @e[type=item] add detonator {Item:{id:"minecraft:redstone_torch",Count:1b,tag:{display:{Name:"Detonator"}}}}
scoreboard players tag @a add holdingDetonator {SelectedItem:{id:"minecraft:redstone_torch",tag:{display:{Name:"Detonator"}}}}
execute @a[tag=holdingDetonator] ~ ~ ~ execute @e[tag=c4,r=20] ~ ~ ~ title @p[tag=holdingDetonator,r=20] actionbar {"text","Detonate C4","color":"red"}
scoreboard players tag @a[tag=holdingDetonator] remove holdingDetonator
execute @e[type=item,tag=detonator] ~ ~ ~ execute @e[tag=c4,r=20] ~ ~ ~ summon tnt ~ ~ ~ {Fuse:0}
execute @e[tag=c4] ~ ~ ~ detect ~ ~ ~ air 0 kill @s

