data
export gPMDoSlowFall
align 4
LABELV gPMDoSlowFall
byte 4 0
export pm_stopspeed
align 4
LABELV pm_stopspeed
byte 4 1120403456
export pm_duckScale
align 4
LABELV pm_duckScale
byte 4 1056964608
export pm_swimScale
align 4
LABELV pm_swimScale
byte 4 1056964608
export pm_wadeScale
align 4
LABELV pm_wadeScale
byte 4 1060320051
export pm_accelerate
align 4
LABELV pm_accelerate
byte 4 1092616192
export pm_airaccelerate
align 4
LABELV pm_airaccelerate
byte 4 1065353216
export pm_wateraccelerate
align 4
LABELV pm_wateraccelerate
byte 4 1082130432
export pm_flyaccelerate
align 4
LABELV pm_flyaccelerate
byte 4 1090519040
export pm_friction
align 4
LABELV pm_friction
byte 4 1086324736
export pm_waterfriction
align 4
LABELV pm_waterfriction
byte 4 1065353216
export pm_flightfriction
align 4
LABELV pm_flightfriction
byte 4 1077936128
export pm_spectatorfriction
align 4
LABELV pm_spectatorfriction
byte 4 1084227584
export c_pmove
align 4
LABELV c_pmove
byte 4 0
export forceSpeedLevels
align 4
LABELV forceSpeedLevels
byte 4 1065353216
byte 4 1067450368
byte 4 1069547520
byte 4 1071644672
export forcePowerNeeded
align 4
LABELV forcePowerNeeded
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 65
byte 4 10
byte 4 50
byte 4 20
byte 4 20
byte 4 20
byte 4 30
byte 4 1
byte 4 50
byte 4 50
byte 4 50
byte 4 50
byte 4 50
byte 4 20
byte 4 20
byte 4 0
byte 4 2
byte 4 20
byte 4 60
byte 4 10
byte 4 50
byte 4 20
byte 4 20
byte 4 20
byte 4 30
byte 4 1
byte 4 50
byte 4 25
byte 4 25
byte 4 33
byte 4 33
byte 4 20
byte 4 20
byte 4 0
byte 4 1
byte 4 20
byte 4 50
byte 4 10
byte 4 50
byte 4 20
byte 4 20
byte 4 20
byte 4 60
byte 4 1
byte 4 50
byte 4 10
byte 4 10
byte 4 25
byte 4 25
byte 4 20
byte 4 20
byte 4 0
byte 4 0
byte 4 20
export forceJumpHeight
align 4
LABELV forceJumpHeight
byte 4 1107296256
byte 4 1119879168
byte 4 1128267776
byte 4 1136656384
export forceJumpStrength
align 4
LABELV forceJumpStrength
byte 4 1130430464
byte 4 1137836032
byte 4 1142128640
byte 4 1146224640
export PM_GetSaberStance
code
proc PM_GetSaberStance 0 0
file "../bg_pmove.c"
line 148
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_pmove.c -- both games player movement code
;4:// takes a playerstate and a usercmd as input and returns a modifed playerstate
;5:
;6:#include "q_shared.h"
;7:#include "bg_public.h"
;8:#include "bg_local.h"
;9:
;10:#define MAX_WEAPON_CHARGE_TIME 5000
;11:
;12:pmove_t		*pm;
;13:pml_t		pml;
;14:
;15:qboolean gPMDoSlowFall = qfalse;
;16:
;17:// movement parameters
;18:float	pm_stopspeed = 100.0f;
;19:float	pm_duckScale = 0.50f;
;20:float	pm_swimScale = 0.50f;
;21:float	pm_wadeScale = 0.70f;
;22:
;23:float	pm_accelerate = 10.0f;
;24:float	pm_airaccelerate = 1.0f;
;25:float	pm_wateraccelerate = 4.0f;
;26:float	pm_flyaccelerate = 8.0f;
;27:
;28:float	pm_friction = 6.0f;
;29:float	pm_waterfriction = 1.0f;
;30:float	pm_flightfriction = 3.0f;
;31:float	pm_spectatorfriction = 5.0f;
;32:
;33:int		c_pmove = 0;
;34:
;35:float forceSpeedLevels[4] = 
;36:{
;37:	1, //rank 0?
;38:	1.25,
;39:	1.5,
;40:	1.75
;41:};
;42:
;43:int forcePowerNeeded[NUM_FORCE_POWER_LEVELS][NUM_FORCE_POWERS] = 
;44:{
;45:	{ //nothing should be usable at rank 0..
;46:		999,//FP_HEAL,//instant
;47:		999,//FP_LEVITATION,//hold/duration
;48:		999,//FP_SPEED,//duration
;49:		999,//FP_PUSH,//hold/duration
;50:		999,//FP_PULL,//hold/duration
;51:		999,//FP_TELEPATHY,//instant
;52:		999,//FP_GRIP,//hold/duration
;53:		999,//FP_LIGHTNING,//hold/duration
;54:		999,//FP_RAGE,//duration
;55:		999,//FP_PROTECT,//duration
;56:		999,//FP_ABSORB,//duration
;57:		999,//FP_TEAM_HEAL,//instant
;58:		999,//FP_TEAM_FORCE,//instant
;59:		999,//FP_DRAIN,//hold/duration
;60:		999,//FP_SEE,//duration
;61:		999,//FP_SABERATTACK,
;62:		999,//FP_SABERDEFEND,
;63:		999//FP_SABERTHROW,
;64:		//NUM_FORCE_POWERS
;65:	},
;66:	{
;67:		65,//FP_HEAL,//instant //was 25, but that was way too little
;68:		10,//FP_LEVITATION,//hold/duration
;69:		50,//FP_SPEED,//duration
;70:		20,//FP_PUSH,//hold/duration
;71:		20,//FP_PULL,//hold/duration
;72:		20,//FP_TELEPATHY,//instant
;73:		30,//FP_GRIP,//hold/duration
;74:		1,//FP_LIGHTNING,//hold/duration
;75:		50,//FP_RAGE,//duration
;76:		50,//FP_PROTECT,//duration
;77:		50,//FP_ABSORB,//duration
;78:		50,//FP_TEAM_HEAL,//instant
;79:		50,//FP_TEAM_FORCE,//instant
;80:		20,//FP_DRAIN,//hold/duration
;81:		20,//FP_SEE,//duration
;82:		0,//FP_SABERATTACK,
;83:		2,//FP_SABERDEFEND,
;84:		20//FP_SABERTHROW,
;85:		//NUM_FORCE_POWERS
;86:	},
;87:	{
;88:		60,//FP_HEAL,//instant
;89:		10,//FP_LEVITATION,//hold/duration
;90:		50,//FP_SPEED,//duration
;91:		20,//FP_PUSH,//hold/duration
;92:		20,//FP_PULL,//hold/duration
;93:		20,//FP_TELEPATHY,//instant
;94:		30,//FP_GRIP,//hold/duration
;95:		1,//FP_LIGHTNING,//hold/duration
;96:		50,//FP_RAGE,//duration
;97:		25,//FP_PROTECT,//duration
;98:		25,//FP_ABSORB,//duration
;99:		33,//FP_TEAM_HEAL,//instant
;100:		33,//FP_TEAM_FORCE,//instant
;101:		20,//FP_DRAIN,//hold/duration
;102:		20,//FP_SEE,//duration
;103:		0,//FP_SABERATTACK,
;104:		1,//FP_SABERDEFEND,
;105:		20//FP_SABERTHROW,
;106:		//NUM_FORCE_POWERS
;107:	},
;108:	{
;109:		50,//FP_HEAL,//instant //You get 5 points of health.. for 50 force points!
;110:		10,//FP_LEVITATION,//hold/duration
;111:		50,//FP_SPEED,//duration
;112:		20,//FP_PUSH,//hold/duration
;113:		20,//FP_PULL,//hold/duration
;114:		20,//FP_TELEPATHY,//instant
;115:		60,//FP_GRIP,//hold/duration
;116:		1,//FP_LIGHTNING,//hold/duration
;117:		50,//FP_RAGE,//duration
;118:		10,//FP_PROTECT,//duration
;119:		10,//FP_ABSORB,//duration
;120:		25,//FP_TEAM_HEAL,//instant
;121:		25,//FP_TEAM_FORCE,//instant
;122:		20,//FP_DRAIN,//hold/duration
;123:		20,//FP_SEE,//duration
;124:		0,//FP_SABERATTACK,
;125:		0,//FP_SABERDEFEND,
;126:		20//FP_SABERTHROW,
;127:		//NUM_FORCE_POWERS
;128:	}
;129:};
;130:
;131:float forceJumpHeight[NUM_FORCE_POWER_LEVELS] = 
;132:{
;133:	32,//normal jump (+stepheight+crouchdiff = 66)
;134:	96,//(+stepheight+crouchdiff = 130)
;135:	192,//(+stepheight+crouchdiff = 226)
;136:	384//(+stepheight+crouchdiff = 418)
;137:};
;138:
;139:float forceJumpStrength[NUM_FORCE_POWER_LEVELS] = 
;140:{
;141:	JUMP_VELOCITY,//normal jump
;142:	420,
;143:	590,
;144:	840
;145:};
;146:
;147:int PM_GetSaberStance(void)
;148:{
line 149
;149:	if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_2)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
NEI4 $66
line 150
;150:	{ //medium
line 151
;151:		return BOTH_STAND2;
CNSTI4 573
RETI4
ADDRGP4 $65
JUMPV
LABELV $66
line 153
;152:	}
;153:	if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_3)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $68
line 154
;154:	{ //strong
line 155
;155:		return BOTH_SABERSLOW_STANCE;
CNSTI4 563
RETI4
ADDRGP4 $65
JUMPV
LABELV $68
line 159
;156:	}
;157:
;158:	//fast
;159:	return BOTH_SABERFAST_STANCE;
CNSTI4 562
RETI4
LABELV $65
endproc PM_GetSaberStance 0 0
export PM_DoSlowFall
proc PM_DoSlowFall 4 0
line 163
;160:}
;161:
;162:qboolean PM_DoSlowFall(void)
;163:{
line 164
;164:	if ( ( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT || (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT ) && pm->ps->legsTimer > 500 )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 915
EQI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 918
NEI4 $71
LABELV $73
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 500
LEI4 $71
line 165
;165:	{
line 166
;166:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $70
JUMPV
LABELV $71
line 169
;167:	}
;168:
;169:	return qfalse;
CNSTI4 0
RETI4
LABELV $70
endproc PM_DoSlowFall 4 0
export PM_AddEvent
proc PM_AddEvent 0 12
line 178
;170:}
;171:
;172:/*
;173:===============
;174:PM_AddEvent
;175:
;176:===============
;177:*/
;178:void PM_AddEvent( int newEvent ) {
line 179
;179:	BG_AddPredictableEventToPlayerstate( newEvent, 0, pm->ps );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 180
;180:}
LABELV $74
endproc PM_AddEvent 0 12
export PM_AddEventWithParm
proc PM_AddEventWithParm 0 12
line 183
;181:
;182:void PM_AddEventWithParm( int newEvent, int parm ) 
;183:{
line 184
;184:	BG_AddPredictableEventToPlayerstate( newEvent, parm, pm->ps );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 185
;185:}
LABELV $75
endproc PM_AddEventWithParm 0 12
export PM_AddTouchEnt
proc PM_AddTouchEnt 12 0
line 192
;186:
;187:/*
;188:===============
;189:PM_AddTouchEnt
;190:===============
;191:*/
;192:void PM_AddTouchEnt( int entityNum ) {
line 195
;193:	int		i;
;194:
;195:	if ( entityNum == ENTITYNUM_WORLD ) {
ADDRFP4 0
INDIRI4
CNSTI4 1022
NEI4 $77
line 196
;196:		return;
ADDRGP4 $76
JUMPV
LABELV $77
line 198
;197:	}
;198:	if ( pm->numtouch == MAXTOUCH ) {
ADDRGP4 pm
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 32
NEI4 $79
line 199
;199:		return;
ADDRGP4 $76
JUMPV
LABELV $79
line 203
;200:	}
;201:
;202:	// see if it is already added
;203:	for ( i = 0 ; i < pm->numtouch ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $84
JUMPV
LABELV $81
line 204
;204:		if ( pm->touchents[ i ] == entityNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
CNSTI4 56
ADDP4
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $85
line 205
;205:			return;
ADDRGP4 $76
JUMPV
LABELV $85
line 207
;206:		}
;207:	}
LABELV $82
line 203
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $84
ADDRLP4 0
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
LTI4 $81
line 210
;208:
;209:	// add it
;210:	pm->touchents[pm->numtouch] = entityNum;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 211
;211:	pm->numtouch++;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 212
;212:}
LABELV $76
endproc PM_AddTouchEnt 12 0
export PM_ClipVelocity
proc PM_ClipVelocity 32 0
line 222
;213:
;214:
;215:/*
;216:==================
;217:PM_ClipVelocity
;218:
;219:Slide off of the impacting surface
;220:==================
;221:*/
;222:void PM_ClipVelocity( vec3_t in, vec3_t normal, vec3_t out, float overbounce ) {
line 227
;223:	float	backoff;
;224:	float	change;
;225:	int		i;
;226:	
;227:	backoff = DotProduct (in, normal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 229
;228:	
;229:	if ( backoff < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $88
line 230
;230:		backoff *= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 231
;231:	} else {
ADDRGP4 $89
JUMPV
LABELV $88
line 232
;232:		backoff /= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 233
;233:	}
LABELV $89
line 235
;234:
;235:	for ( i=0 ; i<3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $90
line 236
;236:		change = normal[i]*backoff;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 237
;237:		out[i] = in[i] - change;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 238
;238:	}
LABELV $91
line 235
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $90
line 239
;239:}
LABELV $87
endproc PM_ClipVelocity 32 0
proc PM_Friction 52 4
line 249
;240:
;241:
;242:/*
;243:==================
;244:PM_Friction
;245:
;246:Handles both ground friction and water friction
;247:==================
;248:*/
;249:static void PM_Friction( void ) {
line 255
;250:	vec3_t	vec;
;251:	float	*vel;
;252:	float	speed, newspeed, control;
;253:	float	drop;
;254:	
;255:	vel = pm->ps->velocity;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 257
;256:	
;257:	VectorCopy( vel, vec );
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 12
line 258
;258:	if ( pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $95
line 259
;259:		vec[2] = 0;	// ignore slope movement
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 260
;260:	}
LABELV $95
line 262
;261:
;262:	speed = VectorLength(vec);
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 263
;263:	if (speed < 1) {
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $99
line 264
;264:		vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 265
;265:		vel[1] = 0;		// allow sinking underwater
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 267
;266:		// FIXME: still have z friction underwater?
;267:		return;
ADDRGP4 $94
JUMPV
LABELV $99
line 270
;268:	}
;269:
;270:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 273
;271:
;272:	// apply ground friction
;273:	if ( pm->waterlevel <= 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
GTI4 $101
line 274
;274:		if ( pml.walking && !(pml.groundTrace.surfaceFlags & SURF_SLICK) ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 pml+44
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $103
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 36
INDIRI4
NEI4 $103
line 276
;275:			// if getting knocked back, no friction
;276:			if ( ! (pm->ps->pm_flags & PMF_TIME_KNOCKBACK) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $108
line 277
;277:				control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $111
ADDRLP4 40
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $112
JUMPV
LABELV $111
ADDRLP4 40
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $112
ADDRLP4 28
ADDRLP4 40
INDIRF4
ASGNF4
line 278
;278:				drop += control*pm_friction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
ADDRGP4 pm_friction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 279
;279:			}
LABELV $108
line 280
;280:		}
LABELV $103
line 281
;281:	}
LABELV $101
line 284
;282:
;283:	// apply water friction even if just wading
;284:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $114
line 285
;285:		drop += speed*pm_waterfriction*pm->waterlevel*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_waterfriction
INDIRF4
MULF4
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 286
;286:	}
LABELV $114
line 288
;287:
;288:	if ( pm->ps->pm_type == PM_SPECTATOR || pm->ps->pm_type == PM_FLOAT )
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 3
EQI4 $119
ADDRLP4 36
INDIRI4
CNSTI4 1
NEI4 $117
LABELV $119
line 289
;289:	{
line 290
;290:		if (pm->ps->pm_type == PM_FLOAT)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $120
line 291
;291:		{ //almost no friction while floating
line 292
;292:			drop += speed*0.1*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1036831949
ADDRLP4 8
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 293
;293:		}
ADDRGP4 $121
JUMPV
LABELV $120
line 295
;294:		else
;295:		{
line 296
;296:			drop += speed*pm_spectatorfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_spectatorfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 297
;297:		}
LABELV $121
line 298
;298:	}
LABELV $117
line 301
;299:
;300:	// scale the velocity
;301:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 302
;302:	if (newspeed < 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $124
line 303
;303:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 304
;304:	}
LABELV $124
line 305
;305:	newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 307
;306:
;307:	vel[0] = vel[0] * newspeed;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 308
;308:	vel[1] = vel[1] * newspeed;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 309
;309:	vel[2] = vel[2] * newspeed;
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 310
;310:}
LABELV $94
endproc PM_Friction 52 4
proc PM_Accelerate 32 0
line 320
;311:
;312:
;313:/*
;314:==============
;315:PM_Accelerate
;316:
;317:Handles user intended acceleration
;318:==============
;319:*/
;320:static void PM_Accelerate( vec3_t wishdir, float wishspeed, float accel ) {
line 326
;321:#if 1
;322:	// q2 style
;323:	int			i;
;324:	float		addspeed, accelspeed, currentspeed;
;325:
;326:	currentspeed = DotProduct (pm->ps->velocity, wishdir);
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 327
;327:	addspeed = wishspeed - currentspeed;
ADDRLP4 8
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 328
;328:	if (addspeed <= 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $127
line 329
;329:		return;
ADDRGP4 $126
JUMPV
LABELV $127
line 331
;330:	}
;331:	accelspeed = accel*pml.frametime*wishspeed;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 332
;332:	if (accelspeed > addspeed) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $130
line 333
;333:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 334
;334:	}
LABELV $130
line 336
;335:	
;336:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $132
line 337
;337:		pm->ps->velocity[i] += accelspeed*wishdir[i];	
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 338
;338:	}
LABELV $133
line 336
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $132
line 357
;339:#else
;340:	// proper way (avoids strafe jump maxspeed bug), but feels bad
;341:	vec3_t		wishVelocity;
;342:	vec3_t		pushDir;
;343:	float		pushLen;
;344:	float		canPush;
;345:
;346:	VectorScale( wishdir, wishspeed, wishVelocity );
;347:	VectorSubtract( wishVelocity, pm->ps->velocity, pushDir );
;348:	pushLen = VectorNormalize( pushDir );
;349:
;350:	canPush = accel*pml.frametime*wishspeed;
;351:	if (canPush > pushLen) {
;352:		canPush = pushLen;
;353:	}
;354:
;355:	VectorMA( pm->ps->velocity, canPush, pushDir, pm->ps->velocity );
;356:#endif
;357:}
LABELV $126
endproc PM_Accelerate 32 0
proc PM_CmdScale 48 4
line 370
;358:
;359:
;360:
;361:/*
;362:============
;363:PM_CmdScale
;364:
;365:Returns the scale factor to apply to cmd movements
;366:This allows the clients to use axial -127 to 127 values for all directions
;367:without getting a sqrt(2) distortion in speed.
;368:============
;369:*/
;370:static float PM_CmdScale( usercmd_t *cmd ) {
line 374
;371:	int		max;
;372:	float	total;
;373:	float	scale;
;374:	int		umove = 0; //cmd->upmove;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 377
;375:			//don't factor upmove into scaling speed
;376:
;377:	max = abs( cmd->forwardmove );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 378
;378:	if ( abs( cmd->rightmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $137
line 379
;379:		max = abs( cmd->rightmove );
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 380
;380:	}
LABELV $137
line 381
;381:	if ( abs( umove ) > max ) {
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $139
line 382
;382:		max = abs( umove );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 383
;383:	}
LABELV $139
line 384
;384:	if ( !max ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $141
line 385
;385:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $136
JUMPV
LABELV $141
line 388
;386:	}
;387:
;388:	total = sqrt( cmd->forwardmove * cmd->forwardmove
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
ADDRLP4 36
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
ADDI4
ADDRLP4 4
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 44
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 44
INDIRF4
ASGNF4
line 390
;389:		+ cmd->rightmove * cmd->rightmove + umove * umove );
;390:	scale = (float)pm->ps->speed * max / ( 127.0 * total );
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CNSTF4 1123942400
ADDRLP4 8
INDIRF4
MULF4
DIVF4
ASGNF4
line 392
;391:
;392:	return scale;
ADDRLP4 12
INDIRF4
RETF4
LABELV $136
endproc PM_CmdScale 48 4
proc PM_SetMovementDir 72 0
line 404
;393:}
;394:
;395:
;396:/*
;397:================
;398:PM_SetMovementDir
;399:
;400:Determine the rotation of the legs reletive
;401:to the facing dir
;402:================
;403:*/
;404:static void PM_SetMovementDir( void ) {
line 405
;405:	if ( pm->cmd.forwardmove || pm->cmd.rightmove ) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $146
ADDRLP4 0
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
EQI4 $144
LABELV $146
line 406
;406:		if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove > 0 ) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $147
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
LEI4 $147
line 407
;407:			pm->ps->movementDir = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 0
ASGNI4
line 408
;408:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $145
JUMPV
LABELV $147
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
GEI4 $149
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
LEI4 $149
line 409
;409:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 1
ASGNI4
line 410
;410:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $145
JUMPV
LABELV $149
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
GEI4 $151
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
NEI4 $151
line 411
;411:			pm->ps->movementDir = 2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 2
ASGNI4
line 412
;412:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $145
JUMPV
LABELV $151
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
GEI4 $153
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
GEI4 $153
line 413
;413:			pm->ps->movementDir = 3;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 3
ASGNI4
line 414
;414:		} else if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $145
JUMPV
LABELV $153
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $155
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
GEI4 $155
line 415
;415:			pm->ps->movementDir = 4;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 4
ASGNI4
line 416
;416:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $145
JUMPV
LABELV $155
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
LEI4 $157
ADDRLP4 48
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
GEI4 $157
line 417
;417:			pm->ps->movementDir = 5;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 5
ASGNI4
line 418
;418:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $145
JUMPV
LABELV $157
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
LEI4 $159
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $159
line 419
;419:			pm->ps->movementDir = 6;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 6
ASGNI4
line 420
;420:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $145
JUMPV
LABELV $159
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
LEI4 $145
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
LEI4 $145
line 421
;421:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 7
ASGNI4
line 422
;422:		}
line 423
;423:	} else {
ADDRGP4 $145
JUMPV
LABELV $144
line 427
;424:		// if they aren't actively going directly sideways,
;425:		// change the animation to the diagonal so they
;426:		// don't stop too crooked
;427:		if ( pm->ps->movementDir == 2 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2
NEI4 $163
line 428
;428:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 1
ASGNI4
line 429
;429:		} else if ( pm->ps->movementDir == 6 ) {
ADDRGP4 $164
JUMPV
LABELV $163
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 6
NEI4 $165
line 430
;430:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 7
ASGNI4
line 431
;431:		} 
LABELV $165
LABELV $164
line 432
;432:	}
LABELV $145
line 433
;433:}
LABELV $143
endproc PM_SetMovementDir 72 0
export PM_ForceJumpingUp
proc PM_ForceJumpingUp 40 16
line 438
;434:
;435:#define METROID_JUMP 1
;436:
;437:qboolean PM_ForceJumpingUp(void)
;438:{
line 439
;439:	if ( !(pm->ps->fd.forcePowersActive&(1<<FP_LEVITATION)) && pm->ps->fd.forceJumpCharge )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $168
ADDRLP4 0
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $168
line 440
;440:	{//already jumped and let go
line 441
;441:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $167
JUMPV
LABELV $168
line 444
;442:	}
;443:
;444:	if ( BG_InSpecialJump( pm->ps->legsAnim ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $170
line 445
;445:	{
line 446
;446:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $167
JUMPV
LABELV $170
line 449
;447:	}
;448:
;449:	if (BG_SaberInSpecial(pm->ps->saberMove))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $172
line 450
;450:	{
line 451
;451:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $167
JUMPV
LABELV $172
line 454
;452:	}
;453:
;454:	if (BG_SaberInSpecialAttack(pm->ps->legsAnim))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $174
line 455
;455:	{
line 456
;456:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $167
JUMPV
LABELV $174
line 459
;457:	}
;458:
;459:	if (BG_HasYsalamiri(pm->gametype, pm->ps))
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $176
line 460
;460:	{
line 461
;461:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $167
JUMPV
LABELV $176
line 464
;462:	}
;463:
;464:	if (!BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION))
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $178
line 465
;465:	{
line 466
;466:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $167
JUMPV
LABELV $178
line 469
;467:	}
;468:
;469:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE && //in air
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $180
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 36
INDIRI4
EQI4 $180
ADDRLP4 32
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $180
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $180
line 473
;470:		(pm->ps->pm_flags & PMF_JUMP_HELD) && //jumped
;471:		pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_0 && //force-jump capable
;472:		pm->ps->velocity[2] > 0 )//going up
;473:	{
line 474
;474:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $167
JUMPV
LABELV $180
line 476
;475:	}
;476:	return qfalse;
CNSTI4 0
RETI4
LABELV $167
endproc PM_ForceJumpingUp 40 16
proc PM_JumpForDir 8 16
line 480
;477:}
;478:
;479:static void PM_JumpForDir( void )
;480:{
line 481
;481:	int anim = BOTH_JUMP1;
ADDRLP4 0
CNSTI4 856
ASGNI4
line 482
;482:	if ( pm->cmd.forwardmove > 0 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $183
line 483
;483:	{
line 484
;484:		anim = BOTH_JUMP1;
ADDRLP4 0
CNSTI4 856
ASGNI4
line 485
;485:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 486
;486:	} 
ADDRGP4 $184
JUMPV
LABELV $183
line 487
;487:	else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $185
line 488
;488:	{
line 489
;489:		anim = BOTH_JUMPBACK1;
ADDRLP4 0
CNSTI4 860
ASGNI4
line 490
;490:		pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 491
;491:	}
ADDRGP4 $186
JUMPV
LABELV $185
line 492
;492:	else if ( pm->cmd.rightmove > 0 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $187
line 493
;493:	{
line 494
;494:		anim = BOTH_JUMPRIGHT1;
ADDRLP4 0
CNSTI4 866
ASGNI4
line 495
;495:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 496
;496:	}
ADDRGP4 $188
JUMPV
LABELV $187
line 497
;497:	else if ( pm->cmd.rightmove < 0 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $189
line 498
;498:	{
line 499
;499:		anim = BOTH_JUMPLEFT1;
ADDRLP4 0
CNSTI4 863
ASGNI4
line 500
;500:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 501
;501:	}
ADDRGP4 $190
JUMPV
LABELV $189
line 503
;502:	else
;503:	{
line 504
;504:		anim = BOTH_JUMP1;
ADDRLP4 0
CNSTI4 856
ASGNI4
line 505
;505:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 506
;506:	}
LABELV $190
LABELV $188
LABELV $186
LABELV $184
line 507
;507:	if(!BG_InDeathAnim(pm->ps->legsAnim))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $191
line 508
;508:	{
line 509
;509:		PM_SetAnim(SETANIM_LEGS,anim,SETANIM_FLAG_OVERRIDE, 100);
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 510
;510:	}
LABELV $191
line 511
;511:}
LABELV $182
endproc PM_JumpForDir 8 16
export PM_SetPMViewAngle
proc PM_SetPMViewAngle 12 0
line 514
;512:
;513:void PM_SetPMViewAngle(playerState_t *ps, vec3_t angle, usercmd_t *ucmd)
;514:{
line 517
;515:	int			i;
;516:
;517:	for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $194
line 518
;518:	{ // set the delta angle
line 521
;519:		int		cmdAngle;
;520:
;521:		cmdAngle = ANGLE2SHORT(angle[i]);
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
line 522
;522:		ps->delta_angles[i] = cmdAngle - ucmd->angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 523
;523:	}
LABELV $195
line 517
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $194
line 524
;524:	VectorCopy (angle, ps->viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 525
;525:}
LABELV $193
endproc PM_SetPMViewAngle 12 0
export PM_AdjustAngleForWallRun
proc PM_AdjustAngleForWallRun 1216 28
line 528
;526:
;527:qboolean PM_AdjustAngleForWallRun( playerState_t *ps, usercmd_t *ucmd, qboolean doMove )
;528:{
line 529
;529:	if (( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT || (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT ) && ps->legsTimer > 500 )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 915
EQI4 $201
ADDRLP4 0
INDIRI4
CNSTI4 918
NEI4 $199
LABELV $201
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 500
LEI4 $199
line 530
;530:	{//wall-running and not at end of anim
line 536
;531:		//stick to wall, if there is one
;532:		vec3_t	rt, traceTo, mins, maxs, fwdAngles;
;533:		trace_t	trace;
;534:		float	dist, yawAdjust;
;535:
;536:		VectorSet(mins, -15, -15, 0);
ADDRLP4 1152
CNSTF4 3245342720
ASGNF4
ADDRLP4 44
ADDRLP4 1152
INDIRF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 1152
INDIRF4
ASGNF4
ADDRLP4 44+8
CNSTF4 0
ASGNF4
line 537
;537:		VectorSet(maxs, 15, 15, 24);
ADDRLP4 1156
CNSTF4 1097859072
ASGNF4
ADDRLP4 56
ADDRLP4 1156
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 1156
INDIRF4
ASGNF4
ADDRLP4 56+8
CNSTF4 1103101952
ASGNF4
line 538
;538:		VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 540
;539:
;540:		AngleVectors( fwdAngles, NULL, rt, NULL );
ADDRLP4 20
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 541
;541:		if ( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 915
NEI4 $208
line 542
;542:		{
line 543
;543:			dist = 128;
ADDRLP4 16
CNSTF4 1124073472
ASGNF4
line 544
;544:			yawAdjust = -90;
ADDRLP4 1148
CNSTF4 3266576384
ASGNF4
line 545
;545:		}
ADDRGP4 $209
JUMPV
LABELV $208
line 547
;546:		else
;547:		{
line 548
;548:			dist = -128;
ADDRLP4 16
CNSTF4 3271557120
ASGNF4
line 549
;549:			yawAdjust = 90;
ADDRLP4 1148
CNSTF4 1119092736
ASGNF4
line 550
;550:		}
LABELV $209
line 551
;551:		VectorMA( ps->origin, dist, rt, traceTo );
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 1164
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 1168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1164
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 1168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+8
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 553
;552:		
;553:		pm->trace( &trace, ps->origin, mins, maxs, traceTo, ps->clientNum, MASK_PLAYERSOLID );
ADDRLP4 68
ARGP4
ADDRLP4 1172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 1172
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 555
;554:
;555:		if ( trace.fraction < 1.0f )
ADDRLP4 68+8
INDIRF4
CNSTF4 1065353216
GEF4 $214
line 556
;556:		{//still a wall there
line 557
;557:			if ( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 915
NEI4 $217
line 558
;558:			{
line 559
;559:				ucmd->rightmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 127
ASGNI1
line 560
;560:			}
ADDRGP4 $218
JUMPV
LABELV $217
line 562
;561:			else
;562:			{
line 563
;563:				ucmd->rightmove = -127;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 -127
ASGNI1
line 564
;564:			}
LABELV $218
line 565
;565:			if ( ucmd->upmove < 0 )
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $219
line 566
;566:			{
line 567
;567:				ucmd->upmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 568
;568:			}
LABELV $219
line 570
;569:			//make me face perpendicular to the wall
;570:			ps->viewangles[YAW] = vectoyaw( trace.plane.normal )+yawAdjust;
ADDRLP4 68+24
ARGP4
ADDRLP4 1176
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 1176
INDIRF4
ADDRLP4 1148
INDIRF4
ADDF4
ASGNF4
line 572
;571:
;572:			PM_SetPMViewAngle(ps, ps->viewangles, ucmd);
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 PM_SetPMViewAngle
CALLV
pop
line 574
;573:
;574:			ucmd->angles[YAW] = ANGLE2SHORT( ps->viewangles[YAW] ) - ps->delta_angles[YAW];
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1199570944
ADDRLP4 1184
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDRLP4 1184
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
SUBI4
ASGNI4
line 575
;575:			if ( doMove )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $222
line 576
;576:			{
line 579
;577:				//push me forward
;578:				vec3_t	fwd;
;579:				float	zVel = ps->velocity[2];
ADDRLP4 1188
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
line 580
;580:				if ( ps->legsTimer > 500 )
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 500
LEI4 $224
line 581
;581:				{//not at end of anim yet
line 582
;582:					float speed = 175;
ADDRLP4 1204
CNSTF4 1127153664
ASGNF4
line 584
;583:
;584:					fwdAngles[YAW] = ps->viewangles[YAW];
ADDRLP4 20+4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 585
;585:					AngleVectors( fwdAngles, fwd, NULL, NULL );
ADDRLP4 20
ARGP4
ADDRLP4 1192
ARGP4
ADDRLP4 1208
CNSTP4 0
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 587
;586:
;587:					if ( ucmd->forwardmove < 0 )
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $227
line 588
;588:					{//slower
line 589
;589:						speed = 100;
ADDRLP4 1204
CNSTF4 1120403456
ASGNF4
line 590
;590:					}
ADDRGP4 $228
JUMPV
LABELV $227
line 591
;591:					else if ( ucmd->forwardmove > 0 )
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $229
line 592
;592:					{
line 593
;593:						speed = 250;//running speed
ADDRLP4 1204
CNSTF4 1132068864
ASGNF4
line 594
;594:					}
LABELV $229
LABELV $228
line 595
;595:					VectorScale( fwd, speed, ps->velocity );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1192
INDIRF4
ADDRLP4 1204
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1192+4
INDIRF4
ADDRLP4 1204
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1192+8
INDIRF4
ADDRLP4 1204
INDIRF4
MULF4
ASGNF4
line 596
;596:				}
LABELV $224
line 597
;597:				ps->velocity[2] = zVel;//preserve z velocity
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1188
INDIRF4
ASGNF4
line 599
;598:				//pull me toward the wall, too
;599:				VectorMA( ps->velocity, dist, rt, ps->velocity );
ADDRLP4 1204
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1204
INDIRP4
ADDRLP4 1204
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1208
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1208
INDIRP4
ADDRLP4 1208
INDIRP4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1212
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1212
INDIRP4
ADDRLP4 1212
INDIRP4
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 600
;600:			}
LABELV $222
line 601
;601:			ucmd->forwardmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 602
;602:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $198
JUMPV
LABELV $214
line 604
;603:		}
;604:		else if ( doMove )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $235
line 605
;605:		{//stop it
line 606
;606:			if ( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 915
NEI4 $237
line 607
;607:			{
line 608
;608:				PM_SetAnim(SETANIM_BOTH, BOTH_WALL_RUN_RIGHT_STOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1176
CNSTI4 3
ASGNI4
ADDRLP4 1176
INDIRI4
ARGI4
CNSTI4 917
ARGI4
ADDRLP4 1176
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 609
;609:			}
ADDRGP4 $238
JUMPV
LABELV $237
line 610
;610:			else if ( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 918
NEI4 $239
line 611
;611:			{
line 612
;612:				PM_SetAnim(SETANIM_BOTH, BOTH_WALL_RUN_LEFT_STOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1176
CNSTI4 3
ASGNI4
ADDRLP4 1176
INDIRI4
ARGI4
CNSTI4 920
ARGI4
ADDRLP4 1176
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 613
;613:			}
LABELV $239
LABELV $238
line 614
;614:		}
LABELV $235
line 615
;615:	}
LABELV $199
line 617
;616:
;617:	return qfalse;
CNSTI4 0
RETI4
LABELV $198
endproc PM_AdjustAngleForWallRun 1216 28
export PM_SetForceJumpZStart
proc PM_SetForceJumpZStart 4 0
line 622
;618:}
;619:
;620://Set the height for when a force jump was started. If it's 0, nuge it up (slight hack to prevent holding jump over slopes)
;621:void PM_SetForceJumpZStart(float value)
;622:{
line 623
;623:	pm->ps->fd.forceJumpZStart = value;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
ADDRFP4 0
INDIRF4
ASGNF4
line 624
;624:	if (!pm->ps->fd.forceJumpZStart)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
NEF4 $242
line 625
;625:	{
line 626
;626:		pm->ps->fd.forceJumpZStart -= 0.1;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
line 627
;627:	}
LABELV $242
line 628
;628:}
LABELV $241
endproc PM_SetForceJumpZStart 4 0
proc PM_CheckJump 1288 28
line 636
;629:
;630:/*
;631:=============
;632:PM_CheckJump
;633:=============
;634:*/
;635:static qboolean PM_CheckJump( void ) 
;636:{
line 637
;637:	if (pm->ps->usingATST)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $245
line 638
;638:	{
line 639
;639:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $245
line 642
;640:	}
;641:
;642:	if (pm->ps->forceHandExtend == HANDEXTEND_KNOCKDOWN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $247
line 643
;643:	{
line 644
;644:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $247
line 648
;645:	}
;646:
;647:	//Don't allow jump until all buttons are up
;648:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $249
line 649
;649:		return qfalse;		
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $249
line 652
;650:	}
;651:
;652:	if ( PM_InKnockDown( pm->ps ) || BG_InRoll( pm->ps, pm->ps->legsAnim ) ) 
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $253
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $251
LABELV $253
line 653
;653:	{//in knockdown
line 654
;654:		return qfalse;		
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $251
line 657
;655:	}
;656:
;657:	if (pm->ps->groundEntityNum != ENTITYNUM_NONE || pm->ps->origin[2] < pm->ps->fd.forceJumpZStart)
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $256
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
GEF4 $254
LABELV $256
line 658
;658:	{
line 659
;659:		pm->ps->fd.forcePowersActive &= ~(1<<FP_LEVITATION);
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 660
;660:	}
LABELV $254
line 662
;661:
;662:	if (pm->ps->fd.forcePowersActive & (1 << FP_LEVITATION))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $257
line 663
;663:	{ //Force jump is already active.. continue draining power appropriately until we land.
line 664
;664:		if (pm->ps->fd.forcePowerDebounce[FP_LEVITATION] < pm->cmd.serverTime)
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $259
line 665
;665:		{
line 666
;666:			BG_ForcePowerDrain( pm->ps, FP_LEVITATION, 5 );
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 667
;667:			if (pm->ps->fd.forcePowerLevel[FP_LEVITATION] >= FORCE_LEVEL_2)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LTI4 $261
line 668
;668:			{
line 669
;669:				pm->ps->fd.forcePowerDebounce[FP_LEVITATION] = pm->cmd.serverTime + 300;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 670
;670:			}
ADDRGP4 $262
JUMPV
LABELV $261
line 672
;671:			else
;672:			{
line 673
;673:				pm->ps->fd.forcePowerDebounce[FP_LEVITATION] = pm->cmd.serverTime + 200;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 674
;674:			}
LABELV $262
line 675
;675:		}
LABELV $259
line 676
;676:	}
LABELV $257
line 678
;677:
;678:	if (pm->ps->forceJumpFlip)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $263
line 679
;679:	{ //Forced jump anim
line 680
;680:		int anim = BOTH_FORCEINAIR1;
ADDRLP4 16
CNSTI4 870
ASGNI4
line 681
;681:		int	parts = SETANIM_BOTH;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 683
;682:
;683:		if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $265
line 684
;684:		{
line 685
;685:			anim = BOTH_FLIP_F;
ADDRLP4 16
CNSTI4 881
ASGNI4
line 686
;686:		}
ADDRGP4 $266
JUMPV
LABELV $265
line 687
;687:		else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $267
line 688
;688:		{
line 689
;689:			anim = BOTH_FLIP_B;
ADDRLP4 16
CNSTI4 882
ASGNI4
line 690
;690:		}
ADDRGP4 $268
JUMPV
LABELV $267
line 691
;691:		else if ( pm->cmd.rightmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $269
line 692
;692:		{
line 693
;693:			anim = BOTH_FLIP_R;
ADDRLP4 16
CNSTI4 884
ASGNI4
line 694
;694:		}
ADDRGP4 $270
JUMPV
LABELV $269
line 695
;695:		else if ( pm->cmd.rightmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $271
line 696
;696:		{
line 697
;697:			anim = BOTH_FLIP_L;
ADDRLP4 16
CNSTI4 883
ASGNI4
line 698
;698:		}
LABELV $271
LABELV $270
LABELV $268
LABELV $266
line 699
;699:		if ( pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $273
line 700
;700:		{//FIXME: really only care if we're in a saber attack anim...
line 701
;701:			parts = SETANIM_LEGS;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 702
;702:		}
LABELV $273
line 704
;703:
;704:		PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150 );
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 705
;705:		pm->ps->forceJumpFlip = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 706
;706:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $244
JUMPV
LABELV $263
line 709
;707:	}
;708:#if METROID_JUMP
;709:	if ( pm->waterlevel < 2 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
GEI4 $275
line 710
;710:	{
line 711
;711:		if ( pm->ps->gravity > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
LEI4 $277
line 712
;712:		{//can't do this in zero-G
line 713
;713:			if ( PM_ForceJumpingUp() )
ADDRLP4 16
ADDRGP4 PM_ForceJumpingUp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $279
line 714
;714:			{//holding jump in air
line 715
;715:				float curHeight = pm->ps->origin[2] - pm->ps->fd.forceJumpZStart;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
SUBF4
ASGNF4
line 717
;716:				//check for max force jump level and cap off & cut z vel
;717:				if ( ( curHeight<=forceJumpHeight[0] ||//still below minimum jump height
ADDRLP4 20
INDIRF4
ADDRGP4 forceJumpHeight
INDIRF4
LEF4 $283
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
EQI4 $281
ADDRLP4 28
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
LTI4 $281
LABELV $283
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpHeight
ADDP4
INDIRF4
GEF4 $281
ADDRLP4 32
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
EQF4 $281
line 721
;718:						(pm->ps->fd.forcePower&&pm->cmd.upmove>=10) ) &&////still have force power available and still trying to jump up 
;719:					curHeight < forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]] &&
;720:					pm->ps->fd.forceJumpZStart)//still below maximum jump height
;721:				{//can still go up
line 722
;722:					if ( curHeight > forceJumpHeight[0] )
ADDRLP4 20
INDIRF4
ADDRGP4 forceJumpHeight
INDIRF4
LEF4 $284
line 723
;723:					{//passed normal jump height  *2?
line 724
;724:						if ( !(pm->ps->fd.forcePowersActive&(1<<FP_LEVITATION)) )//haven't started forcejump yet
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $286
line 725
;725:						{
line 727
;726:							//start force jump
;727:							pm->ps->fd.forcePowersActive |= (1<<FP_LEVITATION);
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 728
;728:							pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 730
;729:							//play flip
;730:							if ((pm->cmd.forwardmove || pm->cmd.rightmove) && //pushing in a dir
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $290
ADDRLP4 40
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
EQI4 $288
LABELV $290
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 881
EQI4 $288
ADDRLP4 48
INDIRI4
CNSTI4 882
EQI4 $288
ADDRLP4 48
INDIRI4
CNSTI4 884
EQI4 $288
ADDRLP4 48
INDIRI4
CNSTI4 883
EQI4 $288
line 735
;731:								(pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_FLIP_F &&//not already flipping
;732:								(pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_FLIP_B &&
;733:								(pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_FLIP_R &&
;734:								(pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_FLIP_L )
;735:							{ 
line 736
;736:								int anim = BOTH_FORCEINAIR1;
ADDRLP4 52
CNSTI4 870
ASGNI4
line 737
;737:								int	parts = SETANIM_BOTH;
ADDRLP4 56
CNSTI4 3
ASGNI4
line 739
;738:
;739:								if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $291
line 740
;740:								{
line 741
;741:									anim = BOTH_FLIP_F;
ADDRLP4 52
CNSTI4 881
ASGNI4
line 742
;742:								}
ADDRGP4 $292
JUMPV
LABELV $291
line 743
;743:								else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $293
line 744
;744:								{
line 745
;745:									anim = BOTH_FLIP_B;
ADDRLP4 52
CNSTI4 882
ASGNI4
line 746
;746:								}
ADDRGP4 $294
JUMPV
LABELV $293
line 747
;747:								else if ( pm->cmd.rightmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $295
line 748
;748:								{
line 749
;749:									anim = BOTH_FLIP_R;
ADDRLP4 52
CNSTI4 884
ASGNI4
line 750
;750:								}
ADDRGP4 $296
JUMPV
LABELV $295
line 751
;751:								else if ( pm->cmd.rightmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $297
line 752
;752:								{
line 753
;753:									anim = BOTH_FLIP_L;
ADDRLP4 52
CNSTI4 883
ASGNI4
line 754
;754:								}
LABELV $297
LABELV $296
LABELV $294
LABELV $292
line 755
;755:								if ( pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $299
line 756
;756:								{
line 757
;757:									parts = SETANIM_LEGS;
ADDRLP4 56
CNSTI4 2
ASGNI4
line 758
;758:								}
LABELV $299
line 760
;759:
;760:								PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150 );
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 761
;761:							}
ADDRGP4 $287
JUMPV
LABELV $288
line 762
;762:							else if ( pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $287
line 763
;763:							{
line 765
;764:								vec3_t facingFwd, facingRight, facingAngles;
;765:								int	anim = -1;
ADDRLP4 52
CNSTI4 -1
ASGNI4
line 768
;766:								float dotR, dotF;
;767:								
;768:								VectorSet(facingAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 80
CNSTF4 0
ASGNF4
ADDRLP4 80+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 80+8
CNSTF4 0
ASGNF4
line 770
;769:
;770:								AngleVectors( facingAngles, facingFwd, facingRight, NULL );
ADDRLP4 80
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 68
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 771
;771:								dotR = DotProduct( facingRight, pm->ps->velocity );
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 68
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 68+4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 68+8
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 772
;772:								dotF = DotProduct( facingFwd, pm->ps->velocity );
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
ADDRLP4 56
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 56+4
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 56+8
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 774
;773:
;774:								if ( fabs(dotR) > fabs(dotF) * 1.5 )
ADDRLP4 92
INDIRF4
ARGF4
ADDRLP4 108
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 112
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 108
INDIRF4
CNSTF4 1069547520
ADDRLP4 112
INDIRF4
MULF4
LEF4 $309
line 775
;775:								{
line 776
;776:									if ( dotR > 150 )
ADDRLP4 92
INDIRF4
CNSTF4 1125515264
LEF4 $311
line 777
;777:									{
line 778
;778:										anim = BOTH_FORCEJUMPRIGHT1;
ADDRLP4 52
CNSTI4 878
ASGNI4
line 779
;779:									}
ADDRGP4 $310
JUMPV
LABELV $311
line 780
;780:									else if ( dotR < -150 )
ADDRLP4 92
INDIRF4
CNSTF4 3272998912
GEF4 $310
line 781
;781:									{
line 782
;782:										anim = BOTH_FORCEJUMPLEFT1;
ADDRLP4 52
CNSTI4 875
ASGNI4
line 783
;783:									}
line 784
;784:								}
ADDRGP4 $310
JUMPV
LABELV $309
line 786
;785:								else
;786:								{
line 787
;787:									if ( dotF > 150 )
ADDRLP4 96
INDIRF4
CNSTF4 1125515264
LEF4 $315
line 788
;788:									{
line 789
;789:										anim = BOTH_FORCEJUMP1;
ADDRLP4 52
CNSTI4 869
ASGNI4
line 790
;790:									}
ADDRGP4 $316
JUMPV
LABELV $315
line 791
;791:									else if ( dotF < -150 )
ADDRLP4 96
INDIRF4
CNSTF4 3272998912
GEF4 $317
line 792
;792:									{
line 793
;793:										anim = BOTH_FORCEJUMPBACK1;
ADDRLP4 52
CNSTI4 872
ASGNI4
line 794
;794:									}
LABELV $317
LABELV $316
line 795
;795:								}
LABELV $310
line 796
;796:								if ( anim != -1 )
ADDRLP4 52
INDIRI4
CNSTI4 -1
EQI4 $287
line 797
;797:								{
line 798
;798:									int parts = SETANIM_BOTH;
ADDRLP4 116
CNSTI4 3
ASGNI4
line 799
;799:									if ( pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $321
line 800
;800:									{//FIXME: really only care if we're in a saber attack anim...
line 801
;801:										parts = SETANIM_LEGS;
ADDRLP4 116
CNSTI4 2
ASGNI4
line 802
;802:									}
LABELV $321
line 804
;803:
;804:									PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150 );
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 805
;805:								}
line 806
;806:							}
line 807
;807:						}
ADDRGP4 $287
JUMPV
LABELV $286
line 809
;808:						else
;809:						{ //jump is already active (the anim has started)
line 810
;810:							if ( pm->ps->legsTimer < 1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
GEI4 $323
line 811
;811:							{//not in the middle of a legsAnim
line 812
;812:								int anim = (pm->ps->legsAnim&~ANIM_TOGGLEBIT);
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 813
;813:								int newAnim = -1;
ADDRLP4 36
CNSTI4 -1
ASGNI4
line 814
;814:								switch ( anim )
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 48
CNSTI4 869
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $327
ADDRLP4 44
INDIRI4
CNSTI4 872
EQI4 $328
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $325
LABELV $331
ADDRLP4 52
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 875
EQI4 $329
ADDRLP4 52
INDIRI4
CNSTI4 878
EQI4 $330
ADDRGP4 $325
JUMPV
line 815
;815:								{
LABELV $327
line 817
;816:								case BOTH_FORCEJUMP1:
;817:									newAnim = BOTH_FORCELAND1;//BOTH_FORCEINAIR1;
ADDRLP4 36
CNSTI4 871
ASGNI4
line 818
;818:									break;
ADDRGP4 $326
JUMPV
LABELV $328
line 820
;819:								case BOTH_FORCEJUMPBACK1:
;820:									newAnim = BOTH_FORCELANDBACK1;//BOTH_FORCEINAIRBACK1;
ADDRLP4 36
CNSTI4 874
ASGNI4
line 821
;821:									break;
ADDRGP4 $326
JUMPV
LABELV $329
line 823
;822:								case BOTH_FORCEJUMPLEFT1:
;823:									newAnim = BOTH_FORCELANDLEFT1;//BOTH_FORCEINAIRLEFT1;
ADDRLP4 36
CNSTI4 877
ASGNI4
line 824
;824:									break;
ADDRGP4 $326
JUMPV
LABELV $330
line 826
;825:								case BOTH_FORCEJUMPRIGHT1:
;826:									newAnim = BOTH_FORCELANDRIGHT1;//BOTH_FORCEINAIRRIGHT1;
ADDRLP4 36
CNSTI4 880
ASGNI4
line 827
;827:									break;
LABELV $325
LABELV $326
line 829
;828:								}
;829:								if ( newAnim != -1 )
ADDRLP4 36
INDIRI4
CNSTI4 -1
EQI4 $332
line 830
;830:								{
line 831
;831:									int parts = SETANIM_BOTH;
ADDRLP4 56
CNSTI4 3
ASGNI4
line 832
;832:									if ( pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $334
line 833
;833:									{
line 834
;834:										parts = SETANIM_LEGS;
ADDRLP4 56
CNSTI4 2
ASGNI4
line 835
;835:									}
LABELV $334
line 837
;836:
;837:									PM_SetAnim( parts, newAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150 );
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 838
;838:								}
LABELV $332
line 839
;839:							}
LABELV $323
line 840
;840:						}
LABELV $287
line 841
;841:					}
LABELV $284
line 844
;842:
;843:					//need to scale this down, start with height velocity (based on max force jump height) and scale down to regular jump vel
;844:					pm->ps->velocity[2] = (forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]]-curHeight)/forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]]*forceJumpStrength[pm->ps->fd.forcePowerLevel[FP_LEVITATION]];//JUMP_VELOCITY;
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 44
ADDRLP4 40
INDIRI4
ADDRGP4 forceJumpHeight
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 44
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ADDRLP4 44
INDIRF4
DIVF4
ADDRLP4 40
INDIRI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
MULF4
ASGNF4
line 845
;845:					pm->ps->velocity[2] /= 10;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1092616192
DIVF4
ASGNF4
line 846
;846:					pm->ps->velocity[2] += JUMP_VELOCITY;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1130430464
ADDF4
ASGNF4
line 847
;847:					pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 848
;848:				}
ADDRGP4 $282
JUMPV
LABELV $281
line 849
;849:				else if ( curHeight > forceJumpHeight[0] && curHeight < forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]] - forceJumpHeight[0] )
ADDRLP4 36
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 40
ADDRGP4 forceJumpHeight
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 36
INDIRF4
ADDRLP4 44
INDIRF4
LEF4 $336
ADDRLP4 36
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
ADDP4
INDIRF4
ADDRLP4 44
INDIRF4
SUBF4
GEF4 $336
line 850
;850:				{//still have some headroom, don't totally stop it
line 851
;851:					if ( pm->ps->velocity[2] > JUMP_VELOCITY )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1130430464
LEF4 $337
line 852
;852:					{
line 853
;853:						pm->ps->velocity[2] = JUMP_VELOCITY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1130430464
ASGNF4
line 854
;854:					}
line 855
;855:				}
ADDRGP4 $337
JUMPV
LABELV $336
line 857
;856:				else
;857:				{
line 861
;858:					//pm->ps->velocity[2] = 0;
;859:					//rww - changed for the sake of balance in multiplayer
;860:
;861:					if ( pm->ps->velocity[2] > JUMP_VELOCITY )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1130430464
LEF4 $340
line 862
;862:					{
line 863
;863:						pm->ps->velocity[2] = JUMP_VELOCITY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1130430464
ASGNF4
line 864
;864:					}
LABELV $340
line 865
;865:				}
LABELV $337
LABELV $282
line 866
;866:				pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 867
;867:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $279
line 869
;868:			}
;869:		}
LABELV $277
line 870
;870:	}
LABELV $275
line 875
;871:
;872:#endif
;873:
;874:	//Not jumping
;875:	if ( pm->cmd.upmove < 10 && pm->ps->groundEntityNum != ENTITYNUM_NONE) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $342
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $342
line 876
;876:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $342
line 880
;877:	}
;878:
;879:	// must wait for jump to be released
;880:	if ( pm->ps->pm_flags & PMF_JUMP_HELD ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $344
line 881
;881:	{
line 883
;882:		// clear upmove so cmdscale doesn't lower running speed
;883:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 884
;884:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $344
line 887
;885:	}
;886:
;887:	if ( pm->ps->gravity <= 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
GTI4 $346
line 888
;888:	{//in low grav, you push in the dir you're facing as long as there is something behind you to shove off of
line 892
;889:		vec3_t	forward, back;
;890:		trace_t	trace;
;891:
;892:		AngleVectors( pm->ps->viewangles, forward, NULL, NULL );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 1124
CNSTP4 0
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 893
;893:		VectorMA( pm->ps->origin, -8, forward, back );
ADDRLP4 1128
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1132
CNSTF4 3238002688
ASGNF4
ADDRLP4 32
ADDRLP4 1128
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1128
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRLP4 20+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3238002688
ADDRLP4 20+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 894
;894:		pm->trace( &trace, pm->ps->origin, pm->mins, pm->maxs, back, pm->ps->clientNum, pm->tracemask );
ADDRLP4 44
ARGP4
ADDRLP4 1136
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1136
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 1140
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1136
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 1136
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 896
;895:
;896:		if ( trace.fraction <= 1.0f )
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
GTF4 $352
line 897
;897:		{
line 898
;898:			VectorMA( pm->ps->velocity, JUMP_VELOCITY*2, forward, pm->ps->velocity );
ADDRLP4 1144
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1144
INDIRP4
ADDRLP4 1144
INDIRP4
INDIRF4
CNSTF4 1138819072
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1148
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1148
INDIRP4
ADDRLP4 1148
INDIRP4
INDIRF4
CNSTF4 1138819072
ADDRLP4 20+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1152
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1152
INDIRP4
ADDRLP4 1152
INDIRP4
INDIRF4
CNSTF4 1138819072
ADDRLP4 20+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 899
;899:			PM_SetAnim(SETANIM_LEGS,BOTH_FORCEJUMP1,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_RESTART, 150);
CNSTI4 2
ARGI4
CNSTI4 869
ARGI4
CNSTI4 7
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 900
;900:		}//else no surf close enough to push off of
LABELV $352
line 901
;901:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 902
;902:	}
ADDRGP4 $347
JUMPV
LABELV $346
line 903
;903:	else if ( pm->cmd.upmove > 0 && pm->waterlevel < 2 &&
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
LEI4 $357
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $357
ADDRLP4 32
ADDRLP4 20
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $357
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $357
ADDRLP4 32
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $357
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $357
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 44
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $357
line 909
;904:		pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_0 &&
;905:		!(pm->ps->pm_flags&PMF_JUMP_HELD) &&
;906:		pm->ps->weapon == WP_SABER &&
;907:		!BG_HasYsalamiri(pm->gametype, pm->ps) &&
;908:		BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION) )
;909:	{
line 910
;910:		if ( pm->ps->groundEntityNum != ENTITYNUM_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $359
line 911
;911:		{//on the ground
line 913
;912:			//check for left-wall and right-wall special jumps
;913:			int anim = -1;
ADDRLP4 48
CNSTI4 -1
ASGNI4
line 914
;914:			float	vertPush = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 915
;915:			if ( pm->cmd.rightmove > 0 && pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1 )
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $361
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $361
line 916
;916:			{//strafing right
line 917
;917:				if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $363
line 918
;918:				{//wall-run
line 919
;919:					vertPush = forceJumpStrength[FORCE_LEVEL_2]/2.0f;
ADDRLP4 52
ADDRGP4 forceJumpStrength+8
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 920
;920:					anim = BOTH_WALL_RUN_RIGHT;
ADDRLP4 48
CNSTI4 915
ASGNI4
line 921
;921:				}
ADDRGP4 $362
JUMPV
LABELV $363
line 922
;922:				else if ( pm->cmd.forwardmove == 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $362
line 923
;923:				{//wall-flip
line 924
;924:					vertPush = forceJumpStrength[FORCE_LEVEL_2]/2.25f;
ADDRLP4 52
ADDRGP4 forceJumpStrength+8
INDIRF4
CNSTF4 1074790400
DIVF4
ASGNF4
line 925
;925:					anim = BOTH_WALL_FLIP_RIGHT;
ADDRLP4 48
CNSTI4 921
ASGNI4
line 926
;926:				}
line 927
;927:			}
ADDRGP4 $362
JUMPV
LABELV $361
line 928
;928:			else if ( pm->cmd.rightmove < 0 && pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1 )
ADDRLP4 60
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $369
ADDRLP4 60
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $369
line 929
;929:			{//strafing left
line 930
;930:				if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $371
line 931
;931:				{//wall-run
line 932
;932:					vertPush = forceJumpStrength[FORCE_LEVEL_2]/2.0f;
ADDRLP4 52
ADDRGP4 forceJumpStrength+8
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 933
;933:					anim = BOTH_WALL_RUN_LEFT;
ADDRLP4 48
CNSTI4 918
ASGNI4
line 934
;934:				}
ADDRGP4 $370
JUMPV
LABELV $371
line 935
;935:				else if ( pm->cmd.forwardmove == 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $370
line 936
;936:				{//wall-flip
line 937
;937:					vertPush = forceJumpStrength[FORCE_LEVEL_2]/2.25f;
ADDRLP4 52
ADDRGP4 forceJumpStrength+8
INDIRF4
CNSTF4 1074790400
DIVF4
ASGNF4
line 938
;938:					anim = BOTH_WALL_FLIP_LEFT;
ADDRLP4 48
CNSTI4 922
ASGNI4
line 939
;939:				}
line 940
;940:			}
ADDRGP4 $370
JUMPV
LABELV $369
line 941
;941:			else if ( pm->cmd.forwardmove < 0 && !(pm->cmd.buttons&BUTTON_ATTACK) )
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
GEI4 $377
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 68
INDIRI4
NEI4 $377
line 942
;942:			{//backflip
line 943
;943:				vertPush = JUMP_VELOCITY;
ADDRLP4 52
CNSTF4 1130430464
ASGNF4
line 944
;944:				anim = BOTH_FLIP_BACK1;//PM_PickAnim( BOTH_FLIP_BACK1, BOTH_FLIP_BACK3 );
ADDRLP4 48
CNSTI4 910
ASGNI4
line 945
;945:			}
LABELV $377
LABELV $370
LABELV $362
line 947
;946:
;947:			vertPush += 128; //give them an extra shove
ADDRLP4 52
ADDRLP4 52
INDIRF4
CNSTF4 1124073472
ADDF4
ASGNF4
line 949
;948:
;949:			if ( anim != -1 )
ADDRLP4 48
INDIRI4
CNSTI4 -1
EQI4 $360
line 950
;950:			{
line 954
;951:				vec3_t fwd, right, traceto, mins, maxs, fwdAngles;
;952:				vec3_t	idealNormal;
;953:				trace_t	trace;
;954:				qboolean doTrace = qfalse;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 955
;955:				int contents = MASK_PLAYERSOLID;
ADDRLP4 76
CNSTI4 273
ASGNI4
line 957
;956:
;957:				VectorSet(mins, pm->mins[0],pm->mins[1],0);
ADDRLP4 1244
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1184
ADDRLP4 1244
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1184+4
ADDRLP4 1244
INDIRP4
CNSTI4 192
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1184+8
CNSTF4 0
ASGNF4
line 958
;958:				VectorSet(maxs, pm->maxs[0],pm->maxs[1],24);
ADDRLP4 1248
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1196
ADDRLP4 1248
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1196+4
ADDRLP4 1248
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1196+8
CNSTF4 1103101952
ASGNF4
line 959
;959:				VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 1172
CNSTF4 0
ASGNF4
ADDRLP4 1172+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1172+8
CNSTF4 0
ASGNF4
line 961
;960:
;961:				memset(&trace, 0, sizeof(trace)); //to shut the compiler up
ADDRLP4 80
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 963
;962:
;963:				AngleVectors( fwdAngles, fwd, right, NULL );
ADDRLP4 1172
ARGP4
ADDRLP4 1232
ARGP4
ADDRLP4 1220
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 966
;964:
;965:				//trace-check for a wall, if necc.
;966:				switch ( anim )
ADDRLP4 1252
ADDRLP4 48
INDIRI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 915
LTI4 $387
ADDRLP4 1252
INDIRI4
CNSTI4 922
GTI4 $404
ADDRLP4 1252
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $405-3660
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $405
address $394
address $387
address $387
address $389
address $387
address $387
address $394
address $389
code
LABELV $404
ADDRLP4 48
INDIRI4
CNSTI4 944
EQI4 $399
ADDRGP4 $387
JUMPV
line 967
;967:				{
LABELV $389
line 971
;968:				case BOTH_WALL_FLIP_LEFT:
;969:					//NOTE: purposely falls through to next case!
;970:				case BOTH_WALL_RUN_LEFT:
;971:					doTrace = qtrue;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 972
;972:					VectorMA( pm->ps->origin, -16, right, traceto );
ADDRLP4 1256
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1260
CNSTF4 3246391296
ASGNF4
ADDRLP4 1208
ADDRLP4 1256
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1260
INDIRF4
ADDRLP4 1220
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1208+4
ADDRLP4 1256
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1260
INDIRF4
ADDRLP4 1220+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1208+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 1220+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 973
;973:					break;
ADDRGP4 $388
JUMPV
LABELV $394
line 978
;974:
;975:				case BOTH_WALL_FLIP_RIGHT:
;976:					//NOTE: purposely falls through to next case!
;977:				case BOTH_WALL_RUN_RIGHT:
;978:					doTrace = qtrue;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 979
;979:					VectorMA( pm->ps->origin, 16, right, traceto );
ADDRLP4 1264
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1268
CNSTF4 1098907648
ASGNF4
ADDRLP4 1208
ADDRLP4 1264
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1268
INDIRF4
ADDRLP4 1220
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1208+4
ADDRLP4 1264
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1268
INDIRF4
ADDRLP4 1220+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1208+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 1220+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 980
;980:					break;
ADDRGP4 $388
JUMPV
LABELV $399
line 983
;981:
;982:				case BOTH_WALL_FLIP_BACK1:
;983:					doTrace = qtrue;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 984
;984:					VectorMA( pm->ps->origin, 16, fwd, traceto );
ADDRLP4 1272
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1276
CNSTF4 1098907648
ASGNF4
ADDRLP4 1208
ADDRLP4 1272
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1276
INDIRF4
ADDRLP4 1232
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1208+4
ADDRLP4 1272
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1276
INDIRF4
ADDRLP4 1232+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1208+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 1232+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 985
;985:					break;
LABELV $387
LABELV $388
line 988
;986:				}
;987:
;988:				if ( doTrace )
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $407
line 989
;989:				{
line 990
;990:					pm->trace( &trace, pm->ps->origin, mins, maxs, traceto, pm->ps->clientNum, contents );
ADDRLP4 80
ARGP4
ADDRLP4 1256
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1260
ADDRLP4 1256
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1184
ARGP4
ADDRLP4 1196
ARGP4
ADDRLP4 1208
ARGP4
ADDRLP4 1260
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 1256
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 991
;991:					VectorSubtract( pm->ps->origin, traceto, idealNormal );
ADDRLP4 1264
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1160
ADDRLP4 1264
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1208
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1160+4
ADDRLP4 1264
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1208+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1160+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1208+8
INDIRF4
SUBF4
ASGNF4
line 992
;992:					VectorNormalize( idealNormal );
ADDRLP4 1160
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 993
;993:				}
LABELV $407
line 995
;994:
;995:				if ( !doTrace || (trace.fraction < 1.0f && (trace.entityNum < MAX_CLIENTS || DotProduct(trace.plane.normal,idealNormal) > 0.7)) )
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $425
ADDRLP4 80+8
INDIRF4
CNSTF4 1065353216
GEF4 $360
ADDRLP4 80+52
INDIRI4
CNSTI4 32
LTI4 $425
ADDRLP4 80+24
INDIRF4
ADDRLP4 1160
INDIRF4
MULF4
ADDRLP4 80+24+4
INDIRF4
ADDRLP4 1160+4
INDIRF4
MULF4
ADDF4
ADDRLP4 80+24+8
INDIRF4
ADDRLP4 1160+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
LEF4 $360
LABELV $425
line 996
;996:				{//there is a wall there.. or hit a client
line 999
;997:					int parts;
;998:					//move me to side
;999:					if ( anim == BOTH_WALL_FLIP_LEFT )
ADDRLP4 48
INDIRI4
CNSTI4 922
NEI4 $426
line 1000
;1000:					{
line 1001
;1001:						pm->ps->velocity[0] = pm->ps->velocity[1] = 0;
ADDRLP4 1260
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1264
CNSTF4 0
ASGNF4
ADDRLP4 1260
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1264
INDIRF4
ASGNF4
ADDRLP4 1260
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1264
INDIRF4
ASGNF4
line 1002
;1002:						VectorMA( pm->ps->velocity, 150, right, pm->ps->velocity );
ADDRLP4 1268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1268
INDIRP4
ADDRLP4 1268
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 1220
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1272
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1272
INDIRP4
ADDRLP4 1272
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 1220+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1276
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1276
INDIRP4
ADDRLP4 1276
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 1220+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1003
;1003:					}
ADDRGP4 $427
JUMPV
LABELV $426
line 1004
;1004:					else if ( anim == BOTH_WALL_FLIP_RIGHT )
ADDRLP4 48
INDIRI4
CNSTI4 921
NEI4 $430
line 1005
;1005:					{
line 1006
;1006:						pm->ps->velocity[0] = pm->ps->velocity[1] = 0;
ADDRLP4 1260
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1264
CNSTF4 0
ASGNF4
ADDRLP4 1260
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1264
INDIRF4
ASGNF4
ADDRLP4 1260
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1264
INDIRF4
ASGNF4
line 1007
;1007:						VectorMA( pm->ps->velocity, -150, right, pm->ps->velocity );
ADDRLP4 1268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1268
INDIRP4
ADDRLP4 1268
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1220
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1272
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1272
INDIRP4
ADDRLP4 1272
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1220+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1276
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1276
INDIRP4
ADDRLP4 1276
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1220+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1008
;1008:					}
ADDRGP4 $431
JUMPV
LABELV $430
line 1009
;1009:					else if ( anim == BOTH_FLIP_BACK1 
ADDRLP4 1260
ADDRLP4 48
INDIRI4
ASGNI4
ADDRLP4 1260
INDIRI4
CNSTI4 910
EQI4 $438
ADDRLP4 1260
INDIRI4
CNSTI4 911
EQI4 $438
ADDRLP4 1260
INDIRI4
CNSTI4 912
EQI4 $438
ADDRLP4 1260
INDIRI4
CNSTI4 944
NEI4 $434
LABELV $438
line 1013
;1010:						|| anim == BOTH_FLIP_BACK2 
;1011:						|| anim == BOTH_FLIP_BACK3 
;1012:						|| anim == BOTH_WALL_FLIP_BACK1 )
;1013:					{
line 1014
;1014:						pm->ps->velocity[0] = pm->ps->velocity[1] = 0;
ADDRLP4 1264
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1268
CNSTF4 0
ASGNF4
ADDRLP4 1264
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1268
INDIRF4
ASGNF4
ADDRLP4 1264
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1268
INDIRF4
ASGNF4
line 1015
;1015:						VectorMA( pm->ps->velocity, -150, fwd, pm->ps->velocity );
ADDRLP4 1272
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1272
INDIRP4
ADDRLP4 1272
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1232
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1276
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1276
INDIRP4
ADDRLP4 1276
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1232+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1280
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1280
INDIRP4
ADDRLP4 1280
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1232+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1016
;1016:					}
LABELV $434
LABELV $431
LABELV $427
line 1018
;1017:
;1018:					if ( doTrace && anim != BOTH_WALL_RUN_LEFT && anim != BOTH_WALL_RUN_RIGHT )
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $441
ADDRLP4 1264
ADDRLP4 48
INDIRI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 918
EQI4 $441
ADDRLP4 1264
INDIRI4
CNSTI4 915
EQI4 $441
line 1019
;1019:					{
line 1020
;1020:						if (trace.entityNum < MAX_CLIENTS)
ADDRLP4 80+52
INDIRI4
CNSTI4 32
GEI4 $443
line 1021
;1021:						{
line 1022
;1022:							pm->ps->forceKickFlip = trace.entityNum+1; //let the server know that this person gets kicked by this client
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1292
ADDP4
ADDRLP4 80+52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1023
;1023:						}
LABELV $443
line 1024
;1024:					}
LABELV $441
line 1027
;1025:
;1026:					//up
;1027:					if ( vertPush )
ADDRLP4 52
INDIRF4
CNSTF4 0
EQF4 $447
line 1028
;1028:					{
line 1029
;1029:						pm->ps->velocity[2] = vertPush;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 1030
;1030:						pm->ps->fd.forcePowersActive |= (1 << FP_LEVITATION);
ADDRLP4 1268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 1268
INDIRP4
ADDRLP4 1268
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1031
;1031:					}
LABELV $447
line 1033
;1032:					//animate me
;1033:					parts = SETANIM_LEGS;
ADDRLP4 1256
CNSTI4 2
ASGNI4
line 1034
;1034:					if ( anim == BOTH_BUTTERFLY_LEFT )
ADDRLP4 48
INDIRI4
CNSTI4 913
NEI4 $449
line 1035
;1035:					{
line 1036
;1036:						parts = SETANIM_BOTH;
ADDRLP4 1256
CNSTI4 3
ASGNI4
line 1037
;1037:						pm->cmd.buttons&=~BUTTON_ATTACK;
ADDRLP4 1268
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1268
INDIRP4
ADDRLP4 1268
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1038
;1038:						pm->ps->saberMove = LS_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 1039
;1039:					}
ADDRGP4 $450
JUMPV
LABELV $449
line 1040
;1040:					else if ( !pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
NEI4 $451
line 1041
;1041:					{
line 1042
;1042:						parts = SETANIM_BOTH;
ADDRLP4 1256
CNSTI4 3
ASGNI4
line 1043
;1043:					}
LABELV $451
LABELV $450
line 1044
;1044:					PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0 );
ADDRLP4 1256
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1045
;1045:					if ( anim == BOTH_BUTTERFLY_LEFT )
ADDRLP4 48
INDIRI4
CNSTI4 913
NEI4 $453
line 1046
;1046:					{
line 1047
;1047:						pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 1268
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1268
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1268
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1048
;1048:					}
LABELV $453
line 1049
;1049:					PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1050
;1050:					pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 1268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1268
INDIRP4
ADDRLP4 1268
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1051
;1051:					pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1052
;1052:					pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1053
;1053:				}
line 1054
;1054:			}
line 1055
;1055:		}
ADDRGP4 $360
JUMPV
LABELV $359
line 1057
;1056:		else 
;1057:		{//in the air
line 1058
;1058:			int legsAnim = (pm->ps->legsAnim&~ANIM_TOGGLEBIT);
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1059
;1059:			if ( legsAnim == BOTH_WALL_RUN_LEFT || legsAnim == BOTH_WALL_RUN_RIGHT )
ADDRLP4 52
ADDRLP4 48
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 918
EQI4 $457
ADDRLP4 52
INDIRI4
CNSTI4 915
NEI4 $455
LABELV $457
line 1060
;1060:			{//running on a wall
line 1063
;1061:				vec3_t right, traceto, mins, maxs, fwdAngles;
;1062:				trace_t	trace;
;1063:				int		anim = -1;
ADDRLP4 56
CNSTI4 -1
ASGNI4
line 1065
;1064:
;1065:				VectorSet(mins, pm->mins[0], pm->mins[0], 0);
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 72
ADDRLP4 1200
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 72+4
ADDRLP4 1200
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 72+8
CNSTF4 0
ASGNF4
line 1066
;1066:				VectorSet(maxs, pm->maxs[0], pm->maxs[0], 24);
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 84
ADDRLP4 1204
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 1204
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 84+8
CNSTF4 1103101952
ASGNF4
line 1067
;1067:				VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 60+8
CNSTF4 0
ASGNF4
line 1069
;1068:
;1069:				AngleVectors( fwdAngles, NULL, right, NULL );
ADDRLP4 60
ARGP4
ADDRLP4 1208
CNSTP4 0
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1071
;1070:
;1071:				if ( legsAnim == BOTH_WALL_RUN_LEFT )
ADDRLP4 48
INDIRI4
CNSTI4 918
NEI4 $464
line 1072
;1072:				{
line 1073
;1073:					if ( pm->ps->legsTimer > 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 400
LEI4 $465
line 1074
;1074:					{//not at the end of the anim
line 1075
;1075:						float animLen = PM_AnimLength( 0, (animNumber_t)BOTH_WALL_RUN_LEFT );
CNSTI4 0
ARGI4
CNSTI4 918
ARGI4
ADDRLP4 1216
ADDRGP4 PM_AnimLength
CALLI4
ASGNI4
ADDRLP4 1212
ADDRLP4 1216
INDIRI4
CVIF4 4
ASGNF4
line 1076
;1076:						if ( pm->ps->legsTimer < animLen - 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 1212
INDIRF4
CNSTF4 1137180672
SUBF4
GEF4 $465
line 1077
;1077:						{//not at start of anim
line 1078
;1078:							VectorMA( pm->ps->origin, -16, right, traceto );
ADDRLP4 1220
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1224
CNSTF4 3246391296
ASGNF4
ADDRLP4 108
ADDRLP4 1220
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108+4
ADDRLP4 1220
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
ADDRLP4 96+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 96+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1079
;1079:							anim = BOTH_WALL_RUN_LEFT_FLIP;
ADDRLP4 56
CNSTI4 919
ASGNI4
line 1080
;1080:						}
line 1081
;1081:					}
line 1082
;1082:				}
ADDRGP4 $465
JUMPV
LABELV $464
line 1083
;1083:				else if ( legsAnim == BOTH_WALL_RUN_RIGHT )
ADDRLP4 48
INDIRI4
CNSTI4 915
NEI4 $474
line 1084
;1084:				{
line 1085
;1085:					if ( pm->ps->legsTimer > 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 400
LEI4 $476
line 1086
;1086:					{//not at the end of the anim
line 1087
;1087:						float animLen = PM_AnimLength( 0, (animNumber_t)BOTH_WALL_RUN_RIGHT );
CNSTI4 0
ARGI4
CNSTI4 915
ARGI4
ADDRLP4 1216
ADDRGP4 PM_AnimLength
CALLI4
ASGNI4
ADDRLP4 1212
ADDRLP4 1216
INDIRI4
CVIF4 4
ASGNF4
line 1088
;1088:						if ( pm->ps->legsTimer < animLen - 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 1212
INDIRF4
CNSTF4 1137180672
SUBF4
GEF4 $478
line 1089
;1089:						{//not at start of anim
line 1090
;1090:							VectorMA( pm->ps->origin, 16, right, traceto );
ADDRLP4 1220
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1224
CNSTF4 1098907648
ASGNF4
ADDRLP4 108
ADDRLP4 1220
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108+4
ADDRLP4 1220
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
ADDRLP4 96+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 96+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1091
;1091:							anim = BOTH_WALL_RUN_RIGHT_FLIP;
ADDRLP4 56
CNSTI4 916
ASGNI4
line 1092
;1092:						}
LABELV $478
line 1093
;1093:					}
LABELV $476
line 1094
;1094:				}
LABELV $474
LABELV $465
line 1095
;1095:				if ( anim != -1 )
ADDRLP4 56
INDIRI4
CNSTI4 -1
EQI4 $484
line 1096
;1096:				{
line 1097
;1097:					pm->trace( &trace, pm->ps->origin, mins, maxs, traceto, pm->ps->clientNum, CONTENTS_SOLID|CONTENTS_BODY );
ADDRLP4 120
ARGP4
ADDRLP4 1212
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1216
ADDRLP4 1212
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 1216
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 257
ARGI4
ADDRLP4 1212
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 1098
;1098:					if ( trace.fraction < 1.0f )
ADDRLP4 120+8
INDIRF4
CNSTF4 1065353216
GEF4 $486
line 1099
;1099:					{//flip off wall
line 1100
;1100:						int parts = 0;
ADDRLP4 1220
CNSTI4 0
ASGNI4
line 1102
;1101:
;1102:						if ( anim == BOTH_WALL_RUN_LEFT_FLIP )
ADDRLP4 56
INDIRI4
CNSTI4 919
NEI4 $489
line 1103
;1103:						{
line 1104
;1104:							pm->ps->velocity[0] *= 0.5f;
ADDRLP4 1224
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTF4 1056964608
ADDRLP4 1224
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1105
;1105:							pm->ps->velocity[1] *= 0.5f;
ADDRLP4 1228
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1228
INDIRP4
CNSTF4 1056964608
ADDRLP4 1228
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1106
;1106:							VectorMA( pm->ps->velocity, 150, right, pm->ps->velocity );
ADDRLP4 1232
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 96
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1236
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1236
INDIRP4
ADDRLP4 1236
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 96+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1240
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1240
INDIRP4
ADDRLP4 1240
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 96+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1107
;1107:						}
ADDRGP4 $490
JUMPV
LABELV $489
line 1108
;1108:						else if ( anim == BOTH_WALL_RUN_RIGHT_FLIP )
ADDRLP4 56
INDIRI4
CNSTI4 916
NEI4 $493
line 1109
;1109:						{
line 1110
;1110:							pm->ps->velocity[0] *= 0.5f;
ADDRLP4 1224
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTF4 1056964608
ADDRLP4 1224
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1111
;1111:							pm->ps->velocity[1] *= 0.5f;
ADDRLP4 1228
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1228
INDIRP4
CNSTF4 1056964608
ADDRLP4 1228
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1112
;1112:							VectorMA( pm->ps->velocity, -150, right, pm->ps->velocity );
ADDRLP4 1232
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 96
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1236
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1236
INDIRP4
ADDRLP4 1236
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 96+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1240
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1240
INDIRP4
ADDRLP4 1240
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 96+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1113
;1113:						}
LABELV $493
LABELV $490
line 1114
;1114:						parts = SETANIM_LEGS;
ADDRLP4 1220
CNSTI4 2
ASGNI4
line 1115
;1115:						if ( !pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
NEI4 $497
line 1116
;1116:						{
line 1117
;1117:							parts = SETANIM_BOTH;
ADDRLP4 1220
CNSTI4 3
ASGNI4
line 1118
;1118:						}
LABELV $497
line 1119
;1119:						PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0 );
ADDRLP4 1220
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1120
;1120:						pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1121
;1121:					}
LABELV $486
line 1122
;1122:				}
LABELV $484
line 1123
;1123:				if ( pm->cmd.upmove != 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $456
line 1124
;1124:				{//jump failed, so don't try to do normal jump code, just return
line 1125
;1125:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
line 1127
;1126:				}
;1127:			}
LABELV $455
line 1128
;1128:			else if ( pm->cmd.forwardmove > 0 //pushing forward
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $501
ADDRLP4 60
ADDRLP4 56
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $501
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $501
ADDRLP4 64
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 1117782016
GTF4 $501
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $501
line 1133
;1129:				&& pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1
;1130:				&& pm->ps->velocity[2] > 200
;1131:				&& PM_GroundDistance() <= 80 //unfortunately we do not have a happy ground timer like SP (this would use up more bandwidth if we wanted prediction workign right), so we'll just use the actual ground distance.
;1132:				&& !BG_InSpecialJump(pm->ps->legsAnim))
;1133:			{//run up wall, flip backwards
line 1138
;1134:				vec3_t fwd, traceto, mins, maxs, fwdAngles;
;1135:				trace_t	trace;
;1136:				vec3_t	idealNormal;
;1137:
;1138:				VectorSet(mins, pm->mins[0],pm->mins[1],pm->mins[2]);
ADDRLP4 1224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 96
ADDRLP4 1224
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 1224
INDIRP4
CNSTI4 192
ADDP4
INDIRF4
ASGNF4
ADDRLP4 96+8
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ASGNF4
line 1139
;1139:				VectorSet(maxs, pm->maxs[0],pm->maxs[1],pm->maxs[2]);
ADDRLP4 1228
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 108
ADDRLP4 1228
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ASGNF4
ADDRLP4 108+4
ADDRLP4 1228
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ASGNF4
ADDRLP4 108+8
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ASGNF4
line 1140
;1140:				VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 120
CNSTF4 0
ASGNF4
ADDRLP4 120+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 120+8
CNSTF4 0
ASGNF4
line 1142
;1141:
;1142:				AngleVectors( fwdAngles, fwd, NULL, NULL );
ADDRLP4 120
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 1232
CNSTP4 0
ASGNP4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1143
;1143:				VectorMA( pm->ps->origin, 32, fwd, traceto );
ADDRLP4 1236
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1240
CNSTF4 1107296256
ASGNF4
ADDRLP4 72
ADDRLP4 1236
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1240
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72+4
ADDRLP4 1236
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1240
INDIRF4
ADDRLP4 84+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 84+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1145
;1144:
;1145:				pm->trace( &trace, pm->ps->origin, mins, maxs, traceto, pm->ps->clientNum, MASK_PLAYERSOLID );//FIXME: clip brushes too?
ADDRLP4 144
ARGP4
ADDRLP4 1244
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1248
ADDRLP4 1244
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1248
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 1248
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRLP4 1244
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 1146
;1146:				VectorSubtract( pm->ps->origin, traceto, idealNormal );
ADDRLP4 1252
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 132
ADDRLP4 1252
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
ADDRLP4 132+4
ADDRLP4 1252
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 72+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 132+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 72+8
INDIRF4
SUBF4
ASGNF4
line 1147
;1147:				VectorNormalize( idealNormal );
ADDRLP4 132
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1149
;1148:				
;1149:				if ( trace.fraction < 1.0f )
ADDRLP4 144+8
INDIRF4
CNSTF4 1065353216
GEF4 $517
line 1150
;1150:				{//there is a wall there
line 1151
;1151:					int parts = SETANIM_LEGS;
ADDRLP4 1256
CNSTI4 2
ASGNI4
line 1153
;1152:
;1153:					pm->ps->velocity[0] = pm->ps->velocity[1] = 0;
ADDRLP4 1260
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1264
CNSTF4 0
ASGNF4
ADDRLP4 1260
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1264
INDIRF4
ASGNF4
ADDRLP4 1260
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1264
INDIRF4
ASGNF4
line 1154
;1154:					VectorMA( pm->ps->velocity, -150, fwd, pm->ps->velocity );
ADDRLP4 1268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1268
INDIRP4
ADDRLP4 1268
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1272
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1272
INDIRP4
ADDRLP4 1272
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 84+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1276
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1276
INDIRP4
ADDRLP4 1276
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 84+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1155
;1155:					pm->ps->velocity[2] += 128;
ADDRLP4 1280
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1280
INDIRP4
ADDRLP4 1280
INDIRP4
INDIRF4
CNSTF4 1124073472
ADDF4
ASGNF4
line 1157
;1156:
;1157:					if ( !pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
NEI4 $522
line 1158
;1158:					{
line 1159
;1159:						parts = SETANIM_BOTH;
ADDRLP4 1256
CNSTI4 3
ASGNI4
line 1160
;1160:					}
LABELV $522
line 1161
;1161:					PM_SetAnim( parts, BOTH_WALL_FLIP_BACK1, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0 );
ADDRLP4 1256
INDIRI4
ARGI4
CNSTI4 944
ARGI4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1163
;1162:
;1163:					pm->ps->legsTimer -= 600; //I force this anim to play to the end to prevent landing on your head and suddenly flipping over.
ADDRLP4 1284
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
ASGNP4
ADDRLP4 1284
INDIRP4
ADDRLP4 1284
INDIRP4
INDIRI4
CNSTI4 600
SUBI4
ASGNI4
line 1166
;1164:											  //It is a bit too long at the end though, so I'll just shorten it.
;1165:
;1166:					PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1167
;1167:					pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1168
;1168:					pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1169
;1169:					BG_ForcePowerDrain( pm->ps, FP_LEVITATION, 5 );
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1171
;1170:
;1171:					if (trace.entityNum < MAX_CLIENTS)
ADDRLP4 144+52
INDIRI4
CNSTI4 32
GEI4 $524
line 1172
;1172:					{
line 1173
;1173:						pm->ps->forceKickFlip = trace.entityNum+1; //let the server know that this person gets kicked by this client
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1292
ADDP4
ADDRLP4 144+52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1174
;1174:					}
LABELV $524
line 1175
;1175:				}
LABELV $517
line 1176
;1176:			}
LABELV $501
LABELV $456
line 1177
;1177:		}
LABELV $360
line 1178
;1178:	}
LABELV $357
LABELV $347
line 1180
;1179:
;1180:	if ( pm->cmd.upmove > 0 
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
LEI4 $528
ADDRLP4 56
ADDRLP4 48
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $528
ADDRLP4 56
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
GTI4 $530
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 52
INDIRI4
EQI4 $528
LABELV $530
line 1183
;1181:		&& pm->ps->weapon == WP_SABER
;1182:		&& (pm->ps->weaponTime > 0||pm->cmd.buttons&BUTTON_ATTACK) )
;1183:	{//okay, we just jumped and we're in an attack
line 1184
;1184:		if ( !BG_InRoll( pm->ps, pm->ps->legsAnim )
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $531
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $531
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $531
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $531
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 PM_SpinningAnim
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $531
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $531
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $531
line 1191
;1185:			&& !PM_InKnockDown( pm->ps )
;1186:			&& !BG_InDeathAnim(pm->ps->legsAnim)
;1187:			&& !BG_FlippingAnim( pm->ps->legsAnim )
;1188:			&& !PM_SpinningAnim( pm->ps->legsAnim )
;1189:			&& !BG_SaberInSpecialAttack( pm->ps->torsoAnim )
;1190:			&& ( BG_SaberInAttack( pm->ps->saberMove ) ) )
;1191:		{//not in an anim we shouldn't interrupt
line 1193
;1192:			//see if it's not too late to start a special jump-attack
;1193:			float animLength = PM_AnimLength( 0, (animNumber_t)pm->ps->torsoAnim );
CNSTI4 0
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 PM_AnimLength
CALLI4
ASGNI4
ADDRLP4 92
ADDRLP4 96
INDIRI4
CVIF4 4
ASGNF4
line 1194
;1194:			if ( animLength - pm->ps->torsoTimer < 500 )
ADDRLP4 92
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1140457472
GEF4 $533
line 1195
;1195:			{//just started the saberMove
line 1197
;1196:				//check for special-case jump attacks
;1197:				if ( pm->ps->fd.saberAnimLevel == FORCE_LEVEL_2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
NEI4 $535
line 1198
;1198:				{//using medium attacks
line 1199
;1199:					if (PM_GroundDistance() < 32 &&
ADDRLP4 100
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1107296256
GEF4 $536
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $536
line 1201
;1200:						!BG_InSpecialJump(pm->ps->legsAnim))
;1201:					{ //FLIP AND DOWNWARD ATTACK
line 1204
;1202:						trace_t tr;
;1203:
;1204:						if (PM_SomeoneInFront(&tr))
ADDRLP4 108
ARGP4
ADDRLP4 1188
ADDRGP4 PM_SomeoneInFront
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
EQI4 $536
line 1205
;1205:						{
line 1206
;1206:							PM_SetSaberMove(PM_SaberFlipOverAttackMove(&tr));
ADDRLP4 108
ARGP4
ADDRLP4 1192
ADDRGP4 PM_SaberFlipOverAttackMove
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1207
;1207:							pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1208
;1208:							pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1209
;1209:							pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 1196
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1196
INDIRP4
ADDRLP4 1196
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1210
;1210:							pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 1211
;1211:							VectorClear(pml.groundTrace.plane.normal);
ADDRLP4 1200
CNSTF4 0
ASGNF4
ADDRGP4 pml+52+24+8
ADDRLP4 1200
INDIRF4
ASGNF4
ADDRGP4 pml+52+24+4
ADDRLP4 1200
INDIRF4
ASGNF4
ADDRGP4 pml+52+24
ADDRLP4 1200
INDIRF4
ASGNF4
line 1213
;1212:
;1213:							pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1204
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1214
;1214:						}
line 1215
;1215:					}
line 1216
;1216:				}
ADDRGP4 $536
JUMPV
LABELV $535
line 1217
;1217:				else if ( pm->ps->fd.saberAnimLevel == FORCE_LEVEL_3 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $551
line 1218
;1218:				{//using strong attacks
line 1219
;1219:					if ( pm->cmd.forwardmove > 0 && //going forward
ADDRLP4 100
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 100
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 104
INDIRI4
LEI4 $553
ADDRLP4 100
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 104
INDIRI4
EQI4 $553
ADDRLP4 108
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 108
INDIRF4
CNSTF4 1107296256
GEF4 $553
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $553
line 1223
;1220:						(pm->cmd.buttons & BUTTON_ATTACK) && //must be holding attack still
;1221:						PM_GroundDistance() < 32 &&
;1222:						!BG_InSpecialJump(pm->ps->legsAnim))
;1223:					{//strong attack: jump-hack
line 1224
;1224:						PM_SetSaberMove( PM_SaberJumpAttackMove() );
ADDRLP4 116
ADDRGP4 PM_SaberJumpAttackMove
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1225
;1225:						pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1226
;1226:						pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1227
;1227:						pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 120
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1228
;1228:						pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 1229
;1229:						VectorClear(pml.groundTrace.plane.normal);
ADDRLP4 124
CNSTF4 0
ASGNF4
ADDRGP4 pml+52+24+8
ADDRLP4 124
INDIRF4
ASGNF4
ADDRGP4 pml+52+24+4
ADDRLP4 124
INDIRF4
ASGNF4
ADDRGP4 pml+52+24
ADDRLP4 124
INDIRF4
ASGNF4
line 1231
;1230:
;1231:						pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 128
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1232
;1232:					}
LABELV $553
line 1233
;1233:				}
LABELV $551
LABELV $536
line 1234
;1234:			}
LABELV $533
line 1235
;1235:		}
LABELV $531
line 1236
;1236:	}
LABELV $528
line 1237
;1237:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $565
line 1238
;1238:	{
line 1239
;1239:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $565
line 1241
;1240:	}
;1241:	if ( pm->cmd.upmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $567
line 1242
;1242:	{//no special jumps
line 1243
;1243:		pm->ps->velocity[2] = JUMP_VELOCITY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1130430464
ASGNF4
line 1244
;1244:		PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1245
;1245:		pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1246
;1246:	}
LABELV $567
line 1249
;1247:
;1248:	//Jumping
;1249:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1250
;1250:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1251
;1251:	pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1252
;1252:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 1253
;1253:	PM_SetForceJumpZStart(pm->ps->origin[2]);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1255
;1254:
;1255:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1258
;1256:
;1257:	//Set the animations
;1258:	if ( pm->ps->gravity > 0 && !BG_InSpecialJump( pm->ps->legsAnim ) )
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
LEI4 $571
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $571
line 1259
;1259:	{
line 1260
;1260:		PM_JumpForDir();
ADDRGP4 PM_JumpForDir
CALLV
pop
line 1261
;1261:	}
LABELV $571
line 1263
;1262:
;1263:	return qtrue;
CNSTI4 1
RETI4
LABELV $244
endproc PM_CheckJump 1288 28
proc PM_CheckWaterJump 56 8
line 1270
;1264:}
;1265:/*
;1266:=============
;1267:PM_CheckWaterJump
;1268:=============
;1269:*/
;1270:static qboolean	PM_CheckWaterJump( void ) {
line 1275
;1271:	vec3_t	spot;
;1272:	int		cont;
;1273:	vec3_t	flatforward;
;1274:
;1275:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $574
line 1276
;1276:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $573
JUMPV
LABELV $574
line 1280
;1277:	}
;1278:
;1279:	// check for water jump
;1280:	if ( pm->waterlevel != 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
EQI4 $576
line 1281
;1281:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $573
JUMPV
LABELV $576
line 1284
;1282:	}
;1283:
;1284:	flatforward[0] = pml.forward[0];
ADDRLP4 12
ADDRGP4 pml
INDIRF4
ASGNF4
line 1285
;1285:	flatforward[1] = pml.forward[1];
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 1286
;1286:	flatforward[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1287
;1287:	VectorNormalize (flatforward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1289
;1288:
;1289:	VectorMA (pm->ps->origin, 30, flatforward, spot);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 1106247680
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1106247680
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1290
;1290:	spot[2] += 4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 1291
;1291:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
ASGNI4
line 1292
;1292:	if ( !(cont & CONTENTS_SOLID) ) {
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $586
line 1293
;1293:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $573
JUMPV
LABELV $586
line 1296
;1294:	}
;1295:
;1296:	spot[2] += 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1297
;1297:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 48
INDIRI4
ASGNI4
line 1298
;1298:	if ( cont ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $589
line 1299
;1299:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $573
JUMPV
LABELV $589
line 1303
;1300:	}
;1301:
;1302:	// jump out of water
;1303:	VectorScale (pml.forward, 200, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1128792064
ADDRGP4 pml
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1128792064
ADDRGP4 pml+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ADDRGP4 pml+8
INDIRF4
MULF4
ASGNF4
line 1304
;1304:	pm->ps->velocity[2] = 350;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1135542272
ASGNF4
line 1306
;1305:
;1306:	pm->ps->pm_flags |= PMF_TIME_WATERJUMP;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1307
;1307:	pm->ps->pm_time = 2000;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 2000
ASGNI4
line 1309
;1308:
;1309:	return qtrue;
CNSTI4 1
RETI4
LABELV $573
endproc PM_CheckWaterJump 56 8
proc PM_WaterJumpMove 12 4
line 1322
;1310:}
;1311:
;1312://============================================================================
;1313:
;1314:
;1315:/*
;1316:===================
;1317:PM_WaterJumpMove
;1318:
;1319:Flying out of the water
;1320:===================
;1321:*/
;1322:static void PM_WaterJumpMove( void ) {
line 1325
;1323:	// waterjump has no control, but falls
;1324:
;1325:	PM_StepSlideMove( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 1327
;1326:
;1327:	pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 1328
;1328:	if (pm->ps->velocity[2] < 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $595
line 1330
;1329:		// cancel as soon as we are falling down again
;1330:		pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 1331
;1331:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1332
;1332:	}
LABELV $595
line 1333
;1333:}
LABELV $593
endproc PM_WaterJumpMove 12 4
proc PM_WaterMove 76 16
line 1341
;1334:
;1335:/*
;1336:===================
;1337:PM_WaterMove
;1338:
;1339:===================
;1340:*/
;1341:static void PM_WaterMove( void ) {
line 1349
;1342:	int		i;
;1343:	vec3_t	wishvel;
;1344:	float	wishspeed;
;1345:	vec3_t	wishdir;
;1346:	float	scale;
;1347:	float	vel;
;1348:
;1349:	if ( PM_CheckWaterJump() ) {
ADDRLP4 40
ADDRGP4 PM_CheckWaterJump
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $598
line 1350
;1350:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 1351
;1351:		return;
ADDRGP4 $597
JUMPV
LABELV $598
line 1367
;1352:	}
;1353:#if 0
;1354:	// jump = head for surface
;1355:	if ( pm->cmd.upmove >= 10 ) {
;1356:		if (pm->ps->velocity[2] > -300) {
;1357:			if ( pm->watertype == CONTENTS_WATER ) {
;1358:				pm->ps->velocity[2] = 100;
;1359:			} else if (pm->watertype == CONTENTS_SLIME) {
;1360:				pm->ps->velocity[2] = 80;
;1361:			} else {
;1362:				pm->ps->velocity[2] = 50;
;1363:			}
;1364:		}
;1365:	}
;1366:#endif
;1367:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 1369
;1368:
;1369:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 44
INDIRF4
ASGNF4
line 1373
;1370:	//
;1371:	// user intentions
;1372:	//
;1373:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $600
line 1374
;1374:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1375
;1375:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 1376
;1376:		wishvel[2] = -60;		// sink towards bottom
ADDRLP4 8+8
CNSTF4 3262119936
ASGNF4
line 1377
;1377:	} else {
ADDRGP4 $601
JUMPV
LABELV $600
line 1378
;1378:		for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $604
line 1379
;1379:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $605
line 1378
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $604
line 1381
;1380:
;1381:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1382
;1382:	}
LABELV $601
line 1384
;1383:
;1384:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 8
INDIRB
ASGNB 12
line 1385
;1385:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 1387
;1386:
;1387:	if ( wishspeed > pm->ps->speed * pm_swimScale ) {
ADDRLP4 20
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
LEF4 $610
line 1388
;1388:		wishspeed = pm->ps->speed * pm_swimScale;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
ASGNF4
line 1389
;1389:	}
LABELV $610
line 1391
;1390:
;1391:	PM_Accelerate (wishdir, wishspeed, pm_wateraccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 pm_wateraccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 1394
;1392:
;1393:	// make sure we can go up slopes easily under water
;1394:	if ( pml.groundPlane && DotProduct( pm->ps->velocity, pml.groundTrace.plane.normal ) < 0 ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $612
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $612
line 1395
;1395:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 56
INDIRF4
ASGNF4
line 1397
;1396:		// slide along the ground plane
;1397:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1400
;1398:			pm->ps->velocity, OVERCLIP );
;1399:
;1400:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1401
;1401:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 1402
;1402:	}
LABELV $612
line 1404
;1403:
;1404:	PM_SlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 1405
;1405:}
LABELV $597
endproc PM_WaterMove 76 16
proc PM_FlyMove 56 12
line 1414
;1406:
;1407:/*
;1408:===================
;1409:PM_FlyMove
;1410:
;1411:Only with the flight powerup
;1412:===================
;1413:*/
;1414:static void PM_FlyMove( void ) {
line 1422
;1415:	int		i;
;1416:	vec3_t	wishvel;
;1417:	float	wishspeed;
;1418:	vec3_t	wishdir;
;1419:	float	scale;
;1420:
;1421:	// normal slowdown
;1422:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 1424
;1423:
;1424:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ASGNF4
line 1426
;1425:	
;1426:	if ( pm->ps->pm_type == PM_SPECTATOR && pm->cmd.buttons & BUTTON_ALT_ATTACK) {
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $626
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $626
line 1428
;1427:		//turbo boost
;1428:		scale *= 10;
ADDRLP4 4
CNSTF4 1092616192
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1429
;1429:	}
LABELV $626
line 1434
;1430:
;1431:	//
;1432:	// user intentions
;1433:	//
;1434:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $628
line 1435
;1435:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1436
;1436:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 1437
;1437:		wishvel[2] = pm->ps->speed * (pm->cmd.upmove/127.0f);
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8+8
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CVIF4 4
CNSTF4 1123942400
DIVF4
MULF4
ASGNF4
line 1438
;1438:	} else {
ADDRGP4 $629
JUMPV
LABELV $628
line 1439
;1439:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $632
line 1440
;1440:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1441
;1441:		}
LABELV $633
line 1439
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $632
line 1443
;1442:
;1443:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1444
;1444:	}
LABELV $629
line 1446
;1445:
;1446:	VectorCopy (wishvel, wishdir);
ADDRLP4 20
ADDRLP4 8
INDIRB
ASGNB 12
line 1447
;1447:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 20
ARGP4
ADDRLP4 44
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 44
INDIRF4
ASGNF4
line 1449
;1448:
;1449:	PM_Accelerate (wishdir, wishspeed, pm_flyaccelerate);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 pm_flyaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 1451
;1450:
;1451:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 1452
;1452:}
LABELV $625
endproc PM_FlyMove 56 12
proc PM_AirMove 84 16
line 1461
;1453:
;1454:
;1455:/*
;1456:===================
;1457:PM_AirMove
;1458:
;1459:===================
;1460:*/
;1461:static void PM_AirMove( void ) {
line 1470
;1462:	int			i;
;1463:	vec3_t		wishvel;
;1464:	float		fmove, smove;
;1465:	vec3_t		wishdir;
;1466:	float		wishspeed;
;1467:	float		scale;
;1468:	usercmd_t	cmd;
;1469:
;1470:	if (pm->ps->pm_type != PM_SPECTATOR)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $639
line 1471
;1471:	{
line 1473
;1472:#if METROID_JUMP
;1473:		PM_CheckJump();
ADDRGP4 PM_CheckJump
CALLI4
pop
line 1481
;1474:#else
;1475:		if (pm->ps->fd.forceJumpZStart &&
;1476:			pm->ps->forceJumpFlip)
;1477:		{
;1478:			PM_CheckJump();
;1479:		}
;1480:#endif
;1481:	}
LABELV $639
line 1482
;1482:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 1484
;1483:
;1484:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1485
;1485:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1487
;1486:
;1487:	cmd = pm->cmd;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 28
line 1488
;1488:	scale = PM_CmdScale( &cmd );
ADDRLP4 44
ARGP4
ADDRLP4 72
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 72
INDIRF4
ASGNF4
line 1491
;1489:
;1490:	// set the movementDir so clients can rotate the legs for strafing
;1491:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 1494
;1492:
;1493:	// project moves down to flat plane
;1494:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 1495
;1495:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 1496
;1496:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1497
;1497:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1499
;1498:
;1499:	if ( gPMDoSlowFall )
ADDRGP4 gPMDoSlowFall
INDIRI4
CNSTI4 0
EQI4 $645
line 1500
;1500:	{//no air-control
line 1501
;1501:		VectorClear( wishvel );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 76
INDIRF4
ASGNF4
line 1502
;1502:	}
ADDRGP4 $646
JUMPV
LABELV $645
line 1504
;1503:	else
;1504:	{
line 1505
;1505:		for ( i = 0 ; i < 2 ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $649
line 1506
;1506:		{
line 1507
;1507:			wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 76
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 76
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 1508
;1508:		}
LABELV $650
line 1505
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $649
line 1509
;1509:		wishvel[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 1510
;1510:	}
LABELV $646
line 1512
;1511:
;1512:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 4
INDIRB
ASGNB 12
line 1513
;1513:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 76
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 76
INDIRF4
ASGNF4
line 1514
;1514:	wishspeed *= scale;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 1517
;1515:
;1516:	// not on ground, so little effect on velocity
;1517:	PM_Accelerate (wishdir, wishspeed, pm_airaccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 pm_airaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 1522
;1518:
;1519:	// we may have a ground plane that is very steep, even
;1520:	// though we don't have a groundentity
;1521:	// slide along the steep plane
;1522:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $655
line 1523
;1523:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1525
;1524:			pm->ps->velocity, OVERCLIP );
;1525:	}
LABELV $655
line 1527
;1526:
;1527:	PM_StepSlideMove ( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 1528
;1528:}
LABELV $638
endproc PM_AirMove 84 16
proc PM_WalkMove 148 16
line 1536
;1529:
;1530:/*
;1531:===================
;1532:PM_WalkMove
;1533:
;1534:===================
;1535:*/
;1536:static void PM_WalkMove( void ) {
line 1548
;1537:	int			i;
;1538:	vec3_t		wishvel;
;1539:	float		fmove, smove;
;1540:	vec3_t		wishdir;
;1541:	float		wishspeed;
;1542:	float		scale;
;1543:	usercmd_t	cmd;
;1544:	float		accelerate;
;1545:	float		vel;
;1546:	float		totalVel;
;1547:
;1548:	if (pm->ps->velocity[0] < 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $661
line 1549
;1549:	{
line 1550
;1550:		totalVel = -pm->ps->velocity[0];
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ASGNF4
line 1551
;1551:	}
ADDRGP4 $662
JUMPV
LABELV $661
line 1553
;1552:	else
;1553:	{
line 1554
;1554:		totalVel = pm->ps->velocity[0];
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 1555
;1555:	}
LABELV $662
line 1557
;1556:
;1557:	if (pm->ps->velocity[1] < 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $663
line 1558
;1558:	{
line 1559
;1559:		totalVel += -pm->ps->velocity[1];
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 1560
;1560:	}
ADDRGP4 $664
JUMPV
LABELV $663
line 1562
;1561:	else
;1562:	{
line 1563
;1563:		totalVel += pm->ps->velocity[1];
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1564
;1564:	}
LABELV $664
line 1566
;1565:
;1566:	if (totalVel < 200)
ADDRLP4 44
INDIRF4
CNSTF4 1128792064
GEF4 $665
line 1567
;1567:	{
line 1568
;1568:		pm->ps->fd.forceSpeedSmash = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 1065353216
ASGNF4
line 1569
;1569:	}
LABELV $665
line 1571
;1570:
;1571:	if ( pm->waterlevel > 2 && DotProduct( pml.forward, pml.groundTrace.plane.normal ) > 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
LEI4 $667
ADDRGP4 pml
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRGP4 pml+4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pml+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
LEF4 $667
line 1573
;1572:		// begin swimming
;1573:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 1574
;1574:		return;
ADDRGP4 $660
JUMPV
LABELV $667
line 1578
;1575:	}
;1576:
;1577:
;1578:	if (pm->ps->pm_type != PM_SPECTATOR)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $679
line 1579
;1579:	{
line 1580
;1580:		if ( PM_CheckJump () ) {
ADDRLP4 84
ADDRGP4 PM_CheckJump
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $681
line 1582
;1581:			// jumped away
;1582:			if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
LEI4 $683
line 1583
;1583:				PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 1584
;1584:			} else {
ADDRGP4 $660
JUMPV
LABELV $683
line 1585
;1585:				PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 1586
;1586:			}
line 1587
;1587:			return;
ADDRGP4 $660
JUMPV
LABELV $681
line 1589
;1588:		}
;1589:	}
LABELV $679
line 1591
;1590:
;1591:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 1593
;1592:
;1593:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1594
;1594:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1596
;1595:
;1596:	cmd = pm->cmd;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 28
line 1597
;1597:	scale = PM_CmdScale( &cmd );
ADDRLP4 52
ARGP4
ADDRLP4 84
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 84
INDIRF4
ASGNF4
line 1600
;1598:
;1599:	// set the movementDir so clients can rotate the legs for strafing
;1600:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 1603
;1601:
;1602:	// project moves down to flat plane
;1603:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 1604
;1604:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 1607
;1605:
;1606:	// project the forward and right directions onto the ground plane
;1607:	PM_ClipVelocity (pml.forward, pml.groundTrace.plane.normal, pml.forward, OVERCLIP );
ADDRLP4 88
ADDRGP4 pml
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1608
;1608:	PM_ClipVelocity (pml.right, pml.groundTrace.plane.normal, pml.right, OVERCLIP );
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRGP4 pml+12
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1610
;1609:	//
;1610:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1611
;1611:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1613
;1612:
;1613:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $695
line 1614
;1614:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 92
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 92
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 92
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 92
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 1615
;1615:	}
LABELV $696
line 1613
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $695
line 1618
;1616:	// when going up or down slopes the wish velocity should Not be zero
;1617:
;1618:	VectorCopy (wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 1619
;1619:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 92
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 92
INDIRF4
ASGNF4
line 1620
;1620:	wishspeed *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 1623
;1621:
;1622:	// clamp the speed lower if ducking
;1623:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $700
line 1624
;1624:		if ( wishspeed > pm->ps->speed * pm_duckScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $701
line 1625
;1625:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 1626
;1626:		}
line 1627
;1627:	}
ADDRGP4 $701
JUMPV
LABELV $700
line 1628
;1628:	else if ( (pm->ps->pm_flags & PMF_ROLLING) && !BG_InRoll(pm->ps, pm->ps->legsAnim) &&
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $704
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $704
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $704
line 1630
;1629:		!PM_InRollComplete(pm->ps, pm->ps->legsAnim))
;1630:	{
line 1631
;1631:		if ( wishspeed > pm->ps->speed * pm_duckScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $706
line 1632
;1632:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 1633
;1633:		}
LABELV $706
line 1634
;1634:	}
LABELV $704
LABELV $701
line 1637
;1635:
;1636:	// clamp the speed lower if wading or walking on the bottom
;1637:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $708
line 1640
;1638:		float	waterScale;
;1639:
;1640:		waterScale = pm->waterlevel / 3.0;
ADDRLP4 112
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1077936128
DIVF4
ASGNF4
line 1641
;1641:		waterScale = 1.0 - ( 1.0 - pm_swimScale ) * waterScale;
ADDRLP4 116
CNSTF4 1065353216
ASGNF4
ADDRLP4 112
ADDRLP4 116
INDIRF4
ADDRLP4 116
INDIRF4
ADDRGP4 pm_swimScale
INDIRF4
SUBF4
ADDRLP4 112
INDIRF4
MULF4
SUBF4
ASGNF4
line 1642
;1642:		if ( wishspeed > pm->ps->speed * waterScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 112
INDIRF4
MULF4
LEF4 $710
line 1643
;1643:			wishspeed = pm->ps->speed * waterScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 112
INDIRF4
MULF4
ASGNF4
line 1644
;1644:		}
LABELV $710
line 1645
;1645:	}
LABELV $708
line 1649
;1646:
;1647:	// when a player gets hit, they temporarily lose
;1648:	// full control, which allows them to be moved a bit
;1649:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 112
INDIRI4
NEI4 $716
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 112
INDIRI4
EQI4 $712
LABELV $716
line 1650
;1650:		accelerate = pm_airaccelerate;
ADDRLP4 80
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
line 1651
;1651:	} else {
ADDRGP4 $713
JUMPV
LABELV $712
line 1652
;1652:		accelerate = pm_accelerate;
ADDRLP4 80
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
line 1653
;1653:	}
LABELV $713
line 1655
;1654:
;1655:	PM_Accelerate (wishdir, wishspeed, accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 1660
;1656:
;1657:	//Com_Printf("velocity = %1.1f %1.1f %1.1f\n", pm->ps->velocity[0], pm->ps->velocity[1], pm->ps->velocity[2]);
;1658:	//Com_Printf("velocity1 = %1.1f\n", VectorLength(pm->ps->velocity));
;1659:
;1660:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK )
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 116
INDIRI4
NEI4 $721
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 116
INDIRI4
EQI4 $717
LABELV $721
line 1661
;1661:	{
line 1662
;1662:		pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 120
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 120
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRLP4 120
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 1663
;1663:	}
LABELV $717
line 1665
;1664:
;1665:	vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 120
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 120
INDIRF4
ASGNF4
line 1668
;1666:
;1667:	// slide along the ground plane
;1668:	PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1672
;1669:		pm->ps->velocity, OVERCLIP );
;1670:
;1671:	// don't decrease velocity when going up or down a slope
;1672:	VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1673
;1673:	VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 132
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 136
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1676
;1674:
;1675:	// don't do anything if standing still
;1676:	if (!pm->ps->velocity[0] && !pm->ps->velocity[1]) {
ADDRLP4 140
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 144
CNSTF4 0
ASGNF4
ADDRLP4 140
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 144
INDIRF4
NEF4 $725
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 144
INDIRF4
NEF4 $725
line 1677
;1677:		pm->ps->fd.forceSpeedSmash = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 1065353216
ASGNF4
line 1678
;1678:		return;
ADDRGP4 $660
JUMPV
LABELV $725
line 1681
;1679:	}
;1680:
;1681:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 1684
;1682:
;1683:	//Com_Printf("velocity2 = %1.1f\n", VectorLength(pm->ps->velocity));
;1684:}
LABELV $660
endproc PM_WalkMove 148 16
proc PM_DeadMove 20 4
line 1692
;1685:
;1686:
;1687:/*
;1688:==============
;1689:PM_DeadMove
;1690:==============
;1691:*/
;1692:static void PM_DeadMove( void ) {
line 1695
;1693:	float	forward;
;1694:
;1695:	if ( !pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
NEI4 $728
line 1696
;1696:		return;
ADDRGP4 $727
JUMPV
LABELV $728
line 1701
;1697:	}
;1698:
;1699:	// extra friction
;1700:
;1701:	forward = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1702
;1702:	forward -= 20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1703
;1703:	if ( forward <= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $731
line 1704
;1704:		VectorClear (pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1705
;1705:	} else {
ADDRGP4 $732
JUMPV
LABELV $731
line 1706
;1706:		VectorNormalize (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1707
;1707:		VectorScale (pm->ps->velocity, forward, pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1708
;1708:	}
LABELV $732
line 1709
;1709:}
LABELV $727
endproc PM_DeadMove 20 4
proc PM_NoclipMove 104 12
line 1717
;1710:
;1711:
;1712:/*
;1713:===============
;1714:PM_NoclipMove
;1715:===============
;1716:*/
;1717:static void PM_NoclipMove( void ) {
line 1726
;1718:	float	speed, drop, friction, control, newspeed;
;1719:	int			i;
;1720:	vec3_t		wishvel;
;1721:	float		fmove, smove;
;1722:	vec3_t		wishdir;
;1723:	float		wishspeed;
;1724:	float		scale;
;1725:
;1726:	pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 1730
;1727:
;1728:	// friction
;1729:
;1730:	speed = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 64
INDIRF4
ASGNF4
line 1731
;1731:	if (speed < 1)
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
GEF4 $734
line 1732
;1732:	{
line 1733
;1733:		VectorCopy (vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 1734
;1734:	}
ADDRGP4 $735
JUMPV
LABELV $734
line 1736
;1735:	else
;1736:	{
line 1737
;1737:		drop = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 1739
;1738:
;1739:		friction = pm_friction*1.5;	// extra friction
ADDRLP4 56
CNSTF4 1069547520
ADDRGP4 pm_friction
INDIRF4
MULF4
ASGNF4
line 1740
;1740:		control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 24
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $737
ADDRLP4 68
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $738
JUMPV
LABELV $737
ADDRLP4 68
ADDRLP4 24
INDIRF4
ASGNF4
LABELV $738
ADDRLP4 60
ADDRLP4 68
INDIRF4
ASGNF4
line 1741
;1741:		drop += control*friction*pml.frametime;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 1744
;1742:
;1743:		// scale the velocity
;1744:		newspeed = speed - drop;
ADDRLP4 28
ADDRLP4 24
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
line 1745
;1745:		if (newspeed < 0)
ADDRLP4 28
INDIRF4
CNSTF4 0
GEF4 $740
line 1746
;1746:			newspeed = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
LABELV $740
line 1747
;1747:		newspeed /= speed;
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 1749
;1748:
;1749:		VectorScale (pm->ps->velocity, newspeed, pm->ps->velocity);
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1750
;1750:	}
LABELV $735
line 1753
;1751:
;1752:	// accelerate
;1753:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 68
INDIRF4
ASGNF4
line 1754
;1754:	if (pm->cmd.buttons & BUTTON_ATTACK) {	//turbo boost
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $742
line 1755
;1755:		scale *= 10;
ADDRLP4 48
CNSTF4 1092616192
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 1756
;1756:	}
LABELV $742
line 1757
;1757:	if (pm->cmd.buttons & BUTTON_ALT_ATTACK) {	//turbo boost
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $744
line 1758
;1758:		scale *= 10;
ADDRLP4 48
CNSTF4 1092616192
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 1759
;1759:	}
LABELV $744
line 1761
;1760:
;1761:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1762
;1762:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1764
;1763:	
;1764:	for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $746
line 1765
;1765:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 72
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 72
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $747
line 1764
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $746
line 1766
;1766:	wishvel[2] += pm->cmd.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ADDF4
ASGNF4
line 1768
;1767:
;1768:	VectorCopy (wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 1769
;1769:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 76
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 76
INDIRF4
ASGNF4
line 1770
;1770:	wishspeed *= scale;
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 1772
;1771:
;1772:	PM_Accelerate( wishdir, wishspeed, pm_accelerate );
ADDRLP4 32
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 pm_accelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 1775
;1773:
;1774:	// move
;1775:	VectorMA (pm->ps->origin, pml.frametime, pm->ps->velocity, pm->ps->origin);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 1776
;1776:}
LABELV $733
endproc PM_NoclipMove 104 12
proc PM_FootstepForSurface 0 0
line 1788
;1777:
;1778://============================================================================
;1779:
;1780:/*
;1781:================
;1782:PM_FootstepForSurface
;1783:
;1784:Returns an event number apropriate for the groundsurface
;1785:================
;1786:*/
;1787:static int PM_FootstepForSurface( void )
;1788:{
line 1789
;1789:	if ( pml.groundTrace.surfaceFlags & SURF_NOSTEPS ) 
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 4194304
BANDI4
CNSTI4 0
EQI4 $756
line 1790
;1790:	{
line 1791
;1791:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $755
JUMPV
LABELV $756
line 1793
;1792:	}
;1793:	if ( pml.groundTrace.surfaceFlags & SURF_METALSTEPS ) 
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $760
line 1794
;1794:	{
line 1795
;1795:		return EV_FOOTSTEP_METAL;
CNSTI4 3
RETI4
ADDRGP4 $755
JUMPV
LABELV $760
line 1797
;1796:	}
;1797:	return EV_FOOTSTEP;
CNSTI4 2
RETI4
LABELV $755
endproc PM_FootstepForSurface 0 0
proc PM_TryRoll 1208 28
line 1801
;1798:}
;1799:
;1800:static int PM_TryRoll( void )
;1801:{
line 1803
;1802:	trace_t	trace;
;1803:	int		anim = -1;
ADDRLP4 36
CNSTI4 -1
ASGNI4
line 1806
;1804:	vec3_t fwd, right, traceto, mins, maxs, fwdAngles;
;1805:
;1806:	if ( BG_SaberInAttack( pm->ps->saberMove ) || BG_SaberInSpecialAttack( pm->ps->torsoAnim ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1156
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $769
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $769
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 1164
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $769
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1168
ADDRGP4 PM_SaberInStart
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
EQI4 $765
LABELV $769
line 1809
;1807:		|| BG_SpinningSaberAnim( pm->ps->legsAnim ) 
;1808:		|| PM_SaberInStart( pm->ps->saberMove ) )
;1809:	{//attacking or spinning (or, if player, starting an attack)
line 1810
;1810:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $764
JUMPV
LABELV $765
line 1813
;1811:	}
;1812:
;1813:	if (pm->ps->weapon != WP_SABER || BG_HasYsalamiri(pm->gametype, pm->ps) ||
ADDRLP4 1172
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1176
ADDRLP4 1172
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1176
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $773
ADDRLP4 1172
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1180
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $773
ADDRLP4 1184
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1184
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 1184
INDIRP4
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1188
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
NEI4 $770
LABELV $773
line 1815
;1814:		!BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION))
;1815:	{ //Not using saber, or can't use jump
line 1816
;1816:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $764
JUMPV
LABELV $770
line 1819
;1817:	}
;1818:
;1819:	VectorSet(mins, pm->mins[0],pm->mins[1],pm->mins[2]+STEPSIZE);
ADDRLP4 1192
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 1192
INDIRP4
CNSTI4 188
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 1192
INDIRP4
CNSTI4 192
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 1820
;1820:	VectorSet(maxs, pm->maxs[0],pm->maxs[1],CROUCH_MAXS_2);
ADDRLP4 1196
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1196
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 1196
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24+8
CNSTF4 1098907648
ASGNF4
line 1822
;1821:
;1822:	VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1824
;1823:
;1824:	AngleVectors( fwdAngles, fwd, right, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1826
;1825:
;1826:	if ( pm->cmd.forwardmove )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $780
line 1827
;1827:	{ //check forward/backward rolls
line 1828
;1828:		if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $782
line 1829
;1829:		{
line 1830
;1830:			anim = BOTH_ROLL_B;
ADDRLP4 36
CNSTI4 886
ASGNI4
line 1831
;1831:			VectorMA( pm->ps->origin, -64, fwd, traceto );
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1204
CNSTF4 3263168512
ASGNF4
ADDRLP4 40
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
ADDRLP4 52+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3263168512
ADDRLP4 52+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1832
;1832:		}
ADDRGP4 $781
JUMPV
LABELV $782
line 1834
;1833:		else
;1834:		{
line 1835
;1835:			anim = BOTH_ROLL_F;
ADDRLP4 36
CNSTI4 885
ASGNI4
line 1836
;1836:			VectorMA( pm->ps->origin, 64, fwd, traceto );
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1204
CNSTF4 1115684864
ASGNF4
ADDRLP4 40
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
ADDRLP4 52+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 52+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1837
;1837:		}
line 1838
;1838:	}
ADDRGP4 $781
JUMPV
LABELV $780
line 1839
;1839:	else if ( pm->cmd.rightmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $792
line 1840
;1840:	{ //right
line 1841
;1841:		anim = BOTH_ROLL_R;
ADDRLP4 36
CNSTI4 888
ASGNI4
line 1842
;1842:		VectorMA( pm->ps->origin, 64, right, traceto );
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1204
CNSTF4 1115684864
ASGNF4
ADDRLP4 40
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
ADDRLP4 64+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 64+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1843
;1843:	}
ADDRGP4 $793
JUMPV
LABELV $792
line 1844
;1844:	else if ( pm->cmd.rightmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $798
line 1845
;1845:	{ //left
line 1846
;1846:		anim = BOTH_ROLL_L;
ADDRLP4 36
CNSTI4 887
ASGNI4
line 1847
;1847:		VectorMA( pm->ps->origin, -64, right, traceto );
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1204
CNSTF4 3263168512
ASGNF4
ADDRLP4 40
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
ADDRLP4 64+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3263168512
ADDRLP4 64+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1848
;1848:	}
LABELV $798
LABELV $793
LABELV $781
line 1850
;1849:
;1850:	if ( anim != -1 )
ADDRLP4 36
INDIRI4
CNSTI4 -1
EQI4 $804
line 1851
;1851:	{ //We want to roll. Perform a trace to see if we can, and if so, send us into one.
line 1852
;1852:		pm->trace( &trace, pm->ps->origin, mins, maxs, traceto, pm->ps->clientNum, CONTENTS_SOLID );
ADDRLP4 76
ARGP4
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1204
ADDRLP4 1200
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 1204
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1200
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 1853
;1853:		if ( trace.fraction >= 1.0f )
ADDRLP4 76+8
INDIRF4
CNSTF4 1065353216
LTF4 $806
line 1854
;1854:		{
line 1855
;1855:			pm->ps->saberMove = LS_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 1856
;1856:			return anim;
ADDRLP4 36
INDIRI4
RETI4
ADDRGP4 $764
JUMPV
LABELV $806
line 1858
;1857:		}
;1858:	}
LABELV $804
line 1859
;1859:	return 0;
CNSTI4 0
RETI4
LABELV $764
endproc PM_TryRoll 1208 28
proc PM_CrashLand 116 16
line 1869
;1860:}
;1861:
;1862:/*
;1863:=================
;1864:PM_CrashLand
;1865:
;1866:Check for hard landings that generate sound events
;1867:=================
;1868:*/
;1869:static void PM_CrashLand( void ) {
line 1875
;1870:	float		delta;
;1871:	float		dist;
;1872:	float		vel, acc;
;1873:	float		t;
;1874:	float		a, b, c, den;
;1875:	qboolean	didRoll = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 1878
;1876:
;1877:	// calculate the exact velocity on landing
;1878:	dist = pm->ps->origin[2] - pml.previous_origin[2];
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 pml+1136+8
INDIRF4
SUBF4
ASGNF4
line 1879
;1879:	vel = pml.previous_velocity[2];
ADDRLP4 8
ADDRGP4 pml+1148+8
INDIRF4
ASGNF4
line 1880
;1880:	acc = -pm->ps->gravity;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 1882
;1881:
;1882:	a = acc / 2;
ADDRLP4 16
ADDRLP4 12
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1883
;1883:	b = vel;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 1884
;1884:	c = -dist;
ADDRLP4 32
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
line 1886
;1885:
;1886:	den =  b * b - 4 * a * c;
ADDRLP4 20
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1082130432
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
MULF4
SUBF4
ASGNF4
line 1887
;1887:	if ( den < 0 ) {
ADDRLP4 20
INDIRF4
CNSTF4 0
GEF4 $814
line 1888
;1888:		pm->ps->inAirAnim = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 0
ASGNI4
line 1889
;1889:		return;
ADDRGP4 $809
JUMPV
LABELV $814
line 1891
;1890:	}
;1891:	t = (-b - sqrt( den ) ) / ( 2 * a );
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 44
INDIRF4
SUBF4
CNSTF4 1073741824
ADDRLP4 16
INDIRF4
MULF4
DIVF4
ASGNF4
line 1893
;1892:
;1893:	delta = vel + t * acc;
ADDRLP4 0
ADDRLP4 8
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 1894
;1894:	delta = delta*delta * 0.0001;
ADDRLP4 0
CNSTF4 953267991
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
MULF4
ASGNF4
line 1897
;1895:
;1896:	// ducking while falling doubles damage
;1897:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $816
line 1898
;1898:		delta *= 2;
ADDRLP4 0
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1899
;1899:	}
LABELV $816
line 1902
;1900:
;1901:	// decide which landing animation to use
;1902:	if (!BG_InRoll(pm->ps, pm->ps->legsAnim) && pm->ps->inAirAnim)
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $818
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $818
line 1903
;1903:	{ //only play a land animation if we transitioned into an in-air animation while off the ground
line 1904
;1904:		if (!BG_SaberInSpecial(pm->ps->saberMove))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $820
line 1905
;1905:		{
line 1906
;1906:			if ( pm->ps->pm_flags & PMF_BACKWARDS_JUMP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $822
line 1907
;1907:				PM_ForceLegsAnim( BOTH_LANDBACK1 );
CNSTI4 862
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1908
;1908:			} else {
ADDRGP4 $823
JUMPV
LABELV $822
line 1909
;1909:				PM_ForceLegsAnim( BOTH_LAND1 );
CNSTI4 858
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1910
;1910:			}
LABELV $823
line 1911
;1911:		}
LABELV $820
line 1912
;1912:	}
LABELV $818
line 1914
;1913:
;1914:	if (pm->ps->weapon != WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $824
line 1915
;1915:	{ //saber handles its own anims
line 1917
;1916:		//This will push us back into our weaponready stance from the land anim.
;1917:		if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $826
ADDRLP4 64
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $826
line 1918
;1918:		{
line 1919
;1919:			PM_StartTorsoAnim( TORSO_WEAPONREADY4 );
CNSTI4 1102
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1920
;1920:		}
ADDRGP4 $827
JUMPV
LABELV $826
line 1922
;1921:		else
;1922:		{
line 1923
;1923:			if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $828
line 1924
;1924:			{
line 1925
;1925:				PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1926
;1926:			}
ADDRGP4 $829
JUMPV
LABELV $828
line 1928
;1927:			else
;1928:			{
line 1929
;1929:				PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1930
;1930:			}
LABELV $829
line 1931
;1931:		}
LABELV $827
line 1932
;1932:	}
LABELV $824
line 1934
;1933:
;1934:	if (!BG_InSpecialJump(pm->ps->legsAnim) ||
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $834
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
LTI4 $834
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 918
EQI4 $834
ADDRLP4 72
INDIRI4
CNSTI4 915
NEI4 $830
LABELV $834
line 1938
;1935:		pm->ps->legsTimer < 1 ||
;1936:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT ||
;1937:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT)
;1938:	{ //Only set the timer if we're in an anim that can be interrupted (this would not be, say, a flip)
line 1939
;1939:		if (!BG_InRoll(pm->ps, pm->ps->legsAnim) && pm->ps->inAirAnim)
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $835
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $835
line 1940
;1940:		{
line 1941
;1941:			if (!BG_SaberInSpecial(pm->ps->saberMove) || pm->ps->weapon != WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $839
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $837
LABELV $839
line 1942
;1942:			{
line 1943
;1943:				pm->ps->legsTimer = TIMER_LAND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 130
ASGNI4
line 1944
;1944:			}
LABELV $837
line 1945
;1945:		}
LABELV $835
line 1946
;1946:	}
LABELV $830
line 1948
;1947:
;1948:	pm->ps->inAirAnim = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 0
ASGNI4
line 1951
;1949:
;1950:	// never take falling damage if completely underwater
;1951:	if ( pm->waterlevel == 3 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 3
NEI4 $840
line 1952
;1952:		return;
ADDRGP4 $809
JUMPV
LABELV $840
line 1956
;1953:	}
;1954:
;1955:	// reduce falling damage if there is standing water
;1956:	if ( pm->waterlevel == 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $842
line 1957
;1957:		delta *= 0.25;
ADDRLP4 0
CNSTF4 1048576000
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1958
;1958:	}
LABELV $842
line 1959
;1959:	if ( pm->waterlevel == 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $844
line 1960
;1960:		delta *= 0.5;
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1961
;1961:	}
LABELV $844
line 1963
;1962:
;1963:	if ( delta < 1 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $846
line 1964
;1964:		return;
ADDRGP4 $809
JUMPV
LABELV $846
line 1967
;1965:	}
;1966:
;1967:	if ( pm->ps->pm_flags & PMF_DUCKED ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $848
line 1968
;1968:	{
line 1969
;1969:		if( delta >= 2 && !PM_InOnGroundAnim( pm->ps->legsAnim ) && !PM_InKnockDown( pm->ps ) && !BG_InRoll(pm->ps, pm->ps->legsAnim) &&
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
LTF4 $850
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 PM_InOnGroundAnim
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $850
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $850
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $850
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $850
line 1971
;1970:			pm->ps->forceHandExtend == HANDEXTEND_NONE )
;1971:		{//roll!
line 1972
;1972:			int anim = PM_TryRoll();
ADDRLP4 100
ADDRGP4 PM_TryRoll
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 100
INDIRI4
ASGNI4
line 1974
;1973:
;1974:			if (PM_InRollComplete(pm->ps, pm->ps->legsAnim))
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $852
line 1975
;1975:			{
line 1976
;1976:				anim = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 1977
;1977:				pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1978
;1978:				pm->ps->legsAnim = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 1979
;1979:				PM_SetAnim(SETANIM_BOTH,BOTH_LAND1,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150);
ADDRLP4 112
CNSTI4 3
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
CNSTI4 858
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1980
;1980:				pm->ps->legsTimer = TIMER_LAND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 130
ASGNI4
line 1981
;1981:			}
LABELV $852
line 1983
;1982:
;1983:			if ( anim )
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $854
line 1984
;1984:			{//absorb some impact
line 1985
;1985:				pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1986
;1986:				delta /= 3; // /= 2 just cancels out the above delta *= 2 when landing while crouched, the roll itself should absorb a little damage
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 1987
;1987:				pm->ps->legsAnim = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 1988
;1988:				PM_SetAnim(SETANIM_BOTH,anim,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150);
ADDRLP4 112
CNSTI4 3
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1989
;1989:				didRoll = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 1990
;1990:			}
LABELV $854
line 1991
;1991:		}
LABELV $850
line 1992
;1992:	}
LABELV $848
line 1996
;1993:
;1994:	// SURF_NODAMAGE is used for bounce pads where you don't ever
;1995:	// want to take damage or play a crunch sound
;1996:	if ( !(pml.groundTrace.surfaceFlags & SURF_NODAMAGE) )  {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
NEI4 $856
line 1997
;1997:		if (delta > 7)
ADDRLP4 0
INDIRF4
CNSTF4 1088421888
LEF4 $860
line 1998
;1998:		{
line 1999
;1999:			int delta_send = (int)delta;
ADDRLP4 76
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 2001
;2000:
;2001:			if (delta_send > 600)
ADDRLP4 76
INDIRI4
CNSTI4 600
LEI4 $862
line 2002
;2002:			{ //will never need to know any value above this
line 2003
;2003:				delta_send = 600;
ADDRLP4 76
CNSTI4 600
ASGNI4
line 2004
;2004:			}
LABELV $862
line 2006
;2005:
;2006:			if (pm->ps->fd.forceJumpZStart)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
EQF4 $864
line 2007
;2007:			{
line 2008
;2008:				if ((int)pm->ps->origin[2] >= (int)pm->ps->fd.forceJumpZStart)
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 80
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CVFI4 4
LTI4 $866
line 2009
;2009:				{ //was force jumping, landed on higher or same level as when force jump was started
line 2010
;2010:					if (delta_send > 8)
ADDRLP4 76
INDIRI4
CNSTI4 8
LEI4 $867
line 2011
;2011:					{
line 2012
;2012:						delta_send = 8;
ADDRLP4 76
CNSTI4 8
ASGNI4
line 2013
;2013:					}
line 2014
;2014:				}
ADDRGP4 $867
JUMPV
LABELV $866
line 2016
;2015:				else
;2016:				{
line 2017
;2017:					if (delta_send > 8)
ADDRLP4 76
INDIRI4
CNSTI4 8
LEI4 $870
line 2018
;2018:					{
line 2019
;2019:						int dif = ((int)pm->ps->fd.forceJumpZStart - (int)pm->ps->origin[2]);
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
ADDRLP4 92
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 92
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
SUBI4
ASGNI4
line 2020
;2020:						int dmgLess = (forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]] - dif);
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpHeight
ADDP4
INDIRF4
ADDRLP4 88
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 2022
;2021:
;2022:						if (dmgLess < 0)
ADDRLP4 84
INDIRI4
CNSTI4 0
GEI4 $872
line 2023
;2023:						{
line 2024
;2024:							dmgLess = 0;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 2025
;2025:						}
LABELV $872
line 2027
;2026:
;2027:						delta_send -= (dmgLess*0.3);
ADDRLP4 76
ADDRLP4 76
INDIRI4
CVIF4 4
CNSTF4 1050253722
ADDRLP4 84
INDIRI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 2029
;2028:
;2029:						if (delta_send < 8)
ADDRLP4 76
INDIRI4
CNSTI4 8
GEI4 $874
line 2030
;2030:						{
line 2031
;2031:							delta_send = 8;
ADDRLP4 76
CNSTI4 8
ASGNI4
line 2032
;2032:						}
LABELV $874
line 2035
;2033:
;2034:						//Com_Printf("Damage sub: %i\n", (int)((dmgLess*0.1)));
;2035:					}
LABELV $870
line 2036
;2036:				}
LABELV $867
line 2037
;2037:			}
LABELV $864
line 2039
;2038:
;2039:			if (didRoll)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $876
line 2040
;2040:			{ //Add the appropriate event..
line 2041
;2041:				PM_AddEventWithParm( EV_ROLL, delta_send );
CNSTI4 15
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 2042
;2042:			}
ADDRGP4 $861
JUMPV
LABELV $876
line 2044
;2043:			else
;2044:			{
line 2045
;2045:				PM_AddEventWithParm( EV_FALL, delta_send );
CNSTI4 11
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 2046
;2046:			}
line 2047
;2047:		}
ADDRGP4 $861
JUMPV
LABELV $860
line 2049
;2048:		else
;2049:		{
line 2050
;2050:			if (didRoll)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $878
line 2051
;2051:			{
line 2052
;2052:				PM_AddEventWithParm( EV_ROLL, 0 );
CNSTI4 15
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 2053
;2053:			}
ADDRGP4 $879
JUMPV
LABELV $878
line 2055
;2054:			else
;2055:			{
line 2056
;2056:				PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 76
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2057
;2057:			}
LABELV $879
line 2058
;2058:		}
LABELV $861
line 2059
;2059:	}
LABELV $856
line 2062
;2060:
;2061:	// make sure velocity resets so we don't bounce back up again in case we miss the clear elsewhere
;2062:	pm->ps->velocity[2] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 2065
;2063:
;2064:	// start footstep cycle over
;2065:	pm->ps->bobCycle = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 2066
;2066:}
LABELV $809
endproc PM_CrashLand 116 16
proc PM_CorrectAllSolid 36 28
line 2073
;2067:
;2068:/*
;2069:=============
;2070:PM_CorrectAllSolid
;2071:=============
;2072:*/
;2073:static int PM_CorrectAllSolid( trace_t *trace ) {
line 2077
;2074:	int			i, j, k;
;2075:	vec3_t		point;
;2076:
;2077:	if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $881
line 2078
;2078:		Com_Printf("%i:allsolid\n", c_pmove);
ADDRGP4 $883
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2079
;2079:	}
LABELV $881
line 2082
;2080:
;2081:	// jitter around
;2082:	for (i = -1; i <= 1; i++) {
ADDRLP4 20
CNSTI4 -1
ASGNI4
LABELV $884
line 2083
;2083:		for (j = -1; j <= 1; j++) {
ADDRLP4 16
CNSTI4 -1
ASGNI4
LABELV $888
line 2084
;2084:			for (k = -1; k <= 1; k++) {
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $892
line 2085
;2085:				VectorCopy(pm->ps->origin, point);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2086
;2086:				point[0] += (float) i;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2087
;2087:				point[1] += (float) j;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2088
;2088:				point[2] += (float) k;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2089
;2089:				pm->trace (trace, point, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 2090
;2090:				if ( !trace->allsolid ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $898
line 2091
;2091:					point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 2092
;2092:					point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 2093
;2093:					point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 2095
;2094:
;2095:					pm->trace (trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 2096
;2096:					pml.groundTrace = *trace;
ADDRGP4 pml+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 1080
line 2097
;2097:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $880
JUMPV
LABELV $898
line 2099
;2098:				}
;2099:			}
LABELV $893
line 2084
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LEI4 $892
line 2100
;2100:		}
LABELV $889
line 2083
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $888
line 2101
;2101:	}
LABELV $885
line 2082
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $884
line 2103
;2102:
;2103:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 2104
;2104:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2105
;2105:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2107
;2106:
;2107:	return qfalse;
CNSTI4 0
RETI4
LABELV $880
endproc PM_CorrectAllSolid 36 28
proc PM_GroundTraceMissed 1112 28
line 2117
;2108:}
;2109:
;2110:/*
;2111:=============
;2112:PM_GroundTraceMissed
;2113:
;2114:The ground trace didn't hit a surface, so we are in freefall
;2115:=============
;2116:*/
;2117:static void PM_GroundTraceMissed( void ) {
line 2123
;2118:	trace_t		trace;
;2119:	vec3_t		point;
;2120:
;2121:	//rww - don't want to do this when handextend_choke, because you can be standing on the ground
;2122:	//while still holding your throat.
;2123:	if ( pm->ps->pm_type == PM_FLOAT ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $906
line 2124
;2124:	{
line 2126
;2125:		//we're assuming this is because you're being choked
;2126:		int parts = SETANIM_LEGS;
ADDRLP4 1092
CNSTI4 2
ASGNI4
line 2130
;2127:
;2128:		//rww - also don't use SETANIM_FLAG_HOLD, it will cause the legs to float around a bit before going into
;2129:		//a proper anim even when on the ground.
;2130:		PM_SetAnim(parts, BOTH_CHOKE3, SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 1092
INDIRI4
ARGI4
CNSTI4 1032
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2131
;2131:	}
ADDRGP4 $907
JUMPV
LABELV $906
line 2133
;2132:	//If the anim is choke3, act like we just went into the air because we aren't in a float
;2133:	else if ( pm->ps->groundEntityNum != ENTITYNUM_NONE || (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_CHOKE3 ) 
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $910
ADDRLP4 1092
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 1032
NEI4 $908
LABELV $910
line 2134
;2134:	{
line 2136
;2135:		// we just transitioned into freefall
;2136:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $911
line 2137
;2137:			Com_Printf("%i:lift\n", c_pmove);
ADDRGP4 $913
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2138
;2138:		}
LABELV $911
line 2142
;2139:
;2140:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;2141:		// if we didn't do the trace, the player would be backflipping down staircases
;2142:		VectorCopy( pm->ps->origin, point );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2143
;2143:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 2145
;2144:
;2145:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 12
ARGP4
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 2146
;2146:		if ( trace.fraction == 1.0 || pm->ps->pm_type == PM_FLOAT ) {
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $918
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $909
LABELV $918
line 2147
;2147:			if ( pm->ps->velocity[2] <= 0 && !(pm->ps->pm_flags&PMF_JUMP_HELD))
ADDRLP4 1104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GTF4 $919
ADDRLP4 1104
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $919
line 2148
;2148:			{
line 2149
;2149:				PM_SetAnim(SETANIM_LEGS,BOTH_INAIR1,SETANIM_FLAG_OVERRIDE, 100);
CNSTI4 2
ARGI4
CNSTI4 857
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2150
;2150:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2151
;2151:			}
ADDRGP4 $920
JUMPV
LABELV $919
line 2152
;2152:			else if ( pm->cmd.forwardmove >= 0 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $921
line 2153
;2153:			{
line 2154
;2154:				PM_SetAnim(SETANIM_LEGS,BOTH_JUMP1,SETANIM_FLAG_OVERRIDE, 100);
CNSTI4 2
ARGI4
CNSTI4 856
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2155
;2155:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2156
;2156:			} 
ADDRGP4 $922
JUMPV
LABELV $921
line 2158
;2157:			else 
;2158:			{
line 2159
;2159:				PM_SetAnim(SETANIM_LEGS,BOTH_JUMPBACK1,SETANIM_FLAG_OVERRIDE, 100);
CNSTI4 2
ARGI4
CNSTI4 860
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2160
;2160:				pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2161
;2161:			}
LABELV $922
LABELV $920
line 2163
;2162:
;2163:			pm->ps->inAirAnim = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 1
ASGNI4
line 2164
;2164:		}
line 2165
;2165:	}
ADDRGP4 $909
JUMPV
LABELV $908
line 2166
;2166:	else if (!pm->ps->inAirAnim)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRI4
CNSTI4 0
NEI4 $923
line 2167
;2167:	{
line 2170
;2168:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;2169:		// if we didn't do the trace, the player would be backflipping down staircases
;2170:		VectorCopy( pm->ps->origin, point );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2171
;2171:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 2173
;2172:
;2173:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 12
ARGP4
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 2174
;2174:		if ( trace.fraction == 1.0 || pm->ps->pm_type == PM_FLOAT )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $929
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $926
LABELV $929
line 2175
;2175:		{
line 2176
;2176:			pm->ps->inAirAnim = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 1
ASGNI4
line 2177
;2177:		}
LABELV $926
line 2178
;2178:	}
LABELV $923
LABELV $909
LABELV $907
line 2180
;2179:
;2180:	if (PM_InRollComplete(pm->ps, pm->ps->legsAnim))
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
EQI4 $930
line 2181
;2181:	{ //Client won't catch an animation restart because it only checks frame against incoming frame, so if you roll when you land after rolling
line 2183
;2182:	  //off of something it won't replay the roll anim unless we switch it off in the air. This fixes that.
;2183:		PM_SetAnim(SETANIM_BOTH,BOTH_INAIR1,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150);
ADDRLP4 1104
CNSTI4 3
ASGNI4
ADDRLP4 1104
INDIRI4
ARGI4
CNSTI4 857
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2184
;2184:		pm->ps->inAirAnim = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 1
ASGNI4
line 2185
;2185:	}
LABELV $930
line 2187
;2186:
;2187:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 2188
;2188:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2189
;2189:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2190
;2190:}
LABELV $905
endproc PM_GroundTraceMissed 1112 28
proc PM_GroundTrace 1112 28
line 2198
;2191:
;2192:
;2193:/*
;2194:=============
;2195:PM_GroundTrace
;2196:=============
;2197:*/
;2198:static void PM_GroundTrace( void ) {
line 2202
;2199:	vec3_t		point;
;2200:	trace_t		trace;
;2201:
;2202:	point[0] = pm->ps->origin[0];
ADDRLP4 1080
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 2203
;2203:	point[1] = pm->ps->origin[1];
ADDRLP4 1080+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 2204
;2204:	point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 1080+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 2206
;2205:
;2206:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1096
ADDRLP4 1092
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 2207
;2207:	pml.groundTrace = trace;
ADDRGP4 pml+52
ADDRLP4 0
INDIRB
ASGNB 1080
line 2210
;2208:
;2209:	// do something corrective if the trace starts in a solid...
;2210:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $938
line 2211
;2211:		if ( !PM_CorrectAllSolid(&trace) )
ADDRLP4 0
ARGP4
ADDRLP4 1100
ADDRGP4 PM_CorrectAllSolid
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $940
line 2212
;2212:			return;
ADDRGP4 $934
JUMPV
LABELV $940
line 2213
;2213:	}
LABELV $938
line 2215
;2214:
;2215:	if (pm->ps->pm_type == PM_FLOAT)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $942
line 2216
;2216:	{
line 2217
;2217:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 2218
;2218:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2219
;2219:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2220
;2220:		return;
ADDRGP4 $934
JUMPV
LABELV $942
line 2224
;2221:	}
;2222:
;2223:	// if the trace didn't hit anything, we are in free fall
;2224:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $946
line 2225
;2225:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 2226
;2226:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2227
;2227:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2228
;2228:		return;
ADDRGP4 $934
JUMPV
LABELV $946
line 2232
;2229:	}
;2230:
;2231:	// check if getting thrown off the ground
;2232:	if ( pm->ps->velocity[2] > 0 && DotProduct( pm->ps->velocity, trace.plane.normal ) > 10 ) {
ADDRLP4 1100
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1100
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1104
INDIRF4
CNSTF4 0
LEF4 $951
ADDRLP4 1100
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
MULF4
ADDRLP4 1100
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1104
INDIRF4
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 1092616192
LEF4 $951
line 2233
;2233:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $958
line 2234
;2234:			Com_Printf("%i:kickoff\n", c_pmove);
ADDRGP4 $960
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2235
;2235:		}
LABELV $958
line 2237
;2236:		// go into jump animation
;2237:		if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $961
line 2238
;2238:			PM_ForceLegsAnim( BOTH_JUMP1 );
CNSTI4 856
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 2239
;2239:			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2240
;2240:		} else {
ADDRGP4 $962
JUMPV
LABELV $961
line 2241
;2241:			PM_ForceLegsAnim( BOTH_JUMPBACK1 );
CNSTI4 860
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 2242
;2242:			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2243
;2243:		}
LABELV $962
line 2245
;2244:
;2245:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 2246
;2246:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2247
;2247:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2248
;2248:		return;
ADDRGP4 $934
JUMPV
LABELV $951
line 2252
;2249:	}
;2250:	
;2251:	// slopes that are too steep will not be considered onground
;2252:	if ( trace.plane.normal[2] < MIN_WALK_NORMAL ) {
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $965
line 2253
;2253:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $969
line 2254
;2254:			Com_Printf("%i:steep\n", c_pmove);
ADDRGP4 $971
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2255
;2255:		}
LABELV $969
line 2256
;2256:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 2257
;2257:		pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 2258
;2258:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2259
;2259:		return;
ADDRGP4 $934
JUMPV
LABELV $965
line 2262
;2260:	}
;2261:
;2262:	pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 2263
;2263:	pml.walking = qtrue;
ADDRGP4 pml+44
CNSTI4 1
ASGNI4
line 2266
;2264:
;2265:	// hitting solid ground will end a waterjump
;2266:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $976
line 2267
;2267:	{
line 2268
;2268:		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 2269
;2269:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 2270
;2270:	}
LABELV $976
line 2272
;2271:
;2272:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $978
line 2274
;2273:		// just hit the ground
;2274:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $980
line 2275
;2275:			Com_Printf("%i:Land\n", c_pmove);
ADDRGP4 $982
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2276
;2276:		}
LABELV $980
line 2278
;2277:		
;2278:		PM_CrashLand();
ADDRGP4 PM_CrashLand
CALLV
pop
line 2281
;2279:
;2280:		// don't do landing time if we were just going down a slope
;2281:		if ( pml.previous_velocity[2] < -200 ) {
ADDRGP4 pml+1148+8
INDIRF4
CNSTF4 3276275712
GEF4 $983
line 2283
;2282:			// don't allow another jump for a little while
;2283:			pm->ps->pm_flags |= PMF_TIME_LAND;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 2284
;2284:			pm->ps->pm_time = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 250
ASGNI4
line 2285
;2285:		}
LABELV $983
line 2286
;2286:	}
LABELV $978
line 2288
;2287:
;2288:	pm->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 2289
;2289:	pm->ps->lastOnGround = pm->cmd.serverTime;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2291
;2290:
;2291:	PM_AddTouchEnt( trace.entityNum );
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 2292
;2292:}
LABELV $934
endproc PM_GroundTrace 1112 28
proc PM_SetWaterLevel 48 8
line 2300
;2293:
;2294:
;2295:/*
;2296:=============
;2297:PM_SetWaterLevel
;2298:=============
;2299:*/
;2300:static void PM_SetWaterLevel( void ) {
line 2309
;2301:	vec3_t		point;
;2302:	int			cont;
;2303:	int			sample1;
;2304:	int			sample2;
;2305:
;2306:	//
;2307:	// get waterlevel, accounting for ducking
;2308:	//
;2309:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 0
ASGNI4
line 2310
;2310:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 2312
;2311:
;2312:	point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 2313
;2313:	point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 2314
;2314:	point[2] = pm->ps->origin[2] + MINS_Z + 1;	
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2315
;2315:	cont = pm->pointcontents( point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 2317
;2316:
;2317:	if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $992
line 2318
;2318:		sample2 = pm->ps->viewheight - MINS_Z;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 2319
;2319:		sample1 = sample2 / 2;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 2321
;2320:
;2321:		pm->watertype = cont;
ADDRGP4 pm
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2322
;2322:		pm->waterlevel = 1;
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 1
ASGNI4
line 2323
;2323:		point[2] = pm->ps->origin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2324
;2324:		cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 2325
;2325:		if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $995
line 2326
;2326:			pm->waterlevel = 2;
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 2
ASGNI4
line 2327
;2327:			point[2] = pm->ps->origin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2328
;2328:			cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 2329
;2329:			if ( cont & MASK_WATER ){
ADDRLP4 12
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $998
line 2330
;2330:				pm->waterlevel = 3;
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 3
ASGNI4
line 2331
;2331:			}
LABELV $998
line 2332
;2332:		}
LABELV $995
line 2333
;2333:	}
LABELV $992
line 2335
;2334:
;2335:}
LABELV $989
endproc PM_SetWaterLevel 48 8
proc PM_CheckDuck 1112 28
line 2345
;2336:
;2337:/*
;2338:==============
;2339:PM_CheckDuck
;2340:
;2341:Sets mins, maxs, and pm->ps->viewheight
;2342:==============
;2343:*/
;2344:static void PM_CheckDuck (void)
;2345:{
line 2348
;2346:	trace_t	trace;
;2347:
;2348:	pm->mins[0] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 3245342720
ASGNF4
line 2349
;2349:	pm->mins[1] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 3245342720
ASGNF4
line 2351
;2350:
;2351:	pm->maxs[0] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1097859072
ASGNF4
line 2352
;2352:	pm->maxs[1] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTF4 1097859072
ASGNF4
line 2354
;2353:
;2354:	pm->mins[2] = MINS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 3250585600
ASGNF4
line 2356
;2355:
;2356:	if (pm->ps->pm_type == PM_DEAD)
ADDRLP4 1080
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 1080
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $1001
line 2357
;2357:	{
line 2358
;2358:		pm->maxs[2] = -8;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 3238002688
ASGNF4
line 2359
;2359:		pm->ps->viewheight = DEAD_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 -16
ASGNI4
line 2360
;2360:		return;
ADDRGP4 $1000
JUMPV
LABELV $1001
line 2363
;2361:	}
;2362:
;2363:	if (pm->ps->usingATST)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1003
line 2364
;2364:	{
line 2365
;2365:		if (pm->cmd.upmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1005
line 2366
;2366:		{
line 2367
;2367:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 2368
;2368:		}
LABELV $1005
line 2369
;2369:	}
LABELV $1003
line 2371
;2370:
;2371:	if (BG_InRoll(pm->ps, pm->ps->legsAnim))
ADDRLP4 1084
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 1088
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $1007
line 2372
;2372:	{
line 2373
;2373:		pm->maxs[2] = CROUCH_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 1098907648
ASGNF4
line 2374
;2374:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 2375
;2375:		pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2376
;2376:		pm->ps->pm_flags |= PMF_ROLLING;
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1096
INDIRP4
ADDRLP4 1096
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2377
;2377:		return;
ADDRGP4 $1000
JUMPV
LABELV $1007
line 2379
;2378:	}
;2379:	else if (pm->ps->pm_flags & PMF_ROLLING)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1009
line 2380
;2380:	{
line 2382
;2381:		// try to stand up
;2382:		pm->maxs[2] = DEFAULT_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 1109393408
ASGNF4
line 2383
;2383:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1096
ADDRLP4 1092
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 2384
;2384:		if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1010
line 2385
;2385:			pm->ps->pm_flags &= ~PMF_ROLLING;
ADDRLP4 1104
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1104
INDIRP4
ADDRLP4 1104
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2386
;2386:	}
ADDRGP4 $1010
JUMPV
LABELV $1009
line 2387
;2387:	else if (pm->cmd.upmove < 0 ||
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $1015
ADDRLP4 1092
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1013
LABELV $1015
line 2389
;2388:		pm->ps->forceHandExtend == HANDEXTEND_KNOCKDOWN)
;2389:	{	// duck
line 2390
;2390:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1096
INDIRP4
ADDRLP4 1096
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2391
;2391:	}
ADDRGP4 $1014
JUMPV
LABELV $1013
line 2393
;2392:	else
;2393:	{	// stand up if possible 
line 2394
;2394:		if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1016
line 2395
;2395:		{
line 2397
;2396:			// try to stand up
;2397:			pm->maxs[2] = DEFAULT_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 1109393408
ASGNF4
line 2398
;2398:			pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1100
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 2399
;2399:			if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1018
line 2400
;2400:				pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $1018
line 2401
;2401:		}
LABELV $1016
line 2402
;2402:	}
LABELV $1014
LABELV $1010
line 2404
;2403:
;2404:	if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1020
line 2405
;2405:	{
line 2406
;2406:		pm->maxs[2] = CROUCH_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 1098907648
ASGNF4
line 2407
;2407:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 12
ASGNI4
line 2408
;2408:	}
ADDRGP4 $1021
JUMPV
LABELV $1020
line 2409
;2409:	else if (pm->ps->pm_flags & PMF_ROLLING)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1022
line 2410
;2410:	{
line 2411
;2411:		pm->maxs[2] = CROUCH_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 1098907648
ASGNF4
line 2412
;2412:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 2413
;2413:	}
ADDRGP4 $1023
JUMPV
LABELV $1022
line 2415
;2414:	else
;2415:	{
line 2416
;2416:		pm->maxs[2] = DEFAULT_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 1109393408
ASGNF4
line 2417
;2417:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 2418
;2418:	}
LABELV $1023
LABELV $1021
line 2420
;2419:
;2420:	if (pm->ps->usingATST)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1024
line 2421
;2421:	{
line 2422
;2422:		pm->mins[0] = ATST_MINS0;
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 3256877056
ASGNF4
line 2423
;2423:		pm->mins[1] = ATST_MINS1;
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 3256877056
ASGNF4
line 2424
;2424:		pm->mins[2] = ATST_MINS2;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 3250585600
ASGNF4
line 2426
;2425:
;2426:		pm->maxs[0] = ATST_MAXS0;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1109393408
ASGNF4
line 2427
;2427:		pm->maxs[1] = ATST_MAXS1;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTF4 1109393408
ASGNF4
line 2428
;2428:		pm->maxs[2] = ATST_MAXS2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 1131937792
ASGNF4
line 2429
;2429:	}
LABELV $1024
line 2430
;2430:}
LABELV $1000
endproc PM_CheckDuck 1112 28
export PM_Use
proc PM_Use 4 0
line 2448
;2431:
;2432:
;2433:
;2434://===================================================================
;2435:
;2436:
;2437:
;2438:/*
;2439:==============
;2440:PM_Use
;2441:
;2442:Generates a use event
;2443:==============
;2444:*/
;2445:#define USE_DELAY 2000
;2446:
;2447:void PM_Use( void ) 
;2448:{
line 2449
;2449:	if ( pm->ps->useTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1027
line 2450
;2450:		pm->ps->useTime -= 100;//pm->cmd.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
LABELV $1027
line 2452
;2451:
;2452:	if ( pm->ps->useTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1029
line 2453
;2453:		return;
ADDRGP4 $1026
JUMPV
LABELV $1029
line 2456
;2454:	}
;2455:
;2456:	if ( ! (pm->cmd.buttons & BUTTON_USE ) )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1031
line 2457
;2457:	{
line 2458
;2458:		pm->useEvent = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 0
ASGNI4
line 2459
;2459:		pm->ps->useTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 0
ASGNI4
line 2460
;2460:		return;
ADDRGP4 $1026
JUMPV
LABELV $1031
line 2463
;2461:	}
;2462:
;2463:	pm->useEvent = EV_USE;
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 39
ASGNI4
line 2464
;2464:	pm->ps->useTime = USE_DELAY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 2000
ASGNI4
line 2465
;2465:}
LABELV $1026
endproc PM_Use 4 0
export PM_RunningAnim
proc PM_RunningAnim 16 0
line 2468
;2466:
;2467:qboolean PM_RunningAnim( int anim )
;2468:{
line 2469
;2469:	switch ( (anim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 8
CNSTI4 833
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1037
ADDRLP4 0
INDIRI4
CNSTI4 836
EQI4 $1037
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1034
LABELV $1038
ADDRLP4 0
INDIRI4
CNSTI4 850
EQI4 $1037
ADDRLP4 0
INDIRI4
CNSTI4 854
EQI4 $1037
ADDRLP4 0
INDIRI4
CNSTI4 855
EQI4 $1037
ADDRGP4 $1034
JUMPV
line 2470
;2470:	{
LABELV $1037
line 2476
;2471:	case BOTH_RUN1:			
;2472:	case BOTH_RUN2:			
;2473:	case BOTH_RUNBACK1:			
;2474:	case BOTH_RUNBACK2:			
;2475:	case BOTH_RUNAWAY1:			
;2476:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1033
JUMPV
line 2477
;2477:		break;
LABELV $1034
line 2479
;2478:	}
;2479:	return qfalse;
CNSTI4 0
RETI4
LABELV $1033
endproc PM_RunningAnim 16 0
proc PM_Footsteps 92 16
line 2487
;2480:}
;2481:
;2482:/*
;2483:===============
;2484:PM_Footsteps
;2485:===============
;2486:*/
;2487:static void PM_Footsteps( void ) {
line 2491
;2488:	float		bobmove;
;2489:	int			old;
;2490:	qboolean	footstep;
;2491:	int			setAnimFlags = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2493
;2492:
;2493:	if ( (PM_InSaberAnim( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) ) && !BG_SpinningSaberAnim( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) )) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 16
ADDRGP4 PM_InSaberAnim
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1043
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1052
LABELV $1043
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 571
EQI4 $1052
ADDRLP4 24
INDIRI4
CNSTI4 587
EQI4 $1052
ADDRLP4 24
INDIRI4
CNSTI4 588
EQI4 $1052
ADDRLP4 24
INDIRI4
CNSTI4 573
EQI4 $1052
ADDRLP4 24
INDIRI4
CNSTI4 562
EQI4 $1052
ADDRLP4 24
INDIRI4
CNSTI4 563
EQI4 $1052
ADDRLP4 24
INDIRI4
CNSTI4 1038
EQI4 $1052
ADDRLP4 24
INDIRI4
CNSTI4 1039
EQI4 $1052
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 PM_LandingAnim
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1052
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 32
ADDRGP4 PM_PainAnim
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1040
LABELV $1052
line 2504
;2494:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_STAND1 
;2495:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_STAND1TO2 
;2496:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_STAND2TO1 
;2497:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_STAND2 
;2498:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_SABERFAST_STANCE
;2499:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_SABERSLOW_STANCE
;2500:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_BUTTON_HOLD
;2501:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_BUTTON_RELEASE
;2502:		|| PM_LandingAnim( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) ) 
;2503:		|| PM_PainAnim( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) ))
;2504:	{//legs are in a saber anim, and not spinning, be sure to override it
line 2505
;2505:		setAnimFlags |= SETANIM_FLAG_OVERRIDE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2506
;2506:	}
LABELV $1040
line 2512
;2507:
;2508:	//
;2509:	// calculate speed and cycle to be used for
;2510:	// all cyclic walking effects
;2511:	//
;2512:	pm->xyspeed = sqrt( pm->ps->velocity[0] * pm->ps->velocity[0]
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 48
ADDRLP4 40
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 44
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 48
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 52
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 228
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 2515
;2513:		+  pm->ps->velocity[1] * pm->ps->velocity[1] );
;2514:
;2515:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1053
line 2518
;2516:
;2517:		// airborne leaves position in cycle intact, but doesn't advance
;2518:		if ( pm->waterlevel > 1 )
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1039
line 2519
;2519:		{
line 2520
;2520:			if (pm->xyspeed > 60)
ADDRGP4 pm
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
CNSTF4 1114636288
LEF4 $1057
line 2521
;2521:			{
line 2522
;2522:				PM_ContinueLegsAnim( BOTH_SWIMFORWARD );
CNSTI4 981
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2523
;2523:			}
ADDRGP4 $1039
JUMPV
LABELV $1057
line 2525
;2524:			else
;2525:			{
line 2526
;2526:				PM_ContinueLegsAnim( BOTH_SWIM_IDLE1 );
CNSTI4 980
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2527
;2527:			}
line 2528
;2528:		}
line 2529
;2529:		return;
ADDRGP4 $1039
JUMPV
LABELV $1053
line 2533
;2530:	}
;2531:
;2532:	// if not trying to move
;2533:	if ( !pm->cmd.forwardmove && !pm->cmd.rightmove ) {
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $1059
ADDRLP4 56
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $1059
line 2534
;2534:		if (  pm->xyspeed < 5 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
CNSTF4 1084227584
GEF4 $1039
line 2535
;2535:			pm->ps->bobCycle = 0;	// start at beginning of cycle again
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 2536
;2536:			if ( (pm->ps->pm_flags & PMF_DUCKED) || (pm->ps->pm_flags & PMF_ROLLING) ) {
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 68
INDIRI4
NEI4 $1065
ADDRLP4 64
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 68
INDIRI4
EQI4 $1063
LABELV $1065
line 2537
;2537:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1IDLE)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 797
EQI4 $1066
line 2538
;2538:				{
line 2539
;2539:					PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1IDLE, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 797
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2540
;2540:				}
ADDRGP4 $1039
JUMPV
LABELV $1066
line 2542
;2541:				else
;2542:				{
line 2543
;2543:					PM_ContinueLegsAnim( BOTH_CROUCH1IDLE );
CNSTI4 797
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2544
;2544:				}
line 2545
;2545:			} else {
ADDRGP4 $1039
JUMPV
LABELV $1063
line 2546
;2546:				if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1068
ADDRLP4 72
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1068
line 2547
;2547:				{
line 2548
;2548:					PM_ContinueLegsAnim( TORSO_WEAPONREADY4 );
CNSTI4 1102
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2549
;2549:				}
ADDRGP4 $1039
JUMPV
LABELV $1068
line 2551
;2550:				else
;2551:				{
line 2552
;2552:					if (pm->ps->weapon == WP_SABER && pm->ps->saberHolstered)
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1070
ADDRLP4 76
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1070
line 2553
;2553:					{
line 2554
;2554:						PM_ContinueLegsAnim( BOTH_STAND1 );
CNSTI4 571
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2555
;2555:					}
ADDRGP4 $1039
JUMPV
LABELV $1070
line 2557
;2556:					else
;2557:					{
line 2558
;2558:						PM_ContinueLegsAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2559
;2559:					}
line 2560
;2560:				}
line 2561
;2561:			}
line 2562
;2562:		}
line 2563
;2563:		return;
ADDRGP4 $1039
JUMPV
LABELV $1059
line 2567
;2564:	}
;2565:	
;2566:
;2567:	footstep = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2569
;2568:
;2569:	if ( pm->ps->pm_flags & PMF_DUCKED )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1072
line 2570
;2570:	{
line 2571
;2571:		int rolled = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 2573
;2572:
;2573:		bobmove = 0.5;	// ducked characters bob much faster
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 2575
;2574:
;2575:		if ( PM_RunningAnim( pm->ps->legsAnim ) && !BG_InRoll(pm->ps, pm->ps->legsAnim) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 PM_RunningAnim
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1074
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $1074
line 2576
;2576:		{//roll!
line 2577
;2577:			rolled = PM_TryRoll();
ADDRLP4 80
ADDRGP4 PM_TryRoll
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 80
INDIRI4
ASGNI4
line 2578
;2578:		}
LABELV $1074
line 2579
;2579:		if ( !rolled )
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $1076
line 2580
;2580:		{ //if the roll failed or didn't attempt, do standard crouching anim stuff.
line 2581
;2581:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1078
line 2582
;2582:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1WALKBACK)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 799
EQI4 $1080
line 2583
;2583:				{
line 2584
;2584:					PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1WALKBACK, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 799
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2585
;2585:				}
ADDRGP4 $1073
JUMPV
LABELV $1080
line 2587
;2586:				else
;2587:				{
line 2588
;2588:					PM_ContinueLegsAnim( BOTH_CROUCH1WALKBACK );
CNSTI4 799
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2589
;2589:				}
line 2590
;2590:			}
ADDRGP4 $1073
JUMPV
LABELV $1078
line 2591
;2591:			else {
line 2592
;2592:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1WALK)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 798
EQI4 $1082
line 2593
;2593:				{
line 2594
;2594:					PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1WALK, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 798
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2595
;2595:				}
ADDRGP4 $1073
JUMPV
LABELV $1082
line 2597
;2596:				else
;2597:				{
line 2598
;2598:					PM_ContinueLegsAnim( BOTH_CROUCH1WALK );
CNSTI4 798
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2599
;2599:				}
line 2600
;2600:			}
line 2601
;2601:		}
ADDRGP4 $1073
JUMPV
LABELV $1076
line 2603
;2602:		else
;2603:		{ //otherwise send us into the roll
line 2604
;2604:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 2605
;2605:			pm->ps->legsAnim = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 2606
;2606:			PM_SetAnim(SETANIM_BOTH,rolled,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150);
ADDRLP4 80
CNSTI4 3
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2607
;2607:			PM_AddEventWithParm( EV_ROLL, 0 );
CNSTI4 15
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 2608
;2608:			pm->maxs[2] = CROUCH_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 1098907648
ASGNF4
line 2609
;2609:			pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 2610
;2610:			pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2611
;2611:			pm->ps->pm_flags |= PMF_ROLLING;
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2612
;2612:		}
line 2613
;2613:	}
ADDRGP4 $1073
JUMPV
LABELV $1072
line 2614
;2614:	else if ((pm->ps->pm_flags & PMF_ROLLING) && !BG_InRoll(pm->ps, pm->ps->legsAnim) &&
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1084
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $1084
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $1084
line 2616
;2615:		!PM_InRollComplete(pm->ps, pm->ps->legsAnim))
;2616:	{
line 2617
;2617:		bobmove = 0.5;	// ducked characters bob much faster
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 2619
;2618:
;2619:		if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1086
line 2620
;2620:		{
line 2621
;2621:			if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1WALKBACK)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 799
EQI4 $1088
line 2622
;2622:			{
line 2623
;2623:				PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1WALKBACK, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 799
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2624
;2624:			}
ADDRGP4 $1085
JUMPV
LABELV $1088
line 2626
;2625:			else
;2626:			{
line 2627
;2627:				PM_ContinueLegsAnim( BOTH_CROUCH1WALKBACK );
CNSTI4 799
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2628
;2628:			}
line 2629
;2629:		}
ADDRGP4 $1085
JUMPV
LABELV $1086
line 2631
;2630:		else
;2631:		{
line 2632
;2632:			if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1WALK)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 798
EQI4 $1090
line 2633
;2633:			{
line 2634
;2634:				PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1WALK, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 798
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2635
;2635:			}
ADDRGP4 $1085
JUMPV
LABELV $1090
line 2637
;2636:			else
;2637:			{
line 2638
;2638:				PM_ContinueLegsAnim( BOTH_CROUCH1WALK );
CNSTI4 798
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2639
;2639:			}
line 2640
;2640:		}
line 2641
;2641:	}
ADDRGP4 $1085
JUMPV
LABELV $1084
line 2643
;2642:	else
;2643:	{
line 2644
;2644:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $1092
line 2645
;2645:			bobmove = 0.4f;	// faster speeds bob faster
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 2646
;2646:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1094
line 2647
;2647:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_RUNBACK1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 854
EQI4 $1096
line 2648
;2648:				{
line 2649
;2649:					PM_SetAnim(SETANIM_LEGS, BOTH_RUNBACK1, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 854
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2650
;2650:				}
ADDRGP4 $1095
JUMPV
LABELV $1096
line 2652
;2651:				else
;2652:				{
line 2653
;2653:					PM_ContinueLegsAnim( BOTH_RUNBACK1 );
CNSTI4 854
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2654
;2654:				}
line 2655
;2655:			}
ADDRGP4 $1095
JUMPV
LABELV $1094
line 2656
;2656:			else {
line 2657
;2657:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_RUN1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 833
EQI4 $1098
line 2658
;2658:				{
line 2659
;2659:					PM_SetAnim(SETANIM_LEGS, BOTH_RUN1, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 833
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2660
;2660:				}
ADDRGP4 $1099
JUMPV
LABELV $1098
line 2662
;2661:				else
;2662:				{
line 2663
;2663:					PM_ContinueLegsAnim( BOTH_RUN1 );
CNSTI4 833
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2664
;2664:				}
LABELV $1099
line 2665
;2665:			}
LABELV $1095
line 2666
;2666:			footstep = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2667
;2667:		} else {
ADDRGP4 $1093
JUMPV
LABELV $1092
line 2668
;2668:			bobmove = 0.2f;	// walking bobs slow
ADDRLP4 4
CNSTF4 1045220557
ASGNF4
line 2669
;2669:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1100
line 2670
;2670:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_WALKBACK1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 852
EQI4 $1102
line 2671
;2671:				{
line 2672
;2672:					PM_SetAnim(SETANIM_LEGS, BOTH_WALKBACK1, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 852
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2673
;2673:				}
ADDRGP4 $1101
JUMPV
LABELV $1102
line 2675
;2674:				else
;2675:				{
line 2676
;2676:					PM_ContinueLegsAnim( BOTH_WALKBACK1 );
CNSTI4 852
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2677
;2677:				}
line 2678
;2678:			}
ADDRGP4 $1101
JUMPV
LABELV $1100
line 2679
;2679:			else {
line 2680
;2680:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_WALK1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 822
EQI4 $1104
line 2681
;2681:				{
line 2682
;2682:					PM_SetAnim(SETANIM_LEGS, BOTH_WALK1, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 822
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2683
;2683:				}
ADDRGP4 $1105
JUMPV
LABELV $1104
line 2685
;2684:				else
;2685:				{
line 2686
;2686:					PM_ContinueLegsAnim( BOTH_WALK1 );
CNSTI4 822
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2687
;2687:				}
LABELV $1105
line 2688
;2688:			}
LABELV $1101
line 2689
;2689:		}
LABELV $1093
line 2690
;2690:	}
LABELV $1085
LABELV $1073
line 2693
;2691:
;2692:	// check for footstep / splash sounds
;2693:	old = pm->ps->bobCycle;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2694
;2694:	pm->ps->bobCycle = (int)( old + bobmove * pml.msec ) & 255;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
CNSTI4 255
BANDI4
ASGNI4
line 2697
;2695:
;2696:	// if we just crossed a cycle boundary, play an apropriate footstep event
;2697:	if ( ( ( old + 64 ) ^ ( pm->ps->bobCycle + 64 ) ) & 128 )
ADDRLP4 80
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
BXORI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1107
line 2698
;2698:	{
line 2699
;2699:		pm->ps->footstepTime = pm->cmd.serverTime + 300;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
INDIRP4
CNSTI4 1272
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 2700
;2700:		if ( pm->waterlevel == 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1109
line 2702
;2701:			// splashing
;2702:			PM_AddEvent( EV_FOOTSPLASH );
CNSTI4 4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2703
;2703:		} else if ( pm->waterlevel == 2 ) {
ADDRGP4 $1110
JUMPV
LABELV $1109
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1111
line 2705
;2704:			// wading / swimming at surface
;2705:			PM_AddEvent( EV_SWIM );
CNSTI4 6
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2706
;2706:		} else if ( pm->waterlevel == 3 ) {
ADDRGP4 $1112
JUMPV
LABELV $1111
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1113
line 2708
;2707:			// no sound when completely underwater
;2708:		}
LABELV $1113
LABELV $1112
LABELV $1110
line 2709
;2709:	}
LABELV $1107
line 2710
;2710:}
LABELV $1039
endproc PM_Footsteps 92 16
proc PM_WaterEvents 16 4
line 2719
;2711:
;2712:/*
;2713:==============
;2714:PM_WaterEvents
;2715:
;2716:Generate sound events for entering and leaving water
;2717:==============
;2718:*/
;2719:static void PM_WaterEvents( void ) {		// FIXME?
line 2723
;2720:	//
;2721:	// if just entered a water volume, play a sound
;2722:	//
;2723:	if (!pml.previous_waterlevel && pm->waterlevel) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 pml+1160
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1116
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1116
line 2724
;2724:		PM_AddEvent( EV_WATER_TOUCH );
CNSTI4 16
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2725
;2725:	}
LABELV $1116
line 2730
;2726:
;2727:	//
;2728:	// if just completely exited a water volume, play a sound
;2729:	//
;2730:	if (pml.previous_waterlevel && !pm->waterlevel) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 pml+1160
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1119
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1119
line 2731
;2731:		PM_AddEvent( EV_WATER_LEAVE );
CNSTI4 17
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2732
;2732:	}
LABELV $1119
line 2737
;2733:
;2734:	//
;2735:	// check for head just going under water
;2736:	//
;2737:	if (pml.previous_waterlevel != 3 && pm->waterlevel == 3) {
ADDRLP4 8
CNSTI4 3
ASGNI4
ADDRGP4 pml+1160
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1122
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1122
line 2738
;2738:		PM_AddEvent( EV_WATER_UNDER );
CNSTI4 18
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2739
;2739:	}
LABELV $1122
line 2744
;2740:
;2741:	//
;2742:	// check for head just coming out of water
;2743:	//
;2744:	if (pml.previous_waterlevel == 3 && pm->waterlevel != 3) {
ADDRLP4 12
CNSTI4 3
ASGNI4
ADDRGP4 pml+1160
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1125
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1125
line 2745
;2745:		PM_AddEvent( EV_WATER_CLEAR );
CNSTI4 19
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2746
;2746:	}
LABELV $1125
line 2747
;2747:}
LABELV $1115
endproc PM_WaterEvents 16 4
export PM_BeginWeaponChange
proc PM_BeginWeaponChange 8 4
line 2755
;2748:
;2749:
;2750:/*
;2751:===============
;2752:PM_BeginWeaponChange
;2753:===============
;2754:*/
;2755:void PM_BeginWeaponChange( int weapon ) {
line 2756
;2756:	if ( weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $1131
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1129
LABELV $1131
line 2757
;2757:		return;
ADDRGP4 $1128
JUMPV
LABELV $1129
line 2760
;2758:	}
;2759:
;2760:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $1132
line 2761
;2761:		return;
ADDRGP4 $1128
JUMPV
LABELV $1132
line 2764
;2762:	}
;2763:	
;2764:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1134
line 2765
;2765:		return;
ADDRGP4 $1128
JUMPV
LABELV $1134
line 2769
;2766:	}
;2767:
;2768:	// turn of any kind of zooming when weapon switching.
;2769:	if (pm->ps->zoomMode)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1136
line 2770
;2770:	{
line 2771
;2771:		pm->ps->zoomMode = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 2772
;2772:		pm->ps->zoomTime = pm->ps->commandTime;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1336
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 2773
;2773:	}
LABELV $1136
line 2775
;2774:
;2775:	PM_AddEvent( EV_CHANGE_WEAPON );
CNSTI4 23
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2776
;2776:	pm->ps->weaponstate = WEAPON_DROPPING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 2
ASGNI4
line 2777
;2777:	pm->ps->weaponTime += 200;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 2778
;2778:	PM_StartTorsoAnim( TORSO_DROPWEAP1 );
CNSTI4 1091
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2779
;2779:}
LABELV $1128
endproc PM_BeginWeaponChange 8 4
export PM_FinishWeaponChange
proc PM_FinishWeaponChange 12 4
line 2787
;2780:
;2781:
;2782:/*
;2783:===============
;2784:PM_FinishWeaponChange
;2785:===============
;2786:*/
;2787:void PM_FinishWeaponChange( void ) {
line 2790
;2788:	int		weapon;
;2789:
;2790:	weapon = pm->cmd.weapon;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 2791
;2791:	if ( weapon < WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1141
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1139
LABELV $1141
line 2792
;2792:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2793
;2793:	}
LABELV $1139
line 2795
;2794:
;2795:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $1142
line 2796
;2796:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2797
;2797:	}
LABELV $1142
line 2799
;2798:
;2799:	if (weapon == WP_SABER)
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $1144
line 2800
;2800:	{
line 2801
;2801:		PM_SetSaberMove(LS_DRAW);
CNSTI4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 2802
;2802:	}
ADDRGP4 $1145
JUMPV
LABELV $1144
line 2804
;2803:	else
;2804:	{
line 2805
;2805:		PM_StartTorsoAnim( TORSO_RAISEWEAP1);
CNSTI4 1095
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2806
;2806:	}
LABELV $1145
line 2807
;2807:	pm->ps->weapon = weapon;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2808
;2808:	pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 1
ASGNI4
line 2809
;2809:	pm->ps->weaponTime += 250;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 2810
;2810:}
LABELV $1138
endproc PM_FinishWeaponChange 12 4
proc PM_DoChargedWeapons 1208 28
line 2817
;2811:
;2812:
;2813:
;2814://---------------------------------------
;2815:static qboolean PM_DoChargedWeapons( void )
;2816://---------------------------------------
;2817:{
line 2820
;2818:	vec3_t		ang;
;2819:	trace_t		tr;
;2820:	qboolean	charging = qfalse,
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2821
;2821:				altFire = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2824
;2822:
;2823:	// If you want your weapon to be a charging weapon, just set this bit up
;2824:	switch( pm->ps->weapon )
ADDRLP4 1100
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 3
LTI4 $1147
ADDRLP4 1100
INDIRI4
CNSTI4 11
GTI4 $1147
ADDRLP4 1100
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1221-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1221
address $1150
address $1147
address $1216
address $1153
address $1147
address $1213
address $1147
address $1156
address $1208
code
line 2825
;2825:	{
LABELV $1150
line 2830
;2826:	//------------------
;2827:	case WP_BRYAR_PISTOL:
;2828:
;2829:		// alt-fire charges the weapon
;2830:		if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1148
line 2831
;2831:		{
line 2832
;2832:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2833
;2833:			altFire = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2834
;2834:		}
line 2835
;2835:		break;
ADDRGP4 $1148
JUMPV
LABELV $1153
line 2841
;2836:	
;2837:	//------------------
;2838:	case WP_BOWCASTER:
;2839:
;2840:		// primary fire charges the weapon
;2841:		if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1148
line 2842
;2842:		{
line 2843
;2843:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2844
;2844:		}
line 2845
;2845:		break;
ADDRGP4 $1148
JUMPV
LABELV $1156
line 2852
;2846:	
;2847:	//------------------
;2848:	case WP_ROCKET_LAUNCHER:
;2849:
;2850:		// Not really a charge weapon, but we still want to delay fire until the button comes up so that we can
;2851:		//	implement our alt-fire locking stuff
;2852:		if ( (pm->cmd.buttons & BUTTON_ALT_ATTACK) && pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] >= weaponData[pm->ps->weapon].altEnergyPerShot )
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1148
ADDRLP4 1112
ADDRLP4 1108
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1116
CNSTI4 56
ADDRLP4 1112
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 1116
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1112
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 1116
INDIRI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
LTI4 $1148
line 2853
;2853:		{
line 2856
;2854:			vec3_t muzzleOffPoint, muzzlePoint, forward, right, up;
;2855:
;2856:			AngleVectors( pm->ps->viewangles, forward, right, up );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 1144
ARGP4
ADDRLP4 1156
ARGP4
ADDRLP4 1168
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2858
;2857:
;2858:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2859
;2859:			altFire = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2861
;2860:
;2861:			AngleVectors(pm->ps->viewangles, ang, NULL, NULL);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1180
CNSTP4 0
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2863
;2862:
;2863:			VectorCopy( pm->ps->origin, muzzlePoint );
ADDRLP4 1120
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2864
;2864:			VectorCopy(WP_MuzzlePoint[WP_ROCKET_LAUNCHER], muzzleOffPoint);
ADDRLP4 1132
ADDRGP4 WP_MuzzlePoint+120
INDIRB
ASGNB 12
line 2866
;2865:
;2866:			VectorMA(muzzlePoint, muzzleOffPoint[0], forward, muzzlePoint);
ADDRLP4 1184
ADDRLP4 1132
INDIRF4
ASGNF4
ADDRLP4 1120
ADDRLP4 1120
INDIRF4
ADDRLP4 1144
INDIRF4
ADDRLP4 1184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+4
ADDRLP4 1120+4
INDIRF4
ADDRLP4 1144+4
INDIRF4
ADDRLP4 1184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+8
ADDRLP4 1120+8
INDIRF4
ADDRLP4 1144+8
INDIRF4
ADDRLP4 1132
INDIRF4
MULF4
ADDF4
ASGNF4
line 2867
;2867:			VectorMA(muzzlePoint, muzzleOffPoint[1], right, muzzlePoint);
ADDRLP4 1120
ADDRLP4 1120
INDIRF4
ADDRLP4 1156
INDIRF4
ADDRLP4 1132+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+4
ADDRLP4 1120+4
INDIRF4
ADDRLP4 1156+4
INDIRF4
ADDRLP4 1132+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+8
ADDRLP4 1120+8
INDIRF4
ADDRLP4 1156+8
INDIRF4
ADDRLP4 1132+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2868
;2868:			muzzlePoint[2] += pm->ps->viewheight + muzzleOffPoint[2];
ADDRLP4 1120+8
ADDRLP4 1120+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 1132+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 2870
;2869:
;2870:			ang[0] = muzzlePoint[0] + ang[0]*2048;
ADDRLP4 8
ADDRLP4 1120
INDIRF4
CNSTF4 1157627904
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2871
;2871:			ang[1] = muzzlePoint[1] + ang[1]*2048;
ADDRLP4 8+4
ADDRLP4 1120+4
INDIRF4
CNSTF4 1157627904
ADDRLP4 8+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2872
;2872:			ang[2] = muzzlePoint[2] + ang[2]*2048;
ADDRLP4 8+8
ADDRLP4 1120+8
INDIRF4
CNSTF4 1157627904
ADDRLP4 8+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2874
;2873:
;2874:			pm->trace(&tr, muzzlePoint, NULL, NULL, ang, pm->ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 20
ARGP4
ADDRLP4 1120
ARGP4
ADDRLP4 1188
CNSTP4 0
ASGNP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1192
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRLP4 1192
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 2876
;2875:
;2876:			if (tr.fraction != 1 && tr.entityNum < MAX_CLIENTS && tr.entityNum != pm->ps->clientNum)
ADDRLP4 20+8
INDIRF4
CNSTF4 1065353216
EQF4 $1184
ADDRLP4 20+52
INDIRI4
CNSTI4 32
GEI4 $1184
ADDRLP4 20+52
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
EQI4 $1184
line 2877
;2877:			{
line 2878
;2878:				if (pm->ps->rocketLockIndex == MAX_CLIENTS)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 32
NEI4 $1189
line 2879
;2879:				{
line 2880
;2880:					pm->ps->rocketLockIndex = tr.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
ADDRLP4 20+52
INDIRI4
ASGNI4
line 2881
;2881:					pm->ps->rocketLockTime = pm->cmd.serverTime;
ADDRLP4 1196
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 1196
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2882
;2882:				}
ADDRGP4 $1190
JUMPV
LABELV $1189
line 2883
;2883:				else if (pm->ps->rocketLockIndex != tr.entityNum && pm->ps->rocketTargetTime < pm->cmd.serverTime)
ADDRLP4 1196
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1200
ADDRLP4 1196
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ADDRLP4 20+52
INDIRI4
EQI4 $1192
ADDRLP4 1200
INDIRP4
CNSTI4 592
ADDP4
INDIRF4
ADDRLP4 1196
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
GEF4 $1192
line 2884
;2884:				{
line 2885
;2885:					pm->ps->rocketLockIndex = tr.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
ADDRLP4 20+52
INDIRI4
ASGNI4
line 2886
;2886:					pm->ps->rocketLockTime = pm->cmd.serverTime;
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 1204
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2887
;2887:				}
ADDRGP4 $1193
JUMPV
LABELV $1192
line 2888
;2888:				else if (pm->ps->rocketLockIndex == tr.entityNum)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ADDRLP4 20+52
INDIRI4
NEI4 $1196
line 2889
;2889:				{
line 2890
;2890:					if (pm->ps->rocketLockTime == -1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $1199
line 2891
;2891:					{
line 2892
;2892:						pm->ps->rocketLockTime = pm->ps->rocketLastValidTime;
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 1204
INDIRP4
CNSTI4 584
ADDP4
INDIRF4
ASGNF4
line 2893
;2893:					}
LABELV $1199
line 2894
;2894:				}
LABELV $1196
LABELV $1193
LABELV $1190
line 2896
;2895:
;2896:				if (pm->ps->rocketLockIndex == tr.entityNum)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ADDRLP4 20+52
INDIRI4
NEI4 $1148
line 2897
;2897:				{
line 2898
;2898:					pm->ps->rocketTargetTime = pm->cmd.serverTime + 500;
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 1204
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 2899
;2899:				}
line 2900
;2900:			}
ADDRGP4 $1148
JUMPV
LABELV $1184
line 2901
;2901:			else if (pm->ps->rocketTargetTime < pm->cmd.serverTime)
ADDRLP4 1196
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
INDIRP4
CNSTI4 592
ADDP4
INDIRF4
ADDRLP4 1196
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
GEF4 $1204
line 2902
;2902:			{
line 2903
;2903:				pm->ps->rocketLockIndex = MAX_CLIENTS;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 2904
;2904:				pm->ps->rocketLockTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 2905
;2905:			}
ADDRGP4 $1148
JUMPV
LABELV $1204
line 2907
;2906:			else
;2907:			{
line 2908
;2908:				if (pm->ps->rocketLockTime != -1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
CNSTF4 3212836864
EQF4 $1206
line 2909
;2909:				{
line 2910
;2910:					pm->ps->rocketLastValidTime = pm->ps->rocketLockTime;
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CNSTI4 584
ADDP4
ADDRLP4 1200
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
ASGNF4
line 2911
;2911:				}
LABELV $1206
line 2912
;2912:				pm->ps->rocketLockTime = -1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 3212836864
ASGNF4
line 2913
;2913:			}
line 2914
;2914:		}
line 2915
;2915:		break;
ADDRGP4 $1148
JUMPV
LABELV $1208
line 2920
;2916:
;2917:	//------------------
;2918:	case WP_THERMAL:
;2919:
;2920:		if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1209
line 2921
;2921:		{
line 2922
;2922:			altFire = qtrue; // override default of not being an alt-fire
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2923
;2923:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2924
;2924:		}
ADDRGP4 $1148
JUMPV
LABELV $1209
line 2925
;2925:		else if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1148
line 2926
;2926:		{
line 2927
;2927:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2928
;2928:		}
line 2929
;2929:		break;
ADDRGP4 $1148
JUMPV
LABELV $1213
line 2932
;2930:
;2931:	case WP_DEMP2:
;2932:		if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1148
line 2933
;2933:		{
line 2934
;2934:			altFire = qtrue; // override default of not being an alt-fire
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2935
;2935:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2936
;2936:		}
line 2937
;2937:		break;
ADDRGP4 $1148
JUMPV
LABELV $1216
line 2940
;2938:
;2939:	case WP_DISRUPTOR:
;2940:		if ((pm->cmd.buttons & BUTTON_ATTACK) &&
ADDRLP4 1120
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1124
CNSTI4 1
ASGNI4
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 1120
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 1124
INDIRI4
BANDI4
ADDRLP4 1128
INDIRI4
EQI4 $1217
ADDRLP4 1132
ADDRLP4 1120
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
ADDRLP4 1124
INDIRI4
NEI4 $1217
ADDRLP4 1132
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1217
line 2943
;2941:			pm->ps->zoomMode == 1 &&
;2942:			pm->ps->zoomLocked)
;2943:		{
line 2944
;2944:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2945
;2945:			altFire = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2946
;2946:		}
LABELV $1217
line 2948
;2947:
;2948:		if (pm->ps->zoomMode != 1 &&
ADDRLP4 1136
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1219
ADDRLP4 1136
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1219
line 2950
;2949:			pm->ps->weaponstate == WEAPON_CHARGING_ALT)
;2950:		{
line 2951
;2951:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 2952
;2952:			charging = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2953
;2953:			altFire = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2954
;2954:		}
LABELV $1219
line 2956
;2955:
;2956:	} // end switch
LABELV $1147
LABELV $1148
line 2961
;2957:
;2958:
;2959:	// set up the appropriate weapon state based on the button that's down.  
;2960:	//	Note that we ALWAYS return if charging is set ( meaning the buttons are still down )
;2961:	if ( charging )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1223
line 2962
;2962:	{
line 2963
;2963:		if ( altFire )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1225
line 2964
;2964:		{
line 2965
;2965:			if ( pm->ps->weaponstate != WEAPON_CHARGING_ALT )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1227
line 2966
;2966:			{
line 2968
;2967:				// charge isn't started, so do it now
;2968:				pm->ps->weaponstate = WEAPON_CHARGING_ALT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 5
ASGNI4
line 2969
;2969:				pm->ps->weaponChargeTime = pm->cmd.serverTime;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2970
;2970:				pm->ps->weaponChargeSubtractTime = pm->cmd.serverTime + weaponData[pm->ps->weapon].altChargeSubTime;
ADDRLP4 1112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1112
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1112
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 56
ADDRLP4 1116
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+36
ADDP4
INDIRI4
ADDI4
ASGNI4
line 2975
;2971:
;2972:#ifdef _DEBUG
;2973:				Com_Printf("Starting charge\n");
;2974:#endif
;2975:				assert(pm->ps->weapon > WP_NONE);
line 2976
;2976:				BG_AddPredictableEventToPlayerstate(EV_WEAPON_CHARGE_ALT, pm->ps->weapon, pm->ps);
CNSTI4 96
ARGI4
ADDRLP4 1120
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 2977
;2977:			}
LABELV $1227
line 2979
;2978:
;2979:			if (pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < (weaponData[pm->ps->weapon].altChargeSub+weaponData[pm->ps->weapon].altEnergyPerShot))
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1112
CNSTI4 56
ADDRLP4 1108
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 1112
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1108
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 1112
INDIRI4
ADDRGP4 weaponData+44
ADDP4
INDIRI4
ADDRLP4 1112
INDIRI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
ADDI4
GEI4 $1230
line 2980
;2980:			{
line 2981
;2981:				pm->ps->weaponstate = WEAPON_CHARGING_ALT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 5
ASGNI4
line 2983
;2982:
;2983:				goto rest;
ADDRGP4 $1234
JUMPV
LABELV $1230
line 2985
;2984:			}
;2985:			else if ((pm->cmd.serverTime - pm->ps->weaponChargeTime) < weaponData[pm->ps->weapon].altMaxCharge)
ADDRLP4 1116
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1116
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 1120
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CNSTI4 56
ADDRLP4 1120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+52
ADDP4
INDIRI4
GEI4 $1226
line 2986
;2986:			{
line 2987
;2987:				if (pm->ps->weaponChargeSubtractTime < pm->cmd.serverTime)
ADDRLP4 1124
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 1124
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $1226
line 2988
;2988:				{
line 2989
;2989:					pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] -= weaponData[pm->ps->weapon].altChargeSub;
ADDRLP4 1128
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1132
CNSTI4 56
ADDRLP4 1128
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1132
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1128
INDIRP4
CNSTI4 408
ADDP4
ADDP4
ASGNP4
ADDRLP4 1136
INDIRP4
ADDRLP4 1136
INDIRP4
INDIRI4
ADDRLP4 1132
INDIRI4
ADDRGP4 weaponData+44
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2990
;2990:					pm->ps->weaponChargeSubtractTime = pm->cmd.serverTime + weaponData[pm->ps->weapon].altChargeSubTime;
ADDRLP4 1140
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1144
ADDRLP4 1140
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 56
ADDRLP4 1144
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+36
ADDP4
INDIRI4
ADDI4
ASGNI4
line 2991
;2991:				}
line 2992
;2992:			}
line 2993
;2993:		}
ADDRGP4 $1226
JUMPV
LABELV $1225
line 2995
;2994:		else
;2995:		{
line 2996
;2996:			if ( pm->ps->weaponstate != WEAPON_CHARGING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 4
EQI4 $1242
line 2997
;2997:			{
line 2999
;2998:				// charge isn't started, so do it now
;2999:				pm->ps->weaponstate = WEAPON_CHARGING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 4
ASGNI4
line 3000
;3000:				pm->ps->weaponChargeTime = pm->cmd.serverTime;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3001
;3001:				pm->ps->weaponChargeSubtractTime = pm->cmd.serverTime + weaponData[pm->ps->weapon].chargeSubTime;
ADDRLP4 1112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1112
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1112
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 56
ADDRLP4 1116
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3006
;3002:
;3003:#ifdef _DEBUG
;3004:				Com_Printf("Starting charge\n");
;3005:#endif
;3006:				BG_AddPredictableEventToPlayerstate(EV_WEAPON_CHARGE, pm->ps->weapon, pm->ps);
CNSTI4 95
ARGI4
ADDRLP4 1120
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 3007
;3007:			}
LABELV $1242
line 3009
;3008:
;3009:			if (pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < (weaponData[pm->ps->weapon].chargeSub+weaponData[pm->ps->weapon].energyPerShot))
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1112
CNSTI4 56
ADDRLP4 1108
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 1112
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1108
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 1112
INDIRI4
ADDRGP4 weaponData+40
ADDP4
INDIRI4
ADDRLP4 1112
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
ADDI4
GEI4 $1245
line 3010
;3010:			{
line 3011
;3011:				pm->ps->weaponstate = WEAPON_CHARGING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 4
ASGNI4
line 3013
;3012:
;3013:				goto rest;
ADDRGP4 $1234
JUMPV
LABELV $1245
line 3015
;3014:			}
;3015:			else if ((pm->cmd.serverTime - pm->ps->weaponChargeTime) < weaponData[pm->ps->weapon].maxCharge)
ADDRLP4 1116
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1116
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 1120
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CNSTI4 56
ADDRLP4 1120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+48
ADDP4
INDIRI4
GEI4 $1249
line 3016
;3016:			{
line 3017
;3017:				if (pm->ps->weaponChargeSubtractTime < pm->cmd.serverTime)
ADDRLP4 1124
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 1124
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $1252
line 3018
;3018:				{
line 3019
;3019:					pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] -= weaponData[pm->ps->weapon].chargeSub;
ADDRLP4 1128
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1132
CNSTI4 56
ADDRLP4 1128
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1132
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1128
INDIRP4
CNSTI4 408
ADDP4
ADDP4
ASGNP4
ADDRLP4 1136
INDIRP4
ADDRLP4 1136
INDIRP4
INDIRI4
ADDRLP4 1132
INDIRI4
ADDRGP4 weaponData+40
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3020
;3020:					pm->ps->weaponChargeSubtractTime = pm->cmd.serverTime + weaponData[pm->ps->weapon].chargeSubTime;
ADDRLP4 1140
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1144
ADDRLP4 1140
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 56
ADDRLP4 1144
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3021
;3021:				}
LABELV $1252
line 3022
;3022:			}
LABELV $1249
line 3023
;3023:		}
LABELV $1226
line 3025
;3024:
;3025:		return qtrue; // short-circuit rest of weapon code
CNSTI4 1
RETI4
ADDRGP4 $1146
JUMPV
LABELV $1223
LABELV $1234
line 3030
;3026:	}
;3027:rest:
;3028:	// Only charging weapons should be able to set these states...so....
;3029:	//	let's see which fire mode we need to set up now that the buttons are up
;3030:	if ( pm->ps->weaponstate == WEAPON_CHARGING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1256
line 3031
;3031:	{
line 3038
;3032:		// weapon has a charge, so let us do an attack
;3033:#ifdef _DEBUG
;3034:		Com_Printf("Firing.  Charge time=%d\n", pm->cmd.serverTime - pm->ps->weaponChargeTime);
;3035:#endif
;3036:
;3037:		// dumb, but since we shoot a charged weapon on button-up, we need to repress this button for now
;3038:		pm->cmd.buttons |= BUTTON_ATTACK;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 3039
;3039:		pm->ps->eFlags |= EF_FIRING;
ADDRLP4 1112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 3040
;3040:	}
ADDRGP4 $1257
JUMPV
LABELV $1256
line 3041
;3041:	else if ( pm->ps->weaponstate == WEAPON_CHARGING_ALT )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1258
line 3042
;3042:	{
line 3049
;3043:		// weapon has a charge, so let us do an alt-attack
;3044:#ifdef _DEBUG
;3045:		Com_Printf("Firing.  Charge time=%d\n", pm->cmd.serverTime - pm->ps->weaponChargeTime);
;3046:#endif
;3047:
;3048:		// dumb, but since we shoot a charged weapon on button-up, we need to repress this button for now
;3049:		pm->cmd.buttons |= BUTTON_ALT_ATTACK;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 3050
;3050:		pm->ps->eFlags |= (EF_FIRING|EF_ALT_FIRING);
ADDRLP4 1112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRI4
CNSTI4 768
BORI4
ASGNI4
line 3051
;3051:	}
LABELV $1258
LABELV $1257
line 3053
;3052:
;3053:	return qfalse; // continue with the rest of the weapon code
CNSTI4 0
RETI4
LABELV $1146
endproc PM_DoChargedWeapons 1208 28
export PM_ItemUsable
proc PM_ItemUsable 1236 28
line 3061
;3054:}
;3055:
;3056:
;3057:#define BOWCASTER_CHARGE_UNIT	200.0f	// bowcaster charging gives us one more unit every 200ms--if you change this, you'll have to do the same in g_weapon
;3058:#define BRYAR_CHARGE_UNIT		200.0f	// bryar charging gives us one more unit every 200ms--if you change this, you'll have to do the same in g_weapon
;3059:
;3060:int PM_ItemUsable(playerState_t *ps, int forcedUse)
;3061:{
line 3068
;3062:	vec3_t fwd, fwdorg, dest, pos;
;3063:	vec3_t yawonly;
;3064:	vec3_t mins, maxs;
;3065:	vec3_t trtest;
;3066:	trace_t tr;
;3067:
;3068:	if (ps->usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1261
line 3069
;3069:	{
line 3070
;3070:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1261
line 3073
;3071:	}
;3072:
;3073:	if (ps->pm_flags & PMF_USE_ITEM_HELD)
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1263
line 3074
;3074:	{ //force to let go first
line 3075
;3075:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1263
line 3078
;3076:	}
;3077:
;3078:	if (ps->duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1265
line 3079
;3079:	{ //not allowed to use holdables while in a private duel.
line 3080
;3080:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1265
line 3083
;3081:	}
;3082:
;3083:	if (!forcedUse)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1267
line 3084
;3084:	{
line 3085
;3085:		forcedUse = bg_itemlist[ps->stats[STAT_HOLDABLE_ITEM]].giTag;
ADDRFP4 4
CNSTI4 52
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 3086
;3086:	}
LABELV $1267
line 3088
;3087:
;3088:	switch (forcedUse)
ADDRLP4 1176
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 1
LTI4 $1270
ADDRLP4 1176
INDIRI4
CNSTI4 6
GTI4 $1270
ADDRLP4 1176
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1330-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1330
address $1278
address $1308
address $1272
address $1270
address $1270
address $1281
code
line 3089
;3089:	{
LABELV $1272
line 3091
;3090:	case HI_MEDPAC:
;3091:		if (ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH])
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 1180
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LTI4 $1273
line 3092
;3092:		{
line 3093
;3093:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1273
line 3095
;3094:		}
;3095:		if (ps->stats[STAT_HEALTH] <= 0 ||
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
CNSTI4 0
ASGNI4
ADDRLP4 1184
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 1188
INDIRI4
LEI4 $1277
ADDRLP4 1184
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1188
INDIRI4
EQI4 $1275
LABELV $1277
line 3097
;3096:			(ps->eFlags & EF_DEAD))
;3097:		{
line 3098
;3098:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1275
line 3101
;3099:		}
;3100:
;3101:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1278
line 3103
;3102:	case HI_SEEKER:
;3103:		if (ps->eFlags & EF_SEEKERDRONE)
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $1279
line 3104
;3104:		{
line 3105
;3105:			PM_AddEventWithParm(EV_ITEMUSEFAIL, SEEKER_ALREADYDEPLOYED);
CNSTI4 56
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3106
;3106:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1279
line 3109
;3107:		}
;3108:
;3109:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1281
line 3111
;3110:	case HI_SENTRY_GUN:
;3111:		if (ps->fd.sentryDeployed)
ADDRFP4 0
INDIRP4
CNSTI4 1224
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1282
line 3112
;3112:		{
line 3113
;3113:			PM_AddEventWithParm(EV_ITEMUSEFAIL, SENTRY_ALREADYPLACED);
CNSTI4 56
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3114
;3114:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1282
line 3117
;3115:		}
;3116:
;3117:		yawonly[ROLL] = 0;
ADDRLP4 1140+8
CNSTF4 0
ASGNF4
line 3118
;3118:		yawonly[PITCH] = 0;
ADDRLP4 1140
CNSTF4 0
ASGNF4
line 3119
;3119:		yawonly[YAW] = ps->viewangles[YAW];
ADDRLP4 1140+4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 3121
;3120:
;3121:		VectorSet( mins, -8, -8, 0 );
ADDRLP4 1192
CNSTF4 3238002688
ASGNF4
ADDRLP4 1092
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 3122
;3122:		VectorSet( maxs, 8, 8, 24 );
ADDRLP4 1196
CNSTF4 1090519040
ASGNF4
ADDRLP4 1104
ADDRLP4 1196
INDIRF4
ASGNF4
ADDRLP4 1104+4
ADDRLP4 1196
INDIRF4
ASGNF4
ADDRLP4 1104+8
CNSTF4 1103101952
ASGNF4
line 3124
;3123:
;3124:		AngleVectors(yawonly, fwd, NULL, NULL);
ADDRLP4 1140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1200
CNSTP4 0
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3126
;3125:
;3126:		fwdorg[0] = ps->origin[0] + fwd[0]*64;
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 3127
;3127:		fwdorg[1] = ps->origin[1] + fwd[1]*64;
ADDRLP4 1116+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3128
;3128:		fwdorg[2] = ps->origin[2] + fwd[2]*64;
ADDRLP4 1116+8
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3130
;3129:
;3130:		trtest[0] = fwdorg[0] + fwd[0]*16;
ADDRLP4 1152
ADDRLP4 1116
INDIRF4
CNSTF4 1098907648
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 3131
;3131:		trtest[1] = fwdorg[1] + fwd[1]*16;
ADDRLP4 1152+4
ADDRLP4 1116+4
INDIRF4
CNSTF4 1098907648
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3132
;3132:		trtest[2] = fwdorg[2] + fwd[2]*16;
ADDRLP4 1152+8
ADDRLP4 1116+8
INDIRF4
CNSTF4 1098907648
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3134
;3133:
;3134:		pm->trace(&tr, ps->origin, mins, maxs, trtest, ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 12
ARGP4
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1204
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 3136
;3135:
;3136:		if ((tr.fraction != 1 && tr.entityNum != ps->clientNum) || tr.startsolid || tr.allsolid)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $1306
ADDRLP4 12+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $1307
LABELV $1306
ADDRLP4 1208
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1208
INDIRI4
NEI4 $1307
ADDRLP4 12
INDIRI4
ADDRLP4 1208
INDIRI4
EQI4 $1300
LABELV $1307
line 3137
;3137:		{
line 3138
;3138:			PM_AddEventWithParm(EV_ITEMUSEFAIL, SENTRY_NOROOM);
CNSTI4 56
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3139
;3139:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1300
line 3142
;3140:		}
;3141:
;3142:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1308
line 3144
;3143:	case HI_SHIELD:
;3144:		mins[0] = -8;
ADDRLP4 1092
CNSTF4 3238002688
ASGNF4
line 3145
;3145:		mins[1] = -8;
ADDRLP4 1092+4
CNSTF4 3238002688
ASGNF4
line 3146
;3146:		mins[2] = 0;
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 3148
;3147:
;3148:		maxs[0] = 8;
ADDRLP4 1104
CNSTF4 1090519040
ASGNF4
line 3149
;3149:		maxs[1] = 8;
ADDRLP4 1104+4
CNSTF4 1090519040
ASGNF4
line 3150
;3150:		maxs[2] = 8;
ADDRLP4 1104+8
CNSTF4 1090519040
ASGNF4
line 3152
;3151:
;3152:		AngleVectors (ps->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1212
CNSTP4 0
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3153
;3153:		fwd[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 3154
;3154:		VectorMA(ps->origin, 64, fwd, dest);
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1220
CNSTF4 1115684864
ASGNF4
ADDRLP4 1128
ADDRLP4 1216
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1128+4
ADDRLP4 1216
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1128+8
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3155
;3155:		pm->trace(&tr, ps->origin, mins, maxs, dest, ps->clientNum, MASK_SHOT );
ADDRLP4 12
ARGP4
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1224
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 3156
;3156:		if (tr.fraction > 0.9 && !tr.startsolid && !tr.allsolid)
ADDRLP4 12+8
INDIRF4
CNSTF4 1063675494
LEF4 $1318
ADDRLP4 1228
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1228
INDIRI4
NEI4 $1318
ADDRLP4 12
INDIRI4
ADDRLP4 1228
INDIRI4
NEI4 $1318
line 3157
;3157:		{
line 3158
;3158:			VectorCopy(tr.endpos, pos);
ADDRLP4 1164
ADDRLP4 12+12
INDIRB
ASGNB 12
line 3159
;3159:			VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
ADDRLP4 1128
ADDRLP4 1164
INDIRF4
ASGNF4
ADDRLP4 1128+4
ADDRLP4 1164+4
INDIRF4
ASGNF4
ADDRLP4 1128+8
ADDRLP4 1164+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 3160
;3160:			pm->trace( &tr, pos, mins, maxs, dest, ps->clientNum, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1128
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 3161
;3161:			if ( !tr.startsolid && !tr.allsolid )
ADDRLP4 1232
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1232
INDIRI4
NEI4 $1327
ADDRLP4 12
INDIRI4
ADDRLP4 1232
INDIRI4
NEI4 $1327
line 3162
;3162:			{
line 3163
;3163:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1327
line 3165
;3164:			}
;3165:		}
LABELV $1318
line 3166
;3166:		PM_AddEventWithParm(EV_ITEMUSEFAIL, SHIELD_NOROOM);
CNSTI4 56
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3167
;3167:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1260
JUMPV
LABELV $1270
line 3169
;3168:	default:
;3169:		return 1;
CNSTI4 1
RETI4
LABELV $1260
endproc PM_ItemUsable 1236 28
proc PM_Weapon 156 16
line 3181
;3170:	}
;3171:}
;3172:
;3173:/*
;3174:==============
;3175:PM_Weapon
;3176:
;3177:Generates weapon events and modifes the weapon counter
;3178:==============
;3179:*/
;3180:static void PM_Weapon( void )
;3181:{
line 3184
;3182:	int		addTime;
;3183:	int amount;
;3184:	int		killAfterItem = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3186
;3185:
;3186:	if (pm->ps->usingATST)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1333
line 3187
;3187:	{
line 3188
;3188:		if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1335
line 3189
;3189:		{
line 3190
;3190:			pm->ps->weaponTime -= pml.msec;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 3191
;3191:		}
LABELV $1335
line 3193
;3192:
;3193:		if (pm->ps->weaponTime < 1 && (pm->cmd.buttons & (BUTTON_ATTACK|BUTTON_ALT_ATTACK)))
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1332
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 129
BANDI4
CNSTI4 0
EQI4 $1332
line 3194
;3194:		{
line 3195
;3195:			pm->ps->weaponTime += 500;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3197
;3196:
;3197:			if (pm->ps->atstAltFire)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1340
line 3198
;3198:			{
line 3199
;3199:				PM_AddEvent( EV_ALT_FIRE );
CNSTI4 25
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3200
;3200:				pm->ps->atstAltFire = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1320
ADDP4
CNSTI4 0
ASGNI4
line 3201
;3201:			}
ADDRGP4 $1332
JUMPV
LABELV $1340
line 3203
;3202:			else
;3203:			{
line 3204
;3204:				PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3205
;3205:				pm->ps->atstAltFire = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1320
ADDP4
CNSTI4 1
ASGNI4
line 3206
;3206:			}
line 3207
;3207:		}
line 3209
;3208:
;3209:		return;
ADDRGP4 $1332
JUMPV
LABELV $1333
line 3212
;3210:	}
;3211:
;3212:	if (pm->ps->weapon != WP_DISRUPTOR && pm->ps->weapon != WP_ROCKET_LAUNCHER)
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 5
EQI4 $1342
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $1342
line 3213
;3213:	{ //check for exceeding max charge time if not using disruptor or rocket launcher
line 3214
;3214:		if ( pm->ps->weaponstate == WEAPON_CHARGING_ALT )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1344
line 3215
;3215:		{
line 3216
;3216:			int timeDif = (pm->cmd.serverTime - pm->ps->weaponChargeTime);
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3218
;3217:
;3218:			if (timeDif > MAX_WEAPON_CHARGE_TIME)
ADDRLP4 16
INDIRI4
CNSTI4 5000
LEI4 $1346
line 3219
;3219:			{
line 3220
;3220:				pm->cmd.buttons &= ~BUTTON_ALT_ATTACK;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
CNSTI4 20
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
line 3221
;3221:			}
LABELV $1346
line 3222
;3222:		}
LABELV $1344
line 3224
;3223:
;3224:		if ( pm->ps->weaponstate == WEAPON_CHARGING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1348
line 3225
;3225:		{
line 3226
;3226:			int timeDif = (pm->cmd.serverTime - pm->ps->weaponChargeTime);
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3228
;3227:
;3228:			if (timeDif > MAX_WEAPON_CHARGE_TIME)
ADDRLP4 16
INDIRI4
CNSTI4 5000
LEI4 $1350
line 3229
;3229:			{
line 3230
;3230:				pm->cmd.buttons &= ~BUTTON_ATTACK;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 3231
;3231:			}
LABELV $1350
line 3232
;3232:		}
LABELV $1348
line 3233
;3233:	}
LABELV $1342
line 3235
;3234:
;3235:	if (pm->ps->forceHandExtend == HANDEXTEND_WEAPONREADY)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1352
line 3236
;3236:	{ //reset into weapon stance
line 3237
;3237:		if (pm->ps->weapon != WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1354
line 3238
;3238:		{ //saber handles its own anims
line 3239
;3239:			if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1356
ADDRLP4 16
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1356
line 3240
;3240:			{
line 3242
;3241:				//PM_StartTorsoAnim( TORSO_WEAPONREADY4 );
;3242:				PM_StartTorsoAnim( TORSO_RAISEWEAP1);
CNSTI4 1095
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3243
;3243:			}
ADDRGP4 $1357
JUMPV
LABELV $1356
line 3245
;3244:			else
;3245:			{
line 3246
;3246:				if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1358
line 3247
;3247:				{
line 3248
;3248:					PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3249
;3249:				}
ADDRGP4 $1359
JUMPV
LABELV $1358
line 3251
;3250:				else
;3251:				{
line 3253
;3252:					//PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
;3253:					PM_StartTorsoAnim( TORSO_RAISEWEAP1);
CNSTI4 1095
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3254
;3254:				}
LABELV $1359
line 3255
;3255:			}
LABELV $1357
line 3256
;3256:		}
LABELV $1354
line 3260
;3257:
;3258:		//we now go into a weapon raise anim after every force hand extend.
;3259:		//this is so that my holster-view-weapon-when-hand-extend stuff works.
;3260:		pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 1
ASGNI4
line 3261
;3261:		pm->ps->weaponTime += 250;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 3263
;3262:
;3263:		pm->ps->forceHandExtend = HANDEXTEND_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 3264
;3264:	}
ADDRGP4 $1353
JUMPV
LABELV $1352
line 3265
;3265:	else if (pm->ps->forceHandExtend != HANDEXTEND_NONE)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1360
line 3266
;3266:	{ //nothing else should be allowed to happen during this time, including weapon fire
line 3267
;3267:		int desiredAnim = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 3268
;3268:		qboolean seperateOnTorso = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 3269
;3269:		int desiredOnTorso = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 3271
;3270:
;3271:		switch(pm->ps->forceHandExtend)
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $1362
ADDRLP4 28
INDIRI4
CNSTI4 10
GTI4 $1362
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1386-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1386
address $1365
address $1366
address $1367
address $1368
address $1369
address $1362
address $1370
address $1371
address $1384
address $1385
code
line 3272
;3272:		{
LABELV $1365
line 3274
;3273:		case HANDEXTEND_FORCEPUSH:
;3274:			desiredAnim = BOTH_FORCEPUSH;
ADDRLP4 16
CNSTI4 1041
ASGNI4
line 3275
;3275:			break;
ADDRGP4 $1363
JUMPV
LABELV $1366
line 3277
;3276:		case HANDEXTEND_FORCEPULL:
;3277:			desiredAnim = BOTH_FORCEPULL;
ADDRLP4 16
CNSTI4 1042
ASGNI4
line 3278
;3278:			break;
ADDRGP4 $1363
JUMPV
LABELV $1367
line 3280
;3279:		case HANDEXTEND_FORCEGRIP:
;3280:			desiredAnim = BOTH_FORCEGRIP_HOLD;
ADDRLP4 16
CNSTI4 1056
ASGNI4
line 3281
;3281:			break;
ADDRGP4 $1363
JUMPV
LABELV $1368
line 3283
;3282:		case HANDEXTEND_SABERPULL:
;3283:			desiredAnim = BOTH_SABERPULL;
ADDRLP4 16
CNSTI4 1052
ASGNI4
line 3284
;3284:			break;
ADDRGP4 $1363
JUMPV
LABELV $1369
line 3286
;3285:		case HANDEXTEND_CHOKE:
;3286:			desiredAnim = BOTH_CHOKE3; //left-handed choke
ADDRLP4 16
CNSTI4 1032
ASGNI4
line 3287
;3287:			break;
ADDRGP4 $1363
JUMPV
LABELV $1370
line 3289
;3288:		case HANDEXTEND_DODGE:
;3289:			desiredAnim = pm->ps->forceDodgeAnim;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
ASGNI4
line 3290
;3290:			break;
ADDRGP4 $1363
JUMPV
LABELV $1371
line 3292
;3291:		case HANDEXTEND_KNOCKDOWN:
;3292:			if (pm->ps->forceDodgeAnim)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1372
line 3293
;3293:			{
line 3294
;3294:				if (pm->ps->forceDodgeAnim > 4)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 4
LEI4 $1374
line 3295
;3295:				{ //this means that we want to play a sepereate anim on the torso
line 3296
;3296:					int originalDAnim = pm->ps->forceDodgeAnim-8; //-8 is the original legs anim
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 3297
;3297:					if (originalDAnim == 2)
ADDRLP4 36
INDIRI4
CNSTI4 2
NEI4 $1376
line 3298
;3298:					{
line 3299
;3299:						desiredAnim = BOTH_FORCE_GETUP_B1;
ADDRLP4 16
CNSTI4 938
ASGNI4
line 3300
;3300:					}
ADDRGP4 $1377
JUMPV
LABELV $1376
line 3301
;3301:					else if (originalDAnim == 3)
ADDRLP4 36
INDIRI4
CNSTI4 3
NEI4 $1378
line 3302
;3302:					{
line 3303
;3303:						desiredAnim = BOTH_FORCE_GETUP_B3;
ADDRLP4 16
CNSTI4 940
ASGNI4
line 3304
;3304:					}
ADDRGP4 $1379
JUMPV
LABELV $1378
line 3306
;3305:					else
;3306:					{
line 3307
;3307:						desiredAnim = BOTH_GETUP1;
ADDRLP4 16
CNSTI4 929
ASGNI4
line 3308
;3308:					}
LABELV $1379
LABELV $1377
line 3311
;3309:
;3310:					//now specify the torso anim
;3311:					seperateOnTorso = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 3312
;3312:					desiredOnTorso = BOTH_FORCEPUSH;
ADDRLP4 24
CNSTI4 1041
ASGNI4
line 3313
;3313:				}
ADDRGP4 $1363
JUMPV
LABELV $1374
line 3314
;3314:				else if (pm->ps->forceDodgeAnim == 2)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1380
line 3315
;3315:				{
line 3316
;3316:					desiredAnim = BOTH_FORCE_GETUP_B1;
ADDRLP4 16
CNSTI4 938
ASGNI4
line 3317
;3317:				}
ADDRGP4 $1363
JUMPV
LABELV $1380
line 3318
;3318:				else if (pm->ps->forceDodgeAnim == 3)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1382
line 3319
;3319:				{
line 3320
;3320:					desiredAnim = BOTH_FORCE_GETUP_B3;
ADDRLP4 16
CNSTI4 940
ASGNI4
line 3321
;3321:				}
ADDRGP4 $1363
JUMPV
LABELV $1382
line 3323
;3322:				else
;3323:				{
line 3324
;3324:					desiredAnim = BOTH_GETUP1;
ADDRLP4 16
CNSTI4 929
ASGNI4
line 3325
;3325:				}
line 3326
;3326:			}
ADDRGP4 $1363
JUMPV
LABELV $1372
line 3328
;3327:			else
;3328:			{
line 3329
;3329:				desiredAnim = BOTH_KNOCKDOWN1;
ADDRLP4 16
CNSTI4 924
ASGNI4
line 3330
;3330:			}
line 3331
;3331:			break;
ADDRGP4 $1363
JUMPV
LABELV $1384
line 3333
;3332:		case HANDEXTEND_DUELCHALLENGE:
;3333:			desiredAnim = BOTH_ENGAGETAUNT;
ADDRLP4 16
CNSTI4 904
ASGNI4
line 3334
;3334:			break;
ADDRGP4 $1363
JUMPV
LABELV $1385
line 3336
;3335:		case HANDEXTEND_TAUNT:
;3336:			desiredAnim = pm->ps->forceDodgeAnim;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
ASGNI4
line 3337
;3337:			break;
ADDRGP4 $1363
JUMPV
LABELV $1362
line 3350
;3338:			//Hmm... maybe use these, too?
;3339:			//BOTH_FORCEHEAL_QUICK //quick heal (SP level 2 & 3)
;3340:			//BOTH_MINDTRICK1 // wave (maybe for mind trick 2 & 3 - whole area, and for force seeing)
;3341:			//BOTH_MINDTRICK2 // tap (maybe for mind trick 1 - one person)
;3342:			//BOTH_FORCEGRIP_START //start grip
;3343:			//BOTH_FORCEGRIP_HOLD //hold grip
;3344:			//BOTH_FORCEGRIP_RELEASE //release grip
;3345:			//BOTH_FORCELIGHTNING //quick lightning burst (level 1)
;3346:			//BOTH_FORCELIGHTNING_START //start lightning
;3347:			//BOTH_FORCELIGHTNING_HOLD //hold lightning
;3348:			//BOTH_FORCELIGHTNING_RELEASE //release lightning
;3349:		default:
;3350:			desiredAnim = BOTH_FORCEPUSH;
ADDRLP4 16
CNSTI4 1041
ASGNI4
line 3351
;3351:			break;
LABELV $1363
line 3354
;3352:		}
;3353:
;3354:		if (!seperateOnTorso)
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1388
line 3355
;3355:		{ //of seperateOnTorso, handle it after setting the legs
line 3356
;3356:			PM_SetAnim(SETANIM_TORSO, desiredAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 1
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3357
;3357:			pm->ps->torsoTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 3358
;3358:		}
LABELV $1388
line 3360
;3359:
;3360:		if (pm->ps->forceHandExtend == HANDEXTEND_DODGE || pm->ps->forceHandExtend == HANDEXTEND_KNOCKDOWN ||
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 7
EQI4 $1393
ADDRLP4 40
INDIRI4
CNSTI4 8
EQI4 $1393
ADDRLP4 40
INDIRI4
CNSTI4 5
NEI4 $1332
ADDRLP4 36
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1332
LABELV $1393
line 3362
;3361:			(pm->ps->forceHandExtend == HANDEXTEND_CHOKE && pm->ps->groundEntityNum == ENTITYNUM_NONE) )
;3362:		{ //special case, play dodge anim on whole body, choke anim too if off ground
line 3363
;3363:			if (seperateOnTorso)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1394
line 3364
;3364:			{
line 3365
;3365:				PM_SetAnim(SETANIM_LEGS, desiredAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3366
;3366:				pm->ps->legsTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 3368
;3367:
;3368:				PM_SetAnim(SETANIM_TORSO, desiredOnTorso, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 1
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3369
;3369:				pm->ps->torsoTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 3370
;3370:			}
ADDRGP4 $1332
JUMPV
LABELV $1394
line 3372
;3371:			else
;3372:			{
line 3373
;3373:				PM_SetAnim(SETANIM_LEGS, desiredAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3374
;3374:				pm->ps->legsTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 3375
;3375:			}
line 3376
;3376:		}
line 3378
;3377:
;3378:		return;
ADDRGP4 $1332
JUMPV
LABELV $1360
LABELV $1353
line 3381
;3379:	}
;3380:
;3381:	if (BG_InSpecialJump(pm->ps->legsAnim) ||
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $1399
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1399
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1396
LABELV $1399
line 3384
;3382:		BG_InRoll(pm->ps, pm->ps->legsAnim) ||
;3383:		PM_InRollComplete(pm->ps, pm->ps->legsAnim))
;3384:	{
line 3385
;3385:		pm->cmd.weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 2
ASGNU1
line 3386
;3386:		pm->ps->weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 3387
;3387:	}
LABELV $1396
line 3389
;3388:
;3389:	if (pm->ps->duelInProgress)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1400
line 3390
;3390:	{
line 3391
;3391:		pm->cmd.weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 2
ASGNU1
line 3392
;3392:		pm->ps->weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 3394
;3393:
;3394:		if (pm->ps->duelTime >= pm->cmd.serverTime)
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $1402
line 3395
;3395:		{
line 3396
;3396:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 3397
;3397:			pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 3398
;3398:			pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 3399
;3399:		}
LABELV $1402
line 3400
;3400:	}
LABELV $1400
line 3402
;3401:
;3402:	if (pm->ps->weapon == WP_SABER && pm->ps->saberMove != LS_READY && pm->ps->saberMove != LS_NONE)
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1404
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
EQI4 $1404
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $1404
line 3403
;3403:	{
line 3404
;3404:		pm->cmd.weapon = WP_SABER; //don't allow switching out mid-attack
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 2
ASGNU1
line 3405
;3405:	}
LABELV $1404
line 3407
;3406:
;3407:	if (pm->ps->weapon == WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1406
line 3408
;3408:	{
line 3410
;3409:		//rww - we still need the item stuff, so we won't return immediately
;3410:		PM_WeaponLightsaber();
ADDRGP4 PM_WeaponLightsaber
CALLV
pop
line 3411
;3411:		killAfterItem = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 3412
;3412:	}
ADDRGP4 $1407
JUMPV
LABELV $1406
line 3414
;3413:	else
;3414:	{
line 3415
;3415:		pm->ps->saberHolstered = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 0
ASGNI4
line 3416
;3416:	}
LABELV $1407
line 3418
;3417:
;3418:	if (pm->ps->weapon == WP_THERMAL ||
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 11
EQI4 $1411
ADDRLP4 44
INDIRI4
CNSTI4 12
EQI4 $1411
ADDRLP4 44
INDIRI4
CNSTI4 13
NEI4 $1408
LABELV $1411
line 3421
;3419:		pm->ps->weapon == WP_TRIP_MINE ||
;3420:		pm->ps->weapon == WP_DET_PACK)
;3421:	{
line 3422
;3422:		if (pm->ps->weapon == WP_THERMAL)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 11
NEI4 $1412
line 3423
;3423:		{
line 3424
;3424:			if ((pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == WeaponAttackAnim[pm->ps->weapon] &&
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRLP4 48
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponAttackAnim
ADDP4
INDIRI4
NEI4 $1413
ADDRLP4 48
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 200
SUBI4
CNSTI4 0
GTI4 $1413
line 3426
;3425:				(pm->ps->weaponTime-200) <= 0)
;3426:			{
line 3427
;3427:				PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3428
;3428:			}
line 3429
;3429:		}
ADDRGP4 $1413
JUMPV
LABELV $1412
line 3431
;3430:		else
;3431:		{
line 3432
;3432:			if ((pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == WeaponAttackAnim[pm->ps->weapon] &&
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRLP4 48
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponAttackAnim
ADDP4
INDIRI4
NEI4 $1416
ADDRLP4 48
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 700
SUBI4
CNSTI4 0
GTI4 $1416
line 3434
;3433:				(pm->ps->weaponTime-700) <= 0)
;3434:			{
line 3435
;3435:				PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3436
;3436:			}
LABELV $1416
line 3437
;3437:		}
LABELV $1413
line 3438
;3438:	}
LABELV $1408
line 3441
;3439:
;3440:	// don't allow attack until all buttons are up
;3441:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1418
line 3442
;3442:		return;
ADDRGP4 $1332
JUMPV
LABELV $1418
line 3446
;3443:	}
;3444:
;3445:	// ignore if spectator
;3446:	if ( pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1420
line 3447
;3447:		return;
ADDRGP4 $1332
JUMPV
LABELV $1420
line 3451
;3448:	}
;3449:
;3450:	// check for dead player
;3451:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1422
line 3452
;3452:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 3453
;3453:		return;
ADDRGP4 $1332
JUMPV
LABELV $1422
line 3457
;3454:	}
;3455:
;3456:	// check for item using
;3457:	if ( pm->cmd.buttons & BUTTON_USE_HOLDABLE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1424
line 3458
;3458:		if ( ! ( pm->ps->pm_flags & PMF_USE_ITEM_HELD ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $1425
line 3460
;3459:
;3460:			if (!pm->ps->stats[STAT_HOLDABLE_ITEM])
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1428
line 3461
;3461:			{
line 3462
;3462:				return;
ADDRGP4 $1332
JUMPV
LABELV $1428
line 3465
;3463:			}
;3464:
;3465:			if (!PM_ItemUsable(pm->ps, 0))
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 PM_ItemUsable
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $1430
line 3466
;3466:			{
line 3467
;3467:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 3468
;3468:				return;
ADDRGP4 $1332
JUMPV
LABELV $1430
line 3471
;3469:			}
;3470:			else
;3471:			{
line 3472
;3472:				if (pm->ps->stats[STAT_HOLDABLE_ITEMS] & (1 << bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag))
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
CNSTI4 52
ADDRLP4 52
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1332
line 3473
;3473:				{
line 3474
;3474:					if (bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag != HI_BINOCULARS)
CNSTI4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1433
line 3475
;3475:					{ //never use up the binoculars
line 3476
;3476:						pm->ps->stats[STAT_HOLDABLE_ITEMS] -= (1 << bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag);
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
CNSTI4 52
ADDRLP4 56
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
LSHI4
SUBI4
ASGNI4
line 3477
;3477:					}
line 3478
;3478:				}
line 3480
;3479:				else
;3480:				{
line 3481
;3481:					return; //this should not happen...
LABELV $1433
line 3484
;3482:				}
;3483:
;3484:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 3485
;3485:				PM_AddEvent( EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag );
CNSTI4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 40
ADDI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3487
;3486:
;3487:				if (bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag != HI_BINOCULARS)
CNSTI4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1332
line 3488
;3488:				{
line 3489
;3489:					pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 3490
;3490:					BG_CycleInven(pm->ps, 1);
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_CycleInven
CALLV
pop
line 3491
;3491:				}
line 3492
;3492:			}
line 3493
;3493:			return;
ADDRGP4 $1332
JUMPV
line 3495
;3494:		}
;3495:	} else {
LABELV $1424
line 3496
;3496:		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 3497
;3497:	}
LABELV $1425
line 3499
;3498:
;3499:	if (pm->ps->weapon == WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1443
line 3500
;3500:	{ //we can't toggle zoom while using saber (for obvious reasons) so make sure it's always off
line 3501
;3501:		pm->ps->zoomMode = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 3502
;3502:		pm->ps->zoomFov = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 0
ASGNF4
line 3503
;3503:		pm->ps->zoomLocked = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 3504
;3504:		pm->ps->zoomLockTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1348
ADDP4
CNSTI4 0
ASGNI4
line 3505
;3505:	}
LABELV $1443
line 3507
;3506:
;3507:	if (killAfterItem)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1445
line 3508
;3508:	{
line 3509
;3509:		return;
ADDRGP4 $1332
JUMPV
LABELV $1445
line 3513
;3510:	}
;3511:
;3512:	// make weapon function
;3513:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1447
line 3514
;3514:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 3515
;3515:	}
LABELV $1447
line 3517
;3516:
;3517:	if (pm->ps->isJediMaster && pm->ps->emplacedIndex)
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1450
ADDRLP4 48
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1450
line 3518
;3518:	{
line 3519
;3519:		pm->ps->emplacedIndex = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 3520
;3520:	}
LABELV $1450
line 3522
;3521:
;3522:	if (pm->ps->duelInProgress && pm->ps->emplacedIndex)
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1452
ADDRLP4 56
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1452
line 3523
;3523:	{
line 3524
;3524:		pm->ps->emplacedIndex = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 3525
;3525:	}
LABELV $1452
line 3527
;3526:
;3527:	if (pm->ps->weapon == WP_EMPLACED_GUN && pm->ps->emplacedIndex)
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1454
ADDRLP4 64
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1454
line 3528
;3528:	{
line 3529
;3529:		pm->cmd.weapon = WP_EMPLACED_GUN; //No switch for you!
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 14
ASGNU1
line 3530
;3530:		PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3531
;3531:	}
LABELV $1454
line 3533
;3532:
;3533:	if (pm->ps->isJediMaster || pm->ps->duelInProgress || pm->ps->trueJedi)
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $1459
ADDRLP4 68
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $1459
ADDRLP4 68
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $1456
LABELV $1459
line 3534
;3534:	{
line 3535
;3535:		pm->cmd.weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 2
ASGNU1
line 3536
;3536:		pm->ps->weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 3538
;3537:
;3538:		if (pm->ps->isJediMaster || pm->ps->trueJedi)
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $1462
ADDRLP4 76
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $1460
LABELV $1462
line 3539
;3539:		{
line 3540
;3540:			pm->ps->stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 3541
;3541:		}
LABELV $1460
line 3542
;3542:	}
LABELV $1456
line 3544
;3543:
;3544:	amount = weaponData[pm->ps->weapon].energyPerShot;
ADDRLP4 4
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
ASGNI4
line 3547
;3545:
;3546:	// take an ammo away if not infinite
;3547:	if ( pm->ps->weapon != WP_NONE &&
ADDRLP4 76
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 76
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $1464
ADDRLP4 84
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
NEI4 $1464
ADDRLP4 80
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $1466
ADDRLP4 80
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1464
LABELV $1466
line 3550
;3548:		pm->ps->weapon == pm->cmd.weapon &&
;3549:		(pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING) )
;3550:	{
line 3551
;3551:		if ( pm->ps->ammo[ weaponData[pm->ps->weapon].ammoIndex ] != -1 )
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
CNSTI4 56
ADDRLP4 92
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 92
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1467
line 3552
;3552:		{
line 3554
;3553:			// enough energy to fire this weapon?
;3554:			if (pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < weaponData[pm->ps->weapon].energyPerShot &&
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
CNSTI4 56
ADDRLP4 96
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 104
ADDRLP4 100
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 96
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
ADDRLP4 100
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
GEI4 $1469
ADDRLP4 104
INDIRI4
ADDRLP4 100
INDIRI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
GEI4 $1469
line 3556
;3555:				pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < weaponData[pm->ps->weapon].altEnergyPerShot) 
;3556:			{ //the weapon is out of ammo essentially because it cannot fire primary or secondary, so do the switch
line 3558
;3557:			  //regardless of if the player is attacking or not
;3558:				PM_AddEventWithParm( EV_NOAMMO, WP_NUM_WEAPONS+pm->ps->weapon );
CNSTI4 22
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3560
;3559:
;3560:				if (pm->ps->weaponTime < 500)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 500
GEI4 $1332
line 3561
;3561:				{
line 3562
;3562:					pm->ps->weaponTime += 500;
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3563
;3563:				}
line 3564
;3564:				return;
ADDRGP4 $1332
JUMPV
LABELV $1469
line 3567
;3565:			}
;3566:
;3567:			if (pm->ps->weapon == WP_DET_PACK && !pm->ps->hasDetPackPlanted && pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < 1)
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 112
ADDRLP4 108
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 13
NEI4 $1475
ADDRLP4 108
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1475
CNSTI4 56
ADDRLP4 112
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 108
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1475
line 3568
;3568:			{
line 3569
;3569:				PM_AddEventWithParm( EV_NOAMMO, WP_NUM_WEAPONS+pm->ps->weapon );
CNSTI4 22
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3571
;3570:
;3571:				if (pm->ps->weaponTime < 500)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 500
GEI4 $1332
line 3572
;3572:				{
line 3573
;3573:					pm->ps->weaponTime += 500;
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3574
;3574:				}
line 3575
;3575:				return;
ADDRGP4 $1332
JUMPV
LABELV $1475
line 3577
;3576:			}
;3577:		}
LABELV $1467
line 3578
;3578:	}
LABELV $1464
line 3583
;3579:
;3580:	// check for weapon change
;3581:	// can't change if weapon is firing, but can change
;3582:	// again if lowering or raising
;3583:	if ( pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING ) {
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1481
ADDRLP4 92
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1479
LABELV $1481
line 3584
;3584:		if ( pm->ps->weapon != pm->cmd.weapon ) {
ADDRLP4 96
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $1482
line 3585
;3585:			PM_BeginWeaponChange( pm->cmd.weapon );
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 PM_BeginWeaponChange
CALLV
pop
line 3586
;3586:		}
LABELV $1482
line 3587
;3587:	}
LABELV $1479
line 3589
;3588:
;3589:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1484
line 3590
;3590:		return;
ADDRGP4 $1332
JUMPV
LABELV $1484
line 3594
;3591:	}
;3592:
;3593:	// change weapon if time
;3594:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1486
line 3595
;3595:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 3596
;3596:		return;
ADDRGP4 $1332
JUMPV
LABELV $1486
line 3599
;3597:	}
;3598:
;3599:	if ( pm->ps->weaponstate == WEAPON_RAISING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1488
line 3600
;3600:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 3601
;3601:		if ( pm->ps->weapon == WP_SABER ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1490
line 3602
;3602:			PM_StartTorsoAnim( PM_GetSaberStance() );
ADDRLP4 96
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3603
;3603:		} else {
ADDRGP4 $1332
JUMPV
LABELV $1490
line 3604
;3604:			if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1492
ADDRLP4 96
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1492
line 3605
;3605:			{
line 3606
;3606:				PM_StartTorsoAnim( TORSO_WEAPONREADY4 );
CNSTI4 1102
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3607
;3607:			}
ADDRGP4 $1332
JUMPV
LABELV $1492
line 3609
;3608:			else
;3609:			{
line 3610
;3610:				if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1494
line 3611
;3611:				{
line 3612
;3612:					PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3613
;3613:				}
ADDRGP4 $1332
JUMPV
LABELV $1494
line 3615
;3614:				else
;3615:				{
line 3616
;3616:					PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3617
;3617:				}
line 3618
;3618:			}
line 3619
;3619:		}
line 3620
;3620:		return;
ADDRGP4 $1332
JUMPV
LABELV $1488
line 3623
;3621:	}
;3622:
;3623:	if (((pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) == TORSO_WEAPONREADY4 ||
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 1102
EQI4 $1498
ADDRLP4 96
INDIRI4
CNSTI4 121
NEI4 $1496
LABELV $1498
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1499
ADDRLP4 100
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1496
LABELV $1499
line 3626
;3624:		(pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_ATTACK4) &&
;3625:		(pm->ps->weapon != WP_DISRUPTOR || pm->ps->zoomMode != 1))
;3626:	{
line 3627
;3627:		if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1500
line 3628
;3628:		{
line 3629
;3629:			PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3630
;3630:		}
ADDRGP4 $1497
JUMPV
LABELV $1500
line 3632
;3631:		else
;3632:		{
line 3633
;3633:			PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3634
;3634:		}
line 3635
;3635:	}
ADDRGP4 $1497
JUMPV
LABELV $1496
line 3636
;3636:	else if (((pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_WEAPONREADY4 &&
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 108
ADDRLP4 104
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 1102
EQI4 $1502
ADDRLP4 108
INDIRI4
CNSTI4 121
EQI4 $1502
ADDRLP4 104
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1502
ADDRLP4 104
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1502
line 3639
;3637:		(pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) != BOTH_ATTACK4) &&
;3638:		(pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1))
;3639:	{
line 3640
;3640:		PM_StartTorsoAnim( TORSO_WEAPONREADY4 );
CNSTI4 1102
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3641
;3641:	}
LABELV $1502
LABELV $1497
line 3644
;3642:
;3643:
;3644:	if (pm->ps->weapon != WP_ROCKET_LAUNCHER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 10
EQI4 $1504
line 3645
;3645:	{
line 3646
;3646:		pm->ps->rocketLockIndex = MAX_CLIENTS;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 3647
;3647:		pm->ps->rocketLockTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 3648
;3648:		pm->ps->rocketTargetTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
line 3649
;3649:	}
LABELV $1504
line 3651
;3650:
;3651:	if ( PM_DoChargedWeapons())
ADDRLP4 112
ADDRGP4 PM_DoChargedWeapons
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $1506
line 3652
;3652:	{
line 3654
;3653:		// In some cases the charged weapon code may want us to short circuit the rest of the firing code
;3654:		return;
ADDRGP4 $1332
JUMPV
LABELV $1506
line 3658
;3655:	}
;3656:
;3657:	// check for fire
;3658:	if ( ! (pm->cmd.buttons & (BUTTON_ATTACK|BUTTON_ALT_ATTACK))) 
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 129
BANDI4
CNSTI4 0
NEI4 $1508
line 3659
;3659:	{
line 3660
;3660:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 3661
;3661:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 3662
;3662:		return;
ADDRGP4 $1332
JUMPV
LABELV $1508
line 3665
;3663:	}
;3664:
;3665:	if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1510
line 3666
;3666:	{
line 3667
;3667:		addTime = weaponData[pm->ps->weapon].fireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+12
ADDP4
INDIRI4
ASGNI4
line 3668
;3668:		pm->ps->weaponTime += addTime;
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 3669
;3669:		PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3670
;3670:		return;
ADDRGP4 $1332
JUMPV
LABELV $1510
line 3673
;3671:	}
;3672:
;3673:	if (pm->ps->weapon == WP_DISRUPTOR &&
ADDRLP4 116
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 116
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1513
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 116
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 124
INDIRI4
EQI4 $1513
ADDRLP4 120
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
NEI4 $1513
line 3676
;3674:		(pm->cmd.buttons & BUTTON_ALT_ATTACK) &&
;3675:		!pm->ps->zoomLocked)
;3676:	{
line 3677
;3677:		return;
ADDRGP4 $1332
JUMPV
LABELV $1513
line 3680
;3678:	}
;3679:
;3680:	if (pm->ps->weapon == WP_DISRUPTOR &&
ADDRLP4 128
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 132
ADDRLP4 128
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1515
ADDRLP4 128
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1515
ADDRLP4 132
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1515
line 3683
;3681:		(pm->cmd.buttons & BUTTON_ALT_ATTACK) &&
;3682:		pm->ps->zoomMode == 2)
;3683:	{ //can't use disruptor secondary while zoomed binoculars
line 3684
;3684:		return;
ADDRGP4 $1332
JUMPV
LABELV $1515
line 3687
;3685:	}
;3686:
;3687:	if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 136
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1517
ADDRLP4 136
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1517
line 3688
;3688:	{
line 3689
;3689:		PM_StartTorsoAnim( BOTH_ATTACK4 );
CNSTI4 121
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3690
;3690:	}
ADDRGP4 $1518
JUMPV
LABELV $1517
line 3692
;3691:	else
;3692:	{
line 3693
;3693:		PM_StartTorsoAnim( WeaponAttackAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponAttackAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3694
;3694:	}
LABELV $1518
line 3696
;3695:
;3696:	if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1519
line 3697
;3697:	{
line 3698
;3698:		amount = weaponData[pm->ps->weapon].altEnergyPerShot;
ADDRLP4 4
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
ASGNI4
line 3699
;3699:	}
ADDRGP4 $1520
JUMPV
LABELV $1519
line 3701
;3700:	else
;3701:	{
line 3702
;3702:		amount = weaponData[pm->ps->weapon].energyPerShot;
ADDRLP4 4
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
ASGNI4
line 3703
;3703:	}
LABELV $1520
line 3705
;3704:
;3705:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 3708
;3706:
;3707:	// take an ammo away if not infinite
;3708:	if ( pm->ps->ammo[ weaponData[pm->ps->weapon].ammoIndex ] != -1 )
ADDRLP4 140
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
CNSTI4 56
ADDRLP4 140
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1523
line 3709
;3709:	{
line 3711
;3710:		// enough energy to fire this weapon?
;3711:		if ((pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] - amount) >= 0) 
ADDRLP4 144
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
CNSTI4 56
ADDRLP4 144
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 144
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 0
LTI4 $1525
line 3712
;3712:		{
line 3713
;3713:			pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] -= amount;
ADDRLP4 148
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 152
CNSTI4 56
ADDRLP4 148
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 408
ADDP4
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 3714
;3714:		}
ADDRGP4 $1526
JUMPV
LABELV $1525
line 3716
;3715:		else	// Not enough energy
;3716:		{
line 3718
;3717:			// Switch weapons
;3718:			if (pm->ps->weapon != WP_DET_PACK || !pm->ps->hasDetPackPlanted)
ADDRLP4 148
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1529
ADDRLP4 148
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1332
LABELV $1529
line 3719
;3719:			{
line 3720
;3720:				PM_AddEventWithParm( EV_NOAMMO, WP_NUM_WEAPONS+pm->ps->weapon );
CNSTI4 22
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3721
;3721:				if (pm->ps->weaponTime < 500)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 500
GEI4 $1332
line 3722
;3722:				{
line 3723
;3723:					pm->ps->weaponTime += 500;
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3724
;3724:				}
line 3725
;3725:			}
line 3726
;3726:			return;
ADDRGP4 $1332
JUMPV
LABELV $1526
line 3728
;3727:		}
;3728:	}
LABELV $1523
line 3730
;3729:
;3730:	if ( pm->cmd.buttons & BUTTON_ALT_ATTACK ) 	{
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1532
line 3731
;3731:		if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode != 1)
ADDRLP4 144
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1534
ADDRLP4 144
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1534
line 3732
;3732:		{
line 3733
;3733:			PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3734
;3734:			addTime = weaponData[pm->ps->weapon].fireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+12
ADDP4
INDIRI4
ASGNI4
line 3735
;3735:		}
ADDRGP4 $1533
JUMPV
LABELV $1534
line 3737
;3736:		else
;3737:		{
line 3738
;3738:			PM_AddEvent( EV_ALT_FIRE );
CNSTI4 25
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3739
;3739:			addTime = weaponData[pm->ps->weapon].altFireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+24
ADDP4
INDIRI4
ASGNI4
line 3740
;3740:		}
line 3741
;3741:	}
ADDRGP4 $1533
JUMPV
LABELV $1532
line 3742
;3742:	else {
line 3743
;3743:		PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3744
;3744:		addTime = weaponData[pm->ps->weapon].fireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+12
ADDP4
INDIRI4
ASGNI4
line 3745
;3745:	}
LABELV $1533
line 3747
;3746:
;3747:	if ( pm->ps->powerups[PW_HASTE] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1539
line 3748
;3748:		addTime /= 1.3;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1067869798
DIVF4
CVFI4 4
ASGNI4
line 3749
;3749:	}
LABELV $1539
line 3751
;3750:
;3751:	if (pm->ps->fd.forcePowersActive & (1 << FP_RAGE))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1541
line 3752
;3752:	{
line 3753
;3753:		addTime *= 0.75;
ADDRLP4 0
CNSTF4 1061158912
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3754
;3754:	}
ADDRGP4 $1542
JUMPV
LABELV $1541
line 3755
;3755:	else if (pm->ps->fd.forceRageRecoveryTime > pm->cmd.serverTime)
ADDRLP4 144
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
ADDRLP4 144
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $1543
line 3756
;3756:	{
line 3757
;3757:		addTime *= 1.5;
ADDRLP4 0
CNSTF4 1069547520
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3758
;3758:	}
LABELV $1543
LABELV $1542
line 3760
;3759:
;3760:	pm->ps->weaponTime += addTime;
ADDRLP4 148
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 3761
;3761:}
LABELV $1332
endproc PM_Weapon 156 16
proc PM_Animate 16 4
line 3769
;3762:
;3763:/*
;3764:================
;3765:PM_Animate
;3766:================
;3767:*/
;3768:
;3769:static void PM_Animate( void ) {
line 3770
;3770:	if ( pm->cmd.buttons & BUTTON_GESTURE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1546
line 3771
;3771:		if ( pm->ps->torsoTimer < 1 && pm->ps->forceHandExtend == HANDEXTEND_NONE &&
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $1548
ADDRLP4 4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1548
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $1548
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $1548
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $1548
line 3772
;3772:			pm->ps->legsTimer < 1 && pm->ps->weaponTime < 1 && pm->ps->saberLockTime < pm->cmd.serverTime) {
line 3774
;3773:
;3774:			pm->ps->forceHandExtend = HANDEXTEND_TAUNT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 10
ASGNI4
line 3777
;3775:
;3776:			//FIXME: random taunt anims?
;3777:			pm->ps->forceDodgeAnim = BOTH_ENGAGETAUNT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 904
ASGNI4
line 3779
;3778:
;3779:			pm->ps->forceHandExtendTime = pm->cmd.serverTime + 1000;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3781
;3780:			
;3781:			pm->ps->weaponTime = 100;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 100
ASGNI4
line 3783
;3782:
;3783:			PM_AddEvent( EV_TAUNT );
CNSTI4 102
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3784
;3784:		}
LABELV $1548
line 3820
;3785:#if 0
;3786:// Here's an interesting bit.  The bots in TA used buttons to do additional gestures.
;3787:// I ripped them out because I didn't want too many buttons given the fact that I was already adding some for JK2.
;3788:// We can always add some back in if we want though.
;3789:	} else if ( pm->cmd.buttons & BUTTON_GETFLAG ) {
;3790:		if ( pm->ps->torsoTimer == 0 ) {
;3791:			PM_StartTorsoAnim( TORSO_GETFLAG );
;3792:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3793:		}
;3794:	} else if ( pm->cmd.buttons & BUTTON_GUARDBASE ) {
;3795:		if ( pm->ps->torsoTimer == 0 ) {
;3796:			PM_StartTorsoAnim( TORSO_GUARDBASE );
;3797:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3798:		}
;3799:	} else if ( pm->cmd.buttons & BUTTON_PATROL ) {
;3800:		if ( pm->ps->torsoTimer == 0 ) {
;3801:			PM_StartTorsoAnim( TORSO_PATROL );
;3802:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3803:		}
;3804:	} else if ( pm->cmd.buttons & BUTTON_FOLLOWME ) {
;3805:		if ( pm->ps->torsoTimer == 0 ) {
;3806:			PM_StartTorsoAnim( TORSO_FOLLOWME );
;3807:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3808:		}
;3809:	} else if ( pm->cmd.buttons & BUTTON_AFFIRMATIVE ) {
;3810:		if ( pm->ps->torsoTimer == 0 ) {
;3811:			PM_StartTorsoAnim( TORSO_AFFIRMATIVE);
;3812:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3813:		}
;3814:	} else if ( pm->cmd.buttons & BUTTON_NEGATIVE ) {
;3815:		if ( pm->ps->torsoTimer == 0 ) {
;3816:			PM_StartTorsoAnim( TORSO_NEGATIVE );
;3817:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3818:		}
;3819:#endif //
;3820:	}
LABELV $1546
line 3821
;3821:}
LABELV $1545
endproc PM_Animate 16 4
proc PM_DropTimers 4 0
line 3829
;3822:
;3823:
;3824:/*
;3825:================
;3826:PM_DropTimers
;3827:================
;3828:*/
;3829:static void PM_DropTimers( void ) {
line 3831
;3830:	// drop misc timing counter
;3831:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1551
line 3832
;3832:		if ( pml.msec >= pm->ps->pm_time ) {
ADDRGP4 pml+40
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $1553
line 3833
;3833:			pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 3834
;3834:			pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 3835
;3835:		} else {
ADDRGP4 $1554
JUMPV
LABELV $1553
line 3836
;3836:			pm->ps->pm_time -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 3837
;3837:		}
LABELV $1554
line 3838
;3838:	}
LABELV $1551
line 3841
;3839:
;3840:	// drop animation counter
;3841:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1557
line 3842
;3842:		pm->ps->legsTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 3843
;3843:		if ( pm->ps->legsTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1560
line 3844
;3844:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 3845
;3845:		}
LABELV $1560
line 3846
;3846:	}
LABELV $1557
line 3848
;3847:
;3848:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1562
line 3849
;3849:		pm->ps->torsoTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 3850
;3850:		if ( pm->ps->torsoTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1565
line 3851
;3851:			pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 3852
;3852:		}
LABELV $1565
line 3853
;3853:	}
LABELV $1562
line 3854
;3854:}
LABELV $1550
endproc PM_DropTimers 4 0
export PM_UpdateViewAngles
proc PM_UpdateViewAngles 24 0
line 3864
;3855:
;3856:/*
;3857:================
;3858:PM_UpdateViewAngles
;3859:
;3860:This can be used as another entry point when only the viewangles
;3861:are being updated isntead of a full move
;3862:================
;3863:*/
;3864:void PM_UpdateViewAngles( playerState_t *ps, const usercmd_t *cmd ) {
line 3868
;3865:	short		temp;
;3866:	int		i;
;3867:
;3868:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 6
EQI4 $1570
ADDRLP4 8
INDIRI4
CNSTI4 7
NEI4 $1568
LABELV $1570
line 3869
;3869:		return;		// no view changes at all
ADDRGP4 $1567
JUMPV
LABELV $1568
line 3872
;3870:	}
;3871:
;3872:	if ( ps->pm_type != PM_SPECTATOR && ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1571
ADDRLP4 12
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1571
line 3873
;3873:		return;		// no view changes at all
ADDRGP4 $1567
JUMPV
LABELV $1571
line 3877
;3874:	}
;3875:
;3876:	// circularly clamp the angles with deltas
;3877:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1573
line 3878
;3878:		temp = cmd->angles[i] + ps->delta_angles[i];
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 3879
;3879:		if ( i == PITCH ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1577
line 3881
;3880:			// don't let the player look up or down more than 90 degrees
;3881:			if ( temp > 16000 ) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 16000
LEI4 $1579
line 3882
;3882:				ps->delta_angles[i] = 16000 - cmd->angles[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDP4
CNSTI4 16000
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3883
;3883:				temp = 16000;
ADDRLP4 4
CNSTI2 16000
ASGNI2
line 3884
;3884:			} else if ( temp < -16000 ) {
ADDRGP4 $1580
JUMPV
LABELV $1579
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 -16000
GEI4 $1581
line 3885
;3885:				ps->delta_angles[i] = -16000 - cmd->angles[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDP4
CNSTI4 -16000
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3886
;3886:				temp = -16000;
ADDRLP4 4
CNSTI2 -16000
ASGNI2
line 3887
;3887:			}
LABELV $1581
LABELV $1580
line 3888
;3888:		}
LABELV $1577
line 3889
;3889:		ps->viewangles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDP4
CNSTF4 1001652224
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
MULF4
ASGNF4
line 3890
;3890:	}
LABELV $1574
line 3877
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1573
line 3892
;3891:
;3892:}
LABELV $1567
endproc PM_UpdateViewAngles 24 0
export PM_AdjustAttackStates
proc PM_AdjustAttackStates 56 4
line 3897
;3893:
;3894://-------------------------------------------
;3895:void PM_AdjustAttackStates( pmove_t *pm )
;3896://-------------------------------------------
;3897:{
line 3901
;3898:	int amount;
;3899:
;3900:	// get ammo usage
;3901:	if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1584
line 3902
;3902:	{
line 3903
;3903:		amount = pm->ps->ammo[weaponData[ pm->ps->weapon ].ammoIndex] - weaponData[pm->ps->weapon].altEnergyPerShot;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 56
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3904
;3904:	}
ADDRGP4 $1585
JUMPV
LABELV $1584
line 3906
;3905:	else
;3906:	{
line 3907
;3907:		amount = pm->ps->ammo[weaponData[ pm->ps->weapon ].ammoIndex] - weaponData[pm->ps->weapon].energyPerShot;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 56
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3908
;3908:	}
LABELV $1585
line 3911
;3909:
;3910:	// disruptor alt-fire should toggle the zoom mode, but only bother doing this for the player?
;3911:	if ( pm->ps->weapon == WP_DISRUPTOR && pm->ps->weaponstate == WEAPON_READY )
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1588
ADDRLP4 4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1588
line 3912
;3912:	{
line 3913
;3913:		if ( !(pm->ps->eFlags & EF_ALT_FIRING) && (pm->cmd.buttons & BUTTON_ALT_ATTACK) /*&&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $1590
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $1590
line 3915
;3914:			pm->cmd.upmove <= 0 && !pm->cmd.forwardmove && !pm->cmd.rightmove*/)
;3915:		{
line 3917
;3916:			// We just pressed the alt-fire key
;3917:			if ( !pm->ps->zoomMode )
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1592
line 3918
;3918:			{
line 3920
;3919:				// not already zooming, so do it now
;3920:				pm->ps->zoomMode = 1;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 1
ASGNI4
line 3921
;3921:				pm->ps->zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 3922
;3922:				pm->ps->zoomFov = 80.0f;//cg_fov.value;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 1117782016
ASGNF4
line 3923
;3923:				pm->ps->zoomLockTime = pm->cmd.serverTime + 50;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 1348
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3924
;3924:				PM_AddEvent(EV_DISRUPTOR_ZOOMSOUND);
CNSTI4 35
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3925
;3925:			}
ADDRGP4 $1591
JUMPV
LABELV $1592
line 3926
;3926:			else if (pm->ps->zoomMode == 1 && pm->ps->zoomLockTime < pm->cmd.serverTime)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1591
ADDRLP4 20
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $1591
line 3927
;3927:			{ //check for == 1 so we can't turn binoculars off with disruptor alt fire
line 3929
;3928:				// already zooming, so must be wanting to turn it off
;3929:				pm->ps->zoomMode = 0;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 3930
;3930:				pm->ps->zoomTime = pm->ps->commandTime;
ADDRLP4 24
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1336
ADDP4
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
line 3931
;3931:				pm->ps->zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 3932
;3932:				PM_AddEvent(EV_DISRUPTOR_ZOOMSOUND);
CNSTI4 35
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3933
;3933:			}
line 3934
;3934:		}
ADDRGP4 $1591
JUMPV
LABELV $1590
line 3935
;3935:		else if ( !(pm->cmd.buttons & BUTTON_ALT_ATTACK ) && pm->ps->zoomLockTime < pm->cmd.serverTime)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $1596
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $1596
line 3936
;3936:		{
line 3938
;3937:			// Not pressing zoom any more
;3938:			if ( pm->ps->zoomMode )
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1598
line 3939
;3939:			{
line 3940
;3940:				if (pm->ps->zoomMode == 1 && !pm->ps->zoomLocked)
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1600
ADDRLP4 20
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1600
line 3941
;3941:				{ //approximate what level the client should be zoomed at based on how long zoom was held
line 3942
;3942:					pm->ps->zoomFov = ((pm->cmd.serverTime+50) - pm->ps->zoomLockTime) * 0.035f;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 1024416809
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 50
ADDI4
ADDRLP4 28
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 3943
;3943:					if (pm->ps->zoomFov > 50)
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
INDIRF4
CNSTF4 1112014848
LEF4 $1602
line 3944
;3944:					{
line 3945
;3945:						pm->ps->zoomFov = 50;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 1112014848
ASGNF4
line 3946
;3946:					}
LABELV $1602
line 3947
;3947:					if (pm->ps->zoomFov < 1)
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
INDIRF4
CNSTF4 1065353216
GEF4 $1604
line 3948
;3948:					{
line 3949
;3949:						pm->ps->zoomFov = 1;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 1065353216
ASGNF4
line 3950
;3950:					}
LABELV $1604
line 3951
;3951:				}
LABELV $1600
line 3953
;3952:				// were zooming in, so now lock the zoom
;3953:				pm->ps->zoomLocked = qtrue;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 1
ASGNI4
line 3954
;3954:			}
LABELV $1598
line 3955
;3955:		}
LABELV $1596
LABELV $1591
line 3966
;3956:		//This seemed like a good idea, but apparently it confuses people. So disabled for now.
;3957:		/*
;3958:		else if (!(pm->ps->eFlags & EF_ALT_FIRING) && (pm->cmd.buttons & BUTTON_ALT_ATTACK) &&
;3959:			(pm->cmd.upmove > 0 || pm->cmd.forwardmove || pm->cmd.rightmove))
;3960:		{ //if you try to zoom while moving, just convert it into a primary attack
;3961:			pm->cmd.buttons &= ~BUTTON_ALT_ATTACK;
;3962:			pm->cmd.buttons |= BUTTON_ATTACK;
;3963:		}
;3964:		*/
;3965:
;3966:		if (pm->cmd.upmove > 0 || pm->cmd.forwardmove || pm->cmd.rightmove)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
GTI4 $1609
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $1609
ADDRLP4 20
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $1606
LABELV $1609
line 3967
;3967:		{
line 3968
;3968:			if (pm->ps->zoomMode == 1 && pm->ps->zoomLockTime < pm->cmd.serverTime)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1610
ADDRLP4 32
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $1610
line 3969
;3969:			{ //check for == 1 so we can't turn binoculars off with disruptor alt fire
line 3970
;3970:				pm->ps->zoomMode = 0;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 3971
;3971:				pm->ps->zoomTime = pm->ps->commandTime;
ADDRLP4 36
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1336
ADDP4
ADDRLP4 36
INDIRP4
INDIRI4
ASGNI4
line 3972
;3972:				pm->ps->zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 3973
;3973:				PM_AddEvent(EV_DISRUPTOR_ZOOMSOUND);
CNSTI4 35
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3974
;3974:			}
LABELV $1610
line 3975
;3975:		}
LABELV $1606
line 3977
;3976:
;3977:		if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1612
line 3978
;3978:		{
line 3981
;3979:			// If we are zoomed, we should switch the ammo usage to the alt-fire, otherwise, we'll
;3980:			//	just use whatever ammo was selected from above
;3981:			if ( pm->ps->zoomMode )
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1589
line 3982
;3982:			{
line 3983
;3983:				amount = pm->ps->ammo[weaponData[ pm->ps->weapon ].ammoIndex] - 
ADDRLP4 28
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 28
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3985
;3984:							weaponData[pm->ps->weapon].altEnergyPerShot;
;3985:			}
line 3986
;3986:		}
ADDRGP4 $1589
JUMPV
LABELV $1612
line 3988
;3987:		else
;3988:		{
line 3990
;3989:			// alt-fire button pressing doesn't use any ammo
;3990:			amount = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3991
;3991:		}
line 3992
;3992:	}
ADDRGP4 $1589
JUMPV
LABELV $1588
line 3993
;3993:	else if (pm->ps->weapon == WP_DISRUPTOR) //still perform certain checks, even if the weapon is not ready
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1617
line 3994
;3994:	{
line 3995
;3995:		if (pm->cmd.upmove > 0 || pm->cmd.forwardmove || pm->cmd.rightmove)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
GTI4 $1622
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $1622
ADDRLP4 8
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
EQI4 $1619
LABELV $1622
line 3996
;3996:		{
line 3997
;3997:			if (pm->ps->zoomMode == 1 && pm->ps->zoomLockTime < pm->cmd.serverTime)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1623
ADDRLP4 20
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $1623
line 3998
;3998:			{ //check for == 1 so we can't turn binoculars off with disruptor alt fire
line 3999
;3999:				pm->ps->zoomMode = 0;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 4000
;4000:				pm->ps->zoomTime = pm->ps->commandTime;
ADDRLP4 24
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1336
ADDP4
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
line 4001
;4001:				pm->ps->zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 4002
;4002:				PM_AddEvent(EV_DISRUPTOR_ZOOMSOUND);
CNSTI4 35
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4003
;4003:			}
LABELV $1623
line 4004
;4004:		}
LABELV $1619
line 4005
;4005:	}
LABELV $1617
LABELV $1589
line 4008
;4006:
;4007:	// set the firing flag for continuous beam weapons, saber will fire even if out of ammo
;4008:	if ( !(pm->ps->pm_flags & PMF_RESPAWNED) && 
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $1625
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
EQI4 $1625
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 129
BANDI4
ADDRLP4 16
INDIRI4
EQI4 $1625
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $1627
ADDRLP4 12
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1625
LABELV $1627
line 4012
;4009:			pm->ps->pm_type != PM_INTERMISSION && 
;4010:			( pm->cmd.buttons & (BUTTON_ATTACK|BUTTON_ALT_ATTACK)) && 
;4011:			( amount >= 0 || pm->ps->weapon == WP_SABER ))
;4012:	{
line 4013
;4013:		if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1628
line 4014
;4014:		{
line 4015
;4015:			pm->ps->eFlags |= EF_ALT_FIRING;
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 4016
;4016:		}
ADDRGP4 $1629
JUMPV
LABELV $1628
line 4018
;4017:		else
;4018:		{
line 4019
;4019:			pm->ps->eFlags &= ~EF_ALT_FIRING;
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 4020
;4020:		}
LABELV $1629
line 4023
;4021:
;4022:		// This flag should always get set, even when alt-firing
;4023:		pm->ps->eFlags |= EF_FIRING;
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 4024
;4024:	} 
ADDRGP4 $1626
JUMPV
LABELV $1625
line 4026
;4025:	else 
;4026:	{
line 4028
;4027:		// Clear 'em out
;4028:		pm->ps->eFlags &= ~(EF_FIRING|EF_ALT_FIRING);
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 4029
;4029:	}
LABELV $1626
line 4032
;4030:
;4031:	// disruptor should convert a main fire to an alt-fire if the gun is currently zoomed
;4032:	if ( pm->ps->weapon == WP_DISRUPTOR)
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1630
line 4033
;4033:	{
line 4034
;4034:		if ( pm->cmd.buttons & BUTTON_ATTACK && pm->ps->zoomMode == 1 && pm->ps->zoomLocked)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $1632
ADDRLP4 32
ADDRLP4 20
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $1632
ADDRLP4 32
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1632
line 4035
;4035:		{
line 4037
;4036:			// converting the main fire to an alt-fire
;4037:			pm->cmd.buttons |= BUTTON_ALT_ATTACK;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 4038
;4038:			pm->ps->eFlags |= EF_ALT_FIRING;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 4039
;4039:		}
ADDRGP4 $1633
JUMPV
LABELV $1632
line 4040
;4040:		else if ( pm->cmd.buttons & BUTTON_ALT_ATTACK && pm->ps->zoomMode == 1 && pm->ps->zoomLocked)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $1634
ADDRLP4 44
ADDRLP4 36
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1634
ADDRLP4 44
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $1634
line 4041
;4041:		{
line 4042
;4042:			pm->cmd.buttons &= ~BUTTON_ALT_ATTACK;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 4043
;4043:			pm->ps->eFlags &= ~EF_ALT_FIRING;
ADDRLP4 52
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 4044
;4044:		}
LABELV $1634
LABELV $1633
line 4045
;4045:	}
LABELV $1630
line 4046
;4046:}
LABELV $1583
endproc PM_AdjustAttackStates 56 4
export BG_CmdForRoll
proc BG_CmdForRoll 8 0
line 4049
;4047:
;4048:void BG_CmdForRoll( int anim, usercmd_t *pCmd )
;4049:{
line 4050
;4050:	switch ( (anim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 885
LTI4 $1637
ADDRLP4 0
INDIRI4
CNSTI4 888
GTI4 $1637
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1644-3540
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1644
address $1640
address $1641
address $1643
address $1642
code
line 4051
;4051:	{
LABELV $1640
line 4053
;4052:	case BOTH_ROLL_F:
;4053:		pCmd->forwardmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 127
ASGNI1
line 4054
;4054:		pCmd->rightmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 4055
;4055:		break;
ADDRGP4 $1638
JUMPV
LABELV $1641
line 4057
;4056:	case BOTH_ROLL_B:
;4057:		pCmd->forwardmove = -127;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 -127
ASGNI1
line 4058
;4058:		pCmd->rightmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 4059
;4059:		break;
ADDRGP4 $1638
JUMPV
LABELV $1642
line 4061
;4060:	case BOTH_ROLL_R:
;4061:		pCmd->forwardmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 4062
;4062:		pCmd->rightmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 127
ASGNI1
line 4063
;4063:		break;
ADDRGP4 $1638
JUMPV
LABELV $1643
line 4065
;4064:	case BOTH_ROLL_L:
;4065:		pCmd->forwardmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 4066
;4066:		pCmd->rightmove = -127;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 -127
ASGNI1
line 4067
;4067:		break;
LABELV $1637
LABELV $1638
line 4069
;4068:	}
;4069:	pCmd->upmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 4070
;4070:}
LABELV $1636
endproc BG_CmdForRoll 8 0
export BG_AdjustClientSpeed
proc BG_AdjustClientSpeed 76 8
line 4075
;4071:
;4072:qboolean PM_SaberInTransition( int move );
;4073:
;4074:void BG_AdjustClientSpeed(playerState_t *ps, usercmd_t *cmd, int svTime)
;4075:{
line 4079
;4076:	//For prediction, always reset speed back to the last known server base speed
;4077:	//If we didn't do this, under lag we'd eventually dwindle speed down to 0 even though
;4078:	//that would not be the correct predicted value.
;4079:	ps->speed = ps->basespeed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 4081
;4080:
;4081:	if (ps->forceHandExtend == HANDEXTEND_DODGE)
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 7
NEI4 $1647
line 4082
;4082:	{
line 4083
;4083:		ps->speed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 4084
;4084:	}
LABELV $1647
line 4086
;4085:
;4086:	if (ps->forceHandExtend == HANDEXTEND_KNOCKDOWN)
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1649
line 4087
;4087:	{
line 4088
;4088:		ps->speed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 4089
;4089:	}
LABELV $1649
line 4091
;4090:
;4091:	if (ps->usingATST && (cmd->rightmove ||
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1651
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $1653
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
EQI4 $1651
LABELV $1653
line 4093
;4092:		cmd->forwardmove))
;4093:	{
line 4094
;4094:		if (!ps->holdMoveTime)
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1652
line 4095
;4095:		{
line 4096
;4096:			ps->torsoAnim = ( ( ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 16
CNSTI4 2048
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
ADDRLP4 16
INDIRI4
BXORI4
CNSTI4 834
BORI4
ASGNI4
line 4098
;4097:				| BOTH_RUN1START;
;4098:			ps->holdMoveTime = svTime;
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 4099
;4099:		}
line 4100
;4100:	}
ADDRGP4 $1652
JUMPV
LABELV $1651
line 4102
;4101:	else
;4102:	{
line 4103
;4103:		ps->holdMoveTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
CNSTI4 0
ASGNI4
line 4105
;4104:
;4105:		if (ps->usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1656
line 4106
;4106:		{
line 4107
;4107:			ps->torsoAnim = ( ( ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 16
CNSTI4 2048
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
ADDRLP4 16
INDIRI4
BXORI4
CNSTI4 571
BORI4
ASGNI4
line 4109
;4108:				| BOTH_STAND1;
;4109:		}
LABELV $1656
line 4110
;4110:	}
LABELV $1652
line 4112
;4111:
;4112:	if (ps->usingATST &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1658
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 500
LTI4 $1660
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1658
LABELV $1660
line 4115
;4113:		((svTime - ps->holdMoveTime) < 500 ||
;4114:		!ps->holdMoveTime))
;4115:	{
line 4116
;4116:		ps->speed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 4117
;4117:	}
ADDRGP4 $1659
JUMPV
LABELV $1658
line 4118
;4118:	else if (ps->usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1661
line 4119
;4119:	{
line 4120
;4120:		if ((svTime - ps->holdMoveTime) < 600)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 600
GEI4 $1663
line 4121
;4121:		{
line 4122
;4122:			ps->speed *= 0.4;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1053609165
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4123
;4123:		}
ADDRGP4 $1664
JUMPV
LABELV $1663
line 4124
;4124:		else if ((svTime - ps->holdMoveTime) < 1000)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $1665
line 4125
;4125:		{
line 4126
;4126:			ps->speed *= 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1056964608
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4127
;4127:		}
ADDRGP4 $1666
JUMPV
LABELV $1665
line 4128
;4128:		else if ((svTime - ps->holdMoveTime) < 1400)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 1400
GEI4 $1667
line 4129
;4129:		{
line 4130
;4130:			ps->speed *= 0.6;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1058642330
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4131
;4131:		}
ADDRGP4 $1668
JUMPV
LABELV $1667
line 4132
;4132:		else if ((svTime - ps->holdMoveTime) < 1700)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 1700
GEI4 $1669
line 4133
;4133:		{
line 4134
;4134:			ps->speed *= 0.7;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1060320051
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4135
;4135:		}
ADDRGP4 $1670
JUMPV
LABELV $1669
line 4136
;4136:		else if ((svTime - ps->holdMoveTime) < 1900)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 1900
GEI4 $1671
line 4137
;4137:		{
line 4138
;4138:			ps->speed *= 0.8;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1061997773
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4139
;4139:		}
LABELV $1671
LABELV $1670
LABELV $1668
LABELV $1666
LABELV $1664
line 4141
;4140:
;4141:		if (cmd->forwardmove < 0)
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1673
line 4142
;4142:		{
line 4143
;4143:			ps->torsoAnim = ( ( ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 28
CNSTI4 2048
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 28
INDIRI4
BANDI4
ADDRLP4 28
INDIRI4
BXORI4
CNSTI4 852
BORI4
ASGNI4
line 4145
;4144:				| BOTH_WALKBACK1;
;4145:			ps->speed *= 0.6;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTF4 1058642330
ADDRLP4 32
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4146
;4146:		}
ADDRGP4 $1662
JUMPV
LABELV $1673
line 4148
;4147:		else
;4148:		{
line 4149
;4149:			ps->torsoAnim = ( ( ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 28
CNSTI4 2048
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 28
INDIRI4
BANDI4
ADDRLP4 28
INDIRI4
BXORI4
CNSTI4 833
BORI4
ASGNI4
line 4151
;4150:				| BOTH_RUN1;
;4151:		}
line 4152
;4152:	}
ADDRGP4 $1662
JUMPV
LABELV $1661
line 4153
;4153:	else if ( cmd->forwardmove < 0 && !(cmd->buttons&BUTTON_WALKING) && pm->ps->groundEntityNum != ENTITYNUM_NONE )
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
GEI4 $1675
ADDRLP4 32
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
BANDI4
ADDRLP4 28
INDIRI4
NEI4 $1675
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $1675
line 4154
;4154:	{//running backwards is slower than running forwards (like SP)
line 4155
;4155:		ps->speed *= 0.75;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1061158912
ADDRLP4 36
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4156
;4156:	}
LABELV $1675
LABELV $1662
LABELV $1659
line 4158
;4157:
;4158:	if (ps->fd.forcePowersActive & (1 << FP_GRIP))
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1677
line 4159
;4159:	{
line 4160
;4160:		ps->speed *= 0.4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1053609165
ADDRLP4 36
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4161
;4161:	}
LABELV $1677
line 4163
;4162:
;4163:	if (ps->fd.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1679
line 4164
;4164:	{
line 4165
;4165:		if (ps->fd.forceSpeedSmash < 1.2)
ADDRFP4 0
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
CNSTF4 1067030938
GEF4 $1681
line 4166
;4166:		{
line 4167
;4167:			ps->fd.forceSpeedSmash = 1.2;
ADDRFP4 0
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 1067030938
ASGNF4
line 4168
;4168:		}
LABELV $1681
line 4169
;4169:		if (ps->fd.forceSpeedSmash > forceSpeedLevels[ps->fd.forcePowerLevel[FP_SPEED]]) //2.8
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceSpeedLevels
ADDP4
INDIRF4
LEF4 $1683
line 4170
;4170:		{
line 4171
;4171:			ps->fd.forceSpeedSmash = forceSpeedLevels[ps->fd.forcePowerLevel[FP_SPEED]];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1136
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceSpeedLevels
ADDP4
INDIRF4
ASGNF4
line 4172
;4172:		}
LABELV $1683
line 4173
;4173:		ps->speed *= ps->fd.forceSpeedSmash;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 4174
;4174:		ps->fd.forceSpeedSmash += 0.005f;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 1136
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1000593162
ADDF4
ASGNF4
line 4175
;4175:	}
LABELV $1679
line 4177
;4176:
;4177:	if (ps->fd.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1685
line 4178
;4178:	{
line 4179
;4179:		ps->speed *= 1.3;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1067869798
ADDRLP4 36
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4180
;4180:	}
ADDRGP4 $1686
JUMPV
LABELV $1685
line 4181
;4181:	else if (ps->fd.forceRageRecoveryTime > svTime)
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $1687
line 4182
;4182:	{
line 4183
;4183:		ps->speed *= 0.75;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1061158912
ADDRLP4 36
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4184
;4184:	}
LABELV $1687
LABELV $1686
line 4186
;4185:
;4186:	if (ps->fd.forceGripCripple)
ADDRFP4 0
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1689
line 4187
;4187:	{
line 4188
;4188:		if (ps->fd.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1691
line 4189
;4189:		{
line 4190
;4190:			ps->speed *= 0.9;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1063675494
ADDRLP4 36
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4191
;4191:		}
ADDRGP4 $1692
JUMPV
LABELV $1691
line 4192
;4192:		else if (ps->fd.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1693
line 4193
;4193:		{ //force speed will help us escape
line 4194
;4194:			ps->speed *= 0.8;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1061997773
ADDRLP4 36
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4195
;4195:		}
ADDRGP4 $1694
JUMPV
LABELV $1693
line 4197
;4196:		else
;4197:		{
line 4198
;4198:			ps->speed *= 0.2;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1045220557
ADDRLP4 36
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4199
;4199:		}
LABELV $1694
LABELV $1692
line 4200
;4200:	}
LABELV $1689
line 4202
;4201:
;4202:	if ( BG_SaberInAttack( ps->saberMove ) && cmd->forwardmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $1695
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
GEI4 $1695
line 4203
;4203:	{//if running backwards while attacking, don't run as fast.
line 4204
;4204:		switch( ps->fd.saberAnimLevel )
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
EQI4 $1700
ADDRLP4 44
INDIRI4
CNSTI4 2
EQI4 $1701
ADDRLP4 44
INDIRI4
CNSTI4 3
EQI4 $1702
ADDRGP4 $1696
JUMPV
line 4205
;4205:		{
LABELV $1700
line 4207
;4206:		case FORCE_LEVEL_1:
;4207:			ps->speed *= 0.75f;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTF4 1061158912
ADDRLP4 52
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4208
;4208:			break;
ADDRGP4 $1696
JUMPV
LABELV $1701
line 4210
;4209:		case FORCE_LEVEL_2:
;4210:			ps->speed *= 0.60f;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTF4 1058642330
ADDRLP4 56
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4211
;4211:			break;
ADDRGP4 $1696
JUMPV
LABELV $1702
line 4213
;4212:		case FORCE_LEVEL_3:
;4213:			ps->speed *= 0.45f;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTF4 1055286886
ADDRLP4 60
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4214
;4214:			break;
line 4216
;4215:		default:
;4216:			break;
line 4218
;4217:		}
;4218:	}
ADDRGP4 $1696
JUMPV
LABELV $1695
line 4219
;4219:	else if ( BG_SpinningSaberAnim( ps->legsAnim ) )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1703
line 4220
;4220:	{
line 4221
;4221:		if (ps->fd.saberAnimLevel == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1705
line 4222
;4222:		{
line 4223
;4223:			ps->speed *= 0.3f;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1050253722
ADDRLP4 48
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4224
;4224:		}
ADDRGP4 $1704
JUMPV
LABELV $1705
line 4226
;4225:		else
;4226:		{
line 4227
;4227:			ps->speed *= 0.5f;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1056964608
ADDRLP4 48
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4228
;4228:		}
line 4229
;4229:	}
ADDRGP4 $1704
JUMPV
LABELV $1703
line 4230
;4230:	else if ( ps->weapon == WP_SABER && BG_SaberInAttack( ps->saberMove ) )
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1707
ADDRLP4 48
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $1707
line 4231
;4231:	{//if attacking with saber while running, drop your speed
line 4232
;4232:		switch( ps->fd.saberAnimLevel )
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 2
EQI4 $1712
ADDRLP4 56
INDIRI4
CNSTI4 3
EQI4 $1713
ADDRGP4 $1708
JUMPV
line 4233
;4233:		{
LABELV $1712
line 4235
;4234:		case FORCE_LEVEL_2:
;4235:			ps->speed *= 0.85f;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTF4 1062836634
ADDRLP4 64
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4236
;4236:			break;
ADDRGP4 $1708
JUMPV
LABELV $1713
line 4238
;4237:		case FORCE_LEVEL_3:
;4238:			ps->speed *= 0.55f;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTF4 1057803469
ADDRLP4 68
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4239
;4239:			break;
line 4241
;4240:		default:
;4241:			break;
line 4243
;4242:		}
;4243:	}
ADDRGP4 $1708
JUMPV
LABELV $1707
line 4244
;4244:	else if (ps->weapon == WP_SABER && ps->fd.saberAnimLevel == FORCE_LEVEL_3 &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1714
ADDRLP4 56
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1714
ADDRLP4 56
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $1714
line 4246
;4245:		PM_SaberInTransition(ps->saberMove))
;4246:	{ //Now, we want to even slow down in transitions for level 3 (since it has chains and stuff now)
line 4247
;4247:		if (cmd->forwardmove < 0)
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1716
line 4248
;4248:		{
line 4249
;4249:			ps->speed *= 0.4f;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTF4 1053609165
ADDRLP4 64
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4250
;4250:		}
ADDRGP4 $1717
JUMPV
LABELV $1716
line 4252
;4251:		else
;4252:		{
line 4253
;4253:			ps->speed *= 0.6f;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTF4 1058642330
ADDRLP4 64
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4254
;4254:		}
LABELV $1717
line 4255
;4255:	}
LABELV $1714
LABELV $1708
LABELV $1704
LABELV $1696
line 4258
;4256:
;4257:
;4258:	if ( BG_InRoll( ps, ps->legsAnim ) && ps->speed > 200 )
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1718
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 200
LEI4 $1718
line 4259
;4259:	{ //can't roll unless you're able to move normally
line 4260
;4260:		BG_CmdForRoll( ps->legsAnim, cmd );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BG_CmdForRoll
CALLV
pop
line 4261
;4261:		if ((ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_ROLL_B)
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 886
NEI4 $1720
line 4262
;4262:		{ //backwards roll is pretty fast, should also be slower
line 4263
;4263:			ps->speed = ps->legsTimer/2.5;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1075838976
DIVF4
CVFI4 4
ASGNI4
line 4264
;4264:		}
ADDRGP4 $1721
JUMPV
LABELV $1720
line 4266
;4265:		else
;4266:		{
line 4267
;4267:			ps->speed = ps->legsTimer/1.5;//450;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1069547520
DIVF4
CVFI4 4
ASGNI4
line 4268
;4268:		}
LABELV $1721
line 4269
;4269:		if (ps->speed > 600)
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 600
LEI4 $1722
line 4270
;4270:		{
line 4271
;4271:			ps->speed = 600;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 600
ASGNI4
line 4272
;4272:		}
LABELV $1722
line 4274
;4273:		//Automatically slow down as the roll ends.
;4274:	}
LABELV $1718
line 4275
;4275:}
LABELV $1646
endproc BG_AdjustClientSpeed 76 8
export PmoveSingle
proc PmoveSingle 120 16
line 4285
;4276:
;4277:/*
;4278:================
;4279:PmoveSingle
;4280:
;4281:================
;4282:*/
;4283:void trap_SnapVector( float *v );
;4284:
;4285:void PmoveSingle (pmove_t *pmove) {
line 4286
;4286:	pm = pmove;
ADDRGP4 pm
ADDRFP4 0
INDIRP4
ASGNP4
line 4288
;4287:
;4288:	gPMDoSlowFall = PM_DoSlowFall();
ADDRLP4 0
ADDRGP4 PM_DoSlowFall
CALLI4
ASGNI4
ADDRGP4 gPMDoSlowFall
ADDRLP4 0
INDIRI4
ASGNI4
line 4292
;4289:
;4290:	// this counter lets us debug movement problems with a journal
;4291:	// by setting a conditional breakpoint fot the previous frame
;4292:	c_pmove++;
ADDRLP4 4
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4295
;4293:
;4294:	// clear results
;4295:	pm->numtouch = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4296
;4296:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 4297
;4297:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 0
ASGNI4
line 4299
;4298:
;4299:	if (pm->ps->pm_type == PM_FLOAT)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1725
line 4300
;4300:	{ //You get no control over where you go in grip movement
line 4301
;4301:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4302
;4302:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4303
;4303:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4304
;4304:	}
LABELV $1725
line 4306
;4305:
;4306:	if (pm->ps->eFlags & EF_DISINTEGRATION)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $1727
line 4307
;4307:	{
line 4308
;4308:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4309
;4309:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4310
;4310:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4311
;4311:	}
LABELV $1727
line 4313
;4312:
;4313:	if ( pm->ps->saberMove == LS_A_LUNGE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1729
line 4314
;4314:	{//can't move during lunge
line 4315
;4315:		pm->cmd.rightmove = pm->cmd.upmove = 0;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI1 0
ASGNI1
ADDRLP4 8
INDIRP4
CNSTI4 30
ADDP4
ADDRLP4 12
INDIRI1
ASGNI1
ADDRLP4 8
INDIRP4
CNSTI4 29
ADDP4
ADDRLP4 12
INDIRI1
ASGNI1
line 4316
;4316:		if ( pm->ps->legsTimer > 500 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 500
LEI4 $1731
line 4317
;4317:		{
line 4318
;4318:			pm->cmd.forwardmove = 127;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 127
ASGNI1
line 4319
;4319:		}
ADDRGP4 $1732
JUMPV
LABELV $1731
line 4321
;4320:		else
;4321:		{
line 4322
;4322:			pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4323
;4323:		}
LABELV $1732
line 4324
;4324:	}
LABELV $1729
line 4326
;4325:
;4326:	if ( pm->ps->saberMove == LS_A_JUMP_T__B_ )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 15
NEI4 $1733
line 4327
;4327:	{//can't move during leap
line 4328
;4328:		if ( pm->ps->groundEntityNum != ENTITYNUM_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $1735
line 4329
;4329:		{//hit the ground
line 4330
;4330:			pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4331
;4331:		}
LABELV $1735
line 4332
;4332:		pm->cmd.rightmove = pm->cmd.upmove = 0;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI1 0
ASGNI1
ADDRLP4 8
INDIRP4
CNSTI4 30
ADDP4
ADDRLP4 12
INDIRI1
ASGNI1
ADDRLP4 8
INDIRP4
CNSTI4 29
ADDP4
ADDRLP4 12
INDIRI1
ASGNI1
line 4333
;4333:	}
LABELV $1733
line 4335
;4334:
;4335:	if ( pm->ps->saberMove == LS_A_BACK || pm->ps->saberMove == LS_A_BACK_CR 
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 12
EQI4 $1743
ADDRLP4 8
INDIRI4
CNSTI4 13
EQI4 $1743
ADDRLP4 8
INDIRI4
CNSTI4 11
EQI4 $1743
ADDRLP4 8
INDIRI4
CNSTI4 16
EQI4 $1743
ADDRLP4 8
INDIRI4
CNSTI4 17
EQI4 $1743
ADDRLP4 8
INDIRI4
CNSTI4 15
NEI4 $1737
LABELV $1743
line 4338
;4336:		|| pm->ps->saberMove == LS_A_BACKSTAB || pm->ps->saberMove == LS_A_FLIP_STAB ||
;4337:		pm->ps->saberMove == LS_A_FLIP_SLASH || pm->ps->saberMove == LS_A_JUMP_T__B_ )
;4338:	{
line 4339
;4339:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4340
;4340:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4341
;4341:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4342
;4342:	}
LABELV $1737
line 4344
;4343:
;4344:	if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_A2_STABBACK1) ||
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 564
EQI4 $1750
ADDRLP4 12
INDIRI4
CNSTI4 565
EQI4 $1750
ADDRLP4 12
INDIRI4
CNSTI4 570
EQI4 $1750
ADDRLP4 12
INDIRI4
CNSTI4 568
EQI4 $1750
ADDRLP4 12
INDIRI4
CNSTI4 567
EQI4 $1750
ADDRLP4 12
INDIRI4
CNSTI4 566
NEI4 $1744
LABELV $1750
line 4350
;4345:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_ATTACK_BACK) ||
;4346:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_CROUCHATTACKBACK1) ||
;4347:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_FORCELEAP2_T__B_) ||
;4348:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_JUMPFLIPSTABDOWN) ||
;4349:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_JUMPFLIPSLASHDOWN1))
;4350:	{
line 4351
;4351:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4352
;4352:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4353
;4353:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4354
;4354:	}
LABELV $1744
line 4356
;4355:
;4356:	if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_KISSER1LOOP ||
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 745
EQI4 $1753
ADDRLP4 16
INDIRI4
CNSTI4 752
NEI4 $1751
LABELV $1753
line 4358
;4357:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_KISSEE1LOOP)
;4358:	{
line 4359
;4359:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4360
;4360:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4361
;4361:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4362
;4362:	}
LABELV $1751
line 4364
;4363:
;4364:	if (pm->ps->emplacedIndex)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1754
line 4365
;4365:	{
line 4366
;4366:		if (pm->cmd.forwardmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1756
line 4367
;4367:		{
line 4368
;4368:			pm->ps->emplacedIndex = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 4369
;4369:		}
ADDRGP4 $1757
JUMPV
LABELV $1756
line 4371
;4370:		else
;4371:		{
line 4372
;4372:			pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4373
;4373:			pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4374
;4374:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4375
;4375:		}
LABELV $1757
line 4376
;4376:	}
LABELV $1754
line 4378
;4377:
;4378:	if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->weaponstate == WEAPON_CHARGING_ALT)
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 5
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $1758
ADDRLP4 20
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $1758
line 4379
;4379:	{ //not allowed to move while charging the disruptor
line 4380
;4380:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4381
;4381:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4382
;4382:		if (pm->cmd.upmove > 0)
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $1760
line 4383
;4383:		{
line 4384
;4384:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4385
;4385:		}
LABELV $1760
line 4386
;4386:	}
LABELV $1758
line 4388
;4387:
;4388:	BG_AdjustClientSpeed(pm->ps, &pm->cmd, pm->cmd.serverTime);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
INDIRI4
ARGI4
ADDRGP4 BG_AdjustClientSpeed
CALLV
pop
line 4390
;4389:
;4390:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1762
line 4391
;4391:		pm->tracemask &= ~CONTENTS_BODY;	// corpses can fly through bodies
ADDRLP4 36
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 4392
;4392:	}
LABELV $1762
line 4396
;4393:
;4394:	// make sure walking button is clear if they are running, to avoid
;4395:	// proxy no-footsteps cheats
;4396:	if ( abs( pm->cmd.forwardmove ) > 64 || abs( pm->cmd.rightmove ) > 64 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 36
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 64
GTI4 $1766
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 40
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 64
LEI4 $1764
LABELV $1766
line 4397
;4397:		pm->cmd.buttons &= ~BUTTON_WALKING;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 4398
;4398:	}
LABELV $1764
line 4401
;4399:
;4400:	// set the talk balloon flag
;4401:	if ( pm->cmd.buttons & BUTTON_TALK ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1767
line 4402
;4402:		pm->ps->eFlags |= EF_TALK;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 4403
;4403:	} else {
ADDRGP4 $1768
JUMPV
LABELV $1767
line 4404
;4404:		pm->ps->eFlags &= ~EF_TALK;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 4405
;4405:	}
LABELV $1768
line 4409
;4406:
;4407:	// In certain situations, we may want to control which attack buttons are pressed and what kind of functionality
;4408:	//	is attached to them
;4409:	PM_AdjustAttackStates( pm );
ADDRGP4 pm
INDIRP4
ARGP4
ADDRGP4 PM_AdjustAttackStates
CALLV
pop
line 4412
;4410:
;4411:	// clear the respawned flag if attack and use are cleared
;4412:	if ( pm->ps->stats[STAT_HEALTH] > 0 && 
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $1769
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $1769
line 4413
;4413:		!( pm->cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE) ) ) {
line 4414
;4414:		pm->ps->pm_flags &= ~PMF_RESPAWNED;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 4415
;4415:	}
LABELV $1769
line 4420
;4416:
;4417:	// if talk button is down, dissallow all other input
;4418:	// this is to prevent any possible intercept proxy from
;4419:	// adding fake talk balloons
;4420:	if ( pmove->cmd.buttons & BUTTON_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1771
line 4423
;4421:		// keep the talk button set tho for when the cmd.serverTime > 66 msec
;4422:		// and the same cmd is used multiple times in Pmove
;4423:		pmove->cmd.buttons = BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 2
ASGNI4
line 4424
;4424:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4425
;4425:		pmove->cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4426
;4426:		pmove->cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4427
;4427:	}
LABELV $1771
line 4430
;4428:
;4429:	// clear all pmove local vars
;4430:	memset (&pml, 0, sizeof(pml));
ADDRGP4 pml
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1164
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4433
;4431:
;4432:	// determine the time
;4433:	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
ADDRGP4 pml+40
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 4434
;4434:	if ( pml.msec < 1 ) {
ADDRGP4 pml+40
INDIRI4
CNSTI4 1
GEI4 $1774
line 4435
;4435:		pml.msec = 1;
ADDRGP4 pml+40
CNSTI4 1
ASGNI4
line 4436
;4436:	} else if ( pml.msec > 200 ) {
ADDRGP4 $1775
JUMPV
LABELV $1774
ADDRGP4 pml+40
INDIRI4
CNSTI4 200
LEI4 $1778
line 4437
;4437:		pml.msec = 200;
ADDRGP4 pml+40
CNSTI4 200
ASGNI4
line 4438
;4438:	}
LABELV $1778
LABELV $1775
line 4439
;4439:	pm->ps->commandTime = pmove->cmd.serverTime;
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 4442
;4440:
;4441:	// save old org in case we get stuck
;4442:	VectorCopy (pm->ps->origin, pml.previous_origin);
ADDRGP4 pml+1136
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4445
;4443:
;4444:	// save old velocity for crashlanding
;4445:	VectorCopy (pm->ps->velocity, pml.previous_velocity);
ADDRGP4 pml+1148
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 4447
;4446:
;4447:	pml.frametime = pml.msec * 0.001;
ADDRGP4 pml+36
CNSTF4 981668463
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 4449
;4448:
;4449:	PM_AdjustAngleForWallRun(pm->ps, &pm->cmd, qtrue);
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 PM_AdjustAngleForWallRun
CALLI4
pop
line 4451
;4450:
;4451:	if (pm->ps->saberMove == LS_A_JUMP_T__B_ || pm->ps->saberMove == LS_A_LUNGE ||
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 15
EQI4 $1791
ADDRLP4 56
INDIRI4
CNSTI4 14
EQI4 $1791
ADDRLP4 56
INDIRI4
CNSTI4 13
EQI4 $1791
ADDRLP4 56
INDIRI4
CNSTI4 12
EQI4 $1791
ADDRLP4 56
INDIRI4
CNSTI4 11
NEI4 $1786
LABELV $1791
line 4454
;4452:		pm->ps->saberMove == LS_A_BACK_CR || pm->ps->saberMove == LS_A_BACK ||
;4453:		pm->ps->saberMove == LS_A_BACKSTAB)
;4454:	{
line 4455
;4455:		PM_SetPMViewAngle(pm->ps, pm->ps->viewangles, &pm->cmd);
ADDRLP4 60
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_SetPMViewAngle
CALLV
pop
line 4456
;4456:	}
LABELV $1786
line 4458
;4457:
;4458:	if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_KISSER1LOOP ||
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 745
EQI4 $1794
ADDRLP4 60
INDIRI4
CNSTI4 752
NEI4 $1792
LABELV $1794
line 4460
;4459:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_KISSEE1LOOP)
;4460:	{
line 4461
;4461:		pm->ps->viewangles[PITCH] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
CNSTF4 0
ASGNF4
line 4462
;4462:		PM_SetPMViewAngle(pm->ps, pm->ps->viewangles, &pm->cmd);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_SetPMViewAngle
CALLV
pop
line 4463
;4463:	}
LABELV $1792
line 4466
;4464:
;4465:	// update the viewangles
;4466:	PM_UpdateViewAngles( pm->ps, &pm->cmd );
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 4468
;4467:
;4468:	AngleVectors (pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4470
;4469:
;4470:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $1797
line 4472
;4471:		// not holding jump
;4472:		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 4473
;4473:	}
LABELV $1797
line 4476
;4474:
;4475:	// decide if backpedaling animations should be used
;4476:	if ( pm->cmd.forwardmove < 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1799
line 4477
;4477:		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 4478
;4478:	} else if ( pm->cmd.forwardmove > 0 || ( pm->cmd.forwardmove == 0 && pm->cmd.rightmove ) ) {
ADDRGP4 $1800
JUMPV
LABELV $1799
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GTI4 $1803
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $1801
ADDRLP4 68
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 76
INDIRI4
EQI4 $1801
LABELV $1803
line 4479
;4479:		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 4480
;4480:	}
LABELV $1801
LABELV $1800
line 4482
;4481:
;4482:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRLP4 80
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
LTI4 $1804
line 4483
;4483:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4484
;4484:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4485
;4485:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4486
;4486:	}
LABELV $1804
line 4488
;4487:
;4488:	if (pm->ps->saberLockTime >= pm->cmd.serverTime)
ADDRLP4 84
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $1806
line 4489
;4489:	{
line 4490
;4490:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4491
;4491:		pm->cmd.forwardmove = 50;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 50
ASGNI1
line 4492
;4492:		pm->cmd.rightmove = 0;//*= 0.1;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4493
;4493:	}
LABELV $1806
line 4495
;4494:
;4495:	if ( pm->ps->pm_type == PM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1808
line 4496
;4496:		PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 4497
;4497:		PM_FlyMove ();
ADDRGP4 PM_FlyMove
CALLV
pop
line 4498
;4498:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 4499
;4499:		return;
ADDRGP4 $1724
JUMPV
LABELV $1808
line 4502
;4500:	}
;4501:
;4502:	if ( pm->ps->pm_type == PM_NOCLIP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1810
line 4503
;4503:		PM_NoclipMove ();
ADDRGP4 PM_NoclipMove
CALLV
pop
line 4504
;4504:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 4505
;4505:		return;
ADDRGP4 $1724
JUMPV
LABELV $1810
line 4508
;4506:	}
;4507:
;4508:	if (pm->ps->pm_type == PM_FREEZE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1812
line 4509
;4509:		return;		// no movement at all
ADDRGP4 $1724
JUMPV
LABELV $1812
line 4512
;4510:	}
;4511:
;4512:	if ( pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 6
EQI4 $1816
ADDRLP4 88
INDIRI4
CNSTI4 7
NEI4 $1814
LABELV $1816
line 4513
;4513:		return;		// no movement at all
ADDRGP4 $1724
JUMPV
LABELV $1814
line 4516
;4514:	}
;4515:
;4516:	if (gPMDoSlowFall)
ADDRGP4 gPMDoSlowFall
INDIRI4
CNSTI4 0
EQI4 $1817
line 4517
;4517:	{
line 4518
;4518:		pm->ps->gravity *= 0.5;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTF4 1056964608
ADDRLP4 92
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4519
;4519:	}
LABELV $1817
line 4522
;4520:
;4521:	// set watertype, and waterlevel
;4522:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 4523
;4523:	pml.previous_waterlevel = pmove->waterlevel;
ADDRGP4 pml+1160
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 4526
;4524:
;4525:	// set mins, maxs, and viewheight
;4526:	PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 4529
;4527:
;4528:	// set groundentity
;4529:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 4531
;4530:
;4531:	if ( pm->ps->groundEntityNum != ENTITYNUM_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $1820
line 4532
;4532:	{//on ground
line 4533
;4533:		pm->ps->fd.forceJumpZStart = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
CNSTF4 0
ASGNF4
line 4534
;4534:	}
LABELV $1820
line 4536
;4535:
;4536:	if ( pm->ps->pm_type == PM_DEAD ) {
ADDRLP4 92
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $1822
line 4537
;4537:		PM_DeadMove ();
ADDRGP4 PM_DeadMove
CALLV
pop
line 4538
;4538:	}
LABELV $1822
line 4540
;4539:
;4540:	PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 4542
;4541:
;4542:	if (pm->ps->pm_type == PM_FLOAT)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1824
line 4543
;4543:	{
line 4544
;4544:		PM_FlyMove ();
ADDRGP4 PM_FlyMove
CALLV
pop
line 4545
;4545:	}
ADDRGP4 $1825
JUMPV
LABELV $1824
line 4547
;4546:	else
;4547:	{
line 4548
;4548:		if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1826
line 4549
;4549:			PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 4550
;4550:		} else if ( pm->waterlevel > 1 ) {
ADDRGP4 $1827
JUMPV
LABELV $1826
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1828
line 4552
;4551:			// swimming
;4552:			PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 4553
;4553:		} else if ( pml.walking ) {
ADDRGP4 $1829
JUMPV
LABELV $1828
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $1830
line 4555
;4554:			// walking on ground
;4555:			PM_WalkMove();
ADDRGP4 PM_WalkMove
CALLV
pop
line 4556
;4556:		} else {
ADDRGP4 $1831
JUMPV
LABELV $1830
line 4558
;4557:			// airborne
;4558:			PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 4559
;4559:		}
LABELV $1831
LABELV $1829
LABELV $1827
line 4560
;4560:	}
LABELV $1825
line 4562
;4561:
;4562:	PM_Animate();
ADDRGP4 PM_Animate
CALLV
pop
line 4565
;4563:
;4564:	// set groundentity, watertype, and waterlevel
;4565:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 4566
;4566:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 4568
;4567:
;4568:	if (pm->cmd.forcesel != -1 && (pm->ps->fd.forcePowersKnown & (1 << pm->cmd.forcesel)))
ADDRLP4 96
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 25
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 -1
EQI4 $1833
ADDRLP4 96
INDIRP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 100
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1833
line 4569
;4569:	{
line 4570
;4570:		pm->ps->fd.forcePowerSelected = pm->cmd.forcesel;
ADDRLP4 104
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 25
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 4571
;4571:	}
LABELV $1833
line 4572
;4572:	if (pm->cmd.invensel != -1 && (pm->ps->stats[STAT_HOLDABLE_ITEMS] & (1 << pm->cmd.invensel)))
ADDRLP4 104
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 108
ADDRLP4 104
INDIRP4
CNSTI4 26
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 -1
EQI4 $1835
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 108
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1835
line 4573
;4573:	{
line 4574
;4574:		pm->ps->stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(pm->cmd.invensel, IT_HOLDABLE);
ADDRLP4 112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 26
ADDP4
INDIRU1
CVUI4 1
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 116
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRLP4 112
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 116
INDIRI4
ASGNI4
line 4575
;4575:	}
LABELV $1835
line 4578
;4576:
;4577:	// weapons
;4578:	PM_Weapon();
ADDRGP4 PM_Weapon
CALLV
pop
line 4580
;4579:
;4580:	PM_Use();
ADDRGP4 PM_Use
CALLV
pop
line 4583
;4581:
;4582:	// footstep events / legs animations
;4583:	PM_Footsteps();
ADDRGP4 PM_Footsteps
CALLV
pop
line 4586
;4584:
;4585:	// entering / leaving water splashes
;4586:	PM_WaterEvents();
ADDRGP4 PM_WaterEvents
CALLV
pop
line 4589
;4587:
;4588:	// snap some parts of playerstate to save network bandwidth
;4589:	trap_SnapVector( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 4591
;4590:
;4591:	if (gPMDoSlowFall)
ADDRGP4 gPMDoSlowFall
INDIRI4
CNSTI4 0
EQI4 $1837
line 4592
;4592:	{
line 4593
;4593:		pm->ps->gravity *= 2;
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 4594
;4594:	}
LABELV $1837
line 4595
;4595:}
LABELV $1724
endproc PmoveSingle 120 16
export Pmove
proc Pmove 16 4
line 4605
;4596:
;4597:
;4598:/*
;4599:================
;4600:Pmove
;4601:
;4602:Can be called by either the server or the client
;4603:================
;4604:*/
;4605:void Pmove (pmove_t *pmove) {
line 4608
;4606:	int			finalTime;
;4607:
;4608:	finalTime = pmove->cmd.serverTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 4610
;4609:
;4610:	if ( finalTime < pmove->ps->commandTime ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
GEI4 $1840
line 4611
;4611:		return;	// should not happen
ADDRGP4 $1839
JUMPV
LABELV $1840
line 4614
;4612:	}
;4613:
;4614:	if ( finalTime > pmove->ps->commandTime + 1000 ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $1842
line 4615
;4615:		pmove->ps->commandTime = finalTime - 1000;
ADDRFP4 0
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 4616
;4616:	}
LABELV $1842
line 4618
;4617:
;4618:	if (pmove->ps->fallingToDeath)
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1844
line 4619
;4619:	{
line 4620
;4620:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4621
;4621:		pmove->cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4622
;4622:		pmove->cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4623
;4623:		pmove->cmd.buttons = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 4624
;4624:	}
LABELV $1844
line 4626
;4625:
;4626:	pmove->ps->pmove_framecount = (pmove->ps->pmove_framecount+1) & ((1<<PS_PMOVEFRAMECOUNTBITS)-1);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 63
BANDI4
ASGNI4
ADDRGP4 $1847
JUMPV
LABELV $1846
line 4630
;4627:
;4628:	// chop the move up if it is too long, to prevent framerate
;4629:	// dependent behavior
;4630:	while ( pmove->ps->commandTime != finalTime ) {
line 4633
;4631:		int		msec;
;4632:
;4633:		msec = finalTime - pmove->ps->commandTime;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 4635
;4634:
;4635:		if ( pmove->pmove_fixed ) {
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1849
line 4636
;4636:			if ( msec > pmove->pmove_msec ) {
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
LEI4 $1850
line 4637
;4637:				msec = pmove->pmove_msec;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 4638
;4638:			}
line 4639
;4639:		}
ADDRGP4 $1850
JUMPV
LABELV $1849
line 4640
;4640:		else {
line 4641
;4641:			if ( msec > 66 ) {
ADDRLP4 8
INDIRI4
CNSTI4 66
LEI4 $1853
line 4642
;4642:				msec = 66;
ADDRLP4 8
CNSTI4 66
ASGNI4
line 4643
;4643:			}
LABELV $1853
line 4644
;4644:		}
LABELV $1850
line 4645
;4645:		pmove->cmd.serverTime = pmove->ps->commandTime + msec;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 4646
;4646:		PmoveSingle( pmove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PmoveSingle
CALLV
pop
line 4648
;4647:
;4648:		if ( pmove->ps->pm_flags & PMF_JUMP_HELD ) {
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1855
line 4649
;4649:			pmove->cmd.upmove = 20;
ADDRFP4 0
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 20
ASGNI1
line 4650
;4650:		}
LABELV $1855
line 4651
;4651:	}
LABELV $1847
line 4630
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1846
line 4652
;4652:}
LABELV $1839
endproc Pmove 16 4
import trap_SnapVector
import PM_SaberInTransition
import PM_SetSaberMove
import PM_WeaponLightsaber
import PM_SetAnim
import PM_ForceLegsAnim
import PM_ContinueLegsAnim
import PM_StartTorsoAnim
import BG_CycleInven
import PM_StepSlideMove
import PM_SlideMove
import PM_SaberJumpAttackMove
import PM_SaberFlipOverAttackMove
import PM_SomeoneInFront
import PM_GroundDistance
import PM_AnimLength
import PM_InRollComplete
import PM_InOnGroundAnim
import PM_SpinningAnim
import PM_LandingAnim
import PM_JumpingAnim
import PM_PainAnim
import PM_InKnockDown
import PM_InSaberAnim
import PM_SaberInStart
import PM_SaberInReflect
import PM_SaberInKnockaway
import PM_SaberInParry
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
bss
export pml
align 4
LABELV pml
skip 1164
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
export pm
align 4
LABELV pm
skip 4
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
LABELV $982
char 1 37
char 1 105
char 1 58
char 1 76
char 1 97
char 1 110
char 1 100
char 1 10
char 1 0
align 1
LABELV $971
char 1 37
char 1 105
char 1 58
char 1 115
char 1 116
char 1 101
char 1 101
char 1 112
char 1 10
char 1 0
align 1
LABELV $960
char 1 37
char 1 105
char 1 58
char 1 107
char 1 105
char 1 99
char 1 107
char 1 111
char 1 102
char 1 102
char 1 10
char 1 0
align 1
LABELV $913
char 1 37
char 1 105
char 1 58
char 1 108
char 1 105
char 1 102
char 1 116
char 1 10
char 1 0
align 1
LABELV $883
char 1 37
char 1 105
char 1 58
char 1 97
char 1 108
char 1 108
char 1 115
char 1 111
char 1 108
char 1 105
char 1 100
char 1 10
char 1 0
