export CreepToPosition
code
proc CreepToPosition 44 0
file "../cg_turret.c"
line 13
;1:#include "cg_local.h"
;2:#if MAC_PORT
;3:#include "../game/q_shared.h"
;4:#include "../ghoul2/g2.h"
;5:#else
;6:#include "..\game\q_shared.h"
;7:#include "..\ghoul2\g2.h"
;8:#endif
;9:
;10://rww - The turret is heavily dependant on bone angles. We can't happily set that on the server, so it is done client-only.
;11:
;12:void CreepToPosition(vec3_t ideal, vec3_t current)
;13:{
line 14
;14:	float max_degree_switch = 90;
ADDRLP4 8
CNSTF4 1119092736
ASGNF4
line 15
;15:	int degrees_negative = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 16
;16:	int degrees_positive = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 17
;17:	int doNegative = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 22
;18:
;19:	int angle_ideal;
;20:	int angle_current;
;21:
;22:	angle_ideal = (int)ideal[YAW];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 23
;23:	angle_current = (int)current[YAW];
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 25
;24:
;25:	if (angle_ideal <= angle_current)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $121
line 26
;26:	{
line 27
;27:		degrees_negative = (angle_current - angle_ideal);
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 29
;28:
;29:		degrees_positive = (360 - angle_current) + angle_ideal;
ADDRLP4 16
CNSTI4 360
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 30
;30:	}
ADDRGP4 $122
JUMPV
LABELV $121
line 32
;31:	else
;32:	{
line 33
;33:		degrees_negative = angle_current + (360 - angle_ideal);
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 360
ADDRLP4 0
INDIRI4
SUBI4
ADDI4
ASGNI4
line 35
;34:
;35:		degrees_positive = (angle_ideal - angle_current);
ADDRLP4 16
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 36
;36:	}
LABELV $122
line 38
;37:
;38:	if (degrees_negative < degrees_positive)
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $123
line 39
;39:	{
line 40
;40:		doNegative = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 41
;41:	}
LABELV $123
line 43
;42:
;43:	if (doNegative)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $125
line 44
;44:	{
line 45
;45:		current[YAW] -= max_degree_switch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 47
;46:
;47:		if (current[YAW] < ideal[YAW] && (current[YAW]+(max_degree_switch*2)) >= ideal[YAW])
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
GEF4 $127
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ADDRLP4 36
INDIRF4
LTF4 $127
line 48
;48:		{
line 49
;49:			current[YAW] = ideal[YAW];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 50
;50:		}
LABELV $127
line 52
;51:
;52:		if (current[YAW] < 0)
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $126
line 53
;53:		{
line 54
;54:			current[YAW] += 361;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1135902720
ADDF4
ASGNF4
line 55
;55:		}
line 56
;56:	}
ADDRGP4 $126
JUMPV
LABELV $125
line 58
;57:	else
;58:	{
line 59
;59:		current[YAW] += max_degree_switch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 61
;60:
;61:		if (current[YAW] > ideal[YAW] && (current[YAW]-(max_degree_switch*2)) <= ideal[YAW])
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LEF4 $131
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
ADDRLP4 8
INDIRF4
MULF4
SUBF4
ADDRLP4 36
INDIRF4
GTF4 $131
line 62
;62:		{
line 63
;63:			current[YAW] = ideal[YAW];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 64
;64:		}
LABELV $131
line 66
;65:
;66:		if (current[YAW] > 360)
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1135869952
LEF4 $133
line 67
;67:		{
line 68
;68:			current[YAW] -= 361;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1135902720
SUBF4
ASGNF4
line 69
;69:		}
LABELV $133
line 70
;70:	}
LABELV $126
line 72
;71:
;72:	if (ideal[PITCH] < 0)
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
GEF4 $135
line 73
;73:	{
line 74
;74:		ideal[PITCH] += 360;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 75
;75:	}
LABELV $135
line 77
;76:
;77:	angle_ideal = (int)ideal[PITCH];
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
CVFI4 4
ASGNI4
line 78
;78:	angle_current = (int)current[PITCH];
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRF4
CVFI4 4
ASGNI4
line 80
;79:
;80:	doNegative = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 82
;81:
;82:	if (angle_ideal <= angle_current)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $137
line 83
;83:	{
line 84
;84:		degrees_negative = (angle_current - angle_ideal);
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 86
;85:
;86:		degrees_positive = (360 - angle_current) + angle_ideal;
ADDRLP4 16
CNSTI4 360
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 87
;87:	}
ADDRGP4 $138
JUMPV
LABELV $137
line 89
;88:	else
;89:	{
line 90
;90:		degrees_negative = angle_current + (360 - angle_ideal);
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 360
ADDRLP4 0
INDIRI4
SUBI4
ADDI4
ASGNI4
line 92
;91:
;92:		degrees_positive = (angle_ideal - angle_current);
ADDRLP4 16
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 93
;93:	}
LABELV $138
line 95
;94:
;95:	if (degrees_negative < degrees_positive)
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $139
line 96
;96:	{
line 97
;97:		doNegative = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 98
;98:	}
LABELV $139
line 100
;99:
;100:	if (doNegative)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $141
line 101
;101:	{
line 102
;102:		current[PITCH] -= max_degree_switch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 104
;103:
;104:		if (current[PITCH] < ideal[PITCH] && (current[PITCH]+(max_degree_switch*2)) >= ideal[PITCH])
ADDRLP4 28
ADDRFP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRF4
GEF4 $143
ADDRLP4 28
INDIRF4
CNSTF4 1073741824
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ADDRLP4 32
INDIRF4
LTF4 $143
line 105
;105:		{
line 106
;106:			current[PITCH] = ideal[PITCH];
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 107
;107:		}
LABELV $143
line 109
;108:
;109:		if (current[PITCH] < 0)
ADDRFP4 4
INDIRP4
INDIRF4
CNSTF4 0
GEF4 $142
line 110
;110:		{
line 111
;111:			current[PITCH] += 361;
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1135902720
ADDF4
ASGNF4
line 112
;112:		}
line 113
;113:	}
ADDRGP4 $142
JUMPV
LABELV $141
line 115
;114:	else
;115:	{
line 116
;116:		current[PITCH] += max_degree_switch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 118
;117:
;118:		if (current[PITCH] > ideal[PITCH] && (current[PITCH]-(max_degree_switch*2)) <= ideal[PITCH])
ADDRLP4 28
ADDRFP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRF4
LEF4 $147
ADDRLP4 28
INDIRF4
CNSTF4 1073741824
ADDRLP4 8
INDIRF4
MULF4
SUBF4
ADDRLP4 32
INDIRF4
GTF4 $147
line 119
;119:		{
line 120
;120:			current[PITCH] = ideal[PITCH];
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 121
;121:		}
LABELV $147
line 123
;122:
;123:		if (current[PITCH] > 360)
ADDRFP4 4
INDIRP4
INDIRF4
CNSTF4 1135869952
LEF4 $149
line 124
;124:		{
line 125
;125:			current[PITCH] -= 361;
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1135902720
SUBF4
ASGNF4
line 126
;126:		}
LABELV $149
line 127
;127:	}
LABELV $142
line 128
;128:}
LABELV $120
endproc CreepToPosition 44 0
export TurretClientRun
proc TurretClientRun 92 44
line 131
;129:
;130:void TurretClientRun(centity_t *ent)
;131:{
line 132
;132:	if (!ent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $152
line 133
;133:	{
line 136
;134:		weaponInfo_t	*weaponInfo;
;135:
;136:		trap_G2API_InitGhoul2Model(&ent->ghoul2, CG_ConfigString( CS_MODELS+ent->currentState.modelindex ), 0, 0, 0, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 138
;137:
;138:		if (!ent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $154
line 139
;139:		{ //bad
line 140
;140:			return;
ADDRGP4 $151
JUMPV
LABELV $154
line 143
;141:		}
;142:
;143:		ent->torsoBolt = trap_G2API_AddBolt( ent->ghoul2, 0, "*flash02" );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $156
ARGP4
ADDRLP4 16
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 145
;144:
;145:		trap_G2API_SetBoneAngles( ent->ghoul2, 0, "bone_hinge", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_Y, POSITIVE_Z, POSITIVE_X, NULL, 100, cg.time ); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $157
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 20
CNSTI4 2
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 146
;146:		trap_G2API_SetBoneAngles( ent->ghoul2, 0, "bone_gback", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_Y, POSITIVE_Z, POSITIVE_X, NULL, 100, cg.time ); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $159
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 24
CNSTI4 2
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 147
;147:		trap_G2API_SetBoneAngles( ent->ghoul2, 0, "bone_barrel", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_Y, POSITIVE_Z, POSITIVE_X, NULL, 100, cg.time ); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $161
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 149
;148:
;149:		trap_G2API_SetBoneAnim( ent->ghoul2, 0, "model_root", 0, 11, BONE_ANIM_OVERRIDE_FREEZE, 0.8f, cg.time, 0, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 $163
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 11
ARGI4
CNSTI4 72
ARGI4
CNSTF4 1061997773
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 151
;150:
;151:		ent->turAngles[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
CNSTF4 0
ASGNF4
line 152
;152:		ent->turAngles[PITCH] = 90;
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
CNSTF4 1119092736
ASGNF4
line 153
;153:		ent->turAngles[YAW] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
CNSTF4 0
ASGNF4
line 155
;154:
;155:		weaponInfo = &cg_weapons[WP_TURRET];
ADDRLP4 0
ADDRGP4 cg_weapons+3120
ASGNP4
line 157
;156:
;157:		if ( !weaponInfo->registered )
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $166
line 158
;158:		{
line 159
;159:			memset( weaponInfo, 0, sizeof( *weaponInfo ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 memset
CALLP4
pop
line 161
;160:
;161:			weaponInfo->flashSound[0]		= NULL_SOUND;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 0
ASGNI4
line 162
;162:			weaponInfo->firingSound			= NULL_SOUND;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 163
;163:			weaponInfo->chargeSound			= NULL_SOUND;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 164
;164:			weaponInfo->muzzleEffect		= NULL_HANDLE;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 165
;165:			weaponInfo->missileModel		= NULL_HANDLE;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 166
;166:			weaponInfo->missileSound		= NULL_SOUND;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTI4 0
ASGNI4
line 167
;167:			weaponInfo->missileDlight		= 0;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
CNSTF4 0
ASGNF4
line 168
;168:			weaponInfo->missileHitSound		= NULL_SOUND;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 169
;169:			weaponInfo->missileTrailFunc	= FX_TurretProjectileThink;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 FX_TurretProjectileThink
ASGNP4
line 171
;170:
;171:			cgs.effects.turretShotEffect		= trap_FX_RegisterEffect( "turret/shot" );
ADDRGP4 $170
ARGP4
ADDRLP4 36
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRGP4 cgs+71564+164
ADDRLP4 36
INDIRI4
ASGNI4
line 172
;172:			trap_FX_RegisterEffect("effects/blaster/wall_impact.efx");
ADDRGP4 $171
ARGP4
ADDRGP4 trap_FX_RegisterEffect
CALLI4
pop
line 173
;173:			trap_FX_RegisterEffect("effects/blaster/flesh_impact.efx");
ADDRGP4 $172
ARGP4
ADDRGP4 trap_FX_RegisterEffect
CALLI4
pop
line 175
;174:
;175:			weaponInfo->registered = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 176
;176:		}
LABELV $166
line 177
;177:	}
LABELV $152
line 179
;178:
;179:	if (ent->currentState.fireflag == 2)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 2
NEI4 $173
line 180
;180:	{ //I'm about to blow
line 181
;181:		if (ent->turAngles)
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
CVPU4 4
CNSTU4 0
EQU4 $151
line 182
;182:		{
line 183
;183:			trap_G2API_SetBoneAngles( ent->ghoul2, 0, "bone_hinge", ent->turAngles, BONE_ANGLES_REPLACE, NEGATIVE_Y, NEGATIVE_Z, NEGATIVE_X, NULL, 100, cg.time ); 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $157
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 184
;184:		}
line 185
;185:		return;
ADDRGP4 $151
JUMPV
LABELV $173
line 187
;186:	}
;187:	else if (ent->currentState.fireflag && ent->bolt4 != ent->currentState.fireflag)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $178
ADDRLP4 0
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $178
line 188
;188:	{
line 192
;189:		vec3_t muzzleOrg, muzzleDir;
;190:		mdxaBone_t boltMatrix;
;191:
;192:		trap_G2API_GetBoltMatrix(ent->ghoul2, 0, ent->torsoBolt, &boltMatrix, /*ent->lerpAngles*/vec3_origin, ent->lerpOrigin, cg.time, cgs.gameModels, ent->modelScale);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 80
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 193
;193:		trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, muzzleOrg);
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 194
;194:		trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, NEGATIVE_X, muzzleDir);
ADDRLP4 8
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 68
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 196
;195:
;196:		trap_FX_PlayEffectID(trap_FX_RegisterEffect("effects/turret/muzzle_flash.efx"), muzzleOrg, muzzleDir);
ADDRGP4 $182
ARGP4
ADDRLP4 84
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 198
;197:
;198:		ent->bolt4 = ent->currentState.fireflag;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 199
;199:	}
ADDRGP4 $179
JUMPV
LABELV $178
line 200
;200:	else if (!ent->currentState.fireflag)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $183
line 201
;201:	{
line 202
;202:		ent->bolt4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 0
ASGNI4
line 203
;203:	}
LABELV $183
LABELV $179
line 205
;204:
;205:	if (ent->currentState.bolt2 != ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $185
line 206
;206:	{ //turn toward the enemy
line 207
;207:		centity_t *enemy = &cg_entities[ent->currentState.bolt2];
ADDRLP4 8
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 209
;208:
;209:		if (enemy)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $186
line 210
;210:		{
line 214
;211:			vec3_t enAng;
;212:			vec3_t enPos;
;213:
;214:			VectorCopy(enemy->currentState.pos.trBase, enPos);
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 216
;215:
;216:			VectorSubtract(enPos, ent->lerpOrigin, enAng);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
SUBF4
ASGNF4
line 217
;217:			VectorNormalize(enAng);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 218
;218:			vectoangles(enAng, enAng);
ADDRLP4 12
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 219
;219:			enAng[ROLL] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 220
;220:			enAng[PITCH] += 90;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 222
;221:
;222:			CreepToPosition(enAng, ent->turAngles);
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRGP4 CreepToPosition
CALLV
pop
line 223
;223:		}
line 224
;224:	}
ADDRGP4 $186
JUMPV
LABELV $185
line 226
;225:	else
;226:	{
line 230
;227:		vec3_t idleAng;
;228:		float turnAmount;
;229:
;230:		if (ent->turAngles[YAW] > 360)
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
CNSTF4 1135869952
LEF4 $194
line 231
;231:		{
line 232
;232:			ent->turAngles[YAW] -= 361;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135902720
SUBF4
ASGNF4
line 233
;233:		}
LABELV $194
line 235
;234:
;235:		if (!ent->dustTrailTime)
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
NEI4 $196
line 236
;236:		{
line 237
;237:			ent->dustTrailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 238
;238:		}
LABELV $196
line 240
;239:
;240:		turnAmount = (cg.time-ent->dustTrailTime)*0.03;
ADDRLP4 20
CNSTF4 1022739087
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 242
;241:
;242:		if (turnAmount > 360)
ADDRLP4 20
INDIRF4
CNSTF4 1135869952
LEF4 $200
line 243
;243:		{
line 244
;244:			turnAmount = 360;
ADDRLP4 20
CNSTF4 1135869952
ASGNF4
line 245
;245:		}
LABELV $200
line 247
;246:
;247:		idleAng[PITCH] = 90;
ADDRLP4 8
CNSTF4 1119092736
ASGNF4
line 248
;248:		idleAng[ROLL] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 249
;249:		idleAng[YAW] = ent->turAngles[YAW] + turnAmount;
ADDRLP4 8+4
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 250
;250:		ent->dustTrailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 252
;251:
;252:		CreepToPosition(idleAng, ent->turAngles);
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRGP4 CreepToPosition
CALLV
pop
line 253
;253:	}
LABELV $186
line 255
;254:
;255:	if (cg.time < ent->frame_minus1_refreshed)
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
GEI4 $205
line 256
;256:	{
line 257
;257:		ent->frame_minus1_refreshed = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 258
;258:		return;
ADDRGP4 $151
JUMPV
LABELV $205
line 261
;259:	}
;260:
;261:	ent->frame_minus1_refreshed = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 262
;262:	trap_G2API_SetBoneAngles( ent->ghoul2, 0, "bone_hinge", ent->turAngles, BONE_ANGLES_REPLACE, NEGATIVE_Y, NEGATIVE_Z, NEGATIVE_X, NULL, 100, cg.time ); 
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $157
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 12
CNSTI4 4
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 263
;263:}
LABELV $151
endproc TurretClientRun 92 44
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
LABELV $182
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
char 1 47
char 1 109
char 1 117
char 1 122
char 1 122
char 1 108
char 1 101
char 1 95
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $172
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 102
char 1 108
char 1 101
char 1 115
char 1 104
char 1 95
char 1 105
char 1 109
char 1 112
char 1 97
char 1 99
char 1 116
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $171
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 119
char 1 97
char 1 108
char 1 108
char 1 95
char 1 105
char 1 109
char 1 112
char 1 97
char 1 99
char 1 116
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $170
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 47
char 1 115
char 1 104
char 1 111
char 1 116
char 1 0
align 1
LABELV $163
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
LABELV $161
char 1 98
char 1 111
char 1 110
char 1 101
char 1 95
char 1 98
char 1 97
char 1 114
char 1 114
char 1 101
char 1 108
char 1 0
align 1
LABELV $159
char 1 98
char 1 111
char 1 110
char 1 101
char 1 95
char 1 103
char 1 98
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $157
char 1 98
char 1 111
char 1 110
char 1 101
char 1 95
char 1 104
char 1 105
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $156
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 48
char 1 50
char 1 0
