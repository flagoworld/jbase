export CG_PositionEntityOnTag
code
proc CG_PositionEntityOnTag 96 24
file "../cg_ents.c"
line 31
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_ents.c -- present snapshot entities, happens every single frame
;4:
;5:#include "cg_local.h"
;6:/*
;7:Ghoul2 Insert Start
;8:*/
;9:#if MAC_PORT
;10:#include "../game/q_shared.h"
;11:#include "../ghoul2/g2.h"
;12:#else
;13:#include "..\game\q_shared.h"
;14:#include "..\ghoul2\g2.h"
;15:#endif
;16:/*
;17:Ghoul2 Insert end
;18:*/
;19:
;20:static void CG_Missile( centity_t *cent );
;21:
;22:/*
;23:======================
;24:CG_PositionEntityOnTag
;25:
;26:Modifies the entities position and axis by the given
;27:tag location
;28:======================
;29:*/
;30:void CG_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;31:							qhandle_t parentModel, char *tagName ) {
line 36
;32:	int				i;
;33:	orientation_t	lerped;
;34:	
;35:	// lerp the tag
;36:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 40
;37:		1.0 - parent->backlerp, tagName );
;38:
;39:	// FIXME: allow origin offsets along tag?
;40:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 56
CNSTI4 52
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 41
;41:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $121
line 42
;42:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 64
CNSTI4 12
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 64
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 76
CNSTI4 12
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 76
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 88
CNSTI4 12
ASGNI4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 88
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 43
;43:	}
LABELV $122
line 41
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $121
line 46
;44:
;45:	// had to cast away the const to avoid compiler problems...
;46:	MatrixMultiply( lerped.axis, ((refEntity_t *)parent)->axis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 60
CNSTI4 12
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 47
;47:	entity->backlerp = parent->backlerp;
ADDRLP4 64
CNSTI4 128
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 48
;48:}
LABELV $120
endproc CG_PositionEntityOnTag 96 24
export CG_PositionRotatedEntityOnTag
proc CG_PositionRotatedEntityOnTag 132 24
line 60
;49:
;50:
;51:/*
;52:======================
;53:CG_PositionRotatedEntityOnTag
;54:
;55:Modifies the entities position and axis by the given
;56:tag location
;57:======================
;58:*/
;59:void CG_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;60:							qhandle_t parentModel, char *tagName ) {
line 67
;61:	int				i;
;62:	orientation_t	lerped;
;63:	vec3_t			tempAxis[3];
;64:
;65://AxisClear( entity->axis );
;66:	// lerp the tag
;67:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 88
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 71
;68:		1.0 - parent->backlerp, tagName );
;69:
;70:	// FIXME: allow origin offsets along tag?
;71:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 92
CNSTI4 52
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 72
;72:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $127
line 73
;73:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 100
CNSTI4 12
ASGNI4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRLP4 100
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 112
CNSTI4 12
ASGNI4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 112
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 124
CNSTI4 12
ASGNI4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRLP4 124
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 74
;74:	}
LABELV $128
line 72
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $127
line 77
;75:
;76:	// had to cast away the const to avoid compiler problems...
;77:	MatrixMultiply( entity->axis, lerped.axis, tempAxis );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 78
;78:	MatrixMultiply( tempAxis, ((refEntity_t *)parent)->axis, entity->axis );
ADDRLP4 52
ARGP4
ADDRLP4 96
CNSTI4 12
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 79
;79:}
LABELV $126
endproc CG_PositionRotatedEntityOnTag 132 24
export CG_SetEntitySoundPosition
proc CG_SetEntitySoundPosition 24 8
line 98
;80:
;81:
;82:
;83:/*
;84:==========================================================================
;85:
;86:FUNCTIONS CALLED EACH FRAME
;87:
;88:==========================================================================
;89:*/
;90:
;91:/*
;92:======================
;93:CG_SetEntitySoundPosition
;94:
;95:Also called by event processing code
;96:======================
;97:*/
;98:void CG_SetEntitySoundPosition( centity_t *cent ) {
line 99
;99:	if ( cent->currentState.solid == SOLID_BMODEL )
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $133
line 100
;100:	{
line 104
;101:		vec3_t	origin;
;102:		float	*v;
;103:
;104:		v = cgs.inlineModelMidpoints[ cent->currentState.modelindex ];
ADDRLP4 12
CNSTI4 12
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+39952
ADDP4
ASGNP4
line 105
;105:		VectorAdd( cent->lerpOrigin, v, origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 106
;106:		trap_S_UpdateEntityPosition( cent->currentState.number, origin );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 107
;107:	}
ADDRGP4 $134
JUMPV
LABELV $133
line 109
;108:	else
;109:	{
line 110
;110:		trap_S_UpdateEntityPosition( cent->currentState.number, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 111
;111:	}
LABELV $134
line 112
;112:}
LABELV $132
endproc CG_SetEntitySoundPosition 24 8
proc CG_EntityEffects 28 20
line 121
;113:
;114:/*
;115:==================
;116:CG_EntityEffects
;117:
;118:Add continuous entity effects, like local entity emission and lighting
;119:==================
;120:*/
;121:static void CG_EntityEffects( centity_t *cent ) {
line 124
;122:
;123:	// update sound origins
;124:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 127
;125:
;126:	// add loop sound
;127:	if ( cent->currentState.loopSound ) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
line 129
;128:		//rww - doors and things with looping sounds have a crazy origin (being brush models and all)
;129:		if ( cent->currentState.solid == SOLID_BMODEL )
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $141
line 130
;130:		{
line 134
;131:			vec3_t	origin;
;132:			float	*v;
;133:
;134:			v = cgs.inlineModelMidpoints[ cent->currentState.modelindex ];
ADDRLP4 12
CNSTI4 12
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+39952
ADDP4
ASGNP4
line 135
;135:			VectorAdd( cent->lerpOrigin, v, origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 136
;136:			trap_S_AddLoopingSound( cent->currentState.number, origin, vec3_origin, 
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 138
;137:				cgs.gameSounds[ cent->currentState.loopSound ] );
;138:		}
ADDRGP4 $142
JUMPV
LABELV $141
line 139
;139:		else if (cent->currentState.eType != ET_SPEAKER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
EQI4 $147
line 140
;140:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 142
;141:				cgs.gameSounds[ cent->currentState.loopSound ] );
;142:		} else {
ADDRGP4 $148
JUMPV
LABELV $147
line 143
;143:			trap_S_AddRealLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddRealLoopingSound
CALLV
pop
line 145
;144:				cgs.gameSounds[ cent->currentState.loopSound ] );
;145:		}
LABELV $148
LABELV $142
line 146
;146:	}
LABELV $139
line 150
;147:
;148:
;149:	// constant light glow
;150:	if ( cent->currentState.constantLight ) {
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
EQI4 $151
line 154
;151:		int		cl;
;152:		int		i, r, g, b;
;153:
;154:		cl = cent->currentState.constantLight;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 155
;155:		r = cl & 255;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 156
;156:		g = ( cl >> 8 ) & 255;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 157
;157:		b = ( cl >> 16 ) & 255;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 158
;158:		i = ( ( cl >> 24 ) & 255 ) * 4;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CNSTI4 2
LSHI4
ASGNI4
line 159
;159:		trap_R_AddLightToScene( cent->lerpOrigin, i, r, g, b );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 160
;160:	}
LABELV $151
line 162
;161:
;162:}
LABELV $138
endproc CG_EntityEffects 28 20
export FX_AddOrientedLine
proc FX_AddOrientedLine 16 8
line 166
;163:
;164:localEntity_t *FX_AddOrientedLine(vec3_t start, vec3_t end, vec3_t normal, float stScale, float scale,
;165:								  float dscale, float startalpha, float endalpha, float killTime, qhandle_t shader)
;166:{
line 176
;167:	localEntity_t	*le;
;168:	
;169:#ifdef _DEBUG
;170:	if (!shader)
;171:	{
;172:		Com_Printf("FX_AddLine: NULL shader\n");
;173:	}
;174:#endif
;175:
;176:	le = CG_AllocLocalEntity();
ADDRLP4 4
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 177
;177:	le->leType = LE_OLINE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 11
ASGNI4
line 179
;178:
;179:	le->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 180
;180:	le->endTime = le->startTime + killTime;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRFP4 32
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 181
;181:	le->data.line.width = scale;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 182
;182:	le->data.line.dwidth = dscale;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 20
INDIRF4
ASGNF4
line 184
;183:
;184:	le->alpha = startalpha;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRFP4 24
INDIRF4
ASGNF4
line 185
;185:	le->dalpha = endalpha - startalpha;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 28
INDIRF4
ADDRFP4 24
INDIRF4
SUBF4
ASGNF4
line 187
;186:
;187:	le->refEntity.data.line.stscale = stScale;
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
ADDRFP4 12
INDIRF4
ASGNF4
line 188
;188:	le->refEntity.data.line.width = scale;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 190
;189:
;190:	le->refEntity.customShader = shader;
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRFP4 36
INDIRI4
ASGNI4
line 193
;191:
;192:	// set origin
;193:	VectorCopy ( start, le->refEntity.origin);
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 194
;194:	VectorCopy ( end, le->refEntity.oldorigin );
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 196
;195:
;196:	AxisClear(le->refEntity.axis);
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 197
;197:	VectorCopy( normal, le->refEntity.axis[0] );
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 198
;198:	RotateAroundDirection( le->refEntity.axis, 0); // le->refEntity.data.sprite.rotation );	This is roll in quad land
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 200
;199:
;200:	le->refEntity.shaderRGBA[0] = 0xff;
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTU1 255
ASGNU1
line 201
;201:	le->refEntity.shaderRGBA[1] = 0xff;
ADDRLP4 0
INDIRP4
CNSTI4 329
ADDP4
CNSTU1 255
ASGNU1
line 202
;202:	le->refEntity.shaderRGBA[2] = 0xff;
ADDRLP4 0
INDIRP4
CNSTI4 330
ADDP4
CNSTU1 255
ASGNU1
line 203
;203:	le->refEntity.shaderRGBA[3] = 0xff;
ADDRLP4 0
INDIRP4
CNSTI4 331
ADDP4
CNSTU1 255
ASGNU1
line 205
;204:
;205:	le->color[0] = 1.0;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1065353216
ASGNF4
line 206
;206:	le->color[1] = 1.0;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 1065353216
ASGNF4
line 207
;207:	le->color[2] = 1.0;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1065353216
ASGNF4
line 208
;208:	le->color[3] = 1.0;
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
CNSTF4 1065353216
ASGNF4
line 209
;209:	le->lifeRate = 1.0 / ( le->endTime - le->startTime );
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1065353216
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 211
;210:
;211:	return(le);
ADDRLP4 0
INDIRP4
RETP4
LABELV $153
endproc FX_AddOrientedLine 16 8
export FX_DrawPortableShield
proc FX_DrawPortableShield 1104 40
line 215
;212:}
;213:
;214:void FX_DrawPortableShield(centity_t *cent)
;215:{
line 225
;216:	//rww - this code differs a bit from the draw code in EF, I don't know why I had to do
;217:	//it this way yet it worked in EF the other way.
;218:
;219:	int				xaxis, height, posWidth, negWidth, team;
;220:	vec3_t			start, end, normal;
;221:	localEntity_t	*le;
;222:	qhandle_t		shader;
;223:	char			buf[1024];
;224:
;225:	trap_Cvar_VariableStringBuffer("cl_paused", buf, sizeof(buf));
ADDRGP4 $156
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 227
;226:
;227:	if (atoi(buf))
ADDRLP4 40
ARGP4
ADDRLP4 1088
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $157
line 228
;228:	{ //rww - fix to keep from rendering repeatedly while HUD menu is up
line 229
;229:		return;
ADDRGP4 $155
JUMPV
LABELV $157
line 232
;230:	}
;231:
;232:	if (cent->currentState.eFlags & EF_NODRAW)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $159
line 233
;233:	{
line 234
;234:		return;
ADDRGP4 $155
JUMPV
LABELV $159
line 238
;235:	}
;236:
;237:	// decode the data stored in time2
;238:	xaxis = ((cent->currentState.time2 >> 24) & 1);
ADDRLP4 1064
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 239
;239:	height = ((cent->currentState.time2 >> 16) & 255);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 240
;240:	posWidth = ((cent->currentState.time2 >> 8) & 255);
ADDRLP4 1068
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 241
;241:	negWidth = (cent->currentState.time2 & 255);
ADDRLP4 1072
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 243
;242:
;243:	team = (cent->currentState.otherEntityNum2);
ADDRLP4 1076
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 245
;244:
;245:	VectorClear(normal);
ADDRLP4 1092
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 1092
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1092
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 1092
INDIRF4
ASGNF4
line 247
;246:
;247:	VectorCopy(cent->lerpOrigin, start);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 248
;248:	VectorCopy(cent->lerpOrigin, end);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 250
;249:
;250:	if (xaxis) // drawing along x-axis
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $163
line 251
;251:	{
line 252
;252:		start[0] -= negWidth;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 1072
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 253
;253:		end[0] += posWidth;
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 1068
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 254
;254:	}
ADDRGP4 $164
JUMPV
LABELV $163
line 256
;255:	else
;256:	{
line 257
;257:		start[1] -= negWidth;
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 1072
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 258
;258:		end[1] += posWidth;
ADDRLP4 28+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 1068
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 259
;259:	}
LABELV $164
line 261
;260:
;261:	normal[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 262
;262:	normal[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 264
;263:
;264:	start[2] += height/2;
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
ADDF4
ASGNF4
line 265
;265:	end[2] += height/2;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
ADDF4
ASGNF4
line 267
;266:
;267:	if (team == TEAM_RED)
ADDRLP4 1076
INDIRI4
CNSTI4 1
NEI4 $170
line 268
;268:	{
line 269
;269:		if (cent->currentState.trickedentindex)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
EQI4 $172
line 270
;270:		{
line 271
;271:			shader = trap_R_RegisterShader( "gfx/misc/red_dmgshield" );
ADDRGP4 $174
ARGP4
ADDRLP4 1096
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 1080
ADDRLP4 1096
INDIRI4
ASGNI4
line 272
;272:		}
ADDRGP4 $171
JUMPV
LABELV $172
line 274
;273:		else
;274:		{
line 275
;275:			shader = trap_R_RegisterShader( "gfx/misc/red_portashield" );
ADDRGP4 $175
ARGP4
ADDRLP4 1096
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 1080
ADDRLP4 1096
INDIRI4
ASGNI4
line 276
;276:		}
line 277
;277:	}
ADDRGP4 $171
JUMPV
LABELV $170
line 279
;278:	else
;279:	{
line 280
;280:		if (cent->currentState.trickedentindex)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
EQI4 $176
line 281
;281:		{
line 282
;282:			shader = trap_R_RegisterShader( "gfx/misc/blue_dmgshield" );
ADDRGP4 $178
ARGP4
ADDRLP4 1096
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 1080
ADDRLP4 1096
INDIRI4
ASGNI4
line 283
;283:		}
ADDRGP4 $177
JUMPV
LABELV $176
line 285
;284:		else
;285:		{
line 286
;286:			shader = trap_R_RegisterShader( "gfx/misc/blue_portashield" );
ADDRGP4 $179
ARGP4
ADDRLP4 1096
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 1080
ADDRLP4 1096
INDIRI4
ASGNI4
line 287
;287:		}
LABELV $177
line 288
;288:	}
LABELV $171
line 290
;289:
;290:	le = FX_AddOrientedLine(start, end, normal, 1.0f, height, 0.0f, 1.0f, 1.0f, 50.0, shader);
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1096
CNSTF4 1065353216
ASGNF4
ADDRLP4 1096
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRLP4 1096
INDIRF4
ARGF4
ADDRLP4 1096
INDIRF4
ARGF4
CNSTF4 1112014848
ARGF4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 FX_AddOrientedLine
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1100
INDIRP4
ASGNP4
line 291
;291:}
LABELV $155
endproc FX_DrawPortableShield 1104 40
export CG_Special
proc CG_Special 4 4
line 298
;292:
;293:/*
;294:==================
;295:CG_Special
;296:==================
;297:*/
;298:void CG_Special( centity_t *cent ) {
line 301
;299:	entityState_t		*s1;
;300:
;301:	s1 = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 303
;302:
;303:	if (!s1)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $181
line 304
;304:	{
line 305
;305:		return;
ADDRGP4 $180
JUMPV
LABELV $181
line 309
;306:	}
;307:
;308:	// if set to invisible, skip
;309:	if (!s1->modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $183
line 310
;310:		return;
ADDRGP4 $180
JUMPV
LABELV $183
line 313
;311:	}
;312:
;313:	if (s1->modelindex == HI_SHIELD) 
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
NEI4 $185
line 314
;314:	{	// The portable shield should go through a different rendering function.
line 315
;315:		FX_DrawPortableShield(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FX_DrawPortableShield
CALLV
pop
line 316
;316:		return;
LABELV $185
line 318
;317:	}
;318:}
LABELV $180
endproc CG_Special 4 4
export CG_SetGhoul2Info
proc CG_SetGhoul2Info 0 0
line 326
;319:
;320:/*
;321:Ghoul2 Insert Start
;322:*/
;323:
;324:// Copy the ghoul2 data into the ref ent correctly
;325:void CG_SetGhoul2Info( refEntity_t *ent, centity_t *cent)
;326:{
line 328
;327:
;328:	ent->ghoul2 = cent->ghoul2;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ASGNP4
line 329
;329:	VectorCopy( cent->modelScale, ent->modelScale);
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 964
ADDP4
INDIRB
ASGNB 12
line 330
;330:	ent->radius = cent->radius;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 976
ADDP4
INDIRF4
ASGNF4
line 331
;331:	VectorCopy (cent->lerpAngles, ent->angles);
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 332
;332:}
LABELV $187
endproc CG_SetGhoul2Info 0 0
export CG_CreateBBRefEnts
proc CG_CreateBBRefEnts 0 0
line 338
;333:
;334:
;335:
;336:// create 8 new points on screen around a model so we can see it's bounding box
;337:void CG_CreateBBRefEnts(entityState_t *s1, vec3_t origin )
;338:{
line 403
;339:/* 
;340://g2r
;341:#if _DEBUG
;342:	refEntity_t		point[8];
;343:	int				i;
;344:	vec3_t			angles = {0,0,0};
;345:
;346:	for (i=0; i<8; i++)
;347:	{
;348:		memset (&point[i], 0, sizeof(refEntity_t));
;349:		point[i].reType = RT_SPRITE;
;350:		point[i].radius = 1;
;351:		point[i].customShader = trap_R_RegisterShader("textures/tests/circle");
;352:		point[i].shaderRGBA[0] = 255;
;353:		point[i].shaderRGBA[1] = 255;
;354:		point[i].shaderRGBA[2] = 255;
;355:		point[i].shaderRGBA[3] = 255;
;356:
;357:		AnglesToAxis( angles, point[i].axis );
;358:
;359:		// now, we need to put the correct origins into each origin from the mins and max's
;360:		switch(i)
;361:		{
;362:		case 0:
;363:			VectorCopy(s1->mins, point[i].origin);
;364:   			break;
;365:		case 1:
;366:			VectorCopy(s1->mins, point[i].origin);
;367:			point[i].origin[0] = s1->maxs[0];
;368:   			break;
;369:		case 2:
;370:			VectorCopy(s1->mins, point[i].origin);
;371:			point[i].origin[1] = s1->maxs[1];
;372:   			break;
;373:		case 3:
;374:			VectorCopy(s1->mins, point[i].origin);
;375:			point[i].origin[0] = s1->maxs[0];
;376:			point[i].origin[1] = s1->maxs[1];
;377:   			break;
;378:		case 4:
;379:			VectorCopy(s1->maxs, point[i].origin);
;380:   			break;
;381:		case 5:
;382:			VectorCopy(s1->maxs, point[i].origin);
;383:			point[i].origin[0] = s1->mins[0];
;384:   			break;
;385:		case 6:
;386:			VectorCopy(s1->maxs, point[i].origin);
;387:			point[i].origin[1] = s1->mins[1];
;388:   			break;
;389:		case 7:
;390:			VectorCopy(s1->maxs, point[i].origin);
;391:			point[i].origin[0] = s1->mins[0];
;392:			point[i].origin[1] = s1->mins[1];
;393:   			break;
;394:		}
;395:
;396:		// add the original origin to each point and then stuff them out there
;397:		VectorAdd(point[i].origin, origin, point[i].origin);
;398:
;399:		trap_R_AddRefEntityToScene (&point[i]);
;400:	}
;401:#endif
;402:	*/
;403:}
LABELV $188
endproc CG_CreateBBRefEnts 0 0
export G2_BoltToGhoul2Model
proc G2_BoltToGhoul2Model 68 36
line 407
;404:
;405:// write in the axis and stuff
;406:void G2_BoltToGhoul2Model(centity_t *cent, refEntity_t *ent)
;407:{
line 409
;408:		// extract the wraith ID from the bolt info
;409:	int modelNum = cent->boltInfo >> MODEL_SHIFT;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 10
RSHI4
ASGNI4
line 410
;410:	int boltNum	= cent->boltInfo >> BOLT_SHIFT;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ASGNI4
line 411
;411:	int	entNum = cent->boltInfo >> ENTITY_SHIFT;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 20
RSHI4
ASGNI4
line 414
;412: 	mdxaBone_t 		boltMatrix;
;413:	
;414:	modelNum &= MODEL_AND;
ADDRLP4 52
ADDRLP4 52
INDIRI4
CNSTI4 1023
BANDI4
ASGNI4
line 415
;415:	boltNum &= BOLT_AND;
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1023
BANDI4
ASGNI4
line 416
;416:	entNum &= ENTITY_AND;
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 4095
BANDI4
ASGNI4
line 420
;417:
;418:
;419:	//NOTENOTE I put this here because the cgs.gamemodels array no longer gets initialized.
;420:	assert(0);		
line 424
;421:
;422:
;423: 	// go away and get me the bolt position for this frame please
;424:	trap_G2API_GetBoltMatrix(cent->ghoul2, modelNum, boltNum, &boltMatrix, cg_entities[entNum].currentState.angles, cg_entities[entNum].currentState.origin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 64
CNSTI4 1920
ADDRLP4 48
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRGP4 cg_entities+116
ADDP4
ARGP4
ADDRLP4 64
INDIRI4
ADDRGP4 cg_entities+92
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 427
;425:
;426:	// set up the axis and origin we need for the actual effect spawning
;427: 	ent->origin[0] = boltMatrix.matrix[0][3];
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 0+12
INDIRF4
ASGNF4
line 428
;428: 	ent->origin[1] = boltMatrix.matrix[1][3];
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 0+16+12
INDIRF4
ASGNF4
line 429
;429: 	ent->origin[2] = boltMatrix.matrix[2][3];
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0+32+12
INDIRF4
ASGNF4
line 431
;430:
;431: 	ent->axis[0][0] = boltMatrix.matrix[0][0];
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 432
;432: 	ent->axis[0][1] = boltMatrix.matrix[1][0];
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0+16
INDIRF4
ASGNF4
line 433
;433: 	ent->axis[0][2] = boltMatrix.matrix[2][0];
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+32
INDIRF4
ASGNF4
line 435
;434:
;435: 	ent->axis[1][0] = boltMatrix.matrix[0][1];
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 436
;436: 	ent->axis[1][1] = boltMatrix.matrix[1][1];
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0+16+4
INDIRF4
ASGNF4
line 437
;437: 	ent->axis[1][2] = boltMatrix.matrix[2][1];
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0+32+4
INDIRF4
ASGNF4
line 439
;438:
;439: 	ent->axis[2][0] = boltMatrix.matrix[0][2];
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0+8
INDIRF4
ASGNF4
line 440
;440: 	ent->axis[2][1] = boltMatrix.matrix[1][2];
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+16+8
INDIRF4
ASGNF4
line 441
;441: 	ent->axis[2][2] = boltMatrix.matrix[2][2];
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+32+8
INDIRF4
ASGNF4
line 442
;442:}
LABELV $189
endproc G2_BoltToGhoul2Model 68 36
export ScaleModelAxis
proc ScaleModelAxis 36 0
line 446
;443:
;444:void ScaleModelAxis(refEntity_t	*ent)
;445:
;446:{		// scale the model should we need to
line 447
;447:		if (ent->modelScale[0] && ent->modelScale[0] != 1.0f)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $212
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $212
line 448
;448:		{
line 449
;449:			VectorScale( ent->axis[0], ent->modelScale[0] , ent->axis[0] );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
MULF4
ASGNF4
line 450
;450:			ent->nonNormalizedAxes = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 451
;451:		}
LABELV $212
line 452
;452:		if (ent->modelScale[1] && ent->modelScale[1] != 1.0f)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
EQF4 $214
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
EQF4 $214
line 453
;453:		{
line 454
;454:			VectorScale( ent->axis[1], ent->modelScale[1] , ent->axis[1] );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
MULF4
ASGNF4
line 455
;455:			ent->nonNormalizedAxes = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 456
;456:		}
LABELV $214
line 457
;457:		if (ent->modelScale[2] && ent->modelScale[2] != 1.0f)
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
EQF4 $216
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
EQF4 $216
line 458
;458:		{
line 459
;459:			VectorScale( ent->axis[2], ent->modelScale[2] , ent->axis[2] );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
MULF4
ASGNF4
line 460
;460:			ent->nonNormalizedAxes = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 461
;461:		}
LABELV $216
line 462
;462:}
LABELV $211
endproc ScaleModelAxis 36 0
data
export forceHolocronModels
align 4
LABELV forceHolocronModels
address $218
address $219
address $220
address $221
address $222
address $223
address $224
address $225
address $226
address $227
address $228
address $229
address $230
address $231
address $232
address $233
address $234
address $235
code
proc CG_General 472 44
line 493
;463:/*
;464:Ghoul2 Insert End
;465:*/
;466:
;467:char *forceHolocronModels[] = {
;468:	"models/map_objects/mp/lt_heal.md3",		//FP_HEAL,
;469:	"models/map_objects/mp/force_jump.md3",		//FP_LEVITATION,
;470:	"models/map_objects/mp/force_speed.md3",	//FP_SPEED,
;471:	"models/map_objects/mp/force_push.md3",		//FP_PUSH,
;472:	"models/map_objects/mp/force_pull.md3",		//FP_PULL,
;473:	"models/map_objects/mp/lt_telepathy.md3",	//FP_TELEPATHY,
;474:	"models/map_objects/mp/dk_grip.md3",		//FP_GRIP,
;475:	"models/map_objects/mp/dk_lightning.md3",	//FP_LIGHTNING,
;476:	"models/map_objects/mp/dk_rage.md3",		//FP_RAGE,
;477:	"models/map_objects/mp/lt_protect.md3",		//FP_PROTECT,
;478:	"models/map_objects/mp/lt_absorb.md3",		//FP_ABSORB,
;479:	"models/map_objects/mp/lt_healother.md3",	//FP_TEAM_HEAL,
;480:	"models/map_objects/mp/dk_powerother.md3",	//FP_TEAM_FORCE,
;481:	"models/map_objects/mp/dk_drain.md3",		//FP_DRAIN,
;482:	"models/map_objects/mp/force_sight.md3",	//FP_SEE,
;483:	"models/map_objects/mp/saber_attack.md3",	//FP_SABERATTACK,
;484:	"models/map_objects/mp/saber_defend.md3",	//FP_SABERDEFEND,
;485:	"models/map_objects/mp/saber_throw.md3"		//FP_SABERTHROW
;486:};
;487:
;488:/*
;489:==================
;490:CG_General
;491:==================
;492:*/
;493:static void CG_General( centity_t *cent ) {
line 500
;494:	refEntity_t			ent;
;495:	entityState_t		*s1;
;496:	float				val;
;497:	int					beamID;
;498:	vec3_t				beamOrg;
;499:	mdxaBone_t			matrix;
;500:	qboolean			doNotSetModel = qfalse;
ADDRLP4 232
CNSTI4 0
ASGNI4
line 502
;501:
;502:	if (cent->currentState.modelGhoul2 == 127)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 127
NEI4 $237
line 503
;503:	{ //not ready to be drawn or initialized..
line 504
;504:		return;
ADDRGP4 $236
JUMPV
LABELV $237
line 507
;505:	}
;506:
;507:	if (cent->ghoul2 && !cent->currentState.modelGhoul2 && cent->currentState.eType != ET_BODY &&
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $239
ADDRLP4 288
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
NEI4 $239
ADDRLP4 288
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
EQI4 $239
ADDRLP4 288
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $239
line 509
;508:		cent->currentState.number >= MAX_CLIENTS)
;509:	{ //this is a bad thing
line 510
;510:		if (trap_G2_HaveWeGhoul2Models(cent->ghoul2))
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $241
line 511
;511:		{
line 512
;512:			trap_G2API_CleanGhoul2Models(&(cent->ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 513
;513:		}
LABELV $241
line 514
;514:	}
LABELV $239
line 516
;515:
;516:	if (cent->currentState.modelGhoul2 >= G2_MODELPART_HEAD &&
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
ADDRLP4 292
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 10
LTI4 $243
ADDRLP4 296
INDIRI4
CNSTI4 16
GTI4 $243
ADDRLP4 292
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 32
GEI4 $243
ADDRLP4 292
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 50
NEI4 $243
line 520
;517:		cent->currentState.modelGhoul2 <= G2_MODELPART_RLEG &&
;518:		cent->currentState.modelindex < MAX_CLIENTS &&
;519:		cent->currentState.weapon == G2_MODEL_PART)
;520:	{ //special case for client limbs
line 522
;521:		centity_t *clEnt;
;522:		int dismember_settings = cg_dismember.integer;
ADDRLP4 304
ADDRGP4 cg_dismember+12
INDIRI4
ASGNI4
line 524
;523:		
;524:		doNotSetModel = qtrue;
ADDRLP4 232
CNSTI4 1
ASGNI4
line 526
;525:
;526:		if (cent->currentState.modelindex >= 0)
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
LTI4 $246
line 527
;527:		{
line 528
;528:			clEnt = &cg_entities[cent->currentState.modelindex];
ADDRLP4 300
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 529
;529:		}
ADDRGP4 $247
JUMPV
LABELV $246
line 531
;530:		else
;531:		{
line 532
;532:			clEnt = &cg_entities[cent->currentState.otherEntityNum2];
ADDRLP4 300
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 533
;533:		}
LABELV $247
line 535
;534:
;535:		if (!dismember_settings)
ADDRLP4 304
INDIRI4
CNSTI4 0
NEI4 $248
line 536
;536:		{ //This client does not wish to see dismemberment.
line 537
;537:			return;
ADDRGP4 $236
JUMPV
LABELV $248
line 540
;538:		}
;539:
;540:		if (dismember_settings < 2 && (cent->currentState.modelGhoul2 == G2_MODELPART_HEAD || cent->currentState.modelGhoul2 == G2_MODELPART_WAIST))
ADDRLP4 304
INDIRI4
CNSTI4 2
GEI4 $250
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 10
EQI4 $252
ADDRLP4 308
INDIRI4
CNSTI4 11
NEI4 $250
LABELV $252
line 541
;541:		{ //dismember settings are not high enough to display decaps and torso slashes
line 542
;542:			return;
ADDRGP4 $236
JUMPV
LABELV $250
line 545
;543:		}
;544:
;545:		if (!cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $253
line 546
;546:		{
line 557
;547:			const char *limbBone;
;548:			const char *rotateBone;
;549:			char *limbName;
;550:			char *limbCapName;
;551:			char *stubCapName;
;552:			char *limbTagName;
;553:			char *stubTagName;
;554:			int limb_anim;
;555:			int newBolt;
;556:
;557:			if (clEnt && clEnt->torsoBolt)
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $255
ADDRLP4 300
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 0
EQI4 $255
line 558
;558:			{ //already have a limb missing!
line 559
;559:				return;
ADDRGP4 $236
JUMPV
LABELV $255
line 563
;560:			}
;561:
;562:
;563:			if (clEnt && !(clEnt->currentState.eFlags & EF_DEAD))
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $257
ADDRLP4 300
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $257
line 564
;564:			{ //death flag hasn't made it through yet for the limb owner, we cannot create the limb until he's flagged as dead
line 565
;565:				return;
ADDRGP4 $236
JUMPV
LABELV $257
line 568
;566:			}
;567:
;568:			cent->bolt4 = -1;
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 -1
ASGNI4
line 569
;569:			cent->trailTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 571
;570:
;571:			if (cent->currentState.modelGhoul2 == G2_MODELPART_HEAD)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 10
NEI4 $259
line 572
;572:			{
line 573
;573:				limbBone = "cervical";
ADDRLP4 344
ADDRGP4 $261
ASGNP4
line 574
;574:				rotateBone = "cranium";
ADDRLP4 320
ADDRGP4 $262
ASGNP4
line 575
;575:				limbName = "head";
ADDRLP4 316
ADDRGP4 $263
ASGNP4
line 576
;576:				limbCapName = "head_cap_torso_off";
ADDRLP4 324
ADDRGP4 $264
ASGNP4
line 577
;577:				stubCapName = "torso_cap_head_off";
ADDRLP4 328
ADDRGP4 $265
ASGNP4
line 578
;578:				limbTagName = "*head_cap_torso";
ADDRLP4 332
ADDRGP4 $266
ASGNP4
line 579
;579:				stubTagName = "*torso_cap_head";
ADDRLP4 336
ADDRGP4 $267
ASGNP4
line 580
;580:				limb_anim = BOTH_DISMEMBER_HEAD1;
ADDRLP4 340
CNSTI4 91
ASGNI4
line 581
;581:			}
ADDRGP4 $260
JUMPV
LABELV $259
line 582
;582:			else if (cent->currentState.modelGhoul2 == G2_MODELPART_WAIST)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 11
NEI4 $268
line 583
;583:			{
line 584
;584:				limbBone = "pelvis";
ADDRLP4 344
ADDRGP4 $270
ASGNP4
line 585
;585:				rotateBone = "thoracic";
ADDRLP4 320
ADDRGP4 $271
ASGNP4
line 586
;586:				limbName = "torso";
ADDRLP4 316
ADDRGP4 $272
ASGNP4
line 587
;587:				limbCapName = "torso_cap_hips_off";
ADDRLP4 324
ADDRGP4 $273
ASGNP4
line 588
;588:				stubCapName = "hips_cap_torso_off";
ADDRLP4 328
ADDRGP4 $274
ASGNP4
line 589
;589:				limbTagName = "*torso_cap_hips";
ADDRLP4 332
ADDRGP4 $275
ASGNP4
line 590
;590:				stubTagName = "*hips_cap_torso";
ADDRLP4 336
ADDRGP4 $276
ASGNP4
line 591
;591:				limb_anim = BOTH_DISMEMBER_TORSO1;
ADDRLP4 340
CNSTI4 92
ASGNI4
line 592
;592:			}
ADDRGP4 $269
JUMPV
LABELV $268
line 593
;593:			else if (cent->currentState.modelGhoul2 == G2_MODELPART_LARM)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 12
NEI4 $277
line 594
;594:			{
line 595
;595:				limbBone = "lhumerus";
ADDRLP4 344
ADDRGP4 $279
ASGNP4
line 596
;596:				rotateBone = "lradius";
ADDRLP4 320
ADDRGP4 $280
ASGNP4
line 597
;597:				limbName = "l_arm";
ADDRLP4 316
ADDRGP4 $281
ASGNP4
line 598
;598:				limbCapName = "l_arm_cap_torso_off";
ADDRLP4 324
ADDRGP4 $282
ASGNP4
line 599
;599:				stubCapName = "torso_cap_l_arm_off";
ADDRLP4 328
ADDRGP4 $283
ASGNP4
line 600
;600:				limbTagName = "*l_arm_cap_torso";
ADDRLP4 332
ADDRGP4 $284
ASGNP4
line 601
;601:				stubTagName = "*torso_cap_l_arm";
ADDRLP4 336
ADDRGP4 $285
ASGNP4
line 602
;602:				limb_anim = BOTH_DISMEMBER_LARM;
ADDRLP4 340
CNSTI4 96
ASGNI4
line 603
;603:			}
ADDRGP4 $278
JUMPV
LABELV $277
line 604
;604:			else if (cent->currentState.modelGhoul2 == G2_MODELPART_RARM)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 13
NEI4 $286
line 605
;605:			{
line 606
;606:				limbBone = "rhumerus";
ADDRLP4 344
ADDRGP4 $288
ASGNP4
line 607
;607:				rotateBone = "rradius";
ADDRLP4 320
ADDRGP4 $289
ASGNP4
line 608
;608:				limbName = "r_arm";
ADDRLP4 316
ADDRGP4 $290
ASGNP4
line 609
;609:				limbCapName = "r_arm_cap_torso_off";
ADDRLP4 324
ADDRGP4 $291
ASGNP4
line 610
;610:				stubCapName = "torso_cap_r_arm_off";
ADDRLP4 328
ADDRGP4 $292
ASGNP4
line 611
;611:				limbTagName = "*r_arm_cap_torso";
ADDRLP4 332
ADDRGP4 $293
ASGNP4
line 612
;612:				stubTagName = "*torso_cap_r_arm";
ADDRLP4 336
ADDRGP4 $294
ASGNP4
line 613
;613:				limb_anim = BOTH_DISMEMBER_RARM;
ADDRLP4 340
CNSTI4 95
ASGNI4
line 614
;614:			}
ADDRGP4 $287
JUMPV
LABELV $286
line 615
;615:			else if (cent->currentState.modelGhoul2 == G2_MODELPART_RHAND)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 14
NEI4 $295
line 616
;616:			{
line 617
;617:				limbBone = "rradiusX";
ADDRLP4 344
ADDRGP4 $297
ASGNP4
line 618
;618:				rotateBone = "rhand";
ADDRLP4 320
ADDRGP4 $298
ASGNP4
line 619
;619:				limbName = "r_hand";
ADDRLP4 316
ADDRGP4 $299
ASGNP4
line 620
;620:				limbCapName = "r_hand_cap_r_arm_off";
ADDRLP4 324
ADDRGP4 $300
ASGNP4
line 621
;621:				stubCapName = "r_arm_cap_r_hand_off";
ADDRLP4 328
ADDRGP4 $301
ASGNP4
line 622
;622:				limbTagName = "*r_hand_cap_r_arm";
ADDRLP4 332
ADDRGP4 $302
ASGNP4
line 623
;623:				stubTagName = "*r_arm_cap_r_hand";
ADDRLP4 336
ADDRGP4 $303
ASGNP4
line 624
;624:				limb_anim = BOTH_DISMEMBER_RARM;
ADDRLP4 340
CNSTI4 95
ASGNI4
line 625
;625:			}
ADDRGP4 $296
JUMPV
LABELV $295
line 626
;626:			else if (cent->currentState.modelGhoul2 == G2_MODELPART_LLEG)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 15
NEI4 $304
line 627
;627:			{
line 628
;628:				limbBone = "lfemurYZ";
ADDRLP4 344
ADDRGP4 $306
ASGNP4
line 629
;629:				rotateBone = "ltibia";
ADDRLP4 320
ADDRGP4 $307
ASGNP4
line 630
;630:				limbName = "l_leg";
ADDRLP4 316
ADDRGP4 $308
ASGNP4
line 631
;631:				limbCapName = "l_leg_cap_hips_off";
ADDRLP4 324
ADDRGP4 $309
ASGNP4
line 632
;632:				stubCapName = "hips_cap_l_leg_off";
ADDRLP4 328
ADDRGP4 $310
ASGNP4
line 633
;633:				limbTagName = "*l_leg_cap_hips";
ADDRLP4 332
ADDRGP4 $311
ASGNP4
line 634
;634:				stubTagName = "*hips_cap_l_leg";
ADDRLP4 336
ADDRGP4 $312
ASGNP4
line 635
;635:				limb_anim = BOTH_DISMEMBER_LLEG;
ADDRLP4 340
CNSTI4 93
ASGNI4
line 636
;636:			}
ADDRGP4 $305
JUMPV
LABELV $304
line 637
;637:			else if (cent->currentState.modelGhoul2 == G2_MODELPART_RLEG)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 16
NEI4 $313
line 638
;638:			{
line 639
;639:				limbBone = "rfemurYZ";
ADDRLP4 344
ADDRGP4 $315
ASGNP4
line 640
;640:				rotateBone = "rtibia";
ADDRLP4 320
ADDRGP4 $316
ASGNP4
line 641
;641:				limbName = "r_leg";
ADDRLP4 316
ADDRGP4 $317
ASGNP4
line 642
;642:				limbCapName = "r_leg_cap_hips_off";
ADDRLP4 324
ADDRGP4 $318
ASGNP4
line 643
;643:				stubCapName = "hips_cap_r_leg_off";
ADDRLP4 328
ADDRGP4 $319
ASGNP4
line 644
;644:				limbTagName = "*r_leg_cap_hips";
ADDRLP4 332
ADDRGP4 $320
ASGNP4
line 645
;645:				stubTagName = "*hips_cap_r_leg";
ADDRLP4 336
ADDRGP4 $321
ASGNP4
line 646
;646:				limb_anim = BOTH_DISMEMBER_RLEG;
ADDRLP4 340
CNSTI4 94
ASGNI4
line 647
;647:			}
ADDRGP4 $314
JUMPV
LABELV $313
line 649
;648:			else
;649:			{
line 650
;650:				limbBone = "rfemurYZ";
ADDRLP4 344
ADDRGP4 $315
ASGNP4
line 651
;651:				rotateBone = "rtibia";
ADDRLP4 320
ADDRGP4 $316
ASGNP4
line 652
;652:				limbName = "r_leg";
ADDRLP4 316
ADDRGP4 $317
ASGNP4
line 653
;653:				limbCapName = "r_leg_cap_hips_off";
ADDRLP4 324
ADDRGP4 $318
ASGNP4
line 654
;654:				stubCapName = "hips_cap_r_leg_off";
ADDRLP4 328
ADDRGP4 $319
ASGNP4
line 655
;655:				limbTagName = "*r_leg_cap_hips";
ADDRLP4 332
ADDRGP4 $320
ASGNP4
line 656
;656:				stubTagName = "*hips_cap_r_leg";
ADDRLP4 336
ADDRGP4 $321
ASGNP4
line 657
;657:				limb_anim = BOTH_DISMEMBER_RLEG;
ADDRLP4 340
CNSTI4 94
ASGNI4
line 658
;658:			}
LABELV $314
LABELV $305
LABELV $296
LABELV $287
LABELV $278
LABELV $269
LABELV $260
line 660
;659:
;660:			if (clEnt && clEnt->ghoul2)
ADDRLP4 360
CNSTU4 0
ASGNU4
ADDRLP4 300
INDIRP4
CVPU4 4
ADDRLP4 360
INDIRU4
EQU4 $322
ADDRLP4 300
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 360
INDIRU4
EQU4 $322
line 661
;661:			{
line 662
;662:				animation_t		*anim = NULL;
ADDRLP4 364
CNSTP4 0
ASGNP4
line 664
;663:				float			animSpeed;
;664:				int				flags=BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 368
CNSTI4 72
ASGNI4
line 667
;665:				clientInfo_t	*ci;
;666:
;667:				if (clEnt->currentState.number < MAX_CLIENTS)
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $324
line 668
;668:				{
line 669
;669:					ci = &cgs.clientinfo[ clEnt->currentState.number ];
ADDRLP4 372
CNSTI4 788
ADDRLP4 300
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 670
;670:				}
ADDRGP4 $325
JUMPV
LABELV $324
line 672
;671:				else
;672:				{
line 673
;673:					ci = NULL;
ADDRLP4 372
CNSTP4 0
ASGNP4
line 674
;674:				}
LABELV $325
line 676
;675:
;676:				if (ci)
ADDRLP4 372
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $327
line 677
;677:				{
line 681
;678:					//anim = &bgGlobalAnimations[ limb_anim ];
;679:					//I guess it looks better to continue the body anim on the severed limb. If not a bit strange. It's what
;680:					//SP seems to do anyway.
;681:					anim = &bgGlobalAnimations[ (clEnt->currentState.torsoAnim&~ANIM_TOGGLEBIT) ];
ADDRLP4 364
CNSTI4 28
ADDRLP4 300
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 682
;682:				}
ADDRGP4 $328
JUMPV
LABELV $327
line 684
;683:				else
;684:				{ //a g2anim ent, maybe? For those, we can settle for generic limb anims.
line 685
;685:					anim = &bgGlobalAnimations[ limb_anim ];
ADDRLP4 364
CNSTI4 28
ADDRLP4 340
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 686
;686:				}
LABELV $328
line 688
;687:
;688:				trap_G2API_DuplicateGhoul2Instance(clEnt->ghoul2, &cent->ghoul2);
ADDRLP4 380
CNSTI4 952
ASGNI4
ADDRLP4 300
INDIRP4
ADDRLP4 380
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 380
INDIRI4
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 690
;689:
;690:				if (anim)
ADDRLP4 364
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $329
line 691
;691:				{
line 693
;692:					int aNum;
;693:					animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 376
CNSTF4 1112014848
ADDRLP4 364
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 709
;694:
;695:					/*
;696:					if (cent->currentState.modelGhoul2 == G2_MODELPART_WAIST)
;697:					{
;698:						trap_G2API_SetBoneAnim(cent->ghoul2, 0, "upper_lumbar", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 0);
;699:						trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 0);
;700:					}
;701:					else
;702:					{
;703:						trap_G2API_SetBoneAnim(cent->ghoul2, 0, "upper_lumbar", anim->firstFrame + anim->numFrames-1, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 0);
;704:						trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame + anim->numFrames-1, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 0);
;705:					}
;706:					*/
;707:					//I guess it looks better to continue the body anim on the severed limb. If not a bit strange. It's what
;708:					//SP seems to do anyway.
;709:					if (ci)
ADDRLP4 372
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $331
line 710
;710:					{
line 711
;711:						aNum = ci->frame+1;
ADDRLP4 384
ADDRLP4 372
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $334
JUMPV
LABELV $333
line 714
;712:
;713:						while (aNum >= anim->firstFrame+anim->numFrames)
;714:						{
line 715
;715:							aNum--;
ADDRLP4 384
ADDRLP4 384
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 716
;716:						}
LABELV $334
line 713
ADDRLP4 388
ADDRLP4 364
INDIRP4
ASGNP4
ADDRLP4 384
INDIRI4
ADDRLP4 388
INDIRP4
INDIRI4
ADDRLP4 388
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GEI4 $333
line 718
;717:
;718:						if (aNum < anim->firstFrame-1)
ADDRLP4 384
INDIRI4
ADDRLP4 364
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $332
line 719
;719:						{ //wrong animation...?
line 720
;720:							aNum = (anim->firstFrame+anim->numFrames)-1;
ADDRLP4 392
ADDRLP4 364
INDIRP4
ASGNP4
ADDRLP4 384
ADDRLP4 392
INDIRP4
INDIRI4
ADDRLP4 392
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 721
;721:						}
line 722
;722:					}
ADDRGP4 $332
JUMPV
LABELV $331
line 724
;723:					else
;724:					{
line 725
;725:						aNum = anim->firstFrame;
ADDRLP4 384
ADDRLP4 364
INDIRP4
INDIRI4
ASGNI4
line 726
;726:					}
LABELV $332
line 728
;727:
;728:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "upper_lumbar", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $338
ARGP4
ADDRLP4 384
INDIRI4
ARGI4
ADDRLP4 388
ADDRLP4 364
INDIRP4
ASGNP4
ADDRLP4 388
INDIRP4
INDIRI4
ADDRLP4 388
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 368
INDIRI4
ARGI4
ADDRLP4 376
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 729
;729:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $340
ARGP4
ADDRLP4 384
INDIRI4
ARGI4
ADDRLP4 392
ADDRLP4 364
INDIRP4
ASGNP4
ADDRLP4 392
INDIRP4
INDIRI4
ADDRLP4 392
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 368
INDIRI4
ARGI4
ADDRLP4 376
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 730
;730:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $342
ARGP4
ADDRLP4 384
INDIRI4
ARGI4
ADDRLP4 396
ADDRLP4 364
INDIRP4
ASGNP4
ADDRLP4 396
INDIRP4
INDIRI4
ADDRLP4 396
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 368
INDIRI4
ARGI4
ADDRLP4 376
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 731
;731:				}
LABELV $329
line 732
;732:			}
LABELV $322
line 734
;733:
;734:			if (!cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $344
line 735
;735:			{
line 736
;736:				return;
ADDRGP4 $236
JUMPV
LABELV $344
line 739
;737:			}
;738:
;739:			newBolt = trap_G2API_AddBolt( cent->ghoul2, 0, limbTagName );
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 364
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 312
ADDRLP4 364
INDIRI4
ASGNI4
line 740
;740:			if ( newBolt != -1 )
ADDRLP4 312
INDIRI4
CNSTI4 -1
EQI4 $346
line 741
;741:			{
line 744
;742:				vec3_t boltOrg, boltAng;
;743:
;744:				trap_G2API_GetBoltMatrix(cent->ghoul2, 0, newBolt, &matrix, cent->lerpAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 392
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 392
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 312
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 392
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRLP4 392
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 392
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 746
;745:
;746:				trap_G2API_GiveMeVectorFromMatrix(&matrix, ORIGIN, boltOrg);
ADDRLP4 240
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 368
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 747
;747:				trap_G2API_GiveMeVectorFromMatrix(&matrix, NEGATIVE_Y, boltAng);
ADDRLP4 240
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 380
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 749
;748:
;749:				trap_FX_PlayEffectID(trap_FX_RegisterEffect("blaster/smoke_bolton"), boltOrg, boltAng);
ADDRGP4 $350
ARGP4
ADDRLP4 396
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
ARGI4
ADDRLP4 368
ARGP4
ADDRLP4 380
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 750
;750:			}
LABELV $346
line 752
;751:
;752:			cent->bolt4 = newBolt;
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 312
INDIRI4
ASGNI4
line 754
;753:
;754:			trap_G2API_SetRootSurface(cent->ghoul2, 0, limbName);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 316
INDIRP4
ARGP4
ADDRGP4 trap_G2API_SetRootSurface
CALLI4
pop
line 756
;755:
;756:			trap_G2API_SetNewOrigin(cent->ghoul2, trap_G2API_AddBolt(cent->ghoul2, 0, rotateBone));
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 320
INDIRP4
ARGP4
ADDRLP4 368
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 368
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetNewOrigin
CALLI4
pop
line 758
;757:
;758:			trap_G2API_SetSurfaceOnOff(cent->ghoul2, limbCapName, 0);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 324
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 760
;759:
;760:			trap_G2API_SetSurfaceOnOff(clEnt->ghoul2, limbName, 0x00000100);
ADDRLP4 300
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 316
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 761
;761:			trap_G2API_SetSurfaceOnOff(clEnt->ghoul2, stubCapName, 0);
ADDRLP4 300
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 328
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 763
;762:
;763:			newBolt = trap_G2API_AddBolt( clEnt->ghoul2, 0, stubTagName );
ADDRLP4 300
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 336
INDIRP4
ARGP4
ADDRLP4 372
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 312
ADDRLP4 372
INDIRI4
ASGNI4
line 764
;764:			if ( newBolt != -1 )
ADDRLP4 312
INDIRI4
CNSTI4 -1
EQI4 $351
line 765
;765:			{
line 768
;766:				vec3_t boltOrg, boltAng;
;767:
;768:				trap_G2API_GetBoltMatrix(clEnt->ghoul2, 0, newBolt, &matrix, clEnt->lerpAngles, clEnt->lerpOrigin, cg.time, cgs.gameModels, clEnt->modelScale);
ADDRLP4 300
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 312
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 300
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRLP4 300
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 300
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 770
;769:
;770:				trap_G2API_GiveMeVectorFromMatrix(&matrix, ORIGIN, boltOrg);
ADDRLP4 240
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 376
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 771
;771:				trap_G2API_GiveMeVectorFromMatrix(&matrix, NEGATIVE_Y, boltAng);
ADDRLP4 240
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 388
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 773
;772:
;773:				trap_FX_PlayEffectID(trap_FX_RegisterEffect("blaster/smoke_bolton"), boltOrg, boltAng);
ADDRGP4 $350
ARGP4
ADDRLP4 404
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 404
INDIRI4
ARGI4
ADDRLP4 376
ARGP4
ADDRLP4 388
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 774
;774:			}
LABELV $351
line 776
;775:
;776:			if (cent->currentState.modelGhoul2 == G2_MODELPART_RARM || cent->currentState.modelGhoul2 == G2_MODELPART_RHAND || cent->currentState.modelGhoul2 == G2_MODELPART_WAIST)
ADDRLP4 376
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 13
EQI4 $358
ADDRLP4 376
INDIRI4
CNSTI4 14
EQI4 $358
ADDRLP4 376
INDIRI4
CNSTI4 11
NEI4 $355
LABELV $358
line 777
;777:			{ //Cut his weapon holding arm off, so remove the weapon
line 778
;778:				if (trap_G2API_HasGhoul2ModelOnIndex(&(clEnt->ghoul2), 1))
ADDRLP4 300
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 380
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
EQI4 $359
line 779
;779:				{
line 780
;780:					trap_G2API_RemoveGhoul2Model(&(clEnt->ghoul2), 1);
ADDRLP4 300
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 781
;781:				}
LABELV $359
line 782
;782:			}
LABELV $355
line 784
;783:
;784:			clEnt->torsoBolt = cent->currentState.modelGhoul2; //reinit model after copying limbless one to queue
ADDRLP4 300
INDIRP4
CNSTI4 1012
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 786
;785:
;786:			return;
ADDRGP4 $236
JUMPV
LABELV $253
line 789
;787:		}
;788:
;789:		if (cent->ghoul2 && cent->bolt4 != -1 && cent->trailTime < cg.time)
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $361
ADDRLP4 312
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $361
ADDRLP4 312
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
GEI4 $361
line 790
;790:		{
line 791
;791:			if ( cent->bolt4 != -1 && 
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $364
ADDRLP4 320
CNSTF4 0
ASGNF4
ADDRLP4 316
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 320
INDIRF4
NEF4 $367
ADDRLP4 316
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 320
INDIRF4
NEF4 $367
ADDRLP4 316
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 320
INDIRF4
EQF4 $364
LABELV $367
line 793
;792:				(cent->currentState.pos.trDelta[0] || cent->currentState.pos.trDelta[1] || cent->currentState.pos.trDelta[2]) )
;793:			{
line 796
;794:				vec3_t boltOrg, boltAng;
;795:
;796:				trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cent->bolt4, &matrix, cent->lerpAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 348
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 798
;797:
;798:				trap_G2API_GiveMeVectorFromMatrix(&matrix, ORIGIN, boltOrg);
ADDRLP4 240
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 336
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 799
;799:				trap_G2API_GiveMeVectorFromMatrix(&matrix, NEGATIVE_Y, boltAng);
ADDRLP4 240
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 324
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 801
;800:
;801:				if (!boltAng[0] && !boltAng[1] && !boltAng[2])
ADDRLP4 352
CNSTF4 0
ASGNF4
ADDRLP4 324
INDIRF4
ADDRLP4 352
INDIRF4
NEF4 $370
ADDRLP4 324+4
INDIRF4
ADDRLP4 352
INDIRF4
NEF4 $370
ADDRLP4 324+8
INDIRF4
ADDRLP4 352
INDIRF4
NEF4 $370
line 802
;802:				{
line 803
;803:					boltAng[1] = 1;
ADDRLP4 324+4
CNSTF4 1065353216
ASGNF4
line 804
;804:				}
LABELV $370
line 805
;805:				trap_FX_PlayEffectID(trap_FX_RegisterEffect("blaster/smoke_bolton"), boltOrg, boltAng);
ADDRGP4 $350
ARGP4
ADDRLP4 356
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
ARGI4
ADDRLP4 336
ARGP4
ADDRLP4 324
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 807
;806:
;807:				cent->trailTime = cg.time + 400;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 808
;808:			}
LABELV $364
line 809
;809:		}
LABELV $361
line 811
;810:
;811:		ent.radius = cent->currentState.g2radius;
ADDRLP4 0+92
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 812
;812:		ent.hModel = 0;
ADDRLP4 0+8
CNSTI4 0
ASGNI4
line 813
;813:	}
LABELV $243
line 815
;814:
;815:	if (cent->currentState.number >= MAX_CLIENTS &&
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $378
ADDRLP4 300
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 19
NEI4 $378
line 817
;816:		cent->currentState.activeForcePass == NUM_FORCE_POWERS+1)
;817:	{
line 822
;818:		centity_t			*empOwn;
;819:		vec3_t				empAngles, empOrg, anglesToOwner;
;820:		float				angle_ideal, angle_current, angle_dif;
;821:		float				degrees_positive, degrees_negative;
;822:		int					overturn = 0;
ADDRLP4 340
CNSTI4 0
ASGNI4
line 824
;823:
;824:		empOwn = &cg_entities[cent->currentState.emplacedOwner];
ADDRLP4 316
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 826
;825:
;826:		if (empOwn)
ADDRLP4 316
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $380
line 827
;827:		{
line 829
;828:		
;829:			if (cg.snap->ps.clientNum == empOwn->currentState.number &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 316
INDIRP4
INDIRI4
NEI4 $382
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $382
line 831
;830:				!cg.renderingThirdPerson)
;831:			{
line 832
;832:				VectorCopy(cg.refdefViewAngles, empAngles);
ADDRLP4 304
ADDRGP4 cg+3984
INDIRB
ASGNB 12
line 833
;833:				VectorCopy(cg.refdef.vieworg, empOrg);
ADDRLP4 344
ADDRGP4 cg+3616+24
INDIRB
ASGNB 12
line 834
;834:			}
ADDRGP4 $383
JUMPV
LABELV $382
line 836
;835:			else
;836:			{
line 837
;837:				VectorCopy(empOwn->lerpAngles, empAngles);
ADDRLP4 304
ADDRLP4 316
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 838
;838:				VectorCopy(empOwn->lerpOrigin, empOrg);
ADDRLP4 344
ADDRLP4 316
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 839
;839:			}
LABELV $383
line 841
;840:
;841:			VectorSubtract(cent->lerpOrigin, empOrg, anglesToOwner);
ADDRLP4 368
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
ADDRLP4 368
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 344
INDIRF4
SUBF4
ASGNF4
ADDRLP4 320+4
ADDRLP4 368
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 344+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 320+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 344+8
INDIRF4
SUBF4
ASGNF4
line 843
;842:
;843:			vectoangles(anglesToOwner, anglesToOwner);
ADDRLP4 320
ARGP4
ADDRLP4 320
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 845
;844:
;845:			if (empAngles[PITCH] > 40)
ADDRLP4 304
INDIRF4
CNSTF4 1109393408
LEF4 $393
line 846
;846:			{
line 847
;847:				empAngles[PITCH] = 40;
ADDRLP4 304
CNSTF4 1109393408
ASGNF4
line 848
;848:			}
LABELV $393
line 850
;849:
;850:			angle_ideal = empAngles[YAW];
ADDRLP4 332
ADDRLP4 304+4
INDIRF4
ASGNF4
line 851
;851:			angle_current = anglesToOwner[YAW];
ADDRLP4 336
ADDRLP4 320+4
INDIRF4
ASGNF4
line 853
;852:
;853:			if (angle_current < 0)
ADDRLP4 336
INDIRF4
CNSTF4 0
GEF4 $397
line 854
;854:			{
line 855
;855:				angle_current += 360;
ADDRLP4 336
ADDRLP4 336
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 856
;856:			}
LABELV $397
line 857
;857:			if (angle_current > 360)
ADDRLP4 336
INDIRF4
CNSTF4 1135869952
LEF4 $399
line 858
;858:			{
line 859
;859:				angle_current -= 360;
ADDRLP4 336
ADDRLP4 336
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 860
;860:			}
LABELV $399
line 861
;861:			if (angle_ideal < 0)
ADDRLP4 332
INDIRF4
CNSTF4 0
GEF4 $401
line 862
;862:			{
line 863
;863:				angle_ideal += 360;
ADDRLP4 332
ADDRLP4 332
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 864
;864:			}
LABELV $401
line 865
;865:			if (angle_ideal > 360)
ADDRLP4 332
INDIRF4
CNSTF4 1135869952
LEF4 $403
line 866
;866:			{
line 867
;867:				angle_ideal -= 360;
ADDRLP4 332
ADDRLP4 332
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 868
;868:			}
LABELV $403
line 870
;869:
;870:			if (angle_ideal <= angle_current)
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
GTF4 $405
line 871
;871:			{
line 872
;872:				degrees_negative = (angle_current - angle_ideal);
ADDRLP4 360
ADDRLP4 336
INDIRF4
ADDRLP4 332
INDIRF4
SUBF4
ASGNF4
line 874
;873:
;874:				degrees_positive = (360 - angle_current) + angle_ideal;
ADDRLP4 364
CNSTF4 1135869952
ADDRLP4 336
INDIRF4
SUBF4
ADDRLP4 332
INDIRF4
ADDF4
ASGNF4
line 875
;875:			}
ADDRGP4 $406
JUMPV
LABELV $405
line 877
;876:			else
;877:			{
line 878
;878:				degrees_negative = angle_current + (360 - angle_ideal);
ADDRLP4 360
ADDRLP4 336
INDIRF4
CNSTF4 1135869952
ADDRLP4 332
INDIRF4
SUBF4
ADDF4
ASGNF4
line 880
;879:
;880:				degrees_positive = (angle_ideal - angle_current);
ADDRLP4 364
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
SUBF4
ASGNF4
line 881
;881:			}
LABELV $406
line 883
;882:
;883:			if (degrees_negative < degrees_positive)
ADDRLP4 360
INDIRF4
ADDRLP4 364
INDIRF4
GEF4 $407
line 884
;884:			{
line 885
;885:				angle_dif = degrees_negative;
ADDRLP4 356
ADDRLP4 360
INDIRF4
ASGNF4
line 886
;886:			}
ADDRGP4 $408
JUMPV
LABELV $407
line 888
;887:			else
;888:			{
line 889
;889:				angle_dif = degrees_positive;
ADDRLP4 356
ADDRLP4 364
INDIRF4
ASGNF4
line 890
;890:			}
LABELV $408
line 892
;891:
;892:			if (cg.snap->ps.clientNum == empOwn->currentState.number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 316
INDIRP4
INDIRI4
NEI4 $409
line 893
;893:			{
line 894
;894:				cg.constrictValue = anglesToOwner[YAW];
ADDRGP4 cg+3996
ADDRLP4 320+4
INDIRF4
ASGNF4
line 896
;895:
;896:				cg.doConstrict = cg.time + 50;
ADDRGP4 cg+4004
ADDRGP4 cg+64
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 897
;897:			}
LABELV $409
line 899
;898:
;899:			if (angle_dif > 90)
ADDRLP4 356
INDIRF4
CNSTF4 1119092736
LEF4 $416
line 900
;900:			{
line 901
;901:				overturn = 1;
ADDRLP4 340
CNSTI4 1
ASGNI4
line 903
;902:
;903:				if (angle_dif == degrees_negative)
ADDRLP4 356
INDIRF4
ADDRLP4 360
INDIRF4
NEF4 $418
line 904
;904:				{
line 905
;905:					empAngles[YAW] += (angle_dif - 90);
ADDRLP4 304+4
ADDRLP4 304+4
INDIRF4
ADDRLP4 356
INDIRF4
CNSTF4 1119092736
SUBF4
ADDF4
ASGNF4
line 906
;906:				}
ADDRGP4 $417
JUMPV
LABELV $418
line 908
;907:				else
;908:				{
line 909
;909:					empAngles[YAW] -= (angle_dif - 90);
ADDRLP4 304+4
ADDRLP4 304+4
INDIRF4
ADDRLP4 356
INDIRF4
CNSTF4 1119092736
SUBF4
SUBF4
ASGNF4
line 910
;910:				}
line 911
;911:			}
ADDRGP4 $417
JUMPV
LABELV $416
line 912
;912:			else if (angle_dif > 80)
ADDRLP4 356
INDIRF4
CNSTF4 1117782016
LEF4 $422
line 913
;913:			{
line 914
;914:				overturn = 2;
ADDRLP4 340
CNSTI4 2
ASGNI4
line 915
;915:			}
LABELV $422
LABELV $417
line 917
;916:
;917:			if (!overturn && cg.snap->ps.clientNum == empOwn->currentState.number)
ADDRLP4 340
INDIRI4
CNSTI4 0
NEI4 $424
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 316
INDIRP4
INDIRI4
NEI4 $424
line 918
;918:			{
line 919
;919:				float plusExt = anglesToOwner[YAW]+70;
ADDRLP4 372
ADDRLP4 320+4
INDIRF4
CNSTF4 1116471296
ADDF4
ASGNF4
line 920
;920:				float minusExt = anglesToOwner[YAW]-70;
ADDRLP4 376
ADDRLP4 320+4
INDIRF4
CNSTF4 1116471296
SUBF4
ASGNF4
line 922
;921:
;922:				if (plusExt > 360)
ADDRLP4 372
INDIRF4
CNSTF4 1135869952
LEF4 $429
line 923
;923:				{
line 924
;924:					plusExt -= 360;
ADDRLP4 372
ADDRLP4 372
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 925
;925:				}
LABELV $429
line 926
;926:				if (minusExt < 0)
ADDRLP4 376
INDIRF4
CNSTF4 0
GEF4 $431
line 927
;927:				{
line 928
;928:					minusExt += 360;
ADDRLP4 376
ADDRLP4 376
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 929
;929:				}
LABELV $431
line 931
;930:
;931:				trap_SetClientTurnExtent(minusExt, plusExt, cg.time+5000);
ADDRLP4 376
INDIRF4
ARGF4
ADDRLP4 372
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
CNSTI4 5000
ADDI4
ARGI4
ADDRGP4 trap_SetClientTurnExtent
CALLV
pop
line 933
;932:
;933:				VectorCopy(empAngles, cent->turAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ADDRLP4 304
INDIRB
ASGNB 12
line 934
;934:			}
ADDRGP4 $425
JUMPV
LABELV $424
line 935
;935:			else if (cg.snap->ps.clientNum == empOwn->currentState.number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 316
INDIRP4
INDIRI4
NEI4 $434
line 936
;936:			{
line 937
;937:				trap_SetClientForceAngle(cg.time+5000, cent->turAngles);
ADDRGP4 cg+64
INDIRI4
CNSTI4 5000
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRGP4 trap_SetClientForceAngle
CALLV
pop
line 938
;938:			}
LABELV $434
LABELV $425
line 942
;939:
;940:		//	empAngles[PITCH] -= 160;
;941:
;942:			if (empAngles[PITCH] < 0)
ADDRLP4 304
INDIRF4
CNSTF4 0
GEF4 $438
line 943
;943:			{
line 944
;944:				empAngles[PITCH] += 360;
ADDRLP4 304
ADDRLP4 304
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 945
;945:			}
LABELV $438
line 946
;946:			if (empAngles[YAW] < 0)
ADDRLP4 304+4
INDIRF4
CNSTF4 0
GEF4 $440
line 947
;947:			{
line 948
;948:				empAngles[YAW] += 360;
ADDRLP4 304+4
ADDRLP4 304+4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 949
;949:			}
LABELV $440
line 951
;950:
;951:			empAngles[YAW] -= cent->currentState.angles[YAW]; //slight hack so that upper rotated half looks right on angled turrets
ADDRLP4 304+4
ADDRLP4 304+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
SUBF4
ASGNF4
line 973
;952:
;953:			//AngleVectors(empAngles, NULL, NULL, up);
;954:
;955:			//empAngles[ROLL] = -empAngles[YAW];
;956:			//empAngles[YAW] = 0;
;957:
;958:			//trap_G2API_SetBoneAngles(cent->ghoul2, 0, "swivel_bone", empAngles, BONE_ANGLES_REPLACE, POSITIVE_Z, NEGATIVE_X, NEGATIVE_Y, NULL, 0, cg.time);
;959:			//trap_G2API_SetBoneAngles(cent->ghoul2, 0, "swivel_bone", empAngles, BONE_ANGLES_REPLACE, POSITIVE_Z, POSITIVE_X, POSITIVE_Y, NULL, 0, cg.time);
;960:
;961:			//constrict the pitch angles of the turret but not the player view
;962:			/*
;963:			if (empAngles[PITCH] < 170)
;964:			{
;965:				empAngles[PITCH] = 170;
;966:			}
;967:			if (empAngles[PITCH] > 240)
;968:			{
;969:				empAngles[PITCH] = 240;
;970:			}
;971:			*/
;972:
;973:			trap_G2API_SetBoneAngles( cent->ghoul2, 0, /*"swivel_bone"*/"Bone02", empAngles, BONE_ANGLES_REPLACE, NEGATIVE_Y, NEGATIVE_X, POSITIVE_Z, NULL, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 372
CNSTI4 0
ASGNI4
ADDRLP4 372
INDIRI4
ARGI4
ADDRGP4 $445
ARGP4
ADDRLP4 304
ARGP4
ADDRLP4 376
CNSTI4 4
ASGNI4
ADDRLP4 376
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 376
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 372
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 975
;974:			//trap_G2API_SetBoneAngles( cent->ghoul2, 0, "swivel_bone", empAngles, BONE_ANGLES_POSTMULT, POSITIVE_Y, POSITIVE_Z, POSITIVE_X, NULL, 0, cg.time); 
;975:		}
LABELV $380
line 976
;976:	}
LABELV $378
line 978
;977:
;978:	s1 = &cent->currentState;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
line 983
;979:/*
;980:Ghoul2 Insert Start
;981:*/
;982:	// if set to invisible, skip
;983:	if ((!s1->modelindex) && !(trap_G2_HaveWeGhoul2Models(cent->ghoul2))) 
ADDRLP4 212
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $447
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 304
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
NEI4 $447
line 984
;984:	{
line 985
;985:		return;
ADDRGP4 $236
JUMPV
LABELV $447
line 991
;986:	}
;987:/*
;988:Ghoul2 Insert End
;989:*/
;990:
;991:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 995
;992:
;993:	// set frame
;994:
;995:	ent.frame = s1->frame;
ADDRLP4 0+104
ADDRLP4 212
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ASGNI4
line 996
;996:	ent.oldframe = ent.frame;
ADDRLP4 0+124
ADDRLP4 0+104
INDIRI4
ASGNI4
line 997
;997:	ent.backlerp = 0;
ADDRLP4 0+128
CNSTF4 0
ASGNF4
line 1002
;998:
;999:/*
;1000:Ghoul2 Insert Start
;1001:*/
;1002:	CG_SetGhoul2Info(&ent, cent);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetGhoul2Info
CALLV
pop
line 1007
;1003:
;1004:/*
;1005:Ghoul2 Insert End
;1006:*/
;1007:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 1008
;1008:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+64
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 1010
;1009:
;1010:	if (cent->currentState.modelGhoul2)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $455
line 1011
;1011:	{ //If the game says this guy uses a ghoul2 model and the g2 instance handle is null, then initialize it
line 1012
;1012:		if (!cent->ghoul2 && !cent->currentState.bolt1)
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $457
ADDRLP4 308
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 0
NEI4 $457
line 1013
;1013:		{
line 1014
;1014:			trap_G2API_InitGhoul2Model(&cent->ghoul2, CG_ConfigString( CS_MODELS+cent->currentState.modelindex ), 0, 0, 0, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 312
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 316
CNSTI4 0
ASGNI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 1015
;1015:		}
ADDRGP4 $458
JUMPV
LABELV $457
line 1016
;1016:		else if (cent->currentState.bolt1)
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 0
EQI4 $459
line 1017
;1017:		{
line 1018
;1018:			TurretClientRun(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TurretClientRun
CALLV
pop
line 1019
;1019:		}
LABELV $459
LABELV $458
line 1021
;1020:
;1021:		if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $461
line 1022
;1022:		{ //give us a proper radius
line 1023
;1023:			ent.radius = cent->currentState.g2radius;
ADDRLP4 0+92
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1024
;1024:		}
LABELV $461
line 1025
;1025:	}
LABELV $455
line 1027
;1026:
;1027:	if (s1->eType == ET_BODY)
ADDRLP4 212
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
NEI4 $464
line 1028
;1028:	{ //bodies should have a radius as well
line 1029
;1029:		ent.radius = cent->currentState.g2radius;
ADDRLP4 0+92
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1031
;1030:
;1031:		if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $467
line 1032
;1032:		{ //all bodies should already have a ghoul2 instance. Use it to set the torso/head angles to 0.
line 1033
;1033:			if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $469
line 1034
;1034:			{
line 1035
;1035:				trap_G2API_SetBoneAngles(cent->ghoul2, 0, "pelvis", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 100, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $270
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1036
;1036:				ent.radius = 250;
ADDRLP4 0+92
CNSTF4 1132068864
ASGNF4
line 1037
;1037:			}
ADDRGP4 $470
JUMPV
LABELV $469
line 1039
;1038:			else
;1039:			{
line 1040
;1040:				cent->lerpAngles[PITCH] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
CNSTF4 0
ASGNF4
line 1041
;1041:				cent->lerpAngles[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
CNSTF4 0
ASGNF4
line 1042
;1042:				trap_G2API_SetBoneAngles(cent->ghoul2, 0, "pelvis", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 308
CNSTI4 0
ASGNI4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 $270
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1043
;1043:				trap_G2API_SetBoneAngles(cent->ghoul2, 0, "thoracic", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 312
CNSTI4 0
ASGNI4
ADDRLP4 312
INDIRI4
ARGI4
ADDRGP4 $271
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 312
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1044
;1044:				trap_G2API_SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 100, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $338
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1045
;1045:				trap_G2API_SetBoneAngles(cent->ghoul2, 0, "lower_lumbar", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 100, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $480
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1046
;1046:				trap_G2API_SetBoneAngles(cent->ghoul2, 0, "cranium", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, cgs.gameModels, 100, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $262
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 316
CNSTI4 2
ASGNI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 316
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+36364
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1047
;1047:			}
LABELV $470
line 1048
;1048:		}
LABELV $467
line 1049
;1049:	}
LABELV $464
line 1051
;1050:
;1051:	if (s1->eType == ET_HOLOCRON && s1->modelindex < -100)
ADDRLP4 212
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $485
ADDRLP4 212
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -100
GEI4 $485
line 1052
;1052:	{ //special render, it's a holocron
line 1054
;1053:		//Using actual models now:
;1054:		ent.hModel = trap_R_RegisterModel(forceHolocronModels[s1->modelindex+128]);
ADDRLP4 212
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceHolocronModels+512
ADDP4
INDIRP4
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 312
INDIRI4
ASGNI4
line 1057
;1055:
;1056:		//Rotate them
;1057:		VectorCopy( cg.autoAngles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ADDRGP4 cg+3520
INDIRB
ASGNB 12
line 1058
;1058:		AxisCopy( cg.autoAxis, ent.axis );
ADDRGP4 cg+3532
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 1059
;1059:	}
ADDRGP4 $486
JUMPV
LABELV $485
line 1060
;1060:	else if (!doNotSetModel)
ADDRLP4 232
INDIRI4
CNSTI4 0
NEI4 $492
line 1061
;1061:	{
line 1062
;1062:		ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 212
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36364
ADDP4
INDIRI4
ASGNI4
line 1063
;1063:	}
LABELV $492
LABELV $486
line 1066
;1064:
;1065:	// player model
;1066:	if (s1->number == cg.snap->ps.clientNum) {
ADDRLP4 212
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $496
line 1067
;1067:		ent.renderfx |= RF_THIRD_PERSON;	// only draw from mirrors
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1068
;1068:	}
LABELV $496
line 1079
;1069:/*
;1070:Ghoul2 Insert Start
;1071:*/
;1072:	// are we bolted to a Ghoul2 model?
;1073:/* 
;1074://g2r	if (s1->boltInfo)
;1075:	{
;1076:		G2_BoltToGhoul2Model(s1, &ent);
;1077:	}
;1078:	else */
;1079:	{
line 1081
;1080:		// convert angles to axis
;1081:		AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1082
;1082:	}
line 1087
;1083:
;1084:/*
;1085:Ghoul2 Insert End
;1086:*/
;1087:	if ( cent->currentState.time > cg.time && cent->currentState.weapon == WP_EMPLACED_GUN )
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $501
ADDRLP4 312
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 14
NEI4 $501
line 1088
;1088:	{
line 1090
;1089:		// make the gun pulse red to warn about it exploding
;1090:		val = (1.0f - (float)(cent->currentState.time - cg.time) / 3200.0f ) * 0.3f;
ADDRLP4 236
CNSTF4 1050253722
CNSTF4 1065353216
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1162346496
DIVF4
SUBF4
MULF4
ASGNF4
line 1092
;1091:
;1092:		ent.customShader = trap_R_RegisterShader( "gfx/effects/turretflashdie" );
ADDRGP4 $506
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+76
ADDRLP4 316
INDIRI4
ASGNI4
line 1093
;1093:		ent.shaderRGBA[0] = (sin( cg.time * 0.04f ) * val * 0.4f + val) * 255;
CNSTF4 1025758986
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 324
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 328
ADDRLP4 236
INDIRF4
ASGNF4
ADDRLP4 332
CNSTF4 1132396544
CNSTF4 1053609165
ADDRLP4 324
INDIRF4
ADDRLP4 328
INDIRF4
MULF4
MULF4
ADDRLP4 328
INDIRF4
ADDF4
MULF4
ASGNF4
ADDRLP4 336
CNSTF4 1325400064
ASGNF4
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
LTF4 $510
ADDRLP4 320
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $511
JUMPV
LABELV $510
ADDRLP4 320
ADDRLP4 332
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $511
ADDRLP4 0+80
ADDRLP4 320
INDIRU4
CVUU1 4
ASGNU1
line 1094
;1094:		ent.shaderRGBA[1] = ent.shaderRGBA[2] = 0;
ADDRLP4 340
CNSTU1 0
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 340
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 340
INDIRU1
ASGNU1
line 1096
;1095:
;1096:		ent.shaderRGBA[3] = 100;
ADDRLP4 0+80+3
CNSTU1 100
ASGNU1
line 1097
;1097:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1098
;1098:		ent.customShader = 0;
ADDRLP4 0+76
CNSTI4 0
ASGNI4
line 1099
;1099:	}
ADDRGP4 $502
JUMPV
LABELV $501
line 1100
;1100:	else if ( cent->currentState.time == -1 && cent->currentState.weapon == WP_EMPLACED_GUN)
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $519
ADDRLP4 316
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 14
NEI4 $519
line 1101
;1101:	{
line 1102
;1102:		ent.customShader = trap_R_RegisterShader( "models/map_objects/imp_mine/turret_chair_dmg.tga" );
ADDRGP4 $522
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+76
ADDRLP4 320
INDIRI4
ASGNI4
line 1104
;1103:		//trap_R_AddRefEntityToScene( &ent );
;1104:	}
LABELV $519
LABELV $502
line 1106
;1105:
;1106:	if ((cent->currentState.eFlags & EF_DISINTEGRATION) && cent->currentState.eType == ET_BODY)
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $523
ADDRLP4 320
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
NEI4 $523
line 1107
;1107:	{
line 1111
;1108:		vec3_t tempAng, hitLoc;
;1109:		float tempLength;
;1110:
;1111:		if (!cent->dustTrailTime)
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
NEI4 $525
line 1112
;1112:		{
line 1113
;1113:			cent->dustTrailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1114
;1114:		}
LABELV $525
line 1116
;1115:
;1116:		VectorCopy(cent->currentState.origin2, hitLoc);
ADDRLP4 324
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1118
;1117:
;1118:		VectorSubtract( hitLoc, ent.origin, ent.oldorigin );
ADDRLP4 0+64
ADDRLP4 324
INDIRF4
ADDRLP4 0+52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+64+4
ADDRLP4 324+4
INDIRF4
ADDRLP4 0+52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+64+8
ADDRLP4 324+8
INDIRF4
ADDRLP4 0+52+8
INDIRF4
SUBF4
ASGNF4
line 1120
;1119:		
;1120:		tempLength = VectorNormalize( ent.oldorigin );
ADDRLP4 0+64
ARGP4
ADDRLP4 352
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 336
ADDRLP4 352
INDIRF4
ASGNF4
line 1121
;1121:		vectoangles( ent.oldorigin, tempAng );
ADDRLP4 0+64
ARGP4
ADDRLP4 340
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1122
;1122:		tempAng[YAW] -= cent->lerpAngles[YAW];
ADDRLP4 340+4
ADDRLP4 340+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1123
;1123:		AngleVectors( tempAng, ent.oldorigin, NULL, NULL );
ADDRLP4 340
ARGP4
ADDRLP4 0+64
ARGP4
ADDRLP4 356
CNSTP4 0
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1124
;1124:		VectorScale( ent.oldorigin, tempLength, ent.oldorigin );
ADDRLP4 0+64
ADDRLP4 0+64
INDIRF4
ADDRLP4 336
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+64+4
ADDRLP4 0+64+4
INDIRF4
ADDRLP4 336
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+64+8
ADDRLP4 0+64+8
INDIRF4
ADDRLP4 336
INDIRF4
MULF4
ASGNF4
line 1126
;1125:
;1126:		ent.endTime = cent->dustTrailTime;
ADDRLP4 0+176
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1135
;1127:
;1128:		/*
;1129:		ent.renderfx |= RF_DISINTEGRATE2;
;1130:
;1131:		ent.customShader = cgs.media.disruptorShader;
;1132:		trap_R_AddRefEntityToScene( &ent );
;1133:		*/
;1134:
;1135:		ent.renderfx &= ~(RF_DISINTEGRATE2);
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -262145
BANDI4
ASGNI4
line 1136
;1136:		ent.renderfx |= (RF_DISINTEGRATE1);
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 1137
;1137:		ent.customShader = 0;
ADDRLP4 0+76
CNSTI4 0
ASGNI4
line 1138
;1138:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1140
;1139:
;1140:		return;
ADDRGP4 $236
JUMPV
LABELV $523
line 1142
;1141:	}
;1142:	else if (cent->currentState.eType == ET_BODY)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
NEI4 $558
line 1143
;1143:	{
line 1144
;1144:		cent->dustTrailTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1145
;1145:	}
LABELV $558
line 1147
;1146:
;1147:	if (cent->currentState.modelGhoul2 &&
ADDRLP4 324
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ADDRLP4 324
INDIRI4
EQI4 $560
ADDRLP4 0+208
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $560
ADDRLP4 0+8
INDIRI4
ADDRLP4 324
INDIRI4
NEI4 $560
line 1150
;1148:		!ent.ghoul2 &&
;1149:		!ent.hModel)
;1150:	{
line 1151
;1151:		return;
ADDRGP4 $236
JUMPV
LABELV $560
line 1155
;1152:	}
;1153:
;1154:	// add to refresh list
;1155:	trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1157
;1156:
;1157:	if (cent->bolt3 == 999)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 999
NEI4 $564
line 1158
;1158:	{ //this is an in-flight saber being rendered manually
line 1166
;1159:		vec3_t org;
;1160:		float wv;
;1161:		int i;
;1162:		addspriteArgStruct_t fxSArgs;
;1163:		//refEntity_t sRef;
;1164:		//memcpy( &sRef, &ent, sizeof( sRef ) );
;1165:
;1166:		ent.customShader = cgs.media.solidWhite;
ADDRLP4 0+76
ADDRGP4 cgs+70296+564
INDIRI4
ASGNI4
line 1167
;1167:		ent.renderfx = RF_RGB_TINT;
ADDRLP4 0+4
CNSTI4 2048
ASGNI4
line 1168
;1168:		wv = sin( cg.time * 0.003f ) * 0.08f + 0.1f;
CNSTF4 994352038
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 420
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 416
CNSTF4 1034147594
ADDRLP4 420
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1169
;1169:		ent.shaderRGBA[0] = wv * 255;
ADDRLP4 428
CNSTF4 1132396544
ADDRLP4 416
INDIRF4
MULF4
ASGNF4
ADDRLP4 432
CNSTF4 1325400064
ASGNF4
ADDRLP4 428
INDIRF4
ADDRLP4 432
INDIRF4
LTF4 $573
ADDRLP4 424
ADDRLP4 428
INDIRF4
ADDRLP4 432
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $574
JUMPV
LABELV $573
ADDRLP4 424
ADDRLP4 428
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $574
ADDRLP4 0+80
ADDRLP4 424
INDIRU4
CVUU1 4
ASGNU1
line 1170
;1170:		ent.shaderRGBA[1] = wv * 255;
ADDRLP4 440
CNSTF4 1132396544
ADDRLP4 416
INDIRF4
MULF4
ASGNF4
ADDRLP4 444
CNSTF4 1325400064
ASGNF4
ADDRLP4 440
INDIRF4
ADDRLP4 444
INDIRF4
LTF4 $578
ADDRLP4 436
ADDRLP4 440
INDIRF4
ADDRLP4 444
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $579
JUMPV
LABELV $578
ADDRLP4 436
ADDRLP4 440
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $579
ADDRLP4 0+80+1
ADDRLP4 436
INDIRU4
CVUU1 4
ASGNU1
line 1171
;1171:		ent.shaderRGBA[2] = wv * 0;
ADDRLP4 452
CNSTF4 0
ADDRLP4 416
INDIRF4
MULF4
ASGNF4
ADDRLP4 456
CNSTF4 1325400064
ASGNF4
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
LTF4 $583
ADDRLP4 448
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $584
JUMPV
LABELV $583
ADDRLP4 448
ADDRLP4 452
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $584
ADDRLP4 0+80+2
ADDRLP4 448
INDIRU4
CVUU1 4
ASGNU1
line 1172
;1172:		trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1174
;1173:
;1174:		for ( i = -4; i < 10; i += 1 )
ADDRLP4 400
CNSTI4 -4
ASGNI4
LABELV $585
line 1175
;1175:		{
line 1176
;1176:			VectorMA( ent.origin, -i, ent.axis[2], org );
ADDRLP4 460
ADDRLP4 400
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 404
ADDRLP4 0+52
INDIRF4
ADDRLP4 0+12+24
INDIRF4
ADDRLP4 460
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 404+4
ADDRLP4 0+52+4
INDIRF4
ADDRLP4 0+12+24+4
INDIRF4
ADDRLP4 460
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 404+8
ADDRLP4 0+52+8
INDIRF4
ADDRLP4 0+12+24+8
INDIRF4
ADDRLP4 400
INDIRI4
NEGI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1178
;1177:
;1178:			VectorCopy(org, fxSArgs.origin);
ADDRLP4 328
ADDRLP4 404
INDIRB
ASGNB 12
line 1179
;1179:			VectorClear(fxSArgs.vel);
ADDRLP4 464
CNSTF4 0
ASGNF4
ADDRLP4 328+12+8
ADDRLP4 464
INDIRF4
ASGNF4
ADDRLP4 328+12+4
ADDRLP4 464
INDIRF4
ASGNF4
ADDRLP4 328+12
ADDRLP4 464
INDIRF4
ASGNF4
line 1180
;1180:			VectorClear(fxSArgs.accel);
ADDRLP4 468
CNSTF4 0
ASGNF4
ADDRLP4 328+24+8
ADDRLP4 468
INDIRF4
ASGNF4
ADDRLP4 328+24+4
ADDRLP4 468
INDIRF4
ASGNF4
ADDRLP4 328+24
ADDRLP4 468
INDIRF4
ASGNF4
line 1181
;1181:			fxSArgs.scale = 5.5f;
ADDRLP4 328+36
CNSTF4 1085276160
ASGNF4
line 1182
;1182:			fxSArgs.dscale = 5.5f;
ADDRLP4 328+40
CNSTF4 1085276160
ASGNF4
line 1183
;1183:			fxSArgs.sAlpha = wv;
ADDRLP4 328+44
ADDRLP4 416
INDIRF4
ASGNF4
line 1184
;1184:			fxSArgs.eAlpha = wv;
ADDRLP4 328+48
ADDRLP4 416
INDIRF4
ASGNF4
line 1185
;1185:			fxSArgs.rotation = 0.0f;
ADDRLP4 328+52
CNSTF4 0
ASGNF4
line 1186
;1186:			fxSArgs.bounce = 0.0f;
ADDRLP4 328+56
CNSTF4 0
ASGNF4
line 1187
;1187:			fxSArgs.life = 1.0f;
ADDRLP4 328+60
CNSTI4 1
ASGNI4
line 1188
;1188:			fxSArgs.shader = cgs.media.yellowDroppedSaberShader;
ADDRLP4 328+64
ADDRGP4 cgs+70296+168
INDIRI4
ASGNI4
line 1189
;1189:			fxSArgs.flags = 0x08000000;
ADDRLP4 328+68
CNSTI4 134217728
ASGNI4
line 1192
;1190:
;1191:			//trap_FX_AddSprite( org, NULL, NULL, 5.5f, 5.5f, wv, wv, 0.0f, 0.0f, 1.0f, cgs.media.yellowSaberGlowShader, 0x08000000 );
;1192:			trap_FX_AddSprite(&fxSArgs);
ADDRLP4 328
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 1193
;1193:		}
LABELV $586
line 1174
ADDRLP4 400
ADDRLP4 400
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 10
LTI4 $585
line 1194
;1194:	}
ADDRGP4 $565
JUMPV
LABELV $564
line 1195
;1195:	else if (cent->currentState.trickedentindex3)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $625
line 1196
;1196:	{ //holocron special effects
line 1203
;1197:		vec3_t org;
;1198:		float wv;
;1199:		addspriteArgStruct_t fxSArgs;
;1200:		//refEntity_t sRef;
;1201:		//memcpy( &sRef, &ent, sizeof( sRef ) );
;1202:
;1203:		ent.customShader = cgs.media.solidWhite;
ADDRLP4 0+76
ADDRGP4 cgs+70296+564
INDIRI4
ASGNI4
line 1204
;1204:		ent.renderfx = RF_RGB_TINT;
ADDRLP4 0+4
CNSTI4 2048
ASGNI4
line 1205
;1205:		wv = sin( cg.time * 0.005f ) * 0.08f + 0.1f; //* 0.08f + 0.1f;
CNSTF4 1000593162
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 416
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 400
CNSTF4 1034147594
ADDRLP4 416
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1207
;1206:
;1207:		if (cent->currentState.trickedentindex3 == 1)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 1
NEI4 $632
line 1208
;1208:		{ //dark
line 1209
;1209:			ent.shaderRGBA[0] = wv*255;
ADDRLP4 424
CNSTF4 1132396544
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
ADDRLP4 428
CNSTF4 1325400064
ASGNF4
ADDRLP4 424
INDIRF4
ADDRLP4 428
INDIRF4
LTF4 $636
ADDRLP4 420
ADDRLP4 424
INDIRF4
ADDRLP4 428
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $637
JUMPV
LABELV $636
ADDRLP4 420
ADDRLP4 424
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $637
ADDRLP4 0+80
ADDRLP4 420
INDIRU4
CVUU1 4
ASGNU1
line 1210
;1210:			ent.shaderRGBA[1] = 0;
ADDRLP4 0+80+1
CNSTU1 0
ASGNU1
line 1211
;1211:			ent.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 1212
;1212:		}
ADDRGP4 $633
JUMPV
LABELV $632
line 1213
;1213:		else if (cent->currentState.trickedentindex3 == 2)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
NEI4 $642
line 1214
;1214:		{ //light
line 1215
;1215:			ent.shaderRGBA[0] = wv*255;
ADDRLP4 424
CNSTF4 1132396544
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
ADDRLP4 428
CNSTF4 1325400064
ASGNF4
ADDRLP4 424
INDIRF4
ADDRLP4 428
INDIRF4
LTF4 $646
ADDRLP4 420
ADDRLP4 424
INDIRF4
ADDRLP4 428
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $647
JUMPV
LABELV $646
ADDRLP4 420
ADDRLP4 424
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $647
ADDRLP4 0+80
ADDRLP4 420
INDIRU4
CVUU1 4
ASGNU1
line 1216
;1216:			ent.shaderRGBA[1] = wv*255;
ADDRLP4 436
CNSTF4 1132396544
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
ADDRLP4 440
CNSTF4 1325400064
ASGNF4
ADDRLP4 436
INDIRF4
ADDRLP4 440
INDIRF4
LTF4 $651
ADDRLP4 432
ADDRLP4 436
INDIRF4
ADDRLP4 440
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $652
JUMPV
LABELV $651
ADDRLP4 432
ADDRLP4 436
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $652
ADDRLP4 0+80+1
ADDRLP4 432
INDIRU4
CVUU1 4
ASGNU1
line 1217
;1217:			ent.shaderRGBA[2] = wv*255;
ADDRLP4 448
CNSTF4 1132396544
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
ADDRLP4 452
CNSTF4 1325400064
ASGNF4
ADDRLP4 448
INDIRF4
ADDRLP4 452
INDIRF4
LTF4 $656
ADDRLP4 444
ADDRLP4 448
INDIRF4
ADDRLP4 452
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $657
JUMPV
LABELV $656
ADDRLP4 444
ADDRLP4 448
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $657
ADDRLP4 0+80+2
ADDRLP4 444
INDIRU4
CVUU1 4
ASGNU1
line 1218
;1218:		}
ADDRGP4 $643
JUMPV
LABELV $642
line 1220
;1219:		else
;1220:		{ //neutral
line 1221
;1221:			if ((s1->modelindex+128) == FP_SABERATTACK ||
ADDRLP4 420
ADDRLP4 212
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
ADDRLP4 420
INDIRI4
CNSTI4 15
EQI4 $661
ADDRLP4 420
INDIRI4
CNSTI4 16
EQI4 $661
ADDRLP4 420
INDIRI4
CNSTI4 17
NEI4 $658
LABELV $661
line 1224
;1222:				(s1->modelindex+128) == FP_SABERDEFEND ||
;1223:				(s1->modelindex+128) == FP_SABERTHROW)
;1224:			{ //saber power
line 1225
;1225:				ent.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 1226
;1226:				ent.shaderRGBA[1] = wv*255;
ADDRLP4 428
CNSTF4 1132396544
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
ADDRLP4 432
CNSTF4 1325400064
ASGNF4
ADDRLP4 428
INDIRF4
ADDRLP4 432
INDIRF4
LTF4 $666
ADDRLP4 424
ADDRLP4 428
INDIRF4
ADDRLP4 432
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $667
JUMPV
LABELV $666
ADDRLP4 424
ADDRLP4 428
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $667
ADDRLP4 0+80+1
ADDRLP4 424
INDIRU4
CVUU1 4
ASGNU1
line 1227
;1227:				ent.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 1228
;1228:			}
ADDRGP4 $659
JUMPV
LABELV $658
line 1230
;1229:			else
;1230:			{
line 1231
;1231:				ent.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 1232
;1232:				ent.shaderRGBA[1] = wv*255;
ADDRLP4 428
CNSTF4 1132396544
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
ADDRLP4 432
CNSTF4 1325400064
ASGNF4
ADDRLP4 428
INDIRF4
ADDRLP4 432
INDIRF4
LTF4 $674
ADDRLP4 424
ADDRLP4 428
INDIRF4
ADDRLP4 432
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $675
JUMPV
LABELV $674
ADDRLP4 424
ADDRLP4 428
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $675
ADDRLP4 0+80+1
ADDRLP4 424
INDIRU4
CVUU1 4
ASGNU1
line 1233
;1233:				ent.shaderRGBA[2] = wv*255;
ADDRLP4 440
CNSTF4 1132396544
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
ADDRLP4 444
CNSTF4 1325400064
ASGNF4
ADDRLP4 440
INDIRF4
ADDRLP4 444
INDIRF4
LTF4 $679
ADDRLP4 436
ADDRLP4 440
INDIRF4
ADDRLP4 444
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $680
JUMPV
LABELV $679
ADDRLP4 436
ADDRLP4 440
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $680
ADDRLP4 0+80+2
ADDRLP4 436
INDIRU4
CVUU1 4
ASGNU1
line 1234
;1234:			}
LABELV $659
line 1235
;1235:		}
LABELV $643
LABELV $633
line 1237
;1236:
;1237:		ent.modelScale[0] = 1.1;
ADDRLP4 0+196
CNSTF4 1066192077
ASGNF4
line 1238
;1238:		ent.modelScale[1] = 1.1;
ADDRLP4 0+196+4
CNSTF4 1066192077
ASGNF4
line 1239
;1239:		ent.modelScale[2] = 1.1;
ADDRLP4 0+196+8
CNSTF4 1066192077
ASGNF4
line 1241
;1240:
;1241:		ent.origin[2] -= 2;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1242
;1242:		ScaleModelAxis(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 1244
;1243:
;1244:		trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1246
;1245:		
;1246:		VectorMA( ent.origin, 1, ent.axis[2], org );
ADDRLP4 420
CNSTF4 1065353216
ASGNF4
ADDRLP4 404
ADDRLP4 0+52
INDIRF4
ADDRLP4 420
INDIRF4
ADDRLP4 0+12+24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 404+4
ADDRLP4 0+52+4
INDIRF4
ADDRLP4 420
INDIRF4
ADDRLP4 0+12+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 404+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+12+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1248
;1247:
;1248:		org[2] += 18;
ADDRLP4 404+8
ADDRLP4 404+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 1250
;1249:
;1250:		wv = sin( cg.time * 0.002f ) * 0.08f + 0.1f; //* 0.08f + 0.1f;
CNSTF4 990057071
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 424
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 400
CNSTF4 1034147594
ADDRLP4 424
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1252
;1251:
;1252:		VectorCopy(org, fxSArgs.origin);
ADDRLP4 328
ADDRLP4 404
INDIRB
ASGNB 12
line 1253
;1253:		VectorClear(fxSArgs.vel);
ADDRLP4 428
CNSTF4 0
ASGNF4
ADDRLP4 328+12+8
ADDRLP4 428
INDIRF4
ASGNF4
ADDRLP4 328+12+4
ADDRLP4 428
INDIRF4
ASGNF4
ADDRLP4 328+12
ADDRLP4 428
INDIRF4
ASGNF4
line 1254
;1254:		VectorClear(fxSArgs.accel);
ADDRLP4 432
CNSTF4 0
ASGNF4
ADDRLP4 328+24+8
ADDRLP4 432
INDIRF4
ASGNF4
ADDRLP4 328+24+4
ADDRLP4 432
INDIRF4
ASGNF4
ADDRLP4 328+24
ADDRLP4 432
INDIRF4
ASGNF4
line 1255
;1255:		fxSArgs.scale = wv*120;//16.0f;
ADDRLP4 328+36
CNSTF4 1123024896
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
line 1256
;1256:		fxSArgs.dscale = wv*120;//16.0f;
ADDRLP4 328+40
CNSTF4 1123024896
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
line 1257
;1257:		fxSArgs.sAlpha = wv*12;
ADDRLP4 328+44
CNSTF4 1094713344
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
line 1258
;1258:		fxSArgs.eAlpha = wv*12;
ADDRLP4 328+48
CNSTF4 1094713344
ADDRLP4 400
INDIRF4
MULF4
ASGNF4
line 1259
;1259:		fxSArgs.rotation = 0.0f;
ADDRLP4 328+52
CNSTF4 0
ASGNF4
line 1260
;1260:		fxSArgs.bounce = 0.0f;
ADDRLP4 328+56
CNSTF4 0
ASGNF4
line 1261
;1261:		fxSArgs.life = 1.0f;
ADDRLP4 328+60
CNSTI4 1
ASGNI4
line 1263
;1262:
;1263:		fxSArgs.flags = 0x08000000|0x00000001;
ADDRLP4 328+68
CNSTI4 134217729
ASGNI4
line 1265
;1264:
;1265:		if (cent->currentState.trickedentindex3 == 1)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 1
NEI4 $723
line 1266
;1266:		{ //dark
line 1267
;1267:			fxSArgs.sAlpha *= 3;
ADDRLP4 328+44
CNSTF4 1077936128
ADDRLP4 328+44
INDIRF4
MULF4
ASGNF4
line 1268
;1268:			fxSArgs.eAlpha *= 3;
ADDRLP4 328+48
CNSTF4 1077936128
ADDRLP4 328+48
INDIRF4
MULF4
ASGNF4
line 1269
;1269:			fxSArgs.shader = cgs.media.redSaberGlowShader;
ADDRLP4 328+64
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 1270
;1270:			trap_FX_AddSprite(&fxSArgs);
ADDRLP4 328
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 1271
;1271:		}
ADDRGP4 $724
JUMPV
LABELV $723
line 1272
;1272:		else if (cent->currentState.trickedentindex3 == 2)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
NEI4 $730
line 1273
;1273:		{ //light
line 1274
;1274:			fxSArgs.sAlpha *= 1.5;
ADDRLP4 328+44
CNSTF4 1069547520
ADDRLP4 328+44
INDIRF4
MULF4
ASGNF4
line 1275
;1275:			fxSArgs.eAlpha *= 1.5;
ADDRLP4 328+48
CNSTF4 1069547520
ADDRLP4 328+48
INDIRF4
MULF4
ASGNF4
line 1276
;1276:			fxSArgs.shader = cgs.media.redSaberGlowShader;
ADDRLP4 328+64
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 1277
;1277:			trap_FX_AddSprite(&fxSArgs);
ADDRLP4 328
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 1278
;1278:			fxSArgs.shader = cgs.media.greenSaberGlowShader;
ADDRLP4 328+64
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 1279
;1279:			trap_FX_AddSprite(&fxSArgs);
ADDRLP4 328
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 1280
;1280:			fxSArgs.shader = cgs.media.blueSaberGlowShader;
ADDRLP4 328+64
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 1281
;1281:			trap_FX_AddSprite(&fxSArgs);
ADDRLP4 328
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 1282
;1282:		}
ADDRGP4 $731
JUMPV
LABELV $730
line 1284
;1283:		else
;1284:		{ //neutral
line 1285
;1285:			if ((s1->modelindex+128) == FP_SABERATTACK ||
ADDRLP4 436
ADDRLP4 212
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
ADDRLP4 436
INDIRI4
CNSTI4 15
EQI4 $746
ADDRLP4 436
INDIRI4
CNSTI4 16
EQI4 $746
ADDRLP4 436
INDIRI4
CNSTI4 17
NEI4 $743
LABELV $746
line 1288
;1286:				(s1->modelindex+128) == FP_SABERDEFEND ||
;1287:				(s1->modelindex+128) == FP_SABERTHROW)
;1288:			{ //saber power
line 1289
;1289:				fxSArgs.sAlpha *= 1.5;
ADDRLP4 328+44
CNSTF4 1069547520
ADDRLP4 328+44
INDIRF4
MULF4
ASGNF4
line 1290
;1290:				fxSArgs.eAlpha *= 1.5;
ADDRLP4 328+48
CNSTF4 1069547520
ADDRLP4 328+48
INDIRF4
MULF4
ASGNF4
line 1291
;1291:				fxSArgs.shader = cgs.media.greenSaberGlowShader;
ADDRLP4 328+64
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 1292
;1292:				trap_FX_AddSprite(&fxSArgs);
ADDRLP4 328
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 1293
;1293:			}
ADDRGP4 $744
JUMPV
LABELV $743
line 1295
;1294:			else
;1295:			{
line 1296
;1296:				fxSArgs.sAlpha *= 0.5;
ADDRLP4 328+44
CNSTF4 1056964608
ADDRLP4 328+44
INDIRF4
MULF4
ASGNF4
line 1297
;1297:				fxSArgs.eAlpha *= 0.5;
ADDRLP4 328+48
CNSTF4 1056964608
ADDRLP4 328+48
INDIRF4
MULF4
ASGNF4
line 1298
;1298:				fxSArgs.shader = cgs.media.greenSaberGlowShader;
ADDRLP4 328+64
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 1299
;1299:				trap_FX_AddSprite(&fxSArgs);
ADDRLP4 328
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 1300
;1300:				fxSArgs.shader = cgs.media.blueSaberGlowShader;
ADDRLP4 328+64
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 1301
;1301:				trap_FX_AddSprite(&fxSArgs);
ADDRLP4 328
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 1302
;1302:			}
LABELV $744
line 1303
;1303:		}
LABELV $731
LABELV $724
line 1304
;1304:	}
LABELV $625
LABELV $565
line 1306
;1305:
;1306:	if ( cent->currentState.time == -1 && cent->currentState.weapon == WP_TRIP_MINE && (cent->currentState.eFlags & EF_FIRING) )
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $760
ADDRLP4 328
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 12
NEI4 $760
ADDRLP4 328
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $760
line 1307
;1307:	{ //if force sight is active, render the laser multiple times up to the force sight level to increase visibility
line 1308
;1308:		int i = 0;
ADDRLP4 332
CNSTI4 0
ASGNI4
line 1310
;1309:
;1310:		VectorMA( ent.origin, 6.6f, ent.axis[0], beamOrg );// forward
ADDRLP4 336
CNSTF4 1087583027
ASGNF4
ADDRLP4 216
ADDRLP4 0+52
INDIRF4
ADDRLP4 336
INDIRF4
ADDRLP4 0+12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+4
ADDRLP4 0+52+4
INDIRF4
ADDRLP4 336
INDIRF4
ADDRLP4 0+12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1087583027
ADDRLP4 0+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1311
;1311:		beamID = cgs.effects.tripmineLaserFX;
ADDRLP4 228
ADDRGP4 cgs+71564+140
INDIRI4
ASGNI4
line 1313
;1312:
;1313:		if (cg.snap->ps.fd.forcePowersActive & (1 << FP_SEE))
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $776
line 1314
;1314:		{
line 1315
;1315:			i = cg.snap->ps.fd.forcePowerLevel[FP_SEE];
ADDRLP4 332
ADDRGP4 cg+36
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $781
JUMPV
LABELV $780
line 1318
;1316:
;1317:			while (i > 0)
;1318:			{
line 1319
;1319:				trap_FX_PlayEffectID( beamID, beamOrg, cent->currentState.pos.trDelta );
ADDRLP4 228
INDIRI4
ARGI4
ADDRLP4 216
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1320
;1320:				trap_FX_PlayEffectID( beamID, beamOrg, cent->currentState.pos.trDelta );
ADDRLP4 228
INDIRI4
ARGI4
ADDRLP4 216
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1321
;1321:				i--;
ADDRLP4 332
ADDRLP4 332
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1322
;1322:			}
LABELV $781
line 1317
ADDRLP4 332
INDIRI4
CNSTI4 0
GTI4 $780
line 1323
;1323:		}
LABELV $776
line 1325
;1324:
;1325:		trap_FX_PlayEffectID( beamID, beamOrg, cent->currentState.pos.trDelta );
ADDRLP4 228
INDIRI4
ARGI4
ADDRLP4 216
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1326
;1326:	}
LABELV $760
line 1331
;1327:/*
;1328:Ghoul2 Insert Start
;1329:*/
;1330:
;1331:	if (cg_debugBB.integer)
ADDRGP4 cg_debugBB+12
INDIRI4
CNSTI4 0
EQI4 $783
line 1332
;1332:	{
line 1333
;1333:		CG_CreateBBRefEnts(s1, cent->lerpOrigin);
ADDRLP4 212
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 CG_CreateBBRefEnts
CALLV
pop
line 1334
;1334:	}
LABELV $783
line 1338
;1335:/*
;1336:Ghoul2 Insert End
;1337:*/
;1338:}
LABELV $236
endproc CG_General 472 44
proc CG_Speaker 16 16
line 1347
;1339:
;1340:/*
;1341:==================
;1342:CG_Speaker
;1343:
;1344:Speaker entities can automatically play sounds
;1345:==================
;1346:*/
;1347:static void CG_Speaker( centity_t *cent ) {
line 1348
;1348:	if (cent->currentState.trickedentindex)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
EQI4 $787
line 1349
;1349:	{
line 1350
;1350:		trap_S_StopLoopingSound(cent->currentState.number);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1351
;1351:	}
LABELV $787
line 1353
;1352:
;1353:	if ( ! cent->currentState.clientNum ) {	// FIXME: use something other than clientNum...
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 0
NEI4 $789
line 1354
;1354:		return;		// not auto triggering
ADDRGP4 $786
JUMPV
LABELV $789
line 1357
;1355:	}
;1356:
;1357:	if ( cg.time < cent->miscTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
GEI4 $791
line 1358
;1358:		return;
ADDRGP4 $786
JUMPV
LABELV $791
line 1361
;1359:	}
;1360:
;1361:	trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.gameSounds[cent->currentState.eventParm] );
CNSTP4 0
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1365
;1362:
;1363:	//	ent->s.frame = ent->wait * 10;
;1364:	//	ent->s.clientNum = ent->random * 10;
;1365:	cent->miscTime = cg.time + cent->currentState.frame * 100 + cent->currentState.clientNum * 100 * crandom();
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 100
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 620
ADDP4
ADDRGP4 cg+64
INDIRI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
MULI4
ADDI4
CVIF4 4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1366
;1366:}
LABELV $786
endproc CG_Speaker 16 16
export CG_GreyItem
proc CG_GreyItem 4 0
line 1369
;1367:
;1368:qboolean CG_GreyItem(int type, int tag, int plSide)
;1369:{
line 1370
;1370:	if (type == IT_POWERUP &&
ADDRFP4 0
INDIRI4
CNSTI4 5
NEI4 $797
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $799
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $797
LABELV $799
line 1372
;1371:		(tag == PW_FORCE_ENLIGHTENED_LIGHT || tag == PW_FORCE_ENLIGHTENED_DARK))
;1372:	{
line 1373
;1373:		if (plSide == FORCE_LIGHTSIDE)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $800
line 1374
;1374:		{
line 1375
;1375:			if (tag == PW_FORCE_ENLIGHTENED_DARK)
ADDRFP4 4
INDIRI4
CNSTI4 13
NEI4 $801
line 1376
;1376:			{
line 1377
;1377:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $796
JUMPV
line 1379
;1378:			}
;1379:		}
LABELV $800
line 1380
;1380:		else if (plSide == FORCE_DARKSIDE)
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $804
line 1381
;1381:		{
line 1382
;1382:			if (tag == PW_FORCE_ENLIGHTENED_LIGHT)
ADDRFP4 4
INDIRI4
CNSTI4 12
NEI4 $806
line 1383
;1383:			{
line 1384
;1384:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $796
JUMPV
LABELV $806
line 1386
;1385:			}
;1386:		}
LABELV $804
LABELV $801
line 1387
;1387:	}
LABELV $797
line 1389
;1388:
;1389:	return qfalse;
CNSTI4 0
RETI4
LABELV $796
endproc CG_GreyItem 4 0
proc CG_Item 312 12
line 1397
;1390:}
;1391:
;1392:/*
;1393:==================
;1394:CG_Item
;1395:==================
;1396:*/
;1397:static void CG_Item( centity_t *cent ) {
line 1405
;1398:	refEntity_t		ent;
;1399:	entityState_t	*es;
;1400:	gitem_t			*item;
;1401:	int				msec;
;1402:	float			scale;
;1403:	weaponInfo_t	*wi;
;1404:
;1405:	es = &cent->currentState;
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
line 1406
;1406:	if ( es->modelindex >= bg_numItems ) {
ADDRLP4 216
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $809
line 1407
;1407:		CG_Error( "Bad item index %i on entity", es->modelindex );
ADDRGP4 $811
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1408
;1408:	}
LABELV $809
line 1414
;1409:
;1410:/*
;1411:Ghoul2 Insert Start
;1412:*/
;1413:
;1414:	if ((es->eFlags & EF_NODRAW) && (es->eFlags & EF_ITEMPLACEHOLDER))
ADDRLP4 232
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 236
CNSTI4 0
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 236
INDIRI4
EQI4 $812
ADDRLP4 232
INDIRI4
CNSTI4 4194304
BANDI4
ADDRLP4 236
INDIRI4
EQI4 $812
line 1415
;1415:	{
line 1416
;1416:		es->eFlags &= ~EF_NODRAW;
ADDRLP4 240
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
ADDRLP4 240
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1417
;1417:	}
LABELV $812
line 1419
;1418:
;1419:	if ( !es->modelindex ) 
ADDRLP4 216
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $814
line 1420
;1420:	{
line 1421
;1421:		return;
ADDRGP4 $808
JUMPV
LABELV $814
line 1424
;1422:	}
;1423:
;1424:	item = &bg_itemlist[ es->modelindex ];
ADDRLP4 212
CNSTI4 52
ADDRLP4 216
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1426
;1425:
;1426:	if ((item->giType == IT_WEAPON || item->giType == IT_POWERUP) &&
ADDRLP4 240
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 1
EQI4 $819
ADDRLP4 240
INDIRI4
CNSTI4 5
NEI4 $816
LABELV $819
ADDRLP4 244
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
ADDRLP4 244
INDIRI4
NEI4 $816
ADDRGP4 cg_simpleItems+12
INDIRI4
ADDRLP4 244
INDIRI4
NEI4 $816
line 1429
;1427:		!(cent->currentState.eFlags & EF_DROPPEDWEAPON) &&
;1428:		!cg_simpleItems.integer)
;1429:	{
line 1433
;1430:		vec3_t uNorm;
;1431:		qboolean doGrey;
;1432:		
;1433:		VectorClear(uNorm);
ADDRLP4 264
CNSTF4 0
ASGNF4
ADDRLP4 248+8
ADDRLP4 264
INDIRF4
ASGNF4
ADDRLP4 248+4
ADDRLP4 264
INDIRF4
ASGNF4
ADDRLP4 248
ADDRLP4 264
INDIRF4
ASGNF4
line 1435
;1434:
;1435:		uNorm[2] = 1;
ADDRLP4 248+8
CNSTF4 1065353216
ASGNF4
line 1437
;1436:
;1437:		memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1439
;1438:
;1439:		ent.customShader = 0;
ADDRLP4 0+76
CNSTI4 0
ASGNI4
line 1440
;1440:		VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 1441
;1441:		VectorCopy( cent->currentState.angles, cent->lerpAngles );
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 268
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1442
;1442:		AnglesToAxis(cent->lerpAngles, ent.axis);
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1443
;1443:		ent.hModel = cgs.media.itemHoloModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+32
INDIRI4
ASGNI4
line 1445
;1444:
;1445:		doGrey = CG_GreyItem(item->giType, item->giTag, cg.snap->ps.fd.forceSide);
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
ARGI4
ADDRLP4 276
ADDRGP4 CG_GreyItem
CALLI4
ASGNI4
ADDRLP4 260
ADDRLP4 276
INDIRI4
ASGNI4
line 1447
;1446:
;1447:		if (doGrey)
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $830
line 1448
;1448:		{
line 1449
;1449:			ent.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 1451
;1450:
;1451:			ent.shaderRGBA[0] = 150;
ADDRLP4 0+80
CNSTU1 150
ASGNU1
line 1452
;1452:			ent.shaderRGBA[1] = 150;
ADDRLP4 0+80+1
CNSTU1 150
ASGNU1
line 1453
;1453:			ent.shaderRGBA[2] = 150;
ADDRLP4 0+80+2
CNSTU1 150
ASGNU1
line 1454
;1454:		}
LABELV $830
line 1456
;1455:
;1456:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1458
;1457:
;1458:		if (!doGrey)
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $838
line 1459
;1459:		{
line 1460
;1460:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("mp/itemcone.efx"), ent.origin, uNorm);
ADDRGP4 $840
ARGP4
ADDRLP4 280
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRLP4 0+52
ARGP4
ADDRLP4 248
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1461
;1461:		}
LABELV $838
line 1462
;1462:	}
LABELV $816
line 1465
;1463:
;1464:	// if set to invisible, skip
;1465:	if ( ( es->eFlags & EF_NODRAW ) ) 
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $842
line 1466
;1466:	{
line 1467
;1467:		return;
ADDRGP4 $808
JUMPV
LABELV $842
line 1473
;1468:	}
;1469:/*
;1470:Ghoul2 Insert End
;1471:*/
;1472:
;1473:	if ( cg_simpleItems.integer && item->giType != IT_TEAM ) {
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
EQI4 $844
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $844
line 1474
;1474:		memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1475
;1475:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1476
;1476:		VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 1477
;1477:		ent.radius = 14;
ADDRLP4 0+92
CNSTF4 1096810496
ASGNF4
line 1478
;1478:		ent.customShader = cg_items[es->modelindex].icon;
ADDRLP4 0+76
CNSTI4 56
ADDRLP4 216
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ASGNI4
line 1479
;1479:		ent.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 1480
;1480:		ent.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 1481
;1481:		ent.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 1483
;1482:
;1483:		ent.origin[2] += 16;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1485
;1484:
;1485:		if (item->giType != IT_POWERUP || item->giTag != PW_FORCE_BOON)
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $860
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 14
EQI4 $858
LABELV $860
line 1486
;1486:		{
line 1487
;1487:			ent.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 1488
;1488:		}
LABELV $858
line 1490
;1489:
;1490:		if ( es->eFlags & EF_ITEMPLACEHOLDER )
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4194304
BANDI4
CNSTI4 0
EQI4 $862
line 1491
;1491:		{
line 1492
;1492:			if (item->giType == IT_POWERUP && item->giTag == PW_FORCE_BOON)
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $864
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 14
NEI4 $864
line 1493
;1493:			{
line 1494
;1494:				return;
ADDRGP4 $808
JUMPV
LABELV $864
line 1496
;1495:			}
;1496:			ent.shaderRGBA[0] = 200;
ADDRLP4 0+80
CNSTU1 200
ASGNU1
line 1497
;1497:			ent.shaderRGBA[1] = 200;
ADDRLP4 0+80+1
CNSTU1 200
ASGNU1
line 1498
;1498:			ent.shaderRGBA[2] = 200;
ADDRLP4 0+80+2
CNSTU1 200
ASGNU1
line 1499
;1499:			ent.shaderRGBA[3] = 150 + sin(cg.time*0.01)*30;
CNSTF4 1008981770
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 260
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 264
CNSTF4 1106247680
ADDRLP4 260
INDIRF4
MULF4
CNSTF4 1125515264
ADDF4
ASGNF4
ADDRLP4 268
CNSTF4 1325400064
ASGNF4
ADDRLP4 264
INDIRF4
ADDRLP4 268
INDIRF4
LTF4 $875
ADDRLP4 256
ADDRLP4 264
INDIRF4
ADDRLP4 268
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $876
JUMPV
LABELV $875
ADDRLP4 256
ADDRLP4 264
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $876
ADDRLP4 0+80+3
ADDRLP4 256
INDIRU4
CVUU1 4
ASGNU1
line 1500
;1500:		}
ADDRGP4 $863
JUMPV
LABELV $862
line 1502
;1501:		else
;1502:		{
line 1503
;1503:			ent.shaderRGBA[3] = 255;
ADDRLP4 0+80+3
CNSTU1 255
ASGNU1
line 1504
;1504:		}
LABELV $863
line 1506
;1505:
;1506:		if (CG_GreyItem(item->giType, item->giTag, cg.snap->ps.fd.forceSide))
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ADDRGP4 CG_GreyItem
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
EQI4 $879
line 1507
;1507:		{
line 1508
;1508:			ent.shaderRGBA[0] = 100;
ADDRLP4 0+80
CNSTU1 100
ASGNU1
line 1509
;1509:			ent.shaderRGBA[1] = 100;
ADDRLP4 0+80+1
CNSTU1 100
ASGNU1
line 1510
;1510:			ent.shaderRGBA[2] = 100;
ADDRLP4 0+80+2
CNSTU1 100
ASGNU1
line 1512
;1511:
;1512:			ent.shaderRGBA[3] = 200;
ADDRLP4 0+80+3
CNSTU1 200
ASGNU1
line 1514
;1513:
;1514:			if (item->giTag == PW_FORCE_ENLIGHTENED_LIGHT)
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 12
NEI4 $889
line 1515
;1515:			{
line 1516
;1516:				ent.customShader = trap_R_RegisterShader("gfx/misc/mp_light_enlight_disable");
ADDRGP4 $892
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+76
ADDRLP4 260
INDIRI4
ASGNI4
line 1517
;1517:			}
ADDRGP4 $890
JUMPV
LABELV $889
line 1519
;1518:			else
;1519:			{
line 1520
;1520:				ent.customShader = trap_R_RegisterShader("gfx/misc/mp_dark_enlight_disable");
ADDRGP4 $894
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+76
ADDRLP4 260
INDIRI4
ASGNI4
line 1521
;1521:			}
LABELV $890
line 1522
;1522:		}
LABELV $879
line 1523
;1523:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1524
;1524:		return;
ADDRGP4 $808
JUMPV
LABELV $844
line 1527
;1525:	}
;1526:
;1527:	if ((item->giType == IT_WEAPON || item->giType == IT_POWERUP) &&
ADDRLP4 248
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 1
EQI4 $897
ADDRLP4 248
INDIRI4
CNSTI4 5
NEI4 $895
LABELV $897
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
NEI4 $895
line 1529
;1528:		!(cent->currentState.eFlags & EF_DROPPEDWEAPON))
;1529:	{
line 1530
;1530:		cent->lerpOrigin[2] += 16;
ADDRLP4 252
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
ADDRLP4 252
INDIRP4
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1531
;1531:	}
LABELV $895
line 1533
;1532:
;1533:	if ((!(cent->currentState.eFlags & EF_DROPPEDWEAPON) || item->giType == IT_POWERUP) &&
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $900
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $898
LABELV $900
ADDRLP4 252
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 1
EQI4 $901
ADDRLP4 252
INDIRI4
CNSTI4 5
NEI4 $898
LABELV $901
line 1535
;1534:		(item->giType == IT_WEAPON || item->giType == IT_POWERUP))
;1535:	{
line 1537
;1536:		// items bob up and down continuously
;1537:		scale = 0.005 + cent->currentState.number * 0.00001;
ADDRLP4 228
CNSTF4 925353388
ADDRFP4 0
INDIRP4
INDIRI4
CVIF4 4
MULF4
CNSTF4 1000593162
ADDF4
ASGNF4
line 1538
;1538:		cent->lerpOrigin[2] += 4 + cos( ( cg.time + 1000 ) *  scale ) * 4;
ADDRGP4 cg+64
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ADDRLP4 228
INDIRF4
MULF4
ARGF4
ADDRLP4 256
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 260
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 256
INDIRF4
MULF4
CNSTF4 1082130432
ADDF4
ADDF4
ASGNF4
line 1539
;1539:	}
ADDRGP4 $899
JUMPV
LABELV $898
line 1541
;1540:	else
;1541:	{
line 1542
;1542:		if (item->giType == IT_HOLDABLE)
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $903
line 1543
;1543:		{
line 1544
;1544:			if (item->giTag == HI_SEEKER)
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
NEI4 $905
line 1545
;1545:			{
line 1546
;1546:				cent->lerpOrigin[2] += 5;
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
ADDRLP4 256
INDIRP4
INDIRF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 1547
;1547:			}
LABELV $905
line 1548
;1548:			if (item->giTag == HI_SHIELD)
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $907
line 1549
;1549:			{
line 1550
;1550:				cent->lerpOrigin[2] += 2;
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
ADDRLP4 256
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1551
;1551:			}
LABELV $907
line 1552
;1552:			if (item->giTag == HI_BINOCULARS)
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $909
line 1553
;1553:			{
line 1554
;1554:				cent->lerpOrigin[2] += 2;
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
ADDRLP4 256
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1555
;1555:			}
LABELV $909
line 1556
;1556:		}
LABELV $903
line 1557
;1557:		if (item->giType == IT_HEALTH)
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $911
line 1558
;1558:		{
line 1559
;1559:			cent->lerpOrigin[2] += 2;
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
ADDRLP4 256
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1560
;1560:		}
LABELV $911
line 1561
;1561:		if (item->giType == IT_ARMOR)
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $913
line 1562
;1562:		{
line 1563
;1563:			if (item->quantity == 100)
ADDRLP4 212
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
NEI4 $915
line 1564
;1564:			{
line 1565
;1565:				cent->lerpOrigin[2] += 7;
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
ADDRLP4 256
INDIRP4
INDIRF4
CNSTF4 1088421888
ADDF4
ASGNF4
line 1566
;1566:			}
LABELV $915
line 1567
;1567:		}
LABELV $913
line 1568
;1568:	}
LABELV $899
line 1570
;1569:
;1570:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1572
;1571:
;1572:	if ( (!(cent->currentState.eFlags & EF_DROPPEDWEAPON) || item->giType == IT_POWERUP) &&
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $919
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $917
LABELV $919
ADDRLP4 256
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 1
EQI4 $920
ADDRLP4 256
INDIRI4
CNSTI4 5
NEI4 $917
LABELV $920
line 1574
;1573:		(item->giType == IT_WEAPON || item->giType == IT_POWERUP) )
;1574:	{ //only weapons and powerups rotate now
line 1576
;1575:		// autorotate at one of two speeds
;1576:		VectorCopy( cg.autoAngles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ADDRGP4 cg+3520
INDIRB
ASGNB 12
line 1577
;1577:		AxisCopy( cg.autoAxis, ent.axis );
ADDRGP4 cg+3532
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 1578
;1578:	}
ADDRGP4 $918
JUMPV
LABELV $917
line 1580
;1579:	else
;1580:	{
line 1581
;1581:		VectorCopy( cent->currentState.angles, cent->lerpAngles );
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 260
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1582
;1582:		AnglesToAxis(cent->lerpAngles, ent.axis);
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1583
;1583:	}
LABELV $918
line 1585
;1584:
;1585:	wi = NULL;
ADDRLP4 220
CNSTP4 0
ASGNP4
line 1589
;1586:	// the weapons have their origin where they attatch to player
;1587:	// models, so we need to offset them or they will rotate
;1588:	// eccentricly
;1589:	if (!(cent->currentState.eFlags & EF_DROPPEDWEAPON))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
NEI4 $925
line 1590
;1590:	{
line 1591
;1591:		if ( item->giType == IT_WEAPON ) {
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $926
line 1592
;1592:			wi = &cg_weapons[item->giTag];
ADDRLP4 220
CNSTI4 208
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1593
;1593:			cent->lerpOrigin[0] -= 
ADDRLP4 260
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRF4
ADDRLP4 220
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+12
INDIRF4
MULF4
ADDRLP4 220
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+12+12
INDIRF4
MULF4
ADDF4
ADDRLP4 220
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+12+24
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 1597
;1594:				wi->weaponMidpoint[0] * ent.axis[0][0] +
;1595:				wi->weaponMidpoint[1] * ent.axis[1][0] +
;1596:				wi->weaponMidpoint[2] * ent.axis[2][0];
;1597:			cent->lerpOrigin[1] -= 
ADDRLP4 268
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRF4
ADDRLP4 220
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
MULF4
ADDRLP4 220
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+12+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 220
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+12+24+4
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 1601
;1598:				wi->weaponMidpoint[0] * ent.axis[0][1] +
;1599:				wi->weaponMidpoint[1] * ent.axis[1][1] +
;1600:				wi->weaponMidpoint[2] * ent.axis[2][1];
;1601:			cent->lerpOrigin[2] -= 
ADDRLP4 276
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
ADDRLP4 276
INDIRP4
INDIRF4
ADDRLP4 220
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
MULF4
ADDRLP4 220
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+12+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 220
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+12+24+8
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 1606
;1602:				wi->weaponMidpoint[0] * ent.axis[0][2] +
;1603:				wi->weaponMidpoint[1] * ent.axis[1][2] +
;1604:				wi->weaponMidpoint[2] * ent.axis[2][2];
;1605:
;1606:			cent->lerpOrigin[2] += 8;	// an extra height boost
ADDRLP4 284
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
ADDRLP4 284
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1607
;1607:		}
line 1608
;1608:	}
ADDRGP4 $926
JUMPV
LABELV $925
line 1610
;1609:	else
;1610:	{
line 1611
;1611:		wi = &cg_weapons[item->giTag];
ADDRLP4 220
CNSTI4 208
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1613
;1612:
;1613:		switch(item->giTag)
ADDRLP4 260
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 4
LTI4 $950
ADDRLP4 260
INDIRI4
CNSTI4 13
GTI4 $950
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $963-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $963
address $953
address $954
address $955
address $956
address $957
address $958
address $959
address $960
address $961
address $962
code
line 1614
;1614:		{
LABELV $953
line 1616
;1615:		case WP_BLASTER:
;1616:			cent->lerpOrigin[2] -= 12;
ADDRLP4 268
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 1617
;1617:			break;
ADDRGP4 $951
JUMPV
LABELV $954
line 1619
;1618:		case WP_DISRUPTOR:
;1619:			cent->lerpOrigin[2] -= 13;
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRF4
CNSTF4 1095761920
SUBF4
ASGNF4
line 1620
;1620:			break;
ADDRGP4 $951
JUMPV
LABELV $955
line 1622
;1621:		case WP_BOWCASTER:
;1622:			cent->lerpOrigin[2] -= 16;
ADDRLP4 276
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
ADDRLP4 276
INDIRP4
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1623
;1623:			break;
ADDRGP4 $951
JUMPV
LABELV $956
line 1625
;1624:		case WP_REPEATER:
;1625:			cent->lerpOrigin[2] -= 12;
ADDRLP4 280
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 280
INDIRP4
ADDRLP4 280
INDIRP4
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 1626
;1626:			break;
ADDRGP4 $951
JUMPV
LABELV $957
line 1628
;1627:		case WP_DEMP2:
;1628:			cent->lerpOrigin[2] -= 10;
ADDRLP4 284
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
ADDRLP4 284
INDIRP4
INDIRF4
CNSTF4 1092616192
SUBF4
ASGNF4
line 1629
;1629:			break;
ADDRGP4 $951
JUMPV
LABELV $958
line 1631
;1630:		case WP_FLECHETTE:
;1631:			cent->lerpOrigin[2] -= 6;
ADDRLP4 288
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 288
INDIRP4
ADDRLP4 288
INDIRP4
INDIRF4
CNSTF4 1086324736
SUBF4
ASGNF4
line 1632
;1632:			break;
ADDRGP4 $951
JUMPV
LABELV $959
line 1634
;1633:		case WP_ROCKET_LAUNCHER:
;1634:			cent->lerpOrigin[2] -= 11;
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 292
INDIRP4
ADDRLP4 292
INDIRP4
INDIRF4
CNSTF4 1093664768
SUBF4
ASGNF4
line 1635
;1635:			break;
ADDRGP4 $951
JUMPV
LABELV $960
line 1637
;1636:		case WP_THERMAL:
;1637:			cent->lerpOrigin[2] -= 12;
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 296
INDIRP4
ADDRLP4 296
INDIRP4
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 1638
;1638:			break;
ADDRGP4 $951
JUMPV
LABELV $961
line 1640
;1639:		case WP_TRIP_MINE:
;1640:			cent->lerpOrigin[2] -= 16;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1641
;1641:			break;
ADDRGP4 $951
JUMPV
LABELV $962
line 1643
;1642:		case WP_DET_PACK:
;1643:			cent->lerpOrigin[2] -= 16;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1644
;1644:			break;
ADDRGP4 $951
JUMPV
LABELV $950
line 1646
;1645:		default:
;1646:			cent->lerpOrigin[2] -= 8;
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ASGNP4
ADDRLP4 308
INDIRP4
ADDRLP4 308
INDIRP4
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1647
;1647:			break;
LABELV $951
line 1649
;1648:		}
;1649:	}
LABELV $926
line 1651
;1650:
;1651:	ent.hModel = cg_items[es->modelindex].models[0];
ADDRLP4 0+8
CNSTI4 56
ADDRLP4 216
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+4
ADDP4
INDIRI4
ASGNI4
line 1655
;1652:/*
;1653:Ghoul2 Insert Start
;1654:*/
;1655:	ent.ghoul2 = cg_items[es->modelindex].g2Models[0];
ADDRLP4 0+208
CNSTI4 56
ADDRLP4 216
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+24
ADDP4
INDIRP4
ASGNP4
line 1656
;1656:	ent.radius = cg_items[es->modelindex].radius[0];
ADDRLP4 0+92
CNSTI4 56
ADDRLP4 216
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+40
ADDP4
INDIRF4
ASGNF4
line 1657
;1657:	VectorCopy (cent->lerpAngles, ent.angles);
ADDRLP4 0+184
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 1661
;1658:/*
;1659:Ghoul2 Insert End
;1660:*/
;1661:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 1662
;1662:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+64
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 1664
;1663:
;1664:	ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+48
CNSTI4 0
ASGNI4
line 1668
;1665:
;1666:	// if just respawned, slowly scale up
;1667:	
;1668:	msec = cg.time - cent->miscTime;
ADDRLP4 224
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1670
;1669:
;1670:	if (CG_GreyItem(item->giType, item->giTag, cg.snap->ps.fd.forceSide))
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 CG_GreyItem
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $976
line 1671
;1671:	{
line 1672
;1672:		ent.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 1674
;1673:
;1674:		ent.shaderRGBA[0] = 150;
ADDRLP4 0+80
CNSTU1 150
ASGNU1
line 1675
;1675:		ent.shaderRGBA[1] = 150;
ADDRLP4 0+80+1
CNSTU1 150
ASGNU1
line 1676
;1676:		ent.shaderRGBA[2] = 150;
ADDRLP4 0+80+2
CNSTU1 150
ASGNU1
line 1678
;1677:
;1678:		ent.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 1680
;1679:
;1680:		ent.shaderRGBA[3] = 200;
ADDRLP4 0+80+3
CNSTU1 200
ASGNU1
line 1682
;1681:
;1682:		if (item->giTag == PW_FORCE_ENLIGHTENED_LIGHT)
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 12
NEI4 $988
line 1683
;1683:		{
line 1684
;1684:			ent.customShader = trap_R_RegisterShader("gfx/misc/mp_light_enlight_disable");
ADDRGP4 $892
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+76
ADDRLP4 268
INDIRI4
ASGNI4
line 1685
;1685:		}
ADDRGP4 $989
JUMPV
LABELV $988
line 1687
;1686:		else
;1687:		{
line 1688
;1688:			ent.customShader = trap_R_RegisterShader("gfx/misc/mp_dark_enlight_disable");
ADDRGP4 $894
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+76
ADDRLP4 268
INDIRI4
ASGNI4
line 1689
;1689:		}
LABELV $989
line 1691
;1690:
;1691:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1692
;1692:		return;
ADDRGP4 $808
JUMPV
LABELV $976
line 1695
;1693:	}
;1694:
;1695:	if ( es->eFlags & EF_ITEMPLACEHOLDER )		// item has been picked up
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4194304
BANDI4
CNSTI4 0
EQI4 $992
line 1696
;1696:	{
line 1697
;1697:		if ( es->eFlags & EF_DEAD )				// if item had been droped, don't show at all
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $994
line 1698
;1698:			return;
ADDRGP4 $808
JUMPV
LABELV $994
line 1700
;1699:
;1700:		ent.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 1701
;1701:		ent.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 1702
;1702:		ent.shaderRGBA[1] = 200;
ADDRLP4 0+80+1
CNSTU1 200
ASGNU1
line 1703
;1703:		ent.shaderRGBA[2] = 85;
ADDRLP4 0+80+2
CNSTU1 85
ASGNU1
line 1704
;1704:		ent.customShader = cgs.media.itemRespawningPlaceholder;
ADDRLP4 0+76
ADDRGP4 cgs+70296+480
INDIRI4
ASGNI4
line 1705
;1705:	}
LABELV $992
line 1708
;1706:
;1707:	// increase the size of the weapons when they are presented as items
;1708:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1005
line 1709
;1709:		VectorScale( ent.axis[0], 1.5, ent.axis[0] );
ADDRLP4 0+12
CNSTF4 1069547520
ADDRLP4 0+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+4
CNSTF4 1069547520
ADDRLP4 0+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+8
CNSTF4 1069547520
ADDRLP4 0+12+8
INDIRF4
MULF4
ASGNF4
line 1710
;1710:		VectorScale( ent.axis[1], 1.5, ent.axis[1] );
ADDRLP4 0+12+12
CNSTF4 1069547520
ADDRLP4 0+12+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+4
CNSTF4 1069547520
ADDRLP4 0+12+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+8
CNSTF4 1069547520
ADDRLP4 0+12+12+8
INDIRF4
MULF4
ASGNF4
line 1711
;1711:		VectorScale( ent.axis[2], 1.5, ent.axis[2] );
ADDRLP4 0+12+24
CNSTF4 1069547520
ADDRLP4 0+12+24
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+24+4
CNSTF4 1069547520
ADDRLP4 0+12+24+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+24+8
CNSTF4 1069547520
ADDRLP4 0+12+24+8
INDIRF4
MULF4
ASGNF4
line 1712
;1712:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+48
CNSTI4 1
ASGNI4
line 1714
;1713:		//trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.weaponHoverSound );
;1714:	}
LABELV $1005
line 1716
;1715:
;1716:	if (!(cent->currentState.eFlags & EF_DROPPEDWEAPON) &&
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
NEI4 $1050
ADDRLP4 268
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 1
EQI4 $1052
ADDRLP4 268
INDIRI4
CNSTI4 5
NEI4 $1050
LABELV $1052
line 1718
;1717:		(item->giType == IT_WEAPON || item->giType == IT_POWERUP))
;1718:	{
line 1719
;1719:		ent.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1720
;1720:	}
LABELV $1050
line 1722
;1721:
;1722:	if (item->giType != IT_TEAM && msec >= 0 && msec < ITEM_SCALEUP_TIME && !(es->eFlags & EF_ITEMPLACEHOLDER) && !(es->eFlags & EF_DROPPEDWEAPON)) 
ADDRLP4 272
CNSTI4 8
ASGNI4
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 272
INDIRI4
EQI4 $1054
ADDRLP4 280
CNSTI4 0
ASGNI4
ADDRLP4 224
INDIRI4
ADDRLP4 280
INDIRI4
LTI4 $1054
ADDRLP4 224
INDIRI4
CNSTI4 1000
GEI4 $1054
ADDRLP4 284
ADDRLP4 216
INDIRP4
ADDRLP4 272
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 4194304
BANDI4
ADDRLP4 280
INDIRI4
NEI4 $1054
ADDRLP4 284
INDIRI4
CNSTI4 16777216
BANDI4
ADDRLP4 280
INDIRI4
NEI4 $1054
line 1723
;1723:	{	// if just respawned, fade in, but don't do this for flags.
line 1727
;1724:		float alpha;
;1725:		int a;
;1726:		
;1727:		alpha = (float)msec / ITEM_SCALEUP_TIME;
ADDRLP4 292
ADDRLP4 224
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 1728
;1728:		a = alpha * 255.0;
ADDRLP4 288
CNSTF4 1132396544
ADDRLP4 292
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1729
;1729:		if (a <= 0)
ADDRLP4 288
INDIRI4
CNSTI4 0
GTI4 $1056
line 1730
;1730:			a=1;
ADDRLP4 288
CNSTI4 1
ASGNI4
LABELV $1056
line 1732
;1731:
;1732:		ent.shaderRGBA[3] = a;
ADDRLP4 0+80+3
ADDRLP4 288
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 1733
;1733:		if (item->giType != IT_POWERUP || item->giTag != PW_FORCE_BOON)
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1062
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 14
EQI4 $1060
LABELV $1062
line 1734
;1734:		{ //boon model uses a different blending mode for the sprite inside and doesn't look proper with this method
line 1735
;1735:			ent.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 1736
;1736:		}
LABELV $1060
line 1737
;1737:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1739
;1738:		
;1739:		ent.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 1745
;1740:	
;1741:		// Now draw the static shader over it.
;1742:		// Alpha in over half the time, out over half.
;1743:		
;1744:		//alpha = sin(M_PI*alpha);
;1745:		a = alpha * 255.0;
ADDRLP4 288
CNSTF4 1132396544
ADDRLP4 292
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1747
;1746:
;1747:		a = 255 - a;
ADDRLP4 288
CNSTI4 255
ADDRLP4 288
INDIRI4
SUBI4
ASGNI4
line 1749
;1748:
;1749:		if (a <= 0)
ADDRLP4 288
INDIRI4
CNSTI4 0
GTI4 $1065
line 1750
;1750:			a=1;
ADDRLP4 288
CNSTI4 1
ASGNI4
LABELV $1065
line 1751
;1751:		if (a > 255)
ADDRLP4 288
INDIRI4
CNSTI4 255
LEI4 $1067
line 1752
;1752:			a=255;
ADDRLP4 288
CNSTI4 255
ASGNI4
LABELV $1067
line 1754
;1753:
;1754:		ent.customShader = cgs.media.itemRespawningRezOut;
ADDRLP4 0+76
ADDRGP4 cgs+70296+484
INDIRI4
ASGNI4
line 1773
;1755:
;1756:		/*
;1757:		ent.shaderRGBA[0] = 0;
;1758:		ent.shaderRGBA[1] = a;
;1759:		ent.shaderRGBA[2] = a-100;
;1760:
;1761:		if (ent.shaderRGBA[2] < 0)
;1762:		{
;1763:			ent.shaderRGBA[2] = 0;
;1764:		}
;1765:		*/
;1766:
;1767:		/*
;1768:		ent.shaderRGBA[0] =
;1769:		ent.shaderRGBA[1] =
;1770:		ent.shaderRGBA[2] = a;
;1771:		*/
;1772:
;1773:		ent.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 1774
;1774:		ent.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 1775
;1775:		ent.shaderRGBA[1] = 200;
ADDRLP4 0+80+1
CNSTU1 200
ASGNU1
line 1776
;1776:		ent.shaderRGBA[2] = 85;
ADDRLP4 0+80+2
CNSTU1 85
ASGNU1
line 1778
;1777:
;1778:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1779
;1779:	}
ADDRGP4 $1055
JUMPV
LABELV $1054
line 1781
;1780:	else
;1781:	{	// add to refresh list  -- normal item
line 1782
;1782:		if (item->giType == IT_TEAM &&
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1078
ADDRLP4 292
ADDRLP4 212
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 4
EQI4 $1080
ADDRLP4 292
INDIRI4
CNSTI4 5
NEI4 $1078
LABELV $1080
line 1784
;1783:			(item->giTag == PW_REDFLAG || item->giTag == PW_BLUEFLAG))
;1784:		{
line 1785
;1785:			ent.modelScale[0] = 0.7;
ADDRLP4 0+196
CNSTF4 1060320051
ASGNF4
line 1786
;1786:			ent.modelScale[1] = 0.7;
ADDRLP4 0+196+4
CNSTF4 1060320051
ASGNF4
line 1787
;1787:			ent.modelScale[2] = 0.7;
ADDRLP4 0+196+8
CNSTF4 1060320051
ASGNF4
line 1788
;1788:			ScaleModelAxis(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 1789
;1789:		}
LABELV $1078
line 1790
;1790:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1791
;1791:	}
LABELV $1055
line 1818
;1792:
;1793:	//rww - As far as I can see, this is useless.
;1794:	/*
;1795:	if ( item->giType == IT_WEAPON && wi->barrelModel ) {
;1796:		refEntity_t	barrel;
;1797:
;1798:		memset( &barrel, 0, sizeof( barrel ) );
;1799:
;1800:		barrel.hModel = wi->barrelModel;
;1801:
;1802:		VectorCopy( ent.lightingOrigin, barrel.lightingOrigin );
;1803:		barrel.shadowPlane = ent.shadowPlane;
;1804:		barrel.renderfx = ent.renderfx;
;1805:
;1806:		barrel.customShader = ent.customShader;
;1807:
;1808:		CG_PositionRotatedEntityOnTag( &barrel, &ent, wi->weaponModel, "tag_barrel" );
;1809:
;1810:		AxisCopy( ent.axis, barrel.axis );
;1811:		barrel.nonNormalizedAxes = ent.nonNormalizedAxes;
;1812:
;1813:		trap_R_AddRefEntityToScene( &barrel );
;1814:	}
;1815:	*/
;1816:
;1817:	// accompanying rings / spheres for powerups
;1818:	if ( !cg_simpleItems.integer ) 
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
NEI4 $1086
line 1819
;1819:	{
line 1822
;1820:		vec3_t spinAngles;
;1821:
;1822:		VectorClear( spinAngles );
ADDRLP4 300
CNSTF4 0
ASGNF4
ADDRLP4 288+8
ADDRLP4 300
INDIRF4
ASGNF4
ADDRLP4 288+4
ADDRLP4 300
INDIRF4
ASGNF4
ADDRLP4 288
ADDRLP4 300
INDIRF4
ASGNF4
line 1824
;1823:
;1824:		if ( item->giType == IT_HEALTH || item->giType == IT_POWERUP )
ADDRLP4 304
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 4
EQI4 $1093
ADDRLP4 304
INDIRI4
CNSTI4 5
NEI4 $1091
LABELV $1093
line 1825
;1825:		{
line 1826
;1826:			if ( ( ent.hModel = cg_items[es->modelindex].models[1] ) != 0 )
ADDRLP4 308
CNSTI4 56
ADDRLP4 216
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+4+4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 308
INDIRI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $1094
line 1827
;1827:			{
line 1828
;1828:				if ( item->giType == IT_POWERUP )
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1099
line 1829
;1829:				{
line 1830
;1830:					ent.origin[2] += 12;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 1831
;1831:					spinAngles[1] = ( cg.time & 1023 ) * 360 / -1024.0f;
ADDRLP4 288+4
CNSTI4 360
ADDRGP4 cg+64
INDIRI4
CNSTI4 1023
BANDI4
MULI4
CVIF4 4
CNSTF4 3296722944
DIVF4
ASGNF4
line 1832
;1832:				}
LABELV $1099
line 1833
;1833:				AnglesToAxis( spinAngles, ent.axis );
ADDRLP4 288
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1835
;1834:				
;1835:				trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1836
;1836:			}
LABELV $1094
line 1837
;1837:		}
LABELV $1091
line 1838
;1838:	}
LABELV $1086
line 1839
;1839:}
LABELV $808
endproc CG_Item 312 12
proc CG_Missile 376 28
line 1848
;1840:
;1841://============================================================================
;1842:
;1843:/*
;1844:===============
;1845:CG_Missile
;1846:===============
;1847:*/
;1848:static void CG_Missile( centity_t *cent ) {
line 1854
;1849:	refEntity_t			ent;
;1850:	entityState_t		*s1;
;1851:	const weaponInfo_t		*weapon;
;1852://	int	col;
;1853:
;1854:	s1 = &cent->currentState;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
line 1855
;1855:	if ( s1->weapon > WP_NUM_WEAPONS && s1->weapon != G2_MODEL_PART ) {
ADDRLP4 220
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 16
LEI4 $1107
ADDRLP4 220
INDIRI4
CNSTI4 50
EQI4 $1107
line 1856
;1856:		s1->weapon = 0;
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 1857
;1857:	}
LABELV $1107
line 1859
;1858:
;1859:	if (cent->ghoul2 && s1->weapon == G2_MODEL_PART)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1109
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 50
NEI4 $1109
line 1860
;1860:	{
line 1861
;1861:		weapon = &cg_weapons[WP_SABER];
ADDRLP4 216
ADDRGP4 cg_weapons+416
ASGNP4
line 1862
;1862:	}
ADDRGP4 $1110
JUMPV
LABELV $1109
line 1864
;1863:	else
;1864:	{
line 1865
;1865:		weapon = &cg_weapons[s1->weapon];
ADDRLP4 216
CNSTI4 208
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1866
;1866:	}
LABELV $1110
line 1868
;1867:
;1868:	if (s1->weapon == WP_SABER)
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1112
line 1869
;1869:	{
line 1870
;1870:		if (!cent->ghoul2 && !(s1->eFlags & EF_NODRAW))
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1114
ADDRLP4 212
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $1114
line 1871
;1871:		{
line 1872
;1872:			trap_G2API_InitGhoul2Model(&cent->ghoul2, "models/weapons2/saber/saber_w.glm", 0, 0, 0, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 $1116
ARGP4
ADDRLP4 224
CNSTI4 0
ASGNI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 1873
;1873:			return;
ADDRGP4 $1106
JUMPV
LABELV $1114
line 1875
;1874:		}
;1875:		else if (s1->eFlags & EF_NODRAW)
ADDRLP4 212
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1117
line 1876
;1876:		{
line 1877
;1877:			return;
ADDRGP4 $1106
JUMPV
LABELV $1117
line 1879
;1878:		}
;1879:	}
LABELV $1112
line 1881
;1880:
;1881:	if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1119
line 1882
;1882:	{ //give us a proper radius
line 1883
;1883:		ent.radius = cent->currentState.g2radius;
ADDRLP4 0+92
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1884
;1884:	}
LABELV $1119
line 1887
;1885:
;1886:	// calculate the axis
;1887:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 212
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1889
;1888:
;1889:	if ( cent->currentState.eFlags & EF_ALT_FIRING )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1122
line 1890
;1890:	{
line 1892
;1891:		// add trails
;1892:		if ( weapon->altMissileTrailFunc )  
ADDRLP4 216
INDIRP4
CNSTI4 168
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1124
line 1893
;1893:			weapon->altMissileTrailFunc( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 216
INDIRP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 168
ADDP4
INDIRP4
CALLV
pop
LABELV $1124
line 1896
;1894:
;1895:		// add dynamic light
;1896:		if ( weapon->altMissileDlight ) 
ADDRLP4 216
INDIRP4
CNSTI4 172
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1126
line 1897
;1897:		{
line 1898
;1898:			trap_R_AddLightToScene(cent->lerpOrigin, weapon->altMissileDlight, 
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 172
ADDP4
INDIRF4
ARGF4
ADDRLP4 216
INDIRP4
CNSTI4 176
ADDP4
INDIRF4
ARGF4
ADDRLP4 216
INDIRP4
CNSTI4 180
ADDP4
INDIRF4
ARGF4
ADDRLP4 216
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1900
;1899:				weapon->altMissileDlightColor[0], weapon->altMissileDlightColor[1], weapon->altMissileDlightColor[2] );
;1900:		}
LABELV $1126
line 1903
;1901:
;1902:		// add missile sound
;1903:		if ( weapon->altMissileSound ) {
ADDRLP4 216
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1128
line 1906
;1904:			vec3_t	velocity;
;1905:
;1906:			BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 1908
;1907:
;1908:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, weapon->altMissileSound );
ADDRLP4 240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
INDIRI4
ARGI4
ADDRLP4 240
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 1909
;1909:		}
LABELV $1128
line 1912
;1910:
;1911:		//Don't draw something without a model
;1912:		if ( weapon->altMissileModel == NULL_HANDLE )
ADDRLP4 216
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1123
line 1913
;1913:			return;
ADDRGP4 $1106
JUMPV
line 1914
;1914:	}
LABELV $1122
line 1916
;1915:	else
;1916:	{
line 1918
;1917:		// add trails
;1918:		if ( weapon->missileTrailFunc )  
ADDRLP4 216
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1133
line 1919
;1919:			weapon->missileTrailFunc( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 216
INDIRP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CALLV
pop
LABELV $1133
line 1922
;1920:
;1921:		// add dynamic light
;1922:		if ( weapon->missileDlight ) 
ADDRLP4 216
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1135
line 1923
;1923:		{
line 1924
;1924:			trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ARGF4
ADDRLP4 216
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ARGF4
ADDRLP4 216
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ARGF4
ADDRLP4 216
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1926
;1925:				weapon->missileDlightColor[0], weapon->missileDlightColor[1], weapon->missileDlightColor[2] );
;1926:		}
LABELV $1135
line 1929
;1927:
;1928:		// add missile sound
;1929:		if ( weapon->missileSound ) 
ADDRLP4 216
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1137
line 1930
;1930:		{
line 1933
;1931:			vec3_t	velocity;
;1932:
;1933:			BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 1935
;1934:
;1935:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, weapon->missileSound );
ADDRLP4 240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
INDIRI4
ARGI4
ADDRLP4 240
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 1936
;1936:		}
LABELV $1137
line 1939
;1937:
;1938:		//Don't draw something without a model
;1939:		if ( weapon->missileModel == NULL_HANDLE && s1->weapon != WP_SABER && s1->weapon != G2_MODEL_PART ) //saber uses ghoul2 model, doesn't matter
ADDRLP4 216
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1140
ADDRLP4 228
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 2
EQI4 $1140
ADDRLP4 228
INDIRI4
CNSTI4 50
EQI4 $1140
line 1940
;1940:			return;
ADDRGP4 $1106
JUMPV
LABELV $1140
line 1941
;1941:	}
LABELV $1123
line 1944
;1942:
;1943:	// create the render entity
;1944:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1945
;1945:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 1946
;1946:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+64
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 1950
;1947:/*
;1948:Ghoul2 Insert Start
;1949:*/
;1950:	CG_SetGhoul2Info(&ent, cent);  
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetGhoul2Info
CALLV
pop
line 1957
;1951:
;1952:/*
;1953:Ghoul2 Insert End
;1954:*/
;1955:
;1956:	// flicker between two skins
;1957:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+132
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 1958
;1958:	ent.renderfx = /*weapon->missileRenderfx | */RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 1960
;1959:
;1960:	if (s1->weapon != WP_SABER && s1->weapon != G2_MODEL_PART)
ADDRLP4 224
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 2
EQI4 $1146
ADDRLP4 224
INDIRI4
CNSTI4 50
EQI4 $1146
line 1961
;1961:	{
line 1964
;1962:		//if ( cent->currentState.eFlags | EF_ALT_FIRING )
;1963:		//rww - why was this like this?
;1964:		if ( cent->currentState.eFlags & EF_ALT_FIRING )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1148
line 1965
;1965:		{
line 1966
;1966:			ent.hModel = weapon->altMissileModel;
ADDRLP4 0+8
ADDRLP4 216
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 1967
;1967:		}
ADDRGP4 $1149
JUMPV
LABELV $1148
line 1969
;1968:		else
;1969:		{
line 1970
;1970:			ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 216
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1971
;1971:		}
LABELV $1149
line 1972
;1972:	}
LABELV $1146
line 1975
;1973:
;1974:	// spin as it moves
;1975:	if ( s1->apos.trType != TR_INTERPOLATE )
ADDRLP4 212
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1152
line 1976
;1976:	{
line 1978
;1977:		// convert direction of travel into axis
;1978:		if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
ADDRLP4 212
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 228
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 228
INDIRF4
CNSTF4 0
NEF4 $1154
line 1979
;1979:			ent.axis[0][2] = 1;
ADDRLP4 0+12+8
CNSTF4 1065353216
ASGNF4
line 1980
;1980:		}
LABELV $1154
line 1983
;1981:
;1982:		// spin as it moves
;1983:		if ( s1->pos.trType != TR_STATIONARY ) 
ADDRLP4 212
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1159
line 1984
;1984:		{
line 1985
;1985:			if ( s1->eFlags & EF_MISSILE_STICK )
ADDRLP4 212
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $1161
line 1986
;1986:			{
line 1987
;1987:				RotateAroundDirection( ent.axis, cg.time * 0.5f );//Did this so regular missiles don't get broken
ADDRLP4 0+12
ARGP4
CNSTF4 1056964608
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 1988
;1988:			}
ADDRGP4 $1153
JUMPV
LABELV $1161
line 1990
;1989:			else
;1990:			{
line 1991
;1991:				RotateAroundDirection( ent.axis, cg.time * 0.25f );//JFM:FLOAT FIX
ADDRLP4 0+12
ARGP4
CNSTF4 1048576000
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 1992
;1992:			}
line 1993
;1993:		} 
ADDRGP4 $1153
JUMPV
LABELV $1159
line 1995
;1994:		else 
;1995:		{
line 1996
;1996:			if ( s1->eFlags & EF_MISSILE_STICK )
ADDRLP4 212
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $1167
line 1997
;1997:			{
line 1998
;1998:				RotateAroundDirection( ent.axis, (float)s1->pos.trTime * 0.5f );
ADDRLP4 0+12
ARGP4
CNSTF4 1056964608
ADDRLP4 212
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 1999
;1999:			}
ADDRGP4 $1153
JUMPV
LABELV $1167
line 2001
;2000:			else
;2001:			{
line 2002
;2002:				RotateAroundDirection( ent.axis, (float)s1->time );
ADDRLP4 0+12
ARGP4
ADDRLP4 212
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 2003
;2003:			}
line 2004
;2004:		}
line 2005
;2005:	}
ADDRGP4 $1153
JUMPV
LABELV $1152
line 2007
;2006:	else
;2007:	{
line 2008
;2008:		AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2009
;2009:	}
LABELV $1153
line 2011
;2010:
;2011:	if (s1->weapon == WP_SABER)
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1172
line 2012
;2012:	{
line 2013
;2013:		ent.radius = s1->g2radius;
ADDRLP4 0+92
ADDRLP4 212
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2014
;2014:	}
LABELV $1172
line 2017
;2015:
;2016:	// add to refresh list, possibly with quad glow
;2017:	CG_AddRefEntityWithPowerups( &ent, s1, TEAM_FREE );
ADDRLP4 0
ARGP4
ADDRLP4 212
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2019
;2018:
;2019:	if (s1->weapon == WP_SABER && cgs.gametype == GT_JEDIMASTER)
ADDRLP4 228
CNSTI4 2
ASGNI4
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 228
INDIRI4
NEI4 $1175
ADDRGP4 cgs+32960
INDIRI4
ADDRLP4 228
INDIRI4
NEI4 $1175
line 2020
;2020:	{ //in jedimaster always make the saber glow when on the ground
line 2028
;2021:		vec3_t org;
;2022:		float wv;
;2023:		int i;
;2024:		addspriteArgStruct_t fxSArgs;
;2025:		//refEntity_t sRef;
;2026:		//memcpy( &sRef, &ent, sizeof( sRef ) );
;2027:
;2028:		ent.customShader = cgs.media.solidWhite;
ADDRLP4 0+76
ADDRGP4 cgs+70296+564
INDIRI4
ASGNI4
line 2029
;2029:		ent.renderfx = RF_RGB_TINT;
ADDRLP4 0+4
CNSTI4 2048
ASGNI4
line 2030
;2030:		wv = sin( cg.time * 0.003f ) * 0.08f + 0.1f;
CNSTF4 994352038
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 324
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 320
CNSTF4 1034147594
ADDRLP4 324
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 2031
;2031:		ent.shaderRGBA[0] = wv * 255;
ADDRLP4 332
CNSTF4 1132396544
ADDRLP4 320
INDIRF4
MULF4
ASGNF4
ADDRLP4 336
CNSTF4 1325400064
ASGNF4
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
LTF4 $1185
ADDRLP4 328
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1186
JUMPV
LABELV $1185
ADDRLP4 328
ADDRLP4 332
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1186
ADDRLP4 0+80
ADDRLP4 328
INDIRU4
CVUU1 4
ASGNU1
line 2032
;2032:		ent.shaderRGBA[1] = wv * 255;
ADDRLP4 344
CNSTF4 1132396544
ADDRLP4 320
INDIRF4
MULF4
ASGNF4
ADDRLP4 348
CNSTF4 1325400064
ASGNF4
ADDRLP4 344
INDIRF4
ADDRLP4 348
INDIRF4
LTF4 $1190
ADDRLP4 340
ADDRLP4 344
INDIRF4
ADDRLP4 348
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1191
JUMPV
LABELV $1190
ADDRLP4 340
ADDRLP4 344
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1191
ADDRLP4 0+80+1
ADDRLP4 340
INDIRU4
CVUU1 4
ASGNU1
line 2033
;2033:		ent.shaderRGBA[2] = wv * 0;
ADDRLP4 356
CNSTF4 0
ADDRLP4 320
INDIRF4
MULF4
ASGNF4
ADDRLP4 360
CNSTF4 1325400064
ASGNF4
ADDRLP4 356
INDIRF4
ADDRLP4 360
INDIRF4
LTF4 $1195
ADDRLP4 352
ADDRLP4 356
INDIRF4
ADDRLP4 360
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1196
JUMPV
LABELV $1195
ADDRLP4 352
ADDRLP4 356
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1196
ADDRLP4 0+80+2
ADDRLP4 352
INDIRU4
CVUU1 4
ASGNU1
line 2034
;2034:		trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2036
;2035:
;2036:		for ( i = -4; i < 10; i += 1 )
ADDRLP4 304
CNSTI4 -4
ASGNI4
LABELV $1197
line 2037
;2037:		{
line 2038
;2038:			VectorMA( ent.origin, -i, ent.axis[2], org );
ADDRLP4 364
ADDRLP4 304
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 308
ADDRLP4 0+52
INDIRF4
ADDRLP4 0+12+24
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 308+4
ADDRLP4 0+52+4
INDIRF4
ADDRLP4 0+12+24+4
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 308+8
ADDRLP4 0+52+8
INDIRF4
ADDRLP4 0+12+24+8
INDIRF4
ADDRLP4 304
INDIRI4
NEGI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2040
;2039:
;2040:			VectorCopy(org, fxSArgs.origin);
ADDRLP4 232
ADDRLP4 308
INDIRB
ASGNB 12
line 2041
;2041:			VectorClear(fxSArgs.vel);
ADDRLP4 368
CNSTF4 0
ASGNF4
ADDRLP4 232+12+8
ADDRLP4 368
INDIRF4
ASGNF4
ADDRLP4 232+12+4
ADDRLP4 368
INDIRF4
ASGNF4
ADDRLP4 232+12
ADDRLP4 368
INDIRF4
ASGNF4
line 2042
;2042:			VectorClear(fxSArgs.accel);
ADDRLP4 372
CNSTF4 0
ASGNF4
ADDRLP4 232+24+8
ADDRLP4 372
INDIRF4
ASGNF4
ADDRLP4 232+24+4
ADDRLP4 372
INDIRF4
ASGNF4
ADDRLP4 232+24
ADDRLP4 372
INDIRF4
ASGNF4
line 2043
;2043:			fxSArgs.scale = 5.5f;
ADDRLP4 232+36
CNSTF4 1085276160
ASGNF4
line 2044
;2044:			fxSArgs.dscale = 5.5f;
ADDRLP4 232+40
CNSTF4 1085276160
ASGNF4
line 2045
;2045:			fxSArgs.sAlpha = wv;
ADDRLP4 232+44
ADDRLP4 320
INDIRF4
ASGNF4
line 2046
;2046:			fxSArgs.eAlpha = wv;
ADDRLP4 232+48
ADDRLP4 320
INDIRF4
ASGNF4
line 2047
;2047:			fxSArgs.rotation = 0.0f;
ADDRLP4 232+52
CNSTF4 0
ASGNF4
line 2048
;2048:			fxSArgs.bounce = 0.0f;
ADDRLP4 232+56
CNSTF4 0
ASGNF4
line 2049
;2049:			fxSArgs.life = 1.0f;
ADDRLP4 232+60
CNSTI4 1
ASGNI4
line 2050
;2050:			fxSArgs.shader = cgs.media.yellowDroppedSaberShader;
ADDRLP4 232+64
ADDRGP4 cgs+70296+168
INDIRI4
ASGNI4
line 2051
;2051:			fxSArgs.flags = 0x08000000;
ADDRLP4 232+68
CNSTI4 134217728
ASGNI4
line 2054
;2052:
;2053:			//trap_FX_AddSprite( org, NULL, NULL, 5.5f, 5.5f, wv, wv, 0.0f, 0.0f, 1.0f, cgs.media.yellowSaberGlowShader, 0x08000000 );
;2054:			trap_FX_AddSprite(&fxSArgs);
ADDRLP4 232
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 2055
;2055:		}
LABELV $1198
line 2036
ADDRLP4 304
ADDRLP4 304
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 10
LTI4 $1197
line 2057
;2056:
;2057:		if (cgs.gametype == GT_JEDIMASTER)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $1237
line 2058
;2058:		{
line 2059
;2059:			ent.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 2060
;2060:			ent.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 2061
;2061:			ent.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 2063
;2062:
;2063:			ent.renderfx |= RF_DEPTHHACK;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2064
;2064:			ent.customShader = cgs.media.forceSightBubble;
ADDRLP4 0+76
ADDRGP4 cgs+70296+492
INDIRI4
ASGNI4
line 2066
;2065:		
;2066:			trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2067
;2067:		}
LABELV $1237
line 2068
;2068:	}
LABELV $1175
line 2070
;2069:
;2070:	if ( s1->eFlags & EF_FIRING )
ADDRLP4 212
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1249
line 2071
;2071:	{//special code for adding the beam to the attached tripwire mine
line 2074
;2072:		vec3_t	beamOrg;
;2073:
;2074:		VectorMA( ent.origin, 8, ent.axis[0], beamOrg );// forward
ADDRLP4 244
CNSTF4 1090519040
ASGNF4
ADDRLP4 232
ADDRLP4 0+52
INDIRF4
ADDRLP4 244
INDIRF4
ADDRLP4 0+12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 232+4
ADDRLP4 0+52+4
INDIRF4
ADDRLP4 244
INDIRF4
ADDRLP4 0+12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 232+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1090519040
ADDRLP4 0+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2075
;2075:		trap_FX_PlayEffect( "tripMine/laser.efx", beamOrg, ent.axis[0] );
ADDRGP4 $1263
ARGP4
ADDRLP4 232
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 trap_FX_PlayEffect
CALLV
pop
line 2076
;2076:	}
LABELV $1249
line 2077
;2077:}
LABELV $1106
endproc CG_Missile 376 28
proc CG_Mover 216 12
line 2084
;2078:
;2079:/*
;2080:===============
;2081:CG_Mover
;2082:===============
;2083:*/
;2084:static void CG_Mover( centity_t *cent ) {
line 2088
;2085:	refEntity_t			ent;
;2086:	entityState_t		*s1;
;2087:
;2088:	s1 = &cent->currentState;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
line 2091
;2089:
;2090:	// create the render entity
;2091:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2092
;2092:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2093
;2093:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+64
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2094
;2094:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2096
;2095:
;2096:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 2101
;2097:/*
;2098:Ghoul2 Insert Start
;2099:*/
;2100:
;2101:	CG_SetGhoul2Info(&ent, cent);  
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetGhoul2Info
CALLV
pop
line 2106
;2102:/*
;2103:Ghoul2 Insert End
;2104:*/
;2105:	// flicker between two skins (FIXME?)
;2106:	ent.skinNum = ( cg.time >> 6 ) & 1;
ADDRLP4 0+132
ADDRGP4 cg+64
INDIRI4
CNSTI4 6
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 2109
;2107:
;2108:	// get the model, either as a bmodel or a modelindex
;2109:	if ( s1->solid == SOLID_BMODEL ) 
ADDRLP4 212
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $1272
line 2110
;2110:	{
line 2111
;2111:		ent.hModel = cgs.inlineDrawModel[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 212
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+38928
ADDP4
INDIRI4
ASGNI4
line 2112
;2112:	} 
ADDRGP4 $1273
JUMPV
LABELV $1272
line 2114
;2113:	else 
;2114:	{
line 2115
;2115:		ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 212
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36364
ADDP4
INDIRI4
ASGNI4
line 2116
;2116:	}
LABELV $1273
line 2119
;2117:
;2118:	// add to refresh list
;2119:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2122
;2120:
;2121:	// add the secondary model
;2122:	if ( s1->modelindex2 ) 
ADDRLP4 212
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1278
line 2123
;2123:	{
line 2124
;2124:		ent.skinNum = 0;
ADDRLP4 0+132
CNSTI4 0
ASGNI4
line 2125
;2125:		ent.hModel = cgs.gameModels[s1->modelindex2];
ADDRLP4 0+8
ADDRLP4 212
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36364
ADDP4
INDIRI4
ASGNI4
line 2126
;2126:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2127
;2127:	}
LABELV $1278
line 2129
;2128:
;2129:}
LABELV $1265
endproc CG_Mover 216 12
export CG_Beam
proc CG_Beam 216 12
line 2138
;2130:
;2131:/*
;2132:===============
;2133:CG_Beam
;2134:
;2135:Also called as an event
;2136:===============
;2137:*/
;2138:void CG_Beam( centity_t *cent ) {
line 2142
;2139:	refEntity_t			ent;
;2140:	entityState_t		*s1;
;2141:
;2142:	s1 = &cent->currentState;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
line 2145
;2143:
;2144:	// create the render entity
;2145:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2146
;2146:	VectorCopy( s1->pos.trBase, ent.origin );
ADDRLP4 0+52
ADDRLP4 212
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2147
;2147:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+64
ADDRLP4 212
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 2148
;2148:	AxisClear( ent.axis );
ADDRLP4 0+12
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 2149
;2149:	ent.reType = RT_BEAM;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 2151
;2150:
;2151:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 2155
;2152:/*
;2153:Ghoul2 Insert Start
;2154:*/
;2155:	CG_SetGhoul2Info(&ent, cent);  
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetGhoul2Info
CALLV
pop
line 2161
;2156:
;2157:/*
;2158:Ghoul2 Insert End
;2159:*/
;2160:	// add to refresh list
;2161:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2162
;2162:}
LABELV $1283
endproc CG_Beam 216 12
proc CG_Portal 216 12
line 2170
;2163:
;2164:
;2165:/*
;2166:===============
;2167:CG_Portal
;2168:===============
;2169:*/
;2170:static void CG_Portal( centity_t *cent ) {
line 2174
;2171:	refEntity_t			ent;
;2172:	entityState_t		*s1;
;2173:
;2174:	s1 = &cent->currentState;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
line 2177
;2175:
;2176:	// create the render entity
;2177:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2178
;2178:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2179
;2179:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+64
ADDRLP4 212
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 2180
;2180:	ByteToDir( s1->eventParm, ent.axis[0] );
ADDRLP4 212
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 2181
;2181:	PerpendicularVector( ent.axis[1], ent.axis[0] );
ADDRLP4 0+12+12
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 2185
;2182:
;2183:	// negating this tends to get the directions like they want
;2184:	// we really should have a camera roll value
;2185:	VectorSubtract( vec3_origin, ent.axis[1], ent.axis[1] );
ADDRLP4 0+12+12
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0+12+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+12+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+12+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+12+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+12+12+8
INDIRF4
SUBF4
ASGNF4
line 2187
;2186:
;2187:	CrossProduct( ent.axis[0], ent.axis[1], ent.axis[2] );
ADDRLP4 0+12
ARGP4
ADDRLP4 0+12+12
ARGP4
ADDRLP4 0+12+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2188
;2188:	ent.reType = RT_PORTALSURFACE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 2189
;2189:	ent.oldframe = s1->powerups;
ADDRLP4 0+124
ADDRLP4 212
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
line 2190
;2190:	ent.frame = s1->frame;		// rotation speed
ADDRLP4 0+104
ADDRLP4 212
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ASGNI4
line 2191
;2191:	ent.skinNum = s1->clientNum/256.0 * 360;	// roll offset
ADDRLP4 0+132
CNSTF4 1135869952
ADDRLP4 212
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
MULF4
CVFI4 4
ASGNI4
line 2195
;2192:/*
;2193:Ghoul2 Insert Start
;2194:*/
;2195:	CG_SetGhoul2Info(&ent, cent);  
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetGhoul2Info
CALLV
pop
line 2200
;2196:/*
;2197:Ghoul2 Insert End
;2198:*/
;2199:	// add to refresh list
;2200:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2201
;2201:}
LABELV $1288
endproc CG_Portal 216 12
export CG_AdjustPositionForMover
proc CG_AdjustPositionForMover 88 12
line 2211
;2202:
;2203:
;2204:/*
;2205:=========================
;2206:CG_AdjustPositionForMover
;2207:
;2208:Also called by client movement prediction code
;2209:=========================
;2210:*/
;2211:void CG_AdjustPositionForMover( const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out ) {
line 2216
;2212:	centity_t	*cent;
;2213:	vec3_t	oldOrigin, origin, deltaOrigin;
;2214:	vec3_t	oldAngles, angles, deltaAngles;
;2215:
;2216:	if ( moverNum <= 0 || moverNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LEI4 $1324
ADDRLP4 76
INDIRI4
CNSTI4 1022
LTI4 $1322
LABELV $1324
line 2217
;2217:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 2218
;2218:		return;
ADDRGP4 $1321
JUMPV
LABELV $1322
line 2221
;2219:	}
;2220:
;2221:	cent = &cg_entities[ moverNum ];
ADDRLP4 0
CNSTI4 1920
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2222
;2222:	if ( cent->currentState.eType != ET_MOVER ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
EQI4 $1325
line 2223
;2223:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 2224
;2224:		return;
ADDRGP4 $1321
JUMPV
LABELV $1325
line 2227
;2225:	}
;2226:
;2227:	BG_EvaluateTrajectory( &cent->currentState.pos, fromTime, oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2228
;2228:	BG_EvaluateTrajectory( &cent->currentState.apos, fromTime, oldAngles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2230
;2229:
;2230:	BG_EvaluateTrajectory( &cent->currentState.pos, toTime, origin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2231
;2231:	BG_EvaluateTrajectory( &cent->currentState.apos, toTime, angles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2233
;2232:
;2233:	VectorSubtract( origin, oldOrigin, deltaOrigin );
ADDRLP4 4
ADDRLP4 28
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 2234
;2234:	VectorSubtract( angles, oldAngles, deltaAngles );
ADDRLP4 64
ADDRLP4 52
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 52+4
INDIRF4
ADDRLP4 40+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 52+8
INDIRF4
ADDRLP4 40+8
INDIRF4
SUBF4
ASGNF4
line 2236
;2235:
;2236:	VectorAdd( in, deltaOrigin, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDF4
ASGNF4
line 2239
;2237:
;2238:	// FIXME: origin change when on a rotating object
;2239:}
LABELV $1321
endproc CG_AdjustPositionForMover 88 12
proc LerpBoneAngleOverrides 0 0
line 2245
;2240:
;2241:/*
;2242:Ghoul2 Insert Start
;2243:*/
;2244:static void LerpBoneAngleOverrides( centity_t *cent)
;2245:{
line 2247
;2246:	
;2247:}
LABELV $1341
endproc LerpBoneAngleOverrides 0 0
proc CG_InterpolateEntityPosition 44 12
line 2256
;2248:/*
;2249:Ghoul2 Insert End
;2250:*/
;2251:/*
;2252:=============================
;2253:CG_InterpolateEntityPosition
;2254:=============================
;2255:*/
;2256:static void CG_InterpolateEntityPosition( centity_t *cent ) {
line 2262
;2257:	vec3_t		current, next;
;2258:	float		f;
;2259:
;2260:	// it would be an internal error to find an entity that interpolates without
;2261:	// a snapshot ahead of the current one
;2262:	if ( cg.nextSnap == NULL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1343
line 2263
;2263:		CG_Error( "CG_InterpoateEntityPosition: cg.nextSnap == NULL" );
ADDRGP4 $1346
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2264
;2264:	}
LABELV $1343
line 2266
;2265:
;2266:	f = cg.frameInterpolation;
ADDRLP4 24
ADDRGP4 cg+44
INDIRF4
ASGNF4
line 2270
;2267:
;2268:	// this will linearize a sine or parabolic curve, but it is important
;2269:	// to not extrapolate player positions if more recent data is available
;2270:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, current );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2271
;2271:	BG_EvaluateTrajectory( &cent->nextState.pos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 308
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2273
;2272:
;2273:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
ADDRLP4 28
ADDRLP4 0
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 2274
;2274:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 2275
;2275:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 2277
;2276:
;2277:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.snap->serverTime, current );
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2278
;2278:	BG_EvaluateTrajectory( &cent->nextState.apos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2280
;2279:
;2280:	cent->lerpAngles[0] = LerpAngle( current[0], next[0], f );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2281
;2281:	cent->lerpAngles[1] = LerpAngle( current[1], next[1], f );
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 2282
;2282:	cent->lerpAngles[2] = LerpAngle( current[2], next[2], f );
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
line 2288
;2283:/*
;2284:Ghoul2 Insert Start
;2285:*/
;2286:		// now the nasty stuff - this will interpolate all ghoul2 models bone angle overrides per model attached to this cent
;2287://	if (cent->currentState.ghoul2.size())
;2288:	{
line 2289
;2289:		LerpBoneAngleOverrides(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 LerpBoneAngleOverrides
CALLV
pop
line 2290
;2290:	}
line 2294
;2291:/*
;2292:Ghoul2 Insert End
;2293:*/
;2294:}
LABELV $1342
endproc CG_InterpolateEntityPosition 44 12
export CG_CalcEntityLerpPositions
proc CG_CalcEntityLerpPositions 24 20
line 2302
;2295:
;2296:/*
;2297:===============
;2298:CG_CalcEntityLerpPositions
;2299:
;2300:===============
;2301:*/
;2302:void CG_CalcEntityLerpPositions( centity_t *cent ) {
line 2305
;2303:
;2304:	// if this player does not want to see extrapolated players
;2305:	if ( !cg_smoothClients.integer ) {
ADDRGP4 cg_smoothClients+12
INDIRI4
CNSTI4 0
NEI4 $1363
line 2307
;2306:		// make sure the clients use TR_INTERPOLATE
;2307:		if ( cent->currentState.number < MAX_CLIENTS ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $1366
line 2308
;2308:			cent->currentState.pos.trType = TR_INTERPOLATE;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 2309
;2309:			cent->nextState.pos.trType = TR_INTERPOLATE;
ADDRFP4 0
INDIRP4
CNSTI4 308
ADDP4
CNSTI4 1
ASGNI4
line 2310
;2310:		}
LABELV $1366
line 2311
;2311:	}
LABELV $1363
line 2313
;2312:
;2313:	if ( cent->interpolate && cent->currentState.pos.trType == TR_INTERPOLATE ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1368
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1368
line 2314
;2314:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 2315
;2315:		return;
ADDRGP4 $1362
JUMPV
LABELV $1368
line 2320
;2316:	}
;2317:
;2318:	// first see if we can interpolate between two snaps for
;2319:	// linear extrapolated clients
;2320:	if ( cent->interpolate && cent->currentState.pos.trType == TR_LINEAR_STOP &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1370
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1370
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $1370
line 2321
;2321:											cent->currentState.number < MAX_CLIENTS) {
line 2322
;2322:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 2323
;2323:		return;
ADDRGP4 $1362
JUMPV
LABELV $1370
line 2327
;2324:	}
;2325:
;2326:	// just use the current frame and evaluate as best we can
;2327:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2328
;2328:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2332
;2329:
;2330:	// adjust for riding a mover if it wasn't rolled into the predicted
;2331:	// player state
;2332:	if ( cent != &cg.predictedPlayerEntity ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg+1476
CVPU4 4
EQU4 $1374
line 2333
;2333:		CG_AdjustPositionForMover( cent->lerpOrigin, cent->currentState.groundEntityNum, 
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 2335
;2334:		cg.snap->serverTime, cg.time, cent->lerpOrigin );
;2335:	}
LABELV $1374
line 2341
;2336:/*
;2337:Ghoul2 Insert Start
;2338:*/
;2339:	// now the nasty stuff - this will interpolate all ghoul2 models bone angle overrides per model attached to this cent
;2340://	if (cent->currentState.ghoul2.size())
;2341:	{
line 2342
;2342:		LerpBoneAngleOverrides(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 LerpBoneAngleOverrides
CALLV
pop
line 2343
;2343:	}
line 2347
;2344:/*
;2345:Ghoul2 Insert End
;2346:*/
;2347:}
LABELV $1362
endproc CG_CalcEntityLerpPositions 24 20
proc CG_TeamBase 212 12
line 2354
;2348:
;2349:/*
;2350:===============
;2351:CG_TeamBase
;2352:===============
;2353:*/
;2354:static void CG_TeamBase( centity_t *cent ) {
line 2356
;2355:	refEntity_t model;
;2356:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_CTY ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
EQI4 $1384
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1380
LABELV $1384
line 2358
;2357:		// show the flag base
;2358:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2359
;2359:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2360
;2360:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
ADDRLP4 0+108
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2361
;2361:		VectorCopy( cent->lerpOrigin, model.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2362
;2362:		AnglesToAxis( cent->currentState.angles, model.axis );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2363
;2363:		if ( cent->currentState.modelindex == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1388
line 2364
;2364:			model.hModel = cgs.media.redFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+84
INDIRI4
ASGNI4
line 2365
;2365:		}
ADDRGP4 $1389
JUMPV
LABELV $1388
line 2366
;2366:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1393
line 2367
;2367:			model.hModel = cgs.media.blueFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+88
INDIRI4
ASGNI4
line 2368
;2368:		}
ADDRGP4 $1394
JUMPV
LABELV $1393
line 2369
;2369:		else {
line 2370
;2370:			model.hModel = cgs.media.neutralFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+92
INDIRI4
ASGNI4
line 2371
;2371:		}
LABELV $1394
LABELV $1389
line 2373
;2372:
;2373:		if (cent->currentState.eType != ET_GRAPPLE)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
EQI4 $1401
line 2374
;2374:		{ //do not do this for g2animents
line 2375
;2375:			trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2376
;2376:		}
LABELV $1401
line 2377
;2377:	}
LABELV $1380
line 2378
;2378:}
LABELV $1379
endproc CG_TeamBase 212 12
proc CG_AddCEntity 12 12
line 2388
;2379:
;2380:void CG_G2Animated( centity_t *cent );
;2381:
;2382:/*
;2383:===============
;2384:CG_AddCEntity
;2385:
;2386:===============
;2387:*/
;2388:static void CG_AddCEntity( centity_t *cent ) {
line 2390
;2389:	// event-only entities will have been dealt with already
;2390:	if ( cent->currentState.eType >= ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 16
LTI4 $1404
line 2391
;2391:		return;
ADDRGP4 $1403
JUMPV
LABELV $1404
line 2395
;2392:	}
;2393:
;2394:	// calculate the current origin
;2395:	CG_CalcEntityLerpPositions( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 2398
;2396:
;2397:	// add automatic effects
;2398:	CG_EntityEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_EntityEffects
CALLV
pop
line 2404
;2399:/*
;2400:Ghoul2 Insert Start
;2401:*/
;2402:
;2403:	// do this before we copy the data to refEnts
;2404:	if (trap_G2_HaveWeGhoul2Models(cent->ghoul2))
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1406
line 2405
;2405:	{
line 2406
;2406:		trap_G2_SetGhoul2ModelIndexes(cent->ghoul2, cgs.gameModels, cgs.skins);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRGP4 cgs+36364
ARGP4
ADDRGP4 cgs+38668
ARGP4
ADDRGP4 trap_G2_SetGhoul2ModelIndexes
CALLV
pop
line 2407
;2407:	}
LABELV $1406
line 2412
;2408:
;2409:/*
;2410:Ghoul2 Insert End
;2411:*/
;2412:	switch ( cent->currentState.eType ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1410
ADDRLP4 4
INDIRI4
CNSTI4 15
GTI4 $1410
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1428
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1428
address $1415
address $1416
address $1417
address $1418
address $1419
address $1420
address $1421
address $1422
address $1423
address $1424
address $1411
address $1411
address $1411
address $1425
address $1426
address $1427
code
LABELV $1410
line 2414
;2413:	default:
;2414:		CG_Error( "Bad entity type: %i\n", cent->currentState.eType );
ADDRGP4 $1413
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 2415
;2415:		break;
ADDRGP4 $1411
JUMPV
line 2419
;2416:	case ET_INVISIBLE:
;2417:	case ET_PUSH_TRIGGER:
;2418:	case ET_TELEPORT_TRIGGER:
;2419:		break;
LABELV $1415
line 2421
;2420:	case ET_GENERAL:
;2421:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 2422
;2422:		break;
ADDRGP4 $1411
JUMPV
LABELV $1416
line 2424
;2423:	case ET_PLAYER:
;2424:		CG_Player( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Player
CALLV
pop
line 2425
;2425:		break;
ADDRGP4 $1411
JUMPV
LABELV $1417
line 2427
;2426:	case ET_ITEM:
;2427:		CG_Item( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Item
CALLV
pop
line 2428
;2428:		break;
ADDRGP4 $1411
JUMPV
LABELV $1418
line 2430
;2429:	case ET_MISSILE:
;2430:		CG_Missile( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Missile
CALLV
pop
line 2431
;2431:		break;
ADDRGP4 $1411
JUMPV
LABELV $1419
line 2433
;2432:	case ET_SPECIAL:
;2433:		CG_Special( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Special
CALLV
pop
line 2434
;2434:		break;
ADDRGP4 $1411
JUMPV
LABELV $1420
line 2436
;2435:	case ET_HOLOCRON:
;2436:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 2437
;2437:		break;
ADDRGP4 $1411
JUMPV
LABELV $1421
line 2439
;2438:	case ET_MOVER:
;2439:		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 2440
;2440:		break;
ADDRGP4 $1411
JUMPV
LABELV $1422
line 2442
;2441:	case ET_BEAM:
;2442:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 2443
;2443:		break;
ADDRGP4 $1411
JUMPV
LABELV $1423
line 2445
;2444:	case ET_PORTAL:
;2445:		CG_Portal( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Portal
CALLV
pop
line 2446
;2446:		break;
ADDRGP4 $1411
JUMPV
LABELV $1424
line 2448
;2447:	case ET_SPEAKER:
;2448:		CG_Speaker( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Speaker
CALLV
pop
line 2449
;2449:		break;
ADDRGP4 $1411
JUMPV
LABELV $1425
line 2451
;2450:	case ET_GRAPPLE: //An entity that wants to be able to use ghoul2 humanoid anims. Like a player, but not.
;2451:		CG_G2Animated( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_G2Animated
CALLV
pop
LABELV $1426
line 2453
;2452:	case ET_TEAM:
;2453:		CG_TeamBase( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TeamBase
CALLV
pop
line 2454
;2454:		break;
ADDRGP4 $1411
JUMPV
LABELV $1427
line 2456
;2455:	case ET_BODY:
;2456:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 2457
;2457:		break;
LABELV $1411
line 2459
;2458:	}
;2459:}
LABELV $1403
endproc CG_AddCEntity 12 12
export CG_ManualEntityRender
proc CG_ManualEntityRender 0 4
line 2462
;2460:
;2461:void CG_ManualEntityRender(centity_t *cent)
;2462:{
line 2463
;2463:	CG_AddCEntity(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 2464
;2464:}
LABELV $1429
endproc CG_ManualEntityRender 0 4
export CG_AddPacketEntities
proc CG_AddPacketEntities 20 12
line 2472
;2465:
;2466:/*
;2467:===============
;2468:CG_AddPacketEntities
;2469:
;2470:===============
;2471:*/
;2472:void CG_AddPacketEntities( void ) {
line 2478
;2473:	int					num;
;2474:	centity_t			*cent;
;2475:	playerState_t		*ps;
;2476:
;2477:	// set cg.frameInterpolation
;2478:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1431
line 2481
;2479:		int		delta;
;2480:
;2481:		delta = (cg.nextSnap->serverTime - cg.snap->serverTime);
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2482
;2482:		if ( delta == 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1436
line 2483
;2483:			cg.frameInterpolation = 0;
ADDRGP4 cg+44
CNSTF4 0
ASGNF4
line 2484
;2484:		} else {
ADDRGP4 $1432
JUMPV
LABELV $1436
line 2485
;2485:			cg.frameInterpolation = (float)( cg.time - cg.snap->serverTime ) / delta;
ADDRGP4 cg+44
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 12
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 2486
;2486:		}
line 2487
;2487:	} else {
ADDRGP4 $1432
JUMPV
LABELV $1431
line 2488
;2488:		cg.frameInterpolation = 0;	// actually, it should never be used, because 
ADDRGP4 cg+44
CNSTF4 0
ASGNF4
line 2490
;2489:									// no entities should be marked as interpolating
;2490:	}
LABELV $1432
line 2493
;2491:
;2492:	// the auto-rotating items will all have the same axis
;2493:	cg.autoAngles[0] = 0;
ADDRGP4 cg+3520
CNSTF4 0
ASGNF4
line 2494
;2494:	cg.autoAngles[1] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRGP4 cg+3520+4
CNSTI4 360
ADDRGP4 cg+64
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 2495
;2495:	cg.autoAngles[2] = 0;
ADDRGP4 cg+3520+8
CNSTF4 0
ASGNF4
line 2497
;2496:
;2497:	cg.autoAnglesFast[0] = 0;
ADDRGP4 cg+3568
CNSTF4 0
ASGNF4
line 2498
;2498:	cg.autoAnglesFast[1] = ( cg.time & 1023 ) * 360 / 1024.0f;
ADDRGP4 cg+3568+4
CNSTI4 360
ADDRGP4 cg+64
INDIRI4
CNSTI4 1023
BANDI4
MULI4
CVIF4 4
CNSTF4 1149239296
DIVF4
ASGNF4
line 2499
;2499:	cg.autoAnglesFast[2] = 0;
ADDRGP4 cg+3568+8
CNSTF4 0
ASGNF4
line 2501
;2500:
;2501:	AnglesToAxis( cg.autoAngles, cg.autoAxis );
ADDRGP4 cg+3520
ARGP4
ADDRGP4 cg+3532
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2502
;2502:	AnglesToAxis( cg.autoAnglesFast, cg.autoAxisFast );
ADDRGP4 cg+3568
ARGP4
ADDRGP4 cg+3580
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2505
;2503:
;2504:	// generate and add the entity from the playerstate
;2505:	ps = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+96
ASGNP4
line 2511
;2506:
;2507:	//rww - update the g2 pointer BEFORE the weapons, otherwise bad things could happen
;2508:	//FIXME: These two pointers seem to differ sometimes, they shouldn't, should they?
;2509:	//the one on predictedPlayerEntity also seems to often be invalid, so it can't be
;2510:	//reliably checked and cleared.
;2511:	cg.predictedPlayerEntity.ghoul2 = cg_entities[ cg.snap->ps.clientNum].ghoul2;
ADDRGP4 cg+1476+952
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ASGNP4
line 2512
;2512:	CG_CheckPlayerG2Weapons(ps, &cg.predictedPlayerEntity);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 cg+1476
ARGP4
ADDRGP4 CG_CheckPlayerG2Weapons
CALLV
pop
line 2513
;2513:	BG_PlayerStateToEntityState( ps, &cg.predictedPlayerEntity.currentState, qfalse );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 cg+1476
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2516
;2514:	
;2515:	// add in the Ghoul2 stuff.
;2516:	VectorCopy( cg_entities[ cg.snap->ps.clientNum].modelScale, cg.predictedPlayerEntity.modelScale);
ADDRGP4 cg+1476+964
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+964
ADDP4
INDIRB
ASGNB 12
line 2517
;2517:	cg.predictedPlayerEntity.radius = cg_entities[ cg.snap->ps.clientNum].radius;
ADDRGP4 cg+1476+976
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+976
ADDP4
INDIRF4
ASGNF4
line 2519
;2518:
;2519:	CG_AddCEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+1476
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 2522
;2520:
;2521:	// lerp the non-predicted value for lightning gun origins
;2522:	CG_CalcEntityLerpPositions( &cg_entities[ cg.snap->ps.clientNum ] );
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 2525
;2523:
;2524:	// add each entity sent over by the server
;2525:	for ( num = 0 ; num < cg.snap->numEntities ; num++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1479
JUMPV
LABELV $1476
line 2527
;2526:		// Don't re-add ents that have been predicted.
;2527:		if (cg.snap->entities[ num ].number != cg.snap->ps.clientNum)
CNSTI4 296
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1428
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $1481
line 2528
;2528:		{
line 2529
;2529:			cent = &cg_entities[ cg.snap->entities[ num ].number ];
ADDRLP4 4
CNSTI4 1920
CNSTI4 296
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1428
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2530
;2530:			CG_AddCEntity( cent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 2531
;2531:		}
LABELV $1481
line 2532
;2532:	}
LABELV $1477
line 2525
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1479
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1424
ADDP4
INDIRI4
LTI4 $1476
line 2533
;2533:}
LABELV $1430
endproc CG_AddPacketEntities 20 12
export CG_ROFF_NotetrackCallback
proc CG_ROFF_NotetrackCallback 1736 16
line 2536
;2534:
;2535:void CG_ROFF_NotetrackCallback( centity_t *cent, const char *notetrack)
;2536:{
line 2537
;2537:	int i = 0, r = 0, objectID = 0, anglesGathered = 0, posoffsetGathered = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRLP4 1372
CNSTI4 0
ASGNI4
ADDRLP4 1368
CNSTI4 0
ASGNI4
ADDRLP4 584
CNSTI4 0
ASGNI4
line 2543
;2538:	char type[256];
;2539:	char argument[512];
;2540:	char addlArg[512];
;2541:	char errMsg[256];
;2542:	char t[64];
;2543:	int addlArgs = 0;
ADDRLP4 1388
CNSTI4 0
ASGNI4
line 2546
;2544:	vec3_t parsedAngles, parsedOffset, useAngles, useOrigin, forward, right, up;
;2545:
;2546:	if (!cent || !notetrack)
ADDRLP4 1708
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 1708
INDIRU4
EQU4 $1489
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 1708
INDIRU4
NEU4 $1491
LABELV $1489
line 2547
;2547:	{
line 2548
;2548:		return;
ADDRGP4 $1486
JUMPV
LABELV $1490
line 2554
;2549:	}
;2550:
;2551:	//notetrack = "effect effects/explosion1.efx 0+0+64 0-0-1";
;2552:
;2553:	while (notetrack[i] && notetrack[i] != ' ')
;2554:	{
line 2555
;2555:		type[i] = notetrack[i];
ADDRLP4 0
INDIRI4
ADDRLP4 600
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 2556
;2556:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2557
;2557:	}
LABELV $1491
line 2553
ADDRLP4 1712
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1712
INDIRI4
CNSTI4 0
EQI4 $1493
ADDRLP4 1712
INDIRI4
CNSTI4 32
NEI4 $1490
LABELV $1493
line 2559
;2558:
;2559:	type[i] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 600
ADDP4
CNSTI1 0
ASGNI1
line 2561
;2560:
;2561:	if (notetrack[i] != ' ')
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $1494
line 2562
;2562:	{ //didn't pass in a valid notetrack type, or forgot the argument for it
line 2563
;2563:		return;
ADDRGP4 $1486
JUMPV
LABELV $1494
line 2566
;2564:	}
;2565:
;2566:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $1497
JUMPV
LABELV $1496
line 2569
;2567:
;2568:	while (notetrack[i] && notetrack[i] != ' ')
;2569:	{
line 2570
;2570:		argument[r] = notetrack[i];
ADDRLP4 516
INDIRI4
ADDRLP4 856
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 2571
;2571:		r++;
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2572
;2572:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2573
;2573:	}
LABELV $1497
line 2568
ADDRLP4 1716
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1716
INDIRI4
CNSTI4 0
EQI4 $1499
ADDRLP4 1716
INDIRI4
CNSTI4 32
NEI4 $1496
LABELV $1499
line 2574
;2574:	argument[r] = '\0';
ADDRLP4 516
INDIRI4
ADDRLP4 856
ADDP4
CNSTI1 0
ASGNI1
line 2576
;2575:
;2576:	if (!r)
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $1500
line 2577
;2577:	{
line 2578
;2578:		return;
ADDRGP4 $1486
JUMPV
LABELV $1500
line 2581
;2579:	}
;2580:
;2581:	if (notetrack[i] == ' ')
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $1502
line 2582
;2582:	{ //additional arguments...
line 2583
;2583:		addlArgs = 1;
ADDRLP4 1388
CNSTI4 1
ASGNI4
line 2585
;2584:
;2585:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2586
;2586:		r = 0;
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $1505
JUMPV
LABELV $1504
line 2588
;2587:		while (notetrack[i])
;2588:		{
line 2589
;2589:			addlArg[r] = notetrack[i];
ADDRLP4 516
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 2590
;2590:			r++;
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2591
;2591:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2592
;2592:		}
LABELV $1505
line 2587
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1504
line 2593
;2593:		addlArg[r] = '\0';
ADDRLP4 516
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 2594
;2594:	}
LABELV $1502
line 2596
;2595:
;2596:	if (strcmp(type, "effect") == 0)
ADDRLP4 600
ARGP4
ADDRGP4 $1509
ARGP4
ADDRLP4 1720
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1720
INDIRI4
CNSTI4 0
NEI4 $1507
line 2597
;2597:	{
line 2598
;2598:		if (!addlArgs)
ADDRLP4 1388
INDIRI4
CNSTI4 0
NEI4 $1510
line 2599
;2599:		{
line 2602
;2600:			//sprintf(errMsg, "Offset position argument for 'effect' type is invalid.");
;2601:			//goto functionend;
;2602:			VectorClear(parsedOffset);
ADDRLP4 1724
CNSTF4 0
ASGNF4
ADDRLP4 588+8
ADDRLP4 1724
INDIRF4
ASGNF4
ADDRLP4 588+4
ADDRLP4 1724
INDIRF4
ASGNF4
ADDRLP4 588
ADDRLP4 1724
INDIRF4
ASGNF4
line 2603
;2603:			goto defaultoffsetposition;
ADDRGP4 $1514
JUMPV
LABELV $1510
line 2606
;2604:		}
;2605:
;2606:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1516
JUMPV
LABELV $1515
line 2609
;2607:
;2608:		while (posoffsetGathered < 3)
;2609:		{
line 2610
;2610:			r = 0;
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $1519
JUMPV
LABELV $1518
line 2612
;2611:			while (addlArg[i] && addlArg[i] != '+' && addlArg[i] != ' ')
;2612:			{
line 2613
;2613:				t[r] = addlArg[i];
ADDRLP4 516
INDIRI4
ADDRLP4 520
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
ASGNI1
line 2614
;2614:				r++;
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2615
;2615:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2616
;2616:			}
LABELV $1519
line 2611
ADDRLP4 1724
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1724
INDIRI4
CNSTI4 0
EQI4 $1522
ADDRLP4 1724
INDIRI4
CNSTI4 43
EQI4 $1522
ADDRLP4 1724
INDIRI4
CNSTI4 32
NEI4 $1518
LABELV $1522
line 2617
;2617:			t[r] = '\0';
ADDRLP4 516
INDIRI4
ADDRLP4 520
ADDP4
CNSTI1 0
ASGNI1
line 2618
;2618:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2619
;2619:			if (!r)
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $1523
line 2620
;2620:			{ //failure..
line 2623
;2621:				//sprintf(errMsg, "Offset position argument for 'effect' type is invalid.");
;2622:				//goto functionend;
;2623:				VectorClear(parsedOffset);
ADDRLP4 1728
CNSTF4 0
ASGNF4
ADDRLP4 588+8
ADDRLP4 1728
INDIRF4
ASGNF4
ADDRLP4 588+4
ADDRLP4 1728
INDIRF4
ASGNF4
ADDRLP4 588
ADDRLP4 1728
INDIRF4
ASGNF4
line 2624
;2624:				i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2625
;2625:				goto defaultoffsetposition;
ADDRGP4 $1514
JUMPV
LABELV $1523
line 2627
;2626:			}
;2627:			parsedOffset[posoffsetGathered] = atof(t);
ADDRLP4 520
ARGP4
ADDRLP4 1728
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 584
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 588
ADDP4
ADDRLP4 1728
INDIRF4
ASGNF4
line 2628
;2628:			posoffsetGathered++;
ADDRLP4 584
ADDRLP4 584
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2629
;2629:		}
LABELV $1516
line 2608
ADDRLP4 584
INDIRI4
CNSTI4 3
LTI4 $1515
line 2631
;2630:
;2631:		if (posoffsetGathered < 3)
ADDRLP4 584
INDIRI4
CNSTI4 3
GEI4 $1527
line 2632
;2632:		{
line 2633
;2633:			Com_sprintf(errMsg, sizeof(errMsg), "Offset position argument for 'effect' type is invalid.");
ADDRLP4 1392
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1529
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2634
;2634:			goto functionend;
ADDRGP4 $1530
JUMPV
LABELV $1527
line 2637
;2635:		}
;2636:
;2637:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2639
;2638:
;2639:		if (addlArg[i] != ' ')
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $1531
line 2640
;2640:		{
line 2641
;2641:			addlArgs = 0;
ADDRLP4 1388
CNSTI4 0
ASGNI4
line 2642
;2642:		}
LABELV $1531
LABELV $1514
line 2646
;2643:
;2644:defaultoffsetposition:
;2645:
;2646:		objectID = trap_FX_RegisterEffect(argument);
ADDRLP4 856
ARGP4
ADDRLP4 1724
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1372
ADDRLP4 1724
INDIRI4
ASGNI4
line 2648
;2647:
;2648:		if (objectID)
ADDRLP4 1372
INDIRI4
CNSTI4 0
EQI4 $1486
line 2649
;2649:		{
line 2650
;2650:			if (addlArgs)
ADDRLP4 1388
INDIRI4
CNSTI4 0
EQI4 $1535
line 2651
;2651:			{ //if there is an additional argument for an effect it is expected to be XANGLE-YANGLE-ZANGLE
line 2652
;2652:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $1538
JUMPV
LABELV $1537
line 2654
;2653:				while (anglesGathered < 3)
;2654:				{
line 2655
;2655:					r = 0;
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $1541
JUMPV
LABELV $1540
line 2657
;2656:					while (addlArg[i] && addlArg[i] != '-')
;2657:					{
line 2658
;2658:						t[r] = addlArg[i];
ADDRLP4 516
INDIRI4
ADDRLP4 520
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
ASGNI1
line 2659
;2659:						r++;
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2660
;2660:						i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2661
;2661:					}
LABELV $1541
line 2656
ADDRLP4 1728
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1728
INDIRI4
CNSTI4 0
EQI4 $1543
ADDRLP4 1728
INDIRI4
CNSTI4 45
NEI4 $1540
LABELV $1543
line 2662
;2662:					t[r] = '\0';
ADDRLP4 516
INDIRI4
ADDRLP4 520
ADDP4
CNSTI1 0
ASGNI1
line 2663
;2663:					i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2665
;2664:
;2665:					if (!r)
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $1544
line 2666
;2666:					{ //failed to get a new part of the vector
line 2667
;2667:						anglesGathered = 0;
ADDRLP4 1368
CNSTI4 0
ASGNI4
line 2668
;2668:						break;
ADDRGP4 $1539
JUMPV
LABELV $1544
line 2671
;2669:					}
;2670:
;2671:					parsedAngles[anglesGathered] = atof(t);
ADDRLP4 520
ARGP4
ADDRLP4 1732
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1368
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1648
ADDP4
ADDRLP4 1732
INDIRF4
ASGNF4
line 2672
;2672:					anglesGathered++;
ADDRLP4 1368
ADDRLP4 1368
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2673
;2673:				}
LABELV $1538
line 2653
ADDRLP4 1368
INDIRI4
CNSTI4 3
LTI4 $1537
LABELV $1539
line 2675
;2674:
;2675:				if (anglesGathered)
ADDRLP4 1368
INDIRI4
CNSTI4 0
EQI4 $1546
line 2676
;2676:				{
line 2677
;2677:					VectorCopy(parsedAngles, useAngles);
ADDRLP4 1696
ADDRLP4 1648
INDIRB
ASGNB 12
line 2678
;2678:				}
ADDRGP4 $1536
JUMPV
LABELV $1546
line 2680
;2679:				else
;2680:				{ //failed to parse angles from the extra argument provided..
line 2681
;2681:					VectorCopy(cent->lerpAngles, useAngles);
ADDRLP4 1696
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2682
;2682:				}
line 2683
;2683:			}
ADDRGP4 $1536
JUMPV
LABELV $1535
line 2685
;2684:			else
;2685:			{ //if no constant angles, play in direction entity is facing
line 2686
;2686:				VectorCopy(cent->lerpAngles, useAngles);
ADDRLP4 1696
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2687
;2687:			}
LABELV $1536
line 2689
;2688:
;2689:			AngleVectors(useAngles, forward, right, up);
ADDRLP4 1696
ARGP4
ADDRLP4 1660
ARGP4
ADDRLP4 1672
ARGP4
ADDRLP4 1684
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2691
;2690:
;2691:			VectorCopy(cent->lerpOrigin, useOrigin);
ADDRLP4 1376
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2694
;2692:
;2693:			//forward
;2694:			useOrigin[0] += forward[0]*parsedOffset[0];
ADDRLP4 1376
ADDRLP4 1376
INDIRF4
ADDRLP4 1660
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ADDF4
ASGNF4
line 2695
;2695:			useOrigin[1] += forward[1]*parsedOffset[0];
ADDRLP4 1376+4
ADDRLP4 1376+4
INDIRF4
ADDRLP4 1660+4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ADDF4
ASGNF4
line 2696
;2696:			useOrigin[2] += forward[2]*parsedOffset[0];
ADDRLP4 1376+8
ADDRLP4 1376+8
INDIRF4
ADDRLP4 1660+8
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ADDF4
ASGNF4
line 2699
;2697:
;2698:			//right
;2699:			useOrigin[0] += right[0]*parsedOffset[1];
ADDRLP4 1376
ADDRLP4 1376
INDIRF4
ADDRLP4 1672
INDIRF4
ADDRLP4 588+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2700
;2700:			useOrigin[1] += right[1]*parsedOffset[1];
ADDRLP4 1376+4
ADDRLP4 1376+4
INDIRF4
ADDRLP4 1672+4
INDIRF4
ADDRLP4 588+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2701
;2701:			useOrigin[2] += right[2]*parsedOffset[1];
ADDRLP4 1376+8
ADDRLP4 1376+8
INDIRF4
ADDRLP4 1672+8
INDIRF4
ADDRLP4 588+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2704
;2702:
;2703:			//up
;2704:			useOrigin[0] += up[0]*parsedOffset[2];
ADDRLP4 1376
ADDRLP4 1376
INDIRF4
ADDRLP4 1684
INDIRF4
ADDRLP4 588+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2705
;2705:			useOrigin[1] += up[1]*parsedOffset[2];
ADDRLP4 1376+4
ADDRLP4 1376+4
INDIRF4
ADDRLP4 1684+4
INDIRF4
ADDRLP4 588+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2706
;2706:			useOrigin[2] += up[2]*parsedOffset[2];
ADDRLP4 1376+8
ADDRLP4 1376+8
INDIRF4
ADDRLP4 1684+8
INDIRF4
ADDRLP4 588+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2708
;2707:
;2708:			trap_FX_PlayEffectID(objectID, useOrigin, useAngles);
ADDRLP4 1372
INDIRI4
ARGI4
ADDRLP4 1376
ARGP4
ADDRLP4 1696
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 2709
;2709:		}
line 2710
;2710:	}
ADDRGP4 $1486
JUMPV
LABELV $1507
line 2711
;2711:	else if (strcmp(type, "sound") == 0)
ADDRLP4 600
ARGP4
ADDRGP4 $1568
ARGP4
ADDRLP4 1724
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1724
INDIRI4
CNSTI4 0
NEI4 $1566
line 2712
;2712:	{
line 2713
;2713:		objectID = trap_S_RegisterSound(argument);
ADDRLP4 856
ARGP4
ADDRLP4 1728
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 1372
ADDRLP4 1728
INDIRI4
ASGNI4
line 2714
;2714:		trap_S_StartSound(cent->lerpOrigin, cent->currentState.number, CHAN_BODY, objectID);
ADDRLP4 1732
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1732
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 1732
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1372
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2715
;2715:	}
ADDRGP4 $1486
JUMPV
LABELV $1566
line 2716
;2716:	else if (strcmp(type, "loop") == 0)
ADDRLP4 600
ARGP4
ADDRGP4 $1571
ARGP4
ADDRLP4 1728
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1728
INDIRI4
CNSTI4 0
NEI4 $1569
line 2717
;2717:	{ //handled server-side
line 2718
;2718:		return;
ADDRGP4 $1486
JUMPV
LABELV $1569
line 2722
;2719:	}
;2720:	//else if ...
;2721:	else
;2722:	{
line 2723
;2723:		if (type[0])
ADDRLP4 600
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1572
line 2724
;2724:		{
line 2725
;2725:			Com_Printf("^3Warning: \"%s\" is an invalid ROFF notetrack function\n", type);
ADDRGP4 $1574
ARGP4
ADDRLP4 600
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2726
;2726:		}
ADDRGP4 $1486
JUMPV
LABELV $1572
line 2728
;2727:		else
;2728:		{
line 2729
;2729:			Com_Printf("^3Warning: Notetrack is missing function and/or arguments\n");
ADDRGP4 $1575
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2730
;2730:		}
line 2731
;2731:	}
line 2733
;2732:
;2733:	return;
ADDRGP4 $1486
JUMPV
LABELV $1530
line 2736
;2734:
;2735:functionend:
;2736:	Com_Printf("^3Type-specific notetrack error: %s\n", errMsg);
ADDRGP4 $1576
ARGP4
ADDRLP4 1392
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2737
;2737:	return;
LABELV $1486
endproc CG_ROFF_NotetrackCallback 1736 16
import CG_G2Animated
import g2WeaponInstances
import CG_CheckPlayerG2Weapons
import CG_CopyG2WeaponInstance
import CG_ShutDownG2Weapons
import CG_InitG2Weapons
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
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
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
LABELV $1576
char 1 94
char 1 51
char 1 84
char 1 121
char 1 112
char 1 101
char 1 45
char 1 115
char 1 112
char 1 101
char 1 99
char 1 105
char 1 102
char 1 105
char 1 99
char 1 32
char 1 110
char 1 111
char 1 116
char 1 101
char 1 116
char 1 114
char 1 97
char 1 99
char 1 107
char 1 32
char 1 101
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $1575
char 1 94
char 1 51
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 78
char 1 111
char 1 116
char 1 101
char 1 116
char 1 114
char 1 97
char 1 99
char 1 107
char 1 32
char 1 105
char 1 115
char 1 32
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 102
char 1 117
char 1 110
char 1 99
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 97
char 1 110
char 1 100
char 1 47
char 1 111
char 1 114
char 1 32
char 1 97
char 1 114
char 1 103
char 1 117
char 1 109
char 1 101
char 1 110
char 1 116
char 1 115
char 1 10
char 1 0
align 1
LABELV $1574
char 1 94
char 1 51
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 32
char 1 105
char 1 115
char 1 32
char 1 97
char 1 110
char 1 32
char 1 105
char 1 110
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 82
char 1 79
char 1 70
char 1 70
char 1 32
char 1 110
char 1 111
char 1 116
char 1 101
char 1 116
char 1 114
char 1 97
char 1 99
char 1 107
char 1 32
char 1 102
char 1 117
char 1 110
char 1 99
char 1 116
char 1 105
char 1 111
char 1 110
char 1 10
char 1 0
align 1
LABELV $1571
char 1 108
char 1 111
char 1 111
char 1 112
char 1 0
align 1
LABELV $1568
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $1529
char 1 79
char 1 102
char 1 102
char 1 115
char 1 101
char 1 116
char 1 32
char 1 112
char 1 111
char 1 115
char 1 105
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 97
char 1 114
char 1 103
char 1 117
char 1 109
char 1 101
char 1 110
char 1 116
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 39
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 39
char 1 32
char 1 116
char 1 121
char 1 112
char 1 101
char 1 32
char 1 105
char 1 115
char 1 32
char 1 105
char 1 110
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 46
char 1 0
align 1
LABELV $1509
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $1413
char 1 66
char 1 97
char 1 100
char 1 32
char 1 101
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 32
char 1 116
char 1 121
char 1 112
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $1346
char 1 67
char 1 71
char 1 95
char 1 73
char 1 110
char 1 116
char 1 101
char 1 114
char 1 112
char 1 111
char 1 97
char 1 116
char 1 101
char 1 69
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 80
char 1 111
char 1 115
char 1 105
char 1 116
char 1 105
char 1 111
char 1 110
char 1 58
char 1 32
char 1 99
char 1 103
char 1 46
char 1 110
char 1 101
char 1 120
char 1 116
char 1 83
char 1 110
char 1 97
char 1 112
char 1 32
char 1 61
char 1 61
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 0
align 1
LABELV $1263
char 1 116
char 1 114
char 1 105
char 1 112
char 1 77
char 1 105
char 1 110
char 1 101
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1116
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
LABELV $894
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 109
char 1 112
char 1 95
char 1 100
char 1 97
char 1 114
char 1 107
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 95
char 1 100
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $892
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 109
char 1 112
char 1 95
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 95
char 1 100
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $840
char 1 109
char 1 112
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 99
char 1 111
char 1 110
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $811
char 1 66
char 1 97
char 1 100
char 1 32
char 1 105
char 1 116
char 1 101
char 1 109
char 1 32
char 1 105
char 1 110
char 1 100
char 1 101
char 1 120
char 1 32
char 1 37
char 1 105
char 1 32
char 1 111
char 1 110
char 1 32
char 1 101
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $522
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 105
char 1 109
char 1 112
char 1 95
char 1 109
char 1 105
char 1 110
char 1 101
char 1 47
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 95
char 1 99
char 1 104
char 1 97
char 1 105
char 1 114
char 1 95
char 1 100
char 1 109
char 1 103
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $506
char 1 103
char 1 102
char 1 120
char 1 47
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 100
char 1 105
char 1 101
char 1 0
align 1
LABELV $480
char 1 108
char 1 111
char 1 119
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
LABELV $445
char 1 66
char 1 111
char 1 110
char 1 101
char 1 48
char 1 50
char 1 0
align 1
LABELV $350
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 115
char 1 109
char 1 111
char 1 107
char 1 101
char 1 95
char 1 98
char 1 111
char 1 108
char 1 116
char 1 111
char 1 110
char 1 0
align 1
LABELV $342
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $340
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
LABELV $338
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
LABELV $321
char 1 42
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $320
char 1 42
char 1 114
char 1 95
char 1 108
char 1 101
char 1 103
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 104
char 1 105
char 1 112
char 1 115
char 1 0
align 1
LABELV $319
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 108
char 1 101
char 1 103
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $318
char 1 114
char 1 95
char 1 108
char 1 101
char 1 103
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $317
char 1 114
char 1 95
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $316
char 1 114
char 1 116
char 1 105
char 1 98
char 1 105
char 1 97
char 1 0
align 1
LABELV $315
char 1 114
char 1 102
char 1 101
char 1 109
char 1 117
char 1 114
char 1 89
char 1 90
char 1 0
align 1
LABELV $312
char 1 42
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 108
char 1 95
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $311
char 1 42
char 1 108
char 1 95
char 1 108
char 1 101
char 1 103
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 104
char 1 105
char 1 112
char 1 115
char 1 0
align 1
LABELV $310
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 108
char 1 95
char 1 108
char 1 101
char 1 103
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $309
char 1 108
char 1 95
char 1 108
char 1 101
char 1 103
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $308
char 1 108
char 1 95
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $307
char 1 108
char 1 116
char 1 105
char 1 98
char 1 105
char 1 97
char 1 0
align 1
LABELV $306
char 1 108
char 1 102
char 1 101
char 1 109
char 1 117
char 1 114
char 1 89
char 1 90
char 1 0
align 1
LABELV $303
char 1 42
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $302
char 1 42
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $301
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $300
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $299
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $298
char 1 114
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $297
char 1 114
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 88
char 1 0
align 1
LABELV $294
char 1 42
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $293
char 1 42
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 0
align 1
LABELV $292
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $291
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $290
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $289
char 1 114
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $288
char 1 114
char 1 104
char 1 117
char 1 109
char 1 101
char 1 114
char 1 117
char 1 115
char 1 0
align 1
LABELV $285
char 1 42
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $284
char 1 42
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 0
align 1
LABELV $283
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $282
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $281
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $280
char 1 108
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $279
char 1 108
char 1 104
char 1 117
char 1 109
char 1 101
char 1 114
char 1 117
char 1 115
char 1 0
align 1
LABELV $276
char 1 42
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 0
align 1
LABELV $275
char 1 42
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 104
char 1 105
char 1 112
char 1 115
char 1 0
align 1
LABELV $274
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $273
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $272
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 0
align 1
LABELV $271
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
LABELV $270
char 1 112
char 1 101
char 1 108
char 1 118
char 1 105
char 1 115
char 1 0
align 1
LABELV $267
char 1 42
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 104
char 1 101
char 1 97
char 1 100
char 1 0
align 1
LABELV $266
char 1 42
char 1 104
char 1 101
char 1 97
char 1 100
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 0
align 1
LABELV $265
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 104
char 1 101
char 1 97
char 1 100
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $264
char 1 104
char 1 101
char 1 97
char 1 100
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $263
char 1 104
char 1 101
char 1 97
char 1 100
char 1 0
align 1
LABELV $262
char 1 99
char 1 114
char 1 97
char 1 110
char 1 105
char 1 117
char 1 109
char 1 0
align 1
LABELV $261
char 1 99
char 1 101
char 1 114
char 1 118
char 1 105
char 1 99
char 1 97
char 1 108
char 1 0
align 1
LABELV $235
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 116
char 1 104
char 1 114
char 1 111
char 1 119
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $234
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $233
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $232
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 115
char 1 105
char 1 103
char 1 104
char 1 116
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $231
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 100
char 1 107
char 1 95
char 1 100
char 1 114
char 1 97
char 1 105
char 1 110
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $230
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 100
char 1 107
char 1 95
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $229
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 108
char 1 116
char 1 95
char 1 104
char 1 101
char 1 97
char 1 108
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $228
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 108
char 1 116
char 1 95
char 1 97
char 1 98
char 1 115
char 1 111
char 1 114
char 1 98
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $227
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 108
char 1 116
char 1 95
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $226
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 100
char 1 107
char 1 95
char 1 114
char 1 97
char 1 103
char 1 101
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $225
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 100
char 1 107
char 1 95
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 110
char 1 105
char 1 110
char 1 103
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $224
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 100
char 1 107
char 1 95
char 1 103
char 1 114
char 1 105
char 1 112
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $223
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 108
char 1 116
char 1 95
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 97
char 1 116
char 1 104
char 1 121
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $222
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 112
char 1 117
char 1 108
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $221
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 112
char 1 117
char 1 115
char 1 104
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $220
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $219
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 106
char 1 117
char 1 109
char 1 112
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $218
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 108
char 1 116
char 1 95
char 1 104
char 1 101
char 1 97
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $179
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 98
char 1 108
char 1 117
char 1 101
char 1 95
char 1 112
char 1 111
char 1 114
char 1 116
char 1 97
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $178
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 98
char 1 108
char 1 117
char 1 101
char 1 95
char 1 100
char 1 109
char 1 103
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $175
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 114
char 1 101
char 1 100
char 1 95
char 1 112
char 1 111
char 1 114
char 1 116
char 1 97
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $174
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 114
char 1 101
char 1 100
char 1 95
char 1 100
char 1 109
char 1 103
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $156
char 1 99
char 1 108
char 1 95
char 1 112
char 1 97
char 1 117
char 1 115
char 1 101
char 1 100
char 1 0
