function doEditorDebug() //gml_Script_doEditorDebug
{
    if global.doPanic
    {
        global.panic = 1
        global.fill = 4000
    }
    with (obj_player1)
    {
        global.noisejetpack = 0
        global.pistol = 0
        skateboarding = 0
        boxxed = 0
        if global.setSupertaunt
            supercharge = 10
        switch global.editortransformation
        {
            case "Knight":
                state = states.knightpep
                sprite_index = spr_knightpep_idle
                break
            case "Ball":
                state = states.tumble
                sprite_index = spr_tumble
                break
            case "Firemouth":
                state = states.firemouth
                sprite_index = spr_firemouth
                break
            case "Ghost":
                ghostdash = 0
                ghostpepper = 0
                ghosttimer = 0
                state = states.ghost
                sprite_index = spr_ghostidle
                break
            case "Mort":
                state = states.mort
                sprite_index = spr_player_mortidle
                break
            case "Weenie Mount":
                state = states.rideweenie
                sprite_index = spr_rideweenie
                break
            case "Revolver":
                global.pistol = 1
                break
            case "Barrel":
                state = states.barrel
                sprite_index = spr_player_barrelidle
                break
            case "Rocket":
                state = states.rocket
                sprite_index = spr_rocketstart
                break
            case "Cheeseball":
                state = states.cheeseball
                sprite_index = spr_cheeseballplayer
                break
            case "Sticky Cheese":
                state = states.cheesepep
                sprite_index = spr_cheesepepidle
                break
            case "Boxed":
                boxxed = 1
                state = states.boxxedpep
                sprite_index = spr_boxxedpepidle
                break
            case "Pepper Pizza":
                global.noisejetpack = 1
                sprite_index = spr_player_poweredup
                break
            case "Shotgun":
                shotgunAnim = 1
                sprite_index = spr_shotgunidle
                state = states.normal
                break
            case "Gustavo and Brick":
                ratmount_movespeed = 8
                gustavodash = 0
                isgustavo = 1
                state = states.ratmount
                jumpAnim = 0
                sprite_index = spr_player_ratmountidle
                brick = 1
                break
            case "Gustavo":
                isgustavo = 1
                brick = 0
                state = states.ratmount
                sprite_index = spr_player_ratmountidle
                break
            case "Olive Bubble":
                state = states.antigrav
                sprite_index = spr_antigrav_activate
                with (instance_create(x, y, obj_antigravbubble))
                    playerid = other.id
                break
            case "Clown":
                sprite_index = spr_clown
                skateboarding = 1
                clowntimer = 300
                movespeed = 10
                state = states.mach2
                break
            default:

        }

        movespeed = global.setspeed
        if (movespeed < 0)
        {
            xscale = (-xscale)
            movespeed = (-movespeed)
        }
        if (movespeed != 0)
        {
            if (movespeed <= 12)
            {
                sprite_index = spr_mach
                state = states.mach2
            }
            else
            {
                sprite_index = spr_player_mach4
                state = states.mach3
            }
        }
    }
}

