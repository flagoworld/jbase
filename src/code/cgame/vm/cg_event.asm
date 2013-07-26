bss
align 1
LABELV $130
skip 64
export CG_PlaceString
code
proc CG_PlaceString 116 20
file "../cg_event.c"
line 29
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;4:
;5:#include "cg_local.h"
;6:#include "fx_local.h"
;7:#if MAC_PORT
;8:#include "../ghoul2/g2.h"
;9:#else
;10:#include "..\ghoul2\g2.h"
;11:#endif
;12:#include "../ui/ui_shared.h"
;13:
;14:// for the voice chats
;15:#include "../../ui/menudef.h"
;16://==========================================================================
;17:
;18:extern int g_saberFlashTime;
;19:extern vec3_t g_saberFlashPos;
;20:extern char *showPowersName[];
;21:
;22:/*
;23:===================
;24:CG_PlaceString
;25:
;26:Also called by scoreboard drawing
;27:===================
;28:*/
;29:const char	*CG_PlaceString( int rank ) {
line 40
;30:	static char	str[64];
;31:	char	*s, *t;
;32:	// number extenstions, eg 1st, 2nd, 3rd, 4th etc.
;33:	// note that the rules are different for french, but by changing the required strip strings they seem to work
;34:	char sST[10];
;35:	char sND[10];
;36:	char sRD[10];
;37:	char sTH[10];
;38:	char sTiedFor[64];	// german is much longer, super safe...
;39:
;40:	trap_SP_GetStringTextString("INGAMETEXT_NUMBER_ST",sST, sizeof(sST) );
ADDRGP4 $131
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 41
;41:	trap_SP_GetStringTextString("INGAMETEXT_NUMBER_ND",sND, sizeof(sND) );
ADDRGP4 $132
ARGP4
ADDRLP4 74
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 42
;42:	trap_SP_GetStringTextString("INGAMETEXT_NUMBER_RD",sRD, sizeof(sRD) );
ADDRGP4 $133
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 43
;43:	trap_SP_GetStringTextString("INGAMETEXT_NUMBER_TH",sTH, sizeof(sTH) );
ADDRGP4 $134
ARGP4
ADDRLP4 94
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 44
;44:	trap_SP_GetStringTextString("INGAMETEXT_TIED_FOR" ,sTiedFor,sizeof(sTiedFor) );
ADDRGP4 $135
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 45
;45:	strcat(sTiedFor," ");	// save worrying about translators adding spaces or not
ADDRLP4 0
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 47
;46:
;47:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $137
line 48
;48:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 49
;49:		t = sTiedFor;//"Tied for ";
ADDRLP4 108
ADDRLP4 0
ASGNP4
line 50
;50:	} else {
ADDRGP4 $138
JUMPV
LABELV $137
line 51
;51:		t = "";
ADDRLP4 108
ADDRGP4 $139
ASGNP4
line 52
;52:	}
LABELV $138
line 54
;53:
;54:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $140
line 55
;55:		s = va("1%s",sST);//S_COLOR_BLUE "1st" S_COLOR_WHITE;		// draw in blue
ADDRGP4 $142
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 56
;56:	} else if ( rank == 2 ) {
ADDRGP4 $141
JUMPV
LABELV $140
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $143
line 57
;57:		s = va("2%s",sND);//S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRGP4 $145
ARGP4
ADDRLP4 74
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 58
;58:	} else if ( rank == 3 ) {
ADDRGP4 $144
JUMPV
LABELV $143
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $146
line 59
;59:		s = va("3%s",sRD);//S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRGP4 $148
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 60
;60:	} else if ( rank == 11 ) {
ADDRGP4 $147
JUMPV
LABELV $146
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $149
line 61
;61:		s = va("11%s",sTH);
ADDRGP4 $151
ARGP4
ADDRLP4 94
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 62
;62:	} else if ( rank == 12 ) {
ADDRGP4 $150
JUMPV
LABELV $149
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $152
line 63
;63:		s = va("12%s",sTH);
ADDRGP4 $154
ARGP4
ADDRLP4 94
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 64
;64:	} else if ( rank == 13 ) {
ADDRGP4 $153
JUMPV
LABELV $152
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $155
line 65
;65:		s = va("13%s",sTH);
ADDRGP4 $157
ARGP4
ADDRLP4 94
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 66
;66:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $156
JUMPV
LABELV $155
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $158
line 67
;67:		s = va("%i%s", rank,sST);
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 64
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 68
;68:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $159
JUMPV
LABELV $158
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $161
line 69
;69:		s = va("%i%s", rank,sND);
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 74
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 70
;70:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $162
JUMPV
LABELV $161
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $163
line 71
;71:		s = va("%i%s", rank,sRD);
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 84
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 72
;72:	} else {
ADDRGP4 $164
JUMPV
LABELV $163
line 73
;73:		s = va("%i%s", rank,sTH);
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 94
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 74
;74:	}
LABELV $164
LABELV $162
LABELV $159
LABELV $156
LABELV $153
LABELV $150
LABELV $147
LABELV $144
LABELV $141
line 76
;75:
;76:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $130
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $165
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 77
;77:	return str;
ADDRGP4 $130
RETP4
LABELV $129
endproc CG_PlaceString 116 20
proc CG_Obituary 1168 24
line 87
;78:}
;79:
;80:qboolean CG_ThereIsAMaster(void);
;81:
;82:/*
;83:=============
;84:CG_Obituary
;85:=============
;86:*/
;87:static void CG_Obituary( entityState_t *ent ) {
line 98
;88:	int			mod;
;89:	int			target, attacker;
;90:	char		*message;
;91:	const char	*targetInfo;
;92:	const char	*attackerInfo;
;93:	char		targetName[32];
;94:	char		attackerName[32];
;95:	gender_t	gender;
;96:	clientInfo_t	*ci;
;97:
;98:	target = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 99
;99:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 100
;100:	mod = ent->eventParm;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
line 102
;101:
;102:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $169
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $167
LABELV $169
line 103
;103:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $170
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 104
;104:	}
LABELV $167
line 105
;105:	ci = &cgs.clientinfo[target];
ADDRLP4 88
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 107
;106:
;107:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $174
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $172
LABELV $174
line 108
;108:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 109
;109:		attackerInfo = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 110
;110:	} else {
ADDRGP4 $173
JUMPV
LABELV $172
line 111
;111:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 104
INDIRP4
ASGNP4
line 112
;112:	}
LABELV $173
line 114
;113:
;114:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
ADDRLP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 104
INDIRP4
ASGNP4
line 115
;115:	if ( !targetInfo ) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 116
;116:		return;
ADDRGP4 $166
JUMPV
LABELV $175
line 118
;117:	}
;118:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 119
;119:	strcat( targetName, S_COLOR_WHITE );
ADDRLP4 12
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 123
;120:
;121:	// check for single client messages
;122:
;123:	switch( mod ) {
ADDRLP4 44
INDIRI4
CNSTI4 29
LTI4 $179
ADDRLP4 44
INDIRI4
CNSTI4 37
GTI4 $179
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $183-116
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $183
address $181
address $181
address $181
address $181
address $179
address $181
address $181
address $181
address $181
code
LABELV $181
line 132
;124:	case MOD_SUICIDE:
;125:	case MOD_FALLING:
;126:	case MOD_CRUSH:
;127:	case MOD_WATER:
;128:	case MOD_SLIME:
;129:	case MOD_LAVA:
;130:	case MOD_TARGET_LASER:
;131:	case MOD_TRIGGER_HURT:
;132:		message = "DIED_GENERIC";
ADDRLP4 8
ADDRGP4 $182
ASGNP4
line 133
;133:		break;
ADDRGP4 $180
JUMPV
LABELV $179
line 135
;134:	default:
;135:		message = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 136
;136:		break;
LABELV $180
line 140
;137:	}
;138:
;139:	// Attacker killed themselves.  Ridicule them for it.
;140:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $185
line 141
;141:		gender = ci->gender;
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ASGNI4
line 142
;142:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 4
LTI4 $187
ADDRLP4 44
INDIRI4
CNSTI4 34
GTI4 $187
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $228-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $228
address $189
address $189
address $189
address $189
address $189
address $189
address $189
address $189
address $189
address $197
address $205
address $187
address $189
address $197
address $197
address $197
address $197
address $197
address $197
address $197
address $197
address $197
address $197
address $187
address $187
address $187
address $187
address $187
address $187
address $187
address $213
code
LABELV $189
line 153
;143:		case MOD_BRYAR_PISTOL:
;144:		case MOD_BRYAR_PISTOL_ALT:
;145:		case MOD_BLASTER:
;146:		case MOD_DISRUPTOR:
;147:		case MOD_DISRUPTOR_SPLASH:
;148:		case MOD_DISRUPTOR_SNIPER:
;149:		case MOD_BOWCASTER:
;150:		case MOD_REPEATER:
;151:		case MOD_REPEATER_ALT:
;152:		case MOD_FLECHETTE:
;153:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $190
line 154
;154:				message = "SUICIDE_SHOT_FEMALE";
ADDRLP4 8
ADDRGP4 $192
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $190
line 155
;155:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $193
line 156
;156:				message = "SUICIDE_SHOT_GENDERLESS";
ADDRLP4 8
ADDRGP4 $195
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $193
line 158
;157:			else
;158:				message = "SUICIDE_SHOT_MALE";
ADDRLP4 8
ADDRGP4 $196
ASGNP4
line 159
;159:			break;
ADDRGP4 $188
JUMPV
LABELV $197
line 171
;160:		case MOD_REPEATER_ALT_SPLASH:
;161:		case MOD_FLECHETTE_ALT_SPLASH:
;162:		case MOD_ROCKET:
;163:		case MOD_ROCKET_SPLASH:
;164:		case MOD_ROCKET_HOMING:
;165:		case MOD_ROCKET_HOMING_SPLASH:
;166:		case MOD_THERMAL:
;167:		case MOD_THERMAL_SPLASH:
;168:		case MOD_TRIP_MINE_SPLASH:
;169:		case MOD_TIMED_MINE_SPLASH:
;170:		case MOD_DET_PACK_SPLASH:
;171:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $198
line 172
;172:				message = "SUICIDE_EXPLOSIVES_FEMALE";
ADDRLP4 8
ADDRGP4 $200
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $198
line 173
;173:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $201
line 174
;174:				message = "SUICIDE_EXPLOSIVES_GENDERLESS";
ADDRLP4 8
ADDRGP4 $203
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $201
line 176
;175:			else
;176:				message = "SUICIDE_EXPLOSIVES_MALE";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 177
;177:			break;
ADDRGP4 $188
JUMPV
LABELV $205
line 179
;178:		case MOD_DEMP2:
;179:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $206
line 180
;180:				message = "SUICIDE_ELECTROCUTED_FEMALE";
ADDRLP4 8
ADDRGP4 $208
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $206
line 181
;181:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $209
line 182
;182:				message = "SUICIDE_ELECTROCUTED_GENDERLESS";
ADDRLP4 8
ADDRGP4 $211
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $209
line 184
;183:			else
;184:				message = "SUICIDE_ELECTROCUTED_MALE";
ADDRLP4 8
ADDRGP4 $212
ASGNP4
line 185
;185:			break;
ADDRGP4 $188
JUMPV
LABELV $213
line 187
;186:		case MOD_FALLING:
;187:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $214
line 188
;188:				message = "SUICIDE_FALLDEATH_FEMALE";
ADDRLP4 8
ADDRGP4 $216
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $214
line 189
;189:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $217
line 190
;190:				message = "SUICIDE_FALLDEATH_GENDERLESS";
ADDRLP4 8
ADDRGP4 $219
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $217
line 192
;191:			else
;192:				message = "SUICIDE_FALLDEATH_MALE";
ADDRLP4 8
ADDRGP4 $220
ASGNP4
line 193
;193:			break;
ADDRGP4 $188
JUMPV
LABELV $187
line 195
;194:		default:
;195:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $221
line 196
;196:				message = "SUICIDE_GENERICDEATH_FEMALE";
ADDRLP4 8
ADDRGP4 $223
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $221
line 197
;197:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $224
line 198
;198:				message = "SUICIDE_GENERICDEATH_GENDERLESS";
ADDRLP4 8
ADDRGP4 $226
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $224
line 200
;199:			else
;200:				message = "SUICIDE_GENERICDEATH_MALE";
ADDRLP4 8
ADDRGP4 $227
ASGNP4
line 201
;201:			break;
LABELV $188
line 203
;202:		}
;203:	}
LABELV $185
line 205
;204:
;205:	if (target != attacker && target < MAX_CLIENTS && attacker < MAX_CLIENTS)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $230
ADDRLP4 124
CNSTI4 32
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 124
INDIRI4
GEI4 $230
ADDRLP4 0
INDIRI4
ADDRLP4 124
INDIRI4
GEI4 $230
line 206
;206:	{
line 207
;207:		goto clientkilled;
ADDRGP4 $232
JUMPV
LABELV $230
line 210
;208:	}
;209:
;210:	if (message) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $233
line 211
;211:		gender = ci->gender;
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ASGNI4
line 213
;212:
;213:		if (!message[0])
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $235
line 214
;214:		{
line 215
;215:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $237
line 216
;216:				message = "SUICIDE_GENERICDEATH_FEMALE";
ADDRLP4 8
ADDRGP4 $223
ASGNP4
ADDRGP4 $238
JUMPV
LABELV $237
line 217
;217:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $239
line 218
;218:				message = "SUICIDE_GENERICDEATH_GENDERLESS";
ADDRLP4 8
ADDRGP4 $226
ASGNP4
ADDRGP4 $240
JUMPV
LABELV $239
line 220
;219:			else
;220:				message = "SUICIDE_GENERICDEATH_MALE";
ADDRLP4 8
ADDRGP4 $227
ASGNP4
LABELV $240
LABELV $238
line 221
;221:		}
LABELV $235
line 222
;222:		message = (char *)CG_GetStripEdString("INGAMETEXT", message);
ADDRGP4 $241
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 128
INDIRP4
ASGNP4
line 224
;223:
;224:		CG_Printf( "%s %s\n", targetName, message);
ADDRGP4 $242
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 225
;225:		return;
ADDRGP4 $166
JUMPV
LABELV $233
LABELV $232
line 231
;226:	}
;227:
;228:clientkilled:
;229:
;230:	// check for kill messages from the current clientNum
;231:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $243
line 234
;232:		char	*s;
;233:
;234:		if ( cgs.gametype < GT_TEAM && cgs.gametype != GT_TOURNAMENT ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
GEI4 $246
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
EQI4 $246
line 235
;235:			if (cgs.gametype == GT_JEDIMASTER &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $250
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $250
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $250
ADDRGP4 cg+36
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $250
ADDRLP4 136
ADDRGP4 CG_ThereIsAMaster
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $250
line 240
;236:				attacker < MAX_CLIENTS &&
;237:				!ent->isJediMaster &&
;238:				!cg.snap->ps.isJediMaster &&
;239:				CG_ThereIsAMaster())
;240:			{
line 243
;241:				char part1[512];
;242:				char part2[512];
;243:				trap_SP_GetStringTextString("INGAMETEXT_KILLED_MESSAGE", part1, sizeof(part1));
ADDRGP4 $254
ARGP4
ADDRLP4 140
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 244
;244:				trap_SP_GetStringTextString("INGAMETEXT_JMKILLED_NOTJM", part2, sizeof(part2));
ADDRGP4 $255
ARGP4
ADDRLP4 652
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 245
;245:				s = va("%s %s\n%s\n", part1, targetName, part2);
ADDRGP4 $256
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 652
ARGP4
ADDRLP4 1164
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 1164
INDIRP4
ASGNP4
line 246
;246:			}
ADDRGP4 $247
JUMPV
LABELV $250
line 247
;247:			else if (cgs.gametype == GT_JEDIMASTER &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $257
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $257
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $257
ADDRGP4 cg+36
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $257
line 251
;248:				attacker < MAX_CLIENTS &&
;249:				!ent->isJediMaster &&
;250:				!cg.snap->ps.isJediMaster)
;251:			{ //no JM, saber must be out
line 253
;252:				char part1[512];
;253:				trap_SP_GetStringTextString("INGAMETEXT_KILLED_MESSAGE", part1, sizeof(part1));
ADDRGP4 $254
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 260
;254:				/*
;255:				kmsg1 = "for 0 points.\nGo for the saber!";
;256:				strcpy(part2, kmsg1);
;257:
;258:				s = va("%s %s %s\n", part1, targetName, part2);
;259:				*/
;260:				s = va("%s %s\n", part1, targetName);
ADDRGP4 $242
ARGP4
ADDRLP4 144
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 656
INDIRP4
ASGNP4
line 261
;261:			}
ADDRGP4 $247
JUMPV
LABELV $257
line 263
;262:			else
;263:			{
line 266
;264:				char sPlaceWith[256];
;265:				char sKilledStr[256];
;266:				trap_SP_GetStringTextString("INGAMETEXT_PLACE_WITH",     sPlaceWith, sizeof(sPlaceWith));
ADDRGP4 $261
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 267
;267:				trap_SP_GetStringTextString("INGAMETEXT_KILLED_MESSAGE", sKilledStr, sizeof(sKilledStr));
ADDRGP4 $254
ARGP4
ADDRLP4 400
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 269
;268:
;269:				s = va("%s %s.\n%s %s %i.", sKilledStr, targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 656
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $262
ARGP4
ADDRLP4 400
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRLP4 144
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRLP4 660
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 660
INDIRP4
ASGNP4
line 273
;270:					CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ), 
;271:					sPlaceWith,
;272:					cg.snap->ps.persistant[PERS_SCORE] );
;273:			}
line 274
;274:		} else {
ADDRGP4 $247
JUMPV
LABELV $246
line 276
;275:			char sKilledStr[256];
;276:			trap_SP_GetStringTextString("INGAMETEXT_KILLED_MESSAGE", sKilledStr, sizeof(sKilledStr));
ADDRGP4 $254
ARGP4
ADDRLP4 132
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 277
;277:			s = va("%s %s", sKilledStr, targetName );
ADDRGP4 $265
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 388
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 388
INDIRP4
ASGNP4
line 278
;278:		}
LABELV $247
line 279
;279:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 cg_singlePlayerActive+12
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $270
ADDRGP4 cg_cameraOrbit+12
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $266
LABELV $270
line 280
;280:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRLP4 128
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 281
;281:		} 
LABELV $266
line 283
;282:		// print the text message as well
;283:	}
LABELV $243
line 286
;284:
;285:	// check for double client messages
;286:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $271
line 287
;287:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 288
;288:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $273
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 289
;289:	} else {
ADDRGP4 $272
JUMPV
LABELV $271
line 290
;290:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 291
;291:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 56
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 293
;292:		// check for kill messages about the current clientNum
;293:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $274
line 294
;294:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+6996
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 295
;295:		}
LABELV $274
line 296
;296:	}
LABELV $272
line 298
;297:
;298:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $279
line 299
;299:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $281
ADDRLP4 44
INDIRI4
CNSTI4 37
GTI4 $281
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $332-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $332
address $283
address $285
address $287
address $289
address $289
address $291
address $293
address $293
address $295
address $297
address $299
address $301
address $301
address $303
address $303
address $305
address $307
address $309
address $309
address $311
address $311
address $313
address $313
address $315
address $317
address $319
address $321
address $323
address $281
address $281
address $281
address $327
address $325
address $329
address $281
address $281
address $331
code
LABELV $283
line 301
;300:		case MOD_STUN_BATON:
;301:			message = "KILLED_STUN";
ADDRLP4 8
ADDRGP4 $284
ASGNP4
line 302
;302:			break;
ADDRGP4 $282
JUMPV
LABELV $285
line 304
;303:		case MOD_MELEE:
;304:			message = "KILLED_MELEE";
ADDRLP4 8
ADDRGP4 $286
ASGNP4
line 305
;305:			break;
ADDRGP4 $282
JUMPV
LABELV $287
line 307
;306:		case MOD_SABER:
;307:			message = "KILLED_SABER";
ADDRLP4 8
ADDRGP4 $288
ASGNP4
line 308
;308:			break;
ADDRGP4 $282
JUMPV
LABELV $289
line 311
;309:		case MOD_BRYAR_PISTOL:
;310:		case MOD_BRYAR_PISTOL_ALT:
;311:			message = "KILLED_BRYAR";
ADDRLP4 8
ADDRGP4 $290
ASGNP4
line 312
;312:			break;
ADDRGP4 $282
JUMPV
LABELV $291
line 314
;313:		case MOD_BLASTER:
;314:			message = "KILLED_BLASTER";
ADDRLP4 8
ADDRGP4 $292
ASGNP4
line 315
;315:			break;
ADDRGP4 $282
JUMPV
LABELV $293
line 318
;316:		case MOD_DISRUPTOR:
;317:		case MOD_DISRUPTOR_SPLASH:
;318:			message = "KILLED_DISRUPTOR";
ADDRLP4 8
ADDRGP4 $294
ASGNP4
line 319
;319:			break;
ADDRGP4 $282
JUMPV
LABELV $295
line 321
;320:		case MOD_DISRUPTOR_SNIPER:
;321:			message = "KILLED_DISRUPTORSNIPE";
ADDRLP4 8
ADDRGP4 $296
ASGNP4
line 322
;322:			break;
ADDRGP4 $282
JUMPV
LABELV $297
line 324
;323:		case MOD_BOWCASTER:
;324:			message = "KILLED_BOWCASTER";
ADDRLP4 8
ADDRGP4 $298
ASGNP4
line 325
;325:			break;
ADDRGP4 $282
JUMPV
LABELV $299
line 327
;326:		case MOD_REPEATER:
;327:			message = "KILLED_REPEATER";
ADDRLP4 8
ADDRGP4 $300
ASGNP4
line 328
;328:			break;
ADDRGP4 $282
JUMPV
LABELV $301
line 331
;329:		case MOD_REPEATER_ALT:
;330:		case MOD_REPEATER_ALT_SPLASH:
;331:			message = "KILLED_REPEATERALT";
ADDRLP4 8
ADDRGP4 $302
ASGNP4
line 332
;332:			break;
ADDRGP4 $282
JUMPV
LABELV $303
line 335
;333:		case MOD_DEMP2:
;334:		case MOD_DEMP2_ALT:
;335:			message = "KILLED_DEMP2";
ADDRLP4 8
ADDRGP4 $304
ASGNP4
line 336
;336:			break;
ADDRGP4 $282
JUMPV
LABELV $305
line 338
;337:		case MOD_FLECHETTE:
;338:			message = "KILLED_FLECHETTE";
ADDRLP4 8
ADDRGP4 $306
ASGNP4
line 339
;339:			break;
ADDRGP4 $282
JUMPV
LABELV $307
line 341
;340:		case MOD_FLECHETTE_ALT_SPLASH:
;341:			message = "KILLED_FLECHETTE_MINE";
ADDRLP4 8
ADDRGP4 $308
ASGNP4
line 342
;342:			break;
ADDRGP4 $282
JUMPV
LABELV $309
line 345
;343:		case MOD_ROCKET:
;344:		case MOD_ROCKET_SPLASH:
;345:			message = "KILLED_ROCKET";
ADDRLP4 8
ADDRGP4 $310
ASGNP4
line 346
;346:			break;
ADDRGP4 $282
JUMPV
LABELV $311
line 349
;347:		case MOD_ROCKET_HOMING:
;348:		case MOD_ROCKET_HOMING_SPLASH:
;349:			message = "KILLED_ROCKET_HOMING";
ADDRLP4 8
ADDRGP4 $312
ASGNP4
line 350
;350:			break;
ADDRGP4 $282
JUMPV
LABELV $313
line 353
;351:		case MOD_THERMAL:
;352:		case MOD_THERMAL_SPLASH:
;353:			message = "KILLED_THERMAL";
ADDRLP4 8
ADDRGP4 $314
ASGNP4
line 354
;354:			break;
ADDRGP4 $282
JUMPV
LABELV $315
line 356
;355:		case MOD_TRIP_MINE_SPLASH:
;356:			message = "KILLED_TRIPMINE";
ADDRLP4 8
ADDRGP4 $316
ASGNP4
line 357
;357:			break;
ADDRGP4 $282
JUMPV
LABELV $317
line 359
;358:		case MOD_TIMED_MINE_SPLASH:
;359:			message = "KILLED_TRIPMINE_TIMED";
ADDRLP4 8
ADDRGP4 $318
ASGNP4
line 360
;360:			break;
ADDRGP4 $282
JUMPV
LABELV $319
line 362
;361:		case MOD_DET_PACK_SPLASH:
;362:			message = "KILLED_DETPACK";
ADDRLP4 8
ADDRGP4 $320
ASGNP4
line 363
;363:			break;
ADDRGP4 $282
JUMPV
LABELV $321
line 365
;364:		case MOD_FORCE_DARK:
;365:			message = "KILLED_DARKFORCE";
ADDRLP4 8
ADDRGP4 $322
ASGNP4
line 366
;366:			break;
ADDRGP4 $282
JUMPV
LABELV $323
line 368
;367:		case MOD_SENTRY:
;368:			message = "KILLED_SENTRY";
ADDRLP4 8
ADDRGP4 $324
ASGNP4
line 369
;369:			break;
ADDRGP4 $282
JUMPV
LABELV $325
line 371
;370:		case MOD_TELEFRAG:
;371:			message = "KILLED_TELEFRAG";
ADDRLP4 8
ADDRGP4 $326
ASGNP4
line 372
;372:			break;
ADDRGP4 $282
JUMPV
LABELV $327
line 374
;373:		case MOD_CRUSH:
;374:			message = "KILLED_GENERIC";//"KILLED_FORCETOSS";
ADDRLP4 8
ADDRGP4 $328
ASGNP4
line 375
;375:			break;
ADDRGP4 $282
JUMPV
LABELV $329
line 377
;376:		case MOD_FALLING:
;377:			message = "KILLED_FORCETOSS";
ADDRLP4 8
ADDRGP4 $330
ASGNP4
line 378
;378:			break;
ADDRGP4 $282
JUMPV
LABELV $331
line 380
;379:		case MOD_TRIGGER_HURT:
;380:			message = "KILLED_GENERIC";//"KILLED_FORCETOSS";
ADDRLP4 8
ADDRGP4 $328
ASGNP4
line 381
;381:			break;
ADDRGP4 $282
JUMPV
LABELV $281
line 383
;382:		default:
;383:			message = "KILLED_GENERIC";
ADDRLP4 8
ADDRGP4 $328
ASGNP4
line 384
;384:			break;
LABELV $282
line 387
;385:		}
;386:
;387:		if (message) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $334
line 388
;388:			message = (char *)CG_GetStripEdString("INGAMETEXT", message);
ADDRGP4 $241
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 132
INDIRP4
ASGNP4
line 390
;389:
;390:			CG_Printf( "%s %s %s\n", 
ADDRGP4 $336
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 392
;391:				targetName, message, attackerName);
;392:			return;
ADDRGP4 $166
JUMPV
LABELV $334
line 394
;393:		}
;394:	}
LABELV $279
line 397
;395:
;396:	// we don't know what it was
;397:	CG_Printf( "%s %s\n", targetName, (char *)CG_GetStripEdString("INGAMETEXT", "DIED_GENERIC") );
ADDRGP4 $241
ARGP4
ADDRGP4 $182
ARGP4
ADDRLP4 128
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $242
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 398
;398:}
LABELV $166
endproc CG_Obituary 1168 24
export CG_ToggleBinoculars
proc CG_ToggleBinoculars 0 16
line 403
;399:
;400://==========================================================================
;401:
;402:void CG_ToggleBinoculars(centity_t *cent, int forceZoom)
;403:{
line 404
;404:	if (cent->currentState.number != cg.snap->ps.clientNum)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $338
line 405
;405:	{
line 406
;406:		return;
ADDRGP4 $337
JUMPV
LABELV $338
line 409
;407:	}
;408:
;409:	if (cg.snap->ps.weaponstate != WEAPON_READY)
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
EQI4 $341
line 410
;410:	{ //So we can't fool it and reactivate while switching to the saber or something.
line 411
;411:		return;
ADDRGP4 $337
JUMPV
LABELV $341
line 414
;412:	}
;413:
;414:	if (cg.snap->ps.weapon == WP_SABER)
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
NEI4 $344
line 415
;415:	{ //No.
line 416
;416:		return;
ADDRGP4 $337
JUMPV
LABELV $344
line 419
;417:	}
;418:
;419:	if (forceZoom)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $347
line 420
;420:	{
line 421
;421:		if (forceZoom == 2)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $349
line 422
;422:		{
line 423
;423:			cg.snap->ps.zoomMode = 0;
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
CNSTI4 0
ASGNI4
line 424
;424:		}
ADDRGP4 $350
JUMPV
LABELV $349
line 425
;425:		else if (forceZoom == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $352
line 426
;426:		{
line 427
;427:			cg.snap->ps.zoomMode = 2;
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
CNSTI4 2
ASGNI4
line 428
;428:		}
LABELV $352
LABELV $350
line 429
;429:	}
LABELV $347
line 431
;430:
;431:	if (cg.snap->ps.zoomMode == 0)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
INDIRI4
CNSTI4 0
NEI4 $355
line 432
;432:	{
line 433
;433:		trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.media.zoomStart );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+1252
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 434
;434:	}
ADDRGP4 $356
JUMPV
LABELV $355
line 435
;435:	else if (cg.snap->ps.zoomMode == 2)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
INDIRI4
CNSTI4 2
NEI4 $361
line 436
;436:	{
line 437
;437:		trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.media.zoomEnd );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+1260
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 438
;438:	}
LABELV $361
LABELV $356
line 439
;439:}
LABELV $337
endproc CG_ToggleBinoculars 0 16
proc CG_UseItem 32 16
line 446
;440:
;441:/*
;442:===============
;443:CG_UseItem
;444:===============
;445:*/
;446:static void CG_UseItem( centity_t *cent ) {
line 452
;447:	clientInfo_t *ci;
;448:	int			itemNum, clientNum;
;449:	gitem_t		*item;
;450:	entityState_t *es;
;451:
;452:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 454
;453:	
;454:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 40
SUBI4
ASGNI4
line 455
;455:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $370
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $368
LABELV $370
line 456
;456:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 457
;457:	}
LABELV $368
line 460
;458:
;459:	// print a message if the local player
;460:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $371
line 461
;461:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $374
line 463
;462:			//CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;463:		} else {
ADDRGP4 $375
JUMPV
LABELV $374
line 464
;464:			item = BG_FindItemForHoldable( itemNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 465
;465:		}
LABELV $375
line 466
;466:	}
LABELV $371
line 468
;467:
;468:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $377
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $377
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $391
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $391
address $377
address $380
address $377
address $384
address $377
address $379
address $377
code
line 472
;469:	default:
;470:	case HI_NONE:
;471:		//trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
;472:		break;
LABELV $379
line 475
;473:
;474:	case HI_BINOCULARS:
;475:		CG_ToggleBinoculars(cent, es->eventParm);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ToggleBinoculars
CALLV
pop
line 476
;476:		break;
ADDRGP4 $377
JUMPV
LABELV $380
line 479
;477:
;478:	case HI_SEEKER:
;479:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.deploySeeker );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+768
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 480
;480:		break;
ADDRGP4 $377
JUMPV
line 485
;481:
;482:	case HI_SHIELD:
;483:	case HI_DATAPAD:
;484:	case HI_SENTRY_GUN:
;485:		break;
LABELV $384
line 489
;486:
;487://	case HI_MEDKIT:
;488:	case HI_MEDPAC:
;489:		clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 490
;490:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $385
ADDRLP4 28
INDIRI4
CNSTI4 32
GEI4 $385
line 491
;491:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 788
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 492
;492:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 152
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 493
;493:		}
LABELV $385
line 494
;494:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+772
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 495
;495:		break;
LABELV $377
line 498
;496:	}
;497:
;498:	if (cg.snap && cg.snap->ps.clientNum == cent->currentState.number && itemNum != HI_BINOCULARS)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $392
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $392
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $392
line 499
;499:	{ //if not using binoculars, we just used that item up, so switch
line 500
;500:		BG_CycleInven(&cg.snap->ps, 1);
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_CycleInven
CALLV
pop
line 501
;501:		cg.itemSelect = -1; //update the client-side selection display
ADDRGP4 cg+3516
CNSTI4 -1
ASGNI4
line 502
;502:	}
LABELV $392
line 503
;503:}
LABELV $367
endproc CG_UseItem 32 16
proc CG_ItemPickup 1044 12
line 513
;504:
;505:
;506:/*
;507:================
;508:CG_ItemPickup
;509:
;510:A new item was picked up this frame
;511:================
;512:*/
;513:static void CG_ItemPickup( int itemNum ) {
line 514
;514:	cg.itemPickup = itemNum;
ADDRGP4 cg+13360
ADDRFP4 0
INDIRI4
ASGNI4
line 515
;515:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+13364
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 516
;516:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+13368
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 518
;517:	// see if it should be the grabbed weapon
;518:	if ( cg.snap && bg_itemlist[itemNum].giType == IT_WEAPON ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $404
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $404
line 525
;519:
;520:		// 0 == no switching
;521:		// 1 == automatically switch to best SAFE weapon
;522:		// 2 == automatically switch to best weapon, safe or otherwise
;523:		// 3 == if not saber, automatically switch to best weapon, safe or otherwise
;524:
;525:		if (0 == cg_autoswitch.integer)
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
NEI4 $408
line 526
;526:		{
line 528
;527:			// don't switch
;528:		}
ADDRGP4 $409
JUMPV
LABELV $408
line 529
;529:		else if ( cg_autoswitch.integer == 1)
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 1
NEI4 $411
line 530
;530:		{ //only autoselect if not explosive ("safe")
line 531
;531:			if (bg_itemlist[itemNum].giTag != WP_TRIP_MINE &&
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 12
EQI4 $412
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 13
EQI4 $412
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 11
EQI4 $412
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 10
EQI4 $412
ADDRLP4 4
CNSTI4 192
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
LEI4 $412
ADDRGP4 cg+36
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $412
line 537
;532:				bg_itemlist[itemNum].giTag != WP_DET_PACK &&
;533:				bg_itemlist[itemNum].giTag != WP_THERMAL &&
;534:				bg_itemlist[itemNum].giTag != WP_ROCKET_LAUNCHER &&
;535:				bg_itemlist[itemNum].giTag > cg.snap->ps.weapon &&
;536:				cg.snap->ps.weapon != WP_SABER)
;537:			{
line 538
;538:				if (!cg.snap->ps.emplacedIndex)
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
NEI4 $423
line 539
;539:				{
line 540
;540:					cg.weaponSelectTime = cg.time;
ADDRGP4 cg+13372
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 541
;541:				}
LABELV $423
line 542
;542:				cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+3508
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 543
;543:			}
line 544
;544:		}
ADDRGP4 $412
JUMPV
LABELV $411
line 545
;545:		else if ( cg_autoswitch.integer == 2)
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 2
NEI4 $430
line 546
;546:		{ //autoselect if better
line 547
;547:			if (bg_itemlist[itemNum].giTag > cg.snap->ps.weapon &&
ADDRLP4 0
CNSTI4 192
ASGNI4
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
LEI4 $433
ADDRGP4 cg+36
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $433
line 549
;548:				cg.snap->ps.weapon != WP_SABER)
;549:			{
line 550
;550:				if (!cg.snap->ps.emplacedIndex)
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
NEI4 $438
line 551
;551:				{
line 552
;552:					cg.weaponSelectTime = cg.time;
ADDRGP4 cg+13372
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 553
;553:				}
LABELV $438
line 554
;554:				cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+3508
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 555
;555:			}
LABELV $433
line 556
;556:		}
LABELV $430
LABELV $412
LABELV $409
line 572
;557:		/*
;558:		else if ( cg_autoswitch.integer == 3)
;559:		{ //autoselect if better and not using the saber as a weapon
;560:			if (bg_itemlist[itemNum].giTag > cg.snap->ps.weapon &&
;561:				cg.snap->ps.weapon != WP_SABER)
;562:			{
;563:				if (!cg.snap->ps.emplacedIndex)
;564:				{
;565:					cg.weaponSelectTime = cg.time;
;566:				}
;567:				cg.weaponSelect = bg_itemlist[itemNum].giTag;
;568:			}
;569:		}
;570:		*/
;571:		//No longer required - just not switching ever if using saber
;572:	}
LABELV $404
line 575
;573:
;574:	//rww - print pickup messages
;575:	if (bg_itemlist[itemNum].classname && bg_itemlist[itemNum].classname[0] &&
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $445
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $450
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 4
EQI4 $445
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 5
EQI4 $445
LABELV $450
line 577
;576:		(bg_itemlist[itemNum].giType != IT_TEAM || (bg_itemlist[itemNum].giTag != PW_REDFLAG && bg_itemlist[itemNum].giTag != PW_BLUEFLAG)) )
;577:	{ //don't print messages for flags, they have their own pickup event broadcasts
line 580
;578:		char	text[1024];
;579:
;580:		if ( trap_SP_GetStringTextString( va("INGAME_%s",bg_itemlist[itemNum].classname), text, sizeof( text )))
ADDRGP4 $453
ARGP4
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1036
ADDRGP4 trap_SP_GetStringTextString
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $451
line 581
;581:		{
line 582
;582:			Com_Printf("%s %s\n", CG_GetStripEdString("INGAMETEXT", "PICKUPLINE"), text);
ADDRGP4 $241
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 1040
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $242
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 583
;583:		}
ADDRGP4 $452
JUMPV
LABELV $451
line 585
;584:		else
;585:		{
line 586
;586:			Com_Printf("%s %s\n", CG_GetStripEdString("INGAMETEXT", "PICKUPLINE"), bg_itemlist[itemNum].classname);
ADDRGP4 $241
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 1040
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $242
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 587
;587:		}
LABELV $452
line 588
;588:	}
LABELV $445
line 589
;589:}
LABELV $398
endproc CG_ItemPickup 1044 12
export CG_PainEvent
proc CG_PainEvent 12 16
line 599
;590:
;591:
;592:/*
;593:================
;594:CG_PainEvent
;595:
;596:Also called by playerstate transition
;597:================
;598:*/
;599:void CG_PainEvent( centity_t *cent, int health ) {
line 603
;600:	char	*snd;
;601:
;602:	// don't do more than two pain sounds a second
;603:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $456
line 604
;604:		return;
ADDRGP4 $455
JUMPV
LABELV $456
line 607
;605:	}
;606:
;607:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $459
line 608
;608:		snd = "*pain25.wav";
ADDRLP4 0
ADDRGP4 $461
ASGNP4
line 609
;609:	} else if ( health < 50 ) {
ADDRGP4 $460
JUMPV
LABELV $459
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $462
line 610
;610:		snd = "*pain50.wav";
ADDRLP4 0
ADDRGP4 $464
ASGNP4
line 611
;611:	} else if ( health < 75 ) {
ADDRGP4 $463
JUMPV
LABELV $462
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $465
line 612
;612:		snd = "*pain75.wav";
ADDRLP4 0
ADDRGP4 $467
ASGNP4
line 613
;613:	} else {
ADDRGP4 $466
JUMPV
LABELV $465
line 614
;614:		snd = "*pain100.wav";
ADDRLP4 0
ADDRGP4 $468
ASGNP4
line 615
;615:	}
LABELV $466
LABELV $463
LABELV $460
line 616
;616:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 620
;617:		CG_CustomSound( cent->currentState.number, snd ) );
;618:
;619:	// save pain time for programitic twitch animation
;620:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 621
;621:	cent->pe.painDirection	^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 622
;622:}
LABELV $455
endproc CG_PainEvent 12 16
export CG_ReattachLimb
proc CG_ReattachLimb 16 12
line 625
;623:
;624:void CG_ReattachLimb(centity_t *source)
;625:{
line 629
;626:	char *limbName;
;627:	char *stubCapName;
;628:
;629:	switch (source->torsoBolt)
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 10
LTI4 $471
ADDRLP4 8
INDIRI4
CNSTI4 16
GTI4 $471
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $495-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $495
address $474
address $477
address $480
address $483
address $486
address $489
address $492
code
line 630
;630:	{
LABELV $474
line 632
;631:	case G2_MODELPART_HEAD:
;632:		limbName = "head";
ADDRLP4 0
ADDRGP4 $475
ASGNP4
line 633
;633:		stubCapName = "torso_cap_head_off";
ADDRLP4 4
ADDRGP4 $476
ASGNP4
line 634
;634:		break;
ADDRGP4 $472
JUMPV
LABELV $477
line 636
;635:	case G2_MODELPART_WAIST:
;636:		limbName = "torso";
ADDRLP4 0
ADDRGP4 $478
ASGNP4
line 637
;637:		stubCapName = "hips_cap_torso_off";
ADDRLP4 4
ADDRGP4 $479
ASGNP4
line 638
;638:		break;
ADDRGP4 $472
JUMPV
LABELV $480
line 640
;639:	case G2_MODELPART_LARM:
;640:		limbName = "l_arm";
ADDRLP4 0
ADDRGP4 $481
ASGNP4
line 641
;641:		stubCapName = "torso_cap_l_arm_off";
ADDRLP4 4
ADDRGP4 $482
ASGNP4
line 642
;642:		break;
ADDRGP4 $472
JUMPV
LABELV $483
line 644
;643:	case G2_MODELPART_RARM:
;644:		limbName = "r_arm";
ADDRLP4 0
ADDRGP4 $484
ASGNP4
line 645
;645:		stubCapName = "torso_cap_r_arm_off";
ADDRLP4 4
ADDRGP4 $485
ASGNP4
line 646
;646:		break;
ADDRGP4 $472
JUMPV
LABELV $486
line 648
;647:	case G2_MODELPART_RHAND:
;648:		limbName = "r_hand";
ADDRLP4 0
ADDRGP4 $487
ASGNP4
line 649
;649:		stubCapName = "r_arm_cap_r_hand_off";
ADDRLP4 4
ADDRGP4 $488
ASGNP4
line 650
;650:		break;
ADDRGP4 $472
JUMPV
LABELV $489
line 652
;651:	case G2_MODELPART_LLEG:
;652:		limbName = "l_leg";
ADDRLP4 0
ADDRGP4 $490
ASGNP4
line 653
;653:		stubCapName = "hips_cap_l_leg_off";
ADDRLP4 4
ADDRGP4 $491
ASGNP4
line 654
;654:		break;
ADDRGP4 $472
JUMPV
LABELV $492
line 656
;655:	case G2_MODELPART_RLEG:
;656:		limbName = "r_leg";
ADDRLP4 0
ADDRGP4 $493
ASGNP4
line 657
;657:		stubCapName = "hips_cap_r_leg_off";
ADDRLP4 4
ADDRGP4 $494
ASGNP4
line 658
;658:		break;
ADDRGP4 $472
JUMPV
LABELV $471
line 660
;659:	default:
;660:		source->torsoBolt = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 0
ASGNI4
line 661
;661:		source->ghoul2weapon = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 662
;662:		return;
ADDRGP4 $470
JUMPV
LABELV $472
line 665
;663:	}
;664:
;665:	trap_G2API_SetSurfaceOnOff(source->ghoul2, limbName, 0);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 666
;666:	trap_G2API_SetSurfaceOnOff(source->ghoul2, stubCapName, 0x00000100);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 668
;667:
;668:	source->torsoBolt = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 0
ASGNI4
line 670
;669:
;670:	source->ghoul2weapon = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 671
;671:}
LABELV $470
endproc CG_ReattachLimb 16 12
proc CG_BodyQueueCopy 64 40
line 674
;672:
;673:static void CG_BodyQueueCopy(centity_t *cent, int clientNum, int knownWeapon)
;674:{
line 678
;675:	centity_t		*source;
;676:	animation_t		*anim;
;677:	float			animSpeed;
;678:	int				flags=BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 681
;679:	clientInfo_t	*ci;
;680:
;681:	if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $498
line 682
;682:	{
line 683
;683:		trap_G2API_CleanGhoul2Models(&cent->ghoul2);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 684
;684:	}
LABELV $498
line 686
;685:
;686:	if (clientNum < 0 || clientNum >= MAX_CLIENTS)
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $502
ADDRLP4 20
INDIRI4
CNSTI4 32
LTI4 $500
LABELV $502
line 687
;687:	{
line 688
;688:		return;
ADDRGP4 $497
JUMPV
LABELV $500
line 691
;689:	}
;690:
;691:	source = &cg_entities[ clientNum ];
ADDRLP4 4
CNSTI4 1920
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 692
;692:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 788
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 694
;693:
;694:	if (!source)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $504
line 695
;695:	{
line 696
;696:		return;
ADDRGP4 $497
JUMPV
LABELV $504
line 699
;697:	}
;698:
;699:	if (!source->ghoul2)
ADDRLP4 4
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $506
line 700
;700:	{
line 701
;701:		return;
ADDRGP4 $497
JUMPV
LABELV $506
line 704
;702:	}
;703:
;704:	cent->isATST = source->isATST;
ADDRLP4 24
CNSTI4 1028
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 706
;705:
;706:	cent->dustTrailTime = source->dustTrailTime;
ADDRLP4 28
CNSTI4 616
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 708
;707:
;708:	trap_G2API_DuplicateGhoul2Instance(source->ghoul2, &cent->ghoul2);
ADDRLP4 32
CNSTI4 952
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 711
;709:
;710:	//either force the weapon from when we died or remove it if it was a dropped weapon
;711:	if (knownWeapon > WP_BRYAR_PISTOL && trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1))
ADDRFP4 8
INDIRI4
CNSTI4 3
LEI4 $508
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $508
line 712
;712:	{
line 713
;713:		trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 714
;714:	}
ADDRGP4 $509
JUMPV
LABELV $508
line 715
;715:	else if (trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1))
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $510
line 716
;716:	{
line 717
;717:		trap_G2API_CopySpecificGhoul2Model(g2WeaponInstances[knownWeapon], 0, cent->ghoul2, 1);
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
CALLV
pop
line 718
;718:	}
LABELV $510
LABELV $509
line 720
;719:
;720:	anim = &bgGlobalAnimations[ cent->currentState.torsoAnim ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 721
;721:	animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 8
CNSTF4 1112014848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 724
;722:
;723:	//this will just set us to the last frame of the animation, in theory
;724:	if (source->isATST)
ADDRLP4 4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $512
line 725
;725:	{
line 726
;726:		int aNum = cgs.clientinfo[source->currentState.number].frame+1;
ADDRLP4 44
CNSTI4 788
ADDRLP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+76
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 727
;727:		anim = &bgGlobalAnimations[ BOTH_DEAD1 ];
ADDRLP4 0
ADDRGP4 bgGlobalAnimations+1316
ASGNP4
line 728
;728:		animSpeed = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 730
;729:
;730:		flags &= ~BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
ADDRGP4 $518
JUMPV
LABELV $517
line 733
;731:
;732:		while (aNum >= anim->firstFrame+anim->numFrames)
;733:		{
line 734
;734:			aNum--;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 735
;735:		}
LABELV $518
line 732
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GEI4 $517
line 737
;736:
;737:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "pelvis", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $520
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
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
line 738
;738:	}
ADDRGP4 $513
JUMPV
LABELV $512
line 740
;739:	else
;740:	{
line 741
;741:		int aNum = cgs.clientinfo[source->currentState.number].frame+1;
ADDRLP4 44
CNSTI4 788
ADDRLP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+76
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $525
JUMPV
LABELV $524
line 744
;742:
;743:		while (aNum >= anim->firstFrame+anim->numFrames)
;744:		{
line 745
;745:			aNum--;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 746
;746:		}
LABELV $525
line 743
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GEI4 $524
line 748
;747:
;748:		if (aNum < anim->firstFrame-1)
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $527
line 749
;749:		{ //wrong animation...?
line 750
;750:			aNum = (anim->firstFrame+anim->numFrames)-1;
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 751
;751:		}
LABELV $527
line 758
;752:
;753:		//if (!cgs.clientinfo[source->currentState.number].frame || (cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) != (source->currentState.torsoAnim&~ANIM_TOGGLEBIT) )
;754:		//{
;755:		//	aNum = (anim->firstFrame+anim->numFrames)-1;
;756:		//}
;757:
;758:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "upper_lumbar", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $529
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
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
line 759
;759:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $531
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
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
line 760
;760:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $533
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
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
line 761
;761:	}
LABELV $513
line 764
;762:
;763:	//After we create the bodyqueue, regenerate any limbs on the real instance
;764:	if (source->torsoBolt)
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 0
EQI4 $535
line 765
;765:	{
line 766
;766:		CG_ReattachLimb(source);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_ReattachLimb
CALLV
pop
line 767
;767:	}
LABELV $535
line 768
;768:}
LABELV $497
endproc CG_BodyQueueCopy 64 40
export CG_TeamName
proc CG_TeamName 0 0
line 771
;769:
;770:const char *CG_TeamName(int team)
;771:{
line 772
;772:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $538
line 773
;773:		return "RED";
ADDRGP4 $540
RETP4
ADDRGP4 $537
JUMPV
LABELV $538
line 774
;774:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $541
line 775
;775:		return "BLUE";
ADDRGP4 $543
RETP4
ADDRGP4 $537
JUMPV
LABELV $541
line 776
;776:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $544
line 777
;777:		return "SPECTATOR";
ADDRGP4 $546
RETP4
ADDRGP4 $537
JUMPV
LABELV $544
line 778
;778:	return "FREE";
ADDRGP4 $547
RETP4
LABELV $537
endproc CG_TeamName 0 0
export CG_PrintCTFMessage
proc CG_PrintCTFMessage 1076 20
line 782
;779:}
;780:
;781:void CG_PrintCTFMessage(clientInfo_t *ci, const char *teamName, int ctfMessage)
;782:{
line 784
;783:	char printMsg[1024];
;784:	char *refName = NULL;
ADDRLP4 1028
CNSTP4 0
ASGNP4
line 785
;785:	const char *stripEdString = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 787
;786:
;787:	switch (ctfMessage)
ADDRLP4 1032
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $548
ADDRLP4 1032
INDIRI4
CNSTI4 4
GTI4 $548
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $561
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $561
address $551
address $553
address $555
address $557
address $559
code
line 788
;788:	{
LABELV $551
line 790
;789:	case CTFMESSAGE_FRAGGED_FLAG_CARRIER:
;790:		refName = "FRAGGED_FLAG_CARRIER";
ADDRLP4 1028
ADDRGP4 $552
ASGNP4
line 791
;791:		break;
ADDRGP4 $550
JUMPV
LABELV $553
line 793
;792:	case CTFMESSAGE_FLAG_RETURNED:
;793:		refName = "FLAG_RETURNED";
ADDRLP4 1028
ADDRGP4 $554
ASGNP4
line 794
;794:		break;
ADDRGP4 $550
JUMPV
LABELV $555
line 796
;795:	case CTFMESSAGE_PLAYER_RETURNED_FLAG:
;796:		refName = "PLAYER_RETURNED_FLAG";
ADDRLP4 1028
ADDRGP4 $556
ASGNP4
line 797
;797:		break;
ADDRGP4 $550
JUMPV
LABELV $557
line 799
;798:	case CTFMESSAGE_PLAYER_CAPTURED_FLAG:
;799:		refName = "PLAYER_CAPTURED_FLAG";
ADDRLP4 1028
ADDRGP4 $558
ASGNP4
line 800
;800:		break;
ADDRGP4 $550
JUMPV
LABELV $559
line 802
;801:	case CTFMESSAGE_PLAYER_GOT_FLAG:
;802:		refName = "PLAYER_GOT_FLAG";
ADDRLP4 1028
ADDRGP4 $560
ASGNP4
line 803
;803:		break;
line 805
;804:	default:
;805:		return;
LABELV $550
line 808
;806:	}
;807:
;808:	stripEdString = CG_GetStripEdString("INGAMETEXT", refName);
ADDRGP4 $241
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 810
;809:
;810:	if (!stripEdString || !stripEdString[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $564
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $562
LABELV $564
line 811
;811:	{
line 812
;812:		return;
ADDRGP4 $548
JUMPV
LABELV $562
line 815
;813:	}
;814:
;815:	if (teamName && teamName[0])
ADDRLP4 1044
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $565
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $565
line 816
;816:	{
line 817
;817:		const char *f = strstr(stripEdString, "%s");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $567
ARGP4
ADDRLP4 1052
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1052
INDIRP4
ASGNP4
line 819
;818:
;819:		if (f)
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $568
line 820
;820:		{
line 821
;821:			int strLen = 0;
ADDRLP4 1060
CNSTI4 0
ASGNI4
line 822
;822:			int i = 0;
ADDRLP4 1056
CNSTI4 0
ASGNI4
line 824
;823:
;824:			if (ci)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $574
line 825
;825:			{
line 826
;826:				Com_sprintf(printMsg, sizeof(printMsg), "%s ", ci->name);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $572
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 827
;827:				strLen = strlen(printMsg);
ADDRLP4 4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1064
INDIRI4
ASGNI4
line 828
;828:			}
ADDRGP4 $574
JUMPV
LABELV $573
line 831
;829:
;830:			while (stripEdString[i] && i < 512)
;831:			{
line 832
;832:				if (stripEdString[i] == '%' &&
ADDRLP4 1056
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 37
NEI4 $576
ADDRLP4 1056
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $576
line 834
;833:					stripEdString[i+1] == 's')
;834:				{
line 835
;835:					printMsg[strLen] = '\0';
ADDRLP4 1060
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 836
;836:					Q_strcat(printMsg, sizeof(printMsg), teamName);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 837
;837:					strLen = strlen(printMsg);
ADDRLP4 4
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1072
INDIRI4
ASGNI4
line 839
;838:
;839:					i++;
ADDRLP4 1056
ADDRLP4 1056
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 840
;840:				}
ADDRGP4 $577
JUMPV
LABELV $576
line 842
;841:				else
;842:				{
line 843
;843:					printMsg[strLen] = stripEdString[i];
ADDRLP4 1060
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 1056
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 844
;844:					strLen++;
ADDRLP4 1060
ADDRLP4 1060
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 845
;845:				}
LABELV $577
line 847
;846:
;847:				i++;
ADDRLP4 1056
ADDRLP4 1056
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 848
;848:			}
LABELV $574
line 830
ADDRLP4 1056
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $578
ADDRLP4 1056
INDIRI4
CNSTI4 512
LTI4 $573
LABELV $578
line 850
;849:
;850:			printMsg[strLen] = '\0';
ADDRLP4 1060
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 852
;851:
;852:			goto doPrint;
ADDRGP4 $579
JUMPV
LABELV $568
line 854
;853:		}
;854:	}
LABELV $565
line 856
;855:
;856:	if (ci)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $580
line 857
;857:	{
line 858
;858:		Com_sprintf(printMsg, sizeof(printMsg), "%s %s", ci->name, stripEdString);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $265
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 859
;859:	}
ADDRGP4 $581
JUMPV
LABELV $580
line 861
;860:	else
;861:	{
line 862
;862:		Com_sprintf(printMsg, sizeof(printMsg), "%s", stripEdString);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 863
;863:	}
LABELV $581
LABELV $579
line 866
;864:
;865:doPrint:
;866:	Com_Printf("%s\n", printMsg);
ADDRGP4 $582
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 867
;867:}
LABELV $548
endproc CG_PrintCTFMessage 1076 20
export CG_GetCTFMessageEvent
proc CG_GetCTFMessageEvent 20 12
line 870
;868:
;869:void CG_GetCTFMessageEvent(entityState_t *es)
;870:{
line 871
;871:	int clIndex = es->trickedentindex;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 872
;872:	int teamIndex = es->trickedentindex2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 873
;873:	clientInfo_t *ci = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 874
;874:	const char *teamName = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 876
;875:
;876:	if (clIndex < MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $584
line 877
;877:	{
line 878
;878:		ci = &cgs.clientinfo[clIndex];
ADDRLP4 8
CNSTI4 788
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 879
;879:	}
LABELV $584
line 881
;880:
;881:	if (teamIndex < 50)
ADDRLP4 4
INDIRI4
CNSTI4 50
GEI4 $587
line 882
;882:	{
line 883
;883:		teamName = CG_TeamName(teamIndex);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 CG_TeamName
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 884
;884:	}
LABELV $587
line 886
;885:
;886:	CG_PrintCTFMessage(ci, teamName, es->eventParm);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PrintCTFMessage
CALLV
pop
line 887
;887:}
LABELV $583
endproc CG_GetCTFMessageEvent 20 12
export DoFall
proc DoFall 8 16
line 890
;888:
;889:void DoFall(centity_t *cent, entityState_t *es, int clientNum)
;890:{
line 891
;891:	int delta = es->eventParm;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
line 893
;892:
;893:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $590
line 894
;894:	{ //corpses crack into the ground ^_^
line 895
;895:		if (delta > 25)
ADDRLP4 0
INDIRI4
CNSTI4 25
LEI4 $592
line 896
;896:		{
line 897
;897:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.fallSound );
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+716
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 898
;898:		}
ADDRGP4 $591
JUMPV
LABELV $592
line 900
;899:		else
;900:		{
line 901
;901:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, trap_S_RegisterSound( "sound/movers/objects/objectHit.wav" ) );
ADDRGP4 $596
ARGP4
ADDRLP4 4
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 902
;902:		}
line 903
;903:	}
ADDRGP4 $591
JUMPV
LABELV $590
line 904
;904:	else if (delta > 50)
ADDRLP4 0
INDIRI4
CNSTI4 50
LEI4 $597
line 905
;905:	{
line 906
;906:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.fallSound );
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+716
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 907
;907:		trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $601
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 909
;908:			CG_CustomSound( cent->currentState.number, "*land1.wav" ) );
;909:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 910
;910:	}
ADDRGP4 $598
JUMPV
LABELV $597
line 911
;911:	else if (delta > 44)
ADDRLP4 0
INDIRI4
CNSTI4 44
LEI4 $603
line 912
;912:	{
line 913
;913:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.fallSound );
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+716
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 914
;914:		trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $601
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 916
;915:			CG_CustomSound( cent->currentState.number, "*land1.wav" ) );
;916:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 917
;917:	}
ADDRGP4 $604
JUMPV
LABELV $603
line 919
;918:	else
;919:	{
line 920
;920:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+712
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 921
;921:	}
LABELV $604
LABELV $598
LABELV $591
line 923
;922:	
;923:	if ( clientNum == cg.predictedPlayerState.clientNum )
ADDRFP4 8
INDIRI4
ADDRGP4 cg+96+144
INDIRI4
NEI4 $610
line 924
;924:	{
line 926
;925:		// smooth landing z changes
;926:		cg.landChange = -delta;
ADDRGP4 cg+3500
ADDRLP4 0
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 927
;927:		if (cg.landChange > 32)
ADDRGP4 cg+3500
INDIRF4
CNSTF4 1107296256
LEF4 $615
line 928
;928:		{
line 929
;929:			cg.landChange = 32;
ADDRGP4 cg+3500
CNSTF4 1107296256
ASGNF4
line 930
;930:		}
LABELV $615
line 931
;931:		if (cg.landChange < -32)
ADDRGP4 cg+3500
INDIRF4
CNSTF4 3254779904
GEF4 $619
line 932
;932:		{
line 933
;933:			cg.landChange = -32;
ADDRGP4 cg+3500
CNSTF4 3254779904
ASGNF4
line 934
;934:		}
LABELV $619
line 935
;935:		cg.landTime = cg.time;
ADDRGP4 cg+3504
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 936
;936:	}
LABELV $610
line 937
;937:}
LABELV $589
endproc DoFall 8 16
export CG_InClientBitflags
proc CG_InClientBitflags 8 0
line 940
;938:
;939:int CG_InClientBitflags(entityState_t *ent, int client)
;940:{
line 942
;941:	int checkIn;
;942:	int sub = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 944
;943:
;944:	if (client > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $626
line 945
;945:	{
line 946
;946:		checkIn = ent->trickedentindex4;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 947
;947:		sub = 48;
ADDRLP4 0
CNSTI4 48
ASGNI4
line 948
;948:	}
ADDRGP4 $627
JUMPV
LABELV $626
line 949
;949:	else if (client > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $628
line 950
;950:	{
line 951
;951:		checkIn = ent->trickedentindex3;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ASGNI4
line 952
;952:		sub = 32;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 953
;953:	}
ADDRGP4 $629
JUMPV
LABELV $628
line 954
;954:	else if (client > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $630
line 955
;955:	{
line 956
;956:		checkIn = ent->trickedentindex2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 957
;957:		sub = 16;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 958
;958:	}
ADDRGP4 $631
JUMPV
LABELV $630
line 960
;959:	else
;960:	{
line 961
;961:		checkIn = ent->trickedentindex;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 962
;962:	}
LABELV $631
LABELV $629
LABELV $627
line 964
;963:
;964:	if (checkIn & (1 << (client-sub)))
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $632
line 965
;965:	{
line 966
;966:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $625
JUMPV
LABELV $632
line 969
;967:	}
;968:	
;969:	return 0;
CNSTI4 0
RETI4
LABELV $625
endproc CG_InClientBitflags 8 0
lit
align 4
LABELV $1063
byte 4 3245342720
byte 4 3245342720
byte 4 3246391296
align 4
LABELV $1064
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
align 4
LABELV $1310
byte 4 3245342720
byte 4 3245342720
byte 4 3246391296
align 4
LABELV $1311
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
align 4
LABELV $1328
byte 4 3245342720
byte 4 3245342720
byte 4 3246391296
align 4
LABELV $1329
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export CG_EntityEvent
code
proc CG_EntityEvent 1252 36
line 981
;970:}
;971:
;972:/*
;973:==============
;974:CG_EntityEvent
;975:
;976:An entity has an event value
;977:also called by CG_CheckPlayerstateEvents
;978:==============
;979:*/
;980:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;981:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 988
;982:	entityState_t	*es;
;983:	int				event;
;984:	vec3_t			dir;
;985:	const char		*s;
;986:	int				clientNum;
;987:	clientInfo_t	*ci;
;988:	int				eID = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 989
;989:	int				isnd = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 992
;990:	centity_t		*cl_ent;
;991:
;992:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 993
;993:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 995
;994:
;995:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $635
line 996
;996:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $638
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 997
;997:	}
LABELV $635
line 999
;998:
;999:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $639
line 1000
;1000:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $634
ADDRGP4 $644
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1001
;1001:		return;
ADDRGP4 $634
JUMPV
LABELV $639
line 1004
;1002:	}
;1003:
;1004:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 1005
;1005:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $647
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $645
LABELV $647
line 1006
;1006:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1007
;1007:	}
LABELV $645
line 1008
;1008:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 36
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 1010
;1009:
;1010:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $649
ADDRLP4 8
INDIRI4
CNSTI4 109
GTI4 $649
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1756-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1756
address $651
address $658
address $668
address $679
address $690
address $701
address $721
address $721
address $721
address $721
address $712
address $751
address $756
address $773
address $779
address $834
address $841
address $848
address $855
address $861
address $913
address $927
address $941
address $948
address $986
address $999
address $1005
address $1032
address $1053
address $1059
address $1079
address $1099
address $1119
address $1126
address $1133
address $1146
address $1175
address $1197
address $649
address $1207
address $1212
address $1217
address $1222
address $1227
address $1232
address $1237
address $1242
address $1247
address $1252
address $1257
address $1262
address $1267
address $1272
address $1277
address $649
address $1282
address $1347
address $1340
address $1305
address $1323
address $1355
address $1428
address $1454
address $1489
address $1505
address $1514
address $1531
address $1542
address $1600
address $1609
address $1614
address $1619
address $1433
address $1440
address $1447
address $649
address $1636
address $1646
address $1646
address $1646
address $1657
address $1662
address $1673
address $1684
address $1694
address $1360
address $1365
address $1370
address $1375
address $1380
address $1392
address $1403
address $1416
address $1422
address $1713
address $1722
address $1731
address $1736
address $1741
address $1708
address $1699
address $792
address $798
address $804
address $810
address $816
address $822
address $828
address $1746
code
LABELV $651
line 1015
;1011:	//
;1012:	// movement generated events
;1013:	//
;1014:	case EV_CLIENTJOIN:
;1015:		DEBUGNAME("EV_CLIENTJOIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $652
ADDRGP4 $655
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $652
line 1018
;1016:
;1017:		//Slight hack to force a local reinit of client entity on join.
;1018:		cl_ent = &cg_entities[es->eventParm];
ADDRLP4 32
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1020
;1019:
;1020:		if (cl_ent)
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
line 1021
;1021:		{
line 1022
;1022:			cl_ent->isATST = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 0
ASGNI4
line 1023
;1023:			cl_ent->atstFootClang = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1032
ADDP4
CNSTI4 0
ASGNI4
line 1024
;1024:			cl_ent->atstSwinging = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1036
ADDP4
CNSTI4 0
ASGNI4
line 1026
;1025://			cl_ent->torsoBolt = 0;
;1026:			cl_ent->bolt1 = 0;
ADDRLP4 32
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 0
ASGNI4
line 1027
;1027:			cl_ent->bolt2 = 0;
ADDRLP4 32
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 1028
;1028:			cl_ent->bolt3 = 0;
ADDRLP4 32
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 1029
;1029:			cl_ent->bolt4 = 0;
ADDRLP4 32
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 0
ASGNI4
line 1030
;1030:			cl_ent->saberLength = SABER_LENGTH_MAX;
ADDRLP4 32
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1109393408
ASGNF4
line 1031
;1031:			cl_ent->saberExtendTime = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1004
ADDP4
CNSTI4 0
ASGNI4
line 1032
;1032:			cl_ent->boltInfo = 0;
ADDRLP4 32
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 0
ASGNI4
line 1033
;1033:			cl_ent->frame_minus1_refreshed = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 0
ASGNI4
line 1034
;1034:			cl_ent->frame_minus2_refreshed = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1468
ADDP4
CNSTI4 0
ASGNI4
line 1035
;1035:			cl_ent->frame_hold_time = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1684
ADDP4
CNSTI4 0
ASGNI4
line 1036
;1036:			cl_ent->frame_hold_refreshed = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1688
ADDP4
CNSTI4 0
ASGNI4
line 1037
;1037:			cl_ent->trickAlpha = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 0
ASGNI4
line 1038
;1038:			cl_ent->trickAlphaTime = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1908
ADDP4
CNSTI4 0
ASGNI4
line 1039
;1039:			cl_ent->ghoul2weapon = NULL;
ADDRLP4 32
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 1040
;1040:			cl_ent->weapon = WP_NONE;
ADDRLP4 32
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 1041
;1041:			cl_ent->teamPowerEffectTime = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1912
ADDP4
CNSTI4 0
ASGNI4
line 1042
;1042:			cl_ent->teamPowerType = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1916
ADDP4
CNSTI4 0
ASGNI4
line 1043
;1043:		}
line 1044
;1044:		break;
ADDRGP4 $650
JUMPV
LABELV $658
line 1047
;1045:
;1046:	case EV_FOOTSTEP:
;1047:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $659
ADDRGP4 $662
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $659
line 1048
;1048:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1049
;1049:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 36
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+70296+604
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1051
;1050:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;1051:		}
line 1052
;1052:		break;
ADDRGP4 $650
JUMPV
LABELV $668
line 1054
;1053:	case EV_FOOTSTEP_METAL:
;1054:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $669
ADDRGP4 $672
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $669
line 1055
;1055:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1056
;1056:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+16
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1058
;1057:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;1058:		}
line 1059
;1059:		break;
ADDRGP4 $650
JUMPV
LABELV $679
line 1061
;1060:	case EV_FOOTSPLASH:
;1061:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $680
ADDRGP4 $683
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $680
line 1062
;1062:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1063
;1063:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1065
;1064:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;1065:		}
line 1066
;1066:		break;
ADDRGP4 $650
JUMPV
LABELV $690
line 1068
;1067:	case EV_FOOTWADE:
;1068:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $691
ADDRGP4 $694
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $691
line 1069
;1069:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1070
;1070:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1072
;1071:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;1072:		}
line 1073
;1073:		break;
ADDRGP4 $650
JUMPV
LABELV $701
line 1075
;1074:	case EV_SWIM:
;1075:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $702
ADDRGP4 $705
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $702
line 1076
;1076:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1077
;1077:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1079
;1078:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;1079:		}
line 1080
;1080:		break;
ADDRGP4 $650
JUMPV
LABELV $712
line 1084
;1081:
;1082:
;1083:	case EV_FALL:
;1084:		DEBUGNAME("EV_FALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $713
ADDRGP4 $716
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $713
line 1085
;1085:		if (es->number == cg.snap->ps.clientNum && cg.snap->ps.fallingToDeath)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $717
ADDRGP4 cg+36
INDIRP4
CNSTI4 1396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $717
line 1086
;1086:		{
line 1087
;1087:			break;
ADDRGP4 $650
JUMPV
LABELV $717
line 1089
;1088:		}
;1089:		DoFall(cent, es, clientNum);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 DoFall
CALLV
pop
line 1090
;1090:		break;
ADDRGP4 $650
JUMPV
LABELV $721
line 1095
;1091:	case EV_STEP_4:
;1092:	case EV_STEP_8:
;1093:	case EV_STEP_12:
;1094:	case EV_STEP_16:		// smooth out step up transitions
;1095:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $722
ADDRGP4 $725
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $722
line 1096
;1096:	{
line 1101
;1097:		float	oldStep;
;1098:		int		delta;
;1099:		int		step;
;1100:
;1101:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+96+144
INDIRI4
EQI4 $726
line 1102
;1102:			break;
ADDRGP4 $650
JUMPV
LABELV $726
line 1105
;1103:		}
;1104:		// if we are interpolating, we don't need to smooth steps
;1105:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $738
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 64
INDIRI4
NEI4 $738
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $738
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $730
LABELV $738
line 1106
;1106:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 1107
;1107:			break;
ADDRGP4 $650
JUMPV
LABELV $730
line 1110
;1108:		}
;1109:		// check for stepping up before a previous step is completed
;1110:		delta = cg.time - cg.stepTime;
ADDRLP4 52
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+3488
INDIRI4
SUBI4
ASGNI4
line 1111
;1111:		if (delta < STEP_TIME) {
ADDRLP4 52
INDIRI4
CNSTI4 200
GEI4 $741
line 1112
;1112:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 56
ADDRGP4 cg+3484
INDIRF4
CNSTI4 200
ADDRLP4 52
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 1113
;1113:		} else {
ADDRGP4 $742
JUMPV
LABELV $741
line 1114
;1114:			oldStep = 0;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 1115
;1115:		}
LABELV $742
line 1118
;1116:
;1117:		// add this amount
;1118:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 60
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 28
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 1119
;1119:		cg.stepChange = oldStep + step;
ADDRGP4 cg+3484
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1120
;1120:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+3484
INDIRF4
CNSTF4 1107296256
LEF4 $745
line 1121
;1121:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+3484
CNSTF4 1107296256
ASGNF4
line 1122
;1122:		}
LABELV $745
line 1123
;1123:		cg.stepTime = cg.time;
ADDRGP4 cg+3488
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1124
;1124:		break;
ADDRGP4 $650
JUMPV
LABELV $751
line 1128
;1125:	}
;1126:
;1127:	case EV_JUMP_PAD:
;1128:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $755
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1129
;1129:		break;
ADDRGP4 $650
JUMPV
LABELV $756
line 1132
;1130:
;1131:	case EV_PRIVATE_DUEL:
;1132:		DEBUGNAME("EV_PRIVATE_DUEL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $757
ADDRGP4 $760
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $757
line 1134
;1133:
;1134:		if (cg.snap->ps.clientNum != es->number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $761
line 1135
;1135:		{
line 1136
;1136:			break;
ADDRGP4 $650
JUMPV
LABELV $761
line 1139
;1137:		}
;1138:
;1139:		if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $764
line 1140
;1140:		{ //starting the duel
line 1141
;1141:			if (es->eventParm == 2)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
NEI4 $766
line 1142
;1142:			{
line 1143
;1143:				CG_CenterPrint( CG_GetStripEdString("SVINGAME", "BEGIN_DUEL"), 120, GIANTCHAR_WIDTH*2 );				
ADDRGP4 $768
ARGP4
ADDRGP4 $769
ARGP4
ADDRLP4 52
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 120
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 1144
;1144:				trap_S_StartLocalSound( cgs.media.countFightSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+70296+852
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1145
;1145:			}
ADDRGP4 $650
JUMPV
LABELV $766
line 1147
;1146:			else
;1147:			{
line 1148
;1148:				trap_S_StartBackgroundTrack( "music/mp/duel.mp3", "music/mp/duel.mp3", qfalse );
ADDRLP4 52
ADDRGP4 $772
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1149
;1149:			}
line 1150
;1150:		}
ADDRGP4 $650
JUMPV
LABELV $764
line 1152
;1151:		else
;1152:		{ //ending the duel
line 1153
;1153:			CG_StartMusic(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 CG_StartMusic
CALLV
pop
line 1154
;1154:		}
line 1155
;1155:		break;
ADDRGP4 $650
JUMPV
LABELV $773
line 1158
;1156:
;1157:	case EV_JUMP:
;1158:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $774
ADDRGP4 $777
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $774
line 1159
;1159:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $778
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1160
;1160:		break;
ADDRGP4 $650
JUMPV
LABELV $779
line 1162
;1161:	case EV_ROLL:
;1162:		DEBUGNAME("EV_ROLL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $780
ADDRGP4 $783
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $780
line 1163
;1163:		if (es->number == cg.snap->ps.clientNum && cg.snap->ps.fallingToDeath)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $784
ADDRGP4 cg+36
INDIRP4
CNSTI4 1396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $784
line 1164
;1164:		{
line 1165
;1165:			break;
ADDRGP4 $650
JUMPV
LABELV $784
line 1167
;1166:		}
;1167:		if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $788
line 1168
;1168:		{ //fall-roll-in-one event
line 1169
;1169:			DoFall(cent, es, clientNum);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 DoFall
CALLV
pop
line 1170
;1170:		}
LABELV $788
line 1172
;1171:
;1172:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $778
ARGP4
ADDRLP4 56
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1173
;1173:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.rollSound  );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+70296+752
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1176
;1174:
;1175:		//FIXME: need some sort of body impact on ground sound and maybe kick up some dust?
;1176:		break;
ADDRGP4 $650
JUMPV
LABELV $792
line 1179
;1177:
;1178:	case EV_TAUNT:
;1179:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $793
ADDRGP4 $796
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $793
line 1180
;1180:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $797
ARGP4
ADDRLP4 60
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1181
;1181:		break;
ADDRGP4 $650
JUMPV
LABELV $798
line 1183
;1182:	case EV_TAUNT_YES:
;1183:		DEBUGNAME("EV_TAUNT_YES");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $799
ADDRGP4 $802
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $799
line 1184
;1184:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $803
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1185
;1185:		break;
ADDRGP4 $650
JUMPV
LABELV $804
line 1187
;1186:	case EV_TAUNT_NO:
;1187:		DEBUGNAME("EV_TAUNT_NO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $805
ADDRGP4 $808
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $805
line 1188
;1188:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $809
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1189
;1189:		break;
ADDRGP4 $650
JUMPV
LABELV $810
line 1191
;1190:	case EV_TAUNT_FOLLOWME:
;1191:		DEBUGNAME("EV_TAUNT_FOLLOWME");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $811
ADDRGP4 $814
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $811
line 1192
;1192:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $815
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1193
;1193:		break;
ADDRGP4 $650
JUMPV
LABELV $816
line 1195
;1194:	case EV_TAUNT_GETFLAG:
;1195:		DEBUGNAME("EV_TAUNT_GETFLAG");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $817
ADDRGP4 $820
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $817
line 1196
;1196:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $821
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1197
;1197:		break;
ADDRGP4 $650
JUMPV
LABELV $822
line 1199
;1198:	case EV_TAUNT_GUARDBASE:
;1199:		DEBUGNAME("EV_TAUNT_GUARDBASE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $823
ADDRGP4 $826
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $823
line 1200
;1200:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $827
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1201
;1201:		break;
ADDRGP4 $650
JUMPV
LABELV $828
line 1203
;1202:	case EV_TAUNT_PATROL:
;1203:		DEBUGNAME("EV_TAUNT_PATROL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $829
ADDRGP4 $832
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $829
line 1204
;1204:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $833
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1205
;1205:		break;
ADDRGP4 $650
JUMPV
LABELV $834
line 1207
;1206:	case EV_WATER_TOUCH:
;1207:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $835
ADDRGP4 $838
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $835
line 1208
;1208:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+756
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1209
;1209:		break;
ADDRGP4 $650
JUMPV
LABELV $841
line 1211
;1210:	case EV_WATER_LEAVE:
;1211:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $842
ADDRGP4 $845
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $842
line 1212
;1212:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+760
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1213
;1213:		break;
ADDRGP4 $650
JUMPV
LABELV $848
line 1215
;1214:	case EV_WATER_UNDER:
;1215:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $849
ADDRGP4 $852
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $849
line 1216
;1216:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+764
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1217
;1217:		break;
ADDRGP4 $650
JUMPV
LABELV $855
line 1219
;1218:	case EV_WATER_CLEAR:
;1219:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $856
ADDRGP4 $859
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $856
line 1220
;1220:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $860
ARGP4
ADDRLP4 64
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1221
;1221:		break;
ADDRGP4 $650
JUMPV
LABELV $861
line 1224
;1222:
;1223:	case EV_ITEM_PICKUP:
;1224:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $862
ADDRGP4 $865
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $862
line 1225
;1225:		{
line 1228
;1226:			gitem_t	*item;
;1227:			int		index;
;1228:			qboolean	newindex = qfalse;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 1230
;1229:
;1230:			index = cg_entities[es->eventParm].currentState.modelindex;		// player predicted
ADDRLP4 72
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+212
ADDP4
INDIRI4
ASGNI4
line 1232
;1231:
;1232:			if (index < 1 && cg_entities[es->eventParm].currentState.isJediMaster)
ADDRLP4 72
INDIRI4
CNSTI4 1
GEI4 $867
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $867
line 1233
;1233:			{ //a holocron most likely
line 1234
;1234:				index = cg_entities[es->eventParm].currentState.trickedentindex4;
ADDRLP4 72
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+160
ADDP4
INDIRI4
ASGNI4
line 1235
;1235:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.holocronPickup );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+1248
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1237
;1236:								
;1237:				if (es->number == cg.snap->ps.clientNum && showPowersName[index])
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $873
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 showPowersName
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $873
line 1238
;1238:				{
line 1239
;1239:					const char *strText = CG_GetStripEdString("INGAMETEXT", "PICKUPLINE");
ADDRGP4 $241
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 84
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 84
INDIRP4
ASGNP4
line 1242
;1240:
;1241:					//Com_Printf("%s %s\n", strText, showPowersName[index]);
;1242:					CG_CenterPrint( va("%s %s\n", strText, CG_GetStripEdString("INGAME",showPowersName[index])), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $876
ARGP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 showPowersName
ADDP4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $242
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 1243
;1243:				}
LABELV $873
line 1246
;1244:
;1245:				//Show the player their force selection bar in case picking the holocron up changed the current selection
;1246:				if (index != FP_SABERATTACK && index != FP_SABERDEFEND && index != FP_SABERTHROW &&
ADDRLP4 80
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 15
EQI4 $877
ADDRLP4 80
INDIRI4
CNSTI4 16
EQI4 $877
ADDRLP4 80
INDIRI4
CNSTI4 17
EQI4 $877
ADDRLP4 84
CNSTI4 1
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $877
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $877
ADDRLP4 88
CNSTI4 896
ASGNI4
ADDRLP4 80
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRI4
EQI4 $883
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $877
LABELV $883
line 1250
;1247:					index != FP_LEVITATION &&
;1248:					es->number == cg.snap->ps.clientNum &&
;1249:					(index == cg.snap->ps.fd.forcePowerSelected || !(cg.snap->ps.fd.forcePowersActive & (1 << cg.snap->ps.fd.forcePowerSelected))))
;1250:				{
line 1251
;1251:					if (cg.forceSelect != index)
ADDRGP4 cg+3512
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $884
line 1252
;1252:					{
line 1253
;1253:						cg.forceSelect = index;
ADDRGP4 cg+3512
ADDRLP4 72
INDIRI4
ASGNI4
line 1254
;1254:						newindex = qtrue;
ADDRLP4 68
CNSTI4 1
ASGNI4
line 1255
;1255:					}
LABELV $884
line 1256
;1256:				}
LABELV $877
line 1258
;1257:
;1258:				if (es->number == cg.snap->ps.clientNum && newindex)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $650
line 1259
;1259:				{
line 1260
;1260:					if (cg.forceSelectTime < cg.time)
ADDRGP4 cg+13792
INDIRF4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
GEF4 $650
line 1261
;1261:					{
line 1262
;1262:						cg.forceSelectTime = cg.time;
ADDRGP4 cg+13792
ADDRGP4 cg+64
INDIRI4
CVIF4 4
ASGNF4
line 1263
;1263:					}
line 1264
;1264:				}
line 1266
;1265:
;1266:				break;
ADDRGP4 $650
JUMPV
LABELV $867
line 1269
;1267:			}
;1268:
;1269:			if (cg_entities[es->eventParm].weapon >= cg.time)
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+956
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LTI4 $897
line 1270
;1270:			{ //rww - an unfortunately necessary hack to prevent double item pickups
line 1271
;1271:				break;
ADDRGP4 $650
JUMPV
LABELV $897
line 1278
;1272:			}
;1273:
;1274:			//Hopefully even if this entity is somehow removed and replaced with, say, another
;1275:			//item, this time will have expired by the time that item needs to be picked up.
;1276:			//Of course, it's quite possible this will fail miserably, so if you've got a better
;1277:			//solution then please do use it.
;1278:			cg_entities[es->eventParm].weapon = cg.time+500;
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+956
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1280
;1279:
;1280:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 80
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 1
LTI4 $905
ADDRLP4 80
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $903
LABELV $905
line 1281
;1281:				break;
ADDRGP4 $650
JUMPV
LABELV $903
line 1283
;1282:			}
;1283:			item = &bg_itemlist[ index ];
ADDRLP4 76
CNSTI4 52
ADDRLP4 72
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1285
;1284:
;1285:			if ( /*item->giType != IT_POWERUP && */item->giType != IT_TEAM) {
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $906
line 1286
;1286:				if (item->pickup_sound && item->pickup_sound[0])
ADDRLP4 84
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $908
ADDRLP4 84
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $908
line 1287
;1287:				{
line 1288
;1288:					trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound ) );
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1289
;1289:				}
LABELV $908
line 1290
;1290:			}
LABELV $906
line 1293
;1291:
;1292:			// show icon and name on status bar
;1293:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1294
;1294:				CG_ItemPickup( index );
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 1295
;1295:			}
line 1296
;1296:		}
line 1297
;1297:		break;
ADDRGP4 $650
JUMPV
LABELV $913
line 1300
;1298:
;1299:	case EV_GLOBAL_ITEM_PICKUP:
;1300:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $914
ADDRGP4 $917
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $914
line 1301
;1301:		{
line 1305
;1302:			gitem_t	*item;
;1303:			int		index;
;1304:
;1305:			index = es->eventParm;		// player predicted
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
line 1307
;1306:
;1307:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 76
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1
LTI4 $920
ADDRLP4 76
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $918
LABELV $920
line 1308
;1308:				break;
ADDRGP4 $650
JUMPV
LABELV $918
line 1310
;1309:			}
;1310:			item = &bg_itemlist[ index ];
ADDRLP4 72
CNSTI4 52
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1312
;1311:			// powerup pickups are global
;1312:			if( item->pickup_sound && item->pickup_sound[0] ) {
ADDRLP4 80
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $921
ADDRLP4 80
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $921
line 1313
;1313:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound) );
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1314
;1314:			}
LABELV $921
line 1317
;1315:
;1316:			// show icon and name on status bar
;1317:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1318
;1318:				CG_ItemPickup( index );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 1319
;1319:			}
line 1320
;1320:		}
line 1321
;1321:		break;
ADDRGP4 $650
JUMPV
LABELV $927
line 1327
;1322:
;1323:	//
;1324:	// weapon events
;1325:	//
;1326:	case EV_NOAMMO:
;1327:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $928
ADDRGP4 $931
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $928
line 1329
;1328://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;1329:		if ( es->number == cg.snap->ps.clientNum )
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1330
;1330:		{
line 1331
;1331:			int weap = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 1333
;1332:
;1333:			if (es->eventParm && es->eventParm < WP_NUM_WEAPONS)
ADDRLP4 72
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $935
ADDRLP4 72
INDIRI4
CNSTI4 16
GEI4 $935
line 1334
;1334:			{
line 1335
;1335:				cg.snap->ps.stats[STAT_WEAPONS] &= ~(1 << es->eventParm);
ADDRLP4 76
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 1336
;1336:				weap = cg.snap->ps.weapon;
ADDRLP4 68
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 1337
;1337:			}
ADDRGP4 $936
JUMPV
LABELV $935
line 1338
;1338:			else if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $939
line 1339
;1339:			{
line 1340
;1340:				weap = (es->eventParm-WP_NUM_WEAPONS);
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1341
;1341:			}
LABELV $939
LABELV $936
line 1342
;1342:			CG_OutOfAmmoChange(weap);
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 1343
;1343:		}
line 1344
;1344:		break;
ADDRGP4 $650
JUMPV
LABELV $941
line 1346
;1345:	case EV_CHANGE_WEAPON:
;1346:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $942
ADDRGP4 $945
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $942
line 1347
;1347:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+600
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1348
;1348:		break;
ADDRGP4 $650
JUMPV
LABELV $948
line 1350
;1349:	case EV_FIRE_WEAPON:
;1350:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $949
ADDRGP4 $952
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $949
line 1351
;1351:		if (cent->currentState.number >= MAX_CLIENTS && cent->currentState.eType != ET_GRAPPLE)
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $953
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
EQI4 $953
line 1352
;1352:		{ //special case for turret firing
line 1356
;1353:			vec3_t gunpoint, gunangle;
;1354:			mdxaBone_t matrix;
;1355:
;1356:			weaponInfo_t *weaponInfo = &cg_weapons[WP_TURRET];
ADDRLP4 72
ADDRGP4 cg_weapons+3120
ASGNP4
line 1358
;1357:
;1358:			if ( !weaponInfo->registered )
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $956
line 1359
;1359:			{
line 1360
;1360:				memset( weaponInfo, 0, sizeof( *weaponInfo ) );
ADDRLP4 72
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1362
;1361:
;1362:				weaponInfo->flashSound[0]		= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 0
ASGNI4
line 1363
;1363:				weaponInfo->firingSound			= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 1364
;1364:				weaponInfo->chargeSound			= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1365
;1365:				weaponInfo->muzzleEffect		= NULL_HANDLE;
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 1366
;1366:				weaponInfo->missileModel		= NULL_HANDLE;
ADDRLP4 72
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 1367
;1367:				weaponInfo->missileSound		= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 100
ADDP4
CNSTI4 0
ASGNI4
line 1368
;1368:				weaponInfo->missileDlight		= 0;
ADDRLP4 72
INDIRP4
CNSTI4 108
ADDP4
CNSTF4 0
ASGNF4
line 1369
;1369:				weaponInfo->missileHitSound		= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 1370
;1370:				weaponInfo->missileTrailFunc	= FX_TurretProjectileThink;
ADDRLP4 72
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 FX_TurretProjectileThink
ASGNP4
line 1372
;1371:
;1372:				trap_FX_RegisterEffect("effects/blaster/wall_impact.efx");
ADDRGP4 $958
ARGP4
ADDRGP4 trap_FX_RegisterEffect
CALLI4
pop
line 1373
;1373:				trap_FX_RegisterEffect("effects/blaster/flesh_impact.efx");
ADDRGP4 $959
ARGP4
ADDRGP4 trap_FX_RegisterEffect
CALLI4
pop
line 1375
;1374:
;1375:				weaponInfo->registered = qtrue;
ADDRLP4 72
INDIRP4
CNSTI4 1
ASGNI4
line 1376
;1376:			}
LABELV $956
line 1378
;1377:
;1378:			if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
line 1379
;1379:			{
line 1380
;1380:				if (!cent->bolt1)
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
CNSTI4 0
NEI4 $962
line 1381
;1381:				{
line 1382
;1382:					cent->bolt1 = trap_G2API_AddBolt(cent->ghoul2, 0, "*flash01");
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $964
ARGP4
ADDRLP4 152
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 1383
;1383:				}
LABELV $962
line 1384
;1384:				if (!cent->bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 0
NEI4 $961
line 1385
;1385:				{
line 1386
;1386:					cent->bolt2 = trap_G2API_AddBolt(cent->ghoul2, 0, "*flash02");
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $967
ARGP4
ADDRLP4 152
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 988
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 1387
;1387:				}
line 1388
;1388:			}
line 1390
;1389:			else
;1390:			{
line 1391
;1391:				break;
LABELV $961
line 1394
;1392:			}
;1393:
;1394:			if (cent->currentState.eventParm)
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $968
line 1395
;1395:			{
line 1396
;1396:				trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cent->bolt2, &matrix, cent->currentState.angles, cent->currentState.origin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 1397
;1397:			}
ADDRGP4 $969
JUMPV
LABELV $968
line 1399
;1398:			else
;1399:			{
line 1400
;1400:				trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cent->bolt1, &matrix, cent->currentState.angles, cent->currentState.origin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 1401
;1401:			}
LABELV $969
line 1403
;1402:
;1403:			gunpoint[0] = matrix.matrix[0][3];
ADDRLP4 124
ADDRLP4 76+12
INDIRF4
ASGNF4
line 1404
;1404:			gunpoint[1] = matrix.matrix[1][3];
ADDRLP4 124+4
ADDRLP4 76+16+12
INDIRF4
ASGNF4
line 1405
;1405:			gunpoint[2] = matrix.matrix[2][3];
ADDRLP4 124+8
ADDRLP4 76+32+12
INDIRF4
ASGNF4
line 1407
;1406:
;1407:			gunangle[0] = -matrix.matrix[0][0];
ADDRLP4 136
ADDRLP4 76
INDIRF4
NEGF4
ASGNF4
line 1408
;1408:			gunangle[1] = -matrix.matrix[1][0];
ADDRLP4 136+4
ADDRLP4 76+16
INDIRF4
NEGF4
ASGNF4
line 1409
;1409:			gunangle[2] = -matrix.matrix[2][0];
ADDRLP4 136+8
ADDRLP4 76+32
INDIRF4
NEGF4
ASGNF4
line 1411
;1410:
;1411:			trap_FX_PlayEffectID(trap_FX_RegisterEffect( "effects/turret/muzzle_flash.efx" ), gunpoint, gunangle);
ADDRGP4 $985
ARGP4
ADDRLP4 148
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRLP4 124
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1412
;1412:		}
ADDRGP4 $650
JUMPV
LABELV $953
line 1414
;1413:		else
;1414:		{
line 1415
;1415:			CG_FireWeapon( cent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 1416
;1416:		}
line 1417
;1417:		break;
ADDRGP4 $650
JUMPV
LABELV $986
line 1420
;1418:
;1419:	case EV_ALT_FIRE:
;1420:		DEBUGNAME("EV_ALT_FIRE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $987
ADDRGP4 $990
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $987
line 1421
;1421:		CG_FireWeapon( cent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 1424
;1422:
;1423:		//if you just exploded your detpacks and you have no ammo left for them, autoswitch
;1424:		if ( cg.snap->ps.clientNum == cent->currentState.number &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $650
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 13
NEI4 $650
line 1426
;1425:			cg.snap->ps.weapon == WP_DET_PACK )
;1426:		{
line 1427
;1427:			if (cg.snap->ps.ammo[weaponData[WP_DET_PACK].ammoIndex] == 0) 
ADDRGP4 weaponData+728
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 452
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $650
line 1428
;1428:			{
line 1429
;1429:				CG_OutOfAmmoChange(WP_DET_PACK);
CNSTI4 13
ARGI4
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 1430
;1430:			}
line 1431
;1431:		}
line 1433
;1432:
;1433:		break;
ADDRGP4 $650
JUMPV
LABELV $999
line 1436
;1434:
;1435:	case EV_SABER_ATTACK:
;1436:		DEBUGNAME("EV_SABER_ATTACK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1000
ADDRGP4 $1003
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1000
line 1437
;1437:		trap_S_StartSound(es->pos.trBase, es->number, CHAN_WEAPON, trap_S_RegisterSound(va("sound/weapons/saber/saberhup%i.wav", Q_irand(1, 8))));
CNSTI4 1
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 72
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $1004
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1438
;1438:		break;
ADDRGP4 $650
JUMPV
LABELV $1005
line 1441
;1439:
;1440:	case EV_SABER_HIT:
;1441:		DEBUGNAME("EV_SABER_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1006
ADDRGP4 $1009
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1006
line 1442
;1442:		if (es->eventParm == 16)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 16
NEI4 $1010
line 1443
;1443:		{ //Make lots of sparks, something special happened
line 1445
;1444:			vec3_t fxDir;
;1445:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1446
;1446:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1012
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1012
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1012
line 1447
;1447:			{
line 1448
;1448:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1449
;1449:			}
LABELV $1012
line 1450
;1450:			trap_S_StartSound(es->origin, es->number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/saber/saberhit.wav"));
ADDRGP4 $1017
ARGP4
ADDRLP4 104
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1451
;1451:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 112
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1452
;1452:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 116
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1453
;1453:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 120
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1454
;1454:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 124
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1455
;1455:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 128
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1456
;1456:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 132
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1457
;1457:		}
ADDRGP4 $650
JUMPV
LABELV $1010
line 1458
;1458:		else if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1019
line 1459
;1459:		{ //hit a person
line 1461
;1460:			vec3_t fxDir;
;1461:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1462
;1462:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1021
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1021
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1021
line 1463
;1463:			{
line 1464
;1464:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1465
;1465:			}
LABELV $1021
line 1466
;1466:			trap_S_StartSound(es->origin, es->number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/saber/saberhit.wav"));
ADDRGP4 $1017
ARGP4
ADDRLP4 104
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1467
;1467:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 112
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1468
;1468:		}
ADDRGP4 $650
JUMPV
LABELV $1019
line 1470
;1469:		else
;1470:		{ //hit something else
line 1472
;1471:			vec3_t fxDir;
;1472:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1473
;1473:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1026
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1026
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1026
line 1474
;1474:			{
line 1475
;1475:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1476
;1476:			}			
LABELV $1026
line 1477
;1477:			trap_S_StartSound(es->origin, es->number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/saber/saberhit.wav"));
ADDRGP4 $1017
ARGP4
ADDRLP4 104
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1478
;1478:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/spark.efx"), es->origin, fxDir );
ADDRGP4 $1031
ARGP4
ADDRLP4 112
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1479
;1479:		}
line 1480
;1480:		break;
ADDRGP4 $650
JUMPV
LABELV $1032
line 1483
;1481:
;1482:	case EV_SABER_BLOCK:
;1483:		DEBUGNAME("EV_SABER_BLOCK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1033
ADDRGP4 $1036
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1033
line 1485
;1484:
;1485:		if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1037
line 1486
;1486:		{ //saber block
line 1488
;1487:			vec3_t fxDir;
;1488:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1489
;1489:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1039
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1039
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1039
line 1490
;1490:			{
line 1491
;1491:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1492
;1492:			}
LABELV $1039
line 1493
;1493:			trap_S_StartSound(es->origin, es->number, CHAN_AUTO, trap_S_RegisterSound(va( "sound/weapons/saber/saberblock%d.wav", Q_irand(1, 9) )));
CNSTI4 1
ARGI4
CNSTI4 9
ARGI4
ADDRLP4 104
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $1044
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1494
;1494:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/saber_block.efx"), es->origin, fxDir );
ADDRGP4 $1045
ARGP4
ADDRLP4 120
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1496
;1495:
;1496:			g_saberFlashTime = cg.time-50;
ADDRGP4 g_saberFlashTime
ADDRGP4 cg+64
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1497
;1497:			VectorCopy( es->origin, g_saberFlashPos );
ADDRGP4 g_saberFlashPos
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1498
;1498:		}
ADDRGP4 $650
JUMPV
LABELV $1037
line 1500
;1499:		else
;1500:		{ //projectile block
line 1502
;1501:			vec3_t fxDir;
;1502:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1503
;1503:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1047
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1047
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1047
line 1504
;1504:			{
line 1505
;1505:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1506
;1506:			}
LABELV $1047
line 1507
;1507:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("blaster/deflect.efx"), es->origin, fxDir);
ADDRGP4 $1052
ARGP4
ADDRLP4 104
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1508
;1508:		}
line 1509
;1509:		break;
ADDRGP4 $650
JUMPV
LABELV $1053
line 1512
;1510:
;1511:	case EV_SABER_UNHOLSTER:
;1512:		DEBUGNAME("EV_SABER_UNHOLSTER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1054
ADDRGP4 $1057
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1054
line 1513
;1513:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberon.wav" ) );
ADDRGP4 $1058
ARGP4
ADDRLP4 88
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1514
;1514:		break;
ADDRGP4 $650
JUMPV
LABELV $1059
line 1517
;1515:
;1516:	case EV_BECOME_JEDIMASTER:
;1517:		DEBUGNAME("EV_SABER_UNHOLSTER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1060
ADDRGP4 $1057
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1060
line 1518
;1518:		{
line 1520
;1519:			trace_t tr;
;1520:			vec3_t playerMins = {-15, -15, DEFAULT_MINS_2+8};
ADDRLP4 92
ADDRGP4 $1063
INDIRB
ASGNB 12
line 1521
;1521:			vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 104
ADDRGP4 $1064
INDIRB
ASGNB 12
line 1524
;1522:			vec3_t ang, pos, dpos;
;1523:
;1524:			VectorClear(ang);
ADDRLP4 1232
CNSTF4 0
ASGNF4
ADDRLP4 116+8
ADDRLP4 1232
INDIRF4
ASGNF4
ADDRLP4 116+4
ADDRLP4 1232
INDIRF4
ASGNF4
ADDRLP4 116
ADDRLP4 1232
INDIRF4
ASGNF4
line 1525
;1525:			ang[ROLL] = 1;
ADDRLP4 116+8
CNSTF4 1065353216
ASGNF4
line 1527
;1526:
;1527:			VectorCopy(position, dpos);
ADDRLP4 1208
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1528
;1528:			dpos[2] -= 4096;
ADDRLP4 1208+8
ADDRLP4 1208+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1530
;1529:
;1530:			CG_Trace(&tr, position, playerMins, playerMaxs, dpos, es->number, MASK_SOLID);
ADDRLP4 128
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 1208
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1531
;1531:			VectorCopy(tr.endpos, pos);
ADDRLP4 1220
ADDRLP4 128+12
INDIRB
ASGNB 12
line 1533
;1532:			
;1533:			if (tr.fraction == 1)
ADDRLP4 128+8
INDIRF4
CNSTF4 1065353216
NEF4 $1070
line 1534
;1534:			{
line 1535
;1535:				break;
ADDRGP4 $650
JUMPV
LABELV $1070
line 1537
;1536:			}
;1537:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("mp/jedispawn.efx"), pos, ang);
ADDRGP4 $1073
ARGP4
ADDRLP4 1236
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
ARGI4
ADDRLP4 1220
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1539
;1538:
;1539:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberon.wav" ) );
ADDRGP4 $1058
ARGP4
ADDRLP4 1240
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1240
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1541
;1540:
;1541:			if (cg.snap->ps.clientNum == es->number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $650
line 1542
;1542:			{
line 1543
;1543:				trap_S_StartLocalSound(cgs.media.happyMusic, CHAN_LOCAL);
ADDRGP4 cgs+70296+832
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1544
;1544:				CGCam_SetMusicMult(0.3, 5000);
CNSTF4 1050253722
ARGF4
CNSTI4 5000
ARGI4
ADDRGP4 CGCam_SetMusicMult
CALLV
pop
line 1545
;1545:			}
line 1546
;1546:		}
line 1547
;1547:		break;
ADDRGP4 $650
JUMPV
LABELV $1079
line 1550
;1548:
;1549:	case EV_DISRUPTOR_MAIN_SHOT:
;1550:		DEBUGNAME("EV_DISRUPTOR_MAIN_SHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1080
ADDRGP4 $1083
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1080
line 1551
;1551:		if (cent->currentState.eventParm != cg.snap->ps.clientNum ||
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1088
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1084
LABELV $1088
line 1553
;1552:			cg.renderingThirdPerson)
;1553:		{ //h4q3ry
line 1554
;1554:			CG_GetClientWeaponMuzzleBoltPoint(cent->currentState.eventParm, cent->currentState.origin2);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 CG_GetClientWeaponMuzzleBoltPoint
CALLV
pop
line 1555
;1555:		}
ADDRGP4 $1085
JUMPV
LABELV $1084
line 1557
;1556:		else
;1557:		{
line 1558
;1558:			if (cg.lastFPFlashPoint[0] ||cg.lastFPFlashPoint[1] || cg.lastFPFlashPoint[2])
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRGP4 cg+13796
INDIRF4
ADDRLP4 92
INDIRF4
NEF4 $1097
ADDRGP4 cg+13796+4
INDIRF4
ADDRLP4 92
INDIRF4
NEF4 $1097
ADDRGP4 cg+13796+8
INDIRF4
ADDRLP4 92
INDIRF4
EQF4 $1089
LABELV $1097
line 1559
;1559:			{ //get the position of the muzzle flash for the first person weapon model from the last frame
line 1560
;1560:				VectorCopy(cg.lastFPFlashPoint, cent->currentState.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 cg+13796
INDIRB
ASGNB 12
line 1561
;1561:			}
LABELV $1089
line 1562
;1562:		}
LABELV $1085
line 1563
;1563:		FX_DisruptorMainShot( cent->currentState.origin2, cent->lerpOrigin ); 
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 FX_DisruptorMainShot
CALLV
pop
line 1564
;1564:		break;
ADDRGP4 $650
JUMPV
LABELV $1099
line 1567
;1565:
;1566:	case EV_DISRUPTOR_SNIPER_SHOT:
;1567:		DEBUGNAME("EV_DISRUPTOR_SNIPER_SHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1100
ADDRGP4 $1103
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1100
line 1568
;1568:		if (cent->currentState.eventParm != cg.snap->ps.clientNum ||
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1108
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1104
LABELV $1108
line 1570
;1569:			cg.renderingThirdPerson)
;1570:		{ //h4q3ry
line 1571
;1571:			CG_GetClientWeaponMuzzleBoltPoint(cent->currentState.eventParm, cent->currentState.origin2);
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 CG_GetClientWeaponMuzzleBoltPoint
CALLV
pop
line 1572
;1572:		}
ADDRGP4 $1105
JUMPV
LABELV $1104
line 1574
;1573:		else
;1574:		{
line 1575
;1575:			if (cg.lastFPFlashPoint[0] ||cg.lastFPFlashPoint[1] || cg.lastFPFlashPoint[2])
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRGP4 cg+13796
INDIRF4
ADDRLP4 96
INDIRF4
NEF4 $1117
ADDRGP4 cg+13796+4
INDIRF4
ADDRLP4 96
INDIRF4
NEF4 $1117
ADDRGP4 cg+13796+8
INDIRF4
ADDRLP4 96
INDIRF4
EQF4 $1109
LABELV $1117
line 1576
;1576:			{ //get the position of the muzzle flash for the first person weapon model from the last frame
line 1577
;1577:				VectorCopy(cg.lastFPFlashPoint, cent->currentState.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 cg+13796
INDIRB
ASGNB 12
line 1578
;1578:			}
LABELV $1109
line 1579
;1579:		}
LABELV $1105
line 1580
;1580:		FX_DisruptorAltShot( cent->currentState.origin2, cent->lerpOrigin, cent->currentState.shouldtarget );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ARGI4
ADDRGP4 FX_DisruptorAltShot
CALLV
pop
line 1581
;1581:		break;
ADDRGP4 $650
JUMPV
LABELV $1119
line 1584
;1582:
;1583:	case EV_DISRUPTOR_SNIPER_MISS:
;1584:		DEBUGNAME("EV_DISRUPTOR_SNIPER_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1120
ADDRGP4 $1123
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1120
line 1585
;1585:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1586
;1586:		if (es->weapon)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1124
line 1587
;1587:		{ //primary
line 1588
;1588:			FX_DisruptorHitWall( cent->lerpOrigin, dir );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 FX_DisruptorHitWall
CALLV
pop
line 1589
;1589:		}
ADDRGP4 $650
JUMPV
LABELV $1124
line 1591
;1590:		else
;1591:		{ //secondary
line 1592
;1592:			FX_DisruptorAltMiss( cent->lerpOrigin, dir );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 FX_DisruptorAltMiss
CALLV
pop
line 1593
;1593:		}
line 1594
;1594:		break;
ADDRGP4 $650
JUMPV
LABELV $1126
line 1597
;1595:
;1596:	case EV_DISRUPTOR_HIT:
;1597:		DEBUGNAME("EV_DISRUPTOR_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1127
ADDRGP4 $1130
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1127
line 1598
;1598:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1599
;1599:		if (es->weapon)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1131
line 1600
;1600:		{ //client
line 1601
;1601:			FX_DisruptorHitPlayer( cent->lerpOrigin, dir, qtrue );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 FX_DisruptorHitPlayer
CALLV
pop
line 1602
;1602:		}
ADDRGP4 $650
JUMPV
LABELV $1131
line 1604
;1603:		else
;1604:		{ //non-client
line 1605
;1605:			FX_DisruptorHitWall( cent->lerpOrigin, dir );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 FX_DisruptorHitWall
CALLV
pop
line 1606
;1606:		}
line 1607
;1607:		break;
ADDRGP4 $650
JUMPV
LABELV $1133
line 1610
;1608:
;1609:	case EV_DISRUPTOR_ZOOMSOUND:
;1610:		DEBUGNAME("EV_DISRUPTOR_ZOOMSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1134
ADDRGP4 $1137
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1134
line 1611
;1611:		if (es->number == cg.snap->ps.clientNum)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1612
;1612:		{
line 1613
;1613:			if (cg.snap->ps.zoomMode)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1141
line 1614
;1614:			{
line 1615
;1615:				trap_S_StartLocalSound(trap_S_RegisterSound("sound/weapons/disruptor/zoomstart.wav"), CHAN_AUTO);
ADDRGP4 $1144
ARGP4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1616
;1616:			}
ADDRGP4 $650
JUMPV
LABELV $1141
line 1618
;1617:			else
;1618:			{
line 1619
;1619:				trap_S_StartLocalSound(trap_S_RegisterSound("sound/weapons/disruptor/zoomend.wav"), CHAN_AUTO);
ADDRGP4 $1145
ARGP4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1620
;1620:			}
line 1621
;1621:		}
line 1622
;1622:		break;
ADDRGP4 $650
JUMPV
LABELV $1146
line 1624
;1623:	case EV_PREDEFSOUND:
;1624:		DEBUGNAME("EV_PREDEFSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1147
ADDRGP4 $1150
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1147
line 1625
;1625:		{
line 1626
;1626:			int sID = -1;
ADDRLP4 100
CNSTI4 -1
ASGNI4
line 1628
;1627:
;1628:			switch (es->eventParm)
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 1
LTI4 $1152
ADDRLP4 104
INDIRI4
CNSTI4 6
GTI4 $1152
ADDRLP4 104
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1171-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1171
address $1154
address $1156
address $1158
address $1165
address $1167
address $1169
code
line 1629
;1629:			{
LABELV $1154
line 1631
;1630:			case PDSOUND_PROTECTHIT:
;1631:				sID = trap_S_RegisterSound("sound/weapons/force/protecthit.mp3");
ADDRGP4 $1155
ARGP4
ADDRLP4 112
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 112
INDIRI4
ASGNI4
line 1632
;1632:				break;
ADDRGP4 $1152
JUMPV
LABELV $1156
line 1634
;1633:			case PDSOUND_PROTECT:
;1634:				sID = trap_S_RegisterSound("sound/weapons/force/protect.mp3");
ADDRGP4 $1157
ARGP4
ADDRLP4 116
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 116
INDIRI4
ASGNI4
line 1635
;1635:				break;
ADDRGP4 $1152
JUMPV
LABELV $1158
line 1637
;1636:			case PDSOUND_ABSORBHIT:
;1637:				sID = trap_S_RegisterSound("sound/weapons/force/absorbhit.mp3");
ADDRGP4 $1159
ARGP4
ADDRLP4 120
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 120
INDIRI4
ASGNI4
line 1638
;1638:				if (es->trickedentindex >= 0 && es->trickedentindex < MAX_CLIENTS)
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
LTI4 $1152
ADDRLP4 124
INDIRI4
CNSTI4 32
GEI4 $1152
line 1639
;1639:				{
line 1640
;1640:					int clnum = es->trickedentindex;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 1642
;1641:
;1642:					cg_entities[clnum].teamPowerEffectTime = cg.time + 1000;
CNSTI4 1920
ADDRLP4 128
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1643
;1643:					cg_entities[clnum].teamPowerType = 3;
CNSTI4 1920
ADDRLP4 128
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
CNSTI4 3
ASGNI4
line 1644
;1644:				}
line 1645
;1645:				break;
ADDRGP4 $1152
JUMPV
LABELV $1165
line 1647
;1646:			case PDSOUND_ABSORB:
;1647:				sID = trap_S_RegisterSound("sound/weapons/force/absorb.mp3");
ADDRGP4 $1166
ARGP4
ADDRLP4 128
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 128
INDIRI4
ASGNI4
line 1648
;1648:				break;
ADDRGP4 $1152
JUMPV
LABELV $1167
line 1650
;1649:			case PDSOUND_FORCEJUMP:
;1650:				sID = trap_S_RegisterSound("sound/weapons/force/jump.mp3");
ADDRGP4 $1168
ARGP4
ADDRLP4 132
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 132
INDIRI4
ASGNI4
line 1651
;1651:				break;
ADDRGP4 $1152
JUMPV
LABELV $1169
line 1653
;1652:			case PDSOUND_FORCEGRIP:
;1653:				sID = trap_S_RegisterSound("sound/weapons/force/grip.mp3");
ADDRGP4 $1170
ARGP4
ADDRLP4 136
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 136
INDIRI4
ASGNI4
line 1654
;1654:				break;
line 1656
;1655:			default:
;1656:				break;
LABELV $1152
line 1659
;1657:			}
;1658:
;1659:			if (sID != 1)
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $650
line 1660
;1660:			{
line 1661
;1661:				trap_S_StartSound(es->origin, es->number, CHAN_AUTO, sID);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1662
;1662:			}
line 1663
;1663:		}
line 1664
;1664:		break;
ADDRGP4 $650
JUMPV
LABELV $1175
line 1667
;1665:
;1666:	case EV_TEAM_POWER:
;1667:		DEBUGNAME("EV_TEAM_POWER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1176
ADDRGP4 $1179
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1176
line 1668
;1668:		{
line 1669
;1669:			int clnum = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 $1181
JUMPV
LABELV $1180
line 1672
;1670:
;1671:			while (clnum < MAX_CLIENTS)
;1672:			{
line 1673
;1673:				if (CG_InClientBitflags(es, clnum))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_InClientBitflags
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $1183
line 1674
;1674:				{
line 1675
;1675:					if (es->eventParm == 1)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1185
line 1676
;1676:					{ //eventParm 1 is heal
line 1677
;1677:						trap_S_StartSound (NULL, clnum, CHAN_AUTO, cgs.media.teamHealSound );
CNSTP4 0
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+688
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1678
;1678:						cg_entities[clnum].teamPowerEffectTime = cg.time + 1000;
CNSTI4 1920
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1679
;1679:						cg_entities[clnum].teamPowerType = 1;
CNSTI4 1920
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
CNSTI4 1
ASGNI4
line 1680
;1680:					}
ADDRGP4 $1186
JUMPV
LABELV $1185
line 1682
;1681:					else
;1682:					{ //eventParm 2 is force regen
line 1683
;1683:						trap_S_StartSound (NULL, clnum, CHAN_AUTO, cgs.media.teamRegenSound );
CNSTP4 0
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+692
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1684
;1684:						cg_entities[clnum].teamPowerEffectTime = cg.time + 1000;
CNSTI4 1920
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1685
;1685:						cg_entities[clnum].teamPowerType = 0;
CNSTI4 1920
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
CNSTI4 0
ASGNI4
line 1686
;1686:					}
LABELV $1186
line 1687
;1687:				}
LABELV $1183
line 1688
;1688:				clnum++;
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1689
;1689:			}
LABELV $1181
line 1671
ADDRLP4 100
INDIRI4
CNSTI4 32
LTI4 $1180
line 1690
;1690:		}
line 1691
;1691:		break;
ADDRGP4 $650
JUMPV
LABELV $1197
line 1694
;1692:
;1693:	case EV_SCREENSHAKE:
;1694:		DEBUGNAME("EV_SCREENSHAKE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1198
ADDRGP4 $1201
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1198
line 1695
;1695:		if (!es->modelindex || cg.predictedPlayerState.clientNum == es->modelindex-1)
ADDRLP4 100
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $1206
ADDRGP4 cg+96+144
INDIRI4
ADDRLP4 100
INDIRI4
CNSTI4 1
SUBI4
NEI4 $650
LABELV $1206
line 1696
;1696:		{
line 1697
;1697:			CGCam_Shake(es->angles[0], es->time);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CGCam_Shake
CALLV
pop
line 1698
;1698:		}
line 1699
;1699:		break;
ADDRGP4 $650
JUMPV
LABELV $1207
line 1701
;1700:	case EV_USE_ITEM0:
;1701:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1208
ADDRGP4 $1211
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1208
line 1702
;1702:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1703
;1703:		break;
ADDRGP4 $650
JUMPV
LABELV $1212
line 1705
;1704:	case EV_USE_ITEM1:
;1705:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1213
ADDRGP4 $1216
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1213
line 1706
;1706:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1707
;1707:		break;
ADDRGP4 $650
JUMPV
LABELV $1217
line 1709
;1708:	case EV_USE_ITEM2:
;1709:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1218
ADDRGP4 $1221
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1218
line 1710
;1710:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1711
;1711:		break;
ADDRGP4 $650
JUMPV
LABELV $1222
line 1713
;1712:	case EV_USE_ITEM3:
;1713:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1223
ADDRGP4 $1226
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1223
line 1714
;1714:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1715
;1715:		break;
ADDRGP4 $650
JUMPV
LABELV $1227
line 1717
;1716:	case EV_USE_ITEM4:
;1717:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1228
ADDRGP4 $1231
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1228
line 1718
;1718:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1719
;1719:		break;
ADDRGP4 $650
JUMPV
LABELV $1232
line 1721
;1720:	case EV_USE_ITEM5:
;1721:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1233
ADDRGP4 $1236
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1233
line 1722
;1722:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1723
;1723:		break;
ADDRGP4 $650
JUMPV
LABELV $1237
line 1725
;1724:	case EV_USE_ITEM6:
;1725:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1238
ADDRGP4 $1241
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1238
line 1726
;1726:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1727
;1727:		break;
ADDRGP4 $650
JUMPV
LABELV $1242
line 1729
;1728:	case EV_USE_ITEM7:
;1729:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1243
ADDRGP4 $1246
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1243
line 1730
;1730:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1731
;1731:		break;
ADDRGP4 $650
JUMPV
LABELV $1247
line 1733
;1732:	case EV_USE_ITEM8:
;1733:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1248
ADDRGP4 $1251
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1248
line 1734
;1734:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1735
;1735:		break;
ADDRGP4 $650
JUMPV
LABELV $1252
line 1737
;1736:	case EV_USE_ITEM9:
;1737:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1253
ADDRGP4 $1256
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1253
line 1738
;1738:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1739
;1739:		break;
ADDRGP4 $650
JUMPV
LABELV $1257
line 1741
;1740:	case EV_USE_ITEM10:
;1741:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1258
ADDRGP4 $1261
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1258
line 1742
;1742:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1743
;1743:		break;
ADDRGP4 $650
JUMPV
LABELV $1262
line 1745
;1744:	case EV_USE_ITEM11:
;1745:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1263
ADDRGP4 $1266
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1263
line 1746
;1746:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1747
;1747:		break;
ADDRGP4 $650
JUMPV
LABELV $1267
line 1749
;1748:	case EV_USE_ITEM12:
;1749:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1268
ADDRGP4 $1271
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1268
line 1750
;1750:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1751
;1751:		break;
ADDRGP4 $650
JUMPV
LABELV $1272
line 1753
;1752:	case EV_USE_ITEM13:
;1753:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1273
ADDRGP4 $1276
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1273
line 1754
;1754:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1755
;1755:		break;
ADDRGP4 $650
JUMPV
LABELV $1277
line 1757
;1756:	case EV_USE_ITEM14:
;1757:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1278
ADDRGP4 $1281
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1278
line 1758
;1758:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1759
;1759:		break;
ADDRGP4 $650
JUMPV
LABELV $1282
line 1762
;1760:
;1761:	case EV_ITEMUSEFAIL:
;1762:		DEBUGNAME("EV_ITEMUSEFAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1283
ADDRGP4 $1286
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1283
line 1763
;1763:		if (cg.snap->ps.clientNum == es->number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $650
line 1764
;1764:		{
line 1765
;1765:			char *stripedref = NULL;
ADDRLP4 104
CNSTP4 0
ASGNP4
line 1767
;1766:
;1767:			switch(es->eventParm)
ADDRLP4 108
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 1
LTI4 $1291
ADDRLP4 108
INDIRI4
CNSTI4 4
GTI4 $1291
ADDRLP4 108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1301-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1301
address $1293
address $1295
address $1297
address $1299
code
line 1768
;1768:			{
LABELV $1293
line 1770
;1769:			case SENTRY_NOROOM:
;1770:				stripedref = (char *)CG_GetStripEdString("INGAMETEXT", "SENTRY_NOROOM");
ADDRGP4 $241
ARGP4
ADDRGP4 $1294
ARGP4
ADDRLP4 116
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 116
INDIRP4
ASGNP4
line 1771
;1771:				break;
ADDRGP4 $1291
JUMPV
LABELV $1295
line 1773
;1772:			case SENTRY_ALREADYPLACED:
;1773:				stripedref = (char *)CG_GetStripEdString("INGAMETEXT", "SENTRY_ALREADYPLACED");
ADDRGP4 $241
ARGP4
ADDRGP4 $1296
ARGP4
ADDRLP4 120
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 120
INDIRP4
ASGNP4
line 1774
;1774:				break;
ADDRGP4 $1291
JUMPV
LABELV $1297
line 1776
;1775:			case SHIELD_NOROOM:
;1776:				stripedref = (char *)CG_GetStripEdString("INGAMETEXT", "SHIELD_NOROOM");
ADDRGP4 $241
ARGP4
ADDRGP4 $1298
ARGP4
ADDRLP4 124
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 124
INDIRP4
ASGNP4
line 1777
;1777:				break;
ADDRGP4 $1291
JUMPV
LABELV $1299
line 1779
;1778:			case SEEKER_ALREADYDEPLOYED:
;1779:				stripedref = (char *)CG_GetStripEdString("INGAMETEXT", "SEEKER_ALREADYDEPLOYED");
ADDRGP4 $241
ARGP4
ADDRGP4 $1300
ARGP4
ADDRLP4 128
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 128
INDIRP4
ASGNP4
line 1780
;1780:				break;
line 1782
;1781:			default:
;1782:				break;
LABELV $1291
line 1785
;1783:			}
;1784:
;1785:			if (!stripedref)
ADDRLP4 104
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1303
line 1786
;1786:			{
line 1787
;1787:				break;
ADDRGP4 $650
JUMPV
LABELV $1303
line 1790
;1788:			}
;1789:
;1790:			Com_Printf("%s\n", stripedref);
ADDRGP4 $582
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1791
;1791:		}
line 1792
;1792:		break;
ADDRGP4 $650
JUMPV
LABELV $1305
line 1800
;1793:
;1794:	//=================================================================
;1795:
;1796:	//
;1797:	// other events
;1798:	//
;1799:	case EV_PLAYER_TELEPORT_IN:
;1800:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1306
ADDRGP4 $1309
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1306
line 1801
;1801:		{
line 1803
;1802:			trace_t tr;
;1803:			vec3_t playerMins = {-15, -15, DEFAULT_MINS_2+8};
ADDRLP4 104
ADDRGP4 $1310
INDIRB
ASGNB 12
line 1804
;1804:			vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 116
ADDRGP4 $1311
INDIRB
ASGNB 12
line 1807
;1805:			vec3_t ang, pos, dpos;
;1806:
;1807:			VectorClear(ang);
ADDRLP4 1244
CNSTF4 0
ASGNF4
ADDRLP4 128+8
ADDRLP4 1244
INDIRF4
ASGNF4
ADDRLP4 128+4
ADDRLP4 1244
INDIRF4
ASGNF4
ADDRLP4 128
ADDRLP4 1244
INDIRF4
ASGNF4
line 1808
;1808:			ang[ROLL] = 1;
ADDRLP4 128+8
CNSTF4 1065353216
ASGNF4
line 1810
;1809:
;1810:			VectorCopy(position, dpos);
ADDRLP4 1220
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1811
;1811:			dpos[2] -= 4096;
ADDRLP4 1220+8
ADDRLP4 1220+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1813
;1812:
;1813:			CG_Trace(&tr, position, playerMins, playerMaxs, dpos, es->number, MASK_SOLID);
ADDRLP4 140
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 1220
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1814
;1814:			VectorCopy(tr.endpos, pos);
ADDRLP4 1232
ADDRLP4 140+12
INDIRB
ASGNB 12
line 1816
;1815:			
;1816:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+696
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1818
;1817:
;1818:			if (tr.fraction == 1)
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
NEF4 $1319
line 1819
;1819:			{
line 1820
;1820:				break;
ADDRGP4 $650
JUMPV
LABELV $1319
line 1822
;1821:			}
;1822:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("mp/spawn.efx"), pos, ang);
ADDRGP4 $1322
ARGP4
ADDRLP4 1248
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
ARGI4
ADDRLP4 1232
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1823
;1823:		}
line 1824
;1824:		break;
ADDRGP4 $650
JUMPV
LABELV $1323
line 1827
;1825:
;1826:	case EV_PLAYER_TELEPORT_OUT:
;1827:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1324
ADDRGP4 $1327
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1324
line 1828
;1828:		{
line 1830
;1829:			trace_t tr;
;1830:			vec3_t playerMins = {-15, -15, DEFAULT_MINS_2+8};
ADDRLP4 104
ADDRGP4 $1328
INDIRB
ASGNB 12
line 1831
;1831:			vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 116
ADDRGP4 $1329
INDIRB
ASGNB 12
line 1834
;1832:			vec3_t ang, pos, dpos;
;1833:
;1834:			VectorClear(ang);
ADDRLP4 1244
CNSTF4 0
ASGNF4
ADDRLP4 128+8
ADDRLP4 1244
INDIRF4
ASGNF4
ADDRLP4 128+4
ADDRLP4 1244
INDIRF4
ASGNF4
ADDRLP4 128
ADDRLP4 1244
INDIRF4
ASGNF4
line 1835
;1835:			ang[ROLL] = 1;
ADDRLP4 128+8
CNSTF4 1065353216
ASGNF4
line 1837
;1836:
;1837:			VectorCopy(position, dpos);
ADDRLP4 1220
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1838
;1838:			dpos[2] -= 4096;
ADDRLP4 1220+8
ADDRLP4 1220+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1840
;1839:
;1840:			CG_Trace(&tr, position, playerMins, playerMaxs, dpos, es->number, MASK_SOLID);
ADDRLP4 140
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 1220
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1841
;1841:			VectorCopy(tr.endpos, pos);
ADDRLP4 1232
ADDRLP4 140+12
INDIRB
ASGNB 12
line 1843
;1842:
;1843:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+700
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1845
;1844:
;1845:			if (tr.fraction == 1)
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
NEF4 $1337
line 1846
;1846:			{
line 1847
;1847:				break;
ADDRGP4 $650
JUMPV
LABELV $1337
line 1849
;1848:			}
;1849:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("mp/spawn.efx"), pos, ang);
ADDRGP4 $1322
ARGP4
ADDRLP4 1248
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
ARGI4
ADDRLP4 1232
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1850
;1850:		}
line 1851
;1851:		break;
ADDRGP4 $650
JUMPV
LABELV $1340
line 1854
;1852:
;1853:	case EV_ITEM_POP:
;1854:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1341
ADDRGP4 $1344
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1341
line 1855
;1855:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+704
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1856
;1856:		break;
ADDRGP4 $650
JUMPV
LABELV $1347
line 1858
;1857:	case EV_ITEM_RESPAWN:
;1858:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1348
ADDRGP4 $1351
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1348
line 1859
;1859:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1860
;1860:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+704
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1861
;1861:		break;
ADDRGP4 $650
JUMPV
LABELV $1355
line 1864
;1862:
;1863:	case EV_GRENADE_BOUNCE:
;1864:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $1359
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1866
;1865:		//Do something here?
;1866:		break;
ADDRGP4 $650
JUMPV
LABELV $1360
line 1869
;1867:
;1868:	case EV_SCOREPLUM:
;1869:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1361
ADDRGP4 $1364
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1361
line 1870
;1870:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 104
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 1871
;1871:		break;
ADDRGP4 $650
JUMPV
LABELV $1365
line 1874
;1872:
;1873:	case EV_CTFMESSAGE:
;1874:		DEBUGNAME("EV_CTFMESSAGE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1366
ADDRGP4 $1369
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1366
line 1875
;1875:		CG_GetCTFMessageEvent(es);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_GetCTFMessageEvent
CALLV
pop
line 1876
;1876:		break;
ADDRGP4 $650
JUMPV
LABELV $1370
line 1882
;1877:
;1878:	//
;1879:	// saga gameplay events
;1880:	//
;1881:	case EV_SAGA_ROUNDOVER:
;1882:		DEBUGNAME("EV_SAGA_ROUNDOVER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1371
ADDRGP4 $1374
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1371
line 1883
;1883:		CG_SagaRoundOver(&cg_entities[cent->currentState.weapon], cent->currentState.eventParm);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 108
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_SagaRoundOver
CALLV
pop
line 1884
;1884:		break;
ADDRGP4 $650
JUMPV
LABELV $1375
line 1886
;1885:	case EV_SAGA_OBJECTIVECOMPLETE:
;1886:		DEBUGNAME("EV_SAGA_OBJECTIVECOMPLETE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1376
ADDRGP4 $1379
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1376
line 1887
;1887:		CG_SagaObjectiveCompleted(&cg_entities[cent->currentState.weapon], cent->currentState.eventParm, cent->currentState.trickedentindex);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 112
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_SagaObjectiveCompleted
CALLV
pop
line 1888
;1888:		break;
ADDRGP4 $650
JUMPV
LABELV $1380
line 1891
;1889:
;1890:	case EV_DESTROY_GHOUL2_INSTANCE:
;1891:		DEBUGNAME("EV_DESTROY_GHOUL2_INSTANCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1381
ADDRGP4 $1384
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1381
line 1892
;1892:		if (cg_entities[es->eventParm].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[es->eventParm].ghoul2))
ADDRLP4 116
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 116
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
ADDRLP4 116
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $650
line 1893
;1893:		{
line 1894
;1894:			if (es->eventParm < MAX_CLIENTS)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 32
GEI4 $1389
line 1895
;1895:			{ //You try to do very bad thing!
line 1899
;1896:#ifdef _DEBUG
;1897:				Com_Printf("WARNING: Tried to kill a client ghoul2 instance with a server event!\n");
;1898:#endif
;1899:				break;
ADDRGP4 $650
JUMPV
LABELV $1389
line 1901
;1900:			}
;1901:			trap_G2API_CleanGhoul2Models(&(cg_entities[es->eventParm].ghoul2));
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 1902
;1902:		}
line 1903
;1903:		break;
ADDRGP4 $650
JUMPV
LABELV $1392
line 1906
;1904:
;1905:	case EV_DESTROY_WEAPON_MODEL:
;1906:		DEBUGNAME("EV_DESTROY_WEAPON_MODEL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1393
ADDRGP4 $1396
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1393
line 1907
;1907:		if (cg_entities[es->eventParm].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[es->eventParm].ghoul2) &&
ADDRLP4 124
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 124
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
ADDRLP4 124
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $650
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 132
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $650
line 1909
;1908:			trap_G2API_HasGhoul2ModelOnIndex(&(cg_entities[es->eventParm].ghoul2), 1))
;1909:		{
line 1910
;1910:			trap_G2API_RemoveGhoul2Model(&(cg_entities[es->eventParm].ghoul2), 1);
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 1911
;1911:		}
line 1912
;1912:		break;
ADDRGP4 $650
JUMPV
LABELV $1403
line 1915
;1913:
;1914:	case EV_GIVE_NEW_RANK:
;1915:		DEBUGNAME("EV_GIVE_NEW_RANK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1404
ADDRGP4 $1407
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1404
line 1916
;1916:		if (es->trickedentindex == cg.snap->ps.clientNum)
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1917
;1917:		{
line 1918
;1918:			trap_Cvar_Set("ui_rankChange", va("%i", es->eventParm));
ADDRGP4 $1412
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1411
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1920
;1919:
;1920:			trap_Cvar_Set("ui_myteam", va("%i", es->bolt2));
ADDRGP4 $1412
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1413
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1922
;1921:
;1922:			if (!( trap_Key_GetCatcher() & KEYCATCH_UI ) && !es->bolt1)
ADDRLP4 144
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 148
INDIRI4
NEI4 $650
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
NEI4 $650
line 1923
;1923:			{
line 1924
;1924:				trap_OpenUIMenu(3);
CNSTI4 3
ARGI4
ADDRGP4 trap_OpenUIMenu
CALLV
pop
line 1925
;1925:			}
line 1926
;1926:		}
line 1927
;1927:		break;
ADDRGP4 $650
JUMPV
LABELV $1416
line 1930
;1928:
;1929:	case EV_SET_FREE_SABER:
;1930:		DEBUGNAME("EV_SET_FREE_SABER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1417
ADDRGP4 $1420
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1417
line 1932
;1931:
;1932:		trap_Cvar_Set("ui_freeSaber", va("%i", es->eventParm));
ADDRGP4 $1412
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1421
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1933
;1933:		break;
ADDRGP4 $650
JUMPV
LABELV $1422
line 1936
;1934:
;1935:	case EV_SET_FORCE_DISABLE:
;1936:		DEBUGNAME("EV_SET_FORCE_DISABLE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1423
ADDRGP4 $1426
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1423
line 1938
;1937:
;1938:		trap_Cvar_Set("ui_forcePowerDisable", va("%i", es->eventParm));
ADDRGP4 $1412
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1427
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1939
;1939:		break;
ADDRGP4 $650
JUMPV
LABELV $1428
line 1945
;1940:
;1941:	//
;1942:	// missile impacts
;1943:	//
;1944:	case EV_MISSILE_STICK:
;1945:		DEBUGNAME("EV_MISSILE_STICK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $1432
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1947
;1946://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.missileStick );
;1947:		break;
ADDRGP4 $650
JUMPV
LABELV $1433
line 1950
;1948:
;1949:	case EV_MISSILE_HIT:
;1950:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1434
ADDRGP4 $1437
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1434
line 1951
;1951:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1952
;1952:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1438
line 1953
;1953:		{
line 1954
;1954:			CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum, qtrue);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 1955
;1955:		}
ADDRGP4 $650
JUMPV
LABELV $1438
line 1957
;1956:		else
;1957:		{
line 1958
;1958:			CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum, qfalse);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 1959
;1959:		}
line 1960
;1960:		break;
ADDRGP4 $650
JUMPV
LABELV $1440
line 1963
;1961:
;1962:	case EV_MISSILE_MISS:
;1963:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1441
ADDRGP4 $1444
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1441
line 1964
;1964:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1965
;1965:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1445
line 1966
;1966:		{
line 1967
;1967:			CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT, qtrue, es->generic1);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 148
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1968
;1968:		}
ADDRGP4 $650
JUMPV
LABELV $1445
line 1970
;1969:		else
;1970:		{
line 1971
;1971:			CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT, qfalse, 0);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1972
;1972:		}
line 1973
;1973:		break;
ADDRGP4 $650
JUMPV
LABELV $1447
line 1976
;1974:
;1975:	case EV_MISSILE_MISS_METAL:
;1976:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1448
ADDRGP4 $1451
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1448
line 1977
;1977:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1978
;1978:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1452
line 1979
;1979:		{
line 1980
;1980:			CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_METAL, qtrue, es->generic1);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 148
CNSTI4 1
ASGNI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1981
;1981:		}
ADDRGP4 $650
JUMPV
LABELV $1452
line 1983
;1982:		else
;1983:		{
line 1984
;1984:			CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_METAL, qfalse, 0);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1985
;1985:		}
line 1986
;1986:		break;
ADDRGP4 $650
JUMPV
LABELV $1454
line 1989
;1987:
;1988:	case EV_PLAY_EFFECT:
;1989:		DEBUGNAME("EV_PLAY_EFFECT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1455
ADDRGP4 $1458
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1455
line 1990
;1990:		switch(es->eventParm)
ADDRLP4 144
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 1
LTI4 $1459
ADDRLP4 144
INDIRI4
CNSTI4 9
GTI4 $1459
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1480-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1480
address $1462
address $1464
address $1466
address $1468
address $1470
address $1472
address $1474
address $1476
address $1478
code
line 1991
;1991:		{ //it isn't a hack, it's ingenuity!
LABELV $1462
line 1993
;1992:		case EFFECT_SMOKE:
;1993:			eID = trap_FX_RegisterEffect("emplaced/dead_smoke.efx");
ADDRGP4 $1463
ARGP4
ADDRLP4 152
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 152
INDIRI4
ASGNI4
line 1994
;1994:			break;
ADDRGP4 $1460
JUMPV
LABELV $1464
line 1996
;1995:		case EFFECT_EXPLOSION:
;1996:			eID = trap_FX_RegisterEffect("emplaced/explode.efx");
ADDRGP4 $1465
ARGP4
ADDRLP4 156
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 156
INDIRI4
ASGNI4
line 1997
;1997:			break;
ADDRGP4 $1460
JUMPV
LABELV $1466
line 1999
;1998:		case EFFECT_EXPLOSION_PAS:
;1999:			eID = trap_FX_RegisterEffect("turret/explode.efx");
ADDRGP4 $1467
ARGP4
ADDRLP4 160
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 160
INDIRI4
ASGNI4
line 2000
;2000:			break;
ADDRGP4 $1460
JUMPV
LABELV $1468
line 2002
;2001:		case EFFECT_SPARK_EXPLOSION:
;2002:			eID = trap_FX_RegisterEffect("spark_explosion.efx");
ADDRGP4 $1469
ARGP4
ADDRLP4 164
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 164
INDIRI4
ASGNI4
line 2003
;2003:			break;
ADDRGP4 $1460
JUMPV
LABELV $1470
line 2005
;2004:		case EFFECT_EXPLOSION_TRIPMINE:
;2005:			eID = trap_FX_RegisterEffect("tripMine/explosion.efx");
ADDRGP4 $1471
ARGP4
ADDRLP4 168
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 168
INDIRI4
ASGNI4
line 2006
;2006:			break;
ADDRGP4 $1460
JUMPV
LABELV $1472
line 2008
;2007:		case EFFECT_EXPLOSION_DETPACK:
;2008:			eID = trap_FX_RegisterEffect("detpack/explosion.efx");
ADDRGP4 $1473
ARGP4
ADDRLP4 172
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 172
INDIRI4
ASGNI4
line 2009
;2009:			break;
ADDRGP4 $1460
JUMPV
LABELV $1474
line 2011
;2010:		case EFFECT_EXPLOSION_FLECHETTE:
;2011:			eID = trap_FX_RegisterEffect("flechette/alt_blow.efx");
ADDRGP4 $1475
ARGP4
ADDRLP4 176
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 176
INDIRI4
ASGNI4
line 2012
;2012:			break;
ADDRGP4 $1460
JUMPV
LABELV $1476
line 2014
;2013:		case EFFECT_STUNHIT:
;2014:			eID = trap_FX_RegisterEffect("stunBaton/flesh_impact.efx");
ADDRGP4 $1477
ARGP4
ADDRLP4 180
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 180
INDIRI4
ASGNI4
line 2015
;2015:			break;
ADDRGP4 $1460
JUMPV
LABELV $1478
line 2017
;2016:		case EFFECT_EXPLOSION_DEMP2ALT:
;2017:			FX_DEMP2_AltDetonate( cent->lerpOrigin, es->weapon );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 FX_DEMP2_AltDetonate
CALLV
pop
line 2018
;2018:			eID = trap_FX_RegisterEffect("demp2/altDetonate.efx");
ADDRGP4 $1479
ARGP4
ADDRLP4 184
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 184
INDIRI4
ASGNI4
line 2019
;2019:			break;
ADDRGP4 $1460
JUMPV
LABELV $1459
line 2021
;2020:		default:
;2021:			eID = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 2022
;2022:			break;
LABELV $1460
line 2025
;2023:		}
;2024:
;2025:		if (eID != -1)
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $650
line 2026
;2026:		{
line 2029
;2027:			vec3_t fxDir;
;2028:
;2029:			VectorCopy(es->angles, fxDir);
ADDRLP4 152
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2031
;2030:
;2031:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 164
CNSTF4 0
ASGNF4
ADDRLP4 152
INDIRF4
ADDRLP4 164
INDIRF4
NEF4 $1484
ADDRLP4 152+4
INDIRF4
ADDRLP4 164
INDIRF4
NEF4 $1484
ADDRLP4 152+8
INDIRF4
ADDRLP4 164
INDIRF4
NEF4 $1484
line 2032
;2032:			{
line 2033
;2033:				fxDir[1] = 1;
ADDRLP4 152+4
CNSTF4 1065353216
ASGNF4
line 2034
;2034:			}
LABELV $1484
line 2036
;2035:
;2036:			trap_FX_PlayEffectID(eID, es->origin, fxDir);
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 2037
;2037:		}
line 2038
;2038:		break;
ADDRGP4 $650
JUMPV
LABELV $1489
line 2041
;2039:
;2040:	case EV_PLAY_EFFECT_ID:
;2041:		DEBUGNAME("EV_PLAY_EFFECT_ID");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1490
ADDRGP4 $1493
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1490
line 2042
;2042:		{
line 2045
;2043:			vec3_t fxDir;
;2044:
;2045:			AngleVectors(es->angles, fxDir, 0, 0);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 164
CNSTP4 0
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2047
;2046:			
;2047:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 168
CNSTF4 0
ASGNF4
ADDRLP4 152
INDIRF4
ADDRLP4 168
INDIRF4
NEF4 $1494
ADDRLP4 152+4
INDIRF4
ADDRLP4 168
INDIRF4
NEF4 $1494
ADDRLP4 152+8
INDIRF4
ADDRLP4 168
INDIRF4
NEF4 $1494
line 2048
;2048:			{
line 2049
;2049:				fxDir[1] = 1;
ADDRLP4 152+4
CNSTF4 1065353216
ASGNF4
line 2050
;2050:			}
LABELV $1494
line 2052
;2051:
;2052:			if ( cgs.gameEffects[ es->eventParm ] )
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+38412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1499
line 2053
;2053:			{
line 2054
;2054:				trap_FX_PlayEffectID(cgs.gameEffects[es->eventParm], es->origin, fxDir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+38412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 2055
;2055:			}
ADDRGP4 $650
JUMPV
LABELV $1499
line 2057
;2056:			else
;2057:			{
line 2058
;2058:				s = CG_ConfigString( CS_EFFECTS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 768
ADDI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 172
INDIRP4
ASGNP4
line 2059
;2059:				if (s && s[0])
ADDRLP4 176
ADDRLP4 40
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
ADDRLP4 176
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $650
line 2060
;2060:				{
line 2061
;2061:					trap_FX_PlayEffectID(trap_FX_RegisterEffect(s), es->origin, fxDir );
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 2062
;2062:				}
line 2063
;2063:			}
line 2064
;2064:		}
line 2065
;2065:		break;
ADDRGP4 $650
JUMPV
LABELV $1505
line 2068
;2066:
;2067:	case EV_MUTE_SOUND:
;2068:		DEBUGNAME("EV_MUTE_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1506
ADDRGP4 $1509
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1506
line 2069
;2069:		if (cg_entities[es->trickedentindex2].currentState.eFlags & EF_SOUNDTRACKER)
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+8
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $1510
line 2070
;2070:		{
line 2071
;2071:			cg_entities[es->trickedentindex2].currentState.eFlags -= EF_SOUNDTRACKER;
ADDRLP4 152
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+8
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 8388608
SUBI4
ASGNI4
line 2072
;2072:		}
LABELV $1510
line 2073
;2073:		trap_S_MuteSound(es->trickedentindex2, es->trickedentindex);
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_MuteSound
CALLV
pop
line 2074
;2074:		trap_S_StopLoopingSound(es->trickedentindex2);
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 2075
;2075:		break;
ADDRGP4 $650
JUMPV
LABELV $1514
line 2078
;2076:
;2077:	case EV_GENERAL_SOUND:
;2078:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1515
ADDRGP4 $1518
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1515
line 2079
;2079:		if (es->saberEntityNum == TRACK_CHANNEL_2 || es->saberEntityNum == TRACK_CHANNEL_3 ||
ADDRLP4 156
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 52
EQI4 $1522
ADDRLP4 156
INDIRI4
CNSTI4 53
EQI4 $1522
ADDRLP4 156
INDIRI4
CNSTI4 55
NEI4 $1519
LABELV $1522
line 2081
;2080:			es->saberEntityNum == TRACK_CHANNEL_5)
;2081:		{ //channels 2 and 3 are for speed and rage, 5 for sight
line 2082
;2082:			if ( cgs.gameSounds[ es->eventParm ] )
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
CNSTI4 0
EQI4 $650
line 2083
;2083:			{
line 2084
;2084:				trap_S_AddRealLoopingSound(es->number, es->pos.trBase, vec3_origin, cgs.gameSounds[ es->eventParm ] );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
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
ADDRGP4 trap_S_AddRealLoopingSound
CALLV
pop
line 2085
;2085:			}
line 2086
;2086:		}
ADDRGP4 $650
JUMPV
LABELV $1519
line 2088
;2087:		else
;2088:		{
line 2089
;2089:			if ( cgs.gameSounds[ es->eventParm ] ) {
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
CNSTI4 0
EQI4 $1527
line 2090
;2090:				trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
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
line 2091
;2091:			} else {
ADDRGP4 $650
JUMPV
LABELV $1527
line 2092
;2092:				s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 160
INDIRP4
ASGNP4
line 2093
;2093:				trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2094
;2094:			}
line 2095
;2095:		}
line 2096
;2096:		break;
ADDRGP4 $650
JUMPV
LABELV $1531
line 2099
;2097:
;2098:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;2099:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1532
ADDRGP4 $1535
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1532
line 2100
;2100:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
CNSTI4 0
EQI4 $1536
line 2101
;2101:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
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
line 2102
;2102:		} else {
ADDRGP4 $650
JUMPV
LABELV $1536
line 2103
;2103:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 160
INDIRP4
ASGNP4
line 2104
;2104:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2105
;2105:		}
line 2106
;2106:		break;
ADDRGP4 $650
JUMPV
LABELV $1542
line 2109
;2107:
;2108:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;2109:		{
line 2110
;2110:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1543
ADDRGP4 $1546
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1543
line 2111
;2111:			switch( es->eventParm ) {
ADDRLP4 160
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
LTI4 $650
ADDRLP4 160
INDIRI4
CNSTI4 10
GTI4 $650
ADDRLP4 160
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1599
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1599
address $650
address $650
address $1552
address $1560
address $1568
address $1576
address $1584
address $1587
address $1590
address $1593
address $1596
code
line 2114
;2112:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;2113:					//CG_AddBufferedSound( cgs.media.redScoredSound );
;2114:					break;
line 2117
;2115:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;2116:					//CG_AddBufferedSound( cgs.media.blueScoredSound );
;2117:					break;
LABELV $1552
line 2119
;2118:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;2119:					if (cgs.gametype == GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1553
line 2120
;2120:					{
line 2121
;2121:						CG_AddBufferedSound( cgs.media.blueYsalReturnedSound );
ADDRGP4 cgs+70296+816
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2122
;2122:					}
ADDRGP4 $650
JUMPV
LABELV $1553
line 2124
;2123:					else
;2124:					{
line 2125
;2125:						CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+70296+800
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2126
;2126:					}
line 2127
;2127:					break;
ADDRGP4 $650
JUMPV
LABELV $1560
line 2129
;2128:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;2129:					if (cgs.gametype == GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1561
line 2130
;2130:					{
line 2131
;2131:						CG_AddBufferedSound( cgs.media.redYsalReturnedSound );
ADDRGP4 cgs+70296+812
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2132
;2132:					}
ADDRGP4 $650
JUMPV
LABELV $1561
line 2134
;2133:					else
;2134:					{
line 2135
;2135:						CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+70296+796
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2136
;2136:					}
line 2137
;2137:					break;
ADDRGP4 $650
JUMPV
LABELV $1568
line 2141
;2138:
;2139:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;2140:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;2141:					if (cgs.gametype == GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1569
line 2142
;2142:					{
line 2143
;2143:						CG_AddBufferedSound( cgs.media.redTookYsalSound );
ADDRGP4 cgs+70296+820
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2144
;2144:					}
ADDRGP4 $650
JUMPV
LABELV $1569
line 2146
;2145:					else
;2146:					{
line 2147
;2147:					 	CG_AddBufferedSound( cgs.media.redTookFlagSound );
ADDRGP4 cgs+70296+804
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2148
;2148:					}
line 2149
;2149:					break;
ADDRGP4 $650
JUMPV
LABELV $1576
line 2152
;2150:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;2151:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;2152:					if (cgs.gametype == GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1577
line 2153
;2153:					{
line 2154
;2154:						CG_AddBufferedSound( cgs.media.blueTookYsalSound );
ADDRGP4 cgs+70296+824
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2155
;2155:					}
ADDRGP4 $650
JUMPV
LABELV $1577
line 2157
;2156:					else
;2157:					{
line 2158
;2158:						CG_AddBufferedSound( cgs.media.blueTookFlagSound );
ADDRGP4 cgs+70296+808
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2159
;2159:					}
line 2160
;2160:					break;
ADDRGP4 $650
JUMPV
LABELV $1584
line 2162
;2161:				case GTS_REDTEAM_SCORED:
;2162:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+70296+776
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2163
;2163:					break;
ADDRGP4 $650
JUMPV
LABELV $1587
line 2165
;2164:				case GTS_BLUETEAM_SCORED:
;2165:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+70296+780
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2166
;2166:					break;
ADDRGP4 $650
JUMPV
LABELV $1590
line 2168
;2167:				case GTS_REDTEAM_TOOK_LEAD:
;2168:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+70296+784
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2169
;2169:					break;
ADDRGP4 $650
JUMPV
LABELV $1593
line 2171
;2170:				case GTS_BLUETEAM_TOOK_LEAD:
;2171:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+70296+788
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2172
;2172:					break;
ADDRGP4 $650
JUMPV
LABELV $1596
line 2174
;2173:				case GTS_TEAMS_ARE_TIED:
;2174:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+70296+792
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2175
;2175:					break;
line 2177
;2176:				default:
;2177:					break;
line 2179
;2178:			}
;2179:			break;
ADDRGP4 $650
JUMPV
LABELV $1600
line 2183
;2180:		}
;2181:
;2182:	case EV_ENTITY_SOUND:
;2183:		DEBUGNAME("EV_ENTITY_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1601
ADDRGP4 $1604
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1601
line 2185
;2184:		//somewhat of a hack - weapon is the caller entity's index, trickedentindex is the proper sound channel
;2185:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
CNSTI4 0
EQI4 $1605
line 2186
;2186:			trap_S_StartSound (NULL, es->weapon, es->trickedentindex, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
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
line 2187
;2187:		} else {
ADDRGP4 $650
JUMPV
LABELV $1605
line 2188
;2188:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 160
INDIRP4
ASGNP4
line 2189
;2189:			trap_S_StartSound (NULL, es->weapon, es->trickedentindex, CG_CustomSound( es->weapon, s ) );
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2190
;2190:		}
line 2191
;2191:		break;
ADDRGP4 $650
JUMPV
LABELV $1609
line 2194
;2192:
;2193:	case EV_PLAY_ROFF:
;2194:		DEBUGNAME("EV_PLAY_ROFF");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1610
ADDRGP4 $1613
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1610
line 2195
;2195:		trap_ROFF_Play(es->weapon, es->eventParm, es->trickedentindex);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_ROFF_Play
CALLI4
pop
line 2196
;2196:		break;
ADDRGP4 $650
JUMPV
LABELV $1614
line 2199
;2197:
;2198:	case EV_GLASS_SHATTER:
;2199:		DEBUGNAME("EV_GLASS_SHATTER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1615
ADDRGP4 $1618
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1615
line 2200
;2200:		CG_GlassShatter(es->genericenemyindex, es->origin, es->angles, es->trickedentindex, es->pos.trTime);
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_GlassShatter
CALLV
pop
line 2201
;2201:		break;
ADDRGP4 $650
JUMPV
LABELV $1619
line 2204
;2202:
;2203:	case EV_DEBRIS:
;2204:		DEBUGNAME("EV_DEBRIS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1620
ADDRGP4 $1623
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1620
line 2205
;2205:		if (es->weapon)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1624
line 2206
;2206:		{
line 2207
;2207:			if (cgs.gameSounds[es->weapon])
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1626
line 2208
;2208:			{
line 2209
;2209:				isnd = cgs.gameSounds[es->weapon];
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ASGNI4
line 2210
;2210:			}
ADDRGP4 $1625
JUMPV
LABELV $1626
line 2212
;2211:			else
;2212:			{
line 2213
;2213:				s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 168
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 168
INDIRP4
ASGNP4
line 2214
;2214:				isnd = CG_CustomSound( es->number, s );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 172
INDIRI4
ASGNI4
line 2215
;2215:			}
line 2216
;2216:		}
ADDRGP4 $1625
JUMPV
LABELV $1624
line 2218
;2217:		else
;2218:		{
line 2219
;2219:			isnd = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2220
;2220:		}
LABELV $1625
line 2222
;2221:
;2222:		if (es->trickedentindex > 0)
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1630
line 2223
;2223:		{
line 2224
;2224:			if (cgs.gameModels[es->trickedentindex])
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1632
line 2225
;2225:			{
line 2226
;2226:				CG_CreateDebris(es->number, es->pos.trBase, es->angles, es->origin, isnd, cgs.gameModels[es->trickedentindex]);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36364
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_CreateDebris
CALLV
pop
line 2227
;2227:			}
ADDRGP4 $650
JUMPV
LABELV $1632
line 2229
;2228:			else
;2229:			{ //default to "rock" type
line 2230
;2230:				CG_CreateDebris(es->number, es->pos.trBase, es->angles, es->origin, isnd, -1);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 CG_CreateDebris
CALLV
pop
line 2231
;2231:			}
line 2232
;2232:		}
ADDRGP4 $650
JUMPV
LABELV $1630
line 2234
;2233:		else
;2234:		{
line 2235
;2235:			CG_CreateDebris(es->number, es->pos.trBase, es->angles, es->origin, isnd, es->trickedentindex);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_CreateDebris
CALLV
pop
line 2236
;2236:		}
line 2237
;2237:		break;
ADDRGP4 $650
JUMPV
LABELV $1636
line 2242
;2238:
;2239:	case EV_PAIN:
;2240:		// local player sounds are triggered in CG_CheckLocalSounds,
;2241:		// so ignore events on the player
;2242:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1637
ADDRGP4 $1640
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1637
line 2244
;2243:
;2244:		if ( !cg_oldPainSounds.integer || (cent->currentState.number != cg.snap->ps.clientNum) )
ADDRGP4 cg_oldPainSounds+12
INDIRI4
CNSTI4 0
EQI4 $1645
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $650
LABELV $1645
line 2245
;2245:		{
line 2246
;2246:			CG_PainEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 2247
;2247:		}
line 2248
;2248:		break;
ADDRGP4 $650
JUMPV
LABELV $1646
line 2253
;2249:
;2250:	case EV_DEATH1:
;2251:	case EV_DEATH2:
;2252:	case EV_DEATH3:
;2253:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1647
ADDRGP4 $1650
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1647
line 2254
;2254:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $1651
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 78
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 168
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2256
;2255:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;2256:		if (es->eventParm && es->number == cg.snap->ps.clientNum)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 2257
;2257:		{
line 2258
;2258:			trap_S_StartLocalSound(cgs.media.dramaticFailure, CHAN_LOCAL);
ADDRGP4 cgs+70296+836
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2259
;2259:			CGCam_SetMusicMult(0.3, 5000);
CNSTF4 1050253722
ARGF4
CNSTI4 5000
ARGI4
ADDRGP4 CGCam_SetMusicMult
CALLV
pop
line 2260
;2260:		}
line 2261
;2261:		break;
ADDRGP4 $650
JUMPV
LABELV $1657
line 2265
;2262:
;2263:
;2264:	case EV_OBITUARY:
;2265:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1658
ADDRGP4 $1661
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1658
line 2266
;2266:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 2267
;2267:		break;
ADDRGP4 $650
JUMPV
LABELV $1662
line 2273
;2268:
;2269:	//
;2270:	// powerup events
;2271:	//
;2272:	case EV_POWERUP_QUAD:
;2273:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1663
ADDRGP4 $1666
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1663
line 2274
;2274:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 2275
;2275:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+13104
CNSTI4 1
ASGNI4
line 2276
;2276:			cg.powerupTime = cg.time;
ADDRGP4 cg+13108
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2277
;2277:		}
line 2279
;2278:		//trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
;2279:		break;
ADDRGP4 $650
JUMPV
LABELV $1673
line 2281
;2280:	case EV_POWERUP_BATTLESUIT:
;2281:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1674
ADDRGP4 $1677
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1674
line 2282
;2282:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 2283
;2283:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+13104
CNSTI4 2
ASGNI4
line 2284
;2284:			cg.powerupTime = cg.time;
ADDRGP4 cg+13108
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2285
;2285:		}
line 2287
;2286:		//trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
;2287:		break;
ADDRGP4 $650
JUMPV
LABELV $1684
line 2290
;2288:
;2289:	case EV_FORCE_DRAINED:
;2290:		DEBUGNAME("EV_FORCE_DRAINED");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1685
ADDRGP4 $1688
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1685
line 2291
;2291:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 2293
;2292:		//FX_ForceDrained(position, dir);
;2293:		trap_S_StartSound (NULL, es->owner, CHAN_AUTO, cgs.media.drainSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+828
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2294
;2294:		cg_entities[es->owner].teamPowerEffectTime = cg.time + 1000;
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2295
;2295:		cg_entities[es->owner].teamPowerType = 2;
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
CNSTI4 2
ASGNI4
line 2296
;2296:		break;
ADDRGP4 $650
JUMPV
LABELV $1694
line 2299
;2297:
;2298:	case EV_GIB_PLAYER:
;2299:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $1698
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 2302
;2300:		//trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
;2301:		//CG_GibPlayer( cent->lerpOrigin );
;2302:		break;
ADDRGP4 $650
JUMPV
LABELV $1699
line 2305
;2303:
;2304:	case EV_STARTLOOPINGSOUND:
;2305:		DEBUGNAME("EV_STARTLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1700
ADDRGP4 $1703
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1700
line 2306
;2306:		if ( cgs.gameSounds[ es->eventParm ] )
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
CNSTI4 0
EQI4 $1704
line 2307
;2307:		{
line 2308
;2308:			isnd = cgs.gameSounds[es->eventParm];
ADDRLP4 12
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
ASGNI4
line 2309
;2309:		}
ADDRGP4 $1705
JUMPV
LABELV $1704
line 2311
;2310:		else
;2311:		{
line 2312
;2312:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 180
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 180
INDIRP4
ASGNP4
line 2313
;2313:			isnd = CG_CustomSound(es->number, s);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 184
INDIRI4
ASGNI4
line 2314
;2314:		}
LABELV $1705
line 2316
;2315:
;2316:		trap_S_AddRealLoopingSound( es->number, es->pos.trBase, vec3_origin, isnd );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_AddRealLoopingSound
CALLV
pop
line 2317
;2317:		es->loopSound = isnd;
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2318
;2318:		break;
ADDRGP4 $650
JUMPV
LABELV $1708
line 2321
;2319:
;2320:	case EV_STOPLOOPINGSOUND:
;2321:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1709
ADDRGP4 $1712
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1709
line 2322
;2322:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 2323
;2323:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2324
;2324:		break;
ADDRGP4 $650
JUMPV
LABELV $1713
line 2327
;2325:
;2326:	case EV_WEAPON_CHARGE:
;2327:		DEBUGNAME("EV_WEAPON_CHARGE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1714
ADDRGP4 $1717
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1714
line 2328
;2328:		assert(es->eventParm > WP_NONE && es->eventParm < WP_NUM_WEAPONS);
line 2329
;2329:		if (cg_weapons[es->eventParm].chargeSound)
CNSTI4 208
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+88
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
line 2330
;2330:		{
line 2331
;2331:			trap_S_StartSound(NULL, es->number, CHAN_WEAPON, cg_weapons[es->eventParm].chargeSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 208
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+88
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2332
;2332:		}
line 2333
;2333:		break;
ADDRGP4 $650
JUMPV
LABELV $1722
line 2336
;2334:
;2335:	case EV_WEAPON_CHARGE_ALT:
;2336:		DEBUGNAME("EV_WEAPON_CHARGE_ALT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1723
ADDRGP4 $1726
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1723
line 2337
;2337:		assert(es->eventParm > WP_NONE && es->eventParm < WP_NUM_WEAPONS);
line 2338
;2338:		if (cg_weapons[es->eventParm].altChargeSound)
CNSTI4 208
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
line 2339
;2339:		{
line 2340
;2340:			trap_S_StartSound(NULL, es->number, CHAN_WEAPON, cg_weapons[es->eventParm].altChargeSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 208
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+152
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2341
;2341:		}
line 2342
;2342:		break;
ADDRGP4 $650
JUMPV
LABELV $1731
line 2345
;2343:
;2344:	case EV_SHIELD_HIT:
;2345:		DEBUGNAME("EV_SHIELD_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1732
ADDRGP4 $1735
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1732
line 2346
;2346:		ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 2347
;2347:		CG_PlayerShieldHit(es->otherEntityNum, dir, es->time2);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PlayerShieldHit
CALLV
pop
line 2348
;2348:		break;
ADDRGP4 $650
JUMPV
LABELV $1736
line 2351
;2349:
;2350:	case EV_DEBUG_LINE:
;2351:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1737
ADDRGP4 $1740
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1737
line 2352
;2352:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 2353
;2353:		break;
ADDRGP4 $650
JUMPV
LABELV $1741
line 2356
;2354:
;2355:	case EV_TESTLINE:
;2356:		DEBUGNAME("EV_TESTLINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1742
ADDRGP4 $1745
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1742
line 2357
;2357:		CG_TestLine(es->origin, es->origin2, es->time2, es->weapon, 1);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CVIU4 4
ARGU4
CNSTI4 1
ARGI4
ADDRGP4 CG_TestLine
CALLV
pop
line 2358
;2358:		break;
ADDRGP4 $650
JUMPV
LABELV $1746
line 2361
;2359:
;2360:	case EV_BODY_QUEUE_COPY:
;2361:		DEBUGNAME("EV_BODY_QUEUE_COPY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1747
ADDRGP4 $1750
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1747
line 2362
;2362:		CG_BodyQueueCopy(cent, es->eventParm, es->weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_BodyQueueCopy
CALLV
pop
line 2363
;2363:		break;
ADDRGP4 $650
JUMPV
LABELV $649
line 2366
;2364:
;2365:	default:
;2366:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1751
ADDRGP4 $1754
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1751
line 2367
;2367:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1755
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 2368
;2368:		break;
LABELV $650
line 2371
;2369:	}
;2370:
;2371:}
LABELV $634
endproc CG_EntityEvent 1252 36
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 2380
;2372:
;2373:
;2374:/*
;2375:==============
;2376:CG_CheckEvents
;2377:
;2378:==============
;2379:*/
;2380:void CG_CheckEvents( centity_t *cent ) {
line 2382
;2381:	// check for event-only entities
;2382:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 16
LEI4 $1759
line 2383
;2383:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1761
line 2384
;2384:			return;	// already fired
ADDRGP4 $1758
JUMPV
LABELV $1761
line 2387
;2385:		}
;2386:		// if this is a player event set the entity number of the client entity number
;2387:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1763
line 2388
;2388:			cent->currentState.number = cent->currentState.otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2389
;2389:		}
LABELV $1763
line 2391
;2390:
;2391:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 2393
;2392:
;2393:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 2394
;2394:	} else {
ADDRGP4 $1760
JUMPV
LABELV $1759
line 2396
;2395:		// check for events riding with another entity
;2396:		if ( cent->currentState.event == cent->previousEvent ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
NEI4 $1765
line 2397
;2397:			return;
ADDRGP4 $1758
JUMPV
LABELV $1765
line 2399
;2398:		}
;2399:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 604
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ASGNI4
line 2400
;2400:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1767
line 2401
;2401:			return;
ADDRGP4 $1758
JUMPV
LABELV $1767
line 2403
;2402:		}
;2403:	}
LABELV $1760
line 2406
;2404:
;2405:	// calculate the position at exactly the frame time
;2406:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
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
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2407
;2407:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 2409
;2408:
;2409:	CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 2410
;2410:}
LABELV $1758
endproc CG_CheckEvents 8 12
import CG_ThereIsAMaster
import showPowersName
import g_saberFlashPos
import g_saberFlashTime
import trap_SP_Register
import trap_SP_RegisterServer
import trap_PC_RemoveAllGlobalDefines
import trap_PC_LoadGlobalDefines
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import FX_RocketHitPlayer
import FX_RocketHitWall
import FX_RocketAltProjectileThink
import FX_RocketProjectileThink
import FX_FlechetteAltProjectileThink
import FX_FlechetteWeaponHitPlayer
import FX_FlechetteWeaponHitWall
import FX_FlechetteProjectileThink
import FX_DEMP2_AltDetonate
import FX_DEMP2_HitPlayer
import FX_DEMP2_HitWall
import FX_DEMP2_ProjectileThink
import FX_RepeaterAltHitPlayer
import FX_RepeaterHitPlayer
import FX_RepeaterAltHitWall
import FX_RepeaterHitWall
import FX_RepeaterAltProjectileThink
import FX_RepeaterProjectileThink
import FX_BowcasterHitPlayer
import FX_BowcasterHitWall
import FX_BowcasterAltProjectileThink
import FX_BowcasterProjectileThink
import FX_DisruptorHitPlayer
import FX_DisruptorHitWall
import FX_DisruptorAltHit
import FX_DisruptorAltMiss
import FX_DisruptorAltShot
import FX_DisruptorMainShot
import FX_BryarAltProjectileThink
import FX_BryarProjectileThink
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
import TurretClientRun
import ScaleModelAxis
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_ManualEntityRender
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
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
LABELV $1755
char 1 85
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 101
char 1 118
char 1 101
char 1 110
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $1754
char 1 85
char 1 78
char 1 75
char 1 78
char 1 79
char 1 87
char 1 78
char 1 10
char 1 0
align 1
LABELV $1750
char 1 69
char 1 86
char 1 95
char 1 66
char 1 79
char 1 68
char 1 89
char 1 95
char 1 81
char 1 85
char 1 69
char 1 85
char 1 69
char 1 95
char 1 67
char 1 79
char 1 80
char 1 89
char 1 10
char 1 0
align 1
LABELV $1745
char 1 69
char 1 86
char 1 95
char 1 84
char 1 69
char 1 83
char 1 84
char 1 76
char 1 73
char 1 78
char 1 69
char 1 10
char 1 0
align 1
LABELV $1740
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 66
char 1 85
char 1 71
char 1 95
char 1 76
char 1 73
char 1 78
char 1 69
char 1 10
char 1 0
align 1
LABELV $1735
char 1 69
char 1 86
char 1 95
char 1 83
char 1 72
char 1 73
char 1 69
char 1 76
char 1 68
char 1 95
char 1 72
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1726
char 1 69
char 1 86
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 95
char 1 67
char 1 72
char 1 65
char 1 82
char 1 71
char 1 69
char 1 95
char 1 65
char 1 76
char 1 84
char 1 10
char 1 0
align 1
LABELV $1717
char 1 69
char 1 86
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 95
char 1 67
char 1 72
char 1 65
char 1 82
char 1 71
char 1 69
char 1 10
char 1 0
align 1
LABELV $1712
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 79
char 1 80
char 1 76
char 1 79
char 1 79
char 1 80
char 1 73
char 1 78
char 1 71
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1703
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 76
char 1 79
char 1 79
char 1 80
char 1 73
char 1 78
char 1 71
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1698
char 1 69
char 1 86
char 1 95
char 1 71
char 1 73
char 1 66
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1688
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 95
char 1 68
char 1 82
char 1 65
char 1 73
char 1 78
char 1 69
char 1 68
char 1 10
char 1 0
align 1
LABELV $1677
char 1 69
char 1 86
char 1 95
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 85
char 1 80
char 1 95
char 1 66
char 1 65
char 1 84
char 1 84
char 1 76
char 1 69
char 1 83
char 1 85
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1666
char 1 69
char 1 86
char 1 95
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 85
char 1 80
char 1 95
char 1 81
char 1 85
char 1 65
char 1 68
char 1 10
char 1 0
align 1
LABELV $1661
char 1 69
char 1 86
char 1 95
char 1 79
char 1 66
char 1 73
char 1 84
char 1 85
char 1 65
char 1 82
char 1 89
char 1 10
char 1 0
align 1
LABELV $1651
char 1 42
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 37
char 1 105
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1650
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 120
char 1 10
char 1 0
align 1
LABELV $1640
char 1 69
char 1 86
char 1 95
char 1 80
char 1 65
char 1 73
char 1 78
char 1 10
char 1 0
align 1
LABELV $1623
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 66
char 1 82
char 1 73
char 1 83
char 1 10
char 1 0
align 1
LABELV $1618
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 65
char 1 83
char 1 83
char 1 95
char 1 83
char 1 72
char 1 65
char 1 84
char 1 84
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1613
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 95
char 1 82
char 1 79
char 1 70
char 1 70
char 1 10
char 1 0
align 1
LABELV $1604
char 1 69
char 1 86
char 1 95
char 1 69
char 1 78
char 1 84
char 1 73
char 1 84
char 1 89
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1546
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 79
char 1 66
char 1 65
char 1 76
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1535
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 79
char 1 66
char 1 65
char 1 76
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1518
char 1 69
char 1 86
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 65
char 1 76
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1509
char 1 69
char 1 86
char 1 95
char 1 77
char 1 85
char 1 84
char 1 69
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1493
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 95
char 1 69
char 1 70
char 1 70
char 1 69
char 1 67
char 1 84
char 1 95
char 1 73
char 1 68
char 1 10
char 1 0
align 1
LABELV $1479
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 47
char 1 97
char 1 108
char 1 116
char 1 68
char 1 101
char 1 116
char 1 111
char 1 110
char 1 97
char 1 116
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1477
char 1 115
char 1 116
char 1 117
char 1 110
char 1 66
char 1 97
char 1 116
char 1 111
char 1 110
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
LABELV $1475
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 101
char 1 116
char 1 116
char 1 101
char 1 47
char 1 97
char 1 108
char 1 116
char 1 95
char 1 98
char 1 108
char 1 111
char 1 119
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1473
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 115
char 1 105
char 1 111
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1471
char 1 116
char 1 114
char 1 105
char 1 112
char 1 77
char 1 105
char 1 110
char 1 101
char 1 47
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 115
char 1 105
char 1 111
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1469
char 1 115
char 1 112
char 1 97
char 1 114
char 1 107
char 1 95
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 115
char 1 105
char 1 111
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1467
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 47
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 100
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1465
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 47
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 100
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1463
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 47
char 1 100
char 1 101
char 1 97
char 1 100
char 1 95
char 1 115
char 1 109
char 1 111
char 1 107
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1458
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 95
char 1 69
char 1 70
char 1 70
char 1 69
char 1 67
char 1 84
char 1 10
char 1 0
align 1
LABELV $1451
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 95
char 1 77
char 1 69
char 1 84
char 1 65
char 1 76
char 1 10
char 1 0
align 1
LABELV $1444
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 10
char 1 0
align 1
LABELV $1437
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 72
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1432
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 83
char 1 84
char 1 73
char 1 67
char 1 75
char 1 10
char 1 0
align 1
LABELV $1427
char 1 117
char 1 105
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 80
char 1 111
char 1 119
char 1 101
char 1 114
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $1426
char 1 69
char 1 86
char 1 95
char 1 83
char 1 69
char 1 84
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 95
char 1 68
char 1 73
char 1 83
char 1 65
char 1 66
char 1 76
char 1 69
char 1 10
char 1 0
align 1
LABELV $1421
char 1 117
char 1 105
char 1 95
char 1 102
char 1 114
char 1 101
char 1 101
char 1 83
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $1420
char 1 69
char 1 86
char 1 95
char 1 83
char 1 69
char 1 84
char 1 95
char 1 70
char 1 82
char 1 69
char 1 69
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1413
char 1 117
char 1 105
char 1 95
char 1 109
char 1 121
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1412
char 1 37
char 1 105
char 1 0
align 1
LABELV $1411
char 1 117
char 1 105
char 1 95
char 1 114
char 1 97
char 1 110
char 1 107
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $1407
char 1 69
char 1 86
char 1 95
char 1 71
char 1 73
char 1 86
char 1 69
char 1 95
char 1 78
char 1 69
char 1 87
char 1 95
char 1 82
char 1 65
char 1 78
char 1 75
char 1 10
char 1 0
align 1
LABELV $1396
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 83
char 1 84
char 1 82
char 1 79
char 1 89
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 95
char 1 77
char 1 79
char 1 68
char 1 69
char 1 76
char 1 10
char 1 0
align 1
LABELV $1384
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 83
char 1 84
char 1 82
char 1 79
char 1 89
char 1 95
char 1 71
char 1 72
char 1 79
char 1 85
char 1 76
char 1 50
char 1 95
char 1 73
char 1 78
char 1 83
char 1 84
char 1 65
char 1 78
char 1 67
char 1 69
char 1 10
char 1 0
align 1
LABELV $1379
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 71
char 1 65
char 1 95
char 1 79
char 1 66
char 1 74
char 1 69
char 1 67
char 1 84
char 1 73
char 1 86
char 1 69
char 1 67
char 1 79
char 1 77
char 1 80
char 1 76
char 1 69
char 1 84
char 1 69
char 1 10
char 1 0
align 1
LABELV $1374
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 71
char 1 65
char 1 95
char 1 82
char 1 79
char 1 85
char 1 78
char 1 68
char 1 79
char 1 86
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1369
char 1 69
char 1 86
char 1 95
char 1 67
char 1 84
char 1 70
char 1 77
char 1 69
char 1 83
char 1 83
char 1 65
char 1 71
char 1 69
char 1 10
char 1 0
align 1
LABELV $1364
char 1 69
char 1 86
char 1 95
char 1 83
char 1 67
char 1 79
char 1 82
char 1 69
char 1 80
char 1 76
char 1 85
char 1 77
char 1 10
char 1 0
align 1
LABELV $1359
char 1 69
char 1 86
char 1 95
char 1 71
char 1 82
char 1 69
char 1 78
char 1 65
char 1 68
char 1 69
char 1 95
char 1 66
char 1 79
char 1 85
char 1 78
char 1 67
char 1 69
char 1 10
char 1 0
align 1
LABELV $1351
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 82
char 1 69
char 1 83
char 1 80
char 1 65
char 1 87
char 1 78
char 1 10
char 1 0
align 1
LABELV $1344
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 80
char 1 79
char 1 80
char 1 10
char 1 0
align 1
LABELV $1327
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 95
char 1 84
char 1 69
char 1 76
char 1 69
char 1 80
char 1 79
char 1 82
char 1 84
char 1 95
char 1 79
char 1 85
char 1 84
char 1 10
char 1 0
align 1
LABELV $1322
char 1 109
char 1 112
char 1 47
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1309
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 95
char 1 84
char 1 69
char 1 76
char 1 69
char 1 80
char 1 79
char 1 82
char 1 84
char 1 95
char 1 73
char 1 78
char 1 10
char 1 0
align 1
LABELV $1300
char 1 83
char 1 69
char 1 69
char 1 75
char 1 69
char 1 82
char 1 95
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 68
char 1 69
char 1 80
char 1 76
char 1 79
char 1 89
char 1 69
char 1 68
char 1 0
align 1
LABELV $1298
char 1 83
char 1 72
char 1 73
char 1 69
char 1 76
char 1 68
char 1 95
char 1 78
char 1 79
char 1 82
char 1 79
char 1 79
char 1 77
char 1 0
align 1
LABELV $1296
char 1 83
char 1 69
char 1 78
char 1 84
char 1 82
char 1 89
char 1 95
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 80
char 1 76
char 1 65
char 1 67
char 1 69
char 1 68
char 1 0
align 1
LABELV $1294
char 1 83
char 1 69
char 1 78
char 1 84
char 1 82
char 1 89
char 1 95
char 1 78
char 1 79
char 1 82
char 1 79
char 1 79
char 1 77
char 1 0
align 1
LABELV $1286
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 85
char 1 83
char 1 69
char 1 70
char 1 65
char 1 73
char 1 76
char 1 10
char 1 0
align 1
LABELV $1281
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 52
char 1 10
char 1 0
align 1
LABELV $1276
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 51
char 1 10
char 1 0
align 1
LABELV $1271
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 50
char 1 10
char 1 0
align 1
LABELV $1266
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 49
char 1 10
char 1 0
align 1
LABELV $1261
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 48
char 1 10
char 1 0
align 1
LABELV $1256
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 57
char 1 10
char 1 0
align 1
LABELV $1251
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 56
char 1 10
char 1 0
align 1
LABELV $1246
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 55
char 1 10
char 1 0
align 1
LABELV $1241
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 54
char 1 10
char 1 0
align 1
LABELV $1236
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 53
char 1 10
char 1 0
align 1
LABELV $1231
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 52
char 1 10
char 1 0
align 1
LABELV $1226
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 51
char 1 10
char 1 0
align 1
LABELV $1221
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 50
char 1 10
char 1 0
align 1
LABELV $1216
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 10
char 1 0
align 1
LABELV $1211
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 48
char 1 10
char 1 0
align 1
LABELV $1201
char 1 69
char 1 86
char 1 95
char 1 83
char 1 67
char 1 82
char 1 69
char 1 69
char 1 78
char 1 83
char 1 72
char 1 65
char 1 75
char 1 69
char 1 10
char 1 0
align 1
LABELV $1179
char 1 69
char 1 86
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1170
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 103
char 1 114
char 1 105
char 1 112
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1168
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 106
char 1 117
char 1 109
char 1 112
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1166
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 97
char 1 98
char 1 115
char 1 111
char 1 114
char 1 98
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1159
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 97
char 1 98
char 1 115
char 1 111
char 1 114
char 1 98
char 1 104
char 1 105
char 1 116
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1157
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1155
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 104
char 1 105
char 1 116
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1150
char 1 69
char 1 86
char 1 95
char 1 80
char 1 82
char 1 69
char 1 68
char 1 69
char 1 70
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1145
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
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 47
char 1 122
char 1 111
char 1 111
char 1 109
char 1 101
char 1 110
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1144
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
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 47
char 1 122
char 1 111
char 1 111
char 1 109
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1137
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 90
char 1 79
char 1 79
char 1 77
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1130
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 72
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1123
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 83
char 1 78
char 1 73
char 1 80
char 1 69
char 1 82
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 10
char 1 0
align 1
LABELV $1103
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 83
char 1 78
char 1 73
char 1 80
char 1 69
char 1 82
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 10
char 1 0
align 1
LABELV $1083
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 77
char 1 65
char 1 73
char 1 78
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 10
char 1 0
align 1
LABELV $1073
char 1 109
char 1 112
char 1 47
char 1 106
char 1 101
char 1 100
char 1 105
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1058
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
LABELV $1057
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 85
char 1 78
char 1 72
char 1 79
char 1 76
char 1 83
char 1 84
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1052
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 100
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1045
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
char 1 98
char 1 108
char 1 111
char 1 99
char 1 107
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1044
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
char 1 98
char 1 108
char 1 111
char 1 99
char 1 107
char 1 37
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1036
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 66
char 1 76
char 1 79
char 1 67
char 1 75
char 1 10
char 1 0
align 1
LABELV $1031
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 112
char 1 97
char 1 114
char 1 107
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1018
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 98
char 1 108
char 1 111
char 1 111
char 1 100
char 1 95
char 1 115
char 1 112
char 1 97
char 1 114
char 1 107
char 1 115
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1017
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
char 1 104
char 1 105
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1009
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 72
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1004
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
char 1 104
char 1 117
char 1 112
char 1 37
char 1 105
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1003
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 65
char 1 84
char 1 84
char 1 65
char 1 67
char 1 75
char 1 10
char 1 0
align 1
LABELV $990
char 1 69
char 1 86
char 1 95
char 1 65
char 1 76
char 1 84
char 1 95
char 1 70
char 1 73
char 1 82
char 1 69
char 1 10
char 1 0
align 1
LABELV $985
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
LABELV $967
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 48
char 1 50
char 1 0
align 1
LABELV $964
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 48
char 1 49
char 1 0
align 1
LABELV $959
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
LABELV $958
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
LABELV $952
char 1 69
char 1 86
char 1 95
char 1 70
char 1 73
char 1 82
char 1 69
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $945
char 1 69
char 1 86
char 1 95
char 1 67
char 1 72
char 1 65
char 1 78
char 1 71
char 1 69
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $931
char 1 69
char 1 86
char 1 95
char 1 78
char 1 79
char 1 65
char 1 77
char 1 77
char 1 79
char 1 10
char 1 0
align 1
LABELV $917
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 79
char 1 66
char 1 65
char 1 76
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 80
char 1 73
char 1 67
char 1 75
char 1 85
char 1 80
char 1 10
char 1 0
align 1
LABELV $876
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $865
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 80
char 1 73
char 1 67
char 1 75
char 1 85
char 1 80
char 1 10
char 1 0
align 1
LABELV $860
char 1 42
char 1 103
char 1 97
char 1 115
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $859
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 67
char 1 76
char 1 69
char 1 65
char 1 82
char 1 10
char 1 0
align 1
LABELV $852
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 85
char 1 78
char 1 68
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $845
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 76
char 1 69
char 1 65
char 1 86
char 1 69
char 1 10
char 1 0
align 1
LABELV $838
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 84
char 1 79
char 1 85
char 1 67
char 1 72
char 1 10
char 1 0
align 1
LABELV $833
char 1 111
char 1 110
char 1 112
char 1 97
char 1 116
char 1 114
char 1 111
char 1 108
char 1 0
align 1
LABELV $832
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 80
char 1 65
char 1 84
char 1 82
char 1 79
char 1 76
char 1 10
char 1 0
align 1
LABELV $827
char 1 111
char 1 110
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 115
char 1 101
char 1 0
align 1
LABELV $826
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 71
char 1 85
char 1 65
char 1 82
char 1 68
char 1 66
char 1 65
char 1 83
char 1 69
char 1 10
char 1 0
align 1
LABELV $821
char 1 111
char 1 110
char 1 103
char 1 101
char 1 116
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $820
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 71
char 1 69
char 1 84
char 1 70
char 1 76
char 1 65
char 1 71
char 1 10
char 1 0
align 1
LABELV $815
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 109
char 1 101
char 1 0
align 1
LABELV $814
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 70
char 1 79
char 1 76
char 1 76
char 1 79
char 1 87
char 1 77
char 1 69
char 1 10
char 1 0
align 1
LABELV $809
char 1 110
char 1 111
char 1 0
align 1
LABELV $808
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 78
char 1 79
char 1 10
char 1 0
align 1
LABELV $803
char 1 121
char 1 101
char 1 115
char 1 0
align 1
LABELV $802
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 89
char 1 69
char 1 83
char 1 10
char 1 0
align 1
LABELV $797
char 1 42
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $796
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 10
char 1 0
align 1
LABELV $783
char 1 69
char 1 86
char 1 95
char 1 82
char 1 79
char 1 76
char 1 76
char 1 10
char 1 0
align 1
LABELV $778
char 1 42
char 1 106
char 1 117
char 1 109
char 1 112
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $777
char 1 69
char 1 86
char 1 95
char 1 74
char 1 85
char 1 77
char 1 80
char 1 10
char 1 0
align 1
LABELV $772
char 1 109
char 1 117
char 1 115
char 1 105
char 1 99
char 1 47
char 1 109
char 1 112
char 1 47
char 1 100
char 1 117
char 1 101
char 1 108
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $769
char 1 66
char 1 69
char 1 71
char 1 73
char 1 78
char 1 95
char 1 68
char 1 85
char 1 69
char 1 76
char 1 0
align 1
LABELV $768
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
LABELV $760
char 1 69
char 1 86
char 1 95
char 1 80
char 1 82
char 1 73
char 1 86
char 1 65
char 1 84
char 1 69
char 1 95
char 1 68
char 1 85
char 1 69
char 1 76
char 1 10
char 1 0
align 1
LABELV $755
char 1 69
char 1 86
char 1 95
char 1 74
char 1 85
char 1 77
char 1 80
char 1 95
char 1 80
char 1 65
char 1 68
char 1 10
char 1 0
align 1
LABELV $725
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 10
char 1 0
align 1
LABELV $716
char 1 69
char 1 86
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 10
char 1 0
align 1
LABELV $705
char 1 69
char 1 86
char 1 95
char 1 83
char 1 87
char 1 73
char 1 77
char 1 10
char 1 0
align 1
LABELV $694
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 87
char 1 65
char 1 68
char 1 69
char 1 10
char 1 0
align 1
LABELV $683
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 10
char 1 0
align 1
LABELV $672
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 77
char 1 69
char 1 84
char 1 65
char 1 76
char 1 10
char 1 0
align 1
LABELV $662
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 83
char 1 84
char 1 69
char 1 80
char 1 10
char 1 0
align 1
LABELV $655
char 1 69
char 1 86
char 1 95
char 1 67
char 1 76
char 1 73
char 1 69
char 1 78
char 1 84
char 1 74
char 1 79
char 1 73
char 1 78
char 1 10
char 1 0
align 1
LABELV $644
char 1 90
char 1 69
char 1 82
char 1 79
char 1 69
char 1 86
char 1 69
char 1 78
char 1 84
char 1 10
char 1 0
align 1
LABELV $638
char 1 101
char 1 110
char 1 116
char 1 58
char 1 37
char 1 51
char 1 105
char 1 32
char 1 32
char 1 101
char 1 118
char 1 101
char 1 110
char 1 116
char 1 58
char 1 37
char 1 51
char 1 105
char 1 32
char 1 0
align 1
LABELV $601
char 1 42
char 1 108
char 1 97
char 1 110
char 1 100
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $596
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 72
char 1 105
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $582
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $572
char 1 37
char 1 115
char 1 32
char 1 0
align 1
LABELV $567
char 1 37
char 1 115
char 1 0
align 1
LABELV $560
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 95
char 1 71
char 1 79
char 1 84
char 1 95
char 1 70
char 1 76
char 1 65
char 1 71
char 1 0
align 1
LABELV $558
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 95
char 1 67
char 1 65
char 1 80
char 1 84
char 1 85
char 1 82
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 65
char 1 71
char 1 0
align 1
LABELV $556
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 95
char 1 82
char 1 69
char 1 84
char 1 85
char 1 82
char 1 78
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 65
char 1 71
char 1 0
align 1
LABELV $554
char 1 70
char 1 76
char 1 65
char 1 71
char 1 95
char 1 82
char 1 69
char 1 84
char 1 85
char 1 82
char 1 78
char 1 69
char 1 68
char 1 0
align 1
LABELV $552
char 1 70
char 1 82
char 1 65
char 1 71
char 1 71
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 65
char 1 71
char 1 95
char 1 67
char 1 65
char 1 82
char 1 82
char 1 73
char 1 69
char 1 82
char 1 0
align 1
LABELV $547
char 1 70
char 1 82
char 1 69
char 1 69
char 1 0
align 1
LABELV $546
char 1 83
char 1 80
char 1 69
char 1 67
char 1 84
char 1 65
char 1 84
char 1 79
char 1 82
char 1 0
align 1
LABELV $543
char 1 66
char 1 76
char 1 85
char 1 69
char 1 0
align 1
LABELV $540
char 1 82
char 1 69
char 1 68
char 1 0
align 1
LABELV $533
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $531
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
LABELV $529
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
LABELV $520
char 1 112
char 1 101
char 1 108
char 1 118
char 1 105
char 1 115
char 1 0
align 1
LABELV $494
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
LABELV $493
char 1 114
char 1 95
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $491
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
LABELV $490
char 1 108
char 1 95
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $488
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
LABELV $487
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $485
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
LABELV $484
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $482
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
LABELV $481
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $479
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
LABELV $478
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 0
align 1
LABELV $476
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
LABELV $475
char 1 104
char 1 101
char 1 97
char 1 100
char 1 0
align 1
LABELV $468
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 49
char 1 48
char 1 48
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $467
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 55
char 1 53
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $464
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 53
char 1 48
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $461
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 50
char 1 53
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $454
char 1 80
char 1 73
char 1 67
char 1 75
char 1 85
char 1 80
char 1 76
char 1 73
char 1 78
char 1 69
char 1 0
align 1
LABELV $453
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 95
char 1 37
char 1 115
char 1 0
align 1
LABELV $336
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $330
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 84
char 1 79
char 1 83
char 1 83
char 1 0
align 1
LABELV $328
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 0
align 1
LABELV $326
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 84
char 1 69
char 1 76
char 1 69
char 1 70
char 1 82
char 1 65
char 1 71
char 1 0
align 1
LABELV $324
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 83
char 1 69
char 1 78
char 1 84
char 1 82
char 1 89
char 1 0
align 1
LABELV $322
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 65
char 1 82
char 1 75
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 0
align 1
LABELV $320
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 69
char 1 84
char 1 80
char 1 65
char 1 67
char 1 75
char 1 0
align 1
LABELV $318
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 84
char 1 82
char 1 73
char 1 80
char 1 77
char 1 73
char 1 78
char 1 69
char 1 95
char 1 84
char 1 73
char 1 77
char 1 69
char 1 68
char 1 0
align 1
LABELV $316
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 84
char 1 82
char 1 73
char 1 80
char 1 77
char 1 73
char 1 78
char 1 69
char 1 0
align 1
LABELV $314
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 84
char 1 72
char 1 69
char 1 82
char 1 77
char 1 65
char 1 76
char 1 0
align 1
LABELV $312
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 82
char 1 79
char 1 67
char 1 75
char 1 69
char 1 84
char 1 95
char 1 72
char 1 79
char 1 77
char 1 73
char 1 78
char 1 71
char 1 0
align 1
LABELV $310
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 82
char 1 79
char 1 67
char 1 75
char 1 69
char 1 84
char 1 0
align 1
LABELV $308
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 69
char 1 67
char 1 72
char 1 69
char 1 84
char 1 84
char 1 69
char 1 95
char 1 77
char 1 73
char 1 78
char 1 69
char 1 0
align 1
LABELV $306
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 69
char 1 67
char 1 72
char 1 69
char 1 84
char 1 84
char 1 69
char 1 0
align 1
LABELV $304
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 69
char 1 77
char 1 80
char 1 50
char 1 0
align 1
LABELV $302
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 82
char 1 69
char 1 80
char 1 69
char 1 65
char 1 84
char 1 69
char 1 82
char 1 65
char 1 76
char 1 84
char 1 0
align 1
LABELV $300
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 82
char 1 69
char 1 80
char 1 69
char 1 65
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $298
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 66
char 1 79
char 1 87
char 1 67
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $296
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 83
char 1 78
char 1 73
char 1 80
char 1 69
char 1 0
align 1
LABELV $294
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 0
align 1
LABELV $292
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 66
char 1 76
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $290
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 66
char 1 82
char 1 89
char 1 65
char 1 82
char 1 0
align 1
LABELV $288
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 0
align 1
LABELV $286
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 77
char 1 69
char 1 76
char 1 69
char 1 69
char 1 0
align 1
LABELV $284
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 83
char 1 84
char 1 85
char 1 78
char 1 0
align 1
LABELV $273
char 1 110
char 1 111
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $265
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $262
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 105
char 1 46
char 1 0
align 1
LABELV $261
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 80
char 1 76
char 1 65
char 1 67
char 1 69
char 1 95
char 1 87
char 1 73
char 1 84
char 1 72
char 1 0
align 1
LABELV $256
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $255
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 74
char 1 77
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 78
char 1 79
char 1 84
char 1 74
char 1 77
char 1 0
align 1
LABELV $254
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 77
char 1 69
char 1 83
char 1 83
char 1 65
char 1 71
char 1 69
char 1 0
align 1
LABELV $242
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $241
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 0
align 1
LABELV $227
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $226
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $223
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $220
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $219
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $216
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $212
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 76
char 1 69
char 1 67
char 1 84
char 1 82
char 1 79
char 1 67
char 1 85
char 1 84
char 1 69
char 1 68
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $211
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 76
char 1 69
char 1 67
char 1 84
char 1 82
char 1 79
char 1 67
char 1 85
char 1 84
char 1 69
char 1 68
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $208
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 76
char 1 69
char 1 67
char 1 84
char 1 82
char 1 79
char 1 67
char 1 85
char 1 84
char 1 69
char 1 68
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $204
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 88
char 1 80
char 1 76
char 1 79
char 1 83
char 1 73
char 1 86
char 1 69
char 1 83
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $203
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 88
char 1 80
char 1 76
char 1 79
char 1 83
char 1 73
char 1 86
char 1 69
char 1 83
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $200
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 88
char 1 80
char 1 76
char 1 79
char 1 83
char 1 73
char 1 86
char 1 69
char 1 83
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $196
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $195
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $192
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $182
char 1 68
char 1 73
char 1 69
char 1 68
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 0
align 1
LABELV $178
char 1 94
char 1 55
char 1 0
align 1
LABELV $177
char 1 110
char 1 0
align 1
LABELV $170
char 1 67
char 1 71
char 1 95
char 1 79
char 1 98
char 1 105
char 1 116
char 1 117
char 1 97
char 1 114
char 1 121
char 1 58
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 111
char 1 117
char 1 116
char 1 32
char 1 111
char 1 102
char 1 32
char 1 114
char 1 97
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $165
char 1 37
char 1 115
char 1 37
char 1 115
char 1 0
align 1
LABELV $160
char 1 37
char 1 105
char 1 37
char 1 115
char 1 0
align 1
LABELV $157
char 1 49
char 1 51
char 1 37
char 1 115
char 1 0
align 1
LABELV $154
char 1 49
char 1 50
char 1 37
char 1 115
char 1 0
align 1
LABELV $151
char 1 49
char 1 49
char 1 37
char 1 115
char 1 0
align 1
LABELV $148
char 1 51
char 1 37
char 1 115
char 1 0
align 1
LABELV $145
char 1 50
char 1 37
char 1 115
char 1 0
align 1
LABELV $142
char 1 49
char 1 37
char 1 115
char 1 0
align 1
LABELV $139
char 1 0
align 1
LABELV $136
char 1 32
char 1 0
align 1
LABELV $135
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 84
char 1 73
char 1 69
char 1 68
char 1 95
char 1 70
char 1 79
char 1 82
char 1 0
align 1
LABELV $134
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 78
char 1 85
char 1 77
char 1 66
char 1 69
char 1 82
char 1 95
char 1 84
char 1 72
char 1 0
align 1
LABELV $133
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 78
char 1 85
char 1 77
char 1 66
char 1 69
char 1 82
char 1 95
char 1 82
char 1 68
char 1 0
align 1
LABELV $132
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 78
char 1 85
char 1 77
char 1 66
char 1 69
char 1 82
char 1 95
char 1 78
char 1 68
char 1 0
align 1
LABELV $131
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 78
char 1 85
char 1 77
char 1 66
char 1 69
char 1 82
char 1 95
char 1 83
char 1 84
char 1 0
