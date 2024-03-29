export CG_InitLocalEntities
code
proc CG_InitLocalEntities 12 12
file "../cg_localents.c"
line 21
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:// cg_localents.c -- every frame, generate renderer commands for locally
;5:// processed entities, like smoke puffs, gibs, shells, etc.
;6:
;7:#include "cg_local.h"
;8:
;9:#define	MAX_LOCAL_ENTITIES	512
;10:localEntity_t	cg_localEntities[MAX_LOCAL_ENTITIES];
;11:localEntity_t	cg_activeLocalEntities;		// double linked list
;12:localEntity_t	*cg_freeLocalEntities;		// single linked list
;13:
;14:/*
;15:===================
;16:CG_InitLocalEntities
;17:
;18:This is called at startup and for tournement restarts
;19:===================
;20:*/
;21:void	CG_InitLocalEntities( void ) {
line 24
;22:	int		i;
;23:
;24:	memset( cg_localEntities, 0, sizeof( cg_localEntities ) );
ADDRGP4 cg_localEntities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 235520
ARGI4
ADDRGP4 memset
CALLP4
pop
line 25
;25:	cg_activeLocalEntities.next = &cg_activeLocalEntities;
ADDRGP4 cg_activeLocalEntities+4
ADDRGP4 cg_activeLocalEntities
ASGNP4
line 26
;26:	cg_activeLocalEntities.prev = &cg_activeLocalEntities;
ADDRLP4 4
ADDRGP4 cg_activeLocalEntities
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 27
;27:	cg_freeLocalEntities = cg_localEntities;
ADDRGP4 cg_freeLocalEntities
ADDRGP4 cg_localEntities
ASGNP4
line 28
;28:	for ( i = 0 ; i < MAX_LOCAL_ENTITIES - 1 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $122
line 29
;29:		cg_localEntities[i].next = &cg_localEntities[i+1];
ADDRLP4 8
CNSTI4 460
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 cg_localEntities+4
ADDP4
ADDRLP4 8
INDIRI4
ADDRGP4 cg_localEntities+460
ADDP4
ASGNP4
line 30
;30:	}
LABELV $123
line 28
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 511
LTI4 $122
line 31
;31:}
LABELV $120
endproc CG_InitLocalEntities 12 12
export CG_FreeLocalEntity
proc CG_FreeLocalEntity 12 4
line 39
;32:
;33:
;34:/*
;35:==================
;36:CG_FreeLocalEntity
;37:==================
;38:*/
;39:void CG_FreeLocalEntity( localEntity_t *le ) {
line 40
;40:	if ( !le->prev ) {
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $129
line 41
;41:		CG_Error( "CG_FreeLocalEntity: not active" );
ADDRGP4 $131
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 42
;42:	}
LABELV $129
line 45
;43:
;44:	// remove from the doubly linked active list
;45:	le->prev->next = le->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 46
;46:	le->next->prev = le->prev;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRP4
ASGNP4
line 49
;47:
;48:	// the free list is only singly linked
;49:	le->next = cg_freeLocalEntities;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg_freeLocalEntities
INDIRP4
ASGNP4
line 50
;50:	cg_freeLocalEntities = le;
ADDRGP4 cg_freeLocalEntities
ADDRFP4 0
INDIRP4
ASGNP4
line 51
;51:}
LABELV $128
endproc CG_FreeLocalEntity 12 4
export CG_AllocLocalEntity
proc CG_AllocLocalEntity 8 12
line 60
;52:
;53:/*
;54:===================
;55:CG_AllocLocalEntity
;56:
;57:Will allways succeed, even if it requires freeing an old active entity
;58:===================
;59:*/
;60:localEntity_t	*CG_AllocLocalEntity( void ) {
line 63
;61:	localEntity_t	*le;
;62:
;63:	if ( !cg_freeLocalEntities ) {
ADDRGP4 cg_freeLocalEntities
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $133
line 66
;64:		// no free entities, so free the one at the end of the chain
;65:		// remove the oldest active entity
;66:		CG_FreeLocalEntity( cg_activeLocalEntities.prev );
ADDRGP4 cg_activeLocalEntities
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 67
;67:	}
LABELV $133
line 69
;68:
;69:	le = cg_freeLocalEntities;
ADDRLP4 0
ADDRGP4 cg_freeLocalEntities
INDIRP4
ASGNP4
line 70
;70:	cg_freeLocalEntities = cg_freeLocalEntities->next;
ADDRLP4 4
ADDRGP4 cg_freeLocalEntities
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
line 72
;71:
;72:	memset( le, 0, sizeof( *le ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 memset
CALLP4
pop
line 75
;73:
;74:	// link into the active list
;75:	le->next = cg_activeLocalEntities.next;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg_activeLocalEntities+4
INDIRP4
ASGNP4
line 76
;76:	le->prev = &cg_activeLocalEntities;
ADDRLP4 0
INDIRP4
ADDRGP4 cg_activeLocalEntities
ASGNP4
line 77
;77:	cg_activeLocalEntities.next->prev = le;
ADDRGP4 cg_activeLocalEntities+4
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 78
;78:	cg_activeLocalEntities.next = le;
ADDRGP4 cg_activeLocalEntities+4
ADDRLP4 0
INDIRP4
ASGNP4
line 79
;79:	return le;
ADDRLP4 0
INDIRP4
RETP4
LABELV $132
endproc CG_AllocLocalEntity 8 12
export CG_BloodTrail
proc CG_BloodTrail 48 48
line 101
;80:}
;81:
;82:
;83:/*
;84:====================================================================================
;85:
;86:FRAGMENT PROCESSING
;87:
;88:A fragment localentity interacts with the environment in some way (hitting walls),
;89:or generates more localentities along a trail.
;90:
;91:====================================================================================
;92:*/
;93:
;94:/*
;95:================
;96:CG_BloodTrail
;97:
;98:Leave expanding blood puffs behind gibs
;99:================
;100:*/
;101:void CG_BloodTrail( localEntity_t *le ) {
line 108
;102:	int		t;
;103:	int		t2;
;104:	int		step;
;105:	vec3_t	newOrigin;
;106:	localEntity_t	*blood;
;107:
;108:	step = 150;
ADDRLP4 20
CNSTI4 150
ASGNI4
line 109
;109:	t = step * ( (cg.time - cg.frametime + step ) / step );
ADDRLP4 0
ADDRLP4 20
INDIRI4
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+60
INDIRI4
SUBI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 20
INDIRI4
DIVI4
MULI4
ASGNI4
line 110
;110:	t2 = step * ( cg.time / step );
ADDRLP4 24
ADDRLP4 20
INDIRI4
ADDRGP4 cg+64
INDIRI4
ADDRLP4 20
INDIRI4
DIVI4
MULI4
ASGNI4
line 112
;111:
;112:	for ( ; t <= t2; t += step ) {
ADDRGP4 $145
JUMPV
LABELV $142
line 113
;113:		BG_EvaluateTrajectory( &le->pos, t, newOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 115
;114:
;115:		blood = CG_SmokePuff( newOrigin, vec3_origin, 
ADDRLP4 8
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1157234688
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 cgs+70296+260
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 44
INDIRP4
ASGNP4
line 124
;116:					  20,		// radius
;117:					  1, 1, 1, 1,	// color
;118:					  2000,		// trailTime
;119:					  t,		// startTime
;120:					  0,		// fadeInTime
;121:					  0,		// flags
;122:					  cgs.media.bloodTrailShader );
;123:		// use the optimized version
;124:		blood->leType = LE_FALL_SCALE_FADE;
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 126
;125:		// drop a total of 40 units over its lifetime
;126:		blood->pos.trDelta[2] = 40;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 1109393408
ASGNF4
line 127
;127:	}
LABELV $143
line 112
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
LABELV $145
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $142
line 128
;128:}
LABELV $138
endproc CG_BloodTrail 48 48
export CG_FragmentBounceMark
proc CG_FragmentBounceMark 20 44
line 136
;129:
;130:
;131:/*
;132:================
;133:CG_FragmentBounceMark
;134:================
;135:*/
;136:void CG_FragmentBounceMark( localEntity_t *le, trace_t *trace ) {
line 139
;137:	int			radius;
;138:
;139:	if ( le->leMarkType == LEMT_BLOOD ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $149
line 141
;140:
;141:		radius = 16 + (rand()&31);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 16
ADDI4
ASGNI4
line 142
;142:		CG_ImpactMark( cgs.media.bloodMarkShader, trace->endpos, trace->plane.normal, random()*360,
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cgs+70296+416
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1135869952
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 144
;143:			1,1,1,1, qtrue, radius, qfalse );
;144:	} else if ( le->leMarkType == LEMT_BURN ) {
ADDRGP4 $150
JUMPV
LABELV $149
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $153
line 146
;145:
;146:		radius = 8 + (rand()&15);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 8
ADDI4
ASGNI4
line 147
;147:		CG_ImpactMark( cgs.media.burnMarkShader, trace->endpos, trace->plane.normal, random()*360,
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cgs+70296+424
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1135869952
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 149
;148:			1,1,1,1, qtrue, radius, qfalse );
;149:	}
LABELV $153
LABELV $150
line 154
;150:
;151:
;152:	// don't allow a fragment to make multiple marks, or they
;153:	// pile up while settling
;154:	le->leMarkType = LEMT_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 155
;155:}
LABELV $148
endproc CG_FragmentBounceMark 20 44
export CG_FragmentBounceSound
proc CG_FragmentBounceSound 0 0
line 162
;156:
;157:/*
;158:================
;159:CG_FragmentBounceSound
;160:================
;161:*/
;162:void CG_FragmentBounceSound( localEntity_t *le, trace_t *trace ) {
line 163
;163:	if ( le->leBounceSoundType == LEBS_BLOOD ) {
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $158
line 181
;164:		// half the gibs will make splat sounds
;165:		/*
;166:		if ( rand() & 1 ) {
;167:			int r = rand()&3;
;168:			sfxHandle_t	s;
;169:
;170:			if ( r == 0 ) {
;171:				s = cgs.media.gibBounce1Sound;
;172:			} else if ( r == 1 ) {
;173:				s = cgs.media.gibBounce2Sound;
;174:			} else {
;175:				s = cgs.media.gibBounce3Sound;
;176:			}
;177:			trap_S_StartSound( trace->endpos, ENTITYNUM_WORLD, CHAN_AUTO, s );
;178:			
;179:		}
;180:		*/
;181:	} else if ( le->leBounceSoundType == LEBS_BRASS ) {
ADDRGP4 $159
JUMPV
LABELV $158
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $160
line 183
;182:
;183:	}
LABELV $160
LABELV $159
line 187
;184:
;185:	// don't allow a fragment to make multiple bounce sounds,
;186:	// or it gets too noisy as they settle
;187:	le->leBounceSoundType = LEBS_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 0
ASGNI4
line 188
;188:}
LABELV $157
endproc CG_FragmentBounceSound 0 0
export CG_ReflectVelocity
proc CG_ReflectVelocity 56 12
line 196
;189:
;190:
;191:/*
;192:================
;193:CG_ReflectVelocity
;194:================
;195:*/
;196:void CG_ReflectVelocity( localEntity_t *le, trace_t *trace ) {
line 202
;197:	vec3_t	velocity;
;198:	float	dot;
;199:	int		hitTime;
;200:
;201:	// reflect the velocity on the trace plane
;202:	hitTime = cg.time - cg.frametime + cg.frametime * trace->fraction;
ADDRLP4 16
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+60
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg+60
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 203
;203:	BG_EvaluateTrajectoryDelta( &le->pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 204
;204:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 205
;205:	VectorMA( velocity, -2*dot, trace->plane.normal, le->pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 207
;206:
;207:	VectorScale( le->pos.trDelta, le->bounceFactor, le->pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
line 209
;208:
;209:	VectorCopy( trace->endpos, le->pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 210
;210:	le->pos.trTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 213
;211:
;212:	// check for stop, making sure that even on low FPS systems it doesn't bobble
;213:	if ( trace->allsolid || 
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $175
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $171
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1109393408
LTF4 $175
ADDRLP4 52
INDIRF4
ADDRGP4 cg+60
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 52
INDIRF4
MULF4
GEF4 $171
LABELV $175
line 215
;214:		( trace->plane.normal[2] > 0 && 
;215:		( le->pos.trDelta[2] < 40 || le->pos.trDelta[2] < -cg.frametime * le->pos.trDelta[2] ) ) ) {
line 216
;216:		le->pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 0
ASGNI4
line 217
;217:	} else {
LABELV $171
line 219
;218:
;219:	}
LABELV $172
line 220
;220:}
LABELV $162
endproc CG_ReflectVelocity 56 12
export CG_AddFragment
proc CG_AddFragment 1120 28
line 227
;221:
;222:/*
;223:================
;224:CG_AddFragment
;225:================
;226:*/
;227:void CG_AddFragment( localEntity_t *le ) {
line 231
;228:	vec3_t	newOrigin;
;229:	trace_t	trace;
;230:
;231:	if (le->forceAlpha)
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 0
EQI4 $177
line 232
;232:	{
line 233
;233:		le->refEntity.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 234
;234:		le->refEntity.shaderRGBA[3] = le->forceAlpha;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 331
ADDP4
ADDRLP4 1096
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 235
;235:	}
LABELV $177
line 237
;236:
;237:	if ( le->pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
NEI4 $179
line 242
;238:		// sink into the ground if near the removal time
;239:		int		t;
;240:		float	t_e;
;241:		
;242:		t = le->endTime - cg.time;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
ASGNI4
line 243
;243:		if ( t < (SINK_TIME*2) ) {
ADDRLP4 1096
INDIRI4
CNSTI4 2000
GEI4 $182
line 244
;244:			le->refEntity.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ADDRLP4 1100
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 245
;245:			t_e = (float)((float)(le->endTime - cg.time)/(SINK_TIME*2));
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ASGNF4
line 246
;246:			t_e = (int)((t_e)*255);
ADDRLP4 1092
CNSTF4 1132396544
ADDRLP4 1092
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 248
;247:
;248:			if (t_e > 255)
ADDRLP4 1092
INDIRF4
CNSTF4 1132396544
LEF4 $185
line 249
;249:			{
line 250
;250:				t_e = 255;
ADDRLP4 1092
CNSTF4 1132396544
ASGNF4
line 251
;251:			}
LABELV $185
line 252
;252:			if (t_e < 1)
ADDRLP4 1092
INDIRF4
CNSTF4 1065353216
GEF4 $187
line 253
;253:			{
line 254
;254:				t_e = 1;
ADDRLP4 1092
CNSTF4 1065353216
ASGNF4
line 255
;255:			}
LABELV $187
line 257
;256:
;257:			if (le->refEntity.shaderRGBA[3] && t_e > le->refEntity.shaderRGBA[3])
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 331
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $189
ADDRLP4 1092
INDIRF4
ADDRLP4 1104
INDIRI4
CVIF4 4
LEF4 $189
line 258
;258:			{
line 259
;259:				t_e = le->refEntity.shaderRGBA[3];
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 331
ADDP4
INDIRU1
CVUI4 1
CVIF4 4
ASGNF4
line 260
;260:			}
LABELV $189
line 262
;261:
;262:			le->refEntity.shaderRGBA[3] = t_e;
ADDRLP4 1112
ADDRLP4 1092
INDIRF4
ASGNF4
ADDRLP4 1116
CNSTF4 1325400064
ASGNF4
ADDRLP4 1112
INDIRF4
ADDRLP4 1116
INDIRF4
LTF4 $192
ADDRLP4 1108
ADDRLP4 1112
INDIRF4
ADDRLP4 1116
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $193
JUMPV
LABELV $192
ADDRLP4 1108
ADDRLP4 1112
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $193
ADDRFP4 0
INDIRP4
CNSTI4 331
ADDP4
ADDRLP4 1108
INDIRU4
CVUU1 4
ASGNU1
line 264
;263:
;264:			trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 265
;265:		} else {
ADDRGP4 $176
JUMPV
LABELV $182
line 266
;266:			trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 267
;267:		}
line 269
;268:
;269:		return;
ADDRGP4 $176
JUMPV
LABELV $179
line 273
;270:	}
;271:
;272:	// calculate new position
;273:	BG_EvaluateTrajectory( &le->pos, cg.time, newOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 276
;274:
;275:	// trace a line from previous position to new position
;276:	CG_Trace( &trace, le->refEntity.origin, NULL, NULL, newOrigin, -1, CONTENTS_SOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
ARGP4
ADDRLP4 1092
CNSTP4 0
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 277
;277:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $195
line 279
;278:		// still in free fall
;279:		VectorCopy( newOrigin, le->refEntity.origin );
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
ADDRLP4 1080
INDIRB
ASGNB 12
line 281
;280:
;281:		if ( le->leFlags & LEF_TUMBLE ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $198
line 284
;282:			vec3_t angles;
;283:
;284:			BG_EvaluateTrajectory( &le->angles, cg.time, angles );
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1096
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 285
;285:			AnglesToAxis( angles, le->refEntity.axis );
ADDRLP4 1096
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 286
;286:		}
LABELV $198
line 288
;287:
;288:		trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 291
;289:
;290:		// add a blood trail
;291:		if ( le->leBounceSoundType == LEBS_BLOOD ) {
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $176
line 292
;292:			CG_BloodTrail( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_BloodTrail
CALLV
pop
line 293
;293:		}
line 295
;294:
;295:		return;
ADDRGP4 $176
JUMPV
LABELV $195
line 301
;296:	}
;297:
;298:	// if it is in a nodrop zone, remove it
;299:	// this keeps gibs from waiting at the bottom of pits of death
;300:	// and floating levels
;301:	if ( trap_CM_PointContents( trace.endpos, 0 ) & CONTENTS_NODROP ) {
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1096
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $203
line 302
;302:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 303
;303:		return;
ADDRGP4 $176
JUMPV
LABELV $203
line 306
;304:	}
;305:
;306:	if (!trace.startsolid)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
NEI4 $206
line 307
;307:	{
line 309
;308:		// leave a mark
;309:		CG_FragmentBounceMark( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FragmentBounceMark
CALLV
pop
line 312
;310:
;311:		// do a bouncy sound
;312:		CG_FragmentBounceSound( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FragmentBounceSound
CALLV
pop
line 314
;313:
;314:		if (le->bounceSound)
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
line 315
;315:		{ //specified bounce sound (debris)
line 316
;316:			trap_S_StartSound(le->pos.trBase, ENTITYNUM_WORLD, CHAN_AUTO, le->bounceSound);
ADDRLP4 1100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 1022
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1100
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 317
;317:		}
LABELV $209
line 320
;318:
;319:		// reflect the velocity on the trace plane
;320:		CG_ReflectVelocity( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_ReflectVelocity
CALLV
pop
line 322
;321:
;322:		trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 323
;323:	}
LABELV $206
line 324
;324:}
LABELV $176
endproc CG_AddFragment 1120 28
export CG_AddFadeRGB
proc CG_AddFadeRGB 60 4
line 340
;325:
;326:/*
;327:=====================================================================
;328:
;329:TRIVIAL LOCAL ENTITIES
;330:
;331:These only do simple scaling or modulation before passing to the renderer
;332:=====================================================================
;333:*/
;334:
;335:/*
;336:====================
;337:CG_AddFadeRGB
;338:====================
;339:*/
;340:void CG_AddFadeRGB( localEntity_t *le ) {
line 344
;341:	refEntity_t *re;
;342:	float c;
;343:
;344:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 346
;345:
;346:	c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 347
;347:	c *= 0xff;
ADDRLP4 4
CNSTF4 1132396544
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 349
;348:
;349:	re->shaderRGBA[0] = le->color[0] * c;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
CNSTF4 1325400064
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
LTF4 $214
ADDRLP4 12
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $215
JUMPV
LABELV $214
ADDRLP4 12
ADDRLP4 16
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $215
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 12
INDIRU4
CVUU1 4
ASGNU1
line 350
;350:	re->shaderRGBA[1] = le->color[1] * c;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
CNSTF4 1325400064
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRF4
LTF4 $217
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $218
JUMPV
LABELV $217
ADDRLP4 24
ADDRLP4 28
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $218
ADDRLP4 0
INDIRP4
CNSTI4 81
ADDP4
ADDRLP4 24
INDIRU4
CVUU1 4
ASGNU1
line 351
;351:	re->shaderRGBA[2] = le->color[2] * c;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 44
CNSTF4 1325400064
ASGNF4
ADDRLP4 40
INDIRF4
ADDRLP4 44
INDIRF4
LTF4 $220
ADDRLP4 36
ADDRLP4 40
INDIRF4
ADDRLP4 44
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $221
JUMPV
LABELV $220
ADDRLP4 36
ADDRLP4 40
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $221
ADDRLP4 0
INDIRP4
CNSTI4 82
ADDP4
ADDRLP4 36
INDIRU4
CVUU1 4
ASGNU1
line 352
;352:	re->shaderRGBA[3] = le->color[3] * c;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 56
CNSTF4 1325400064
ASGNF4
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
LTF4 $223
ADDRLP4 48
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $224
JUMPV
LABELV $223
ADDRLP4 48
ADDRLP4 52
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $224
ADDRLP4 0
INDIRP4
CNSTI4 83
ADDP4
ADDRLP4 48
INDIRU4
CVUU1 4
ASGNU1
line 354
;353:
;354:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 355
;355:}
LABELV $211
endproc CG_AddFadeRGB 60 4
proc CG_AddFadeScaleModel 104 8
line 358
;356:
;357:static void CG_AddFadeScaleModel( localEntity_t *le )
;358:{
line 359
;359:	refEntity_t	*ent = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 361
;360:
;361:	float frac = ( cg.time - le->startTime )/((float)( le->endTime - le->startTime ));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 363
;362:
;363:	frac *= frac * frac; // yes, this is completely ridiculous...but it causes the shell to grow slowly then "explode" at the end
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 365
;364:
;365:	ent->nonNormalizedAxes = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 367
;366:
;367:	AxisCopy( axisDefault, ent->axis );
ADDRGP4 axisDefault
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 369
;368:
;369:	VectorScale( ent->axis[0], le->radius * frac, ent->axis[0] );
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 370
;370:	VectorScale( ent->axis[1], le->radius * frac, ent->axis[1] );
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 371
;371:	VectorScale( ent->axis[2], le->radius * 0.5f * frac, ent->axis[2] );
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CNSTF4 1056964608
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1056964608
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1056964608
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 373
;372:
;373:	frac = 1.0f - frac;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 375
;374:
;375:	ent->shaderRGBA[0] = le->color[0] * frac;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
CNSTF4 1325400064
ASGNF4
ADDRLP4 60
INDIRF4
ADDRLP4 64
INDIRF4
LTF4 $228
ADDRLP4 56
ADDRLP4 60
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $229
JUMPV
LABELV $228
ADDRLP4 56
ADDRLP4 60
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $229
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 56
INDIRU4
CVUU1 4
ASGNU1
line 376
;376:	ent->shaderRGBA[1] = le->color[1] * frac;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
CNSTF4 1325400064
ASGNF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
LTF4 $231
ADDRLP4 68
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $232
JUMPV
LABELV $231
ADDRLP4 68
ADDRLP4 72
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $232
ADDRLP4 0
INDIRP4
CNSTI4 81
ADDP4
ADDRLP4 68
INDIRU4
CVUU1 4
ASGNU1
line 377
;377:	ent->shaderRGBA[2] = le->color[2] * frac;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
CNSTF4 1325400064
ASGNF4
ADDRLP4 84
INDIRF4
ADDRLP4 88
INDIRF4
LTF4 $234
ADDRLP4 80
ADDRLP4 84
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $235
JUMPV
LABELV $234
ADDRLP4 80
ADDRLP4 84
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $235
ADDRLP4 0
INDIRP4
CNSTI4 82
ADDP4
ADDRLP4 80
INDIRU4
CVUU1 4
ASGNU1
line 378
;378:	ent->shaderRGBA[3] = le->color[3] * frac;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 100
CNSTF4 1325400064
ASGNF4
ADDRLP4 96
INDIRF4
ADDRLP4 100
INDIRF4
LTF4 $237
ADDRLP4 92
ADDRLP4 96
INDIRF4
ADDRLP4 100
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $238
JUMPV
LABELV $237
ADDRLP4 92
ADDRLP4 96
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $238
ADDRLP4 0
INDIRP4
CNSTI4 83
ADDP4
ADDRLP4 92
INDIRU4
CVUU1 4
ASGNU1
line 381
;379:
;380:	// add the entity
;381:	trap_R_AddRefEntityToScene( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 382
;382:}
LABELV $225
endproc CG_AddFadeScaleModel 104 8
proc CG_AddMoveScaleFade 52 12
line 389
;383:
;384:/*
;385:==================
;386:CG_AddMoveScaleFade
;387:==================
;388:*/
;389:static void CG_AddMoveScaleFade( localEntity_t *le ) {
line 395
;390:	refEntity_t	*re;
;391:	float		c;
;392:	vec3_t		delta;
;393:	float		len;
;394:
;395:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 397
;396:
;397:	if ( le->fadeInTime > le->startTime && cg.time < le->fadeInTime ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LEI4 $240
ADDRGP4 cg+64
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $240
line 399
;398:		// fade / grow time
;399:		c = 1.0 - (float) ( le->fadeInTime - cg.time ) / ( le->fadeInTime - le->startTime );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTF4 1065353216
ADDRLP4 36
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 400
;400:	}
ADDRGP4 $241
JUMPV
LABELV $240
line 401
;401:	else {
line 403
;402:		// fade / grow time
;403:		c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 404
;404:	}
LABELV $241
line 406
;405:
;406:	re->shaderRGBA[3] = 0xff * c * le->color[3];
ADDRLP4 36
CNSTF4 1132396544
ADDRLP4 16
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
CNSTF4 1325400064
ASGNF4
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
LTF4 $246
ADDRLP4 32
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $247
JUMPV
LABELV $246
ADDRLP4 32
ADDRLP4 36
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $247
ADDRLP4 0
INDIRP4
CNSTI4 83
ADDP4
ADDRLP4 32
INDIRU4
CVUU1 4
ASGNU1
line 408
;407:
;408:	if ( !( le->leFlags & LEF_PUFF_DONT_SCALE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $248
line 409
;409:		re->radius = le->radius * ( 1.0 - c ) + 8;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
MULF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 410
;410:	}
LABELV $248
line 412
;411:
;412:	BG_EvaluateTrajectory( &le->pos, cg.time, re->origin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 416
;413:
;414:	// if the view would be "inside" the sprite, kill the sprite
;415:	// so it doesn't add too much overdraw
;416:	VectorSubtract( re->origin, cg.refdef.vieworg, delta );
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRGP4 cg+3616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+8
INDIRF4
SUBF4
ASGNF4
line 417
;417:	len = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 48
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 418
;418:	if ( len < le->radius ) {
ADDRLP4 20
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
GEF4 $261
line 419
;419:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 420
;420:		return;
ADDRGP4 $239
JUMPV
LABELV $261
line 423
;421:	}
;422:
;423:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 424
;424:}
LABELV $239
endproc CG_AddMoveScaleFade 52 12
proc CG_AddPuff 76 12
line 431
;425:
;426:/*
;427:==================
;428:CG_AddPuff
;429:==================
;430:*/
;431:static void CG_AddPuff( localEntity_t *le ) {
line 437
;432:	refEntity_t	*re;
;433:	float		c;
;434:	vec3_t		delta;
;435:	float		len;
;436:
;437:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 440
;438:
;439:	// fade / grow time
;440:	c = ( le->endTime - cg.time ) / (float)( le->endTime - le->startTime );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 442
;441:
;442:	re->shaderRGBA[0] = le->color[0] * c;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
CNSTF4 1325400064
ASGNF4
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
LTF4 $266
ADDRLP4 32
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $267
JUMPV
LABELV $266
ADDRLP4 32
ADDRLP4 36
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $267
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 32
INDIRU4
CVUU1 4
ASGNU1
line 443
;443:	re->shaderRGBA[1] = le->color[1] * c;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52
CNSTF4 1325400064
ASGNF4
ADDRLP4 48
INDIRF4
ADDRLP4 52
INDIRF4
LTF4 $269
ADDRLP4 44
ADDRLP4 48
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $270
JUMPV
LABELV $269
ADDRLP4 44
ADDRLP4 48
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $270
ADDRLP4 0
INDIRP4
CNSTI4 81
ADDP4
ADDRLP4 44
INDIRU4
CVUU1 4
ASGNU1
line 444
;444:	re->shaderRGBA[2] = le->color[2] * c;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
CNSTF4 1325400064
ASGNF4
ADDRLP4 60
INDIRF4
ADDRLP4 64
INDIRF4
LTF4 $272
ADDRLP4 56
ADDRLP4 60
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $273
JUMPV
LABELV $272
ADDRLP4 56
ADDRLP4 60
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $273
ADDRLP4 0
INDIRP4
CNSTI4 82
ADDP4
ADDRLP4 56
INDIRU4
CVUU1 4
ASGNU1
line 446
;445:
;446:	if ( !( le->leFlags & LEF_PUFF_DONT_SCALE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $274
line 447
;447:		re->radius = le->radius * ( 1.0 - c ) + 8;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
SUBF4
MULF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 448
;448:	}
LABELV $274
line 450
;449:
;450:	BG_EvaluateTrajectory( &le->pos, cg.time, re->origin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 454
;451:
;452:	// if the view would be "inside" the sprite, kill the sprite
;453:	// so it doesn't add too much overdraw
;454:	VectorSubtract( re->origin, cg.refdef.vieworg, delta );
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRGP4 cg+3616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+8
INDIRF4
SUBF4
ASGNF4
line 455
;455:	len = VectorLength( delta );
ADDRLP4 8
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 72
INDIRF4
ASGNF4
line 456
;456:	if ( len < le->radius ) {
ADDRLP4 20
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
GEF4 $287
line 457
;457:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 458
;458:		return;
ADDRGP4 $263
JUMPV
LABELV $287
line 461
;459:	}
;460:
;461:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 462
;462:}
LABELV $263
endproc CG_AddPuff 76 12
proc CG_AddScaleFade 48 4
line 473
;463:
;464:/*
;465:===================
;466:CG_AddScaleFade
;467:
;468:For rocket smokes that hang in place, fade out, and are
;469:removed if the view passes through them.
;470:There are often many of these, so it needs to be simple.
;471:===================
;472:*/
;473:static void CG_AddScaleFade( localEntity_t *le ) {
line 479
;474:	refEntity_t	*re;
;475:	float		c;
;476:	vec3_t		delta;
;477:	float		len;
;478:
;479:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 482
;480:
;481:	// fade / grow time
;482:	c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 484
;483:
;484:	re->shaderRGBA[3] = 0xff * c * le->color[3];
ADDRLP4 32
CNSTF4 1132396544
ADDRLP4 16
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $292
ADDRLP4 28
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $293
JUMPV
LABELV $292
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $293
ADDRLP4 0
INDIRP4
CNSTI4 83
ADDP4
ADDRLP4 28
INDIRU4
CVUU1 4
ASGNU1
line 485
;485:	re->radius = le->radius * ( 1.0 - c ) + 8;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
MULF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 489
;486:
;487:	// if the view would be "inside" the sprite, kill the sprite
;488:	// so it doesn't add too much overdraw
;489:	VectorSubtract( re->origin, cg.refdef.vieworg, delta );
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRGP4 cg+3616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+8
INDIRF4
SUBF4
ASGNF4
line 490
;490:	len = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 491
;491:	if ( len < le->radius ) {
ADDRLP4 20
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
GEF4 $304
line 492
;492:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 493
;493:		return;
ADDRGP4 $289
JUMPV
LABELV $304
line 496
;494:	}
;495:
;496:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 497
;497:}
LABELV $289
endproc CG_AddScaleFade 48 4
proc CG_AddFallScaleFade 52 4
line 510
;498:
;499:
;500:/*
;501:=================
;502:CG_AddFallScaleFade
;503:
;504:This is just an optimized CG_AddMoveScaleFade
;505:For blood mists that drift down, fade out, and are
;506:removed if the view passes through them.
;507:There are often 100+ of these, so it needs to be simple.
;508:=================
;509:*/
;510:static void CG_AddFallScaleFade( localEntity_t *le ) {
line 516
;511:	refEntity_t	*re;
;512:	float		c;
;513:	vec3_t		delta;
;514:	float		len;
;515:
;516:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 519
;517:
;518:	// fade time
;519:	c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 521
;520:
;521:	re->shaderRGBA[3] = 0xff * c * le->color[3];
ADDRLP4 32
CNSTF4 1132396544
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $309
ADDRLP4 28
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $310
JUMPV
LABELV $309
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $310
ADDRLP4 0
INDIRP4
CNSTI4 83
ADDP4
ADDRLP4 28
INDIRU4
CVUU1 4
ASGNU1
line 523
;522:
;523:	re->origin[2] = le->pos.trBase[2] - ( 1.0 - c ) * le->pos.trDelta[2];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
SUBF4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 525
;524:
;525:	re->radius = le->radius * ( 1.0 - c ) + 16;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
SUBF4
MULF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 529
;526:
;527:	// if the view would be "inside" the sprite, kill the sprite
;528:	// so it doesn't add too much overdraw
;529:	VectorSubtract( re->origin, cg.refdef.vieworg, delta );
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRGP4 cg+3616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+8
INDIRF4
SUBF4
ASGNF4
line 530
;530:	len = VectorLength( delta );
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 531
;531:	if ( len < le->radius ) {
ADDRLP4 20
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
GEF4 $321
line 532
;532:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 533
;533:		return;
ADDRGP4 $306
JUMPV
LABELV $321
line 536
;534:	}
;535:
;536:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 537
;537:}
LABELV $306
endproc CG_AddFallScaleFade 52 4
proc CG_AddExplosion 20 20
line 546
;538:
;539:
;540:
;541:/*
;542:================
;543:CG_AddExplosion
;544:================
;545:*/
;546:static void CG_AddExplosion( localEntity_t *ex ) {
line 549
;547:	refEntity_t	*ent;
;548:
;549:	ent = &ex->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 552
;550:
;551:	// add the entity
;552:	trap_R_AddRefEntityToScene(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 555
;553:
;554:	// add the dlight
;555:	if ( ex->light ) {
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
CNSTF4 0
EQF4 $324
line 558
;556:		float		light;
;557:
;558:		light = (float)( cg.time - ex->startTime ) / ( ex->endTime - ex->startTime );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 559
;559:		if ( light < 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
GEF4 $327
line 560
;560:			light = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 561
;561:		} else {
ADDRGP4 $328
JUMPV
LABELV $327
line 562
;562:			light = 1.0 - ( light - 0.5 ) * 2;
ADDRLP4 4
CNSTF4 1065353216
CNSTF4 1073741824
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
SUBF4
MULF4
SUBF4
ASGNF4
line 563
;563:		}
LABELV $328
line 564
;564:		light = ex->light * light;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 565
;565:		trap_R_AddLightToScene(ent->origin, light, ex->lightColor[0], ex->lightColor[1], ex->lightColor[2] );
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 566
;566:	}
LABELV $324
line 567
;567:}
LABELV $323
endproc CG_AddExplosion 20 20
proc CG_AddSpriteExplosion 252 20
line 574
;568:
;569:/*
;570:================
;571:CG_AddSpriteExplosion
;572:================
;573:*/
;574:static void CG_AddSpriteExplosion( localEntity_t *le ) {
line 578
;575:	refEntity_t	re;
;576:	float c;
;577:
;578:	re = le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRB
ASGNB 212
line 580
;579:
;580:	c = ( le->endTime - cg.time ) / ( float ) ( le->endTime - le->startTime );
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
ADDRLP4 216
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
ADDRLP4 220
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 220
INDIRI4
ADDRLP4 216
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 581
;581:	if ( c > 1 ) {
ADDRLP4 212
INDIRF4
CNSTF4 1065353216
LEF4 $331
line 582
;582:		c = 1.0;	// can happen during connection problems
ADDRLP4 212
CNSTF4 1065353216
ASGNF4
line 583
;583:	}
LABELV $331
line 585
;584:
;585:	re.shaderRGBA[0] = 0xff;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 586
;586:	re.shaderRGBA[1] = 0xff;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 587
;587:	re.shaderRGBA[2] = 0xff;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 588
;588:	re.shaderRGBA[3] = 0xff * c * 0.33;
ADDRLP4 228
CNSTF4 1051260355
CNSTF4 1132396544
ADDRLP4 212
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 232
CNSTF4 1325400064
ASGNF4
ADDRLP4 228
INDIRF4
ADDRLP4 232
INDIRF4
LTF4 $341
ADDRLP4 224
ADDRLP4 228
INDIRF4
ADDRLP4 232
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $342
JUMPV
LABELV $341
ADDRLP4 224
ADDRLP4 228
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $342
ADDRLP4 0+80+3
ADDRLP4 224
INDIRU4
CVUU1 4
ASGNU1
line 590
;589:
;590:	re.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 591
;591:	re.radius = 42 * ( 1.0 - c ) + 30;
ADDRLP4 0+92
CNSTF4 1109917696
CNSTF4 1065353216
ADDRLP4 212
INDIRF4
SUBF4
MULF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 593
;592:
;593:	trap_R_AddRefEntityToScene( &re );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 596
;594:
;595:	// add the dlight
;596:	if ( le->light ) {
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
CNSTF4 0
EQF4 $344
line 599
;597:		float		light;
;598:
;599:		light = (float)( cg.time - le->startTime ) / ( le->endTime - le->startTime );
ADDRLP4 240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
ADDRLP4 240
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 236
ADDRGP4 cg+64
INDIRI4
ADDRLP4 244
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 240
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 600
;600:		if ( light < 0.5 ) {
ADDRLP4 236
INDIRF4
CNSTF4 1056964608
GEF4 $347
line 601
;601:			light = 1.0;
ADDRLP4 236
CNSTF4 1065353216
ASGNF4
line 602
;602:		} else {
ADDRGP4 $348
JUMPV
LABELV $347
line 603
;603:			light = 1.0 - ( light - 0.5 ) * 2;
ADDRLP4 236
CNSTF4 1065353216
CNSTF4 1073741824
ADDRLP4 236
INDIRF4
CNSTF4 1056964608
SUBF4
MULF4
SUBF4
ASGNF4
line 604
;604:		}
LABELV $348
line 605
;605:		light = le->light * light;
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ADDRLP4 236
INDIRF4
MULF4
ASGNF4
line 606
;606:		trap_R_AddLightToScene(re.origin, light, le->lightColor[0], le->lightColor[1], le->lightColor[2] );
ADDRLP4 0+52
ARGP4
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 248
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ARGF4
ADDRLP4 248
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 607
;607:	}
LABELV $344
line 608
;608:}
LABELV $329
endproc CG_AddSpriteExplosion 252 20
export CG_AddRefEntity
proc CG_AddRefEntity 0 4
line 616
;609:
;610:
;611:/*
;612:===================
;613:CG_AddRefEntity
;614:===================
;615:*/
;616:void CG_AddRefEntity( localEntity_t *le ) {
line 617
;617:	if (le->endTime < cg.time) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
GEI4 $351
line 618
;618:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 619
;619:		return;
ADDRGP4 $350
JUMPV
LABELV $351
line 621
;620:	}
;621:	trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 622
;622:}
LABELV $350
endproc CG_AddRefEntity 0 4
lit
align 4
LABELV $355
byte 4 0
byte 4 0
byte 4 1065353216
export CG_AddScorePlum
code
proc CG_AddScorePlum 168 12
line 631
;623:
;624:/*
;625:===================
;626:CG_AddScorePlum
;627:===================
;628:*/
;629:#define NUMBER_SIZE		8
;630:
;631:void CG_AddScorePlum( localEntity_t *le ) {
line 633
;632:	refEntity_t	*re;
;633:	vec3_t		origin, delta, dir, vec, up = {0, 0, 1};
ADDRLP4 112
ADDRGP4 $355
INDIRB
ASGNB 12
line 637
;634:	float		c, len;
;635:	int			i, score, digits[10], numdigits, negative;
;636:
;637:	re = &le->refEntity;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 639
;638:
;639:	c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 128
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 128
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 641
;640:
;641:	score = le->radius;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 642
;642:	if (score < 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $357
line 643
;643:		re->shaderRGBA[0] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 80
ADDP4
CNSTU1 255
ASGNU1
line 644
;644:		re->shaderRGBA[1] = 0x11;
ADDRLP4 8
INDIRP4
CNSTI4 81
ADDP4
CNSTU1 17
ASGNU1
line 645
;645:		re->shaderRGBA[2] = 0x11;
ADDRLP4 8
INDIRP4
CNSTI4 82
ADDP4
CNSTU1 17
ASGNU1
line 646
;646:	}
ADDRGP4 $358
JUMPV
LABELV $357
line 647
;647:	else {
line 648
;648:		re->shaderRGBA[0] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 80
ADDP4
CNSTU1 255
ASGNU1
line 649
;649:		re->shaderRGBA[1] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 81
ADDP4
CNSTU1 255
ASGNU1
line 650
;650:		re->shaderRGBA[2] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 82
ADDP4
CNSTU1 255
ASGNU1
line 651
;651:		if (score >= 50) {
ADDRLP4 12
INDIRI4
CNSTI4 50
LTI4 $359
line 652
;652:			re->shaderRGBA[1] = 0;
ADDRLP4 8
INDIRP4
CNSTI4 81
ADDP4
CNSTU1 0
ASGNU1
line 653
;653:		} else if (score >= 20) {
ADDRGP4 $360
JUMPV
LABELV $359
ADDRLP4 12
INDIRI4
CNSTI4 20
LTI4 $361
line 654
;654:			re->shaderRGBA[0] = re->shaderRGBA[1] = 0;
ADDRLP4 136
CNSTU1 0
ASGNU1
ADDRLP4 8
INDIRP4
CNSTI4 81
ADDP4
ADDRLP4 136
INDIRU1
ASGNU1
ADDRLP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 136
INDIRU1
ASGNU1
line 655
;655:		} else if (score >= 10) {
ADDRGP4 $362
JUMPV
LABELV $361
ADDRLP4 12
INDIRI4
CNSTI4 10
LTI4 $363
line 656
;656:			re->shaderRGBA[2] = 0;
ADDRLP4 8
INDIRP4
CNSTI4 82
ADDP4
CNSTU1 0
ASGNU1
line 657
;657:		} else if (score >= 2) {
ADDRGP4 $364
JUMPV
LABELV $363
ADDRLP4 12
INDIRI4
CNSTI4 2
LTI4 $365
line 658
;658:			re->shaderRGBA[0] = re->shaderRGBA[2] = 0;
ADDRLP4 136
CNSTU1 0
ASGNU1
ADDRLP4 8
INDIRP4
CNSTI4 82
ADDP4
ADDRLP4 136
INDIRU1
ASGNU1
ADDRLP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 136
INDIRU1
ASGNU1
line 659
;659:		}
LABELV $365
LABELV $364
LABELV $362
LABELV $360
line 661
;660:
;661:	}
LABELV $358
line 662
;662:	if (c < 0.25)
ADDRLP4 80
INDIRF4
CNSTF4 1048576000
GEF4 $367
line 663
;663:		re->shaderRGBA[3] = 0xff * 4 * c;
ADDRLP4 136
CNSTF4 1149173760
ADDRLP4 80
INDIRF4
MULF4
ASGNF4
ADDRLP4 140
CNSTF4 1325400064
ASGNF4
ADDRLP4 136
INDIRF4
ADDRLP4 140
INDIRF4
LTF4 $370
ADDRLP4 132
ADDRLP4 136
INDIRF4
ADDRLP4 140
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $371
JUMPV
LABELV $370
ADDRLP4 132
ADDRLP4 136
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $371
ADDRLP4 8
INDIRP4
CNSTI4 83
ADDP4
ADDRLP4 132
INDIRU4
CVUU1 4
ASGNU1
ADDRGP4 $368
JUMPV
LABELV $367
line 665
;664:	else
;665:		re->shaderRGBA[3] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 83
ADDP4
CNSTU1 255
ASGNU1
LABELV $368
line 667
;666:
;667:	re->radius = NUMBER_SIZE / 2;
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
CNSTF4 1082130432
ASGNF4
line 669
;668:
;669:	VectorCopy(le->pos.trBase, origin);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 12
line 670
;670:	origin[2] += 110 - c * 100;
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1121714176
CNSTF4 1120403456
ADDRLP4 80
INDIRF4
MULF4
SUBF4
ADDF4
ASGNF4
line 672
;671:
;672:	VectorSubtract(cg.refdef.vieworg, origin, dir);
ADDRLP4 96
ADDRGP4 cg+3616+24
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96+4
ADDRGP4 cg+3616+24+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96+8
ADDRGP4 cg+3616+24+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 673
;673:	CrossProduct(dir, up, vec);
ADDRLP4 96
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 674
;674:	VectorNormalize(vec);
ADDRLP4 28
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 676
;675:
;676:	VectorMA(origin, -10 + 20 * sin(c * 2 * M_PI), vec, origin);
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 80
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 144
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
CNSTF4 1101004800
ADDRLP4 144
INDIRF4
MULF4
CNSTF4 3240099840
ADDF4
MULF4
ADDF4
ASGNF4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 80
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 148
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
CNSTF4 1101004800
ADDRLP4 148
INDIRF4
MULF4
CNSTF4 3240099840
ADDF4
MULF4
ADDF4
ASGNF4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 80
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 152
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
CNSTF4 1101004800
ADDRLP4 152
INDIRF4
MULF4
CNSTF4 3240099840
ADDF4
MULF4
ADDF4
ASGNF4
line 680
;677:
;678:	// if the view would be "inside" the sprite, kill the sprite
;679:	// so it doesn't add too much overdraw
;680:	VectorSubtract( origin, cg.refdef.vieworg, delta );
ADDRLP4 84
ADDRLP4 16
INDIRF4
ADDRGP4 cg+3616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+3616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+3616+24+8
INDIRF4
SUBF4
ASGNF4
line 681
;681:	len = VectorLength( delta );
ADDRLP4 84
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 156
INDIRF4
ASGNF4
line 682
;682:	if ( len < 20 ) {
ADDRLP4 124
INDIRF4
CNSTF4 1101004800
GEF4 $403
line 683
;683:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 684
;684:		return;
ADDRGP4 $354
JUMPV
LABELV $403
line 687
;685:	}
;686:
;687:	negative = qfalse;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 688
;688:	if (score < 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $405
line 689
;689:		negative = qtrue;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 690
;690:		score = -score;
ADDRLP4 12
ADDRLP4 12
INDIRI4
NEGI4
ASGNI4
line 691
;691:	}
LABELV $405
line 693
;692:
;693:	for (numdigits = 0; !(numdigits && !score); numdigits++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $410
JUMPV
LABELV $407
line 694
;694:		digits[numdigits] = score % 10;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 10
MODI4
ASGNI4
line 695
;695:		score = score / 10;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 696
;696:	}
LABELV $408
line 693
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $410
ADDRLP4 160
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 160
INDIRI4
EQI4 $407
ADDRLP4 12
INDIRI4
ADDRLP4 160
INDIRI4
NEI4 $407
line 698
;697:
;698:	if (negative) {
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $411
line 699
;699:		digits[numdigits] = 10;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
CNSTI4 10
ASGNI4
line 700
;700:		numdigits++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 701
;701:	}
LABELV $411
line 703
;702:
;703:	for (i = 0; i < numdigits; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $416
JUMPV
LABELV $413
line 704
;704:		VectorMA(origin, (float) (((float) numdigits / 2) - i) * NUMBER_SIZE, vec, re->origin);
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
CNSTF4 1090519040
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
CNSTF4 1090519040
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
CNSTF4 1090519040
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 705
;705:		re->customShader = cgs.media.numberShaders[digits[numdigits-1-i]];
ADDRLP4 164
CNSTI4 2
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRLP4 40
ADDP4
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRGP4 cgs+70296+264
ADDP4
INDIRI4
ASGNI4
line 706
;706:		trap_R_AddRefEntityToScene( re );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 707
;707:	}
LABELV $414
line 703
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $416
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $413
line 708
;708:}
LABELV $354
endproc CG_AddScorePlum 168 12
export CG_AddOLine
proc CG_AddOLine 76 4
line 718
;709:
;710:/*
;711:===================
;712:CG_AddOLine
;713:
;714:For forcefields/other rectangular things
;715:===================
;716:*/
;717:void CG_AddOLine( localEntity_t *le )
;718:{
line 722
;719:	refEntity_t	*re;
;720:	float		frac, alpha;
;721:
;722:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 724
;723:
;724:	frac = (cg.time - le->startTime) / ( float ) ( le->endTime - le->startTime );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 725
;725:	if ( frac > 1 ) 
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
LEF4 $425
line 726
;726:		frac = 1.0;	// can happen during connection problems
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $426
JUMPV
LABELV $425
line 727
;727:	else if (frac < 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $427
line 728
;728:		frac = 0.0;
ADDRLP4 4
CNSTF4 0
ASGNF4
LABELV $427
LABELV $426
line 731
;729:
;730:	// Use the liferate to set the scale over time.
;731:	re->data.line.width = le->data.line.width + (le->data.line.dwidth * frac);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 168
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 172
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 732
;732:	if (re->data.line.width <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRF4
CNSTF4 0
GTF4 $429
line 733
;733:	{
line 734
;734:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 735
;735:		return;
ADDRGP4 $423
JUMPV
LABELV $429
line 739
;736:	}
;737:
;738:	// We will assume here that we want additive transparency effects.
;739:	alpha = le->alpha + (le->dalpha * frac);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 740
;740:	re->shaderRGBA[0] = 0xff * alpha;
ADDRLP4 32
CNSTF4 1132396544
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $432
ADDRLP4 28
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $433
JUMPV
LABELV $432
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $433
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 28
INDIRU4
CVUU1 4
ASGNU1
line 741
;741:	re->shaderRGBA[1] = 0xff * alpha;
ADDRLP4 44
CNSTF4 1132396544
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 48
CNSTF4 1325400064
ASGNF4
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
LTF4 $435
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $436
JUMPV
LABELV $435
ADDRLP4 40
ADDRLP4 44
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $436
ADDRLP4 0
INDIRP4
CNSTI4 81
ADDP4
ADDRLP4 40
INDIRU4
CVUU1 4
ASGNU1
line 742
;742:	re->shaderRGBA[2] = 0xff * alpha;
ADDRLP4 56
CNSTF4 1132396544
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $438
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $439
JUMPV
LABELV $438
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $439
ADDRLP4 0
INDIRP4
CNSTI4 82
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 743
;743:	re->shaderRGBA[3] = 0xff * alpha;	// Yes, we could apply c to this too, but fading the color is better for lines.
ADDRLP4 68
CNSTF4 1132396544
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $441
ADDRLP4 64
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $442
JUMPV
LABELV $441
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $442
ADDRLP4 0
INDIRP4
CNSTI4 83
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 745
;744:
;745:	re->shaderTexCoord[0] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTF4 1065353216
ASGNF4
line 746
;746:	re->shaderTexCoord[1] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTF4 1065353216
ASGNF4
line 748
;747:
;748:	re->rotation = 90;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTF4 1119092736
ASGNF4
line 750
;749:
;750:	re->reType = RT_ORIENTEDLINE;
ADDRLP4 0
INDIRP4
CNSTI4 9
ASGNI4
line 752
;751:
;752:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 753
;753:}
LABELV $423
endproc CG_AddOLine 76 4
export CG_AddLine
proc CG_AddLine 4 4
line 763
;754:
;755:/*
;756:===================
;757:CG_AddLine
;758:
;759:for beams and the like.
;760:===================
;761:*/
;762:void CG_AddLine( localEntity_t *le )
;763:{
line 766
;764:	refEntity_t	*re;
;765:
;766:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
line 768
;767:
;768:	re->reType = RT_LINE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ASGNI4
line 770
;769:
;770:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 771
;771:}
LABELV $443
endproc CG_AddLine 4 4
export CG_AddLocalEntities
proc CG_AddLocalEntities 16 8
line 781
;772:
;773://==============================================================================
;774:
;775:/*
;776:===================
;777:CG_AddLocalEntities
;778:
;779:===================
;780:*/
;781:void CG_AddLocalEntities( void ) {
line 786
;782:	localEntity_t	*le, *next;
;783:
;784:	// walk the list backwards, so any new local entities generated
;785:	// (trails, marks, etc) will be present this frame
;786:	le = cg_activeLocalEntities.prev;
ADDRLP4 0
ADDRGP4 cg_activeLocalEntities
INDIRP4
ASGNP4
line 787
;787:	for ( ; le != &cg_activeLocalEntities ; le = next ) {
ADDRGP4 $448
JUMPV
LABELV $445
line 790
;788:		// grab next now, so if the local entity is freed we
;789:		// still have it
;790:		next = le->prev;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
line 792
;791:
;792:		if ( cg.time >= le->endTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
LTI4 $449
line 793
;793:			CG_FreeLocalEntity( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 794
;794:			continue;
ADDRGP4 $446
JUMPV
LABELV $449
line 796
;795:		}
;796:		switch ( le->leType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $452
ADDRLP4 8
INDIRI4
CNSTI4 13
GTI4 $452
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $470
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $470
address $453
address $458
address $457
address $459
address $460
address $461
address $462
address $464
address $463
address $465
address $466
address $467
address $468
address $469
code
LABELV $452
line 798
;797:		default:
;798:			CG_Error( "Bad leType: %i", le->leType );
ADDRGP4 $455
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 799
;799:			break;
ADDRGP4 $453
JUMPV
line 802
;800:
;801:		case LE_MARK:
;802:			break;
LABELV $457
line 805
;803:
;804:		case LE_SPRITE_EXPLOSION:
;805:			CG_AddSpriteExplosion( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddSpriteExplosion
CALLV
pop
line 806
;806:			break;
ADDRGP4 $453
JUMPV
LABELV $458
line 809
;807:
;808:		case LE_EXPLOSION:
;809:			CG_AddExplosion( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddExplosion
CALLV
pop
line 810
;810:			break;
ADDRGP4 $453
JUMPV
LABELV $459
line 813
;811:
;812:		case LE_FADE_SCALE_MODEL:
;813:			CG_AddFadeScaleModel( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddFadeScaleModel
CALLV
pop
line 814
;814:			break;
ADDRGP4 $453
JUMPV
LABELV $460
line 817
;815:
;816:		case LE_FRAGMENT:			// gibs and brass
;817:			CG_AddFragment( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddFragment
CALLV
pop
line 818
;818:			break;
ADDRGP4 $453
JUMPV
LABELV $461
line 821
;819:
;820:		case LE_PUFF:
;821:			CG_AddPuff( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddPuff
CALLV
pop
line 822
;822:			break;
ADDRGP4 $453
JUMPV
LABELV $462
line 825
;823:
;824:		case LE_MOVE_SCALE_FADE:		// water bubbles
;825:			CG_AddMoveScaleFade( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddMoveScaleFade
CALLV
pop
line 826
;826:			break;
ADDRGP4 $453
JUMPV
LABELV $463
line 829
;827:
;828:		case LE_FADE_RGB:				// teleporters, railtrails
;829:			CG_AddFadeRGB( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddFadeRGB
CALLV
pop
line 830
;830:			break;
ADDRGP4 $453
JUMPV
LABELV $464
line 833
;831:
;832:		case LE_FALL_SCALE_FADE: // gib blood trails
;833:			CG_AddFallScaleFade( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddFallScaleFade
CALLV
pop
line 834
;834:			break;
ADDRGP4 $453
JUMPV
LABELV $465
line 837
;835:
;836:		case LE_SCALE_FADE:		// rocket trails
;837:			CG_AddScaleFade( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddScaleFade
CALLV
pop
line 838
;838:			break;
ADDRGP4 $453
JUMPV
LABELV $466
line 841
;839:
;840:		case LE_SCOREPLUM:
;841:			CG_AddScorePlum( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddScorePlum
CALLV
pop
line 842
;842:			break;
ADDRGP4 $453
JUMPV
LABELV $467
line 845
;843:
;844:		case LE_OLINE:
;845:			CG_AddOLine( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddOLine
CALLV
pop
line 846
;846:			break;
ADDRGP4 $453
JUMPV
LABELV $468
line 849
;847:
;848:		case LE_SHOWREFENTITY:
;849:			CG_AddRefEntity( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddRefEntity
CALLV
pop
line 850
;850:			break;
ADDRGP4 $453
JUMPV
LABELV $469
line 853
;851:
;852:		case LE_LINE:					// oriented lines for FX
;853:			CG_AddLine( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddLine
CALLV
pop
line 854
;854:			break;
LABELV $453
line 856
;855:		}
;856:	}
LABELV $446
line 787
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
LABELV $448
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg_activeLocalEntities
CVPU4 4
NEU4 $445
line 857
;857:}
LABELV $444
endproc CG_AddLocalEntities 16 8
bss
export cg_freeLocalEntities
align 4
LABELV cg_freeLocalEntities
skip 4
export cg_activeLocalEntities
align 4
LABELV cg_activeLocalEntities
skip 460
export cg_localEntities
align 4
LABELV cg_localEntities
skip 235520
import g2WeaponInstances
import CG_CheckPlayerG2Weapons
import CG_CopyG2WeaponInstance
import CG_ShutDownG2Weapons
import CG_InitG2Weapons
import CG_CreateBBRefEnts
import CG_SetGhoul2Info
import CG_Init_CGents
import CG_Init_CG
import trap_G2API_SetNewOrigin
import trap_G2API_SetSurfaceOnOff
import trap_G2API_SetRootSurface
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CleanGhoul2Models
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_GiveMeVectorFromMatrix
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import trap_G2API_CollisionDetect
import FX_ForceDrained
import FX_BlasterWeaponHitPlayer
import FX_BlasterWeaponHitWall
import FX_BlasterAltFireThink
import FX_BlasterProjectileThink
import FX_BryarAltHitPlayer
import FX_BryarHitPlayer
import FX_BryarAltHitWall
import FX_BryarHitWall
import CG_Spark
import FX_TurretHitPlayer
import FX_TurretHitWall
import FX_TurretProjectileThink
import CG_NewParticleArea
import initparticles
import CG_GetStripEdString
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_CG_RegisterSharedMemory
import trap_SP_GetStringTextString
import trap_SP_Print
import trap_FX_AddSprite
import trap_FX_AddPrimitive
import trap_FX_AddBezier
import trap_FX_AddPoly
import trap_FX_AdjustTime
import trap_FX_FreeSystem
import trap_FX_InitSystem
import trap_FX_AddScheduledEffects
import trap_FX_PlayBoltedEffectID
import trap_FX_PlayEntityEffectID
import trap_FX_PlayEffectID
import trap_FX_PlaySimpleEffectID
import trap_FX_PlayEntityEffect
import trap_FX_PlayEffect
import trap_FX_PlaySimpleEffect
import trap_FX_RegisterEffect
import trap_R_inPVS
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import BG_CycleForce
import BG_ProperForceIndex
import BG_CycleInven
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_OpenUIMenu
import trap_SetClientTurnExtent
import trap_SetClientForceAngle
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_FX_AddLine
import trap_R_GetBModelVerts
import trap_R_SetLightStyle
import trap_R_GetLightStyle
import trap_R_RemapShader
import trap_R_DrawRotatePic2
import trap_R_DrawRotatePic
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_AnyLanguage_ReadCharFromString
import trap_Language_UsesSpaces
import trap_Language_IsAsian
import trap_R_Font_DrawString
import trap_R_Font_HeightPixels
import trap_R_Font_StrLenChars
import trap_R_Font_StrLenPixels
import trap_R_RegisterFont
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_S_MuteSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_SagaObjectiveCompleted
import CG_SagaRoundOver
import CG_InitSagaMode
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_IsMindTricked
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_InitGlass
import CG_TestLine
import CG_SurfaceExplosion
import CG_MakeExplosion
import CG_Bleed
import CG_ScorePlum
import CG_CreateDebris
import CG_GlassShatter
import CG_BubbleTrail
import CG_SmokePuff
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawIconBackground
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_GetClientWeaponMuzzleBoltPoint
import TurretClientRun
import ScaleModelAxis
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_ManualEntityRender
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_ReattachLimb
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_PlayerShieldHit
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_DeferMenuScript
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawScaledProportionalString
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawNumField
import CG_DrawString
import CG_DrawRotatePic2
import CG_DrawRotatePic
import CG_DrawPic
import CG_FillRect
import CG_TestModelAnimate_f
import CG_TestModelSetAnglespost_f
import CG_TestModelSetAnglespre_f
import CG_ListModelBones_f
import CG_ListModelSurfaces_f
import CG_TestModelSurfaceOnOff_f
import CG_TestG2Model_f
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_PrevForcePower_f
import CG_NextForcePower_f
import CG_PrevInventory_f
import CG_NextInventory_f
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_debugBB
import ui_myteam
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_trueLightning
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_hudFiles
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawEnemyInfo
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPersonHorzOffset
import cg_thirdPersonAlpha
import cg_thirdPersonTargetDamp
import cg_thirdPersonCameraDamp
import cg_thirdPersonVertOffset
import cg_thirdPersonPitchOffset
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_thirdPerson
import cg_dismember
import cg_animBlend
import cg_auraShell
import cg_speedTrail
import cg_duelHeadAngles
import cg_saberTrail
import cg_saberContact
import cg_saberDynamicMarkTime
import cg_saberDynamicMarks
import cg_fpls
import cg_saberModelTraceEffect
import cg_oldPainSounds
import cg_swingAngles
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_dynamicCrosshair
import cg_drawScores
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_shadows
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import CGCam_SetMusicMult
import CGCam_Shake
import cgScreenEffects
import ammoTicPos
import forceTicPos
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
LABELV $455
char 1 66
char 1 97
char 1 100
char 1 32
char 1 108
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $131
char 1 67
char 1 71
char 1 95
char 1 70
char 1 114
char 1 101
char 1 101
char 1 76
char 1 111
char 1 99
char 1 97
char 1 108
char 1 69
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 58
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
