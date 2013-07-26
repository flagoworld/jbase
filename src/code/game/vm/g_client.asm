data
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "../g_client.c"
line 24
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:#if MAC_PORT
;5:#include "../ghoul2/g2.h"
;6:#else
;7:#include "..\ghoul2\g2.h"
;8:#endif
;9:
;10:// g_client.c -- client functions that don't happen every frame
;11:
;12:static vec3_t	playerMins = {-15, -15, DEFAULT_MINS_2};
;13:static vec3_t	playerMaxs = {15, 15, DEFAULT_MAXS_2};
;14:
;15:forcedata_t Client_Force[MAX_CLIENTS];
;16:
;17:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;18:potential spawning position for deathmatch games.
;19:The first time a player enters the game, they will be at an 'initial' spot.
;20:Targets will be fired when someone spawns in on them.
;21:"nobots" will prevent bots from using this spot.
;22:"nohumans" will prevent non-bots from using this spot.
;23:*/
;24:void SP_info_player_deathmatch( gentity_t *ent ) {
line 27
;25:	int		i;
;26:
;27:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $79
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 28
;28:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $81
line 29
;29:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 472
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
line 30
;30:	}
LABELV $81
line 31
;31:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $83
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 32
;32:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $84
line 33
;33:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 34
;34:	}
LABELV $84
line 35
;35:}
LABELV $78
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 40
;36:
;37:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;38:equivelant to info_player_deathmatch
;39:*/
;40:void SP_info_player_start(gentity_t *ent) {
line 41
;41:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $87
ASGNP4
line 42
;42:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 43
;43:}
LABELV $86
endproc SP_info_player_start 0 4
export SP_info_player_imperial
proc SP_info_player_imperial 0 4
line 48
;44:
;45:/*QUAKED info_player_imperial (1 0 0) (-16 -16 -24) (16 16 32)
;46:saga start point - imperial
;47:*/
;48:void SP_info_player_imperial(gentity_t *ent) {
line 49
;49:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $89
line 50
;50:	{ //turn into a DM spawn if not in saga game mode
line 51
;51:		ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $87
ASGNP4
line 52
;52:		SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 53
;53:	}
LABELV $89
line 54
;54:}
LABELV $88
endproc SP_info_player_imperial 0 4
export SP_info_player_rebel
proc SP_info_player_rebel 0 4
line 59
;55:
;56:/*QUAKED info_player_rebel (1 0 0) (-16 -16 -24) (16 16 32)
;57:saga start point - rebel
;58:*/
;59:void SP_info_player_rebel(gentity_t *ent) {
line 60
;60:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $93
line 61
;61:	{ //turn into a DM spawn if not in saga game mode
line 62
;62:		ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $87
ASGNP4
line 63
;63:		SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 64
;64:	}
LABELV $93
line 65
;65:}
LABELV $92
endproc SP_info_player_rebel 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 70
;66:
;67:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;68:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;69:*/
;70:void SP_info_player_intermission( gentity_t *ent ) {
line 72
;71:
;72:}
LABELV $96
endproc SP_info_player_intermission 0 0
export ThrowSaberToAttacker
proc ThrowSaberToAttacker 68 8
line 77
;73:
;74:#define JMSABER_RESPAWN_TIME 20000 //in case it gets stuck somewhere no one can reach
;75:
;76:void ThrowSaberToAttacker(gentity_t *self, gentity_t *attacker)
;77:{
line 78
;78:	gentity_t *ent = &g_entities[self->client->ps.saberIndex];
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 80
;79:	vec3_t a;
;80:	int altVelocity = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 82
;81:
;82:	if (!ent || ent->enemy != self)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $100
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $98
LABELV $100
line 83
;83:	{ //something has gone very wrong (this should never happen)
line 88
;84:		//but in case it does.. find the saber manually
;85:#ifdef _DEBUG
;86:		Com_Printf("Lost the saber! Attempting to use global pointer..\n");
;87:#endif
;88:		ent = gJMSaberEnt;
ADDRLP4 0
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
line 90
;89:
;90:		if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $101
line 91
;91:		{
line 95
;92:#ifdef _DEBUG
;93:			Com_Printf("The global pointer was NULL. This is a bad thing.\n");
;94:#endif
;95:			return;
ADDRGP4 $97
JUMPV
LABELV $101
line 102
;96:		}
;97:
;98:#ifdef _DEBUG
;99:		Com_Printf("Got it (%i). Setting enemy to client %i.\n", ent->s.number, self->s.number);
;100:#endif
;101:
;102:		ent->enemy = self;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 103
;103:		self->client->ps.saberIndex = ent->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 104
;104:	}
LABELV $98
line 106
;105:
;106:	trap_SetConfigstring ( CS_CLIENT_JEDIMASTER, "-1" );
CNSTI4 28
ARGI4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 108
;107:
;108:	if (attacker && attacker->client && self->client->ps.saberInFlight)
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $104
ADDRLP4 32
CNSTI4 408
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $104
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $104
line 109
;109:	{ //someone killed us and we had the saber thrown, so actually move this saber to the saber location
line 112
;110:	  //if we killed ourselves with saber thrown, however, same suicide rules of respawning at spawn spot still
;111:	  //apply.
;112:		gentity_t *flyingsaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 36
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 114
;113:
;114:		if (flyingsaber && flyingsaber->inuse)
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $106
ADDRLP4 36
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $106
line 115
;115:		{
line 116
;116:			VectorCopy(flyingsaber->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 44
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 117
;117:			VectorCopy(flyingsaber->s.pos.trDelta, ent->s.pos.trDelta);
ADDRLP4 48
CNSTI4 36
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 118
;118:			VectorCopy(flyingsaber->s.apos.trBase, ent->s.apos.trBase);
ADDRLP4 52
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 119
;119:			VectorCopy(flyingsaber->s.apos.trDelta, ent->s.apos.trDelta);
ADDRLP4 56
CNSTI4 72
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 121
;120:
;121:			VectorCopy(flyingsaber->r.currentOrigin, ent->r.currentOrigin);
ADDRLP4 60
CNSTI4 368
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 122
;122:			VectorCopy(flyingsaber->r.currentAngles, ent->r.currentAngles);
ADDRLP4 64
CNSTI4 380
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 123
;123:			altVelocity = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 124
;124:		}
LABELV $106
line 125
;125:	}
LABELV $104
line 127
;126:
;127:	self->client->ps.saberInFlight = qtrue; //say he threw it anyway in order to properly remove from dead body
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 129
;128:
;129:	ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $108
ARGP4
ADDRLP4 36
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 130
;130:	ent->s.eFlags &= ~(EF_NODRAW);
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 131
;131:	ent->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 132
;132:	ent->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 133
;133:	ent->enemy = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 135
;134:
;135:	if (!attacker || !attacker->client)
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $111
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
NEU4 $109
LABELV $111
line 136
;136:	{
line 137
;137:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 138
;138:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 139
;139:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 140
;140:		ent->pos2[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 0
ASGNF4
line 141
;141:		trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 142
;142:		return;
ADDRGP4 $97
JUMPV
LABELV $109
line 145
;143:	}
;144:
;145:	if (!altVelocity)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $112
line 146
;146:	{
line 147
;147:		VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 52
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 148
;148:		VectorCopy(self->s.pos.trBase, ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 149
;149:		VectorCopy(self->s.pos.trBase, ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 151
;150:
;151:		VectorSubtract(attacker->client->ps.origin, ent->s.pos.trBase, a);
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 64
CNSTI4 24
ASGNI4
ADDRLP4 4
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 153
;152:
;153:		VectorNormalize(a);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 155
;154:
;155:		ent->s.pos.trDelta[0] = a[0]*256;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1132462080
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 156
;156:		ent->s.pos.trDelta[1] = a[1]*256;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132462080
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
line 157
;157:		ent->s.pos.trDelta[2] = 256;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1132462080
ASGNF4
line 158
;158:	}
LABELV $112
line 160
;159:
;160:	trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 161
;161:}
LABELV $97
endproc ThrowSaberToAttacker 68 8
export JMSaberThink
proc JMSaberThink 28 4
line 164
;162:
;163:void JMSaberThink(gentity_t *ent)
;164:{
line 165
;165:	gJMSaberEnt = ent;
ADDRGP4 gJMSaberEnt
ADDRFP4 0
INDIRP4
ASGNP4
line 167
;166:
;167:	if (ent->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 168
;168:	{
line 169
;169:		if (!ent->enemy->client || !ent->enemy->inuse)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $122
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $120
LABELV $122
line 170
;170:		{ //disconnected?
line 171
;171:			VectorCopy(ent->enemy->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 24
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 172
;172:			VectorCopy(ent->enemy->s.pos.trBase, ent->s.origin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 173
;173:			VectorCopy(ent->enemy->s.pos.trBase, ent->r.currentOrigin);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 174
;174:			ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $108
ARGP4
ADDRLP4 20
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 175
;175:			ent->s.eFlags &= ~(EF_NODRAW);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 176
;176:			ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 177
;177:			ent->s.eType = ET_MISSILE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 178
;178:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 180
;179:
;180:			ent->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 1065353216
ASGNF4
line 181
;181:			ent->pos2[1] = 0; //respawn next think
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 0
ASGNF4
line 182
;182:			trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 183
;183:		}
ADDRGP4 $119
JUMPV
LABELV $120
line 185
;184:		else
;185:		{
line 186
;186:			ent->pos2[1] = level.time + JMSABER_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
ADDI4
CVIF4 4
ASGNF4
line 187
;187:		}
line 188
;188:	}
ADDRGP4 $119
JUMPV
LABELV $118
line 189
;189:	else if (ent->pos2[0] && ent->pos2[1] < level.time)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
CNSTF4 0
EQF4 $124
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $124
line 190
;190:	{
line 191
;191:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 192
;192:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 193
;193:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 194
;194:		ent->pos2[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 0
ASGNF4
line 195
;195:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 196
;196:	}
LABELV $124
LABELV $119
line 198
;197:
;198:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 199
;199:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 200
;200:}
LABELV $117
endproc JMSaberThink 28 4
export JMSaberTouch
proc JMSaberTouch 36 12
line 203
;201:
;202:void JMSaberTouch(gentity_t *self, gentity_t *other, trace_t *trace)
;203:{
line 204
;204:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 207
;205://	gentity_t *te;
;206:
;207:	if (!other || !other->client || other->health < 1)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $132
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $132
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $129
LABELV $132
line 208
;208:	{
line 209
;209:		return;
ADDRGP4 $128
JUMPV
LABELV $129
line 212
;210:	}
;211:
;212:	if (self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $133
line 213
;213:	{
line 214
;214:		return;
ADDRGP4 $128
JUMPV
LABELV $133
line 217
;215:	}
;216:
;217:	if (!self->s.modelindex)
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $135
line 218
;218:	{
line 219
;219:		return;
ADDRGP4 $128
JUMPV
LABELV $135
line 222
;220:	}
;221:
;222:	if (other->client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $137
line 223
;223:	{
line 224
;224:		return;
ADDRGP4 $128
JUMPV
LABELV $137
line 227
;225:	}
;226:
;227:	if (other->client->ps.isJediMaster)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
line 228
;228:	{
line 229
;229:		return;
ADDRGP4 $128
JUMPV
LABELV $139
line 232
;230:	}
;231:
;232:	self->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 233
;233:	other->client->ps.stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 234
;234:	other->client->ps.weapon = WP_SABER;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 235
;235:	other->s.weapon = WP_SABER;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 236
;236:	G_AddEvent(other, EV_BECOME_JEDIMASTER, 0);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 30
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 239
;237:
;238:	// Track the jedi master 
;239:	trap_SetConfigstring ( CS_CLIENT_JEDIMASTER, va("%i", other->s.number ) );
ADDRGP4 $141
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 28
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 241
;240:
;241:	if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $142
line 242
;242:	{
line 243
;243:		other->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 244
;244:		other->client->invulnerableTimer = level.time + g_spawnInvulnerability.integer;
ADDRFP4 4
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
line 245
;245:	}
LABELV $142
line 247
;246:
;247:	trap_SendServerCommand( -1, va("cp \"%s %s\n\"", other->client->pers.netname, G_GetStripEdString("SVINGAME", "BECOMEJM")) );
ADDRGP4 $148
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 16
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $147
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 249
;248:
;249:	other->client->ps.isJediMaster = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 250
;250:	other->client->ps.saberIndex = self->s.number;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 252
;251:
;252:	if (other->health < 200 && other->health > 0)
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 200
GEI4 $150
ADDRLP4 24
INDIRI4
CNSTI4 0
LEI4 $150
line 253
;253:	{ //full health when you become the Jedi Master
line 254
;254:		other->client->ps.stats[STAT_HEALTH] = other->health = 200;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 200
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 255
;255:	}
LABELV $150
line 257
;256:
;257:	if (other->client->ps.fd.forcePower < 100)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
GEI4 $155
line 258
;258:	{
line 259
;259:		other->client->ps.fd.forcePower = 100;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 100
ASGNI4
line 260
;260:	}
ADDRGP4 $155
JUMPV
LABELV $154
line 263
;261:
;262:	while (i < NUM_FORCE_POWERS)
;263:	{
line 264
;264:		other->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 265
;265:		other->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 267
;266:
;267:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 268
;268:	}
LABELV $155
line 262
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $154
line 270
;269:
;270:	self->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 1065353216
ASGNF4
line 271
;271:	self->pos2[1] = level.time + JMSABER_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
ADDI4
CVIF4 4
ASGNF4
line 273
;272:
;273:	self->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 274
;274:	self->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 275
;275:	self->s.modelGhoul2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 276
;276:	self->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 283
;277:
;278:	/*
;279:	te = G_TempEntity( vec3_origin, EV_DESTROY_GHOUL2_INSTANCE );
;280:	te->r.svFlags |= SVF_BROADCAST;
;281:	te->s.eventParm = self->s.number;
;282:	*/
;283:	G_KillG2Queue(self->s.number);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_KillG2Queue
CALLV
pop
line 285
;284:
;285:	return;
LABELV $128
endproc JMSaberTouch 36 12
data
export gJMSaberEnt
align 4
LABELV gJMSaberEnt
byte 4 0
export SP_info_jedimaster_start
code
proc SP_info_jedimaster_start 8 4
line 294
;286:}
;287:
;288:gentity_t *gJMSaberEnt = NULL;
;289:
;290:/*QUAKED info_jedimaster_start (1 0 0) (-16 -16 -24) (16 16 32)
;291:"jedi master" saber spawn point
;292:*/
;293:void SP_info_jedimaster_start(gentity_t *ent)
;294:{
line 295
;295:	if (g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $159
line 296
;296:	{
line 297
;297:		gJMSaberEnt = NULL;
ADDRGP4 gJMSaberEnt
CNSTP4 0
ASGNP4
line 298
;298:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 299
;299:		return;
ADDRGP4 $158
JUMPV
LABELV $159
line 302
;300:	}
;301:
;302:	ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 304
;303:
;304:	ent->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 306
;305:
;306:	ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $108
ARGP4
ADDRLP4 0
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 307
;307:	ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 308
;308:	ent->s.g2radius = 20;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 20
ASGNI4
line 310
;309:	//ent->s.eType = ET_GENERAL;
;310:	ent->s.eType = ET_MISSILE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 311
;311:	ent->s.weapon = WP_SABER;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 312
;312:	ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 313
;313:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 314
;314:	VectorSet( ent->r.maxs, 3, 3, 3 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 315
;315:	VectorSet( ent->r.mins, -3, -3, -3 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 316
;316:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 317
;317:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 319
;318:
;319:	ent->isSaberEntity = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 1
ASGNI4
line 321
;320:
;321:	ent->bounceCount = -5;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 -5
ASGNI4
line 323
;322:
;323:	ent->physicsObject = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 325
;324:
;325:	VectorCopy(ent->s.pos.trBase, ent->s.origin2); //remember the spawn spot
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 327
;326:
;327:	ent->touch = JMSaberTouch;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 JMSaberTouch
ASGNP4
line 329
;328:
;329:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 331
;330:
;331:	ent->think = JMSaberThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 JMSaberThink
ASGNP4
line 332
;332:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 333
;333:}
LABELV $158
endproc SP_info_jedimaster_start 8 4
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 349
;334:
;335:/*
;336:=======================================================================
;337:
;338:  SelectSpawnPoint
;339:
;340:=======================================================================
;341:*/
;342:
;343:/*
;344:================
;345:SpotWouldTelefrag
;346:
;347:================
;348:*/
;349:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 355
;350:	int			i, num;
;351:	int			touch[MAX_GENTITIES];
;352:	gentity_t	*hit;
;353:	vec3_t		mins, maxs;
;354:
;355:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 356
;356:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 357
;357:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 359
;358:
;359:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $176
JUMPV
LABELV $173
line 360
;360:		hit = &g_entities[touch[i]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 362
;361:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;362:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $177
line 363
;363:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $164
JUMPV
LABELV $177
line 366
;364:		}
;365:
;366:	}
LABELV $174
line 359
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $176
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $173
line 368
;367:
;368:	return qfalse;
CNSTI4 0
RETI4
LABELV $164
endproc SpotWouldTelefrag 4144 16
export SelectNearestDeathmatchSpawnPoint
proc SelectNearestDeathmatchSpawnPoint 40 12
line 379
;369:}
;370:
;371:/*
;372:================
;373:SelectNearestDeathmatchSpawnPoint
;374:
;375:Find the spot that we DON'T want to use
;376:================
;377:*/
;378:#define	MAX_SPAWN_POINTS	128
;379:gentity_t *SelectNearestDeathmatchSpawnPoint( vec3_t from ) {
line 385
;380:	gentity_t	*spot;
;381:	vec3_t		delta;
;382:	float		dist, nearestDist;
;383:	gentity_t	*nearestSpot;
;384:
;385:	nearestDist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 386
;386:	nearestSpot = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 387
;387:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $181
JUMPV
LABELV $180
line 389
;388:
;389:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 391
;390:
;391:		VectorSubtract( spot->s.origin, from, delta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 392
;392:		dist = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 393
;393:		if ( dist < nearestDist ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $185
line 394
;394:			nearestDist = dist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 395
;395:			nearestSpot = spot;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 396
;396:		}
LABELV $185
line 397
;397:	}
LABELV $181
line 389
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $180
line 399
;398:
;399:	return nearestSpot;
ADDRLP4 24
INDIRP4
RETP4
LABELV $179
endproc SelectNearestDeathmatchSpawnPoint 40 12
export SelectRandomDeathmatchSpawnPoint
proc SelectRandomDeathmatchSpawnPoint 532 12
line 411
;400:}
;401:
;402:
;403:/*
;404:================
;405:SelectRandomDeathmatchSpawnPoint
;406:
;407:go to a random point that doesn't telefrag
;408:================
;409:*/
;410:#define	MAX_SPAWN_POINTS	128
;411:gentity_t *SelectRandomDeathmatchSpawnPoint( void ) {
line 417
;412:	gentity_t	*spot;
;413:	int			count;
;414:	int			selection;
;415:	gentity_t	*spots[MAX_SPAWN_POINTS];
;416:
;417:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 418
;418:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $189
JUMPV
LABELV $188
line 420
;419:
;420:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 421
;421:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
EQI4 $191
line 422
;422:			continue;
ADDRGP4 $189
JUMPV
LABELV $191
line 424
;423:		}
;424:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 425
;425:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 426
;426:	}
LABELV $189
line 420
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $188
line 428
;427:
;428:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $193
line 429
;429:		return G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 528
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $187
JUMPV
LABELV $193
line 432
;430:	}
;431:
;432:	selection = rand() % count;
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 528
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 433
;433:	return spots[ selection ];
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $187
endproc SelectRandomDeathmatchSpawnPoint 532 12
export SelectRandomFurthestSpawnPoint
proc SelectRandomFurthestSpawnPoint 572 12
line 443
;434:}
;435:
;436:/*
;437:===========
;438:SelectRandomFurthestSpawnPoint
;439:
;440:Chooses a player start, deathmatch start, etc
;441:============
;442:*/
;443:gentity_t *SelectRandomFurthestSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 451
;444:	gentity_t	*spot;
;445:	vec3_t		delta;
;446:	float		dist;
;447:	float		list_dist[64];
;448:	gentity_t	*list_spot[64];
;449:	int			numSpots, rnd, i, j;
;450:
;451:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 452
;452:	spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
ADDRGP4 $197
JUMPV
LABELV $196
line 454
;453:
;454:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 455
;455:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $199
line 456
;456:			continue;
ADDRGP4 $197
JUMPV
LABELV $199
line 458
;457:		}
;458:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 556
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 459
;459:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 560
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 560
INDIRF4
ASGNF4
line 460
;460:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 461
;461:			if ( dist > list_dist[i] ) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $207
line 462
;462:				if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $209
line 463
;463:					numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $209
line 464
;464:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 465
;465:					list_dist[j] = list_dist[j-1];
ADDRLP4 564
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 564
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 564
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 466
;466:					list_spot[j] = list_spot[j-1];
ADDRLP4 568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 568
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 568
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 467
;467:				}
LABELV $212
line 464
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $211
line 468
;468:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 469
;469:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 470
;470:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 471
;471:				if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $205
line 472
;472:					numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 473
;473:				break;
ADDRGP4 $205
JUMPV
LABELV $207
line 475
;474:			}
;475:		}
LABELV $204
line 460
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $203
LABELV $205
line 476
;476:		if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $219
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $219
line 477
;477:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 478
;478:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 479
;479:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 480
;480:		}
LABELV $219
line 481
;481:	}
LABELV $197
line 454
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 548
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 548
INDIRP4
ASGNP4
ADDRLP4 548
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $196
line 482
;482:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $221
line 483
;483:		spot = G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 552
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 552
INDIRP4
ASGNP4
line 484
;484:		if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $223
line 485
;485:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $225
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $223
line 486
;486:		VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 487
;487:		origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 488
;488:		VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 489
;489:		return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $195
JUMPV
LABELV $221
line 493
;490:	}
;491:
;492:	// select a random spot from the spawn points furthest away
;493:	rnd = random() * (numSpots / 2);
ADDRLP4 552
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
ADDRLP4 552
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 495
;494:
;495:	VectorCopy (list_spot[rnd]->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 496
;496:	origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 497
;497:	VectorCopy (list_spot[rnd]->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 499
;498:
;499:	return list_spot[rnd];
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
RETP4
LABELV $195
endproc SelectRandomFurthestSpawnPoint 572 12
export SelectSpawnPoint
proc SelectSpawnPoint 4 12
line 509
;500:}
;501:
;502:/*
;503:===========
;504:SelectSpawnPoint
;505:
;506:Chooses a player start, deathmatch start, etc
;507:============
;508:*/
;509:gentity_t *SelectSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 510
;510:	return SelectRandomFurthestSpawnPoint( avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $226
endproc SelectSpawnPoint 4 12
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 12
line 549
;511:
;512:	/*
;513:	gentity_t	*spot;
;514:	gentity_t	*nearestSpot;
;515:
;516:	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );
;517:
;518:	spot = SelectRandomDeathmatchSpawnPoint ( );
;519:	if ( spot == nearestSpot ) {
;520:		// roll again if it would be real close to point of death
;521:		spot = SelectRandomDeathmatchSpawnPoint ( );
;522:		if ( spot == nearestSpot ) {
;523:			// last try
;524:			spot = SelectRandomDeathmatchSpawnPoint ( );
;525:		}		
;526:	}
;527:
;528:	// find a single player start spot
;529:	if (!spot) {
;530:		G_Error( "Couldn't find a spawn point" );
;531:	}
;532:
;533:	VectorCopy (spot->s.origin, origin);
;534:	origin[2] += 9;
;535:	VectorCopy (spot->s.angles, angles);
;536:
;537:	return spot;
;538:	*/
;539:}
;540:
;541:/*
;542:===========
;543:SelectInitialSpawnPoint
;544:
;545:Try to find a spawn point marked 'initial', otherwise
;546:use normal spawn selection.
;547:============
;548:*/
;549:gentity_t *SelectInitialSpawnPoint( vec3_t origin, vec3_t angles ) {
line 552
;550:	gentity_t	*spot;
;551:
;552:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $229
JUMPV
LABELV $228
line 553
;553:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 554
;554:		if ( spot->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $231
line 555
;555:			break;
ADDRGP4 $230
JUMPV
LABELV $231
line 557
;556:		}
;557:	}
LABELV $229
line 553
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $228
LABELV $230
line 559
;558:
;559:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $235
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $233
LABELV $235
line 560
;560:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $227
JUMPV
LABELV $233
line 563
;561:	}
;562:
;563:	VectorCopy (spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 564
;564:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 565
;565:	VectorCopy (spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 567
;566:
;567:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $227
endproc SelectInitialSpawnPoint 20 12
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 576
;568:}
;569:
;570:/*
;571:===========
;572:SelectSpectatorSpawnPoint
;573:
;574:============
;575:*/
;576:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 577
;577:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 579
;578:
;579:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+9024
INDIRB
ASGNB 12
line 580
;580:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+9036
INDIRB
ASGNB 12
line 582
;581:
;582:	return NULL;
CNSTP4 0
RETP4
LABELV $236
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 608
;583:}
;584:
;585:/*
;586:=======================================================================
;587:
;588:BODYQUE
;589:
;590:=======================================================================
;591:*/
;592:
;593:/*
;594:=======================================================================
;595:
;596:BODYQUE
;597:
;598:=======================================================================
;599:*/
;600:
;601:#define BODY_SINK_TIME		45000
;602:
;603:/*
;604:===============
;605:InitBodyQue
;606:===============
;607:*/
;608:void InitBodyQue (void) {
line 612
;609:	int		i;
;610:	gentity_t	*ent;
;611:
;612:	level.bodyQueIndex = 0;
ADDRGP4 level+9056
CNSTI4 0
ASGNI4
line 613
;613:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $241
line 614
;614:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 615
;615:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $245
ASGNP4
line 616
;616:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 617
;617:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9060
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 618
;618:	}
LABELV $242
line 613
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $241
line 619
;619:}
LABELV $239
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 628
;620:
;621:/*
;622:=============
;623:BodySink
;624:
;625:After sitting around for five seconds, fall into the ground and dissapear
;626:=============
;627:*/
;628:void BodySink( gentity_t *ent ) {
line 629
;629:	if ( level.time - ent->timestamp > BODY_SINK_TIME + 1500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
SUBI4
CNSTI4 46500
LEI4 $248
line 631
;630:		// the body ques are never actually freed, they are just unlinked
;631:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 632
;632:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 0
ASGNI4
line 633
;633:		return;	
ADDRGP4 $247
JUMPV
LABELV $248
line 635
;634:	}
;635:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 636
;636:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 637
;637:}
LABELV $247
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 64 12
line 647
;638:
;639:/*
;640:=============
;641:CopyToBodyQue
;642:
;643:A player is respawning, so make an entity that looks
;644:just like the existing corpse to leave behind.
;645:=============
;646:*/
;647:void CopyToBodyQue( gentity_t *ent ) {
line 651
;648:	gentity_t		*body;
;649:	int			contents;
;650:
;651:	if (level.intermissiontime)
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $253
line 652
;652:	{
line 653
;653:		return;
ADDRGP4 $252
JUMPV
LABELV $253
line 656
;654:	}
;655:
;656:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 659
;657:
;658:	// if client is in a nodrop area, don't leave the body
;659:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 660
;660:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $256
line 661
;661:		return;
ADDRGP4 $252
JUMPV
LABELV $256
line 664
;662:	}
;663:
;664:	if (ent->client && (ent->client->ps.eFlags & EF_DISINTEGRATION))
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $258
ADDRLP4 12
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $258
line 665
;665:	{ //for now, just don't spawn a body if you got disint'd
line 666
;666:		return;
ADDRGP4 $252
JUMPV
LABELV $258
line 670
;667:	}
;668:
;669:	// grab a body que and cycle to the next one
;670:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+9056
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9060
ADDP4
INDIRP4
ASGNP4
line 671
;671:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+9056
ADDRGP4 level+9056
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 673
;672:
;673:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 674
;674:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 296
line 677
;675:
;676:	//avoid oddly angled corpses floating around
;677:	body->s.angles[PITCH] = body->s.angles[ROLL] = body->s.apos.trBase[PITCH] = body->s.apos.trBase[ROLL] = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 679
;678:
;679:	body->s.g2radius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 100
ASGNI4
line 681
;680:
;681:	body->s.eType = ET_BODY;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 15
ASGNI4
line 682
;682:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 684
;683:
;684:	if (ent->client && (ent->client->ps.eFlags & EF_DISINTEGRATION))
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $264
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $264
line 685
;685:	{
line 686
;686:		body->s.eFlags |= EF_DISINTEGRATION;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 687
;687:	}
LABELV $264
line 689
;688:
;689:	VectorCopy(ent->client->ps.lastHitLoc, body->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 691
;690:
;691:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 692
;692:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 693
;693:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ASGNI4
line 694
;694:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 695
;695:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 696
;696:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTF4 0
ASGNF4
line 697
;697:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $267
line 698
;698:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 699
;699:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 700
;700:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 701
;701:	} else {
ADDRGP4 $268
JUMPV
LABELV $267
line 702
;702:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 703
;703:	}
LABELV $268
line 704
;704:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 706
;705:
;706:	body->s.weapon = ent->s.bolt2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 708
;707:
;708:	if (body->s.weapon == WP_SABER && ent->client->ps.saberInFlight)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $270
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $270
line 709
;709:	{
line 710
;710:		body->s.weapon = WP_BLASTER; //lie to keep from putting a saber on the corpse, because it was thrown at death
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 711
;711:	}
LABELV $270
line 713
;712:
;713:	G_AddEvent(body, EV_BODY_QUEUE_COPY, ent->s.clientNum);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 109
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 715
;714:
;715:	body->r.svFlags = ent->r.svFlags | SVF_BROADCAST;
ADDRLP4 32
CNSTI4 304
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 716
;716:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 36
CNSTI4 316
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 717
;717:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 40
CNSTI4 328
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 718
;718:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 44
CNSTI4 344
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 719
;719:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 48
CNSTI4 356
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 721
;720:
;721:	body->s.torsoAnim = body->s.legsAnim = ent->client->ps.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 723
;722:
;723:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 17
ASGNI4
line 724
;724:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 512
ASGNI4
line 725
;725:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 727
;726:
;727:	body->nextthink = level.time + BODY_SINK_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 45000
ADDI4
ASGNI4
line 728
;728:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 BodySink
ASGNP4
line 730
;729:
;730:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 body_die
ASGNP4
line 733
;731:
;732:	// don't take more damage if already gibbed
;733:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $273
line 734
;734:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 735
;735:	} else {
ADDRGP4 $274
JUMPV
LABELV $273
line 736
;736:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 737
;737:	}
LABELV $274
line 739
;738:
;739:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 740
;740:	trap_LinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 741
;741:}
LABELV $252
endproc CopyToBodyQue 64 12
export SetClientViewAngle
proc SetClientViewAngle 16 0
line 752
;742:
;743://======================================================================
;744:
;745:
;746:/*
;747:==================
;748:SetClientViewAngle
;749:
;750:==================
;751:*/
;752:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 756
;753:	int			i;
;754:
;755:	// set the delta angle
;756:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 759
;757:		int		cmdAngle;
;758:
;759:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 4
CNSTF4 1199570944
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 760
;760:		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 1388
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 761
;761:	}
LABELV $277
line 756
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $276
line 762
;762:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 763
;763:	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 764
;764:}
LABELV $275
endproc SetClientViewAngle 16 0
export respawn
proc respawn 12 8
line 771
;765:
;766:/*
;767:================
;768:respawn
;769:================
;770:*/
;771:void respawn( gentity_t *ent ) {
line 774
;772:	gentity_t	*tent;
;773:
;774:	CopyToBodyQue (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 776
;775:
;776:	if (gEscaping)
ADDRGP4 gEscaping
INDIRI4
CNSTI4 0
EQI4 $281
line 777
;777:	{
line 778
;778:		ent->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 3
ASGNI4
line 779
;779:		ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 780
;780:		ent->client->sess.spectatorClient = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 0
ASGNI4
line 782
;781:
;782:		ent->client->pers.teamState.state = TEAM_BEGIN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 0
ASGNI4
line 783
;783:	}
LABELV $281
line 785
;784:
;785:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 786
;786:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 789
;787:
;788:	// add a teleportation effect
;789:	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 790
;790:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
CNSTI4 220
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 791
;791:}
LABELV $280
endproc respawn 12 8
export TeamCount
proc TeamCount 8 0
line 800
;792:
;793:/*
;794:================
;795:TeamCount
;796:
;797:Returns number of players on a team
;798:================
;799:*/
;800:team_t TeamCount( int ignoreClientNum, int team ) {
line 802
;801:	int		i;
;802:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 804
;803:
;804:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $284
line 805
;805:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $289
line 806
;806:			continue;
ADDRGP4 $285
JUMPV
LABELV $289
line 808
;807:		}
;808:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $291
line 809
;809:			continue;
ADDRGP4 $285
JUMPV
LABELV $291
line 811
;810:		}
;811:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $293
line 812
;812:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 813
;813:		}
LABELV $293
line 814
;814:	}
LABELV $285
line 804
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $287
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $284
line 816
;815:
;816:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $283
endproc TeamCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 826
;817:}
;818:
;819:/*
;820:================
;821:TeamLeader
;822:
;823:Returns the client number of the team leader
;824:================
;825:*/
;826:int TeamLeader( int team ) {
line 829
;827:	int		i;
;828:
;829:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $299
JUMPV
LABELV $296
line 830
;830:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 831
;831:			continue;
ADDRGP4 $297
JUMPV
LABELV $301
line 833
;832:		}
;833:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $303
line 834
;834:			if ( level.clients[i].sess.teamLeader )
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1572
ADDP4
INDIRI4
CNSTI4 0
EQI4 $305
line 835
;835:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $295
JUMPV
LABELV $305
line 836
;836:		}
LABELV $303
line 837
;837:	}
LABELV $297
line 829
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $299
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $296
line 839
;838:
;839:	return -1;
CNSTI4 -1
RETI4
LABELV $295
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 849
;840:}
;841:
;842:
;843:/*
;844:================
;845:PickTeam
;846:
;847:================
;848:*/
;849:team_t PickTeam( int ignoreClientNum ) {
line 852
;850:	int		counts[TEAM_NUM_TEAMS];
;851:
;852:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 853
;853:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 855
;854:
;855:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $310
line 856
;856:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $307
JUMPV
LABELV $310
line 858
;857:	}
;858:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $314
line 859
;859:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $307
JUMPV
LABELV $314
line 862
;860:	}
;861:	// equal team count, so join the team with the lowest score
;862:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $318
line 863
;863:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $307
JUMPV
LABELV $318
line 865
;864:	}
;865:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $307
endproc PickTeam 24 8
proc ClientCleanName 40 12
line 893
;866:}
;867:
;868:/*
;869:===========
;870:ForceClientSkin
;871:
;872:Forces a client's skin (for teamplay)
;873:===========
;874:*/
;875:/*
;876:static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
;877:	char *p;
;878:
;879:	if ((p = Q_strrchr(model, '/')) != 0) {
;880:		*p = 0;
;881:	}
;882:
;883:	Q_strcat(model, MAX_QPATH, "/");
;884:	Q_strcat(model, MAX_QPATH, skin);
;885:}
;886:*/
;887:
;888:/*
;889:===========
;890:ClientCheckName
;891:============
;892:*/
;893:static void ClientCleanName( const char *in, char *out, int outSize ) {
line 900
;894:	int		len, colorlessLen;
;895:	char	ch;
;896:	char	*p;
;897:	int		spaces;
;898:
;899:	//save room for trailing null byte
;900:	outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 902
;901:
;902:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 903
;903:	colorlessLen = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 904
;904:	p = out;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
line 905
;905:	*p = 0;
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 906
;906:	spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $326
JUMPV
LABELV $325
line 908
;907:
;908:	while( 1 ) {
line 909
;909:		ch = *in++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
INDIRI1
ASGNI1
line 910
;910:		if( !ch ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $328
line 911
;911:			break;
ADDRGP4 $327
JUMPV
LABELV $328
line 915
;912:		}
;913:
;914:		// don't allow leading spaces
;915:		if( !*p && ch == ' ' ) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $330
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $330
line 916
;916:			continue;
ADDRGP4 $326
JUMPV
LABELV $330
line 920
;917:		}
;918:
;919:		// check colors
;920:		if( ch == Q_COLOR_ESCAPE ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $332
line 922
;921:			// solo trailing carat is not a color prefix
;922:			if( !*in ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $334
line 923
;923:				break;
ADDRGP4 $327
JUMPV
LABELV $334
line 927
;924:			}
;925:
;926:			// don't allow black in a name, period
;927:			if( ColorIndex(*in) == 0 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $336
line 928
;928:				in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 929
;929:				continue;
ADDRGP4 $326
JUMPV
LABELV $336
line 933
;930:			}
;931:
;932:			// make sure room in dest for both chars
;933:			if( len > outSize - 2 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $338
line 934
;934:				break;
ADDRGP4 $327
JUMPV
LABELV $338
line 937
;935:			}
;936:
;937:			*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 938
;938:			*out++ = *in++;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI1
ASGNI1
line 939
;939:			len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 940
;940:			continue;
ADDRGP4 $326
JUMPV
LABELV $332
line 944
;941:		}
;942:
;943:		// don't allow too many consecutive spaces
;944:		if( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $340
line 945
;945:			spaces++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 946
;946:			if( spaces > 3 ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LEI4 $341
line 947
;947:				continue;
ADDRGP4 $326
JUMPV
line 949
;948:			}
;949:		}
LABELV $340
line 950
;950:		else {
line 951
;951:			spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 952
;952:		}
LABELV $341
line 954
;953:
;954:		if( len > outSize - 1 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $344
line 955
;955:			break;
ADDRGP4 $327
JUMPV
LABELV $344
line 958
;956:		}
;957:
;958:		*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 959
;959:		colorlessLen++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 960
;960:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 961
;961:	}
LABELV $326
line 908
ADDRGP4 $325
JUMPV
LABELV $327
line 962
;962:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 965
;963:
;964:	// don't allow empty names
;965:	if( *p == 0 || colorlessLen == 0 ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
EQI4 $348
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $346
LABELV $348
line 966
;966:		Q_strncpyz( p, "Padawan", outSize );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $349
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 967
;967:	}
LABELV $346
line 968
;968:}
LABELV $324
endproc ClientCleanName 40 12
data
export g2SaberInstance
align 4
LABELV g2SaberInstance
byte 4 0
lit
align 4
LABELV $351
byte 4 0
byte 4 0
byte 4 0
export SetupGameGhoul2Model
code
proc SetupGameGhoul2Model 188 44
line 993
;969:
;970:#ifdef _DEBUG
;971:void G_DebugWrite(const char *path, const char *text)
;972:{
;973:	fileHandle_t f;
;974:
;975:	trap_FS_FOpenFile( path, &f, FS_APPEND );
;976:	trap_FS_Write(text, strlen(text), f);
;977:	trap_FS_FCloseFile(f);
;978:}
;979:#endif
;980:
;981:/*
;982:===========
;983:SetupGameGhoul2Model
;984:
;985:There are two ghoul2 model instances per player (actually three).  One is on the clientinfo (the base for the client side 
;986:player, and copied for player spawns and for corpses).  One is attached to the centity itself, which is the model acutally 
;987:animated and rendered by the system.  The final is the game ghoul2 model.  This is animated by pmove on the server, and
;988:is used for determining where the lightsaber should be, and for per-poly collision tests.
;989:===========
;990:*/
;991:void *g2SaberInstance = NULL;
;992:void SetupGameGhoul2Model(gclient_t *client, char *modelname)
;993:{
line 998
;994:	int handle;
;995:	char		afilename[MAX_QPATH];
;996:	char		/**GLAName,*/ *slash;
;997:	char		GLAName[MAX_QPATH];
;998:	vec3_t	tempVec = {0,0,0};
ADDRLP4 64
ADDRGP4 $351
INDIRB
ASGNB 12
line 1001
;999:
;1000:	// First things first.  If this is a ghoul2 model, then let's make sure we demolish this first.
;1001:	if (client->ghoul2 && trap_G2_HaveWeGhoul2Models(client->ghoul2))
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $352
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $352
line 1002
;1002:	{
line 1003
;1003:		trap_G2API_CleanGhoul2Models(&(client->ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 1004
;1004:	}
LABELV $352
line 1022
;1005:
;1006:	/*
;1007:	Com_sprintf( afilename, sizeof( afilename ), "models/players/%s/model.glm", modelname );
;1008:	handle = trap_G2API_InitGhoul2Model(&client->ghoul2, afilename, 0, 0, -20, 0, 0);
;1009:	if (handle<0)
;1010:	{
;1011:		Com_sprintf( afilename, sizeof( afilename ), "models/players/kyle/model.glm" );
;1012:		handle = trap_G2API_InitGhoul2Model(&client->ghoul2, afilename, 0, 0, -20, 0, 0);
;1013:
;1014:		if (handle<0)
;1015:		{
;1016:			return;
;1017:		}
;1018:	}
;1019:	*/
;1020:
;1021:	//rww - just load the "standard" model for the server"
;1022:	if (!precachedKyle)
ADDRGP4 precachedKyle
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $354
line 1023
;1023:	{
line 1024
;1024:		Com_sprintf( afilename, sizeof( afilename ), "models/players/kyle/model.glm" );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $356
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1025
;1025:		handle = trap_G2API_InitGhoul2Model(&precachedKyle, afilename, 0, 0, -20, 0, 0);
ADDRGP4 precachedKyle
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 156
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 160
INDIRI4
ASGNI4
line 1027
;1026:
;1027:		if (handle<0)
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $357
line 1028
;1028:		{
line 1029
;1029:			return;
ADDRGP4 $350
JUMPV
LABELV $357
line 1031
;1030:		}
;1031:	}
LABELV $354
line 1033
;1032:
;1033:	if (precachedKyle && trap_G2_HaveWeGhoul2Models(precachedKyle))
ADDRLP4 156
ADDRGP4 precachedKyle
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $350
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $350
line 1034
;1034:	{
line 1035
;1035:		trap_G2API_DuplicateGhoul2Instance(precachedKyle, &client->ghoul2);
ADDRGP4 precachedKyle
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 1036
;1036:	}
line 1038
;1037:	else
;1038:	{
line 1039
;1039:		return;
LABELV $360
line 1044
;1040:	}
;1041:
;1042:	// The model is now loaded.
;1043:
;1044:	GLAName[0] = 0;
ADDRLP4 76
CNSTI1 0
ASGNI1
line 1046
;1045:
;1046:	if (!BGPAFtextLoaded)
ADDRGP4 BGPAFtextLoaded
INDIRI4
CNSTI4 0
NEI4 $361
line 1047
;1047:	{
line 1050
;1048:		//get the location of the animation.cfg
;1049:		//GLAName = trap_G2API_GetGLAName( client->ghoul2, 0);
;1050:		trap_G2API_GetGLAName( client->ghoul2, 0, GLAName);
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ARGP4
ADDRGP4 trap_G2API_GetGLAName
CALLV
pop
line 1052
;1051:
;1052:		if (!GLAName[0])
ADDRLP4 76
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $363
line 1053
;1053:		{
line 1054
;1054:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $367
ARGP4
ADDRLP4 164
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $350
line 1055
;1055:			{
line 1056
;1056:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $368
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1057
;1057:				return;
ADDRGP4 $350
JUMPV
line 1059
;1058:			}
;1059:			return;
LABELV $363
line 1061
;1060:		}
;1061:		Q_strncpyz( afilename, GLAName, sizeof( afilename ));
ADDRLP4 0
ARGP4
ADDRLP4 76
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1062
;1062:		slash = Q_strrchr( afilename, '/' );
ADDRLP4 0
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 164
INDIRP4
ASGNP4
line 1063
;1063:		if ( slash )
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $350
line 1064
;1064:		{
line 1065
;1065:			strcpy(slash, "/animation.cfg");
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 $371
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1066
;1066:		}	// Now afilename holds just the path to the animation.cfg
line 1068
;1067:		else 
;1068:		{	// Didn't find any slashes, this is a raw filename right in base (whish isn't a good thing)
line 1069
;1069:			return;
LABELV $370
line 1073
;1070:		}
;1071:
;1072:		// Try to load the animation.cfg for this model then.
;1073:		if ( !BG_ParseAnimationFile( afilename ) )
ADDRLP4 0
ARGP4
ADDRLP4 168
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $372
line 1074
;1074:		{	// The GLA's animations failed
line 1075
;1075:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $367
ARGP4
ADDRLP4 172
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
NEI4 $374
line 1076
;1076:			{
line 1077
;1077:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $368
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1078
;1078:				return;
ADDRGP4 $350
JUMPV
LABELV $374
line 1080
;1079:			}
;1080:		}
LABELV $372
line 1081
;1081:	}
LABELV $361
line 1083
;1082:
;1083:	trap_G2API_AddBolt(client->ghoul2, 0, "*r_hand");
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $376
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 1084
;1084:	trap_G2API_AddBolt(client->ghoul2, 0, "*l_hand");
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $377
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 1087
;1085:
;1086:	// NOTE - ensure this sequence of bolt and bone accessing are always the same because the client expects them in a certain order
;1087:	trap_G2API_SetBoneAnim(client->ghoul2, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, level.time, -1, -1);
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 164
CNSTI4 0
ASGNI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 $378
ARGP4
ADDRLP4 164
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1088
;1088:	trap_G2API_SetBoneAngles(client->ghoul2, 0, "upper_lumbar", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time);
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRI4
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 168
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1089
;1089:	trap_G2API_SetBoneAngles(client->ghoul2, 0, "cranium", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, level.time);
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRGP4 $382
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 176
CNSTI4 2
ASGNI4
ADDRLP4 176
INDIRI4
ARGI4
ADDRLP4 176
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 172
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1091
;1090:
;1091:	if (!g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $384
line 1092
;1092:	{
line 1093
;1093:		trap_G2API_InitGhoul2Model(&g2SaberInstance, "models/weapons2/saber/saber_w.glm", 0, 0, -20, 0, 0);
ADDRGP4 g2SaberInstance
ARGP4
ADDRGP4 $108
ARGP4
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 1095
;1094:
;1095:		if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $386
line 1096
;1096:		{
line 1098
;1097:			// indicate we will be bolted to model 0 (ie the player) on bolt 0 (always the right hand) when we get copied
;1098:			trap_G2API_SetBoltInfo(g2SaberInstance, 0, 0);
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRLP4 184
INDIRI4
ARGI4
ADDRLP4 184
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoltInfo
CALLV
pop
line 1100
;1099:			// now set up the gun bolt on it
;1100:			trap_G2API_AddBolt(g2SaberInstance, 0, "*flash");
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $388
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 1101
;1101:		}
LABELV $386
line 1102
;1102:	}
LABELV $384
line 1104
;1103:
;1104:	if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $389
line 1105
;1105:	{
line 1106
;1106:		trap_G2API_CopySpecificGhoul2Model(g2SaberInstance, 0, client->ghoul2, 1); 
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
CALLV
pop
line 1107
;1107:	}
LABELV $389
line 1108
;1108:}
LABELV $350
endproc SetupGameGhoul2Model 188 44
export ClientUserinfoChanged
proc ClientUserinfoChanged 6372 52
line 1124
;1109:
;1110:
;1111:
;1112:
;1113:/*
;1114:===========
;1115:ClientUserInfoChanged
;1116:
;1117:Called from ClientConnect when the player first connects and
;1118:directly by the server system when the player updates a userinfo variable.
;1119:
;1120:The game can override any of the settings and call trap_SetUserinfo
;1121:if desired.
;1122:============
;1123:*/
;1124:void ClientUserinfoChanged( int clientNum ) {
line 1139
;1125:	gentity_t *ent;
;1126:	int		teamTask, teamLeader, team, health;
;1127:	char	*s;
;1128:	char	model[MAX_QPATH];
;1129:	//char	headModel[MAX_QPATH];
;1130:	char	forcePowers[MAX_QPATH];
;1131:	char	oldname[MAX_STRING_CHARS];
;1132:	gclient_t	*client;
;1133:	char	c1[MAX_INFO_STRING];
;1134:	char	c2[MAX_INFO_STRING];
;1135:	char	redTeam[MAX_INFO_STRING];
;1136:	char	blueTeam[MAX_INFO_STRING];
;1137:	char	userinfo[MAX_INFO_STRING];
;1138:
;1139:	ent = g_entities + clientNum;
ADDRLP4 1032
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1140
;1140:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1142
;1141:
;1142:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1145
;1143:
;1144:	// check for malformed or illegal info strings
;1145:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 4
ARGP4
ADDRLP4 6300
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 6300
INDIRI4
CNSTI4 0
NEI4 $392
line 1146
;1146:		strcpy (userinfo, "\\name\\badinfo");
ADDRLP4 4
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1147
;1147:	}
LABELV $392
line 1150
;1148:
;1149:	// check for local client
;1150:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 4
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 6304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6304
INDIRP4
ASGNP4
line 1151
;1151:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $398
ARGP4
ADDRLP4 6308
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6308
INDIRI4
CNSTI4 0
NEI4 $396
line 1152
;1152:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1412
ADDP4
CNSTI4 1
ASGNI4
line 1153
;1153:	}
LABELV $396
line 1156
;1154:
;1155:	// check the item prediction
;1156:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 4
ARGP4
ADDRGP4 $399
ARGP4
ADDRLP4 6312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6312
INDIRP4
ASGNP4
line 1157
;1157:	if ( !atoi( s ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6316
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6316
INDIRI4
CNSTI4 0
NEI4 $400
line 1158
;1158:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1420
ADDP4
CNSTI4 0
ASGNI4
line 1159
;1159:	} else {
ADDRGP4 $401
JUMPV
LABELV $400
line 1160
;1160:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1420
ADDP4
CNSTI4 1
ASGNI4
line 1161
;1161:	}
LABELV $401
line 1164
;1162:
;1163:	// set name
;1164:	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1165
;1165:	s = Info_ValueForKey (userinfo, "name");
ADDRLP4 4
ARGP4
ADDRGP4 $402
ARGP4
ADDRLP4 6320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6320
INDIRP4
ASGNP4
line 1166
;1166:	ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname) );
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 1168
;1167:
;1168:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $403
line 1169
;1169:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 3
NEI4 $405
line 1170
;1170:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 $407
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1171
;1171:		}
LABELV $405
line 1172
;1172:	}
LABELV $403
line 1174
;1173:
;1174:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $408
line 1175
;1175:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6324
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6324
INDIRI4
CNSTI4 0
EQI4 $410
line 1176
;1176:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s %s\n\"", oldname, G_GetStripEdString("SVINGAME", "PLRENAME"),
ADDRGP4 $148
ARGP4
ADDRGP4 $413
ARGP4
ADDRLP4 6328
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $412
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 6328
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6332
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 6332
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1178
;1177:				client->pers.netname) );
;1178:		}
LABELV $410
line 1179
;1179:	}
LABELV $408
line 1182
;1180:
;1181:	// set max health
;1182:	health = 100; //atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 2132
CNSTI4 100
ASGNI4
line 1183
;1183:	client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
ADDRLP4 2132
INDIRI4
ASGNI4
line 1184
;1184:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 6324
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6324
INDIRI4
CNSTI4 1
LTI4 $416
ADDRLP4 6324
INDIRI4
CNSTI4 100
LEI4 $414
LABELV $416
line 1185
;1185:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 100
ASGNI4
line 1186
;1186:	}
LABELV $414
line 1187
;1187:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
line 1190
;1188:
;1189:	// set model
;1190:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $417
line 1191
;1191:		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
ADDRLP4 4
ARGP4
ADDRGP4 $420
ARGP4
ADDRLP4 6332
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 6332
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1193
;1192:		//Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
;1193:	} else {
ADDRGP4 $418
JUMPV
LABELV $417
line 1194
;1194:		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
ADDRLP4 4
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 6332
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 6332
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1196
;1195:		//Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
;1196:	}
LABELV $418
line 1198
;1197:
;1198:	Q_strncpyz( forcePowers, Info_ValueForKey (userinfo, "forcepowers"), sizeof( forcePowers ) );
ADDRLP4 4
ARGP4
ADDRGP4 $422
ARGP4
ADDRLP4 6332
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2136
ARGP4
ADDRLP4 6332
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1201
;1199:
;1200:	// bots set their team a few frames later
;1201:	if (g_gametype.integer >= GT_TEAM && g_entities[clientNum].r.svFlags & SVF_BOT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $423
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $423
line 1202
;1202:		s = Info_ValueForKey( userinfo, "team" );
ADDRLP4 4
ARGP4
ADDRGP4 $428
ARGP4
ADDRLP4 6336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6336
INDIRP4
ASGNP4
line 1203
;1203:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $431
ARGP4
ADDRLP4 6340
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6340
INDIRI4
CNSTI4 0
EQI4 $433
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 6344
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6344
INDIRI4
CNSTI4 0
NEI4 $429
LABELV $433
line 1204
;1204:			team = TEAM_RED;
ADDRLP4 4248
CNSTI4 1
ASGNI4
line 1205
;1205:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $424
JUMPV
LABELV $429
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 6348
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6348
INDIRI4
CNSTI4 0
EQI4 $438
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $437
ARGP4
ADDRLP4 6352
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6352
INDIRI4
CNSTI4 0
NEI4 $434
LABELV $438
line 1206
;1206:			team = TEAM_BLUE;
ADDRLP4 4248
CNSTI4 2
ASGNI4
line 1207
;1207:		} else {
ADDRGP4 $424
JUMPV
LABELV $434
line 1209
;1208:			// pick the team with the least number of players
;1209:			team = PickTeam( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 6356
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4248
ADDRLP4 6356
INDIRI4
ASGNI4
line 1210
;1210:		}
line 1211
;1211:	}
ADDRGP4 $424
JUMPV
LABELV $423
line 1212
;1212:	else {
line 1213
;1213:		team = client->sess.sessionTeam;
ADDRLP4 4248
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1214
;1214:	}
LABELV $424
line 1237
;1215:
;1216:/*	NOTE: all client side now
;1217:
;1218:	// team
;1219:	switch( team ) {
;1220:	case TEAM_RED:
;1221:		ForceClientSkin(client, model, "red");
;1222://		ForceClientSkin(client, headModel, "red");
;1223:		break;
;1224:	case TEAM_BLUE:
;1225:		ForceClientSkin(client, model, "blue");
;1226://		ForceClientSkin(client, headModel, "blue");
;1227:		break;
;1228:	}
;1229:	// don't ever use a default skin in teamplay, it would just waste memory
;1230:	// however bots will always join a team but they spawn in as spectator
;1231:	if ( g_gametype.integer >= GT_TEAM && team == TEAM_SPECTATOR) {
;1232:		ForceClientSkin(client, model, "red");
;1233://		ForceClientSkin(client, headModel, "red");
;1234:	}
;1235:*/
;1236:
;1237:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $439
line 1238
;1238:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 1
ASGNI4
line 1239
;1239:	} else {
ADDRGP4 $440
JUMPV
LABELV $439
line 1240
;1240:		s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 4
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 6336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6336
INDIRP4
ASGNP4
line 1241
;1241:		if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $445
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6344
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6344
INDIRI4
CNSTI4 0
EQI4 $443
LABELV $445
line 1242
;1242:			client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 1
ASGNI4
line 1243
;1243:		} else {
ADDRGP4 $444
JUMPV
LABELV $443
line 1244
;1244:			client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 0
ASGNI4
line 1245
;1245:		}
LABELV $444
line 1246
;1246:	}
LABELV $440
line 1258
;1247:	/*
;1248:	s = Info_ValueForKey( userinfo, "cg_pmove_fixed" );
;1249:	if ( !*s || atoi( s ) == 0 ) {
;1250:		client->pers.pmoveFixed = qfalse;
;1251:	}
;1252:	else {
;1253:		client->pers.pmoveFixed = qtrue;
;1254:	}
;1255:	*/
;1256:
;1257:	// team task (0 = none, 1 = offence, 2 = defence)
;1258:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 6336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6336
INDIRP4
ARGP4
ADDRLP4 6340
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2124
ADDRLP4 6340
INDIRI4
ASGNI4
line 1260
;1259:	// team Leader (1 = leader, 0 is normal player)
;1260:	teamLeader = client->sess.teamLeader;
ADDRLP4 2128
ADDRLP4 0
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
ASGNI4
line 1263
;1261:
;1262:	// colors
;1263:	strcpy(c1, Info_ValueForKey( userinfo, "color1" ));
ADDRLP4 4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 6344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2200
ARGP4
ADDRLP4 6344
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1264
;1264:	strcpy(c2, Info_ValueForKey( userinfo, "color2" ));
ADDRLP4 4
ARGP4
ADDRGP4 $448
ARGP4
ADDRLP4 6348
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3224
ARGP4
ADDRLP4 6348
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1266
;1265:
;1266:	strcpy(redTeam, Info_ValueForKey( userinfo, "g_redteam" ));
ADDRLP4 4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 6352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4252
ARGP4
ADDRLP4 6352
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1267
;1267:	strcpy(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ));
ADDRLP4 4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 6356
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 5276
ARGP4
ADDRLP4 6356
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1271
;1268:
;1269:	// send over a subset of the userinfo keys so other clients can
;1270:	// print scoreboards, display models, and play custom sounds
;1271:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $451
line 1272
;1272:		s = va("n\\%s\\t\\%i\\model\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 4
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 6360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $453
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4248
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 2200
ARGP4
ADDRLP4 3224
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 6360
INDIRP4
ARGP4
ADDRLP4 2124
INDIRI4
ARGI4
ADDRLP4 2128
INDIRI4
ARGI4
ADDRLP4 6368
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6368
INDIRP4
ASGNP4
line 1276
;1273:			client->pers.netname, team, model,  c1, c2, 
;1274:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;1275:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;1276:	} else {
ADDRGP4 $452
JUMPV
LABELV $451
line 1277
;1277:		s = va("n\\%s\\t\\%i\\model\\%s\\g_redteam\\%s\\g_blueteam\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $455
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 4252
ARGP4
ADDRLP4 5276
ARGP4
ADDRLP4 2200
ARGP4
ADDRLP4 3224
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 2124
INDIRI4
ARGI4
ADDRLP4 2128
INDIRI4
ARGI4
ADDRLP4 6364
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6364
INDIRP4
ASGNP4
line 1280
;1278:			client->pers.netname, client->sess.sessionTeam, model, redTeam, blueTeam, c1, c2, 
;1279:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
;1280:	}
LABELV $452
line 1282
;1281:
;1282:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1284
;1283:
;1284:	if (g_logClientInfo.integer)
ADDRGP4 g_logClientInfo+12
INDIRI4
CNSTI4 0
EQI4 $456
line 1285
;1285:	{
line 1286
;1286:		G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $459
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1287
;1287:	}
LABELV $456
line 1288
;1288:}
LABELV $391
endproc ClientUserinfoChanged 6372 52
bss
align 1
LABELV $474
skip 1024
export ClientConnect
code
proc ClientConnect 1068 12
line 1311
;1289:
;1290:
;1291:/*
;1292:===========
;1293:ClientConnect
;1294:
;1295:Called when a player begins connecting to the server.
;1296:Called again for every map change or tournement restart.
;1297:
;1298:The session information will be valid after exit.
;1299:
;1300:Return NULL if the client should be allowed, otherwise return
;1301:a string with the reason for denial.
;1302:
;1303:Otherwise, the client will be sent the current gamestate
;1304:and will eventually get to ClientBegin.
;1305:
;1306:firstTime will be qtrue the very first time a client connects
;1307:to the server machine, but qfalse on map changes and tournement
;1308:restarts.
;1309:============
;1310:*/
;1311:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 1319
;1312:	char		*value;
;1313://	char		*areabits;
;1314:	gclient_t	*client;
;1315:	char		userinfo[MAX_INFO_STRING];
;1316:	gentity_t	*ent;
;1317:	gentity_t	*te;
;1318:
;1319:	ent = &g_entities[ clientNum ];
ADDRLP4 4
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1321
;1320:
;1321:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1324
;1322:
;1323:	// check to see if they are on the banned IP list
;1324:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 8
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1040
INDIRP4
ASGNP4
line 1325
;1325:	if ( G_FilterPacket( value ) ) {
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $461
line 1326
;1326:		return "Banned.";
ADDRGP4 $463
RETP4
ADDRGP4 $460
JUMPV
LABELV $461
line 1329
;1327:	}
;1328:
;1329:	if ( !( ent->r.svFlags & SVF_BOT ) && !isBot && g_needpass.integer ) {
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1048
INDIRI4
NEI4 $464
ADDRFP4 8
INDIRI4
ADDRLP4 1048
INDIRI4
NEI4 $464
ADDRGP4 g_needpass+12
INDIRI4
ADDRLP4 1048
INDIRI4
EQI4 $464
line 1331
;1330:		// check for a password
;1331:		value = Info_ValueForKey (userinfo, "password");
ADDRLP4 8
ARGP4
ADDRGP4 $467
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1052
INDIRP4
ASGNP4
line 1332
;1332:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $468
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $472
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $468
ADDRGP4 g_password+16
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $468
line 1333
;1333:			strcmp( g_password.string, value) != 0) {
line 1335
;1334:			static char sTemp[1024];
;1335:			Q_strncpyz(sTemp, G_GetStripEdString("SVINGAME","INVALID_PASSWORD"), sizeof (sTemp) );
ADDRGP4 $148
ARGP4
ADDRGP4 $475
ARGP4
ADDRLP4 1064
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $474
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1336
;1336:			return sTemp;// return "Invalid password";
ADDRGP4 $474
RETP4
ADDRGP4 $460
JUMPV
LABELV $468
line 1338
;1337:		}
;1338:	}
LABELV $464
line 1341
;1339:
;1340:	// they can connect
;1341:	ent->client = level.clients + clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 1800
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1342
;1342:	client = ent->client;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1346
;1343:
;1344://	areabits = client->areabits;
;1345:
;1346:	memset( client, 0, sizeof(*client) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1800
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1348
;1347:
;1348:	client->pers.connected = CON_CONNECTING;
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 1
ASGNI4
line 1351
;1349:
;1350:	// read or initialize the session data
;1351:	if ( firstTime || level.newSession ) {
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1052
INDIRI4
NEI4 $479
ADDRGP4 level+64
INDIRI4
ADDRLP4 1052
INDIRI4
EQI4 $476
LABELV $479
line 1352
;1352:		G_InitSessionData( client, userinfo, isBot );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitSessionData
CALLV
pop
line 1353
;1353:	}
LABELV $476
line 1354
;1354:	G_ReadSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1356
;1355:
;1356:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $480
line 1357
;1357:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1056
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1358
;1358:		ent->inuse = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 1359
;1359:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $485
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $486
JUMPV
LABELV $485
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $486
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $482
line 1360
;1360:			return "BotConnectfailed";
ADDRGP4 $487
RETP4
ADDRGP4 $460
JUMPV
LABELV $482
line 1362
;1361:		}
;1362:	}
LABELV $480
line 1365
;1363:
;1364:	// get and distribute relevent paramters
;1365:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $488
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1366
;1366:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1369
;1367:
;1368:	// don't do the "xxx connected" messages if they were caried over from previous level
;1369:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $489
line 1370
;1370:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s\n\"", client->pers.netname, G_GetStripEdString("SVINGAME", "PLCONNECT")) );
ADDRGP4 $148
ARGP4
ADDRGP4 $492
ARGP4
ADDRLP4 1056
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $491
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1371
;1371:	}
LABELV $489
line 1373
;1372:
;1373:	if ( g_gametype.integer >= GT_TEAM &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $493
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $493
line 1374
;1374:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1375
;1375:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1376
;1376:	}
LABELV $493
line 1379
;1377:
;1378:	// count current clients and rank for scoreboard
;1379:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1381
;1380:
;1381:	te = G_TempEntity( vec3_origin, EV_CLIENTJOIN );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1056
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1036
ADDRLP4 1056
INDIRP4
ASGNP4
line 1382
;1382:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1060
ADDRLP4 1036
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1383
;1383:	te->s.eventParm = clientNum;
ADDRLP4 1036
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1390
;1384:
;1385:	// for statistics
;1386://	client->areabits = areabits;
;1387://	if ( !client->areabits )
;1388://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;1389:
;1390:	return NULL;
CNSTP4 0
RETP4
LABELV $460
endproc ClientConnect 1068 12
export ClientBegin
proc ClientBegin 1108 12
line 1404
;1391:}
;1392:
;1393:void G_WriteClientSessionData( gclient_t *client );
;1394:
;1395:/*
;1396:===========
;1397:ClientBegin
;1398:
;1399:called when a client has finished connecting, and is ready
;1400:to be placed into the level.  This will happen every level load,
;1401:and on transition between teams, but doesn't happen on respawns
;1402:============
;1403:*/
;1404:void ClientBegin( int clientNum, qboolean allowTeamReset ) {
line 1411
;1405:	gentity_t	*ent;
;1406:	gclient_t	*client;
;1407:	gentity_t	*tent;
;1408:	int			flags, i;
;1409:	char		userinfo[MAX_INFO_VALUE], *modelname;
;1410:
;1411:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1413
;1412:
;1413:	if ((ent->r.svFlags & SVF_BOT) && g_gametype.integer >= GT_TEAM)
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $497
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $497
line 1414
;1414:	{
line 1415
;1415:		if (allowTeamReset)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $500
line 1416
;1416:		{
line 1417
;1417:			const char *team = "Red";
ADDRLP4 1048
ADDRGP4 $502
ASGNP4
line 1421
;1418:			int preSess;
;1419:
;1420:			//SetTeam(ent, "");
;1421:			ent->client->sess.sessionTeam = PickTeam(-1);
CNSTI4 -1
ARGI4
ADDRLP4 1056
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 1422
;1422:			trap_GetUserinfo(clientNum, userinfo, MAX_INFO_STRING);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1424
;1423:
;1424:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $503
line 1425
;1425:			{
line 1426
;1426:				ent->client->sess.sessionTeam = TEAM_RED;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 1
ASGNI4
line 1427
;1427:			}
LABELV $503
line 1429
;1428:
;1429:			if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $505
line 1430
;1430:			{
line 1431
;1431:				team = "Red";
ADDRLP4 1048
ADDRGP4 $502
ASGNP4
line 1432
;1432:			}
ADDRGP4 $506
JUMPV
LABELV $505
line 1434
;1433:			else
;1434:			{
line 1435
;1435:				team = "Blue";
ADDRLP4 1048
ADDRGP4 $507
ASGNP4
line 1436
;1436:			}
LABELV $506
line 1438
;1437:
;1438:			Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 12
ARGP4
ADDRGP4 $428
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1440
;1439:
;1440:			trap_SetUserinfo( clientNum, userinfo );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 1442
;1441:
;1442:			ent->client->ps.persistant[ PERS_TEAM ] = ent->client->sess.sessionTeam;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 1060
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1444
;1443:
;1444:			preSess = ent->client->sess.sessionTeam;
ADDRLP4 1052
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1445
;1445:			G_ReadSessionData( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1446
;1446:			ent->client->sess.sessionTeam = preSess;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1447
;1447:			G_WriteClientSessionData(ent->client);
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 1448
;1448:			ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1449
;1449:			ClientBegin(clientNum, qfalse);
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1450
;1450:			return;
ADDRGP4 $496
JUMPV
LABELV $500
line 1452
;1451:		}
;1452:	}
LABELV $497
line 1454
;1453:
;1454:	client = level.clients + clientNum;
ADDRLP4 8
CNSTI4 1800
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1456
;1455:
;1456:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $508
line 1457
;1457:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1458
;1458:	}
LABELV $508
line 1459
;1459:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1460
;1460:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 1461
;1461:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 1462
;1462:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 1464
;1463:
;1464:	client->pers.connected = CON_CONNECTED;
ADDRLP4 8
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 2
ASGNI4
line 1465
;1465:	client->pers.enterTime = level.time;
ADDRLP4 8
INDIRP4
CNSTI4 1468
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1466
;1466:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 8
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 0
ASGNI4
line 1473
;1467:
;1468:	// save eflags around this, because changing teams will
;1469:	// cause this to happen with a valid entity, and we
;1470:	// want to make sure the teleport bit is set right
;1471:	// so the viewpoint doesn't interpolate through the
;1472:	// world to the new position
;1473:	flags = client->ps.eFlags;
ADDRLP4 1036
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1475
;1474:
;1475:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $512
JUMPV
LABELV $511
line 1478
;1476:
;1477:	while (i < NUM_FORCE_POWERS)
;1478:	{
line 1479
;1479:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $514
line 1480
;1480:		{
line 1481
;1481:			WP_ForcePowerStop(ent, i);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1482
;1482:		}
LABELV $514
line 1483
;1483:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1484
;1484:	}
LABELV $512
line 1477
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $511
line 1486
;1485:
;1486:	i = TRACK_CHANNEL_1;
ADDRLP4 0
CNSTI4 51
ASGNI4
ADDRGP4 $517
JUMPV
LABELV $516
line 1489
;1487:
;1488:	while (i < NUM_TRACK_CHANNELS)
;1489:	{
line 1490
;1490:		if (ent->client->ps.fd.killSoundEntIndex[i-50] && ent->client->ps.fd.killSoundEntIndex[i-50] < MAX_GENTITIES && ent->client->ps.fd.killSoundEntIndex[i-50] > 0)
ADDRLP4 1048
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1048
INDIRI4
ADDRLP4 1052
INDIRI4
EQI4 $519
ADDRLP4 1048
INDIRI4
CNSTI4 1024
GEI4 $519
ADDRLP4 1048
INDIRI4
ADDRLP4 1052
INDIRI4
LEI4 $519
line 1491
;1491:		{
line 1492
;1492:			G_MuteSound(ent->client->ps.fd.killSoundEntIndex[i-50], CHAN_VOICE);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 1493
;1493:		}
LABELV $519
line 1494
;1494:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1495
;1495:	}
LABELV $517
line 1488
ADDRLP4 0
INDIRI4
CNSTI4 56
LTI4 $516
line 1496
;1496:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1498
;1497:
;1498:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1380
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1499
;1499:	client->ps.eFlags = flags;
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 1501
;1500:
;1501:	client->ps.hasDetPackPlanted = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 1504
;1502:
;1503:	//first-time force power initialization
;1504:	WP_InitForcePowers( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 1507
;1505:
;1506:	//init saber ent
;1507:	WP_SaberInitBladeData( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 WP_SaberInitBladeData
CALLV
pop
line 1510
;1508:
;1509:	// First time model setup for that player.
;1510:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1511
;1511:	modelname = Info_ValueForKey (userinfo, "model");
ADDRLP4 12
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1048
INDIRP4
ASGNP4
line 1512
;1512:	SetupGameGhoul2Model(client, modelname);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 SetupGameGhoul2Model
CALLV
pop
line 1514
;1513:
;1514:	if (ent->client->ghoul2)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $521
line 1515
;1515:	{
line 1516
;1516:		ent->bolt_Head = trap_G2API_AddBolt(ent->client->ghoul2, 0, "cranium");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $382
ARGP4
ADDRLP4 1056
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 1517
;1517:		ent->bolt_Waist = trap_G2API_AddBolt(ent->client->ghoul2, 0, "thoracic");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $523
ARGP4
ADDRLP4 1064
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 1064
INDIRI4
ASGNI4
line 1518
;1518:		ent->bolt_LArm = trap_G2API_AddBolt(ent->client->ghoul2, 0, "lradius");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $524
ARGP4
ADDRLP4 1072
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 1072
INDIRI4
ASGNI4
line 1519
;1519:		ent->bolt_RArm = trap_G2API_AddBolt(ent->client->ghoul2, 0, "rradius");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $525
ARGP4
ADDRLP4 1080
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 1080
INDIRI4
ASGNI4
line 1520
;1520:		ent->bolt_LLeg = trap_G2API_AddBolt(ent->client->ghoul2, 0, "ltibia");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $526
ARGP4
ADDRLP4 1088
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
ADDRLP4 1088
INDIRI4
ASGNI4
line 1521
;1521:		ent->bolt_RLeg = trap_G2API_AddBolt(ent->client->ghoul2, 0, "rtibia");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $527
ARGP4
ADDRLP4 1096
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 1096
INDIRI4
ASGNI4
line 1522
;1522:		ent->bolt_Motion = trap_G2API_AddBolt(ent->client->ghoul2, 0, "Motion");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $528
ARGP4
ADDRLP4 1104
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 1104
INDIRI4
ASGNI4
line 1523
;1523:	}
LABELV $521
line 1526
;1524:
;1525:	// locate ent at a spawn point
;1526:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1528
;1527:
;1528:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $529
line 1530
;1529:		// send event
;1530:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1052
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1052
INDIRP4
ASGNP4
line 1531
;1531:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 1056
CNSTI4 220
ASGNI4
ADDRLP4 1044
INDIRP4
ADDRLP4 1056
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 1056
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1533
;1532:
;1533:		if ( g_gametype.integer != GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $531
line 1534
;1534:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s\n\"", client->pers.netname, G_GetStripEdString("SVINGAME", "PLENTER")) );
ADDRGP4 $148
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 1060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $491
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1535
;1535:		}
LABELV $531
line 1536
;1536:	}
LABELV $529
line 1537
;1537:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $535
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1540
;1538:
;1539:	// count current clients and rank for scoreboard
;1540:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1542
;1541:
;1542:	G_ClearClientLog(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_ClearClientLog
CALLV
pop
line 1543
;1543:}
LABELV $496
endproc ClientBegin 1108 12
proc AllForceDisabled 4 0
line 1546
;1544:
;1545:static qboolean AllForceDisabled(int force)
;1546:{
line 1549
;1547:	int i;
;1548:
;1549:	if (force)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $537
line 1550
;1550:	{
line 1551
;1551:		for (i=0;i<NUM_FORCE_POWERS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $539
line 1552
;1552:		{
line 1553
;1553:			if (!(force & (1<<i)))
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $543
line 1554
;1554:			{
line 1555
;1555:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $536
JUMPV
LABELV $543
line 1557
;1556:			}
;1557:		}
LABELV $540
line 1551
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $539
line 1559
;1558:
;1559:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $536
JUMPV
LABELV $537
line 1562
;1560:	}
;1561:
;1562:	return qfalse;
CNSTI4 0
RETI4
LABELV $536
endproc AllForceDisabled 4 0
export ClientSpawn
proc ClientSpawn 872 16
line 1575
;1563:}
;1564:
;1565:/*
;1566:===========
;1567:ClientSpawn
;1568:
;1569:Called every time a client is placed fresh in the world:
;1570:after the first ClientBegin, and after each respawn
;1571:Initializes all non-persistant parts of playerState
;1572:============
;1573:*/
;1574:extern qboolean WP_HasForcePowers( const playerState_t *ps );
;1575:void ClientSpawn(gentity_t *ent) {
line 1592
;1576:	int		index;
;1577:	vec3_t	spawn_origin, spawn_angles;
;1578:	gclient_t	*client;
;1579:	int		i;
;1580:	clientPersistant_t	saved;
;1581:	clientSession_t		savedSess;
;1582:	int		persistant[MAX_PERSISTANT];
;1583:	gentity_t	*spawnPoint;
;1584:	int		flags;
;1585:	int		savedPing;
;1586://	char	*savedAreaBits;
;1587:	int		accuracy_hits, accuracy_shots;
;1588:	int		eventSequence;
;1589://	char	userinfo[MAX_INFO_STRING];
;1590:	forcedata_t			savedForce;
;1591:	void		*ghoul2save;
;1592:	int		saveSaberNum = ENTITYNUM_NONE;
ADDRLP4 112
CNSTI4 1023
ASGNI4
line 1593
;1593:	int		wDisable = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 1595
;1594:
;1595:	index = ent - g_entities;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ASGNI4
line 1596
;1596:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1598
;1597:
;1598:	if (client->ps.fd.forceDoInit)
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
INDIRI4
CNSTI4 0
EQI4 $546
line 1599
;1599:	{ //force a reread of force powers
line 1600
;1600:		WP_InitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 1601
;1601:		client->ps.fd.forceDoInit = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 1602
;1602:	}
LABELV $546
line 1606
;1603:	// find a spawn point
;1604:	// do it before setting health back up, so farthest
;1605:	// ranging doesn't count this client
;1606:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $548
line 1607
;1607:		spawnPoint = SelectSpectatorSpawnPoint ( 
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 804
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 804
INDIRP4
ASGNP4
line 1609
;1608:						spawn_origin, spawn_angles);
;1609:	} else if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
ADDRGP4 $549
JUMPV
LABELV $548
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $554
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $550
LABELV $554
line 1611
;1610:		// all base oriented team games use the CTF spawn points
;1611:		spawnPoint = SelectCTFSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 808
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 808
INDIRP4
ASGNP4
line 1615
;1612:						client->sess.sessionTeam, 
;1613:						client->pers.teamState.state, 
;1614:						spawn_origin, spawn_angles);
;1615:	}
ADDRGP4 $551
JUMPV
LABELV $550
line 1616
;1616:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $555
line 1617
;1617:	{
line 1618
;1618:		spawnPoint = SelectSagaSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 808
ADDRGP4 SelectSagaSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 808
INDIRP4
ASGNP4
line 1622
;1619:						client->sess.sessionTeam, 
;1620:						client->pers.teamState.state, 
;1621:						spawn_origin, spawn_angles);
;1622:	}
ADDRGP4 $556
JUMPV
LABELV $555
line 1623
;1623:	else {
LABELV $558
line 1624
;1624:		do {
line 1626
;1625:			// the first spawn should be at a good looking spot
;1626:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 808
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1416
ADDP4
INDIRI4
ADDRLP4 808
INDIRI4
NEI4 $561
ADDRLP4 0
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
ADDRLP4 808
INDIRI4
EQI4 $561
line 1627
;1627:				client->pers.initialSpawn = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1416
ADDP4
CNSTI4 1
ASGNI4
line 1628
;1628:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 812
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 812
INDIRP4
ASGNP4
line 1629
;1629:			} else {
ADDRGP4 $562
JUMPV
LABELV $561
line 1631
;1630:				// don't spawn near existing origin if possible
;1631:				spawnPoint = SelectSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 812
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 812
INDIRP4
ASGNP4
line 1634
;1632:					client->ps.origin, 
;1633:					spawn_origin, spawn_angles);
;1634:			}
LABELV $562
line 1638
;1635:
;1636:			// Tim needs to prevent bots from spawning at the initial point
;1637:			// on q3dm0...
;1638:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 812
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 812
INDIRI4
EQI4 $563
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 812
INDIRI4
EQI4 $563
line 1639
;1639:				continue;	// try again
ADDRGP4 $559
JUMPV
LABELV $563
line 1642
;1640:			}
;1641:			// just to be symetric, we have a nohumans option...
;1642:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 816
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 816
INDIRI4
EQI4 $560
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 816
INDIRI4
NEI4 $560
line 1643
;1643:				continue;	// try again
line 1646
;1644:			}
;1645:
;1646:			break;
LABELV $559
line 1648
;1647:
;1648:		} while ( 1 );
ADDRGP4 $558
JUMPV
LABELV $560
line 1649
;1649:	}
LABELV $556
LABELV $551
LABELV $549
line 1650
;1650:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 1
ASGNI4
line 1654
;1651:
;1652:	// toggle the teleport bit so the client knows to not lerp
;1653:	// and never clear the voted flag
;1654:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1655
;1655:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1659
;1656:
;1657:	// clear everything but the persistant data
;1658:
;1659:	saved = client->pers;
ADDRLP4 116
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRB
ASGNB 152
line 1660
;1660:	savedSess = client->sess;
ADDRLP4 268
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRB
ASGNB 44
line 1661
;1661:	savedPing = client->ps.ping;
ADDRLP4 312
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
line 1663
;1662://	savedAreaBits = client->areabits;
;1663:	accuracy_hits = client->accuracy_hits;
ADDRLP4 316
ADDRLP4 0
INDIRP4
CNSTI4 1668
ADDP4
INDIRI4
ASGNI4
line 1664
;1664:	accuracy_shots = client->accuracy_shots;
ADDRLP4 320
ADDRLP4 0
INDIRP4
CNSTI4 1664
ADDP4
INDIRI4
ASGNI4
line 1665
;1665:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $567
line 1666
;1666:		persistant[i] = client->ps.persistant[i];
ADDRLP4 804
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 804
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 804
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1667
;1667:	}
LABELV $568
line 1665
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $567
line 1668
;1668:	eventSequence = client->ps.eventSequence;
ADDRLP4 324
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 1670
;1669:
;1670:	savedForce = client->ps.fd;
ADDRLP4 328
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRB
ASGNB 472
line 1672
;1671:
;1672:	ghoul2save = client->ghoul2;
ADDRLP4 800
ADDRLP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ASGNP4
line 1674
;1673:
;1674:	saveSaberNum = client->ps.saberEntityNum;
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 1676
;1675:
;1676:	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1800
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1679
;1677:
;1678:	//rww - Don't wipe the ghoul2 instance or the animation data
;1679:	client->ghoul2 = ghoul2save;
ADDRLP4 0
INDIRP4
CNSTI4 1728
ADDP4
ADDRLP4 800
INDIRP4
ASGNP4
line 1682
;1680:
;1681:	//or the saber ent num
;1682:	client->ps.saberEntityNum = saveSaberNum;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 112
INDIRI4
ASGNI4
line 1684
;1683:
;1684:	client->ps.fd = savedForce;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 328
INDIRB
ASGNB 472
line 1686
;1685:
;1686:	client->ps.duelIndex = ENTITYNUM_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 1296
ADDP4
CNSTI4 1023
ASGNI4
line 1688
;1687:
;1688:	client->pers = saved;
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
ADDRLP4 116
INDIRB
ASGNB 152
line 1689
;1689:	client->sess = savedSess;
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 268
INDIRB
ASGNB 44
line 1690
;1690:	client->ps.ping = savedPing;
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 312
INDIRI4
ASGNI4
line 1692
;1691://	client->areabits = savedAreaBits;
;1692:	client->accuracy_hits = accuracy_hits;
ADDRLP4 0
INDIRP4
CNSTI4 1668
ADDP4
ADDRLP4 316
INDIRI4
ASGNI4
line 1693
;1693:	client->accuracy_shots = accuracy_shots;
ADDRLP4 0
INDIRP4
CNSTI4 1664
ADDP4
ADDRLP4 320
INDIRI4
ASGNI4
line 1694
;1694:	client->lastkilled_client = -1;
ADDRLP4 0
INDIRP4
CNSTI4 1672
ADDP4
CNSTI4 -1
ASGNI4
line 1696
;1695:
;1696:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $571
line 1697
;1697:		client->ps.persistant[i] = persistant[i];
ADDRLP4 804
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 804
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDP4
ADDRLP4 804
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1698
;1698:	}
LABELV $572
line 1696
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $571
line 1699
;1699:	client->ps.eventSequence = eventSequence;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 324
INDIRI4
ASGNI4
line 1701
;1700:	// increment the spawncount so the client will detect the respawn
;1701:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 804
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 804
INDIRP4
ADDRLP4 804
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1702
;1702:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1704
;1703:
;1704:	client->airOutTime = level.time + 12000;
ADDRLP4 0
INDIRP4
CNSTI4 1700
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1708
;1705:
;1706://	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
;1707:	// set max health
;1708:	client->pers.maxHealth = 100;//atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 100
ASGNI4
line 1709
;1709:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 812
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
ADDRLP4 812
INDIRI4
CNSTI4 1
LTI4 $578
ADDRLP4 812
INDIRI4
CNSTI4 100
LEI4 $576
LABELV $578
line 1710
;1710:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 100
ASGNI4
line 1711
;1711:	}
LABELV $576
line 1713
;1712:	// clear entity values
;1713:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
line 1714
;1714:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
line 1716
;1715:
;1716:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1023
ASGNI4
line 1717
;1717:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 1800
ADDRLP4 104
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1718
;1718:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 1719
;1719:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 1720
;1720:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $579
ASGNP4
line 1721
;1721:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 256
ASGNI4
line 1722
;1722:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 273
ASGNI4
line 1723
;1723:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 player_die
ASGNP4
line 1724
;1724:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 1725
;1725:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 0
ASGNI4
line 1726
;1726:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 0
ASGNI4
line 1728
;1727:	
;1728:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1729
;1729:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1731
;1730:
;1731:	client->ps.clientNum = index;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1733
;1732:	//give default weapons
;1733:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_NONE );
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 1
ASGNI4
line 1735
;1734:
;1735:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $580
line 1736
;1736:	{
line 1737
;1737:		wDisable = g_duelWeaponDisable.integer;
ADDRLP4 76
ADDRGP4 g_duelWeaponDisable+12
INDIRI4
ASGNI4
line 1738
;1738:	}
ADDRGP4 $581
JUMPV
LABELV $580
line 1740
;1739:	else
;1740:	{
line 1741
;1741:		wDisable = g_weaponDisable.integer;
ADDRLP4 76
ADDRGP4 g_weaponDisable+12
INDIRI4
ASGNI4
line 1742
;1742:	}
LABELV $581
line 1746
;1743:
;1744:
;1745:
;1746:	if ( g_gametype.integer != GT_HOLOCRON 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $585
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $585
ADDRLP4 820
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 820
INDIRI4
CNSTI4 0
NEI4 $585
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 824
ADDRGP4 AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 828
CNSTI4 0
ASGNI4
ADDRLP4 824
INDIRI4
ADDRLP4 828
INDIRI4
NEI4 $585
ADDRGP4 g_trueJedi+12
INDIRI4
ADDRLP4 828
INDIRI4
EQI4 $585
line 1751
;1747:		&& g_gametype.integer != GT_JEDIMASTER 
;1748:		&& !HasSetSaberOnly()
;1749:		&& !AllForceDisabled( g_forcePowerDisable.integer )
;1750:		&& g_trueJedi.integer )
;1751:	{
line 1752
;1752:		if ( g_gametype.integer >= GT_TEAM && (client->sess.sessionTeam == TEAM_BLUE || client->sess.sessionTeam == TEAM_RED) )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $591
ADDRLP4 832
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 832
INDIRI4
CNSTI4 2
EQI4 $594
ADDRLP4 832
INDIRI4
CNSTI4 1
NEI4 $591
LABELV $594
line 1753
;1753:		{//In Team games, force one side to be merc and other to be jedi
line 1754
;1754:			if ( level.numPlayingClients > 0 )
ADDRGP4 level+80
INDIRI4
CNSTI4 0
LEI4 $595
line 1755
;1755:			{//already someone in the game
line 1756
;1756:				int		i, forceTeam = TEAM_SPECTATOR;
ADDRLP4 840
CNSTI4 3
ASGNI4
line 1757
;1757:				for ( i = 0 ; i < level.maxclients ; i++ ) 
ADDRLP4 836
CNSTI4 0
ASGNI4
ADDRGP4 $601
JUMPV
LABELV $598
line 1758
;1758:				{
line 1759
;1759:					if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $603
line 1760
;1760:						continue;
ADDRGP4 $599
JUMPV
LABELV $603
line 1762
;1761:					}
;1762:					if ( level.clients[i].sess.sessionTeam == TEAM_BLUE || level.clients[i].sess.sessionTeam == TEAM_RED ) 
ADDRLP4 844
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 844
INDIRI4
CNSTI4 2
EQI4 $607
ADDRLP4 844
INDIRI4
CNSTI4 1
NEI4 $605
LABELV $607
line 1763
;1763:					{//in-game
line 1764
;1764:						if ( WP_HasForcePowers( &level.clients[i].ps ) )
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRLP4 848
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 848
INDIRI4
CNSTI4 0
EQI4 $608
line 1765
;1765:						{//this side is using force
line 1766
;1766:							forceTeam = level.clients[i].sess.sessionTeam;
ADDRLP4 840
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1767
;1767:						}
ADDRGP4 $600
JUMPV
LABELV $608
line 1769
;1768:						else
;1769:						{//other team is using force
line 1770
;1770:							if ( level.clients[i].sess.sessionTeam == TEAM_BLUE )
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 2
NEI4 $610
line 1771
;1771:							{
line 1772
;1772:								forceTeam = TEAM_RED;
ADDRLP4 840
CNSTI4 1
ASGNI4
line 1773
;1773:							}
ADDRGP4 $600
JUMPV
LABELV $610
line 1775
;1774:							else
;1775:							{
line 1776
;1776:								forceTeam = TEAM_BLUE;
ADDRLP4 840
CNSTI4 2
ASGNI4
line 1777
;1777:							}
line 1778
;1778:						}
line 1779
;1779:						break;
ADDRGP4 $600
JUMPV
LABELV $605
line 1781
;1780:					}
;1781:				}
LABELV $599
line 1757
ADDRLP4 836
ADDRLP4 836
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $601
ADDRLP4 836
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $598
LABELV $600
line 1782
;1782:				if ( WP_HasForcePowers( &client->ps ) && client->sess.sessionTeam != forceTeam )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 844
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 844
INDIRI4
CNSTI4 0
EQI4 $612
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRLP4 840
INDIRI4
EQI4 $612
line 1783
;1783:				{//using force but not on right team, switch him over
line 1784
;1784:					const char *teamName = TeamName( forceTeam );
ADDRLP4 840
INDIRI4
ARGI4
ADDRLP4 852
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRLP4 848
ADDRLP4 852
INDIRP4
ASGNP4
line 1786
;1785:					//client->sess.sessionTeam = forceTeam;
;1786:					SetTeam( ent, (char *)teamName );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 848
INDIRP4
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1787
;1787:					return;
ADDRGP4 $545
JUMPV
LABELV $612
line 1789
;1788:				}
;1789:			}
LABELV $595
line 1790
;1790:		}
LABELV $591
line 1792
;1791:
;1792:		if ( WP_HasForcePowers( &client->ps ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 836
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $614
line 1793
;1793:		{
line 1794
;1794:			client->ps.trueNonJedi = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1795
;1795:			client->ps.trueJedi = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1797
;1796:			//make sure they only use the saber
;1797:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1798
;1798:			client->ps.stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 1799
;1799:		}
ADDRGP4 $586
JUMPV
LABELV $614
line 1801
;1800:		else
;1801:		{//no force powers set
line 1802
;1802:			client->ps.trueNonJedi = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 1
ASGNI4
line 1803
;1803:			client->ps.trueJedi = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1804
;1804:			if (!wDisable || !(wDisable & (1 << WP_BRYAR_PISTOL)))
ADDRLP4 844
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 844
INDIRI4
EQI4 $618
ADDRLP4 76
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 844
INDIRI4
NEI4 $616
LABELV $618
line 1805
;1805:			{
line 1806
;1806:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 848
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 848
INDIRP4
ADDRLP4 848
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1807
;1807:			}
LABELV $616
line 1808
;1808:			if (!wDisable || !(wDisable & (1 << WP_BLASTER)))
ADDRLP4 852
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 852
INDIRI4
EQI4 $621
ADDRLP4 76
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 852
INDIRI4
NEI4 $619
LABELV $621
line 1809
;1809:			{
line 1810
;1810:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BLASTER );
ADDRLP4 856
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 856
INDIRP4
ADDRLP4 856
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1811
;1811:			}
LABELV $619
line 1812
;1812:			if (!wDisable || !(wDisable & (1 << WP_BOWCASTER)))
ADDRLP4 860
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 860
INDIRI4
EQI4 $624
ADDRLP4 76
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 860
INDIRI4
NEI4 $622
LABELV $624
line 1813
;1813:			{
line 1814
;1814:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BOWCASTER );
ADDRLP4 864
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 864
INDIRP4
ADDRLP4 864
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1815
;1815:			}
LABELV $622
line 1816
;1816:			client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
ADDRLP4 864
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 864
INDIRP4
ADDRLP4 864
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1817
;1817:			client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 868
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 868
INDIRP4
ADDRLP4 868
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1818
;1818:			client->ps.ammo[AMMO_POWERCELL] = ammoData[AMMO_POWERCELL].max;
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRGP4 ammoData+12
INDIRI4
ASGNI4
line 1819
;1819:			client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1820
;1820:		}
line 1821
;1821:	}
ADDRGP4 $586
JUMPV
LABELV $585
line 1823
;1822:	else
;1823:	{//jediVmerc is incompatible with this gametype, turn it off!
line 1824
;1824:		trap_Cvar_Set( "g_jediVmerc", "0" );
ADDRGP4 $626
ARGP4
ADDRGP4 $80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1825
;1825:		if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $627
line 1826
;1826:		{
line 1828
;1827:			//always get free saber level 1 in holocron
;1828:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 832
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 832
INDIRP4
ADDRLP4 832
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1829
;1829:		}
ADDRGP4 $628
JUMPV
LABELV $627
line 1831
;1830:		else
;1831:		{
line 1832
;1832:			if (client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 0
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 0
EQI4 $630
line 1833
;1833:			{
line 1834
;1834:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 832
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 832
INDIRP4
ADDRLP4 832
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1835
;1835:			}
ADDRGP4 $631
JUMPV
LABELV $630
line 1837
;1836:			else
;1837:			{ //if you don't have saber attack rank then you don't get a saber
line 1838
;1838:				client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 832
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 832
INDIRP4
ADDRLP4 832
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1839
;1839:			}
LABELV $631
line 1840
;1840:		}
LABELV $628
line 1842
;1841:
;1842:		if (!wDisable || !(wDisable & (1 << WP_BRYAR_PISTOL)))
ADDRLP4 836
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 836
INDIRI4
EQI4 $634
ADDRLP4 76
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 836
INDIRI4
NEI4 $632
LABELV $634
line 1843
;1843:		{
line 1844
;1844:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 840
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 840
INDIRP4
ADDRLP4 840
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1845
;1845:		}
ADDRGP4 $633
JUMPV
LABELV $632
line 1846
;1846:		else if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $635
line 1847
;1847:		{
line 1848
;1848:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 840
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 840
INDIRP4
ADDRLP4 840
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1849
;1849:		}
LABELV $635
LABELV $633
line 1851
;1850:
;1851:		if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $638
line 1852
;1852:		{
line 1853
;1853:			client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
ADDRLP4 840
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 840
INDIRP4
ADDRLP4 840
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1854
;1854:			client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 844
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 844
INDIRP4
ADDRLP4 844
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1855
;1855:		}
LABELV $638
line 1857
;1856:
;1857:		if (client->ps.stats[STAT_WEAPONS] & (1 << WP_BRYAR_PISTOL))
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $641
line 1858
;1858:		{
line 1859
;1859:			client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1860
;1860:		}
ADDRGP4 $642
JUMPV
LABELV $641
line 1861
;1861:		else if (client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $643
line 1862
;1862:		{
line 1863
;1863:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1864
;1864:		}
ADDRGP4 $644
JUMPV
LABELV $643
line 1866
;1865:		else
;1866:		{
line 1867
;1867:			client->ps.weapon = WP_STUN_BATON;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1868
;1868:		}
LABELV $644
LABELV $642
line 1869
;1869:	}
LABELV $586
line 1876
;1870:
;1871:	/*
;1872:	client->ps.stats[STAT_HOLDABLE_ITEMS] |= ( 1 << HI_BINOCULARS );
;1873:	client->ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_BINOCULARS, IT_HOLDABLE);
;1874:	*/
;1875:
;1876:	client->ps.stats[STAT_HOLDABLE_ITEMS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 1877
;1877:	client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 1879
;1878:
;1879:	if ( client->sess.sessionTeam == TEAM_SPECTATOR )
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $645
line 1880
;1880:	{
line 1881
;1881:		client->ps.stats[STAT_WEAPONS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 0
ASGNI4
line 1882
;1882:		client->ps.stats[STAT_HOLDABLE_ITEMS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 1883
;1883:		client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 1884
;1884:	}
LABELV $645
line 1886
;1885:
;1886:	client->ps.ammo[AMMO_BLASTER] = 100; //ammoData[AMMO_BLASTER].max; //100 seems fair.
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 100
ASGNI4
line 1899
;1887://	client->ps.ammo[AMMO_POWERCELL] = ammoData[AMMO_POWERCELL].max;
;1888://	client->ps.ammo[AMMO_FORCE] = ammoData[AMMO_FORCE].max;
;1889://	client->ps.ammo[AMMO_METAL_BOLTS] = ammoData[AMMO_METAL_BOLTS].max;
;1890://	client->ps.ammo[AMMO_ROCKETS] = ammoData[AMMO_ROCKETS].max;
;1891:/*
;1892:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_BRYAR_PISTOL);
;1893:	if ( g_gametype.integer == GT_TEAM ) {
;1894:		client->ps.ammo[WP_BRYAR_PISTOL] = 50;
;1895:	} else {
;1896:		client->ps.ammo[WP_BRYAR_PISTOL] = 100;
;1897:	}
;1898:*/
;1899:	client->ps.rocketLockIndex = MAX_CLIENTS;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 1900
;1900:	client->ps.rocketLockTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 1911
;1901:
;1902:	//rww - Set here to initialize the circling seeker drone to off.
;1903:	//A quick note about this so I don't forget how it works again:
;1904:	//ps.genericEnemyIndex is kept in sync between the server and client.
;1905:	//When it gets set then an entitystate value of the same name gets
;1906:	//set along with an entitystate flag in the shared bg code. Which
;1907:	//is why a value needs to be both on the player state and entity state.
;1908:	//(it doesn't seem to just carry over the entitystate value automatically
;1909:	//because entity state value is derived from player state data or some
;1910:	//such)
;1911:	client->ps.genericEnemyIndex = -1;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 1913
;1912:
;1913:	client->ps.isJediMaster = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 1915
;1914:
;1915:	client->ps.fallingToDeath = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1352
ADDP4
CNSTI4 0
ASGNI4
line 1918
;1916:
;1917:	//Do per-spawn force power initialization
;1918:	WP_SpawnInitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_SpawnInitForcePowers
CALLV
pop
line 1921
;1919:
;1920:	// health will count down towards max_health
;1921:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] * 1.25;
ADDRLP4 836
CNSTF4 1067450368
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 836
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 836
INDIRI4
ASGNI4
line 1924
;1922:
;1923:	// Start with a small amount of armor as well.
;1924:	client->ps.stats[STAT_ARMOR] = client->ps.stats[STAT_MAX_HEALTH] * 0.25;
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
CNSTF4 1048576000
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1926
;1925:
;1926:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1927
;1927:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 80
INDIRB
ASGNB 12
line 1930
;1928:
;1929:	// the respawned flag will be cleared after the attack and jump keys come up
;1930:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 844
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 844
INDIRP4
ADDRLP4 844
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1932
;1931:
;1932:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 0
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
ADDRFP4 0
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
line 1933
;1933:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1935
;1934:
;1935:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $647
line 1937
;1936:
;1937:	} else {
ADDRGP4 $648
JUMPV
LABELV $647
line 1938
;1938:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 1939
;1939:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1942
;1940:
;1941:		// force the base weapon up
;1942:		client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1943
;1943:		client->ps.weaponstate = FIRST_WEAPON;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 1945
;1944:
;1945:	}
LABELV $648
line 1948
;1946:
;1947:	// don't allow full run speed for a bit
;1948:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 848
INDIRP4
ADDRLP4 848
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1949
;1949:	client->ps.pm_time = 100;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1951
;1950:
;1951:	client->respawnTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1952
;1952:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 0
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
line 1953
;1953:	client->latched_buttons = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1604
ADDP4
CNSTI4 0
ASGNI4
line 1956
;1954:
;1955:	// set default animations
;1956:	client->ps.torsoAnim = WeaponReadyAnim[client->ps.weapon];
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ASGNI4
line 1957
;1957:	client->ps.legsAnim = WeaponReadyAnim[client->ps.weapon];
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ASGNI4
line 1959
;1958:
;1959:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $652
line 1960
;1960:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1961
;1961:	} else {
ADDRGP4 $653
JUMPV
LABELV $652
line 1963
;1962:		// fire the targets of the spawn point
;1963:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1967
;1964:
;1965:		// select the highest weapon number available, after any
;1966:		// spawn given items have fired
;1967:		client->ps.weapon = 1;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1968
;1968:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 4
CNSTI4 15
ASGNI4
LABELV $655
line 1969
;1969:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $659
line 1970
;1970:				client->ps.weapon = i;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1971
;1971:				break;
ADDRGP4 $657
JUMPV
LABELV $659
line 1973
;1972:			}
;1973:		}
LABELV $656
line 1968
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $655
LABELV $657
line 1974
;1974:	}
LABELV $653
line 1978
;1975:
;1976:	// run a client frame to drop exactly to the floor,
;1977:	// initialize animations and other things
;1978:	client->ps.commandTime = level.time - 100;
ADDRLP4 0
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1979
;1979:	ent->client->pers.cmd.serverTime = level.time;
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
line 1980
;1980:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 1983
;1981:
;1982:	// positively link the client, even if the command times are weird
;1983:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $663
line 1984
;1984:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1985
;1985:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 860
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 860
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 860
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1986
;1986:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1987
;1987:	}
LABELV $663
line 1989
;1988:
;1989:	if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $665
line 1990
;1990:	{
line 1991
;1991:		ent->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 860
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 860
INDIRP4
ADDRLP4 860
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 1992
;1992:		ent->client->invulnerableTimer = level.time + g_spawnInvulnerability.integer;
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
line 1993
;1993:	}
LABELV $665
line 1996
;1994:
;1995:	// run the presend to set anything else
;1996:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1999
;1997:
;1998:	// clear entity state values
;1999:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2000
;2000:}
LABELV $545
endproc ClientSpawn 872 16
export ClientDisconnect
proc ClientDisconnect 24 8
line 2015
;2001:
;2002:
;2003:/*
;2004:===========
;2005:ClientDisconnect
;2006:
;2007:Called when a player drops from the server.
;2008:Will not be called between levels.
;2009:
;2010:This should NOT be called directly by any game logic,
;2011:call trap_DropClient(), which will call this and do
;2012:server system housekeeping.
;2013:============
;2014:*/
;2015:void ClientDisconnect( int clientNum ) {
line 2022
;2016:	gentity_t	*ent;
;2017:	gentity_t	*tent;
;2018:	int			i;
;2019:
;2020:	// cleanup if we are kicking a bot that
;2021:	// hasn't spawned yet
;2022:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 2024
;2023:
;2024:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2025
;2025:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $671
line 2026
;2026:		return;
ADDRGP4 $670
JUMPV
LABELV $671
line 2029
;2027:	}
;2028:
;2029:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $674
JUMPV
LABELV $673
line 2032
;2030:
;2031:	while (i < NUM_FORCE_POWERS)
;2032:	{
line 2033
;2033:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $676
line 2034
;2034:		{
line 2035
;2035:			WP_ForcePowerStop(ent, i);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 2036
;2036:		}
LABELV $676
line 2037
;2037:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2038
;2038:	}
LABELV $674
line 2031
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $673
line 2040
;2039:
;2040:	i = TRACK_CHANNEL_1;
ADDRLP4 0
CNSTI4 51
ASGNI4
ADDRGP4 $679
JUMPV
LABELV $678
line 2043
;2041:
;2042:	while (i < NUM_TRACK_CHANNELS)
;2043:	{
line 2044
;2044:		if (ent->client->ps.fd.killSoundEntIndex[i-50] && ent->client->ps.fd.killSoundEntIndex[i-50] < MAX_GENTITIES && ent->client->ps.fd.killSoundEntIndex[i-50] > 0)
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $681
ADDRLP4 12
INDIRI4
CNSTI4 1024
GEI4 $681
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $681
line 2045
;2045:		{
line 2046
;2046:			G_MuteSound(ent->client->ps.fd.killSoundEntIndex[i-50], CHAN_VOICE);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2047
;2047:		}
LABELV $681
line 2048
;2048:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2049
;2049:	}
LABELV $679
line 2042
ADDRLP4 0
INDIRI4
CNSTI4 56
LTI4 $678
line 2050
;2050:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2053
;2051:
;2052:	// stop any following clients
;2053:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $686
JUMPV
LABELV $683
line 2054
;2054:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 12
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $688
ADDRLP4 12
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 2
NEI4 $688
ADDRLP4 12
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $688
line 2056
;2055:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;2056:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 2057
;2057:			StopFollowing( &g_entities[i] );
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 2058
;2058:		}
LABELV $688
line 2059
;2059:	}
LABELV $684
line 2053
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $686
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $683
line 2062
;2060:
;2061:	// send effect if they were completely connected
;2062:	if ( ent->client->pers.connected == CON_CONNECTED 
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $690
ADDRLP4 12
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $690
line 2063
;2063:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 2064
;2064:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2065
;2065:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 20
CNSTI4 220
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 2069
;2066:
;2067:		// They don't get to take powerups with them!
;2068:		// Especially important for stuff like CTF flags
;2069:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 2070
;2070:	}
LABELV $690
line 2072
;2071:
;2072:	G_LogPrintf( "ClientDisconnect: %i\n", clientNum );
ADDRGP4 $692
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2075
;2073:
;2074:	// if we are playing in tourney mode, give a win to the other player and clear his frags for this round
;2075:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $693
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 level+9008
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $693
ADDRGP4 level+16
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $693
line 2077
;2076:		&& !level.intermissiontime
;2077:		&& !level.warmupTime ) {
line 2078
;2078:		if ( level.sortedClients[1] == clientNum ) {
ADDRGP4 level+84+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $698
line 2079
;2079:			level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] = 0;
CNSTI4 1800
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 2080
;2080:			level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 20
CNSTI4 1800
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1548
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2081
;2081:			ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2082
;2082:		}
ADDRGP4 $699
JUMPV
LABELV $698
line 2083
;2083:		else if ( level.sortedClients[0] == clientNum ) {
ADDRGP4 level+84
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $705
line 2084
;2084:			level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE] = 0;
CNSTI4 1800
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 2085
;2085:			level.clients[ level.sortedClients[1] ].sess.wins++;
ADDRLP4 20
CNSTI4 1800
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1548
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2086
;2086:			ClientUserinfoChanged( level.sortedClients[1] );
ADDRGP4 level+84+4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2087
;2087:		}
LABELV $705
LABELV $699
line 2088
;2088:	}
LABELV $693
line 2090
;2089:
;2090:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2091
;2091:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 2092
;2092:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 2093
;2093:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $714
ASGNP4
line 2094
;2094:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 0
ASGNI4
line 2095
;2095:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 0
ASGNI4
line 2096
;2096:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 0
ASGNI4
line 2098
;2097:
;2098:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $715
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2100
;2099:
;2100:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2102
;2101:
;2102:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $716
line 2103
;2103:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 2104
;2104:	}
LABELV $716
line 2106
;2105:
;2106:	G_ClearClientLog(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_ClearClientLog
CALLV
pop
line 2107
;2107:}
LABELV $670
endproc ClientDisconnect 24 8
import WP_HasForcePowers
import G_WriteClientSessionData
bss
export Client_Force
align 4
LABELV Client_Force
skip 15104
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
import G_RunClient
import ClientEndFrame
import ClientThink
import G_CheckClientTimeouts
import ClientCommand
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
import CalculateRanks
import AddScore
import player_die
import BeginIntermission
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
import G_TouchTriggers
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
LABELV $715
char 1 0
align 1
LABELV $714
char 1 100
char 1 105
char 1 115
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $692
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 68
char 1 105
char 1 115
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $626
char 1 103
char 1 95
char 1 106
char 1 101
char 1 100
char 1 105
char 1 86
char 1 109
char 1 101
char 1 114
char 1 99
char 1 0
align 1
LABELV $579
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $535
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 66
char 1 101
char 1 103
char 1 105
char 1 110
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $534
char 1 80
char 1 76
char 1 69
char 1 78
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $528
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $527
char 1 114
char 1 116
char 1 105
char 1 98
char 1 105
char 1 97
char 1 0
align 1
LABELV $526
char 1 108
char 1 116
char 1 105
char 1 98
char 1 105
char 1 97
char 1 0
align 1
LABELV $525
char 1 114
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $524
char 1 108
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $523
char 1 116
char 1 104
char 1 111
char 1 114
char 1 97
char 1 99
char 1 105
char 1 99
char 1 0
align 1
LABELV $507
char 1 66
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $502
char 1 82
char 1 101
char 1 100
char 1 0
align 1
LABELV $492
char 1 80
char 1 76
char 1 67
char 1 79
char 1 78
char 1 78
char 1 69
char 1 67
char 1 84
char 1 0
align 1
LABELV $491
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 94
char 1 55
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $488
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 67
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $487
char 1 66
char 1 111
char 1 116
char 1 67
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 102
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 0
align 1
LABELV $475
char 1 73
char 1 78
char 1 86
char 1 65
char 1 76
char 1 73
char 1 68
char 1 95
char 1 80
char 1 65
char 1 83
char 1 83
char 1 87
char 1 79
char 1 82
char 1 68
char 1 0
align 1
LABELV $472
char 1 110
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $467
char 1 112
char 1 97
char 1 115
char 1 115
char 1 119
char 1 111
char 1 114
char 1 100
char 1 0
align 1
LABELV $463
char 1 66
char 1 97
char 1 110
char 1 110
char 1 101
char 1 100
char 1 46
char 1 0
align 1
LABELV $459
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 85
char 1 115
char 1 101
char 1 114
char 1 105
char 1 110
char 1 102
char 1 111
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 58
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $455
char 1 110
char 1 92
char 1 37
char 1 115
char 1 92
char 1 116
char 1 92
char 1 37
char 1 105
char 1 92
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 92
char 1 37
char 1 115
char 1 92
char 1 103
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 92
char 1 37
char 1 115
char 1 92
char 1 103
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 49
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 50
char 1 92
char 1 37
char 1 115
char 1 92
char 1 104
char 1 99
char 1 92
char 1 37
char 1 105
char 1 92
char 1 119
char 1 92
char 1 37
char 1 105
char 1 92
char 1 108
char 1 92
char 1 37
char 1 105
char 1 92
char 1 116
char 1 116
char 1 92
char 1 37
char 1 100
char 1 92
char 1 116
char 1 108
char 1 92
char 1 37
char 1 100
char 1 0
align 1
LABELV $454
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $453
char 1 110
char 1 92
char 1 37
char 1 115
char 1 92
char 1 116
char 1 92
char 1 37
char 1 105
char 1 92
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 49
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 50
char 1 92
char 1 37
char 1 115
char 1 92
char 1 104
char 1 99
char 1 92
char 1 37
char 1 105
char 1 92
char 1 119
char 1 92
char 1 37
char 1 105
char 1 92
char 1 108
char 1 92
char 1 37
char 1 105
char 1 92
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 92
char 1 37
char 1 115
char 1 92
char 1 116
char 1 116
char 1 92
char 1 37
char 1 100
char 1 92
char 1 116
char 1 108
char 1 92
char 1 37
char 1 100
char 1 0
align 1
LABELV $450
char 1 103
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $449
char 1 103
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $448
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 50
char 1 0
align 1
LABELV $447
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 49
char 1 0
align 1
LABELV $446
char 1 116
char 1 101
char 1 97
char 1 109
char 1 116
char 1 97
char 1 115
char 1 107
char 1 0
align 1
LABELV $442
char 1 116
char 1 101
char 1 97
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $437
char 1 98
char 1 0
align 1
LABELV $436
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $432
char 1 114
char 1 0
align 1
LABELV $431
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $428
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $422
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $421
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $420
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $413
char 1 80
char 1 76
char 1 82
char 1 69
char 1 78
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $412
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 94
char 1 55
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $407
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 98
char 1 111
char 1 97
char 1 114
char 1 100
char 1 0
align 1
LABELV $402
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $399
char 1 99
char 1 103
char 1 95
char 1 112
char 1 114
char 1 101
char 1 100
char 1 105
char 1 99
char 1 116
char 1 73
char 1 116
char 1 101
char 1 109
char 1 115
char 1 0
align 1
LABELV $398
char 1 108
char 1 111
char 1 99
char 1 97
char 1 108
char 1 104
char 1 111
char 1 115
char 1 116
char 1 0
align 1
LABELV $395
char 1 105
char 1 112
char 1 0
align 1
LABELV $394
char 1 92
char 1 110
char 1 97
char 1 109
char 1 101
char 1 92
char 1 98
char 1 97
char 1 100
char 1 105
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $388
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 0
align 1
LABELV $382
char 1 99
char 1 114
char 1 97
char 1 110
char 1 105
char 1 117
char 1 109
char 1 0
align 1
LABELV $380
char 1 117
char 1 112
char 1 112
char 1 101
char 1 114
char 1 95
char 1 108
char 1 117
char 1 109
char 1 98
char 1 97
char 1 114
char 1 0
align 1
LABELV $378
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 114
char 1 111
char 1 111
char 1 116
char 1 0
align 1
LABELV $377
char 1 42
char 1 108
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $376
char 1 42
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $371
char 1 47
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $368
char 1 70
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 108
char 1 111
char 1 97
char 1 100
char 1 32
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $367
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 95
char 1 104
char 1 117
char 1 109
char 1 97
char 1 110
char 1 111
char 1 105
char 1 100
char 1 47
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $356
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 107
char 1 121
char 1 108
char 1 101
char 1 47
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $349
char 1 80
char 1 97
char 1 100
char 1 97
char 1 119
char 1 97
char 1 110
char 1 0
align 1
LABELV $245
char 1 98
char 1 111
char 1 100
char 1 121
char 1 113
char 1 117
char 1 101
char 1 0
align 1
LABELV $225
char 1 67
char 1 111
char 1 117
char 1 108
char 1 100
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 97
char 1 32
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 32
char 1 112
char 1 111
char 1 105
char 1 110
char 1 116
char 1 0
align 1
LABELV $149
char 1 66
char 1 69
char 1 67
char 1 79
char 1 77
char 1 69
char 1 74
char 1 77
char 1 0
align 1
LABELV $148
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
LABELV $147
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $141
char 1 37
char 1 105
char 1 0
align 1
LABELV $108
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
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
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $103
char 1 45
char 1 49
char 1 0
align 1
LABELV $87
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $83
char 1 110
char 1 111
char 1 104
char 1 117
char 1 109
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $80
char 1 48
char 1 0
align 1
LABELV $79
char 1 110
char 1 111
char 1 98
char 1 111
char 1 116
char 1 115
char 1 0
