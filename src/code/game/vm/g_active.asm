export P_SetTwitchInfo
code
proc P_SetTwitchInfo 4 0
file "../g_active.c"
line 11
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:qboolean PM_SaberInTransition( int move );
;7:qboolean PM_SaberInStart( int move );
;8:qboolean PM_SaberInReturn( int move );
;9:
;10:void P_SetTwitchInfo(gclient_t	*client)
;11:{
line 12
;12:	client->ps.painTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 13
;13:	client->ps.painDirection ^= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 14
;14:}
LABELV $78
endproc P_SetTwitchInfo 4 0
export P_DamageFeedback
proc P_DamageFeedback 48 12
line 26
;15:
;16:/*
;17:===============
;18:G_DamageFeedback
;19:
;20:Called just before a snapshot is sent to the given player.
;21:Totals up all damage and generates both the player_state_t
;22:damage values to that client for pain blends and kicks, and
;23:global pain sound events for all clients.
;24:===============
;25:*/
;26:void P_DamageFeedback( gentity_t *player ) {
line 31
;27:	gclient_t	*client;
;28:	float	count;
;29:	vec3_t	angles;
;30:
;31:	client = player->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 32
;32:	if ( client->ps.pm_type == PM_DEAD ) {
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $81
line 33
;33:		return;
ADDRGP4 $80
JUMPV
LABELV $81
line 37
;34:	}
;35:
;36:	// total points of damage shot at the player this frame
;37:	count = client->damage_blood + client->damage_armor;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1624
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1620
ADDP4
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 38
;38:	if ( count == 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $83
line 39
;39:		return;		// didn't take any damage
ADDRGP4 $80
JUMPV
LABELV $83
line 42
;40:	}
;41:
;42:	if ( count > 255 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1132396544
LEF4 $85
line 43
;43:		count = 255;
ADDRLP4 4
CNSTF4 1132396544
ASGNF4
line 44
;44:	}
LABELV $85
line 50
;45:
;46:	// send the information to the client
;47:
;48:	// world damage (falling, slime, etc) uses a special code
;49:	// to make the blend blob centered instead of positional
;50:	if ( client->damage_fromWorld ) {
ADDRLP4 0
INDIRP4
CNSTI4 1644
ADDP4
INDIRI4
CNSTI4 0
EQI4 $87
line 51
;51:		client->ps.damagePitch = 255;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 255
ASGNI4
line 52
;52:		client->ps.damageYaw = 255;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 54
;53:
;54:		client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1644
ADDP4
CNSTI4 0
ASGNI4
line 55
;55:	} else {
ADDRGP4 $88
JUMPV
LABELV $87
line 56
;56:		vectoangles( client->damage_from, angles );
ADDRLP4 0
INDIRP4
CNSTI4 1632
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 57
;57:		client->ps.damagePitch = angles[PITCH]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 1132462080
ADDRLP4 8
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 58
;58:		client->ps.damageYaw = angles[YAW]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 1132462080
ADDRLP4 8+4
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 59
;59:	}
LABELV $88
line 62
;60:
;61:	// play an apropriate pain sound
;62:	if ( (level.time > player->pain_debounce_time) && !(player->flags & FL_GODMODE) ) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
LEI4 $90
ADDRLP4 28
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $90
line 65
;63:
;64:		// don't do more than two pain sounds a second
;65:		if ( level.time - client->ps.painTime < 500 ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $93
line 66
;66:			return;
ADDRGP4 $80
JUMPV
LABELV $93
line 68
;67:		}
;68:		P_SetTwitchInfo(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 P_SetTwitchInfo
CALLV
pop
line 69
;69:		player->pain_debounce_time = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 70
;70:		G_AddEvent( player, EV_PAIN, player->health );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 77
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 71
;71:		client->ps.damageEvent++;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 73
;72:
;73:		if (client->damage_armor && !client->damage_blood)
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1620
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $97
ADDRLP4 0
INDIRP4
CNSTI4 1624
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $97
line 74
;74:		{
line 75
;75:			client->ps.damageType = 1; //pure shields
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 1
ASGNI4
line 76
;76:		}
ADDRGP4 $98
JUMPV
LABELV $97
line 77
;77:		else if (client->damage_armor)
ADDRLP4 0
INDIRP4
CNSTI4 1620
ADDP4
INDIRI4
CNSTI4 0
EQI4 $99
line 78
;78:		{
line 79
;79:			client->ps.damageType = 2; //shields and health
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 2
ASGNI4
line 80
;80:		}
ADDRGP4 $100
JUMPV
LABELV $99
line 82
;81:		else
;82:		{
line 83
;83:			client->ps.damageType = 0; //pure health
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 84
;84:		}
LABELV $100
LABELV $98
line 85
;85:	}
LABELV $90
line 88
;86:
;87:
;88:	client->ps.damageCount = count;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 93
;89:
;90:	//
;91:	// clear totals
;92:	//
;93:	client->damage_blood = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1624
ADDP4
CNSTI4 0
ASGNI4
line 94
;94:	client->damage_armor = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1620
ADDP4
CNSTI4 0
ASGNI4
line 95
;95:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1628
ADDP4
CNSTI4 0
ASGNI4
line 96
;96:}
LABELV $80
endproc P_DamageFeedback 48 12
export P_WorldEffects
proc P_WorldEffects 40 32
line 107
;97:
;98:
;99:
;100:/*
;101:=============
;102:P_WorldEffects
;103:
;104:Check for lava / slime contents and drowning
;105:=============
;106:*/
;107:void P_WorldEffects( gentity_t *ent ) {
line 111
;108:	qboolean	envirosuit;
;109:	int			waterlevel;
;110:
;111:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $102
line 112
;112:		ent->client->airOutTime = level.time + 12000;	// don't need air
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1700
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 113
;113:		return;
ADDRGP4 $101
JUMPV
LABELV $102
line 116
;114:	}
;115:
;116:	waterlevel = ent->waterlevel;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ASGNI4
line 118
;117:
;118:	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $107
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $107
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $108
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 123
;119:
;120:	//
;121:	// check for drowning
;122:	//
;123:	if ( waterlevel == 3 ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $109
line 125
;124:		// envirosuit give air
;125:		if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $111
line 126
;126:			ent->client->airOutTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1700
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 127
;127:		}
LABELV $111
line 130
;128:
;129:		// if out of air, start drowning
;130:		if ( ent->client->airOutTime < level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1700
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $110
line 132
;131:			// drown!
;132:			ent->client->airOutTime += 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1700
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 133
;133:			if ( ent->health > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $110
line 135
;134:				// take more damage the longer underwater
;135:				ent->damage += 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 136
;136:				if (ent->damage > 15)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 15
LEI4 $119
line 137
;137:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 15
ASGNI4
LABELV $119
line 140
;138:
;139:				// play a gurp sound instead of a normal pain sound
;140:				if (ent->health <= ent->damage) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
GTI4 $121
line 141
;141:					G_Sound(ent, CHAN_VOICE, G_SoundIndex(/*"*drown.wav"*/"sound/player/gurp1.wav"));
ADDRGP4 $123
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 142
;142:				} else if (rand()&1) {
ADDRGP4 $122
JUMPV
LABELV $121
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $124
line 143
;143:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp1.wav"));
ADDRGP4 $123
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 144
;144:				} else {
ADDRGP4 $125
JUMPV
LABELV $124
line 145
;145:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp2.wav"));
ADDRGP4 $126
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 146
;146:				}
LABELV $125
LABELV $122
line 149
;147:
;148:				// don't play a normal pain sound
;149:				ent->pain_debounce_time = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 151
;150:
;151:				G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 29
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 153
;152:					ent->damage, DAMAGE_NO_ARMOR, MOD_WATER);
;153:			}
line 154
;154:		}
line 155
;155:	} else {
ADDRGP4 $110
JUMPV
LABELV $109
line 156
;156:		ent->client->airOutTime = level.time + 12000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1700
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 157
;157:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 2
ASGNI4
line 158
;158:	}
LABELV $110
line 163
;159:
;160:	//
;161:	// check for sizzle damage (move to pmove?)
;162:	//
;163:	if (waterlevel && 
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $129
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 131074
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $129
line 164
;164:		(ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
line 165
;165:		if (ent->health > 0
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $131
ADDRLP4 16
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $131
line 166
;166:			&& ent->pain_debounce_time <= level.time	) {
line 168
;167:
;168:			if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $134
line 169
;169:				G_AddEvent( ent, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 83
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 170
;170:			} else {
ADDRGP4 $135
JUMPV
LABELV $134
line 171
;171:				if (ent->watertype & CONTENTS_LAVA) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $136
line 172
;172:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 30
ADDRLP4 0
INDIRI4
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 31
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 174
;173:						30*waterlevel, 0, MOD_LAVA);
;174:				}
LABELV $136
line 176
;175:
;176:				if (ent->watertype & CONTENTS_SLIME) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $138
line 177
;177:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 10
ADDRLP4 0
INDIRI4
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 179
;178:						10*waterlevel, 0, MOD_SLIME);
;179:				}
LABELV $138
line 180
;180:			}
LABELV $135
line 181
;181:		}
LABELV $131
line 182
;182:	}
LABELV $129
line 183
;183:}
LABELV $101
endproc P_WorldEffects 40 32
export DoImpact
proc DoImpact 96 32
line 192
;184:
;185:
;186:
;187:
;188:
;189://==============================================================
;190:extern void G_ApplyKnockback( gentity_t *targ, vec3_t newDir, float knockback );
;191:void DoImpact( gentity_t *self, gentity_t *other, qboolean damageSelf )
;192:{
line 197
;193:	float magnitude, my_mass;
;194:	vec3_t	velocity;
;195:	int cont;
;196:
;197:	if( self->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
line 198
;198:	{
line 199
;199:		VectorCopy( self->client->ps.velocity, velocity );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 200
;200:		my_mass = self->mass;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ASGNF4
line 201
;201:	}
ADDRGP4 $142
JUMPV
LABELV $141
line 203
;202:	else 
;203:	{
line 204
;204:		VectorCopy( self->s.pos.trDelta, velocity );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 205
;205:		if ( self->s.pos.trType == TR_GRAVITY )
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
NEI4 $143
line 206
;206:		{
line 207
;207:			velocity[2] -= 0.25f * g_gravity.value;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1048576000
ADDRGP4 g_gravity+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 208
;208:		}
LABELV $143
line 209
;209:		if( !self->mass )
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
CNSTF4 0
NEF4 $147
line 210
;210:		{
line 211
;211:			my_mass = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 212
;212:		}
ADDRGP4 $148
JUMPV
LABELV $147
line 213
;213:		else if ( self->mass <= 10 )
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
CNSTF4 1092616192
GTF4 $149
line 214
;214:		{
line 215
;215:			my_mass = 10;
ADDRLP4 16
CNSTF4 1092616192
ASGNF4
line 216
;216:		}
ADDRGP4 $150
JUMPV
LABELV $149
line 218
;217:		else
;218:		{
line 219
;219:			my_mass = self->mass;///10;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ASGNF4
line 220
;220:		}
LABELV $150
LABELV $148
line 221
;221:	}
LABELV $142
line 223
;222:
;223:	magnitude = VectorLength( velocity ) * my_mass / 10;
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1092616192
DIVF4
ASGNF4
line 236
;224:
;225:	/*
;226:	if(pointcontents(self.absmax)==CONTENT_WATER)//FIXME: or other watertypes
;227:		magnitude/=3;							//water absorbs 2/3 velocity
;228:
;229:	if(self.classname=="barrel"&&self.aflag)//rolling barrels are made for impacts!
;230:		magnitude*=3;
;231:
;232:	if(self.frozen>0&&magnitude<300&&self.flags&FL_ONGROUND&&loser==world&&self.velocity_z<-20&&self.last_onground+0.3<time)
;233:		magnitude=300;
;234:	*/
;235:
;236:	if ( !self->client || self->client->ps.lastOnGround+300<level.time || ( self->client->ps.lastOnGround+100 < level.time && other->material >= MAT_GLASS ) )
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $156
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 300
ADDI4
ADDRGP4 level+32
INDIRI4
LTI4 $156
ADDRLP4 32
INDIRI4
CNSTI4 100
ADDI4
ADDRGP4 level+32
INDIRI4
GEI4 $151
ADDRFP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRI4
CNSTI4 1
LTI4 $151
LABELV $156
line 237
;237:	{
line 239
;238:		vec3_t dir1, dir2;
;239:		float force = 0, dot;
ADDRLP4 36
CNSTF4 0
ASGNF4
line 241
;240:
;241:		if ( other->material >= MAT_GLASS )
ADDRFP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRI4
CNSTI4 1
LTI4 $157
line 242
;242:			magnitude *= 2;
ADDRLP4 0
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $157
line 245
;243:
;244:		//damage them
;245:		if ( magnitude >= 100 && other->s.number < ENTITYNUM_WORLD )
ADDRLP4 0
INDIRF4
CNSTF4 1120403456
LTF4 $159
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $159
line 246
;246:		{
line 247
;247:			VectorCopy( velocity, dir1 );
ADDRLP4 52
ADDRLP4 4
INDIRB
ASGNB 12
line 248
;248:			VectorNormalize( dir1 );
ADDRLP4 52
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 249
;249:			if( VectorCompare( other->r.currentOrigin, vec3_origin ) )
ADDRFP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 68
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $161
line 250
;250:			{//a brush with no origin
line 251
;251:				VectorCopy ( dir1, dir2 );
ADDRLP4 40
ADDRLP4 52
INDIRB
ASGNB 12
line 252
;252:			}
ADDRGP4 $162
JUMPV
LABELV $161
line 254
;253:			else
;254:			{
line 255
;255:				VectorSubtract( other->r.currentOrigin, self->r.currentOrigin, dir2 );
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 368
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84
CNSTI4 372
ASGNI4
ADDRLP4 40+4
ADDRLP4 72
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 88
CNSTI4 376
ASGNI4
ADDRLP4 40+8
ADDRFP4 4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 256
;256:				VectorNormalize( dir2 );
ADDRLP4 40
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 257
;257:			}
LABELV $162
line 259
;258:
;259:			dot = DotProduct( dir1, dir2 );
ADDRLP4 64
ADDRLP4 52
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 52+4
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52+8
INDIRF4
ADDRLP4 40+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 261
;260:
;261:			if ( dot >= 0.2 )
ADDRLP4 64
INDIRF4
CNSTF4 1045220557
LTF4 $169
line 262
;262:			{
line 263
;263:				force = dot;
ADDRLP4 36
ADDRLP4 64
INDIRF4
ASGNF4
line 264
;264:			}
ADDRGP4 $170
JUMPV
LABELV $169
line 266
;265:			else
;266:			{
line 267
;267:				force = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
line 268
;268:			}
LABELV $170
line 270
;269:
;270:			force *= (magnitude/50);
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 0
INDIRF4
CNSTF4 1112014848
DIVF4
MULF4
ASGNF4
line 272
;271:
;272:			cont = trap_PointContents( other->r.absmax, other->s.number );
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 356
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 76
INDIRI4
ASGNI4
line 273
;273:			if( (cont&CONTENTS_WATER) )//|| (self.classname=="barrel"&&self.aflag))//FIXME: or other watertypes
ADDRLP4 20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $171
line 274
;274:			{
line 275
;275:				force /= 3;							//water absorbs 2/3 velocity
ADDRLP4 36
ADDRLP4 36
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 276
;276:			}
LABELV $171
line 283
;277:
;278:			/*
;279:			if(self.frozen>0&&force>10)
;280:				force=10;
;281:			*/
;282:
;283:			if( ( force >= 1 && other->s.number != 0 ) || force >= 10)
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
LTF4 $176
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $175
LABELV $176
ADDRLP4 36
INDIRF4
CNSTF4 1092616192
LTF4 $173
LABELV $175
line 284
;284:			{
line 292
;285:	/*			
;286:				dprint("Damage other (");
;287:				dprint(loser.classname);
;288:				dprint("): ");
;289:				dprint(ftos(force));
;290:				dprint("\n");
;291:	*/
;292:				if ( other->r.svFlags & SVF_GLASS_BRUSH )
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
CNSTI4 0
EQI4 $177
line 293
;293:				{
line 294
;294:					other->splashRadius = (float)(self->r.maxs[0] - self->r.mins[0])/4.0f;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 700
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
SUBF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 295
;295:				}
LABELV $177
line 296
;296:				if ( other->takedamage )
ADDRFP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $179
line 297
;297:				{
line 298
;298:					G_Damage( other, self, self, velocity, self->r.currentOrigin, force, DAMAGE_NO_ARMOR, MOD_CRUSH);//FIXME: MOD_IMPACT
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 299
;299:				}
ADDRGP4 $180
JUMPV
LABELV $179
line 301
;300:				else
;301:				{
line 302
;302:					G_ApplyKnockback( other, dir2, force );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 G_ApplyKnockback
CALLV
pop
line 303
;303:				}
LABELV $180
line 304
;304:			}
LABELV $173
line 305
;305:		}
LABELV $159
line 307
;306:
;307:		if ( damageSelf && self->takedamage )
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $181
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $181
line 308
;308:		{
line 311
;309:			//Now damage me
;310:			//FIXME: more lenient falling damage, especially for when driving a vehicle
;311:			if ( self->client && self->client->ps.fd.forceJumpZStart )
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $183
ADDRLP4 72
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
EQF4 $183
line 312
;312:			{//we were force-jumping
line 313
;313:				if ( self->r.currentOrigin[2] >= self->client->ps.fd.forceJumpZStart )
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
LTF4 $185
line 314
;314:				{//we landed at same height or higher than we landed
line 315
;315:					magnitude = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 316
;316:				}
ADDRGP4 $186
JUMPV
LABELV $185
line 318
;317:				else
;318:				{//FIXME: take off some of it, at least?
line 319
;319:					magnitude = (self->client->ps.fd.forceJumpZStart-self->r.currentOrigin[2])/3;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 320
;320:				}
LABELV $186
line 321
;321:			}
LABELV $183
line 323
;322:			//if(self.classname!="monster_mezzoman"&&self.netname!="spider")//Cats always land on their feet
;323:				if( ( magnitude >= 100 + self->health && self->s.number != 0 && self->s.weapon != WP_SABER ) || ( magnitude >= 700 ) )//&& self.safe_time < level.time ))//health here is used to simulate structural integrity
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
LTF4 $191
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $191
ADDRLP4 76
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $189
LABELV $191
ADDRLP4 0
INDIRF4
CNSTF4 1143930880
LTF4 $187
LABELV $189
line 324
;324:				{
line 325
;325:					if ( (self->s.weapon == WP_SABER || self->s.number == 0) && self->client && self->client->ps.groundEntityNum < ENTITYNUM_NONE && magnitude < 1000 )
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
EQI4 $194
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $192
LABELV $194
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $192
ADDRLP4 84
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
GEI4 $192
ADDRLP4 0
INDIRF4
CNSTF4 1148846080
GEF4 $192
line 326
;326:					{//players and jedi take less impact damage
line 328
;327:						//allow for some lenience on high falls
;328:						magnitude /= 2;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 335
;329:						/*
;330:						if ( self.absorb_time >= time )//crouching on impact absorbs 1/2 the damage
;331:						{
;332:							magnitude/=2;
;333:						}
;334:						*/
;335:					}
LABELV $192
line 336
;336:					magnitude /= 40;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
DIVF4
ASGNF4
line 337
;337:					magnitude = magnitude - force/2;//If damage other, subtract half of that damage off of own injury
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
ASGNF4
line 338
;338:					if ( magnitude >= 1 )
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
LTF4 $195
line 339
;339:					{
line 352
;340:		//FIXME: Put in a thingtype impact sound function
;341:		/*					
;342:						dprint("Damage self (");
;343:						dprint(self.classname);
;344:						dprint("): ");
;345:						dprint(ftos(magnitude));
;346:						dprint("\n");
;347:		*/
;348:						/*
;349:						if ( self.classname=="player_sheep "&& self.flags&FL_ONGROUND && self.velocity_z > -50 )
;350:							return;
;351:						*/
;352:						G_Damage( self, NULL, NULL, NULL, self->r.currentOrigin, magnitude/2, DAMAGE_NO_ARMOR, MOD_FALLING );//FIXME: MOD_IMPACT
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
CNSTP4 0
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
DIVF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 353
;353:					}
LABELV $195
line 354
;354:				}
LABELV $187
line 355
;355:		}
LABELV $181
line 366
;356:
;357:		//FIXME: slow my velocity some?
;358:
;359:		// NOTENOTE We don't use lastimpact as of yet
;360://		self->lastImpact = level.time;
;361:
;362:		/*
;363:		if(self.flags&FL_ONGROUND)
;364:			self.last_onground=time;
;365:		*/
;366:	}
LABELV $151
line 367
;367:}
LABELV $140
endproc DoImpact 96 32
export G_SetClientSound
proc G_SetClientSound 8 0
line 374
;368:
;369:/*
;370:===============
;371:G_SetClientSound
;372:===============
;373:*/
;374:void G_SetClientSound( gentity_t *ent ) {
line 375
;375:	if (ent->waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $198
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 131074
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $198
line 376
;376:		ent->client->ps.loopSound = level.snd_fry;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 level+220
INDIRI4
ASGNI4
line 377
;377:	} else {
ADDRGP4 $199
JUMPV
LABELV $198
line 378
;378:		ent->client->ps.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 0
ASGNI4
line 379
;379:	}
LABELV $199
line 380
;380:}
LABELV $197
endproc G_SetClientSound 8 0
export ClientImpacts
proc ClientImpacts 1100 12
line 391
;381:
;382:
;383:
;384://==============================================================
;385:
;386:/*
;387:==============
;388:ClientImpacts
;389:==============
;390:*/
;391:void ClientImpacts( gentity_t *ent, pmove_t *pm ) {
line 396
;392:	int		i, j;
;393:	trace_t	trace;
;394:	gentity_t	*other;
;395:
;396:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 397
;397:	for (i=0 ; i<pm->numtouch ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
line 398
;398:		for (j=0 ; j<i ; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $209
JUMPV
LABELV $206
line 399
;399:			if (pm->touchents[j] == pm->touchents[i] ) {
ADDRLP4 1092
CNSTI4 2
ASGNI4
ADDRLP4 1096
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 1092
INDIRI4
LSHI4
ADDRLP4 1096
INDIRP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 1092
INDIRI4
LSHI4
ADDRLP4 1096
INDIRP4
ADDP4
INDIRI4
NEI4 $210
line 400
;400:				break;
ADDRGP4 $208
JUMPV
LABELV $210
line 402
;401:			}
;402:		}
LABELV $207
line 398
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $209
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $206
LABELV $208
line 403
;403:		if (j != i) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $212
line 404
;404:			continue;	// duplicated
ADDRGP4 $203
JUMPV
LABELV $212
line 406
;405:		}
;406:		other = &g_entities[ pm->touchents[i] ];
ADDRLP4 8
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 408
;407:
;408:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 1092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $214
ADDRLP4 1092
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
line 409
;409:			ent->touch( ent, other, &trace );
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 410
;410:		}
LABELV $214
line 412
;411:
;412:		if ( !other->touch ) {
ADDRLP4 8
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $216
line 413
;413:			continue;
ADDRGP4 $203
JUMPV
LABELV $216
line 416
;414:		}
;415:
;416:		other->touch( other, ent, &trace );
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 417
;417:	}
LABELV $203
line 397
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
LTI4 $202
line 419
;418:
;419:}
LABELV $201
endproc ClientImpacts 1100 12
data
align 4
LABELV $219
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_TouchTriggers
code
proc G_TouchTriggers 5264 16
line 429
;420:
;421:/*
;422:============
;423:G_TouchTriggers
;424:
;425:Find all trigger entities that ent's current position touches.
;426:Spectators will only interact with teleporters.
;427:============
;428:*/
;429:void	G_TouchTriggers( gentity_t *ent ) {
line 437
;430:	int			i, num;
;431:	int			touch[MAX_GENTITIES];
;432:	gentity_t	*hit;
;433:	trace_t		trace;
;434:	vec3_t		mins, maxs;
;435:	static vec3_t	range = { 40, 40, 52 };
;436:
;437:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $220
line 438
;438:		return;
ADDRGP4 $218
JUMPV
LABELV $220
line 442
;439:	}
;440:
;441:	// dead clients don't activate triggers!
;442:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $222
line 443
;443:		return;
ADDRGP4 $218
JUMPV
LABELV $222
line 446
;444:	}
;445:
;446:	VectorSubtract( ent->client->ps.origin, range, mins );
ADDRLP4 5212
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1088
ADDRLP4 5212
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $219
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 5212
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $219+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $219+8
INDIRF4
SUBF4
ASGNF4
line 447
;447:	VectorAdd( ent->client->ps.origin, range, maxs );
ADDRLP4 5216
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1100
ADDRLP4 5216
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $219
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 5216
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $219+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $219+8
INDIRF4
ADDF4
ASGNF4
line 449
;448:
;449:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1116
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 5220
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 1112
ADDRLP4 5220
INDIRI4
ASGNI4
line 452
;450:
;451:	// can't use ent->r.absmin, because that has a one unit pad
;452:	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
ADDRLP4 5224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5228
ADDRLP4 5224
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1088
ADDRLP4 5228
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 5224
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 5228
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 5224
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088+8
ADDRLP4 5232
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 5232
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 453
;453:	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );
ADDRLP4 5236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5240
ADDRLP4 5236
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1100
ADDRLP4 5240
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 5236
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 5240
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 5236
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100+8
ADDRLP4 5244
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 5244
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 455
;454:
;455:	for ( i=0 ; i<num ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $239
JUMPV
LABELV $236
line 456
;456:		hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1116
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 458
;457:
;458:		if ( !hit->touch && !ent->touch ) {
ADDRLP4 5248
CNSTI4 648
ASGNI4
ADDRLP4 5252
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
ADDRLP4 5248
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 5252
INDIRU4
NEU4 $240
ADDRFP4 0
INDIRP4
ADDRLP4 5248
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 5252
INDIRU4
NEU4 $240
line 459
;459:			continue;
ADDRGP4 $237
JUMPV
LABELV $240
line 461
;460:		}
;461:		if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $242
line 462
;462:			continue;
ADDRGP4 $237
JUMPV
LABELV $242
line 466
;463:		}
;464:
;465:		// ignore most entities if a spectator
;466:		if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $244
line 467
;467:			if ( hit->s.eType != ET_TELEPORT_TRIGGER &&
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 11
EQI4 $246
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 Touch_DoorTrigger
CVPU4 4
EQU4 $246
line 470
;468:				// this is ugly but adding a new ET_? type will
;469:				// most likely cause network incompatibilities
;470:				hit->touch != Touch_DoorTrigger) {
line 471
;471:				continue;
ADDRGP4 $237
JUMPV
LABELV $246
line 473
;472:			}
;473:		}
LABELV $244
line 477
;474:
;475:		// use seperate code for determining if an item is picked up
;476:		// so you don't have to actually contact its bounding box
;477:		if ( hit->s.eType == ET_ITEM ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $248
line 478
;478:			if ( !BG_PlayerTouchesItem( &ent->client->ps, &hit->s, level.time ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 5256
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 5256
INDIRI4
CNSTI4 0
NEI4 $249
line 479
;479:				continue;
ADDRGP4 $237
JUMPV
line 481
;480:			}
;481:		} else {
LABELV $248
line 482
;482:			if ( !trap_EntityContact( mins, maxs, hit ) ) {
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 5256
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 5256
INDIRI4
CNSTI4 0
NEI4 $253
line 483
;483:				continue;
ADDRGP4 $237
JUMPV
LABELV $253
line 485
;484:			}
;485:		}
LABELV $249
line 487
;486:
;487:		memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 489
;488:
;489:		if ( hit->touch ) {
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $255
line 490
;490:			hit->touch (hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 491
;491:		}
LABELV $255
line 493
;492:
;493:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 5256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5256
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $257
ADDRLP4 5256
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $257
line 494
;494:			ent->touch( ent, hit, &trace );
ADDRLP4 5260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5260
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 5260
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 495
;495:		}
LABELV $257
line 496
;496:	}
LABELV $237
line 455
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $239
ADDRLP4 4
INDIRI4
ADDRLP4 1112
INDIRI4
LTI4 $236
line 499
;497:
;498:	// if we didn't touch a jump pad this pmove frame
;499:	if ( ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount ) {
ADDRLP4 5248
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5248
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
ADDRLP4 5248
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
EQI4 $259
line 500
;500:		ent->client->ps.jumppad_frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 501
;501:		ent->client->ps.jumppad_ent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 502
;502:	}
LABELV $259
line 503
;503:}
LABELV $218
endproc G_TouchTriggers 5264 16
lit
align 4
LABELV $262
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_MoverTouchPushTriggers
code
proc G_MoverTouchPushTriggers 5328 16
line 515
;504:
;505:
;506:/*
;507:============
;508:G_MoverTouchTriggers
;509:
;510:Find all trigger entities that ent's current position touches.
;511:Spectators will only interact with teleporters.
;512:============
;513:*/
;514:void G_MoverTouchPushTriggers( gentity_t *ent, vec3_t oldOrg ) 
;515:{
line 522
;516:	int			i, num;
;517:	float		step, stepSize, dist;
;518:	int			touch[MAX_GENTITIES];
;519:	gentity_t	*hit;
;520:	trace_t		trace;
;521:	vec3_t		mins, maxs, dir, size, checkSpot;
;522:	const vec3_t	range = { 40, 40, 52 };
ADDRLP4 5224
ADDRGP4 $262
INDIRB
ASGNB 12
line 525
;523:
;524:	// non-moving movers don't hit triggers!
;525:	if ( !VectorLengthSquared( ent->s.pos.trDelta ) ) 
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 5272
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 5272
INDIRF4
CNSTF4 0
NEF4 $263
line 526
;526:	{
line 527
;527:		return;
ADDRGP4 $261
JUMPV
LABELV $263
line 530
;528:	}
;529:
;530:	VectorSubtract( ent->r.mins, ent->r.maxs, size );
ADDRLP4 5276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5260
ADDRLP4 5276
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDRLP4 5276
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5260+4
ADDRLP4 5276
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDRLP4 5276
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5260+8
ADDRLP4 5280
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 5280
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
SUBF4
ASGNF4
line 531
;531:	stepSize = VectorLength( size );
ADDRLP4 5260
ARGP4
ADDRLP4 5284
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 5252
ADDRLP4 5284
INDIRF4
ASGNF4
line 532
;532:	if ( stepSize < 1 )
ADDRLP4 5252
INDIRF4
CNSTF4 1065353216
GEF4 $267
line 533
;533:	{
line 534
;534:		stepSize = 1;
ADDRLP4 5252
CNSTF4 1065353216
ASGNF4
line 535
;535:	}
LABELV $267
line 537
;536:
;537:	VectorSubtract( ent->r.currentOrigin, oldOrg, dir );
ADDRLP4 5288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 5240
ADDRLP4 5288
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 5292
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5240+4
ADDRLP4 5288
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 5292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5240+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 538
;538:	dist = VectorNormalize( dir );
ADDRLP4 5240
ARGP4
ADDRLP4 5296
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 5256
ADDRLP4 5296
INDIRF4
ASGNF4
line 539
;539:	for ( step = 0; step <= dist; step += stepSize )
ADDRLP4 5236
CNSTF4 0
ASGNF4
ADDRGP4 $274
JUMPV
LABELV $271
line 540
;540:	{
line 541
;541:		VectorMA( ent->r.currentOrigin, step, dir, checkSpot );
ADDRLP4 5300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
ADDRLP4 5300
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 5240
INDIRF4
ADDRLP4 5236
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+4
ADDRLP4 5300
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 5240+4
INDIRF4
ADDRLP4 5236
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 5240+8
INDIRF4
ADDRLP4 5236
INDIRF4
MULF4
ADDF4
ASGNF4
line 542
;542:		VectorSubtract( checkSpot, range, mins );
ADDRLP4 1088
ADDRLP4 1112
INDIRF4
ADDRLP4 5224
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5224+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 5224+8
INDIRF4
SUBF4
ASGNF4
line 543
;543:		VectorAdd( checkSpot, range, maxs );
ADDRLP4 1100
ADDRLP4 1112
INDIRF4
ADDRLP4 5224
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5224+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 5224+8
INDIRF4
ADDF4
ASGNF4
line 545
;544:
;545:		num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1128
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 5308
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 1124
ADDRLP4 5308
INDIRI4
ASGNI4
line 548
;546:
;547:		// can't use ent->r.absmin, because that has a one unit pad
;548:		VectorAdd( checkSpot, ent->r.mins, mins );
ADDRLP4 5312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
ADDRLP4 1112
INDIRF4
ADDRLP4 5312
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5312
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1088+8
ADDRLP4 1112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 549
;549:		VectorAdd( checkSpot, ent->r.maxs, maxs );
ADDRLP4 5316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1112
INDIRF4
ADDRLP4 5316
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5316
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 551
;550:
;551:		for ( i=0 ; i<num ; i++ ) 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $302
JUMPV
LABELV $299
line 552
;552:		{
line 553
;553:			hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1128
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 555
;554:
;555:			if ( hit->s.eType != ET_PUSH_TRIGGER )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
EQI4 $303
line 556
;556:			{
line 557
;557:				continue;
ADDRGP4 $300
JUMPV
LABELV $303
line 560
;558:			}
;559:
;560:			if ( hit->touch == NULL ) 
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $305
line 561
;561:			{
line 562
;562:				continue;
ADDRGP4 $300
JUMPV
LABELV $305
line 565
;563:			}
;564:
;565:			if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) 
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $307
line 566
;566:			{
line 567
;567:				continue;
ADDRGP4 $300
JUMPV
LABELV $307
line 571
;568:			}
;569:
;570:
;571:			if ( !trap_EntityContact( mins, maxs, hit ) ) 
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 5320
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 5320
INDIRI4
CNSTI4 0
NEI4 $309
line 572
;572:			{
line 573
;573:				continue;
ADDRGP4 $300
JUMPV
LABELV $309
line 576
;574:			}
;575:
;576:			memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 578
;577:
;578:			if ( hit->touch != NULL ) 
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $311
line 579
;579:			{
line 580
;580:				hit->touch(hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 581
;581:			}
LABELV $311
line 582
;582:		}
LABELV $300
line 551
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $302
ADDRLP4 4
INDIRI4
ADDRLP4 1124
INDIRI4
LTI4 $299
line 583
;583:	}
LABELV $272
line 539
ADDRLP4 5236
ADDRLP4 5236
INDIRF4
ADDRLP4 5252
INDIRF4
ADDF4
ASGNF4
LABELV $274
ADDRLP4 5236
INDIRF4
ADDRLP4 5256
INDIRF4
LEF4 $271
line 584
;584:}
LABELV $261
endproc G_MoverTouchPushTriggers 5328 16
export SpectatorThink
proc SpectatorThink 400 12
line 591
;585:
;586:/*
;587:=================
;588:SpectatorThink
;589:=================
;590:*/
;591:void SpectatorThink( gentity_t *ent, usercmd_t *ucmd ) {
line 595
;592:	pmove_t	pm;
;593:	gclient_t	*client;
;594:
;595:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 597
;596:
;597:	if ( client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 2
EQI4 $314
line 598
;598:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 599
;599:		client->ps.speed = 400;	// faster than normal
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 400
ASGNI4
line 600
;600:		client->ps.basespeed = 400;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 400
ASGNI4
line 603
;601:
;602:		// set up for pmove
;603:		memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 380
ARGI4
ADDRGP4 memset
CALLP4
pop
line 604
;604:		pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 605
;605:		pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 28
line 606
;606:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 4+32
CNSTI4 17
ASGNI4
line 607
;607:		pm.trace = trap_Trace;
ADDRLP4 4+240
ADDRGP4 trap_Trace
ASGNP4
line 608
;608:		pm.pointcontents = trap_PointContents;
ADDRLP4 4+244
ADDRGP4 trap_PointContents
ASGNP4
line 610
;609:
;610:		pm.animations = NULL;
ADDRLP4 4+224
CNSTP4 0
ASGNP4
line 613
;611:
;612:		// perform a pmove
;613:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 615
;614:		// save results of pmove
;615:		VectorCopy( client->ps.origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 617
;616:
;617:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 618
;618:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 619
;619:	}
LABELV $314
line 621
;620:
;621:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 1600
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
ASGNI4
line 622
;622:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 1596
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 625
;623:
;624:	// attack button cycles through spectators
;625:	if ( ( client->buttons & BUTTON_ATTACK ) && ! ( client->oldbuttons & BUTTON_ATTACK ) ) {
ADDRLP4 392
CNSTI4 1
ASGNI4
ADDRLP4 396
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
ADDRLP4 392
INDIRI4
BANDI4
ADDRLP4 396
INDIRI4
EQI4 $321
ADDRLP4 0
INDIRP4
CNSTI4 1600
ADDP4
INDIRI4
ADDRLP4 392
INDIRI4
BANDI4
ADDRLP4 396
INDIRI4
NEI4 $321
line 626
;626:		Cmd_FollowCycle_f( ent, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 627
;627:	}
LABELV $321
line 629
;628:
;629:	if (client->sess.spectatorState == SPECTATOR_FOLLOW && (ucmd->upmove > 0))
ADDRLP4 0
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 2
NEI4 $323
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $323
line 630
;630:	{ //jump now removes you from follow mode
line 631
;631:		StopFollowing(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 632
;632:	}
LABELV $323
line 633
;633:}
LABELV $313
endproc SpectatorThink 400 12
export ClientInactivityTimer
proc ClientInactivityTimer 12 8
line 644
;634:
;635:
;636:
;637:/*
;638:=================
;639:ClientInactivityTimer
;640:
;641:Returns qfalse if the client is dropped
;642:=================
;643:*/
;644:qboolean ClientInactivityTimer( gclient_t *client ) {
line 645
;645:	if ( ! g_inactivity.integer ) {
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 0
NEI4 $326
line 648
;646:		// give everyone some time, so if the operator sets g_inactivity during
;647:		// gameplay, everyone isn't kicked
;648:		client->inactivityTime = level.time + 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 649
;649:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1692
ADDP4
CNSTI4 0
ASGNI4
line 650
;650:	} else if ( client->pers.cmd.forwardmove || 
ADDRGP4 $327
JUMPV
LABELV $326
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1408
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $334
ADDRLP4 0
INDIRP4
CNSTI4 1409
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $334
ADDRLP4 0
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $334
ADDRLP4 0
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 129
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $330
LABELV $334
line 653
;651:		client->pers.cmd.rightmove || 
;652:		client->pers.cmd.upmove ||
;653:		(client->pers.cmd.buttons & (BUTTON_ATTACK|BUTTON_ALT_ATTACK)) ) {
line 654
;654:		client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 655
;655:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1692
ADDP4
CNSTI4 0
ASGNI4
line 656
;656:	} else if ( !client->pers.localClient ) {
ADDRGP4 $331
JUMPV
LABELV $330
ADDRFP4 0
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $337
line 657
;657:		if ( level.time > client->inactivityTime ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
INDIRI4
LEI4 $339
line 658
;658:			trap_DropClient( client - level.clients, "Dropped due to inactivity" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1800
DIVI4
ARGI4
ADDRGP4 $342
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 659
;659:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $325
JUMPV
LABELV $339
line 661
;660:		}
;661:		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 1688
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $343
ADDRLP4 8
INDIRP4
CNSTI4 1692
ADDP4
INDIRI4
CNSTI4 0
NEI4 $343
line 662
;662:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1692
ADDP4
CNSTI4 1
ASGNI4
line 663
;663:			trap_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1800
DIVI4
ARGI4
ADDRGP4 $346
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 664
;664:		}
LABELV $343
line 665
;665:	}
LABELV $337
LABELV $331
LABELV $327
line 666
;666:	return qtrue;
CNSTI4 1
RETI4
LABELV $325
endproc ClientInactivityTimer 12 8
export ClientTimerActions
proc ClientTimerActions 20 0
line 676
;667:}
;668:
;669:/*
;670:==================
;671:ClientTimerActions
;672:
;673:Actions that happen once a second
;674:==================
;675:*/
;676:void ClientTimerActions( gentity_t *ent, int msec ) {
line 679
;677:	gclient_t	*client;
;678:
;679:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 680
;680:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1720
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $349
JUMPV
LABELV $348
line 683
;681:
;682:	while ( client->timeResidual >= 1000 ) 
;683:	{
line 684
;684:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1720
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 687
;685:
;686:		// count down health when over max
;687:		if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $351
line 688
;688:			ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 689
;689:		}
LABELV $351
line 692
;690:
;691:		// count down armor when over max
;692:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $353
line 693
;693:			client->ps.stats[STAT_ARMOR]--;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 694
;694:		}
LABELV $353
line 695
;695:	}
LABELV $349
line 682
ADDRLP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $348
line 696
;696:}
LABELV $347
endproc ClientTimerActions 20 0
export ClientIntermissionThink
proc ClientIntermissionThink 24 0
line 703
;697:
;698:/*
;699:====================
;700:ClientIntermissionThink
;701:====================
;702:*/
;703:void ClientIntermissionThink( gclient_t *client ) {
line 704
;704:	client->ps.eFlags &= ~EF_TALK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 705
;705:	client->ps.eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 710
;706:
;707:	// the level will exit when everyone wants to or after timeouts
;708:
;709:	// swap and latch button actions
;710:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1600
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
ASGNI4
line 711
;711:	client->buttons = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1596
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
ASGNI4
line 712
;712:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 1600
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $356
line 714
;713:		// this used to be an ^1 but once a player says ready, it should stick
;714:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1584
ADDP4
CNSTI4 1
ASGNI4
line 715
;715:	}
LABELV $356
line 716
;716:}
LABELV $355
endproc ClientIntermissionThink 24 0
export ClientEvents
proc ClientEvents 68 32
line 727
;717:
;718:
;719:/*
;720:================
;721:ClientEvents
;722:
;723:Events will be passed on to the clients for presentation,
;724:but any server game effects are handled here
;725:================
;726:*/
;727:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 738
;728:	int		i;//, j;
;729:	int		event;
;730:	gclient_t *client;
;731:	int		damage;
;732:	vec3_t	dir;
;733://	vec3_t	origin, angles;
;734://	qboolean	fired;
;735://	gitem_t *item;
;736://	gentity_t *drop;
;737:
;738:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 740
;739:
;740:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $359
line 741
;741:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 742
;742:	}
LABELV $359
line 743
;743:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $364
JUMPV
LABELV $361
line 744
;744:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ASGNI4
line 746
;745:
;746:		switch ( event ) {
ADDRLP4 32
CNSTI4 15
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $367
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $393
LABELV $392
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $367
ADDRGP4 $366
JUMPV
LABELV $393
ADDRLP4 40
CNSTI4 24
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $380
ADDRLP4 4
INDIRI4
CNSTI4 25
EQI4 $382
ADDRLP4 4
INDIRI4
CNSTI4 26
EQI4 $384
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $366
LABELV $394
ADDRLP4 4
INDIRI4
CNSTI4 41
LTI4 $366
ADDRLP4 4
INDIRI4
CNSTI4 46
GTI4 $366
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $395-164
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $395
address $386
address $387
address $388
address $366
address $390
address $391
code
LABELV $367
line 749
;747:		case EV_FALL:
;748:		case EV_ROLL:
;749:			{
line 750
;750:				int delta = client->ps.eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ASGNI4
line 752
;751:
;752:				if (ent->client && ent->client->ps.fallingToDeath)
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $368
ADDRLP4 52
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $368
line 753
;753:				{
line 754
;754:					break;
ADDRGP4 $366
JUMPV
LABELV $368
line 757
;755:				}
;756:
;757:				if ( ent->s.eType != ET_PLAYER )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $370
line 758
;758:				{
line 759
;759:					break;		// not in the player model
ADDRGP4 $366
JUMPV
LABELV $370
line 762
;760:				}
;761:				
;762:				if ( g_dmflags.integer & DF_NO_FALLING )
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $372
line 763
;763:				{
line 764
;764:					break;
ADDRGP4 $366
JUMPV
LABELV $372
line 767
;765:				}
;766:
;767:				if (delta <= 44)
ADDRLP4 48
INDIRI4
CNSTI4 44
GTI4 $375
line 768
;768:				{
line 769
;769:					break;
ADDRGP4 $366
JUMPV
LABELV $375
line 772
;770:				}
;771:
;772:				damage = delta*0.16; //good enough for now, I guess
ADDRLP4 24
CNSTF4 1042536202
ADDRLP4 48
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 774
;773:
;774:				VectorSet (dir, 0, 0, 1);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 12
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 775
;775:				ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 776
;776:				G_Damage (ent, NULL, NULL, NULL, NULL, damage, DAMAGE_NO_ARMOR, MOD_FALLING);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 777
;777:			}
line 778
;778:			break;
ADDRGP4 $366
JUMPV
LABELV $380
line 780
;779:		case EV_FIRE_WEAPON:
;780:			FireWeapon( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 FireWeapon
CALLV
pop
line 781
;781:			ent->client->dangerTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1788
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 782
;782:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 783
;783:			ent->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
CNSTI4 0
ASGNI4
line 784
;784:			break;
ADDRGP4 $366
JUMPV
LABELV $382
line 787
;785:
;786:		case EV_ALT_FIRE:
;787:			FireWeapon( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 FireWeapon
CALLV
pop
line 788
;788:			ent->client->dangerTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1788
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 789
;789:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 790
;790:			ent->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
CNSTI4 0
ASGNI4
line 791
;791:			break;
ADDRGP4 $366
JUMPV
LABELV $384
line 794
;792:
;793:		case EV_SABER_ATTACK:
;794:			ent->client->dangerTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1788
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 795
;795:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 796
;796:			ent->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
CNSTI4 0
ASGNI4
line 797
;797:			break;
ADDRGP4 $366
JUMPV
LABELV $386
line 801
;798:
;799:		//rww - Note that these must be in the same order (ITEM#-wise) as they are in holdable_t
;800:		case EV_USE_ITEM1: //seeker droid
;801:			ItemUse_Seeker(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Seeker
CALLV
pop
line 802
;802:			break;
ADDRGP4 $366
JUMPV
LABELV $387
line 804
;803:		case EV_USE_ITEM2: //shield
;804:			ItemUse_Shield(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Shield
CALLV
pop
line 805
;805:			break;
ADDRGP4 $366
JUMPV
LABELV $388
line 807
;806:		case EV_USE_ITEM3: //medpack
;807:			ItemUse_MedPack(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_MedPack
CALLV
pop
line 808
;808:			break;
ADDRGP4 $366
JUMPV
line 811
;809:		case EV_USE_ITEM4: //datapad
;810:			//G_Printf("Used Datapad\n");
;811:			break;
LABELV $390
line 813
;812:		case EV_USE_ITEM5: //binoculars
;813:			ItemUse_Binoculars(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Binoculars
CALLV
pop
line 814
;814:			break;
ADDRGP4 $366
JUMPV
LABELV $391
line 816
;815:		case EV_USE_ITEM6: //sentry gun
;816:			ItemUse_Sentry(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Sentry
CALLV
pop
line 817
;817:			break;
line 820
;818:
;819:		default:
;820:			break;
LABELV $366
line 822
;821:		}
;822:	}
LABELV $362
line 743
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $364
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
LTI4 $361
line 824
;823:
;824:}
LABELV $358
endproc ClientEvents 68 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 40 12
line 831
;825:
;826:/*
;827:==============
;828:SendPendingPredictableEvents
;829:==============
;830:*/
;831:void SendPendingPredictableEvents( playerState_t *ps ) {
line 837
;832:	gentity_t *t;
;833:	int event, seq;
;834:	int extEvent, number;
;835:
;836:	// if there are still events pending
;837:	if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $398
line 840
;838:		// create a temporary entity for this event which is sent to everyone
;839:		// except the client who generated the event
;840:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 841
;841:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 843
;842:		// set external event to zero before calling BG_PlayerStateToEntityState
;843:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 844
;844:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTI4 0
ASGNI4
line 846
;845:		// create temporary entity for event
;846:		t = G_TempEntity( ps->origin, event );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 847
;847:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 848
;848:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 849
;849:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 850
;850:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 851
;851:		t->s.eFlags |= EF_PLAYER_EVENT;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 852
;852:		t->s.otherEntityNum = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 854
;853:		// send to everyone except the client who generated the event
;854:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 855
;855:		t->r.singleClient = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 308
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 857
;856:		// set back external event
;857:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 858
;858:	}
LABELV $398
line 859
;859:}
LABELV $397
endproc SendPendingPredictableEvents 40 12
proc G_UpdateForceSightBroadcasts 72 12
line 879
;860:
;861:extern int saberOffSound;
;862:extern int saberOnSound;
;863:
;864:/*
;865:==================
;866:G_UpdateClientBroadcasts
;867:
;868:Determines whether this client should be broadcast to any other clients.  
;869:A client is broadcast when another client is using force sight or is
;870:==================
;871:*/
;872:#define MAX_JEDIMASTER_DISTANCE	2500
;873:#define MAX_JEDIMASTER_FOV		100
;874:
;875:#define MAX_SIGHT_DISTANCE		1500
;876:#define MAX_SIGHT_FOV			100
;877:
;878:static void G_UpdateForceSightBroadcasts ( gentity_t *self )
;879:{
line 883
;880:	int i;
;881:
;882:	// Any clients with force sight on should see this client
;883:	for ( i = 0; i < level.numConnectedClients; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $404
JUMPV
LABELV $401
line 884
;884:	{
line 885
;885:		gentity_t *ent = &g_entities[level.sortedClients[i]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 889
;886:		float	  dist;
;887:		vec3_t	  angles;
;888:	
;889:		if ( ent == self )
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $407
line 890
;890:		{
line 891
;891:			continue;
ADDRGP4 $402
JUMPV
LABELV $407
line 895
;892:		}
;893:
;894:		// Not using force sight so we shouldnt broadcast to this one
;895:		if ( !(ent->client->ps.fd.forcePowersActive & (1<<FP_SEE) ) )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $409
line 896
;896:		{
line 897
;897:			continue;
ADDRGP4 $402
JUMPV
LABELV $409
line 900
;898:		}
;899:
;900:		VectorSubtract( self->client->ps.origin, ent->client->ps.origin, angles );
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
CNSTI4 20
ASGNI4
ADDRLP4 36
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 24
ASGNI4
ADDRLP4 8+4
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 48
CNSTI4 28
ASGNI4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 901
;901:		dist = VectorLengthSquared ( angles );
ADDRLP4 8
ARGP4
ADDRLP4 52
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 902
;902:		vectoangles ( angles, angles );
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 905
;903:
;904:		// Too far away then just forget it
;905:		if ( dist > MAX_SIGHT_DISTANCE * MAX_SIGHT_DISTANCE )
ADDRLP4 20
INDIRF4
CNSTF4 1242125376
LEF4 $413
line 906
;906:		{
line 907
;907:			continue;
ADDRGP4 $402
JUMPV
LABELV $413
line 911
;908:		}
;909:		
;910:		// If not within the field of view then forget it
;911:		if ( !InFieldOfVision ( ent->client->ps.viewangles, MAX_SIGHT_FOV, angles ) )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $415
line 912
;912:		{
line 913
;913:			break;
ADDRGP4 $403
JUMPV
LABELV $415
line 918
;914:		}
;915:
;916:		// Turn on the broadcast bit for the master and since there is only one
;917:		// master we are done
;918:		self->r.broadcastClients[ent->s.clientNum/32] |= (1 << (ent->s.clientNum%32));
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
CNSTI4 32
ASGNI4
ADDRLP4 68
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
MODI4
LSHI4
BORI4
ASGNI4
line 920
;919:	
;920:		break;
ADDRGP4 $403
JUMPV
LABELV $402
line 883
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $404
ADDRLP4 0
INDIRI4
ADDRGP4 level+72
INDIRI4
LTI4 $401
LABELV $403
line 922
;921:	}
;922:}
LABELV $400
endproc G_UpdateForceSightBroadcasts 72 12
proc G_UpdateJediMasterBroadcasts 72 12
line 925
;923:
;924:static void G_UpdateJediMasterBroadcasts ( gentity_t *self )
;925:{
line 929
;926:	int i;
;927:
;928:	// Not jedi master mode then nothing to do
;929:	if ( g_gametype.integer != GT_JEDIMASTER )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $418
line 930
;930:	{
line 931
;931:		return;
ADDRGP4 $417
JUMPV
LABELV $418
line 935
;932:	}
;933:
;934:	// This client isnt the jedi master so it shouldnt broadcast
;935:	if ( !self->client->ps.isJediMaster )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
NEI4 $421
line 936
;936:	{
line 937
;937:		return;
ADDRGP4 $417
JUMPV
LABELV $421
line 941
;938:	}
;939:
;940:	// Broadcast ourself to all clients within range
;941:	for ( i = 0; i < level.numConnectedClients; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $426
JUMPV
LABELV $423
line 942
;942:	{
line 943
;943:		gentity_t *ent = &g_entities[level.sortedClients[i]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 947
;944:		float	  dist;
;945:		vec3_t	  angles;
;946:
;947:		if ( ent == self )
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $429
line 948
;948:		{
line 949
;949:			continue;
ADDRGP4 $424
JUMPV
LABELV $429
line 952
;950:		}
;951:
;952:		VectorSubtract( self->client->ps.origin, ent->client->ps.origin, angles );
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
CNSTI4 20
ASGNI4
ADDRLP4 36
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 24
ASGNI4
ADDRLP4 8+4
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 48
CNSTI4 28
ASGNI4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 953
;953:		dist = VectorLengthSquared ( angles );
ADDRLP4 8
ARGP4
ADDRLP4 52
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 954
;954:		vectoangles ( angles, angles );
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 957
;955:
;956:		// Too far away then just forget it
;957:		if ( dist > MAX_JEDIMASTER_DISTANCE * MAX_JEDIMASTER_DISTANCE )
ADDRLP4 20
INDIRF4
CNSTF4 1254013984
LEF4 $433
line 958
;958:		{
line 959
;959:			continue;
ADDRGP4 $424
JUMPV
LABELV $433
line 963
;960:		}
;961:		
;962:		// If not within the field of view then forget it
;963:		if ( !InFieldOfVision ( ent->client->ps.viewangles, MAX_JEDIMASTER_FOV, angles ) )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $435
line 964
;964:		{
line 965
;965:			continue;
ADDRGP4 $424
JUMPV
LABELV $435
line 970
;966:		}
;967:
;968:		// Turn on the broadcast bit for the master and since there is only one
;969:		// master we are done
;970:		self->r.broadcastClients[ent->s.clientNum/32] |= (1 << (ent->s.clientNum%32));
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
CNSTI4 32
ASGNI4
ADDRLP4 68
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
MODI4
LSHI4
BORI4
ASGNI4
line 971
;971:	}
LABELV $424
line 941
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $426
ADDRLP4 0
INDIRI4
ADDRGP4 level+72
INDIRI4
LTI4 $423
line 972
;972:}
LABELV $417
endproc G_UpdateJediMasterBroadcasts 72 12
export G_UpdateClientBroadcasts
proc G_UpdateClientBroadcasts 0 12
line 975
;973:
;974:void G_UpdateClientBroadcasts ( gentity_t *self )
;975:{
line 977
;976:	// Clear all the broadcast bits for this client
;977:	memset ( self->r.broadcastClients, 0, sizeof ( self->r.broadcastClients ) );
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRGP4 memset
CALLP4
pop
line 980
;978:
;979:	// The jedi master is broadcast to everyone in range
;980:	G_UpdateJediMasterBroadcasts ( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateJediMasterBroadcasts
CALLV
pop
line 983
;981:
;982:	// Anyone with force sight on should see this client
;983:	G_UpdateForceSightBroadcasts ( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateForceSightBroadcasts
CALLV
pop
line 984
;984:}
LABELV $437
endproc G_UpdateClientBroadcasts 0 12
export ClientThink_real
proc ClientThink_real 596 32
line 997
;985:
;986:/*
;987:==============
;988:ClientThink
;989:
;990:This will be called once for each client frame, which will
;991:usually be a couple times for each server frame on fast clients.
;992:
;993:If "g_synchronousClients 1" is set, this will be called exactly
;994:once for each server frame, which makes for smooth demo recording.
;995:==============
;996:*/
;997:void ClientThink_real( gentity_t *ent ) {
line 1005
;998:	gclient_t	*client;
;999:	pmove_t		pm;
;1000:	int			oldEventSequence;
;1001:	int			msec;
;1002:	int			i;
;1003:	usercmd_t	*ucmd;
;1004:
;1005:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1008
;1006:
;1007:	// don't think if the client is not yet connected (and thus not yet spawned in)
;1008:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $439
line 1009
;1009:		return;
ADDRGP4 $438
JUMPV
LABELV $439
line 1012
;1010:	}
;1011:	// mark the time, so the connection sprite can be removed
;1012:	ucmd = &ent->client->pers.cmd;
ADDRLP4 388
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ASGNP4
line 1015
;1013:
;1014:	// sanity check the command time to prevent speedup cheating
;1015:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 388
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $441
line 1016
;1016:		ucmd->serverTime = level.time + 200;
ADDRLP4 388
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1018
;1017://		G_Printf("serverTime <<<<<\n" );
;1018:	}
LABELV $441
line 1019
;1019:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 388
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $445
line 1020
;1020:		ucmd->serverTime = level.time - 1000;
ADDRLP4 388
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 1022
;1021://		G_Printf("serverTime >>>>>\n" );
;1022:	} 
LABELV $445
line 1024
;1023:
;1024:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 392
ADDRLP4 388
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 1027
;1025:	// following others may result in bad times, but we still want
;1026:	// to check for follow toggles
;1027:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 392
INDIRI4
CNSTI4 1
GEI4 $449
ADDRLP4 4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 2
EQI4 $449
line 1028
;1028:		return;
ADDRGP4 $438
JUMPV
LABELV $449
line 1030
;1029:	}
;1030:	if ( msec > 200 ) {
ADDRLP4 392
INDIRI4
CNSTI4 200
LEI4 $451
line 1031
;1031:		msec = 200;
ADDRLP4 392
CNSTI4 200
ASGNI4
line 1032
;1032:	}
LABELV $451
line 1034
;1033:
;1034:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $453
line 1035
;1035:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $456
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1036
;1036:	}
ADDRGP4 $454
JUMPV
LABELV $453
line 1037
;1037:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $458
line 1038
;1038:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $456
ARGP4
ADDRGP4 $461
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1039
;1039:	}
LABELV $458
LABELV $454
line 1041
;1040:
;1041:	if ( pmove_fixed.integer || client->pers.pmoveFixed ) {
ADDRLP4 400
CNSTI4 0
ASGNI4
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 400
INDIRI4
NEI4 $465
ADDRLP4 4
INDIRP4
CNSTI4 1424
ADDP4
INDIRI4
ADDRLP4 400
INDIRI4
EQI4 $462
LABELV $465
line 1042
;1042:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
ADDRLP4 388
INDIRP4
ADDRLP4 388
INDIRP4
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 1045
;1043:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;1044:		//	return;
;1045:	}
LABELV $462
line 1050
;1046:
;1047:	//
;1048:	// check for exiting intermission
;1049:	//
;1050:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $469
line 1051
;1051:		ClientIntermissionThink( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 1052
;1052:		return;
ADDRGP4 $438
JUMPV
LABELV $469
line 1056
;1053:	}
;1054:
;1055:	// spectators don't do much
;1056:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $472
line 1057
;1057:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 3
NEI4 $474
line 1058
;1058:			return;
ADDRGP4 $438
JUMPV
LABELV $474
line 1060
;1059:		}
;1060:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 388
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 1061
;1061:		return;
ADDRGP4 $438
JUMPV
LABELV $472
line 1064
;1062:	}
;1063:
;1064:	if (ent && ent->client && (ent->client->ps.eFlags & EF_INVULNERABLE))
ADDRLP4 404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 408
CNSTU4 0
ASGNU4
ADDRLP4 404
INDIRP4
CVPU4 4
ADDRLP4 408
INDIRU4
EQU4 $476
ADDRLP4 412
ADDRLP4 404
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 412
INDIRP4
CVPU4 4
ADDRLP4 408
INDIRU4
EQU4 $476
ADDRLP4 412
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $476
line 1065
;1065:	{
line 1066
;1066:		if (ent->client->invulnerableTimer <= level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $478
line 1067
;1067:		{
line 1068
;1068:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 416
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 416
INDIRP4
ADDRLP4 416
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1069
;1069:		}
LABELV $478
line 1070
;1070:	}
LABELV $476
line 1073
;1071:
;1072:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;1073:	if ( !ClientInactivityTimer( client ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 416
ADDRGP4 ClientInactivityTimer
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $481
line 1074
;1074:		return;
ADDRGP4 $438
JUMPV
LABELV $481
line 1078
;1075:	}
;1076:
;1077:	// clear the rewards if time
;1078:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1696
ADDP4
INDIRI4
LEI4 $483
line 1079
;1079:		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 420
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 420
INDIRP4
ADDRLP4 420
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 1080
;1080:	}
LABELV $483
line 1082
;1081:
;1082:	if ( client->noclip ) {
ADDRLP4 4
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $486
line 1083
;1083:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1084
;1084:	} else if ( client->ps.eFlags & EF_DISINTEGRATION ) {
ADDRGP4 $487
JUMPV
LABELV $486
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $488
line 1085
;1085:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1086
;1086:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $489
JUMPV
LABELV $488
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $490
line 1087
;1087:		client->ps.pm_type = PM_DEAD;
ADDRLP4 420
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 420
INDIRI4
ADDP4
ADDRLP4 420
INDIRI4
ASGNI4
line 1088
;1088:	} else {
ADDRGP4 $491
JUMPV
LABELV $490
line 1089
;1089:		if (client->ps.forceGripChangeMovetype)
ADDRLP4 4
INDIRP4
CNSTI4 1288
ADDP4
INDIRI4
CNSTI4 0
EQI4 $492
line 1090
;1090:		{
line 1091
;1091:			client->ps.pm_type = client->ps.forceGripChangeMovetype;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1288
ADDP4
INDIRI4
ASGNI4
line 1092
;1092:		}
ADDRGP4 $493
JUMPV
LABELV $492
line 1094
;1093:		else
;1094:		{
line 1095
;1095:			client->ps.pm_type = PM_NORMAL;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1096
;1096:		}
LABELV $493
line 1097
;1097:	}
LABELV $491
LABELV $489
LABELV $487
line 1099
;1098:
;1099:	client->ps.gravity = g_gravity.value;
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 1102
;1100:
;1101:	// set speed
;1102:	client->ps.speed = g_speed.value;
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 1103
;1103:	client->ps.basespeed = g_speed.value;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 1105
;1104:
;1105:	if (ent->client->ps.duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $497
line 1106
;1106:	{
line 1107
;1107:		gentity_t *duelAgainst = &g_entities[ent->client->ps.duelIndex];
ADDRLP4 420
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1112
;1108:
;1109:		//Keep the time updated, so once this duel ends this player can't engage in a duel for another
;1110:		//10 seconds. This will give other people a chance to engage in duels in case this player wants
;1111:		//to engage again right after he's done fighting and someone else is waiting.
;1112:		ent->client->ps.fd.privateDuelTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1240
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1114
;1113:
;1114:		if (ent->client->ps.duelTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $500
line 1115
;1115:		{
line 1117
;1116:			//Bring out the sabers
;1117:			if (ent->client->ps.weapon == WP_SABER && ent->client->ps.saberHolstered &&
ADDRLP4 424
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 424
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $503
ADDRLP4 428
CNSTI4 0
ASGNI4
ADDRLP4 424
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 428
INDIRI4
EQI4 $503
ADDRLP4 424
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 428
INDIRI4
EQI4 $503
line 1119
;1118:				ent->client->ps.duelTime)
;1119:			{
line 1120
;1120:				if (!saberOffSound || !saberOnSound)
ADDRLP4 432
CNSTI4 0
ASGNI4
ADDRGP4 saberOffSound
INDIRI4
ADDRLP4 432
INDIRI4
EQI4 $507
ADDRGP4 saberOnSound
INDIRI4
ADDRLP4 432
INDIRI4
NEI4 $505
LABELV $507
line 1121
;1121:				{
line 1122
;1122:					saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $508
ARGP4
ADDRLP4 436
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 436
INDIRI4
ASGNI4
line 1123
;1123:					saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $509
ARGP4
ADDRLP4 440
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 440
INDIRI4
ASGNI4
line 1124
;1124:				}
LABELV $505
line 1129
;1125:
;1126:				//ent->client->ps.saberHolstered = qfalse;
;1127:				//G_Sound(ent, CHAN_AUTO, saberOnSound);
;1128:
;1129:				G_AddEvent(ent, EV_PRIVATE_DUEL, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1131
;1130:
;1131:				ent->client->ps.duelTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 0
ASGNI4
line 1132
;1132:			}
LABELV $503
line 1134
;1133:
;1134:			if (duelAgainst && duelAgainst->client && duelAgainst->inuse &&
ADDRLP4 436
CNSTU4 0
ASGNU4
ADDRLP4 420
INDIRP4
CVPU4 4
ADDRLP4 436
INDIRU4
EQU4 $501
ADDRLP4 440
ADDRLP4 420
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 440
INDIRP4
CVPU4 4
ADDRLP4 436
INDIRU4
EQU4 $501
ADDRLP4 444
CNSTI4 0
ASGNI4
ADDRLP4 420
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 444
INDIRI4
EQI4 $501
ADDRLP4 440
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $501
ADDRLP4 440
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 444
INDIRI4
EQI4 $501
ADDRLP4 440
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 444
INDIRI4
EQI4 $501
line 1137
;1135:				duelAgainst->client->ps.weapon == WP_SABER && duelAgainst->client->ps.saberHolstered &&
;1136:				duelAgainst->client->ps.duelTime)
;1137:			{
line 1138
;1138:				if (!saberOffSound || !saberOnSound)
ADDRLP4 448
CNSTI4 0
ASGNI4
ADDRGP4 saberOffSound
INDIRI4
ADDRLP4 448
INDIRI4
EQI4 $514
ADDRGP4 saberOnSound
INDIRI4
ADDRLP4 448
INDIRI4
NEI4 $512
LABELV $514
line 1139
;1139:				{
line 1140
;1140:					saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $508
ARGP4
ADDRLP4 452
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 452
INDIRI4
ASGNI4
line 1141
;1141:					saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $509
ARGP4
ADDRLP4 456
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 456
INDIRI4
ASGNI4
line 1142
;1142:				}
LABELV $512
line 1147
;1143:
;1144:				//duelAgainst->client->ps.saberHolstered = qfalse;
;1145:				//G_Sound(duelAgainst, CHAN_AUTO, saberOnSound);
;1146:
;1147:				G_AddEvent(duelAgainst, EV_PRIVATE_DUEL, 2);
ADDRLP4 420
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1149
;1148:
;1149:				duelAgainst->client->ps.duelTime = 0;
ADDRLP4 420
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 0
ASGNI4
line 1150
;1150:			}
line 1151
;1151:		}
ADDRGP4 $501
JUMPV
LABELV $500
line 1153
;1152:		else
;1153:		{
line 1154
;1154:			client->ps.speed = 0;
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 1155
;1155:			client->ps.basespeed = 0;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
line 1156
;1156:			ucmd->forwardmove = 0;
ADDRLP4 388
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 1157
;1157:			ucmd->rightmove = 0;
ADDRLP4 388
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 1158
;1158:			ucmd->upmove = 0;
ADDRLP4 388
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 1159
;1159:		}
LABELV $501
line 1161
;1160:
;1161:		if (!duelAgainst || !duelAgainst->client || !duelAgainst->inuse ||
ADDRLP4 428
CNSTU4 0
ASGNU4
ADDRLP4 420
INDIRP4
CVPU4 4
ADDRLP4 428
INDIRU4
EQU4 $519
ADDRLP4 432
ADDRLP4 420
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 432
INDIRP4
CVPU4 4
ADDRLP4 428
INDIRU4
EQU4 $519
ADDRLP4 420
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $519
ADDRLP4 432
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $515
LABELV $519
line 1163
;1162:			duelAgainst->client->ps.duelIndex != ent->s.number)
;1163:		{
line 1164
;1164:			ent->client->ps.duelInProgress = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 1165
;1165:			G_AddEvent(ent, EV_PRIVATE_DUEL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1166
;1166:		}
ADDRGP4 $516
JUMPV
LABELV $515
line 1167
;1167:		else if (duelAgainst->health < 1 || duelAgainst->client->ps.stats[STAT_HEALTH] < 1)
ADDRLP4 440
CNSTI4 1
ASGNI4
ADDRLP4 420
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 440
INDIRI4
LTI4 $522
ADDRLP4 420
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 440
INDIRI4
GEI4 $520
LABELV $522
line 1168
;1168:		{
line 1169
;1169:			ent->client->ps.duelInProgress = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 1170
;1170:			duelAgainst->client->ps.duelInProgress = 0;
ADDRLP4 420
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 1172
;1171:
;1172:			G_AddEvent(ent, EV_PRIVATE_DUEL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1173
;1173:			G_AddEvent(duelAgainst, EV_PRIVATE_DUEL, 0);
ADDRLP4 420
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1176
;1174:
;1175:			//Winner gets full health.. providing he's still alive
;1176:			if (ent->health > 0 && ent->client->ps.stats[STAT_HEALTH] > 0)
ADDRLP4 444
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 448
CNSTI4 0
ASGNI4
ADDRLP4 444
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 448
INDIRI4
LEI4 $523
ADDRLP4 444
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 448
INDIRI4
LEI4 $523
line 1177
;1177:			{
line 1179
;1178:                //DeMBones
;1179:                ent->client->ps.stats[STAT_ARMOR]=ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 452
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 452
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 452
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1181
;1180:                
;1181:				if (ent->health < ent->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 456
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 456
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 456
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
GEI4 $525
line 1182
;1182:				{
line 1183
;1183:					ent->client->ps.stats[STAT_HEALTH] = ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 460
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 464
ADDRLP4 460
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 468
ADDRLP4 464
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 460
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 468
INDIRI4
ASGNI4
ADDRLP4 464
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 468
INDIRI4
ASGNI4
line 1184
;1184:				}
LABELV $525
line 1186
;1185:
;1186:				if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $527
line 1187
;1187:				{
line 1188
;1188:					ent->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 460
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 460
INDIRP4
ADDRLP4 460
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 1189
;1189:					ent->client->invulnerableTimer = level.time + g_spawnInvulnerability.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDI4
ASGNI4
line 1190
;1190:				}
LABELV $527
line 1191
;1191:			}
LABELV $523
line 1198
;1192:
;1193:			/*
;1194:			trap_SendServerCommand( ent-g_entities, va("print \"%s %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELWINNER")) );
;1195:			trap_SendServerCommand( duelAgainst-g_entities, va("print \"%s %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELWINNER")) );
;1196:			*/
;1197:			//Private duel announcements are now made globally because we only want one duel at a time.
;1198:			if (ent->health > 0 && ent->client->ps.stats[STAT_HEALTH] > 0)
ADDRLP4 452
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 456
CNSTI4 0
ASGNI4
ADDRLP4 452
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 456
INDIRI4
LEI4 $532
ADDRLP4 452
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 456
INDIRI4
LEI4 $532
line 1199
;1199:			{
line 1200
;1200:				trap_SendServerCommand( -1, va("cp \"%s %s %s!\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELWINNER"), duelAgainst->client->pers.netname) );
ADDRGP4 $535
ARGP4
ADDRGP4 $536
ARGP4
ADDRLP4 460
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $534
ARGP4
ADDRLP4 464
CNSTI4 408
ASGNI4
ADDRLP4 468
CNSTI4 1428
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 464
INDIRI4
ADDP4
INDIRP4
ADDRLP4 468
INDIRI4
ADDP4
ARGP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 420
INDIRP4
ADDRLP4 464
INDIRI4
ADDP4
INDIRP4
ADDRLP4 468
INDIRI4
ADDP4
ARGP4
ADDRLP4 472
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 472
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1201
;1201:			}
ADDRGP4 $521
JUMPV
LABELV $532
line 1203
;1202:			else
;1203:			{ //it was a draw, because we both managed to die in the same frame
line 1204
;1204:				trap_SendServerCommand( -1, va("cp \"%s\n\"", G_GetStripEdString("SVINGAME", "PLDUELTIE")) );
ADDRGP4 $535
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 460
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $537
ARGP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 464
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 464
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1205
;1205:			}
line 1206
;1206:		}
ADDRGP4 $521
JUMPV
LABELV $520
line 1208
;1207:		else
;1208:		{
line 1210
;1209:			vec3_t vSub;
;1210:			float subLen = 0;
ADDRLP4 444
CNSTF4 0
ASGNF4
line 1212
;1211:
;1212:			VectorSubtract(ent->client->ps.origin, duelAgainst->client->ps.origin, vSub);
ADDRLP4 460
CNSTI4 408
ASGNI4
ADDRLP4 464
ADDRFP4 0
INDIRP4
ADDRLP4 460
INDIRI4
ADDP4
ASGNP4
ADDRLP4 468
CNSTI4 20
ASGNI4
ADDRLP4 472
ADDRLP4 420
INDIRP4
ADDRLP4 460
INDIRI4
ADDP4
ASGNP4
ADDRLP4 448
ADDRLP4 464
INDIRP4
INDIRP4
ADDRLP4 468
INDIRI4
ADDP4
INDIRF4
ADDRLP4 472
INDIRP4
INDIRP4
ADDRLP4 468
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 476
CNSTI4 24
ASGNI4
ADDRLP4 448+4
ADDRLP4 464
INDIRP4
INDIRP4
ADDRLP4 476
INDIRI4
ADDP4
INDIRF4
ADDRLP4 472
INDIRP4
INDIRP4
ADDRLP4 476
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 480
CNSTI4 408
ASGNI4
ADDRLP4 484
CNSTI4 28
ASGNI4
ADDRLP4 448+8
ADDRFP4 0
INDIRP4
ADDRLP4 480
INDIRI4
ADDP4
INDIRP4
ADDRLP4 484
INDIRI4
ADDP4
INDIRF4
ADDRLP4 420
INDIRP4
ADDRLP4 480
INDIRI4
ADDP4
INDIRP4
ADDRLP4 484
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1213
;1213:			subLen = VectorLength(vSub);
ADDRLP4 448
ARGP4
ADDRLP4 488
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 444
ADDRLP4 488
INDIRF4
ASGNF4
line 1215
;1214:
;1215:			if (subLen >= 1024)
ADDRLP4 444
INDIRF4
CNSTF4 1149239296
LTF4 $541
line 1216
;1216:			{
line 1217
;1217:				ent->client->ps.duelInProgress = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 1218
;1218:				duelAgainst->client->ps.duelInProgress = 0;
ADDRLP4 420
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 1220
;1219:
;1220:				G_AddEvent(ent, EV_PRIVATE_DUEL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1221
;1221:				G_AddEvent(duelAgainst, EV_PRIVATE_DUEL, 0);
ADDRLP4 420
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1223
;1222:
;1223:				trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PLDUELSTOP")) );
ADDRGP4 $535
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 492
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $543
ARGP4
ADDRLP4 492
INDIRP4
ARGP4
ADDRLP4 496
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 496
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1224
;1224:			}
LABELV $541
line 1225
;1225:		}
LABELV $521
LABELV $516
line 1226
;1226:	}
LABELV $497
line 1234
;1227:
;1228:	/*
;1229:	if ( client->ps.powerups[PW_HASTE] ) {
;1230:		client->ps.speed *= 1.3;
;1231:	}
;1232:	*/
;1233:
;1234:	if (client->ps.usingATST && ent->health > 0)
ADDRLP4 420
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ADDRLP4 420
INDIRI4
EQI4 $545
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 420
INDIRI4
LEI4 $545
line 1235
;1235:	{ //we have special shot clip boxes as an ATST
line 1236
;1236:		ent->r.contents |= CONTENTS_NOSHOT;
ADDRLP4 424
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
ASGNP4
ADDRLP4 424
INDIRP4
ADDRLP4 424
INDIRP4
INDIRI4
CNSTI4 2097152
BORI4
ASGNI4
line 1237
;1237:		ATST_ManageDamageBoxes(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ATST_ManageDamageBoxes
CALLV
pop
line 1238
;1238:	}
ADDRGP4 $546
JUMPV
LABELV $545
line 1240
;1239:	else
;1240:	{
line 1241
;1241:		ent->r.contents &= ~CONTENTS_NOSHOT;
ADDRLP4 424
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
ASGNP4
ADDRLP4 424
INDIRP4
ADDRLP4 424
INDIRP4
INDIRI4
CNSTI4 -2097153
BANDI4
ASGNI4
line 1242
;1242:		client->damageBoxHandle_Head = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1648
ADDP4
CNSTI4 0
ASGNI4
line 1243
;1243:		client->damageBoxHandle_RLeg = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1652
ADDP4
CNSTI4 0
ASGNI4
line 1244
;1244:		client->damageBoxHandle_LLeg = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1656
ADDP4
CNSTI4 0
ASGNI4
line 1245
;1245:	}
LABELV $546
line 1251
;1246:
;1247:	//rww - moved this stuff into the pmove code so that it's predicted properly
;1248:	//BG_AdjustClientSpeed(&client->ps, &client->pers.cmd, level.time);
;1249:
;1250:	// set up for pmove
;1251:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 396
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 1253
;1252:
;1253:	memset (&pm, 0, sizeof(pm));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 380
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1255
;1254:
;1255:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $547
line 1256
;1256:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 424
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 424
INDIRP4
ADDRLP4 424
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 1257
;1257:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 428
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
ASGNP4
ADDRLP4 428
INDIRP4
ADDRLP4 428
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1258
;1258:	}
LABELV $547
line 1260
;1259:
;1260:	if (ent->client && ent->client->ps.fallingToDeath &&
ADDRLP4 424
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 424
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $549
ADDRLP4 428
ADDRLP4 424
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
ASGNI4
ADDRLP4 428
INDIRI4
CNSTI4 0
EQI4 $549
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
SUBI4
ADDRLP4 428
INDIRI4
LEI4 $549
line 1262
;1261:		(level.time - FALL_FADE_TIME) > ent->client->ps.fallingToDeath)
;1262:	{ //die!
line 1263
;1263:		player_die(ent, ent, ent, 100000, MOD_FALLING);
ADDRLP4 432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRLP4 432
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 player_die
CALLV
pop
line 1264
;1264:		respawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1265
;1265:		ent->client->ps.fallingToDeath = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
CNSTI4 0
ASGNI4
line 1267
;1266:
;1267:		G_MuteSound(ent->s.number, CHAN_VOICE); //stop screaming, because you are dead!
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 1268
;1268:	}
LABELV $549
line 1270
;1269:
;1270:	if (ent->client->ps.otherKillerTime > level.time &&
ADDRLP4 432
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 432
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $552
ADDRLP4 432
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $552
ADDRLP4 432
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $552
line 1273
;1271:		ent->client->ps.groundEntityNum != ENTITYNUM_NONE &&
;1272:		ent->client->ps.otherKillerDebounceTime < level.time)
;1273:	{
line 1274
;1274:		ent->client->ps.otherKillerTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 1275
;1275:		ent->client->ps.otherKiller = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1023
ASGNI4
line 1276
;1276:	}
ADDRGP4 $553
JUMPV
LABELV $552
line 1277
;1277:	else if (ent->client->ps.otherKillerTime > level.time &&
ADDRLP4 436
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 436
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $556
ADDRLP4 436
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $556
line 1279
;1278:		ent->client->ps.groundEntityNum == ENTITYNUM_NONE)
;1279:	{
line 1280
;1280:		if (ent->client->ps.otherKillerDebounceTime < (level.time + 100))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
GEI4 $559
line 1281
;1281:		{
line 1282
;1282:			ent->client->ps.otherKillerDebounceTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1283
;1283:		}
LABELV $559
line 1284
;1284:	}
LABELV $556
LABELV $553
line 1289
;1285:
;1286://	WP_ForcePowersUpdate( ent, msec, ucmd); //update any active force powers
;1287://	WP_SaberPositionUpdate(ent, ucmd); //check the server-side saber point, do apprioriate server-side actions (effects are cs-only)
;1288:
;1289:	if ((ent->client->pers.cmd.buttons & BUTTON_USE) && ent->client->ps.useDelay < level.time)
ADDRLP4 440
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 440
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $563
ADDRLP4 440
INDIRP4
CNSTI4 1356
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $563
line 1290
;1290:	{
line 1291
;1291:		TryUse(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TryUse
CALLV
pop
line 1292
;1292:		ent->client->ps.useDelay = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1356
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1293
;1293:	}
LABELV $563
line 1295
;1294:
;1295:	pm.ps = &client->ps;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 1296
;1296:	pm.cmd = *ucmd;
ADDRLP4 8+4
ADDRLP4 388
INDIRP4
INDIRB
ASGNB 28
line 1297
;1297:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 444
CNSTI4 4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 444
INDIRI4
ADDP4
INDIRI4
ADDRLP4 444
INDIRI4
NEI4 $568
line 1298
;1298:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 8+32
CNSTI4 17
ASGNI4
line 1299
;1299:	}
ADDRGP4 $569
JUMPV
LABELV $568
line 1300
;1300:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $571
line 1301
;1301:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_MONSTERCLIP;
ADDRLP4 8+32
CNSTI4 305
ASGNI4
line 1302
;1302:	}
ADDRGP4 $572
JUMPV
LABELV $571
line 1303
;1303:	else {
line 1304
;1304:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 8+32
CNSTI4 273
ASGNI4
line 1305
;1305:	}
LABELV $572
LABELV $569
line 1306
;1306:	pm.trace = trap_Trace;
ADDRLP4 8+240
ADDRGP4 trap_Trace
ASGNP4
line 1307
;1307:	pm.pointcontents = trap_PointContents;
ADDRLP4 8+244
ADDRGP4 trap_PointContents
ASGNP4
line 1308
;1308:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 8+36
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 1309
;1309:	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $582
ADDRLP4 448
CNSTI4 1
ASGNI4
ADDRGP4 $583
JUMPV
LABELV $582
ADDRLP4 448
CNSTI4 0
ASGNI4
LABELV $583
ADDRLP4 8+40
ADDRLP4 448
INDIRI4
ASGNI4
line 1311
;1310:
;1311:	pm.pmove_fixed = pmove_fixed.integer | client->pers.pmoveFixed;
ADDRLP4 8+232
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1424
ADDP4
INDIRI4
BORI4
ASGNI4
line 1312
;1312:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 8+236
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 1314
;1313:
;1314:	pm.animations = bgGlobalAnimations;//NULL;
ADDRLP4 8+224
ADDRGP4 bgGlobalAnimations
ASGNP4
line 1316
;1315:
;1316:	pm.gametype = g_gametype.integer;
ADDRLP4 8+220
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
line 1318
;1317:
;1318:	VectorCopy( client->ps.origin, client->oldOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 1608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1320
;1319:
;1320:	if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
ADDRLP4 456
CNSTI4 0
ASGNI4
ADDRGP4 level+9004
INDIRI4
ADDRLP4 456
INDIRI4
EQI4 $591
ADDRGP4 g_singlePlayer+12
INDIRI4
ADDRLP4 456
INDIRI4
EQI4 $591
line 1321
;1321:		if ( level.time - level.intermissionQueued >= 1000  ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9004
INDIRI4
SUBI4
CNSTI4 1000
LTI4 $595
line 1322
;1322:			pm.cmd.buttons = 0;
ADDRLP4 8+4+16
CNSTI4 0
ASGNI4
line 1323
;1323:			pm.cmd.forwardmove = 0;
ADDRLP4 8+4+24
CNSTI1 0
ASGNI1
line 1324
;1324:			pm.cmd.rightmove = 0;
ADDRLP4 8+4+25
CNSTI1 0
ASGNI1
line 1325
;1325:			pm.cmd.upmove = 0;
ADDRLP4 8+4+26
CNSTI1 0
ASGNI1
line 1326
;1326:			if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9004
INDIRI4
SUBI4
CNSTI4 2000
LTI4 $607
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9004
INDIRI4
SUBI4
CNSTI4 2500
GTI4 $607
line 1327
;1327:				trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
CNSTI4 2
ARGI4
ADDRGP4 $613
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1328
;1328:			}
LABELV $607
line 1329
;1329:			ent->client->ps.pm_type = PM_SPINTERMISSION;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 1330
;1330:		}
LABELV $595
line 1331
;1331:	}
LABELV $591
line 1333
;1332:
;1333:	for ( i = 0 ; i < MAX_CLIENTS ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $614
line 1334
;1334:	{
line 1335
;1335:		if (g_entities[i].inuse && g_entities[i].client)
ADDRLP4 460
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 460
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $618
ADDRLP4 460
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $618
line 1336
;1336:		{
line 1337
;1337:			pm.bgClients[i] = &g_entities[i].client->ps;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8+248
ADDP4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ASGNP4
line 1338
;1338:		}
LABELV $618
line 1339
;1339:	}
LABELV $615
line 1333
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $614
line 1341
;1340:
;1341:	if (ent->client->ps.saberLockTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $624
line 1342
;1342:	{
line 1343
;1343:		gentity_t *blockOpp = &g_entities[ent->client->ps.saberLockEnemy];
ADDRLP4 460
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1345
;1344:
;1345:		if (blockOpp && blockOpp->inuse && blockOpp->client)
ADDRLP4 468
CNSTU4 0
ASGNU4
ADDRLP4 460
INDIRP4
CVPU4 4
ADDRLP4 468
INDIRU4
EQU4 $627
ADDRLP4 460
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $627
ADDRLP4 460
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 468
INDIRU4
EQU4 $627
line 1346
;1346:		{
line 1350
;1347:			vec3_t lockDir, lockAng;
;1348:
;1349:			//VectorClear( ent->client->ps.velocity );
;1350:			VectorSubtract( blockOpp->r.currentOrigin, ent->r.currentOrigin, lockDir );
ADDRLP4 500
CNSTI4 368
ASGNI4
ADDRLP4 504
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 472
ADDRLP4 460
INDIRP4
ADDRLP4 500
INDIRI4
ADDP4
INDIRF4
ADDRLP4 504
INDIRP4
ADDRLP4 500
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 508
CNSTI4 372
ASGNI4
ADDRLP4 472+4
ADDRLP4 460
INDIRP4
ADDRLP4 508
INDIRI4
ADDP4
INDIRF4
ADDRLP4 504
INDIRP4
ADDRLP4 508
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 512
CNSTI4 376
ASGNI4
ADDRLP4 472+8
ADDRLP4 460
INDIRP4
ADDRLP4 512
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 512
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1352
;1351:			//lockAng[YAW] = vectoyaw( defDir );
;1352:			vectoangles(lockDir, lockAng);
ADDRLP4 472
ARGP4
ADDRLP4 484
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1353
;1353:			SetClientViewAngle( ent, lockAng );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 484
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1354
;1354:		}
LABELV $627
line 1356
;1355:
;1356:		if ( ( ent->client->buttons & BUTTON_ATTACK ) && ! ( ent->client->oldbuttons & BUTTON_ATTACK ) )
ADDRLP4 472
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 476
CNSTI4 1
ASGNI4
ADDRLP4 480
CNSTI4 0
ASGNI4
ADDRLP4 472
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
ADDRLP4 476
INDIRI4
BANDI4
ADDRLP4 480
INDIRI4
EQI4 $631
ADDRLP4 472
INDIRP4
CNSTI4 1600
ADDP4
INDIRI4
ADDRLP4 476
INDIRI4
BANDI4
ADDRLP4 480
INDIRI4
NEI4 $631
line 1357
;1357:		{
line 1358
;1358:			ent->client->ps.saberLockHits++;
ADDRLP4 484
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 484
INDIRP4
ADDRLP4 484
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1359
;1359:		}
LABELV $631
line 1360
;1360:		if (ent->client->ps.saberLockHits > 2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2
LEI4 $625
line 1361
;1361:		{
line 1362
;1362:			if (!ent->client->ps.saberLockAdvance)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
NEI4 $635
line 1363
;1363:			{
line 1364
;1364:				ent->client->ps.saberLockHits -= 3;
ADDRLP4 484
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 484
INDIRP4
ADDRLP4 484
INDIRP4
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 1365
;1365:			}
LABELV $635
line 1366
;1366:			ent->client->ps.saberLockAdvance = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 1367
;1367:		}
line 1368
;1368:	}
ADDRGP4 $625
JUMPV
LABELV $624
line 1370
;1369:	else
;1370:	{
line 1371
;1371:		ent->client->ps.saberLockFrame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 1373
;1372:		//check for taunt
;1373:		if ( (pm.cmd.generic_cmd == GENCMD_ENGAGE_DUEL) && (g_gametype.integer == GT_TOURNAMENT) )
ADDRLP4 8+4+23
INDIRU1
CVUI4 1
CNSTI4 2
NEI4 $637
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $637
line 1374
;1374:		{//already in a duel, make it a taunt command
line 1375
;1375:			pm.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 8+4+16
ADDRLP4 8+4+16
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1376
;1376:		}
LABELV $637
line 1377
;1377:	}
LABELV $625
line 1379
;1378:
;1379:	Pmove (&pm);
ADDRLP4 8
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1381
;1380:
;1381:	if (pm.checkDuelLoss)
ADDRLP4 8+376
INDIRI4
CNSTI4 0
EQI4 $644
line 1382
;1382:	{
line 1383
;1383:		if (pm.checkDuelLoss > 0 && pm.checkDuelLoss <= MAX_CLIENTS)
ADDRLP4 8+376
INDIRI4
CNSTI4 0
LEI4 $647
ADDRLP4 8+376
INDIRI4
CNSTI4 32
GTI4 $647
line 1384
;1384:		{
line 1385
;1385:			gentity_t *clientLost = &g_entities[pm.checkDuelLoss-1];
ADDRLP4 460
CNSTI4 828
ADDRLP4 8+376
INDIRI4
MULI4
ADDRGP4 g_entities-828
ADDP4
ASGNP4
line 1387
;1386:
;1387:			if (clientLost && clientLost->inuse && clientLost->client && Q_irand(0, 40) > clientLost->health)
ADDRLP4 468
CNSTU4 0
ASGNU4
ADDRLP4 460
INDIRP4
CVPU4 4
ADDRLP4 468
INDIRU4
EQU4 $653
ADDRLP4 472
CNSTI4 0
ASGNI4
ADDRLP4 460
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 472
INDIRI4
EQI4 $653
ADDRLP4 460
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 468
INDIRU4
EQU4 $653
ADDRLP4 472
INDIRI4
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 476
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 476
INDIRI4
ADDRLP4 460
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
LEI4 $653
line 1388
;1388:			{
line 1390
;1389:				vec3_t attDir;
;1390:				VectorSubtract(ent->client->ps.origin, clientLost->client->ps.origin, attDir);
ADDRLP4 492
CNSTI4 408
ASGNI4
ADDRLP4 496
ADDRFP4 0
INDIRP4
ADDRLP4 492
INDIRI4
ADDP4
ASGNP4
ADDRLP4 500
CNSTI4 20
ASGNI4
ADDRLP4 504
ADDRLP4 460
INDIRP4
ADDRLP4 492
INDIRI4
ADDP4
ASGNP4
ADDRLP4 480
ADDRLP4 496
INDIRP4
INDIRP4
ADDRLP4 500
INDIRI4
ADDP4
INDIRF4
ADDRLP4 504
INDIRP4
INDIRP4
ADDRLP4 500
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 508
CNSTI4 24
ASGNI4
ADDRLP4 480+4
ADDRLP4 496
INDIRP4
INDIRP4
ADDRLP4 508
INDIRI4
ADDP4
INDIRF4
ADDRLP4 504
INDIRP4
INDIRP4
ADDRLP4 508
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 512
CNSTI4 408
ASGNI4
ADDRLP4 516
CNSTI4 28
ASGNI4
ADDRLP4 480+8
ADDRFP4 0
INDIRP4
ADDRLP4 512
INDIRI4
ADDP4
INDIRP4
ADDRLP4 516
INDIRI4
ADDP4
INDIRF4
ADDRLP4 460
INDIRP4
ADDRLP4 512
INDIRI4
ADDP4
INDIRP4
ADDRLP4 516
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1391
;1391:				VectorNormalize(attDir);
ADDRLP4 480
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1393
;1392:
;1393:				VectorClear(clientLost->client->ps.velocity);
ADDRLP4 520
ADDRLP4 460
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 524
CNSTF4 0
ASGNF4
ADDRLP4 520
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
ADDRLP4 520
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
ADDRLP4 520
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 1394
;1394:				clientLost->client->ps.forceHandExtend = HANDEXTEND_NONE;
ADDRLP4 460
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 1395
;1395:				clientLost->client->ps.forceHandExtendTime = 0;
ADDRLP4 460
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 1397
;1396:
;1397:				gGAvoidDismember = 1;
ADDRGP4 gGAvoidDismember
CNSTI4 1
ASGNI4
line 1398
;1398:				G_Damage(clientLost, ent, ent, attDir, clientLost->client->ps.origin, 9999, DAMAGE_NO_PROTECTION, MOD_SABER);
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 532
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 480
ARGP4
ADDRLP4 460
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 9999
ARGI4
CNSTI4 8
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1400
;1399:
;1400:				if (clientLost->health < 1)
ADDRLP4 460
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $657
line 1401
;1401:				{
line 1402
;1402:					gGAvoidDismember = 2;
ADDRGP4 gGAvoidDismember
CNSTI4 2
ASGNI4
line 1403
;1403:					G_CheckForDismemberment(clientLost, clientLost->client->ps.origin, 999, (clientLost->client->ps.legsAnim&~ANIM_TOGGLEBIT));
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 540
ADDRLP4 460
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 540
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 999
ARGI4
ADDRLP4 540
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRGP4 G_CheckForDismemberment
CALLV
pop
line 1404
;1404:				}
LABELV $657
line 1406
;1405:
;1406:				gGAvoidDismember = 0;
ADDRGP4 gGAvoidDismember
CNSTI4 0
ASGNI4
line 1407
;1407:			}
LABELV $653
line 1408
;1408:		}
LABELV $647
line 1410
;1409:
;1410:		pm.checkDuelLoss = 0;
ADDRLP4 8+376
CNSTI4 0
ASGNI4
line 1411
;1411:	}
LABELV $644
line 1413
;1412:
;1413:	switch(pm.cmd.generic_cmd)
ADDRLP4 460
ADDRLP4 8+4+23
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 460
INDIRI4
CNSTI4 0
LTI4 $661
ADDRLP4 460
INDIRI4
CNSTI4 20
GTI4 $661
ADDRLP4 460
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $705
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $705
address $661
address $666
address $667
address $671
address $672
address $673
address $674
address $675
address $676
address $677
address $678
address $679
address $680
address $681
address $682
address $685
address $688
address $691
address $696
address $701
address $704
code
line 1414
;1414:	{
line 1416
;1415:	case 0:
;1416:		break;
LABELV $666
line 1418
;1417:	case GENCMD_SABERSWITCH:
;1418:		Cmd_ToggleSaber_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_ToggleSaber_f
CALLV
pop
line 1419
;1419:		break;
ADDRGP4 $661
JUMPV
LABELV $667
line 1421
;1420:	case GENCMD_ENGAGE_DUEL:
;1421:		if ( g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $668
line 1422
;1422:		{//already in a duel, made it a taunt command
line 1423
;1423:		}
ADDRGP4 $661
JUMPV
LABELV $668
line 1425
;1424:		else
;1425:		{
line 1426
;1426:			Cmd_EngageDuel_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_EngageDuel_f
CALLV
pop
line 1427
;1427:		}
line 1428
;1428:		break;
ADDRGP4 $661
JUMPV
LABELV $671
line 1430
;1429:	case GENCMD_FORCE_HEAL:
;1430:		ForceHeal(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceHeal
CALLV
pop
line 1431
;1431:		break;
ADDRGP4 $661
JUMPV
LABELV $672
line 1433
;1432:	case GENCMD_FORCE_SPEED:
;1433:		ForceSpeed(ent, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceSpeed
CALLV
pop
line 1434
;1434:		break;
ADDRGP4 $661
JUMPV
LABELV $673
line 1436
;1435:	case GENCMD_FORCE_THROW:
;1436:		ForceThrow(ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 1437
;1437:		break;
ADDRGP4 $661
JUMPV
LABELV $674
line 1439
;1438:	case GENCMD_FORCE_PULL:
;1439:		ForceThrow(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 1440
;1440:		break;
ADDRGP4 $661
JUMPV
LABELV $675
line 1442
;1441:	case GENCMD_FORCE_DISTRACT:
;1442:		ForceTelepathy(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTelepathy
CALLV
pop
line 1443
;1443:		break;
ADDRGP4 $661
JUMPV
LABELV $676
line 1445
;1444:	case GENCMD_FORCE_RAGE:
;1445:		ForceRage(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceRage
CALLV
pop
line 1446
;1446:		break;
ADDRGP4 $661
JUMPV
LABELV $677
line 1448
;1447:	case GENCMD_FORCE_PROTECT:
;1448:		ForceProtect(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceProtect
CALLV
pop
line 1449
;1449:		break;
ADDRGP4 $661
JUMPV
LABELV $678
line 1451
;1450:	case GENCMD_FORCE_ABSORB:
;1451:		ForceAbsorb(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceAbsorb
CALLV
pop
line 1452
;1452:		break;
ADDRGP4 $661
JUMPV
LABELV $679
line 1454
;1453:	case GENCMD_FORCE_HEALOTHER:
;1454:		ForceTeamHeal(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamHeal
CALLV
pop
line 1455
;1455:		break;
ADDRGP4 $661
JUMPV
LABELV $680
line 1457
;1456:	case GENCMD_FORCE_FORCEPOWEROTHER:
;1457:		ForceTeamForceReplenish(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamForceReplenish
CALLV
pop
line 1458
;1458:		break;
ADDRGP4 $661
JUMPV
LABELV $681
line 1460
;1459:	case GENCMD_FORCE_SEEING:
;1460:		ForceSeeing(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceSeeing
CALLV
pop
line 1461
;1461:		break;
ADDRGP4 $661
JUMPV
LABELV $682
line 1463
;1462:	case GENCMD_USE_SEEKER:
;1463:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SEEKER)) &&
ADDRLP4 468
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $661
ADDRLP4 468
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 472
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 472
INDIRI4
CNSTI4 0
EQI4 $661
line 1465
;1464:			G_ItemUsable(&ent->client->ps, HI_SEEKER) )
;1465:		{
line 1466
;1466:			ItemUse_Seeker(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Seeker
CALLV
pop
line 1467
;1467:			G_AddEvent(ent, EV_USE_ITEM0+HI_SEEKER, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 41
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1468
;1468:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_SEEKER);
ADDRLP4 476
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 476
INDIRP4
ADDRLP4 476
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1469
;1469:		}
line 1470
;1470:		break;
ADDRGP4 $661
JUMPV
LABELV $685
line 1472
;1471:	case GENCMD_USE_FIELD:
;1472:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SHIELD)) &&
ADDRLP4 476
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 476
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $661
ADDRLP4 476
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 480
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 480
INDIRI4
CNSTI4 0
EQI4 $661
line 1474
;1473:			G_ItemUsable(&ent->client->ps, HI_SHIELD) )
;1474:		{
line 1475
;1475:			ItemUse_Shield(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Shield
CALLV
pop
line 1476
;1476:			G_AddEvent(ent, EV_USE_ITEM0+HI_SHIELD, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 42
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1477
;1477:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_SHIELD);
ADDRLP4 484
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 484
INDIRP4
ADDRLP4 484
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1478
;1478:		}
line 1479
;1479:		break;
ADDRGP4 $661
JUMPV
LABELV $688
line 1481
;1480:	case GENCMD_USE_BACTA:
;1481:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_MEDPAC)) &&
ADDRLP4 484
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 484
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $661
ADDRLP4 484
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 488
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 488
INDIRI4
CNSTI4 0
EQI4 $661
line 1483
;1482:			G_ItemUsable(&ent->client->ps, HI_MEDPAC) )
;1483:		{
line 1484
;1484:			ItemUse_MedPack(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_MedPack
CALLV
pop
line 1485
;1485:			G_AddEvent(ent, EV_USE_ITEM0+HI_MEDPAC, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 43
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1486
;1486:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_MEDPAC);
ADDRLP4 492
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 492
INDIRP4
ADDRLP4 492
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1487
;1487:		}
line 1488
;1488:		break;
ADDRGP4 $661
JUMPV
LABELV $691
line 1490
;1489:	case GENCMD_USE_ELECTROBINOCULARS:
;1490:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_BINOCULARS)) &&
ADDRLP4 492
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 492
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $661
ADDRLP4 492
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 496
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 496
INDIRI4
CNSTI4 0
EQI4 $661
line 1492
;1491:			G_ItemUsable(&ent->client->ps, HI_BINOCULARS) )
;1492:		{
line 1493
;1493:			ItemUse_Binoculars(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Binoculars
CALLV
pop
line 1494
;1494:			if (ent->client->ps.zoomMode == 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
NEI4 $694
line 1495
;1495:			{
line 1496
;1496:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1497
;1497:			}
ADDRGP4 $661
JUMPV
LABELV $694
line 1499
;1498:			else
;1499:			{
line 1500
;1500:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1501
;1501:			}
line 1502
;1502:		}
line 1503
;1503:		break;
ADDRGP4 $661
JUMPV
LABELV $696
line 1505
;1504:	case GENCMD_ZOOM:
;1505:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_BINOCULARS)) &&
ADDRLP4 500
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 500
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $661
ADDRLP4 500
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 504
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 504
INDIRI4
CNSTI4 0
EQI4 $661
line 1507
;1506:			G_ItemUsable(&ent->client->ps, HI_BINOCULARS) )
;1507:		{
line 1508
;1508:			ItemUse_Binoculars(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Binoculars
CALLV
pop
line 1509
;1509:			if (ent->client->ps.zoomMode == 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
NEI4 $699
line 1510
;1510:			{
line 1511
;1511:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1512
;1512:			}
ADDRGP4 $661
JUMPV
LABELV $699
line 1514
;1513:			else
;1514:			{
line 1515
;1515:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1516
;1516:			}
line 1517
;1517:		}
line 1518
;1518:		break;
ADDRGP4 $661
JUMPV
LABELV $701
line 1520
;1519:	case GENCMD_USE_SENTRY:
;1520:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SENTRY_GUN)) &&
ADDRLP4 508
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 508
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $661
ADDRLP4 508
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 512
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 512
INDIRI4
CNSTI4 0
EQI4 $661
line 1522
;1521:			G_ItemUsable(&ent->client->ps, HI_SENTRY_GUN) )
;1522:		{
line 1523
;1523:			ItemUse_Sentry(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Sentry
CALLV
pop
line 1524
;1524:			G_AddEvent(ent, EV_USE_ITEM0+HI_SENTRY_GUN, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 46
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1525
;1525:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_SENTRY_GUN);
ADDRLP4 516
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 516
INDIRP4
ADDRLP4 516
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 1526
;1526:		}
line 1527
;1527:		break;
ADDRGP4 $661
JUMPV
LABELV $704
line 1529
;1528:	case GENCMD_SABERATTACKCYCLE:
;1529:		Cmd_SaberAttackCycle_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 1530
;1530:		break;
line 1532
;1531:	default:
;1532:		break;
LABELV $661
line 1536
;1533:	}
;1534:
;1535:	// save results of pmove
;1536:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 396
INDIRI4
EQI4 $706
line 1537
;1537:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1538
;1538:	}
LABELV $706
line 1539
;1539:	if (g_smoothClients.integer) {
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $709
line 1540
;1540:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 472
ADDRLP4 468
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 472
INDIRP4
ARGP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRLP4 472
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityStateExtraPolate
CALLV
pop
line 1541
;1541:	}
ADDRGP4 $710
JUMPV
LABELV $709
line 1542
;1542:	else {
line 1543
;1543:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 468
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1544
;1544:	}
LABELV $710
line 1545
;1545:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1547
;1546:
;1547:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $712
line 1548
;1548:		client->fireHeld = qfalse;		// for grapple
ADDRLP4 4
INDIRP4
CNSTI4 1708
ADDP4
CNSTI4 0
ASGNI4
line 1549
;1549:	}
LABELV $712
line 1552
;1550:
;1551:	// use the snapped origin for linking so it matches client predicted versions
;1552:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 468
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1554
;1553:
;1554:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 8+188
INDIRB
ASGNB 12
line 1555
;1555:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 8+200
INDIRB
ASGNB 12
line 1557
;1556:
;1557:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 8+216
INDIRI4
ASGNI4
line 1558
;1558:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRLP4 8+212
INDIRI4
ASGNI4
line 1561
;1559:
;1560:	// execute client events
;1561:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 396
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 1563
;1562:
;1563:	if ( pm.useEvent )
ADDRLP4 8+184
INDIRI4
CNSTI4 0
EQI4 $718
line 1564
;1564:	{
line 1567
;1565:		//TODO: Use
;1566://		TryUse( ent );
;1567:	}
LABELV $718
line 1570
;1568:
;1569:	// link entity now, after any personal teleporters have been used
;1570:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1571
;1571:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
CNSTI4 0
NEI4 $721
line 1572
;1572:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 1573
;1573:	}
LABELV $721
line 1576
;1574:
;1575:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;1576:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 472
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 472
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1582
;1577:
;1578:	//test for solid areas in the AAS file
;1579://	BotTestAAS(ent->r.currentOrigin);
;1580:
;1581:	// touch other objects
;1582:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 1585
;1583:
;1584:	// save results of triggers and client events
;1585:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 396
INDIRI4
EQI4 $723
line 1586
;1586:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1587
;1587:	}
LABELV $723
line 1590
;1588:
;1589:	// swap and latch button actions
;1590:	client->oldbuttons = client->buttons;
ADDRLP4 4
INDIRP4
CNSTI4 1600
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
ASGNI4
line 1591
;1591:	client->buttons = ucmd->buttons;
ADDRLP4 4
INDIRP4
CNSTI4 1596
ADDP4
ADDRLP4 388
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1592
;1592:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 484
ADDRLP4 4
INDIRP4
CNSTI4 1604
ADDP4
ASGNP4
ADDRLP4 484
INDIRP4
ADDRLP4 484
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1600
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 1595
;1593:
;1594:	// Did we kick someone in our pmove sequence?
;1595:	if (client->ps.forceKickFlip)
ADDRLP4 4
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 0
EQI4 $726
line 1596
;1596:	{
line 1597
;1597:		gentity_t *faceKicked = &g_entities[client->ps.forceKickFlip-1];
ADDRLP4 488
CNSTI4 828
ADDRLP4 4
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities-828
ADDP4
ASGNP4
line 1599
;1598:
;1599:		if (faceKicked && faceKicked->client && (!OnSameTeam(ent, faceKicked) || g_friendlyFire.integer) &&
ADDRLP4 496
CNSTU4 0
ASGNU4
ADDRLP4 488
INDIRP4
CVPU4 4
ADDRLP4 496
INDIRU4
EQU4 $729
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 496
INDIRU4
EQU4 $729
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 488
INDIRP4
ARGP4
ADDRLP4 500
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 504
CNSTI4 0
ASGNI4
ADDRLP4 500
INDIRI4
ADDRLP4 504
INDIRI4
EQI4 $732
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 504
INDIRI4
EQI4 $729
LABELV $732
ADDRLP4 508
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 508
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $733
ADDRLP4 508
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $729
LABELV $733
ADDRLP4 512
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 512
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $734
ADDRLP4 512
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 488
INDIRP4
INDIRI4
NEI4 $729
LABELV $734
line 1602
;1600:			(!faceKicked->client->ps.duelInProgress || faceKicked->client->ps.duelIndex == ent->s.number) &&
;1601:			(!ent->client->ps.duelInProgress || ent->client->ps.duelIndex == faceKicked->s.number))
;1602:		{
line 1603
;1603:			if ( faceKicked && faceKicked->client && faceKicked->health && faceKicked->takedamage )
ADDRLP4 520
CNSTU4 0
ASGNU4
ADDRLP4 488
INDIRP4
CVPU4 4
ADDRLP4 520
INDIRU4
EQU4 $735
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 520
INDIRU4
EQU4 $735
ADDRLP4 524
CNSTI4 0
ASGNI4
ADDRLP4 488
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 524
INDIRI4
EQI4 $735
ADDRLP4 488
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 524
INDIRI4
EQI4 $735
line 1604
;1604:			{//push them away and do pain
line 1606
;1605:				vec3_t oppDir;
;1606:				int strength = (int)VectorNormalize2( client->ps.velocity, oppDir );
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 532
ARGP4
ADDRLP4 544
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 528
ADDRLP4 544
INDIRF4
CVFI4 4
ASGNI4
line 1608
;1607:
;1608:				strength *= 0.05;
ADDRLP4 528
CNSTF4 1028443341
ADDRLP4 528
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1610
;1609:
;1610:				VectorScale( oppDir, -1, oppDir );
ADDRLP4 548
CNSTF4 3212836864
ASGNF4
ADDRLP4 532
ADDRLP4 548
INDIRF4
ADDRLP4 532
INDIRF4
MULF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 548
INDIRF4
ADDRLP4 532+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 532+8
CNSTF4 3212836864
ADDRLP4 532+8
INDIRF4
MULF4
ASGNF4
line 1612
;1611:
;1612:				G_Damage( faceKicked, ent, ent, oppDir, client->ps.origin, strength, DAMAGE_NO_ARMOR, MOD_MELEE );
ADDRLP4 488
INDIRP4
ARGP4
ADDRLP4 552
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 552
INDIRP4
ARGP4
ADDRLP4 552
INDIRP4
ARGP4
ADDRLP4 532
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 528
INDIRI4
ARGI4
ADDRLP4 556
CNSTI4 2
ASGNI4
ADDRLP4 556
INDIRI4
ARGI4
ADDRLP4 556
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1614
;1613:
;1614:				if ( faceKicked->client->ps.weapon != WP_SABER ||
ADDRLP4 560
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 560
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $744
ADDRLP4 560
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $744
ADDRLP4 560
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 564
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 564
INDIRI4
CNSTI4 0
NEI4 $741
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 568
ADDRGP4 PM_SaberInStart
CALLI4
ASGNI4
ADDRLP4 568
INDIRI4
CNSTI4 0
NEI4 $741
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 572
ADDRGP4 PM_SaberInReturn
CALLI4
ASGNI4
ADDRLP4 572
INDIRI4
CNSTI4 0
NEI4 $741
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 576
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 576
INDIRI4
CNSTI4 0
NEI4 $741
LABELV $744
line 1617
;1615:					 faceKicked->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3 ||
;1616:					 (!BG_SaberInAttack(faceKicked->client->ps.saberMove) && !PM_SaberInStart(faceKicked->client->ps.saberMove) && !PM_SaberInReturn(faceKicked->client->ps.saberMove) && !PM_SaberInTransition(faceKicked->client->ps.saberMove)) )
;1617:				{
line 1618
;1618:					if (faceKicked->health > 0 &&
ADDRLP4 584
CNSTI4 0
ASGNI4
ADDRLP4 488
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 584
INDIRI4
LEI4 $745
ADDRLP4 588
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 588
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 584
INDIRI4
LEI4 $745
ADDRLP4 588
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
EQI4 $745
line 1621
;1619:						faceKicked->client->ps.stats[STAT_HEALTH] > 0 &&
;1620:						faceKicked->client->ps.forceHandExtend != HANDEXTEND_KNOCKDOWN)
;1621:					{
line 1622
;1622:						if (Q_irand(1, 10) <= 3)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 592
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 592
INDIRI4
CNSTI4 3
GTI4 $747
line 1623
;1623:						{ //only actually knock over sometimes, but always do velocity hit
line 1624
;1624:							faceKicked->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 1625
;1625:							faceKicked->client->ps.forceHandExtendTime = level.time + 1100;
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
line 1626
;1626:							faceKicked->client->ps.forceDodgeAnim = 0; //this toggles between 1 and 0, when it's 1 we should play the get up anim
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 1627
;1627:						}
LABELV $747
line 1629
;1628:
;1629:						faceKicked->client->ps.otherKiller = ent->s.number;
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1630
;1630:						faceKicked->client->ps.otherKillerTime = level.time + 5000;
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1631
;1631:						faceKicked->client->ps.otherKillerDebounceTime = level.time + 100;
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1633
;1632:
;1633:						faceKicked->client->ps.velocity[0] = oppDir[0]*(strength*40);
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 532
INDIRF4
CNSTI4 40
ADDRLP4 528
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 1634
;1634:						faceKicked->client->ps.velocity[1] = oppDir[1]*(strength*40);
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 532+4
INDIRF4
CNSTI4 40
ADDRLP4 528
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 1635
;1635:						faceKicked->client->ps.velocity[2] = 200;
ADDRLP4 488
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ASGNF4
line 1636
;1636:					}
LABELV $745
line 1637
;1637:				}
LABELV $741
line 1639
;1638:
;1639:				G_Sound( faceKicked, CHAN_AUTO, G_SoundIndex( va("sound/weapons/melee/punch%d", Q_irand(1, 4)) ) );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 580
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $753
ARGP4
ADDRLP4 580
INDIRI4
ARGI4
ADDRLP4 584
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 584
INDIRP4
ARGP4
ADDRLP4 588
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 488
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 588
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1640
;1640:			}
LABELV $735
line 1641
;1641:		}
LABELV $729
line 1643
;1642:
;1643:		client->ps.forceKickFlip = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 0
ASGNI4
line 1644
;1644:	}
LABELV $726
line 1647
;1645:
;1646:	// check for respawning
;1647:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $754
line 1649
;1648:		// wait for the attack button to be pressed
;1649:		if ( level.time > client->respawnTime && !gDoSlowMoDuel ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1684
ADDP4
INDIRI4
LEI4 $756
ADDRGP4 gDoSlowMoDuel
INDIRI4
CNSTI4 0
NEI4 $756
line 1651
;1650:			// forcerespawn is to prevent users from waiting out powerups
;1651:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $759
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1684
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_forcerespawn+12
INDIRI4
MULI4
LEI4 $759
line 1652
;1652:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1653
;1653:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1654
;1654:				return;
ADDRGP4 $438
JUMPV
LABELV $759
line 1658
;1655:			}
;1656:		
;1657:			// pressing attack or use is the normal respawn method
;1658:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 388
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $438
line 1659
;1659:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1660
;1660:			}
line 1661
;1661:		}
ADDRGP4 $438
JUMPV
LABELV $756
line 1662
;1662:		else if (gDoSlowMoDuel)
ADDRGP4 gDoSlowMoDuel
INDIRI4
CNSTI4 0
EQI4 $438
line 1663
;1663:		{
line 1664
;1664:			client->respawnTime = level.time + 1000;
ADDRLP4 4
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1665
;1665:		}
line 1666
;1666:		return;
ADDRGP4 $438
JUMPV
LABELV $754
line 1670
;1667:	}
;1668:
;1669:	// perform once-a-second actions
;1670:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 392
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1672
;1671:
;1672:	G_UpdateClientBroadcasts ( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateClientBroadcasts
CALLV
pop
line 1673
;1673:}
LABELV $438
endproc ClientThink_real 596 32
export G_CheckClientTimeouts
proc G_CheckClientTimeouts 0 8
line 1683
;1674:
;1675:/*
;1676:==================
;1677:G_CheckClientTimeouts
;1678:
;1679:Checks whether a client has exceded any timeouts and act accordingly
;1680:==================
;1681:*/
;1682:void G_CheckClientTimeouts ( gentity_t *ent )
;1683:{
line 1685
;1684:	// Only timeout supported right now is the timeout to spectator mode
;1685:	if ( !g_timeouttospec.integer )
ADDRGP4 g_timeouttospec+12
INDIRI4
CNSTI4 0
NEI4 $770
line 1686
;1686:	{
line 1687
;1687:		return;
ADDRGP4 $769
JUMPV
LABELV $770
line 1691
;1688:	}
;1689:
;1690:	// Already a spectator, no need to boot them to spectator
;1691:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $773
line 1692
;1692:	{
line 1693
;1693:		return;
ADDRGP4 $769
JUMPV
LABELV $773
line 1698
;1694:	}
;1695:
;1696:	// See how long its been since a command was received by the client and if its 
;1697:	// longer than the timeout to spectator then force this client into spectator mode
;1698:	if ( level.time - ent->client->pers.cmd.serverTime > g_timeouttospec.integer * 1000 )
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_timeouttospec+12
INDIRI4
MULI4
LEI4 $775
line 1699
;1699:	{
line 1700
;1700:		SetTeam ( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $779
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1701
;1701:	}
LABELV $775
line 1702
;1702:}
LABELV $769
endproc G_CheckClientTimeouts 0 8
export ClientThink
proc ClientThink 8 8
line 1711
;1703:
;1704:/*
;1705:==================
;1706:ClientThink
;1707:
;1708:A new command has arrived from the client
;1709:==================
;1710:*/
;1711:void ClientThink( int clientNum ) {
line 1714
;1712:	gentity_t *ent;
;1713:
;1714:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1715
;1715:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1719
;1716:
;1717:	// mark the time we got info, so we can display the
;1718:	// phone jack if they don't get any for a while
;1719:	ent->client->lastCmdTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1592
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1721
;1720:
;1721:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $782
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $782
line 1722
;1722:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1723
;1723:	}
LABELV $782
line 1724
;1724:}
LABELV $780
endproc ClientThink 8 8
export G_RunClient
proc G_RunClient 4 4
line 1727
;1725:
;1726:
;1727:void G_RunClient( gentity_t *ent ) {
line 1728
;1728:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 0
INDIRI4
NEI4 $786
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $786
line 1729
;1729:		return;
ADDRGP4 $785
JUMPV
LABELV $786
line 1731
;1730:	}
;1731:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1732
;1732:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1733
;1733:}
LABELV $785
endproc G_RunClient 4 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 24 8
line 1742
;1734:
;1735:
;1736:/*
;1737:==================
;1738:SpectatorClientEndFrame
;1739:
;1740:==================
;1741:*/
;1742:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1746
;1743:	gclient_t	*cl;
;1744:
;1745:	// if we are doing a chase cam or a remote view, grab the latest info
;1746:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 2
NEI4 $791
line 1749
;1747:		int		clientNum, flags;
;1748:
;1749:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ASGNI4
line 1752
;1750:
;1751:		// team follow1 and team follow2 go to whatever clients are playing
;1752:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $793
line 1753
;1753:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+212
INDIRI4
ASGNI4
line 1754
;1754:		} else if ( clientNum == -2 ) {
ADDRGP4 $794
JUMPV
LABELV $793
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $796
line 1755
;1755:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+216
INDIRI4
ASGNI4
line 1756
;1756:		}
LABELV $796
LABELV $794
line 1757
;1757:		if ( clientNum >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $799
line 1758
;1758:			cl = &level.clients[ clientNum ];
ADDRLP4 0
CNSTI4 1800
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1759
;1759:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $801
ADDRLP4 12
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $801
line 1760
;1760:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
ADDRLP4 16
CNSTI4 108
ASGNI4
ADDRLP4 8
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
CNSTI4 -540673
BANDI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
CNSTI4 540672
BANDI4
BORI4
ASGNI4
line 1761
;1761:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 1380
line 1762
;1762:				ent->client->ps.pm_flags |= PMF_FOLLOW;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1763
;1763:				ent->client->ps.eFlags = flags;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1764
;1764:				return;
ADDRGP4 $790
JUMPV
LABELV $801
line 1765
;1765:			} else {
line 1767
;1766:				// drop them to free spectators unless they are dedicated camera followers
;1767:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 0
LTI4 $803
line 1768
;1768:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 1769
;1769:					ClientBegin( ent->client - level.clients, qtrue );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1800
DIVI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1770
;1770:				}
LABELV $803
line 1771
;1771:			}
line 1772
;1772:		}
LABELV $799
line 1773
;1773:	}
LABELV $791
line 1775
;1774:
;1775:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 3
NEI4 $805
line 1776
;1776:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1777
;1777:	} else {
ADDRGP4 $806
JUMPV
LABELV $805
line 1778
;1778:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1779
;1779:	}
LABELV $806
line 1780
;1780:}
LABELV $790
endproc SpectatorClientEndFrame 24 8
export ClientEndFrame
proc ClientEndFrame 20 16
line 1791
;1781:
;1782:/*
;1783:==============
;1784:ClientEndFrame
;1785:
;1786:Called at the end of each server frame for each connected client
;1787:A fast client will have multiple ClientThink for each ClientEdFrame,
;1788:while a slow client may have multiple ClientEndFrame between ClientThink.
;1789:==============
;1790:*/
;1791:void ClientEndFrame( gentity_t *ent ) {
line 1795
;1792:	int			i;
;1793:	clientPersistant_t	*pers;
;1794:
;1795:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $808
line 1796
;1796:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1797
;1797:		return;
ADDRGP4 $807
JUMPV
LABELV $808
line 1800
;1798:	}
;1799:
;1800:	pers = &ent->client->pers;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
ASGNP4
line 1803
;1801:
;1802:	// turn off any expired powerups
;1803:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $810
line 1804
;1804:		if ( ent->client->ps.powerups[ i ] < level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $814
line 1805
;1805:			ent->client->ps.powerups[ i ] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1806
;1806:		}
LABELV $814
line 1807
;1807:	}
LABELV $811
line 1803
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $810
line 1821
;1808:
;1809:	// save network bandwidth
;1810:#if 0
;1811:	if ( !g_synchronousClients->integer && (ent->client->ps.pm_type == PM_NORMAL || ent->client->ps.pm_type == PM_FLOAT) ) {
;1812:		// FIXME: this must change eventually for non-sync demo recording
;1813:		VectorClear( ent->client->ps.viewangles );
;1814:	}
;1815:#endif
;1816:
;1817:	//
;1818:	// If the end of unit layout is displayed, don't give
;1819:	// the player any normal movement attributes
;1820:	//
;1821:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $817
line 1822
;1822:		return;
ADDRGP4 $807
JUMPV
LABELV $817
line 1826
;1823:	}
;1824:
;1825:	// burn from lava, etc
;1826:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1829
;1827:
;1828:	// apply all the damage taken this frame
;1829:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1832
;1830:
;1831:	// add the EF_CONNECTION flag if we haven't gotten commands recently
;1832:	if ( level.time - ent->client->lastCmdTime > 1000 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1592
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $820
line 1833
;1833:		ent->s.eFlags |= EF_CONNECTION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1834
;1834:	} else {
ADDRGP4 $821
JUMPV
LABELV $820
line 1835
;1835:		ent->s.eFlags &= ~EF_CONNECTION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1836
;1836:	}
LABELV $821
line 1838
;1837:
;1838:	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
line 1840
;1839:
;1840:	G_SetClientSound (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1843
;1841:
;1842:	// set the latest infor
;1843:	if (g_smoothClients.integer) {
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $823
line 1844
;1844:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityStateExtraPolate
CALLV
pop
line 1845
;1845:	}
ADDRGP4 $824
JUMPV
LABELV $823
line 1846
;1846:	else {
line 1847
;1847:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1848
;1848:	}
LABELV $824
line 1849
;1849:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1854
;1850:
;1851:	// set the bit for the reachability area the client is currently in
;1852://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1853://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1854:}
LABELV $807
endproc ClientEndFrame 20 16
import saberOnSound
import saberOffSound
import G_ApplyKnockback
import PM_SaberInReturn
import PM_SaberInStart
import PM_SaberInTransition
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_ForcePower
import trap_EA_Alt_Attack
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_austrian
import g_saberDebugPrint
import g_saberDmgDelay_Wound
import g_saberDmgDelay_Idle
import g_saberDmgVelocityScale
import g_timeouttospec
import g_forceDodge
import g_dismember
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_debugUp
import g_debugRight
import g_debugForward
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_adaptRespawn
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlySaber
import g_friendlyFire
import g_saberInterpolate
import g_capturelimit
import g_timelimit
import g_duel_fraglimit
import g_fraglimit
import g_duelWeaponDisable
import g_fraglimitVoteCorrection
import g_allowDuelSuicide
import g_weaponDisable
import g_forcePowerDisable
import g_spawnInvulnerability
import g_forceRegenTime
import g_saberDamageScale
import g_slowmoDuelEnd
import g_logClientInfo
import g_saberBoxTraceSize
import g_saberAlwaysBoxTrace
import g_saberGhoul2Collision
import g_saberTraceSaberFirst
import g_saberLockFactor
import g_saberLocking
import g_privateDuel
import g_forceBasedTeams
import g_maxForceRank
import g_dmflags
import g_autoMapCycle
import g_trueJedi
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectSagaSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import B_CleanupAlloc
import B_InitAlloc
import InFieldOfVision
import BotOrder
import OrgVisible
import InitSagaMode
import G_ClearClientLog
import G_LogExit
import G_LogWeaponOutput
import G_LogWeaponInit
import G_LogWeaponItem
import G_LogWeaponPowerup
import G_LogWeaponFrag
import G_LogWeaponDeath
import G_LogWeaponKill
import G_LogWeaponDamage
import G_LogWeaponFire
import G_LogWeaponPickup
import Jedi_DodgeEvasion
import ForceTelepathy
import ForceThrow
import ForceSeeing
import ForceTeamForceReplenish
import ForceTeamHeal
import ForceAbsorb
import ForceProtect
import ForceGrip
import ForceRage
import ForceSpeed
import ForceHeal
import ForcePowerUsableOn
import WP_ForcePowersUpdate
import WP_SpawnInitForcePowers
import WP_InitForcePowers
import WP_SaberInitBladeData
import WP_SaberCanBlock
import WP_SaberPositionUpdate
import WP_ForcePowerStop
import HasSetSaberOnly
import G_PreDefSound
import G_RefreshNextMap
import G_DoesMapSupportGametype
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_CheckDroppedItem
import OnSameTeam
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_GetStripEdString
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import gSlowMoDuelTime
import gDoSlowMoDuel
import g_ff_objectives
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import BlowDetpacks
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import gJMSaberEnt
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import WP_FireGenericBlasterMissile
import WP_FireTurretMissile
import G_CreateExampleAnimEnt
import G_PlayerBecomeATST
import ATST_ManageDamageBoxes
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import WP_FireBlasterMissile
import G_ExplodeMissile
import G_BounceProjectile
import CreateMissile
import G_RunMissile
import G_ReflectMissile
import gGAvoidDismember
import G_CheckForDismemberment
import ExplodeDeath
import TossClientCubes
import TossClientItems
import TossClientWeapon
import body_die
import G_RadiusDamage
import G_Damage
import CanDamage
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CollisionDetect
import trap_G2API_CleanGhoul2Models
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import G_SkinIndex
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_RunObject
import G_TouchSolids
import G_EntitiesFree
import G_FreeEntity
import G_KillG2Queue
import G_SendG2KillQueue
import TryUse
import G_EntitySound
import G_SoundAtLoc
import G_Sound
import G_MuteSound
import G_ScreenShake
import G_PlayEffect
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetAngles
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_RadiusList
import G_Find
import G_KillBox
import G_TeamCommand
import G_EffectIndex
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import ItemUse_MedPack
import ItemUse_Seeker
import ItemUse_Sentry
import ItemUse_Shield
import ItemUse_Binoculars
import G_GetDuelWinner
import Cmd_EngageDuel_f
import Cmd_ToggleSaber_f
import G_ItemUsable
import Cmd_SaberAttackCycle_f
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import gEscapeTime
import gEscaping
import g2SaberInstance
import precachedKyle
import forcePowerDarkLight
import WeaponAttackAnim
import WeaponReadyAnim
import BG_OutOfMemory
import BG_StringAlloc
import BG_TempFree
import BG_TempAlloc
import BG_AllocUnaligned
import BG_Alloc
import BG_CanUseFPNow
import BG_HasYsalamiri
import BG_GetItemIndexByTag
import BG_ParseAnimationFile
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_ForcePowerDrain
import BG_SaberStartTransAnim
import BG_InDeathAnim
import BG_InRoll
import BG_KnockawayForParry
import BG_BrokenParryForParry
import BG_BrokenParryForAttack
import BG_SaberInSpecialAttack
import BG_SpinningSaberAnim
import BG_FlippingAnim
import BG_SaberInIdle
import BG_SaberInSpecial
import BG_SaberInAttack
import BG_DirectFlippingAnim
import BG_InSaberStandAnim
import BG_InSpecialJump
import BG_LegalizedForcePowers
import saberMoveData
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import vectoyaw
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import pm
import bgForcePowerCost
import forceMasteryPoints
import forceMasteryLevels
import bgGlobalAnimations
import BGPAFtextLoaded
import forcePowerSorted
import WP_MuzzlePoint
import ammoData
import weaponData
import GetStringForID
import GetIDForString
import Q_irand
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseVec4
import COM_ParseFloat
import COM_ParseInt
import COM_ParseString
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import SkipWhitespace
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import powf
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkBlue
import colorLtBlue
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import colorTable
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import forceSpeedLevels
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $779
char 1 115
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $753
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 109
char 1 101
char 1 108
char 1 101
char 1 101
char 1 47
char 1 112
char 1 117
char 1 110
char 1 99
char 1 104
char 1 37
char 1 100
char 1 0
align 1
LABELV $613
char 1 99
char 1 101
char 1 110
char 1 116
char 1 101
char 1 114
char 1 118
char 1 105
char 1 101
char 1 119
char 1 10
char 1 0
align 1
LABELV $544
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 83
char 1 84
char 1 79
char 1 80
char 1 0
align 1
LABELV $543
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $538
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 84
char 1 73
char 1 69
char 1 0
align 1
LABELV $537
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $536
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 87
char 1 73
char 1 78
char 1 78
char 1 69
char 1 82
char 1 0
align 1
LABELV $535
char 1 83
char 1 86
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $534
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $509
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 111
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $508
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 111
char 1 102
char 1 102
char 1 113
char 1 117
char 1 105
char 1 99
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $461
char 1 51
char 1 51
char 1 0
align 1
LABELV $457
char 1 56
char 1 0
align 1
LABELV $456
char 1 112
char 1 109
char 1 111
char 1 118
char 1 101
char 1 95
char 1 109
char 1 115
char 1 101
char 1 99
char 1 0
align 1
LABELV $346
char 1 99
char 1 112
char 1 32
char 1 34
char 1 84
char 1 101
char 1 110
char 1 32
char 1 115
char 1 101
char 1 99
char 1 111
char 1 110
char 1 100
char 1 115
char 1 32
char 1 117
char 1 110
char 1 116
char 1 105
char 1 108
char 1 32
char 1 105
char 1 110
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 105
char 1 116
char 1 121
char 1 32
char 1 100
char 1 114
char 1 111
char 1 112
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $342
char 1 68
char 1 114
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 32
char 1 100
char 1 117
char 1 101
char 1 32
char 1 116
char 1 111
char 1 32
char 1 105
char 1 110
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $126
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 103
char 1 117
char 1 114
char 1 112
char 1 50
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $123
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 103
char 1 117
char 1 114
char 1 112
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
