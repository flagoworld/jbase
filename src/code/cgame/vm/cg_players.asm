data
export cg_customSoundNames
align 4
LABELV cg_customSoundNames
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
address $129
address $130
address $131
address $132
address $133
address $128
address $134
skip 64
export CG_CustomSound
code
proc CG_CustomSound 16 8
file "../cg_players.c"
line 39
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_players.c -- handle the media and animation for player entities
;4:#include "cg_local.h"
;5:#if MAC_PORT
;6:#include "../ghoul2/g2.h"
;7:#else
;8:#include "..\ghoul2\g2.h"
;9:#endif
;10:
;11:extern stringID_table_t animTable [MAX_ANIMATIONS+1];
;12:
;13:char	*cg_customSoundNames[MAX_CUSTOM_SOUNDS] = {
;14:	"*death1.wav",
;15:	"*death2.wav",
;16:	"*death3.wav",
;17:	"*jump1.wav",
;18:	"*pain25.wav",
;19:	"*pain50.wav",
;20:	"*pain75.wav",
;21:	"*pain100.wav",
;22:	"*falling1.wav",
;23:	"*choke1.wav",
;24:	"*choke2.wav",
;25:	"*choke3.wav",
;26:	"*gasp.wav",
;27:	"*land1.wav",
;28:	"*falling1.wav",
;29:	"*taunt.wav"
;30:};
;31:
;32:
;33:/*
;34:================
;35:CG_CustomSound
;36:
;37:================
;38:*/
;39:sfxHandle_t	CG_CustomSound( int clientNum, const char *soundName ) {
line 43
;40:	clientInfo_t *ci;
;41:	int			i;
;42:
;43:	if ( soundName[0] != '*' ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $136
line 44
;44:		return trap_S_RegisterSound( soundName );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $135
JUMPV
LABELV $136
line 47
;45:	}
;46:
;47:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $140
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $138
LABELV $140
line 48
;48:		clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 49
;49:	}
LABELV $138
line 50
;50:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
CNSTI4 788
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 52
;51:
;52:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i] ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $142
line 53
;53:		if ( !strcmp( soundName, cg_customSoundNames[i] ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $146
line 54
;54:			return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 652
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $135
JUMPV
LABELV $146
line 56
;55:		}
;56:	}
LABELV $143
line 52
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $145
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $142
LABELV $148
line 58
;57:
;58:	CG_Error( "Unknown custom sound: %s", soundName );
ADDRGP4 $149
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 59
;59:	return 0;
CNSTI4 0
RETI4
LABELV $135
endproc CG_CustomSound 16 8
export CG_NeedAnimSequence
proc CG_NeedAnimSequence 12 0
line 83
;60:}
;61:
;62:
;63:
;64:/*
;65:=============================================================================
;66:
;67:CLIENT INFO
;68:
;69:=============================================================================
;70:*/
;71:
;72:/*
;73:==========================
;74:CG_NeedAnimSequence
;75:
;76:Called to check if models are missing required animation sequences
;77:We do not list all used animations here but this check should eliminate
;78:a broad range of unsupported models. At least the ones that are included,
;79:which is all we really care about.
;80:==========================
;81:*/
;82:qboolean CG_NeedAnimSequence(int anim)
;83:{
line 84
;84:	if (anim >= BOTH_DEATH1 &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $151
ADDRLP4 0
INDIRI4
CNSTI4 19
GTI4 $151
line 86
;85:		anim <= BOTH_DEATH19)
;86:	{
line 87
;87:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $150
JUMPV
LABELV $151
line 90
;88:	}
;89:
;90:	if (anim >= BOTH_DISMEMBER_HEAD1 &&
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 91
LTI4 $153
ADDRLP4 4
INDIRI4
CNSTI4 96
GTI4 $153
line 92
;91:		anim <= BOTH_DISMEMBER_LARM)
;92:	{
line 93
;93:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $150
JUMPV
LABELV $153
line 96
;94:	}
;95:
;96:	if (anim >= BOTH_A1_T__B_ &&
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 138
LTI4 $155
ADDRLP4 8
INDIRI4
CNSTI4 547
GTI4 $155
line 98
;97:		anim <= BOTH_H1_S1_BR)
;98:	{
line 99
;99:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $150
JUMPV
LABELV $155
line 102
;100:	}
;101:
;102:	return qfalse;
CNSTI4 0
RETI4
LABELV $150
endproc CG_NeedAnimSequence 12 0
proc CG_IsValidCharacterModel 20 8
line 108
;103:}
;104:
;105://To see if the client is trying to use one of the included skins not meant for MP.
;106://I don't much care for hardcoded strings, but this seems the best way to go.
;107:static qboolean CG_IsValidCharacterModel(const char *modelName, const char *skinName)
;108:{
line 109
;109:	if (!Q_stricmp(modelName, "kyle"))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $158
line 110
;110:	{
line 111
;111:		if (!Q_stricmp(skinName, "fpls"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $161
line 112
;112:		{
line 113
;113:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $161
line 115
;114:		}
;115:		else if (!Q_stricmp(skinName, "fpls2"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $164
line 116
;116:		{
line 117
;117:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $164
line 119
;118:		}
;119:		else if (!Q_stricmp(skinName, "fpls3"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $169
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $159
line 120
;120:		{
line 121
;121:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
line 123
;122:		}
;123:	}
LABELV $158
line 124
;124:	else if (!Q_stricmp(modelName, "morgan"))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $170
line 125
;125:	{
line 130
;126:		//For morgan, we want to deny if the skin is anything but one of the valid ones
;127:		//Since his default skin is actually the bad one, you could just type
;128:		//"model morgan/blah" and get it. This rules out custom morgan skins without
;129:		//programming assistance unfortunately.
;130:		if (Q_stricmp(skinName, "default_mp") &&
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $173
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $173
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $173
line 133
;131:			Q_stricmp(skinName, "red") &&
;132:			Q_stricmp(skinName, "blue"))
;133:		{
line 134
;134:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $173
line 136
;135:		}
;136:	}
LABELV $170
LABELV $159
line 138
;137:
;138:	return qtrue;
CNSTI4 1
RETI4
LABELV $157
endproc CG_IsValidCharacterModel 20 8
export CG_ParseSurfsFile
proc CG_ParseSurfsFile 20112 20
line 143
;139:}
;140:
;141:#define MAX_SURF_LIST_SIZE	1024
;142:qboolean CG_ParseSurfsFile( const char *modelName, const char *skinName, char *surfOff, char *surfOn ) 
;143:{
line 153
;144:	const char	*text_p;
;145:	int			len;
;146:	const char	*token;
;147:	const char	*value;
;148:	char		text[20000];
;149:	char		sfilename[MAX_QPATH];
;150:	fileHandle_t	f;
;151:	
;152:	// Load and parse .surf file
;153:	Com_sprintf( sfilename, sizeof( sfilename ), "models/players/%s/model_%s.surf", modelName, skinName );
ADDRLP4 20016
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $179
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 156
;154:
;155:	// load the file
;156:	len = trap_FS_FOpenFile( sfilename, &f, FS_READ );
ADDRLP4 20016
ARGP4
ADDRLP4 20080
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20084
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20084
INDIRI4
ASGNI4
line 157
;157:	if ( len <= 0 ) 
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $180
line 158
;158:	{//no file
line 159
;159:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $178
JUMPV
LABELV $180
line 161
;160:	}
;161:	if ( len >= sizeof( text ) - 1 ) 
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $182
line 162
;162:	{
line 163
;163:		Com_Printf( "File %s too long\n", sfilename );
ADDRGP4 $184
ARGP4
ADDRLP4 20016
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 164
;164:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $178
JUMPV
LABELV $182
line 167
;165:	}
;166:
;167:	trap_FS_Read( text, len, f );
ADDRLP4 16
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 20080
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 168
;168:	text[len] = 0;
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 0
ASGNI1
line 169
;169:	trap_FS_FCloseFile( f );
ADDRLP4 20080
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 172
;170:
;171:	// parse the text
;172:	text_p = text;
ADDRLP4 4
ADDRLP4 16
ASGNP4
line 174
;173:
;174:	memset( (char *)surfOff, 0, sizeof(surfOff) );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 175
;175:	memset( (char *)surfOn, 0, sizeof(surfOn) );
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $186
JUMPV
LABELV $185
line 179
;176:
;177:	// read information for surfOff and surfOn
;178:	while ( 1 ) 
;179:	{
line 180
;180:		token = COM_ParseExt( &text_p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 20088
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20088
INDIRP4
ASGNP4
line 181
;181:		if ( !token || !token[0] ) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $190
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $188
LABELV $190
line 182
;182:		{
line 183
;183:			break;
ADDRGP4 $187
JUMPV
LABELV $188
line 187
;184:		}
;185:
;186:		// surfOff
;187:		if ( !Q_stricmp( token, "surfOff" ) ) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $193
ARGP4
ADDRLP4 20096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20096
INDIRI4
CNSTI4 0
NEI4 $191
line 188
;188:		{
line 189
;189:			if ( COM_ParseString( &text_p, &value ) ) 
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20100
ADDRGP4 COM_ParseString
CALLI4
ASGNI4
ADDRLP4 20100
INDIRI4
CNSTI4 0
EQI4 $194
line 190
;190:			{
line 191
;191:				continue;
ADDRGP4 $186
JUMPV
LABELV $194
line 193
;192:			}
;193:			if ( surfOff && surfOff[0] )
ADDRLP4 20104
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20104
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $196
ADDRLP4 20104
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $196
line 194
;194:			{
line 195
;195:				Q_strcat( surfOff, MAX_SURF_LIST_SIZE, "," );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $198
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 196
;196:				Q_strcat( surfOff, MAX_SURF_LIST_SIZE, value );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 197
;197:			}
ADDRGP4 $186
JUMPV
LABELV $196
line 199
;198:			else
;199:			{
line 200
;200:				Q_strncpyz( surfOff, value, MAX_SURF_LIST_SIZE );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 201
;201:			}
line 202
;202:			continue;
ADDRGP4 $186
JUMPV
LABELV $191
line 206
;203:		}
;204:		
;205:		// surfOn
;206:		if ( !Q_stricmp( token, "surfOn" ) ) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $201
ARGP4
ADDRLP4 20100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20100
INDIRI4
CNSTI4 0
NEI4 $199
line 207
;207:		{
line 208
;208:			if ( COM_ParseString( &text_p, &value ) ) 
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20104
ADDRGP4 COM_ParseString
CALLI4
ASGNI4
ADDRLP4 20104
INDIRI4
CNSTI4 0
EQI4 $202
line 209
;209:			{
line 210
;210:				continue;
ADDRGP4 $186
JUMPV
LABELV $202
line 212
;211:			}
;212:			if ( surfOn && surfOn[0] )
ADDRLP4 20108
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $204
ADDRLP4 20108
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $204
line 213
;213:			{
line 214
;214:				Q_strcat( surfOn, MAX_SURF_LIST_SIZE, ",");
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $198
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 215
;215:				Q_strcat( surfOn, MAX_SURF_LIST_SIZE, value );
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 216
;216:			}
ADDRGP4 $186
JUMPV
LABELV $204
line 218
;217:			else
;218:			{
line 219
;219:				Q_strncpyz( surfOn, value, MAX_SURF_LIST_SIZE );
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 220
;220:			}
line 221
;221:			continue;
LABELV $199
line 223
;222:		}
;223:	}
LABELV $186
line 178
ADDRGP4 $185
JUMPV
LABELV $187
line 224
;224:	return qtrue;
CNSTI4 1
RETI4
LABELV $178
endproc CG_ParseSurfsFile 20112 20
lit
align 4
LABELV $207
byte 4 0
byte 4 0
byte 4 0
code
proc CG_RegisterClientModelname 2320 44
line 232
;225:}
;226:
;227:/*
;228:==========================
;229:CG_RegisterClientModelname
;230:==========================
;231:*/
;232:static qboolean CG_RegisterClientModelname( clientInfo_t *ci, const char *modelName, const char *skinName, const char *teamName, int clientNum ) {
line 237
;233:	int handle;
;234:	char		afilename[MAX_QPATH];
;235:	char		/**GLAName,*/ *slash;
;236:	char		GLAName[MAX_QPATH];
;237:	vec3_t	tempVec = {0,0,0};
ADDRLP4 132
ADDRGP4 $207
INDIRB
ASGNB 12
line 238
;238:	qboolean badModel = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 239
;239:	qboolean retriedAlready = qfalse;
ADDRLP4 2196
CNSTI4 0
ASGNI4
LABELV $208
line 244
;240:	char	surfOff[MAX_SURF_LIST_SIZE];
;241:	char	surfOn[MAX_SURF_LIST_SIZE];
;242:
;243:retryModel:
;244:	if (ci->ATST && clientNum == -1)
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
ADDRFP4 16
INDIRI4
CNSTI4 -1
NEI4 $209
line 245
;245:	{
line 246
;246:		Com_sprintf(ci->teamName, sizeof(ci->teamName), teamName);
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 247
;247:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $206
JUMPV
LABELV $209
line 250
;248:	}
;249:
;250:	if (badModel)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $211
line 251
;251:	{
line 252
;252:		modelName = "kyle";
ADDRFP4 4
ADDRGP4 $160
ASGNP4
line 253
;253:		skinName = "default";
ADDRFP4 8
ADDRGP4 $213
ASGNP4
line 254
;254:		Com_Printf("WARNING: Attempted to load an unsupported multiplayer model! (bad or missing bone, or missing animation sequence)\n");
ADDRGP4 $214
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 256
;255:
;256:		badModel = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 257
;257:		retriedAlready = qtrue;
ADDRLP4 2196
CNSTI4 1
ASGNI4
line 258
;258:	}
LABELV $211
line 260
;259:
;260:	if (!CG_IsValidCharacterModel(modelName, skinName))
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 2204
ADDRGP4 CG_IsValidCharacterModel
CALLI4
ASGNI4
ADDRLP4 2204
INDIRI4
CNSTI4 0
NEI4 $215
line 261
;261:	{
line 262
;262:		modelName = "kyle";
ADDRFP4 4
ADDRGP4 $160
ASGNP4
line 263
;263:		skinName = "default";
ADDRFP4 8
ADDRGP4 $213
ASGNP4
line 264
;264:	}
LABELV $215
line 267
;265:
;266:	// First things first.  If this is a ghoul2 model, then let's make sure we demolish this first.
;267:	if (ci->ghoul2Model && trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
ADDRLP4 2208
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $217
ADDRLP4 2208
INDIRP4
ARGP4
ADDRLP4 2212
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 2212
INDIRI4
CNSTI4 0
EQI4 $217
line 268
;268:	{
line 269
;269:		trap_G2API_CleanGhoul2Models(&(ci->ghoul2Model));
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 270
;270:	}
LABELV $217
line 272
;271:
;272:	if ( cgs.gametype >= GT_TEAM && !cgs.jediVmerc )
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $219
ADDRGP4 cgs+32996
INDIRI4
CNSTI4 0
NEI4 $219
line 273
;273:	{
line 274
;274:		if (ci->team == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $223
line 275
;275:		{
line 276
;276:			Q_strncpyz(ci->skinName, "red", sizeof(ci->skinName));
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 $176
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 277
;277:			skinName = "red";
ADDRFP4 8
ADDRGP4 $176
ASGNP4
line 278
;278:		}
ADDRGP4 $224
JUMPV
LABELV $223
line 279
;279:		else if (ci->team == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $225
line 280
;280:		{
line 281
;281:			Q_strncpyz(ci->skinName, "blue", sizeof(ci->skinName));
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 $177
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 282
;282:			skinName = "blue";
ADDRFP4 8
ADDRGP4 $177
ASGNP4
line 283
;283:		}
LABELV $225
LABELV $224
line 284
;284:	}
LABELV $219
line 286
;285:
;286:	if (clientNum != -1 && cg_entities[clientNum].currentState.teamowner && !cg_entities[clientNum].isATST)
ADDRLP4 2216
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 2216
INDIRI4
CNSTI4 -1
EQI4 $227
ADDRLP4 2220
CNSTI4 1920
ADDRLP4 2216
INDIRI4
MULI4
ASGNI4
ADDRLP4 2224
CNSTI4 0
ASGNI4
ADDRLP4 2220
INDIRI4
ADDRGP4 cg_entities+264
ADDP4
INDIRI4
ADDRLP4 2224
INDIRI4
EQI4 $227
ADDRLP4 2220
INDIRI4
ADDRGP4 cg_entities+1028
ADDP4
INDIRI4
ADDRLP4 2224
INDIRI4
NEI4 $227
line 287
;287:	{
line 288
;288:		ci->torsoSkin = 0;
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 289
;289:		ci->ATST = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 290
;290:		handle = trap_G2API_InitGhoul2Model(&ci->ghoul2Model, "models/players/atst/model.glm", 0, 0, 0, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 $231
ARGP4
ADDRLP4 2228
CNSTI4 0
ASGNI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2232
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
ASGNI4
ADDRLP4 2192
ADDRLP4 2232
INDIRI4
ASGNI4
line 291
;291:	}
ADDRGP4 $228
JUMPV
LABELV $227
line 293
;292:	else
;293:	{
line 294
;294:		ci->torsoSkin = trap_R_RegisterSkin(va("models/players/%s/model_%s.skin", modelName, skinName));
ADDRGP4 $232
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 2228
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2228
INDIRP4
ARGP4
ADDRLP4 2232
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 2232
INDIRI4
ASGNI4
line 295
;295:		ci->ATST = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 0
ASGNI4
line 296
;296:		Com_sprintf( afilename, sizeof( afilename ), "models/players/%s/model.glm", modelName );
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $233
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 297
;297:		handle = trap_G2API_InitGhoul2Model(&ci->ghoul2Model, afilename, 0, ci->torsoSkin, 0, 0, 0);
ADDRLP4 2236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2236
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 2240
CNSTI4 0
ASGNI4
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2236
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ARGI4
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2244
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
ASGNI4
ADDRLP4 2192
ADDRLP4 2244
INDIRI4
ASGNI4
line 298
;298:	}
LABELV $228
line 299
;299:	if (handle<0)
ADDRLP4 2192
INDIRI4
CNSTI4 0
GEI4 $234
line 300
;300:	{
line 301
;301:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $234
line 306
;302:	}
;303:
;304:	// The model is now loaded.
;305:
;306:	GLAName[0] = 0;
ADDRLP4 4
CNSTI1 0
ASGNI1
line 308
;307:
;308:	trap_G2API_GetGLAName( ci->ghoul2Model, 0, GLAName);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_G2API_GetGLAName
CALLV
pop
line 309
;309:	if (GLAName[0] != 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $236
line 310
;310:	{
line 311
;311:		if (!strstr(GLAName, "players/_humanoid/"))
ADDRLP4 4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 2228
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 2228
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $238
line 312
;312:		{ //Bad!
line 313
;313:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 314
;314:			goto retryModel;
ADDRGP4 $208
JUMPV
LABELV $238
line 316
;315:		}
;316:	}
LABELV $236
line 318
;317:
;318:	if (!BGPAFtextLoaded)
ADDRGP4 BGPAFtextLoaded
INDIRI4
CNSTI4 0
NEI4 $241
line 319
;319:	{
line 320
;320:		if (GLAName[0] == 0/*GLAName == NULL*/)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $243
line 321
;321:		{
line 322
;322:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $247
ARGP4
ADDRLP4 2228
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 2228
INDIRI4
CNSTI4 0
NEI4 $245
line 323
;323:			{
line 324
;324:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $248
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 325
;325:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $245
line 327
;326:			}
;327:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $206
JUMPV
LABELV $243
line 329
;328:		}
;329:		Q_strncpyz( afilename, GLAName, sizeof( afilename ));
ADDRLP4 68
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 330
;330:		slash = Q_strrchr( afilename, '/' );
ADDRLP4 68
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 2228
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 2200
ADDRLP4 2228
INDIRP4
ASGNP4
line 331
;331:		if ( slash )
ADDRLP4 2200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $249
line 332
;332:		{
line 333
;333:			strcpy(slash, "/animation.cfg");
ADDRLP4 2200
INDIRP4
ARGP4
ADDRGP4 $251
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 334
;334:		}	// Now afilename holds just the path to the animation.cfg
ADDRGP4 $250
JUMPV
LABELV $249
line 336
;335:		else 
;336:		{	// Didn't find any slashes, this is a raw filename right in base (whish isn't a good thing)
line 337
;337:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $250
line 353
;338:		}
;339:
;340:		/*
;341:		// Try to load the animation.cfg for this model then.
;342:		if ( !BG_ParseAnimationFile( afilename, ci->animations ) )
;343:		{	// The GLA's animations failed
;344:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg", ci->animations))
;345:			{
;346:				Com_Printf( "Failed to load animation file %s\n", afilename );
;347:				return qfalse;
;348:			}
;349:		}
;350:		*/
;351:		//rww - For now, we'll just ignore what animation file it wants. In theory all multiplayer-supported models
;352:		//should want _humanoid/animation.cfg, so if it doesn't want that then throw it away
;353:		if (Q_stricmp(afilename, "models/players/_humanoid/animation.cfg"))
ADDRLP4 68
ARGP4
ADDRGP4 $247
ARGP4
ADDRLP4 2232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2232
INDIRI4
CNSTI4 0
EQI4 $252
line 354
;354:		{
line 355
;355:			Com_Printf( "Model does not use supported animation config.\n");
ADDRGP4 $254
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 356
;356:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $252
line 358
;357:		}
;358:		else if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $247
ARGP4
ADDRLP4 2236
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 2236
INDIRI4
CNSTI4 0
NEI4 $255
line 359
;359:		{
line 360
;360:			Com_Printf( "Failed to load animation file models/players/_humanoid/animation.cfg\n" );
ADDRGP4 $257
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 361
;361:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $255
line 363
;362:		}
;363:		else if (!retriedAlready)
ADDRLP4 2196
INDIRI4
CNSTI4 0
NEI4 $258
line 364
;364:		{
line 367
;365:			int i;
;366:
;367:			for(i = 0; i < MAX_ANIMATIONS; i++)
ADDRLP4 2240
CNSTI4 0
ASGNI4
LABELV $260
line 368
;368:			{
line 369
;369:				if (!bgGlobalAnimations[i].firstFrame && !bgGlobalAnimations[i].numFrames && CG_NeedAnimSequence(i))
ADDRLP4 2248
CNSTI4 28
ADDRLP4 2240
INDIRI4
MULI4
ASGNI4
ADDRLP4 2252
CNSTI4 0
ASGNI4
ADDRLP4 2248
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ADDRLP4 2252
INDIRI4
NEI4 $264
ADDRLP4 2248
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDRLP4 2252
INDIRI4
NEI4 $264
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2256
ADDRGP4 CG_NeedAnimSequence
CALLI4
ASGNI4
ADDRLP4 2256
INDIRI4
CNSTI4 0
EQI4 $264
line 370
;370:				{ //using default for this animation so it obviously never got filled in.
line 372
;371:					//if it's a sequence that we need, this model must be an unsupported one.
;372:					badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 373
;373:					goto retryModel;
ADDRGP4 $208
JUMPV
LABELV $264
line 375
;374:				}
;375:			}
LABELV $261
line 367
ADDRLP4 2240
ADDRLP4 2240
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2240
INDIRI4
CNSTI4 1210
LTI4 $260
line 376
;376:		}
LABELV $258
line 377
;377:	}
LABELV $241
line 379
;378:
;379:	if ( CG_ParseSurfsFile( modelName, skinName, surfOff, surfOn ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 144
ARGP4
ADDRLP4 1168
ARGP4
ADDRLP4 2228
ADDRGP4 CG_ParseSurfsFile
CALLI4
ASGNI4
ADDRLP4 2228
INDIRI4
CNSTI4 0
EQI4 $267
line 380
;380:	{//turn on/off any surfs
line 385
;381:		const char	*token;
;382:		const char	*p;
;383:
;384:		//Now turn on/off any surfaces
;385:		if ( surfOff && surfOff[0] )
ADDRLP4 144
CVPU4 4
CNSTU4 0
EQU4 $269
ADDRLP4 144
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $269
line 386
;386:		{
line 387
;387:			p = surfOff;
ADDRLP4 2236
ADDRLP4 144
ASGNP4
ADDRGP4 $272
JUMPV
LABELV $271
line 389
;388:			while ( 1 ) 
;389:			{
line 390
;390:				token = COM_ParseExt( &p, qtrue );
ADDRLP4 2236
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2240
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 2232
ADDRLP4 2240
INDIRP4
ASGNP4
line 391
;391:				if ( !token[0] ) 
ADDRLP4 2232
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $274
line 392
;392:				{//reached end of list
line 393
;393:					break;
ADDRGP4 $273
JUMPV
LABELV $274
line 396
;394:				}
;395:				//turn off this surf
;396:				trap_G2API_SetSurfaceOnOff( ci->ghoul2Model, token, 0x00000002/*G2SURFACEFLAG_OFF*/ );
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2232
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 397
;397:			}
LABELV $272
line 388
ADDRGP4 $271
JUMPV
LABELV $273
line 398
;398:		}
LABELV $269
line 399
;399:		if ( surfOn && surfOn[0] )
ADDRLP4 1168
CVPU4 4
CNSTU4 0
EQU4 $276
ADDRLP4 1168
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $276
line 400
;400:		{
line 401
;401:			p = surfOn;
ADDRLP4 2236
ADDRLP4 1168
ASGNP4
ADDRGP4 $279
JUMPV
LABELV $278
line 403
;402:			while ( 1 )
;403:			{
line 404
;404:				token = COM_ParseExt( &p, qtrue );
ADDRLP4 2236
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2240
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 2232
ADDRLP4 2240
INDIRP4
ASGNP4
line 405
;405:				if ( !token[0] ) 
ADDRLP4 2232
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $281
line 406
;406:				{//reached end of list
line 407
;407:					break;
ADDRGP4 $280
JUMPV
LABELV $281
line 410
;408:				}
;409:				//turn on this surf
;410:				trap_G2API_SetSurfaceOnOff( ci->ghoul2Model, token, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2232
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 411
;411:			}
LABELV $279
line 402
ADDRGP4 $278
JUMPV
LABELV $280
line 412
;412:		}
LABELV $276
line 413
;413:	}
LABELV $267
line 415
;414:
;415:	if (clientNum != -1 && cg_entities[clientNum].currentState.teamowner && !cg_entities[clientNum].isATST)
ADDRLP4 2232
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 2232
INDIRI4
CNSTI4 -1
EQI4 $283
ADDRLP4 2236
CNSTI4 1920
ADDRLP4 2232
INDIRI4
MULI4
ASGNI4
ADDRLP4 2240
CNSTI4 0
ASGNI4
ADDRLP4 2236
INDIRI4
ADDRGP4 cg_entities+264
ADDP4
INDIRI4
ADDRLP4 2240
INDIRI4
EQI4 $283
ADDRLP4 2236
INDIRI4
ADDRGP4 cg_entities+1028
ADDP4
INDIRI4
ADDRLP4 2240
INDIRI4
NEI4 $283
line 416
;416:	{
line 417
;417:		ci->torsoSkin = 0;
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 418
;418:		ci->bolt_rhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*flash1");
ADDRLP4 2244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2244
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $287
ARGP4
ADDRLP4 2248
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2244
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 2248
INDIRI4
ASGNI4
line 419
;419:		trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "Model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, cg.time, -1, -1);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2252
CNSTI4 0
ASGNI4
ADDRLP4 2252
INDIRI4
ARGI4
ADDRGP4 $288
ARGP4
ADDRLP4 2252
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 420
;420:		trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "l_clavical", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2256
CNSTI4 0
ASGNI4
ADDRLP4 2256
INDIRI4
ARGI4
ADDRGP4 $290
ARGP4
ADDRLP4 132
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
ADDRLP4 2256
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 421
;421:		trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "r_clavical", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2260
CNSTI4 0
ASGNI4
ADDRLP4 2260
INDIRI4
ARGI4
ADDRGP4 $292
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 2264
CNSTI4 2
ASGNI4
ADDRLP4 2264
INDIRI4
ARGI4
ADDRLP4 2264
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 2260
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 423
;422:
;423:		ci->bolt_lhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*flash2");
ADDRLP4 2268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2268
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $294
ARGP4
ADDRLP4 2272
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2268
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 2272
INDIRI4
ASGNI4
line 424
;424:		ci->bolt_head = trap_G2API_AddBolt(ci->ghoul2Model, 0, "pelvis");
ADDRLP4 2276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2276
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 2280
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2276
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 2280
INDIRI4
ASGNI4
line 425
;425:	}
ADDRGP4 $284
JUMPV
LABELV $283
line 427
;426:	else
;427:	{
line 428
;428:		ci->bolt_rhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*r_hand");
ADDRLP4 2244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2244
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $296
ARGP4
ADDRLP4 2248
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2244
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 2248
INDIRI4
ASGNI4
line 430
;429:		
;430:		if (!trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, cg.time, -1, -1))
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2252
CNSTI4 0
ASGNI4
ADDRLP4 2252
INDIRI4
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 2252
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRLP4 2256
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
ASGNI4
ADDRLP4 2256
INDIRI4
CNSTI4 0
NEI4 $297
line 431
;431:		{
line 432
;432:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 433
;433:		}
LABELV $297
line 435
;434:		
;435:		if (!trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "upper_lumbar", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, cg.time))
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2260
CNSTI4 0
ASGNI4
ADDRLP4 2260
INDIRI4
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 132
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
ADDRLP4 2260
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 2264
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
ASGNI4
ADDRLP4 2264
INDIRI4
CNSTI4 0
NEI4 $301
line 436
;436:		{
line 437
;437:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 438
;438:		}
LABELV $301
line 440
;439:
;440:		if (!trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "cranium", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, cg.time))
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2268
CNSTI4 0
ASGNI4
ADDRLP4 2268
INDIRI4
ARGI4
ADDRGP4 $307
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 2272
CNSTI4 2
ASGNI4
ADDRLP4 2272
INDIRI4
ARGI4
ADDRLP4 2272
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 2268
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 2276
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
ASGNI4
ADDRLP4 2276
INDIRI4
CNSTI4 0
NEI4 $305
line 441
;441:		{
line 442
;442:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 443
;443:		}
LABELV $305
line 445
;444:
;445:		ci->bolt_lhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*l_hand");
ADDRLP4 2280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2280
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $309
ARGP4
ADDRLP4 2284
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2280
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 2284
INDIRI4
ASGNI4
line 446
;446:		ci->bolt_head = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*head_top");
ADDRLP4 2288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2288
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $310
ARGP4
ADDRLP4 2292
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2288
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 2292
INDIRI4
ASGNI4
line 448
;447:
;448:		ci->bolt_motion = trap_G2API_AddBolt(ci->ghoul2Model, 0, "Motion");
ADDRLP4 2296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2296
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 2300
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2296
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 2300
INDIRI4
ASGNI4
line 451
;449:
;450:		//We need a lower lumbar bolt for footsteps
;451:		ci->bolt_llumbar = trap_G2API_AddBolt(ci->ghoul2Model, 0, "lower_lumbar");
ADDRLP4 2304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2304
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 2308
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2304
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 2308
INDIRI4
ASGNI4
line 453
;452:
;453:		if (ci->bolt_rhand == -1 || ci->bolt_lhand == -1 || ci->bolt_head == -1 || ci->bolt_motion == -1 || ci->bolt_llumbar == -1)
ADDRLP4 2312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2316
CNSTI4 -1
ASGNI4
ADDRLP4 2312
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
EQI4 $318
ADDRLP4 2312
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
EQI4 $318
ADDRLP4 2312
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
EQI4 $318
ADDRLP4 2312
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
EQI4 $318
ADDRLP4 2312
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
NEI4 $313
LABELV $318
line 454
;454:		{
line 455
;455:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 456
;456:		}
LABELV $313
line 458
;457:
;458:		if (badModel)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $319
line 459
;459:		{
line 460
;460:			goto retryModel;
ADDRGP4 $208
JUMPV
LABELV $319
line 462
;461:		}
;462:	}
LABELV $284
line 466
;463:
;464://	ent->s.radius = 90;
;465:
;466:	if (clientNum != -1)
ADDRFP4 16
INDIRI4
CNSTI4 -1
EQI4 $321
line 467
;467:	{
line 468
;468:		if (cg_entities[clientNum].isATST)
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $323
line 469
;469:		{
line 472
;470:			animation_t *anim;
;471:
;472:			anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.legsAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 2244
CNSTI4 28
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 474
;473:
;474:			if (anim)
ADDRLP4 2244
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $327
line 475
;475:			{
line 476
;476:				int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 2248
CNSTI4 72
ASGNI4
line 477
;477:				int firstFrame = anim->firstFrame + anim->numFrames-1;
ADDRLP4 2256
ADDRLP4 2244
INDIRP4
ASGNP4
ADDRLP4 2252
ADDRLP4 2256
INDIRP4
INDIRI4
ADDRLP4 2256
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 479
;478:
;479:				if (anim->loopFrames != -1)
ADDRLP4 2244
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $329
line 480
;480:				{
line 481
;481:					flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 2248
CNSTI4 16
ASGNI4
line 482
;482:					firstFrame = anim->firstFrame;
ADDRLP4 2252
ADDRLP4 2244
INDIRP4
INDIRI4
ASGNI4
line 483
;483:				}
LABELV $329
line 486
;484:
;485:				//rww - Set the animation again because it just got reset due to the model change
;486:				trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", firstFrame, anim->firstFrame + anim->numFrames, flags, 1.0f, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 2252
INDIRI4
ARGI4
ADDRLP4 2260
ADDRLP4 2244
INDIRP4
ASGNP4
ADDRLP4 2260
INDIRP4
INDIRI4
ADDRLP4 2260
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 2248
INDIRI4
ARGI4
CNSTF4 1065353216
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
line 488
;487:
;488:				cg_entities[clientNum].currentState.legsAnim = 0;
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
CNSTI4 0
ASGNI4
line 489
;489:			}
LABELV $327
line 491
;490:
;491:			anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.torsoAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 2244
CNSTI4 28
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 493
;492:
;493:			if (anim)
ADDRLP4 2244
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $334
line 494
;494:			{
line 495
;495:				int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 2248
CNSTI4 72
ASGNI4
line 496
;496:				int firstFrame = anim->firstFrame + anim->numFrames-1;
ADDRLP4 2256
ADDRLP4 2244
INDIRP4
ASGNP4
ADDRLP4 2252
ADDRLP4 2256
INDIRP4
INDIRI4
ADDRLP4 2256
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 498
;497:
;498:				if (anim->loopFrames != -1)
ADDRLP4 2244
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $336
line 499
;499:				{
line 500
;500:					flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 2248
CNSTI4 16
ASGNI4
line 501
;501:					firstFrame = anim->firstFrame;
ADDRLP4 2252
ADDRLP4 2244
INDIRP4
INDIRI4
ASGNI4
line 502
;502:				}
LABELV $336
line 505
;503:
;504:				//rww - Set the animation again because it just got reset due to the model change
;505:				trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "lower_lumbar", anim->firstFrame + anim->numFrames-1, anim->firstFrame + anim->numFrames, flags, 1.0f, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 2260
ADDRLP4 2244
INDIRP4
ASGNP4
ADDRLP4 2264
ADDRLP4 2260
INDIRP4
INDIRI4
ADDRLP4 2260
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRLP4 2264
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 2264
INDIRI4
ARGI4
ADDRLP4 2248
INDIRI4
ARGI4
CNSTF4 1065353216
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
line 507
;506:
;507:				cg_entities[clientNum].currentState.torsoAnim = 0;
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
CNSTI4 0
ASGNI4
line 508
;508:			}
LABELV $334
line 509
;509:		}
LABELV $323
line 519
;510:
;511:		/*
;512:		if (cg_entities[clientNum].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[clientNum].ghoul2))
;513:		{
;514:			trap_G2API_CleanGhoul2Models(&(cg_entities[clientNum].ghoul2));
;515:		}
;516:		trap_G2API_DuplicateGhoul2Instance(ci->ghoul2Model, &cg_entities[clientNum].ghoul2);	
;517:		*/
;518:
;519:		cg_entities[clientNum].ghoul2weapon = NULL;
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+960
ADDP4
CNSTP4 0
ASGNP4
line 520
;520:	}
LABELV $321
line 522
;521:
;522:	Q_strncpyz (ci->teamName, teamName, sizeof(ci->teamName));
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 525
;523:
;524:	// Model icon for drawing the portrait on screen
;525:	ci->modelIcon = trap_R_RegisterShaderNoMip ( va ( "models/players/%s/icon_%s", modelName, skinName ) );
ADDRGP4 $341
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 2244
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2244
INDIRP4
ARGP4
ADDRLP4 2248
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 2248
INDIRI4
ASGNI4
line 527
;526:
;527:	return qtrue;
CNSTI4 1
RETI4
LABELV $206
endproc CG_RegisterClientModelname 2320 44
proc CG_ColorFromString 20 4
line 535
;528:}
;529:
;530:/*
;531:====================
;532:CG_ColorFromString
;533:====================
;534:*/
;535:static void CG_ColorFromString( const char *v, vec3_t color ) {
line 538
;536:	int val;
;537:
;538:	VectorClear( color );
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 540
;539:
;540:	val = atoi( v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 542
;541:
;542:	if ( val < 1 || val > 7 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $345
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $343
LABELV $345
line 543
;543:		VectorSet( color, 1, 1, 1 );
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 544
;544:		return;
ADDRGP4 $342
JUMPV
LABELV $343
line 547
;545:	}
;546:
;547:	if ( val & 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $346
line 548
;548:		color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 549
;549:	}
LABELV $346
line 550
;550:	if ( val & 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $348
line 551
;551:		color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 552
;552:	}
LABELV $348
line 553
;553:	if ( val & 4 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $350
line 554
;554:		color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 555
;555:	}
LABELV $350
line 556
;556:}
LABELV $342
endproc CG_ColorFromString 20 4
export CG_LoadClientInfo
proc CG_LoadClientInfo 1264 24
line 568
;557:
;558:#define DEFAULT_FEMALE_SOUNDPATH "chars/mp_generic_female/misc"//"chars/tavion/misc"
;559:#define DEFAULT_MALE_SOUNDPATH "chars/mp_generic_male/misc"//"chars/kyle/misc"
;560:/*
;561:===================
;562:CG_LoadClientInfo
;563:
;564:Load it now, taking the disk hits.
;565:This will usually be deferred to a safe time
;566:===================
;567:*/
;568:void CG_LoadClientInfo( clientInfo_t *ci ) {
line 574
;569:	const char	*dir, *fallback;
;570:	int			i, modelloaded;
;571:	const char	*s;
;572:	int			clientNum;
;573:	char		teamname[MAX_QPATH];
;574:	int			fLen = 0;
ADDRLP4 1184
CNSTI4 0
ASGNI4
line 577
;575:	char		soundpath[MAX_QPATH];
;576:	char		soundName[1024];
;577:	qboolean	isFemale = qfalse;
ADDRLP4 1100
CNSTI4 0
ASGNI4
line 580
;578:	fileHandle_t f;
;579:
;580:	clientNum = ci - cgs.clientinfo;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+43024
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 788
DIVI4
ASGNI4
line 582
;581:
;582:	if (clientNum < 0 || clientNum >= MAX_CLIENTS)
ADDRLP4 1096
INDIRI4
CNSTI4 0
LTI4 $356
ADDRLP4 1096
INDIRI4
CNSTI4 32
LTI4 $354
LABELV $356
line 583
;583:	{
line 584
;584:		clientNum = -1;
ADDRLP4 1096
CNSTI4 -1
ASGNI4
line 585
;585:	}
LABELV $354
line 587
;586:
;587:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 611
;588:
;589:	/*
;590:	if (ci->team == TEAM_SPECTATOR)
;591:	{
;592:		// reset any existing players and bodies, because they might be in bad
;593:		// frames for this new model
;594:		clientNum = ci - cgs.clientinfo;
;595:		for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
;596:			if ( cg_entities[i].currentState.clientNum == clientNum
;597:				&& cg_entities[i].currentState.eType == ET_PLAYER ) {
;598:				CG_ResetPlayerEntity( &cg_entities[i] );
;599:			}
;600:		}
;601:
;602:		if (ci->ghoul2Model && trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
;603:		{
;604:			trap_G2API_CleanGhoul2Models(&ci->ghoul2Model);
;605:		}
;606:
;607:		return;
;608:	}
;609:	*/
;610:
;611:	teamname[0] = 0;
ADDRLP4 1108
CNSTI1 0
ASGNI1
line 612
;612:	if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $357
line 613
;613:		if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $360
line 614
;614:			Q_strncpyz(teamname, cg_blueTeamName.string, sizeof(teamname) );
ADDRLP4 1108
ARGP4
ADDRGP4 cg_blueTeamName+16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 615
;615:		} else {
ADDRGP4 $361
JUMPV
LABELV $360
line 616
;616:			Q_strncpyz(teamname, cg_redTeamName.string, sizeof(teamname) );
ADDRLP4 1108
ARGP4
ADDRGP4 cg_redTeamName+16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 617
;617:		}
LABELV $361
line 618
;618:	}
LABELV $357
line 619
;619:	if( teamname[0] ) {
ADDRLP4 1108
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $364
line 620
;620:		strcat( teamname, "/" );
ADDRLP4 1108
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 621
;621:	}
LABELV $364
line 622
;622:	modelloaded = qtrue;
ADDRLP4 1104
CNSTI4 1
ASGNI4
line 623
;623:	if ( !CG_RegisterClientModelname( ci, ci->modelName, ci->skinName, teamname, clientNum ) ) {
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 1192
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1196
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
NEI4 $367
line 629
;624:		//CG_Error( "CG_RegisterClientModelname( %s, %s, %s, %s %s ) failed", ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname );
;625:		//rww - DO NOT error out here! Someone could just type in a nonsense model name and crash everyone's client.
;626:		//Give it a chance to load default model for this client instead.
;627:
;628:		// fall back to default team name
;629:		if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $369
line 631
;630:			// keep skin name
;631:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $372
line 632
;632:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 1108
ARGP4
ADDRGP4 $374
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 633
;633:			} else {
ADDRGP4 $373
JUMPV
LABELV $372
line 634
;634:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 1108
ARGP4
ADDRGP4 $375
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 635
;635:			}
LABELV $373
line 636
;636:			if ( !CG_RegisterClientModelname( ci, DEFAULT_TEAM_MODEL, ci->skinName, teamname, -1 ) ) {
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
ADDRLP4 1200
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 1108
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 1204
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $370
line 637
;637:				CG_Error( "DEFAULT_TEAM_MODEL / skin (%s/%s) failed to register", DEFAULT_TEAM_MODEL, ci->skinName );
ADDRGP4 $378
ARGP4
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 638
;638:			}
line 639
;639:		} else {
ADDRGP4 $370
JUMPV
LABELV $369
line 640
;640:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, "default", teamname, -1 ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 1108
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 1200
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $379
line 641
;641:				CG_Error( "DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL );
ADDRGP4 $381
ARGP4
ADDRGP4 $160
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 642
;642:			}
LABELV $379
line 643
;643:		}
LABELV $370
line 644
;644:		modelloaded = qfalse;
ADDRLP4 1104
CNSTI4 0
ASGNI4
line 645
;645:	}
LABELV $367
line 647
;646:
;647:	if (clientNum != -1 && ci->ghoul2Model && trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
ADDRLP4 1096
INDIRI4
CNSTI4 -1
EQI4 $382
ADDRLP4 1200
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $382
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1204
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
EQI4 $382
line 648
;648:	{
line 649
;649:		if (cg_entities[clientNum].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[clientNum].ghoul2))
ADDRLP4 1208
CNSTI4 1920
ADDRLP4 1096
INDIRI4
MULI4
ASGNI4
ADDRLP4 1208
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $384
ADDRLP4 1208
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $384
line 650
;650:		{
line 651
;651:			trap_G2API_CleanGhoul2Models(&cg_entities[clientNum].ghoul2);
CNSTI4 1920
ADDRLP4 1096
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 652
;652:		}
LABELV $384
line 653
;653:		trap_G2API_DuplicateGhoul2Instance(ci->ghoul2Model, &cg_entities[clientNum].ghoul2);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 1920
ADDRLP4 1096
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 654
;654:	}
LABELV $382
line 656
;655:
;656:	ci->newAnims = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 0
ASGNI4
line 657
;657:	if ( ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
EQI4 $390
line 660
;658:		orientation_t tag;
;659:		// if the torso model has the "tag_flag"
;660:		if ( trap_R_LerpTag( &tag, ci->torsoModel, 0, 0, 1, "tag_flag" ) ) {
ADDRLP4 1208
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
ARGI4
ADDRLP4 1256
CNSTI4 0
ASGNI4
ADDRLP4 1256
INDIRI4
ARGI4
ADDRLP4 1256
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 $394
ARGP4
ADDRLP4 1260
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 1260
INDIRI4
CNSTI4 0
EQI4 $392
line 661
;661:			ci->newAnims = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 1
ASGNI4
line 662
;662:		}
LABELV $392
line 663
;663:	}
LABELV $390
line 666
;664:
;665:	// sounds
;666:	dir = ci->modelName;
ADDRLP4 1172
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
line 667
;667:	fallback = DEFAULT_MALE_SOUNDPATH; //(cgs.gametype >= GT_TEAM) ? DEFAULT_TEAM_MODEL : DEFAULT_MODEL;
ADDRLP4 1180
ADDRGP4 $395
ASGNP4
line 669
;668:
;669:	if ( !ci->skinName || !Q_stricmp( "default", ci->skinName ) )
ADDRLP4 1208
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 1208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $398
ADDRGP4 $213
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
NEI4 $396
LABELV $398
line 670
;670:	{//try default sounds.cfg first
line 671
;671:		fLen = trap_FS_FOpenFile(va("models/players/%s/sounds.cfg", dir), &f, FS_READ);
ADDRGP4 $399
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1220
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1184
ADDRLP4 1220
INDIRI4
ASGNI4
line 672
;672:		if ( !f ) 
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $397
line 673
;673:		{//no?  Look for _default sounds.cfg
line 674
;674:			fLen = trap_FS_FOpenFile(va("models/players/%s/sounds_default.cfg", dir), &f, FS_READ);
ADDRGP4 $402
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1228
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1184
ADDRLP4 1228
INDIRI4
ASGNI4
line 675
;675:		}
line 676
;676:	}
ADDRGP4 $397
JUMPV
LABELV $396
line 678
;677:	else
;678:	{//use the .skin associated with this skin
line 679
;679:		fLen = trap_FS_FOpenFile(va("models/players/%s/sounds_%s.cfg", dir, ci->skinName), &f, FS_READ);
ADDRGP4 $403
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1220
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1184
ADDRLP4 1220
INDIRI4
ASGNI4
line 680
;680:		if ( !f ) 
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $404
line 681
;681:		{//fall back to default sounds
line 682
;682:			fLen = trap_FS_FOpenFile(va("models/players/%s/sounds.cfg", dir), &f, FS_READ);
ADDRGP4 $399
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1228
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1184
ADDRLP4 1228
INDIRI4
ASGNI4
line 683
;683:		}
LABELV $404
line 684
;684:	}
LABELV $397
line 686
;685:
;686:	soundpath[0] = 0;
ADDRLP4 1032
CNSTI1 0
ASGNI1
line 688
;687:
;688:	if (f)
ADDRLP4 1176
INDIRI4
CNSTI4 0
EQI4 $406
line 689
;689:	{
line 690
;690:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 692
;691:
;692:		trap_FS_Read(soundpath, fLen, f);
ADDRLP4 1032
ARGP4
ADDRLP4 1184
INDIRI4
ARGI4
ADDRLP4 1176
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 694
;693:
;694:		i = fLen;
ADDRLP4 0
ADDRLP4 1184
INDIRI4
ASGNI4
ADDRGP4 $409
JUMPV
LABELV $408
line 697
;695:
;696:		while (i >= 0 && soundpath[i] != '\n')
;697:		{
line 698
;698:			if (soundpath[i] == 'f')
ADDRLP4 0
INDIRI4
ADDRLP4 1032
ADDP4
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $411
line 699
;699:			{
line 700
;700:				isFemale = qtrue;
ADDRLP4 1100
CNSTI4 1
ASGNI4
line 701
;701:			}
LABELV $411
line 703
;702:
;703:			i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 704
;704:		}
LABELV $409
line 696
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $413
ADDRLP4 0
INDIRI4
ADDRLP4 1032
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $408
LABELV $413
line 706
;705:
;706:		soundpath[i-1] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 1032-1
ADDP4
CNSTI1 0
ASGNI1
line 708
;707:
;708:		trap_FS_FCloseFile(f);
ADDRLP4 1176
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 709
;709:	}
LABELV $406
line 711
;710:
;711:	if (isFemale)
ADDRLP4 1100
INDIRI4
CNSTI4 0
EQI4 $415
line 712
;712:	{
line 713
;713:		ci->gender = GENDER_FEMALE;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 1
ASGNI4
line 714
;714:	}
ADDRGP4 $416
JUMPV
LABELV $415
line 716
;715:	else
;716:	{
line 717
;717:		ci->gender = GENDER_MALE;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 718
;718:	}
LABELV $416
line 720
;719:
;720:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $417
line 721
;721:		s = cg_customSoundNames[i];
ADDRLP4 1028
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 722
;722:		if ( !s ) {
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
line 723
;723:			break;
ADDRGP4 $419
JUMPV
LABELV $421
line 726
;724:		}
;725:
;726:		Com_sprintf(soundName, sizeof(soundName), "%s", s+1);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $423
ARGP4
ADDRLP4 1028
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 727
;727:		COM_StripExtension(soundName, soundName);
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 732
;728:		//strip the extension because we might want .mp3's
;729:
;730:		//ci->sounds[i] = 0;
;731:		// if the model didn't load use the sounds of the default model
;732:		if (soundpath[0])
ADDRLP4 1032
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $424
line 733
;733:		{
line 734
;734:			ci->sounds[i] = trap_S_RegisterSound( va("sound/%s/%s", soundpath, soundName) );
ADDRGP4 $426
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 736
;735:
;736:			if (!ci->sounds[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $425
line 737
;737:			{
line 738
;738:				if (isFemale)
ADDRLP4 1100
INDIRI4
CNSTI4 0
EQI4 $429
line 739
;739:				{
line 740
;740:					ci->sounds[i] = trap_S_RegisterSound( va("sound/%s/%s", DEFAULT_FEMALE_SOUNDPATH, soundName) );
ADDRGP4 $426
ARGP4
ADDRGP4 $431
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 1228
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1228
INDIRI4
ASGNI4
line 741
;741:				}
ADDRGP4 $425
JUMPV
LABELV $429
line 743
;742:				else
;743:				{
line 744
;744:					ci->sounds[i] = trap_S_RegisterSound( va("sound/%s/%s", DEFAULT_MALE_SOUNDPATH, soundName) );
ADDRGP4 $426
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 1228
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1228
INDIRI4
ASGNI4
line 745
;745:				}
line 746
;746:			}
line 747
;747:		}
ADDRGP4 $425
JUMPV
LABELV $424
line 749
;748:		else
;749:		{
line 750
;750:			if (modelloaded)
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $432
line 751
;751:			{
line 752
;752:				ci->sounds[i] = trap_S_RegisterSound( va("sound/chars/%s/misc/%s", dir, soundName) );
ADDRGP4 $434
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 753
;753:			}
LABELV $432
line 755
;754:
;755:			if ( !ci->sounds[i] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $435
line 756
;756:			{
line 757
;757:				ci->sounds[i] = trap_S_RegisterSound( va("sound/%s/%s", fallback, soundName) );
ADDRGP4 $426
ARGP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 758
;758:			}
LABELV $435
line 759
;759:		}
LABELV $425
line 760
;760:	}
LABELV $418
line 720
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $417
LABELV $419
line 762
;761:
;762:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 766
;763:
;764:	// reset any existing players and bodies, because they might be in bad
;765:	// frames for this new model
;766:	clientNum = ci - cgs.clientinfo;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+43024
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 788
DIVI4
ASGNI4
line 767
;767:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $438
line 768
;768:		if ( cg_entities[i].currentState.clientNum == clientNum
ADDRLP4 1216
CNSTI4 1920
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1216
INDIRI4
ADDRGP4 cg_entities+220
ADDP4
INDIRI4
ADDRLP4 1096
INDIRI4
NEI4 $442
ADDRLP4 1216
INDIRI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $442
line 769
;769:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
line 770
;770:			CG_ResetPlayerEntity( &cg_entities[i] );
CNSTI4 1920
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 771
;771:		}
LABELV $442
line 772
;772:	}
LABELV $439
line 767
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $438
line 773
;773:}
LABELV $352
endproc CG_LoadClientInfo 1264 24
proc CG_CopyClientInfoModel 76 12
line 783
;774:
;775:
;776:
;777:
;778:/*
;779:======================
;780:CG_CopyClientInfoModel
;781:======================
;782:*/
;783:static void CG_CopyClientInfoModel( clientInfo_t *from, clientInfo_t *to ) {
line 784
;784:	VectorCopy( from->headOffset, to->headOffset );
ADDRLP4 0
CNSTI4 464
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 785
;785:	to->footsteps = from->footsteps;
ADDRLP4 4
CNSTI4 476
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 786
;786:	to->gender = from->gender;
ADDRLP4 8
CNSTI4 480
ASGNI4
ADDRFP4 4
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
line 788
;787:
;788:	to->legsModel = from->legsModel;
ADDRLP4 12
CNSTI4 484
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 789
;789:	to->legsSkin = from->legsSkin;
ADDRLP4 16
CNSTI4 488
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 790
;790:	to->torsoModel = from->torsoModel;
ADDRLP4 20
CNSTI4 492
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 791
;791:	to->torsoSkin = from->torsoSkin;
ADDRLP4 24
CNSTI4 496
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 794
;792:	//to->headModel = from->headModel;
;793:	//to->headSkin = from->headSkin;
;794:	to->modelIcon = from->modelIcon;
ADDRLP4 28
CNSTI4 508
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 796
;795:
;796:	to->newAnims = from->newAnims;
ADDRLP4 32
CNSTI4 452
ASGNI4
ADDRFP4 4
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
ASGNI4
line 800
;797:
;798:	//to->ghoul2Model = from->ghoul2Model;
;799:	//rww - Trying to use the same ghoul2 pointer for two seperate clients == DISASTER
;800:	if (to->ghoul2Model && trap_G2_HaveWeGhoul2Models(to->ghoul2Model))
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $447
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $447
line 801
;801:	{
line 802
;802:		trap_G2API_CleanGhoul2Models(&to->ghoul2Model);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 803
;803:	}
LABELV $447
line 804
;804:	if (from->ghoul2Model && trap_G2_HaveWeGhoul2Models(from->ghoul2Model))
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $449
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $449
line 805
;805:	{
line 806
;806:		trap_G2API_DuplicateGhoul2Instance(from->ghoul2Model, &to->ghoul2Model);
ADDRLP4 52
CNSTI4 504
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 807
;807:	}
LABELV $449
line 809
;808:
;809:	to->bolt_head = from->bolt_head;
ADDRLP4 52
CNSTI4 520
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 810
;810:	to->bolt_lhand = from->bolt_lhand;
ADDRLP4 56
CNSTI4 516
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 811
;811:	to->bolt_rhand = from->bolt_rhand;
ADDRLP4 60
CNSTI4 512
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 812
;812:	to->bolt_motion = from->bolt_motion;
ADDRLP4 64
CNSTI4 524
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 813
;813:	to->bolt_llumbar = from->bolt_llumbar;
ADDRLP4 68
CNSTI4 528
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 817
;814:
;815://	to->ATST = from->ATST;
;816:
;817:	memcpy( to->sounds, from->sounds, sizeof( to->sounds ) );
ADDRLP4 72
CNSTI4 652
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 818
;818:}
LABELV $446
endproc CG_CopyClientInfoModel 76 12
proc CG_ScanForExistingClientInfo 128 12
line 825
;819:
;820:/*
;821:======================
;822:CG_ScanForExistingClientInfo
;823:======================
;824:*/
;825:static qboolean CG_ScanForExistingClientInfo( clientInfo_t *ci, int clientNum ) {
line 829
;826:	int		i;
;827:	clientInfo_t	*match;
;828:
;829:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $455
JUMPV
LABELV $452
line 830
;830:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 831
;831:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $458
line 832
;832:			continue;
ADDRGP4 $453
JUMPV
LABELV $458
line 834
;833:		}
;834:		if ( match->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $460
line 835
;835:			continue;
ADDRGP4 $453
JUMPV
LABELV $460
line 837
;836:		}
;837:		if ( !Q_stricmp( ci->modelName, match->modelName )
ADDRLP4 8
CNSTI4 160
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $462
ADDRLP4 16
CNSTI4 224
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $462
ADDRLP4 24
CNSTI4 384
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $462
ADDRLP4 32
CNSTI4 352
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $462
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $465
ADDRLP4 40
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
NEI4 $462
LABELV $465
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $462
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $462
line 846
;838:			&& !Q_stricmp( ci->skinName, match->skinName )
;839://			&& !Q_stricmp( ci->headModelName, match->headModelName )
;840://			&& !Q_stricmp( ci->headSkinName, match->headSkinName ) 
;841:			&& !Q_stricmp( ci->blueTeam, match->blueTeam ) 
;842:			&& !Q_stricmp( ci->redTeam, match->redTeam )
;843:			&& (cgs.gametype < GT_TEAM || ci->team == match->team) 
;844:			&& match->ghoul2Model
;845:			&& match->bolt_head) //if the bolts haven't been initialized, this "match" is useless to us
;846:		{
line 849
;847:			// this clientinfo is identical, so use it's handles
;848:
;849:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 855
;850:
;851:			//rww - Filthy hack. If this is actually the info already belonging to us, just reassign the pointer.
;852:			//Switching instances when not necessary produces small animation glitches.
;853:			//Actually, before, were we even freeing the instance attached to the old clientinfo before copying
;854:			//this new clientinfo over it? Could be a nasty leak possibility. (though this should remedy it in theory)
;855:			if (clientNum == i)
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $466
line 856
;856:			{
line 857
;857:				if (match->ghoul2Model && trap_G2_HaveWeGhoul2Models(match->ghoul2Model))
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $467
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $467
line 858
;858:				{ //The match has a valid instance (if it didn't, we'd probably already be fudged (^_^) at this state)
line 859
;859:					if (ci->ghoul2Model && trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $470
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $470
line 860
;860:					{ //First kill the copy we have if we have one. (but it should be null)
line 861
;861:						trap_G2API_CleanGhoul2Models(&ci->ghoul2Model);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 862
;862:					}
LABELV $470
line 864
;863:
;864:					VectorCopy( match->headOffset, ci->headOffset );
ADDRLP4 64
CNSTI4 464
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 865
;865:					ci->footsteps = match->footsteps;
ADDRLP4 68
CNSTI4 476
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 866
;866:					ci->gender = match->gender;
ADDRLP4 72
CNSTI4 480
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 868
;867:
;868:					ci->legsModel = match->legsModel;
ADDRLP4 76
CNSTI4 484
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 869
;869:					ci->legsSkin = match->legsSkin;
ADDRLP4 80
CNSTI4 488
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 870
;870:					ci->torsoModel = match->torsoModel;
ADDRLP4 84
CNSTI4 492
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 871
;871:					ci->torsoSkin = match->torsoSkin;
ADDRLP4 88
CNSTI4 496
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 872
;872:					ci->modelIcon = match->modelIcon;
ADDRLP4 92
CNSTI4 508
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 874
;873:
;874:					ci->newAnims = match->newAnims;
ADDRLP4 96
CNSTI4 452
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 876
;875:
;876:					ci->bolt_head = match->bolt_head;
ADDRLP4 100
CNSTI4 520
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 877
;877:					ci->bolt_lhand = match->bolt_lhand;
ADDRLP4 104
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 878
;878:					ci->bolt_rhand = match->bolt_rhand;
ADDRLP4 108
CNSTI4 512
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 879
;879:					ci->bolt_motion = match->bolt_motion;
ADDRLP4 112
CNSTI4 524
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 880
;880:					ci->bolt_llumbar = match->bolt_llumbar;
ADDRLP4 116
CNSTI4 528
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 882
;881:
;882:					memcpy( ci->sounds, match->sounds, sizeof( ci->sounds ) );
ADDRLP4 120
CNSTI4 652
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 887
;883:
;884:					//We can share this pointer, because it already belongs to this client.
;885:					//The pointer itself and the ghoul2 instance is never actually changed, just passed between
;886:					//clientinfo structures.
;887:					ci->ghoul2Model = match->ghoul2Model;
ADDRLP4 124
CNSTI4 504
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 888
;888:				}
line 889
;889:			}
ADDRGP4 $467
JUMPV
LABELV $466
line 891
;890:			else
;891:			{
line 892
;892:				CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 893
;893:			}
LABELV $467
line 895
;894:
;895:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $451
JUMPV
LABELV $462
line 897
;896:		}
;897:	}
LABELV $453
line 829
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $455
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $452
line 900
;898:
;899:	// nothing matches, so defer the load
;900:	return qfalse;
CNSTI4 0
RETI4
LABELV $451
endproc CG_ScanForExistingClientInfo 128 12
proc CG_SetDeferredClientInfo 36 8
line 911
;901:}
;902:
;903:/*
;904:======================
;905:CG_SetDeferredClientInfo
;906:
;907:We aren't going to load it now, so grab some other
;908:client's info to use until we have some spare time.
;909:======================
;910:*/
;911:static void CG_SetDeferredClientInfo( clientInfo_t *ci ) {
line 917
;912:	int		i;
;913:	clientInfo_t	*match;
;914:
;915:	// if someone else is already the same models and skins we
;916:	// can just load the client info
;917:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $476
JUMPV
LABELV $473
line 918
;918:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 919
;919:		if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $481
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $479
LABELV $481
line 920
;920:			continue;
ADDRGP4 $474
JUMPV
LABELV $479
line 922
;921:		}
;922:		if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 224
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $486
ADDRLP4 24
CNSTI4 160
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $486
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $482
ADDRLP4 32
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $482
LABELV $486
line 926
;923:			 Q_stricmp( ci->modelName, match->modelName ) ||
;924://			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;925://			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;926:			 (cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 927
;927:			continue;
ADDRGP4 $474
JUMPV
LABELV $482
line 930
;928:		}
;929:		// just load the real info cause it uses the same models and skins
;930:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 931
;931:		return;
ADDRGP4 $472
JUMPV
LABELV $474
line 917
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $476
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $473
line 935
;932:	}
;933:
;934:	// if we are in teamplay, only grab a model if the skin is correct
;935:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $487
line 936
;936:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $493
JUMPV
LABELV $490
line 937
;937:			match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 938
;938:			if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $498
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $496
LABELV $498
line 939
;939:				continue;
ADDRGP4 $491
JUMPV
LABELV $496
line 941
;940:			}
;941:			if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 224
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $502
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $499
ADDRLP4 24
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
EQI4 $499
LABELV $502
line 942
;942:				(cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 943
;943:				continue;
ADDRGP4 $491
JUMPV
LABELV $499
line 945
;944:			}
;945:			ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 1
ASGNI4
line 946
;946:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 947
;947:			return;
ADDRGP4 $472
JUMPV
LABELV $491
line 936
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $493
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $490
line 953
;948:		}
;949:		// load the full model, because we don't ever want to show
;950:		// an improper team skin.  This will cause a hitch for the first
;951:		// player, when the second enters.  Combat shouldn't be going on
;952:		// yet, so it shouldn't matter
;953:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 954
;954:		return;
ADDRGP4 $472
JUMPV
LABELV $487
line 958
;955:	}
;956:
;957:	// find the first valid clientinfo and grab its stuff
;958:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $506
JUMPV
LABELV $503
line 959
;959:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 960
;960:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $509
line 961
;961:			continue;
ADDRGP4 $504
JUMPV
LABELV $509
line 964
;962:		}
;963:
;964:		ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 1
ASGNI4
line 965
;965:		CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 966
;966:		return;
ADDRGP4 $472
JUMPV
LABELV $504
line 958
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $506
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $503
line 970
;967:	}
;968:
;969:	// we should never get here...
;970:	CG_Printf( "CG_SetDeferredClientInfo: no valid clients!\n" );
ADDRGP4 $511
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 972
;971:
;972:	CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 973
;973:}
LABELV $472
endproc CG_SetDeferredClientInfo 36 8
export CG_NewClientInfo
proc CG_NewClientInfo 980 40
line 980
;974:
;975:/*
;976:======================
;977:CG_NewClientInfo
;978:======================
;979:*/
;980:void CG_NewClientInfo( int clientNum, qboolean entitiesInitialized ) {
line 987
;981:	clientInfo_t *ci;
;982:	clientInfo_t newInfo;
;983:	const char	*configstring;
;984:	const char	*v;
;985:	char		*slash;
;986:	void *oldGhoul2;
;987:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 988
;988:	qboolean wasATST = qfalse;
ADDRLP4 804
CNSTI4 0
ASGNI4
line 990
;989:
;990:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 800
CNSTI4 788
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 992
;991:
;992:	oldGhoul2 = ci->ghoul2Model;
ADDRLP4 812
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
line 994
;993:
;994:	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 816
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 796
ADDRLP4 816
INDIRP4
ASGNP4
line 995
;995:	if ( !configstring[0] ) {
ADDRLP4 796
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $514
line 996
;996:		memset( ci, 0, sizeof( *ci ) );
ADDRLP4 800
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ARGI4
ADDRGP4 memset
CALLP4
pop
line 997
;997:		return;		// player just left
ADDRGP4 $512
JUMPV
LABELV $514
line 1000
;998:	}
;999:
;1000:	if (ci)
ADDRLP4 800
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $516
line 1001
;1001:	{
line 1002
;1002:		wasATST = ci->ATST;
ADDRLP4 804
ADDRLP4 800
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ASGNI4
line 1003
;1003:	}
LABELV $516
line 1007
;1004:
;1005:	// build into a temp buffer so the defer checks can use
;1006:	// the old value
;1007:	memset( &newInfo, 0, sizeof( newInfo ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1010
;1008:
;1009:	// isolate the player's name
;1010:	v = Info_ValueForKey(configstring, "n");
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $518
ARGP4
ADDRLP4 820
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 820
INDIRP4
ASGNP4
line 1011
;1011:	Q_strncpyz( newInfo.name, v, sizeof( newInfo.name ) );
ADDRLP4 4+4
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1014
;1012:
;1013:	// colors
;1014:	v = Info_ValueForKey( configstring, "c1" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $521
ARGP4
ADDRLP4 824
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 824
INDIRP4
ASGNP4
line 1015
;1015:	CG_ColorFromString( v, newInfo.color1 );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 4+80
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 1017
;1016:
;1017:	newInfo.icolor1 = atoi(v);
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 828
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+104
ADDRLP4 828
INDIRI4
ASGNI4
line 1019
;1018:
;1019:	v = Info_ValueForKey( configstring, "c2" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 832
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 832
INDIRP4
ASGNP4
line 1020
;1020:	CG_ColorFromString( v, newInfo.color2 );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 4+92
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 1023
;1021:
;1022:	// bot skill
;1023:	v = Info_ValueForKey( configstring, "skill" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $526
ARGP4
ADDRLP4 836
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 836
INDIRP4
ASGNP4
line 1024
;1024:	newInfo.botSkill = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 840
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+72
ADDRLP4 840
INDIRI4
ASGNI4
line 1027
;1025:
;1026:	// handicap
;1027:	v = Info_ValueForKey( configstring, "hc" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $528
ARGP4
ADDRLP4 844
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 844
INDIRP4
ASGNP4
line 1028
;1028:	newInfo.handicap = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 848
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+128
ADDRLP4 848
INDIRI4
ASGNI4
line 1031
;1029:
;1030:	// wins
;1031:	v = Info_ValueForKey( configstring, "w" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $530
ARGP4
ADDRLP4 852
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 852
INDIRP4
ASGNP4
line 1032
;1032:	newInfo.wins = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 856
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+132
ADDRLP4 856
INDIRI4
ASGNI4
line 1035
;1033:
;1034:	// losses
;1035:	v = Info_ValueForKey( configstring, "l" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $532
ARGP4
ADDRLP4 860
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 860
INDIRP4
ASGNP4
line 1036
;1036:	newInfo.losses = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 864
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+136
ADDRLP4 864
INDIRI4
ASGNI4
line 1039
;1037:
;1038:	// team
;1039:	v = Info_ValueForKey( configstring, "t" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 868
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 868
INDIRP4
ASGNP4
line 1040
;1040:	newInfo.team = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 872
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+68
ADDRLP4 872
INDIRI4
ASGNI4
line 1043
;1041:
;1042:	// team task
;1043:	v = Info_ValueForKey( configstring, "tt" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $536
ARGP4
ADDRLP4 876
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 876
INDIRP4
ASGNP4
line 1044
;1044:	newInfo.teamTask = atoi(v);
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 880
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+140
ADDRLP4 880
INDIRI4
ASGNI4
line 1047
;1045:
;1046:	// team leader
;1047:	v = Info_ValueForKey( configstring, "tl" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 884
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 884
INDIRP4
ASGNP4
line 1048
;1048:	newInfo.teamLeader = atoi(v);
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 888
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+144
ADDRLP4 888
INDIRI4
ASGNI4
line 1050
;1049:
;1050:	v = Info_ValueForKey( configstring, "g_redteam" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $540
ARGP4
ADDRLP4 892
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 892
INDIRP4
ASGNP4
line 1051
;1051:	Q_strncpyz(newInfo.redTeam, v, MAX_TEAMNAME);
ADDRLP4 4+352
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1053
;1052:
;1053:	v = Info_ValueForKey( configstring, "g_blueteam" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $542
ARGP4
ADDRLP4 896
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 896
INDIRP4
ASGNP4
line 1054
;1054:	Q_strncpyz(newInfo.blueTeam, v, MAX_TEAMNAME);
ADDRLP4 4+384
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1057
;1055:
;1056:	// model
;1057:	v = Info_ValueForKey( configstring, "model" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 900
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 900
INDIRP4
ASGNP4
line 1058
;1058:	if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $545
line 1064
;1059:		// forcemodel makes everyone use a single model
;1060:		// to prevent load hitches
;1061:		char modelStr[MAX_QPATH];
;1062:		char *skin;
;1063:
;1064:		if( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $548
line 1065
;1065:			Q_strncpyz( newInfo.modelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.modelName ) );
ADDRLP4 4+160
ARGP4
ADDRGP4 $160
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1066
;1066:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRGP4 $213
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1067
;1067:		} else {
ADDRGP4 $549
JUMPV
LABELV $548
line 1068
;1068:			trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $544
ARGP4
ADDRLP4 904
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1069
;1069:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
ADDRLP4 904
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 972
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 968
ADDRLP4 972
INDIRP4
ASGNP4
ADDRLP4 972
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $555
line 1070
;1070:				skin = "default";
ADDRLP4 968
ADDRGP4 $213
ASGNP4
line 1071
;1071:			} else {
ADDRGP4 $556
JUMPV
LABELV $555
line 1072
;1072:				*skin++ = 0;
ADDRLP4 976
ADDRLP4 968
INDIRP4
ASGNP4
ADDRLP4 968
ADDRLP4 976
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 976
INDIRP4
CNSTI1 0
ASGNI1
line 1073
;1073:			}
LABELV $556
line 1075
;1074:
;1075:			Q_strncpyz( newInfo.skinName, skin, sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1076
;1076:			Q_strncpyz( newInfo.modelName, modelStr, sizeof( newInfo.modelName ) );
ADDRLP4 4+160
ARGP4
ADDRLP4 904
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1077
;1077:		}
LABELV $549
line 1079
;1078:
;1079:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $546
line 1081
;1080:			// keep skin name
;1081:			slash = strchr( v, '/' );
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 972
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 808
ADDRLP4 972
INDIRP4
ASGNP4
line 1082
;1082:			if ( slash ) {
ADDRLP4 808
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $546
line 1083
;1083:				Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRLP4 808
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1084
;1084:			}
line 1085
;1085:		}
line 1086
;1086:	} else {
ADDRGP4 $546
JUMPV
LABELV $545
line 1087
;1087:		Q_strncpyz( newInfo.modelName, v, sizeof( newInfo.modelName ) );
ADDRLP4 4+160
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1089
;1088:
;1089:		slash = strchr( newInfo.modelName, '/' );
ADDRLP4 4+160
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 904
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 808
ADDRLP4 904
INDIRP4
ASGNP4
line 1090
;1090:		if ( !slash ) {
ADDRLP4 808
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $571
line 1092
;1091:			// modelName didn not include a skin name
;1092:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRGP4 $213
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1093
;1093:		} else {
ADDRGP4 $572
JUMPV
LABELV $571
line 1094
;1094:			Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRLP4 808
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1096
;1095:			// truncate modelName
;1096:			*slash = 0;
ADDRLP4 808
INDIRP4
CNSTI1 0
ASGNI1
line 1097
;1097:		}
LABELV $572
line 1098
;1098:	}
LABELV $546
line 1146
;1099:
;1100:	// head model
;1101:/*
;1102:	v = Info_ValueForKey( configstring, "hmodel" );
;1103:	if ( cg_forceModel.integer ) {
;1104:		// forcemodel makes everyone use a single model
;1105:		// to prevent load hitches
;1106:		char modelStr[MAX_QPATH];
;1107:		char *skin;
;1108:
;1109:		if( cgs.gametype >= GT_TEAM ) {
;1110:			Q_strncpyz( newInfo.headModelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.headModelName ) );
;1111:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
;1112:		} else {
;1113:			trap_Cvar_VariableStringBuffer( "headmodel", modelStr, sizeof( modelStr ) );
;1114:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
;1115:				skin = "default";
;1116:			} else {
;1117:				*skin++ = 0;
;1118:			}
;1119:
;1120:			Q_strncpyz( newInfo.headSkinName, skin, sizeof( newInfo.headSkinName ) );
;1121:			Q_strncpyz( newInfo.headModelName, modelStr, sizeof( newInfo.headModelName ) );
;1122:		}
;1123:
;1124:		if ( cgs.gametype >= GT_TEAM ) {
;1125:			// keep skin name
;1126:			slash = strchr( v, '/' );
;1127:			if ( slash ) {
;1128:				Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
;1129:			}
;1130:		}
;1131:	} else {
;1132:		Q_strncpyz( newInfo.headModelName, v, sizeof( newInfo.headModelName ) );
;1133:
;1134:		slash = strchr( newInfo.headModelName, '/' );
;1135:		if ( !slash ) {
;1136:			// modelName didn not include a skin name
;1137:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
;1138:		} else {
;1139:			Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
;1140:			// truncate modelName
;1141:			*slash = 0;
;1142:		}
;1143:	}
;1144:*/
;1145:	// force powers
;1146:	v = Info_ValueForKey( configstring, "forcepowers" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $577
ARGP4
ADDRLP4 904
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 904
INDIRP4
ASGNP4
line 1147
;1147:	Q_strncpyz( newInfo.forcePowers, v, sizeof( newInfo.forcePowers ) );
ADDRLP4 4+288
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1149
;1148:
;1149:	newInfo.ATST = wasATST;
ADDRLP4 4+500
ADDRLP4 804
INDIRI4
ASGNI4
line 1151
;1150:
;1151:	if (cgs.gametype >= GT_TEAM	&& !cgs.jediVmerc )
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $581
ADDRGP4 cgs+32996
INDIRI4
CNSTI4 0
NEI4 $581
line 1152
;1152:	{
line 1153
;1153:		if (newInfo.team == TEAM_RED)
ADDRLP4 4+68
INDIRI4
CNSTI4 1
NEI4 $585
line 1154
;1154:		{
line 1155
;1155:			strcpy(newInfo.skinName, "red");
ADDRLP4 4+224
ARGP4
ADDRGP4 $176
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1157
;1156://			strcpy(newInfo.headSkinName, "red");
;1157:		}
LABELV $585
line 1158
;1158:		if (newInfo.team == TEAM_BLUE)
ADDRLP4 4+68
INDIRI4
CNSTI4 2
NEI4 $589
line 1159
;1159:		{
line 1160
;1160:			strcpy(newInfo.skinName, "blue");
ADDRLP4 4+224
ARGP4
ADDRGP4 $177
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1162
;1161://			strcpy(newInfo.headSkinName, "blue");
;1162:		}
LABELV $589
line 1163
;1163:	}
LABELV $581
line 1167
;1164:
;1165:	// scan for an existing clientinfo that matches this modelname
;1166:	// so we can avoid loading checks if possible
;1167:	if ( !CG_ScanForExistingClientInfo( &newInfo, clientNum ) ) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 908
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 908
INDIRI4
CNSTI4 0
NEI4 $593
line 1170
;1168:		qboolean	forceDefer;
;1169:
;1170:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 920
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 920
INDIRI4
CNSTI4 4000000
GEI4 $596
ADDRLP4 916
CNSTI4 1
ASGNI4
ADDRGP4 $597
JUMPV
LABELV $596
ADDRLP4 916
CNSTI4 0
ASGNI4
LABELV $597
ADDRLP4 912
ADDRLP4 916
INDIRI4
ASGNI4
line 1173
;1171:
;1172:		// if we are defering loads, just have it pick the first valid
;1173:		if (cg.snap && cg.snap->ps.clientNum == clientNum && !forceDefer)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $598
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $598
ADDRLP4 912
INDIRI4
CNSTI4 0
NEI4 $598
line 1174
;1174:		{ //rww - don't defer your own client info ever, unless really low on memory
line 1175
;1175:			CG_LoadClientInfo( &newInfo );
ADDRLP4 4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1176
;1176:		}
ADDRGP4 $599
JUMPV
LABELV $598
line 1177
;1177:		else if ( forceDefer || ( cg_deferPlayers.integer && !cg_buildScript.integer && !cg.loading ) ) {
ADDRLP4 924
CNSTI4 0
ASGNI4
ADDRLP4 912
INDIRI4
ADDRLP4 924
INDIRI4
NEI4 $607
ADDRGP4 cg_deferPlayers+12
INDIRI4
ADDRLP4 924
INDIRI4
EQI4 $602
ADDRGP4 cg_buildScript+12
INDIRI4
ADDRLP4 924
INDIRI4
NEI4 $602
ADDRGP4 cg+20
INDIRI4
ADDRLP4 924
INDIRI4
NEI4 $602
LABELV $607
line 1179
;1178:			// keep whatever they had if it won't violate team skins
;1179:			CG_SetDeferredClientInfo( &newInfo );
ADDRLP4 4
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 1181
;1180:			// if we are low on memory, leave them with this model
;1181:			if ( forceDefer ) {
ADDRLP4 912
INDIRI4
CNSTI4 0
EQI4 $603
line 1182
;1182:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $610
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1183
;1183:				newInfo.deferred = qfalse;
ADDRLP4 4+448
CNSTI4 0
ASGNI4
line 1184
;1184:			}
line 1185
;1185:		} else {
ADDRGP4 $603
JUMPV
LABELV $602
line 1186
;1186:			CG_LoadClientInfo( &newInfo );
ADDRLP4 4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1187
;1187:		}
LABELV $603
LABELV $599
line 1188
;1188:	}
LABELV $593
line 1191
;1189:
;1190:	// replace whatever was there with the new one
;1191:	newInfo.infoValid = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1192
;1192:	if (ci->ghoul2Model &&
ADDRLP4 912
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 916
ADDRLP4 912
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 916
INDIRU4
CNSTU4 0
EQU4 $612
ADDRLP4 916
INDIRU4
ADDRLP4 4+504
INDIRP4
CVPU4 4
EQU4 $612
ADDRLP4 912
INDIRP4
ARGP4
ADDRLP4 920
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 920
INDIRI4
CNSTI4 0
EQI4 $612
line 1195
;1193:		ci->ghoul2Model != newInfo.ghoul2Model &&
;1194:		trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
;1195:	{ //We must kill this instance before we remove our only pointer to it from the cgame.
line 1197
;1196:	  //Otherwise we will end up with extra instances all over the place, I think.
;1197:		trap_G2API_CleanGhoul2Models(&ci->ghoul2Model);
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 1198
;1198:	}
LABELV $612
line 1199
;1199:	*ci = newInfo;
ADDRLP4 800
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 788
ADDRGP4 $616
JUMPV
LABELV $615
line 1203
;1200:
;1201:	//force a weapon change anyway, for all clients being rendered to the current client
;1202:	while (i < MAX_CLIENTS)
;1203:	{
line 1204
;1204:		cg_entities[i].ghoul2weapon = NULL;
CNSTI4 1920
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+960
ADDP4
CNSTP4 0
ASGNP4
line 1205
;1205:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1206
;1206:	}
LABELV $616
line 1202
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $615
line 1209
;1207:
;1208:	// Check if the ghoul2 model changed in any way.  This is safer than assuming we have a legal cent shile loading info.
;1209:	if (entitiesInitialized && ci->ghoul2Model && (oldGhoul2 != ci->ghoul2Model))
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $619
ADDRLP4 924
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 924
INDIRU4
CNSTU4 0
EQU4 $619
ADDRLP4 812
INDIRP4
CVPU4 4
ADDRLP4 924
INDIRU4
EQU4 $619
line 1210
;1210:	{	// Copy the new ghoul2 model to the centity.
line 1212
;1211:		animation_t *anim;
;1212:		centity_t *cent = &cg_entities[clientNum];
ADDRLP4 932
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1214
;1213:		
;1214:		anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.legsAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 928
CNSTI4 28
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 1216
;1215:
;1216:		if (anim)
ADDRLP4 928
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $622
line 1217
;1217:		{
line 1218
;1218:			int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 936
CNSTI4 72
ASGNI4
line 1219
;1219:			int firstFrame = anim->firstFrame;
ADDRLP4 944
ADDRLP4 928
INDIRP4
INDIRI4
ASGNI4
line 1220
;1220:			int setFrame = -1;
ADDRLP4 940
CNSTI4 -1
ASGNI4
line 1221
;1221:			float animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 948
CNSTF4 1112014848
ADDRLP4 928
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1223
;1222:
;1223:			if (anim->loopFrames != -1)
ADDRLP4 928
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $624
line 1224
;1224:			{
line 1225
;1225:				flags |= BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 936
ADDRLP4 936
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1226
;1226:			}
LABELV $624
line 1228
;1227:
;1228:			if (cent->pe.legs.frame >= anim->firstFrame && cent->pe.legs.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 952
ADDRLP4 932
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
ADDRLP4 960
ADDRLP4 928
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 952
INDIRI4
ADDRLP4 960
INDIRI4
LTI4 $626
ADDRLP4 952
INDIRI4
ADDRLP4 960
INDIRI4
ADDRLP4 928
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $626
line 1229
;1229:			{
line 1230
;1230:				setFrame = cent->pe.legs.frame;
ADDRLP4 940
ADDRLP4 932
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 1231
;1231:			}
LABELV $626
line 1234
;1232:
;1233:			//rww - Set the animation again because it just got reset due to the model change
;1234:			trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, setFrame, 150);
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 944
INDIRI4
ARGI4
ADDRLP4 928
INDIRP4
INDIRI4
ADDRLP4 928
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 936
INDIRI4
ARGI4
ADDRLP4 948
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 940
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1236
;1235:
;1236:			cg_entities[clientNum].currentState.legsAnim = 0;
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
CNSTI4 0
ASGNI4
line 1237
;1237:		}
LABELV $622
line 1239
;1238:
;1239:		anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.torsoAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 928
CNSTI4 28
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 1241
;1240:
;1241:		if (anim)
ADDRLP4 928
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $631
line 1242
;1242:		{
line 1243
;1243:			int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 936
CNSTI4 72
ASGNI4
line 1244
;1244:			int firstFrame = anim->firstFrame;
ADDRLP4 944
ADDRLP4 928
INDIRP4
INDIRI4
ASGNI4
line 1245
;1245:			int setFrame = -1;
ADDRLP4 940
CNSTI4 -1
ASGNI4
line 1246
;1246:			float animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 948
CNSTF4 1112014848
ADDRLP4 928
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1248
;1247:
;1248:			if (anim->loopFrames != -1)
ADDRLP4 928
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $633
line 1249
;1249:			{
line 1250
;1250:				flags |= BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 936
ADDRLP4 936
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1251
;1251:			}
LABELV $633
line 1253
;1252:
;1253:			if (cent->pe.torso.frame >= anim->firstFrame && cent->pe.torso.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 952
ADDRLP4 932
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
ADDRLP4 960
ADDRLP4 928
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 952
INDIRI4
ADDRLP4 960
INDIRI4
LTI4 $635
ADDRLP4 952
INDIRI4
ADDRLP4 960
INDIRI4
ADDRLP4 928
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $635
line 1254
;1254:			{
line 1255
;1255:				setFrame = cent->pe.torso.frame;
ADDRLP4 940
ADDRLP4 932
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 1256
;1256:			}
LABELV $635
line 1259
;1257:
;1258:			//rww - Set the animation again because it just got reset due to the model change
;1259:			trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "lower_lumbar", firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, setFrame, 150);
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 944
INDIRI4
ARGI4
ADDRLP4 928
INDIRP4
INDIRI4
ADDRLP4 928
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 936
INDIRI4
ARGI4
ADDRLP4 948
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 940
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1261
;1260:
;1261:			cg_entities[clientNum].currentState.torsoAnim = 0;
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
CNSTI4 0
ASGNI4
line 1262
;1262:		}
LABELV $631
line 1264
;1263:
;1264:		if (cg_entities[clientNum].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[clientNum].ghoul2))
ADDRLP4 936
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 936
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $639
ADDRLP4 936
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ARGP4
ADDRLP4 940
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 940
INDIRI4
CNSTI4 0
EQI4 $639
line 1265
;1265:		{
line 1266
;1266:			trap_G2API_CleanGhoul2Models(&cg_entities[clientNum].ghoul2);
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 1267
;1267:		}
LABELV $639
line 1268
;1268:		trap_G2API_DuplicateGhoul2Instance(ci->ghoul2Model, &cg_entities[clientNum].ghoul2);
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 1269
;1269:	}
LABELV $619
line 1270
;1270:}
LABELV $512
endproc CG_NewClientInfo 980 40
data
export cgQueueLoad
align 4
LABELV cgQueueLoad
byte 4 0
export CG_ActualLoadDeferredPlayers
code
proc CG_ActualLoadDeferredPlayers 20 4
line 1282
;1271:
;1272:
;1273:qboolean cgQueueLoad = qfalse;
;1274:/*
;1275:======================
;1276:CG_ActualLoadDeferredPlayers
;1277:
;1278:Called at the beginning of CG_Player if cgQueueLoad is set.
;1279:======================
;1280:*/
;1281:void CG_ActualLoadDeferredPlayers( void )
;1282:{
line 1287
;1283:	int		i;
;1284:	clientInfo_t	*ci;
;1285:
;1286:	// scan for a deferred player to load
;1287:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+43024
ASGNP4
ADDRGP4 $649
JUMPV
LABELV $646
line 1288
;1288:		if ( ci->infoValid && ci->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $652
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $652
line 1290
;1289:			// if we are low on memory, leave it deferred
;1290:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 16
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 4000000
GEI4 $654
line 1291
;1291:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $610
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1292
;1292:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 1293
;1293:				continue;
ADDRGP4 $647
JUMPV
LABELV $654
line 1295
;1294:			}
;1295:			CG_LoadClientInfo( ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1297
;1296://			break;
;1297:		}
LABELV $652
line 1298
;1298:	}
LABELV $647
line 1287
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
ASGNP4
LABELV $649
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $646
line 1299
;1299:}
LABELV $645
endproc CG_ActualLoadDeferredPlayers 20 4
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 0 0
line 1310
;1300:
;1301:/*
;1302:======================
;1303:CG_LoadDeferredPlayers
;1304:
;1305:Called each frame when a player is dead
;1306:and the scoreboard is up
;1307:so deferred players can be loaded
;1308:======================
;1309:*/
;1310:void CG_LoadDeferredPlayers( void ) {
line 1311
;1311:	cgQueueLoad = qtrue;
ADDRGP4 cgQueueLoad
CNSTI4 1
ASGNI4
line 1312
;1312:}
LABELV $656
endproc CG_LoadDeferredPlayers 0 0
export CG_InRoll
proc CG_InRoll 8 0
line 1325
;1313:
;1314:/*
;1315:=============================================================================
;1316:
;1317:PLAYER ANIMATION
;1318:
;1319:=============================================================================
;1320:*/
;1321:
;1322:static qboolean CG_FirstAnimFrame(lerpFrame_t *lf, qboolean torsoOnly, float speedScale);
;1323:
;1324:qboolean CG_InRoll( centity_t *cent )
;1325:{
line 1326
;1326:	switch ( (cent->currentState.legsAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 885
LTI4 $658
ADDRLP4 0
INDIRI4
CNSTI4 888
GTI4 $658
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $665-3540
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $665
address $661
address $661
address $661
address $661
code
line 1327
;1327:	{
LABELV $661
line 1332
;1328:	case BOTH_ROLL_F:
;1329:	case BOTH_ROLL_B:
;1330:	case BOTH_ROLL_R:
;1331:	case BOTH_ROLL_L:
;1332:		if ( cent->pe.legs.animationTime > cg.time )
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $659
line 1333
;1333:		{
line 1334
;1334:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $657
JUMPV
line 1336
;1335:		}
;1336:		break;
LABELV $658
LABELV $659
line 1338
;1337:	}
;1338:	return qfalse;
CNSTI4 0
RETI4
LABELV $657
endproc CG_InRoll 8 0
export CG_InRollAnim
proc CG_InRollAnim 8 0
line 1342
;1339:}
;1340:
;1341:qboolean CG_InRollAnim( centity_t *cent )
;1342:{
line 1343
;1343:	switch ( (cent->currentState.legsAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 885
LTI4 $668
ADDRLP4 0
INDIRI4
CNSTI4 888
GTI4 $668
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $672-3540
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $672
address $671
address $671
address $671
address $671
code
line 1344
;1344:	{
LABELV $671
line 1349
;1345:	case BOTH_ROLL_F:
;1346:	case BOTH_ROLL_B:
;1347:	case BOTH_ROLL_R:
;1348:	case BOTH_ROLL_L:
;1349:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $667
JUMPV
LABELV $668
line 1351
;1350:	}
;1351:	return qfalse;
CNSTI4 0
RETI4
LABELV $667
endproc CG_InRollAnim 8 0
proc CG_SetLerpFrameAnimation 76 40
line 1361
;1352:}
;1353:
;1354:/*
;1355:===============
;1356:CG_SetLerpFrameAnimation
;1357:
;1358:may include ANIM_TOGGLEBIT
;1359:===============
;1360:*/
;1361:static void CG_SetLerpFrameAnimation( centity_t *cent, clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float animSpeedMult, qboolean torsoOnly) {
line 1364
;1362:	animation_t	*anim;
;1363:	float animSpeed;
;1364:	int	  flags=BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 4
CNSTI4 72
ASGNI4
line 1365
;1365:	int oldAnim = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 1366
;1366:	int blendTime = 150;
ADDRLP4 16
CNSTI4 150
ASGNI4
line 1368
;1367:
;1368:	if (cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $675
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $675
ADDRLP4 20
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $675
line 1371
;1369:		cent->currentState.teamowner &&
;1370:		!cent->isATST)
;1371:	{
line 1372
;1372:		return;
ADDRGP4 $674
JUMPV
LABELV $675
line 1375
;1373:	}
;1374:
;1375:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $677
line 1376
;1376:	{
line 1380
;1377:		vec3_t testVel;
;1378:		float fVel;
;1379:
;1380:		if (lf->animationNumber == BOTH_RUN1 ||
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 833
EQI4 $684
ADDRLP4 44
INDIRI4
CNSTI4 822
EQI4 $684
ADDRLP4 44
INDIRI4
CNSTI4 852
EQI4 $684
ADDRLP4 44
INDIRI4
CNSTI4 842
EQI4 $684
ADDRLP4 44
INDIRI4
CNSTI4 843
NEI4 $679
LABELV $684
line 1385
;1381:			lf->animationNumber == BOTH_WALK1 ||
;1382:			lf->animationNumber == BOTH_WALKBACK1 ||
;1383:			lf->animationNumber == BOTH_TURN_LEFT1 ||
;1384:			lf->animationNumber == BOTH_TURN_RIGHT1)
;1385:		{
line 1386
;1386:			if (cent->atstFootClang < cg.time)
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
GEI4 $685
line 1387
;1387:			{
line 1388
;1388:				if (rand() & 1)
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $688
line 1389
;1389:				{
line 1390
;1390:					trap_S_StartSound(NULL, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound("sound/chars/atst/ATSTstep1.wav"));
ADDRGP4 $690
ARGP4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1391
;1391:				}
ADDRGP4 $689
JUMPV
LABELV $688
line 1393
;1392:				else
;1393:				{
line 1394
;1394:					trap_S_StartSound(NULL, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound("sound/chars/atst/ATSTstep2.wav"));
ADDRGP4 $691
ARGP4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1395
;1395:				}
LABELV $689
line 1397
;1396:
;1397:				cent->atstFootClang = cg.time + 1300;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1300
ADDI4
ASGNI4
line 1398
;1398:			}
LABELV $685
line 1399
;1399:		}
LABELV $679
line 1401
;1400:
;1401:		VectorCopy(cent->currentState.pos.trDelta, testVel);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1403
;1402:
;1403:		fVel = VectorNormalize(testVel);
ADDRLP4 28
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 48
INDIRF4
ASGNF4
line 1405
;1404:
;1405:		if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $693
line 1406
;1406:		{
line 1407
;1407:			if (lf->animationNumber != BOTH_DEATH1 &&
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 1
EQI4 $695
ADDRLP4 52
INDIRI4
CNSTI4 47
EQI4 $695
line 1409
;1408:				lf->animationNumber != BOTH_DEAD1)
;1409:			{
line 1410
;1410:				trap_S_StartSound(NULL, cent->currentState.number, CHAN_BODY, trap_S_RegisterSound("sound/chars/atst/ATSTcrash.wav"));
ADDRGP4 $697
ARGP4
ADDRLP4 56
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1411
;1411:			}
LABELV $695
line 1412
;1412:			newAnimation = BOTH_DEATH1;
ADDRFP4 12
CNSTI4 1
ASGNI4
line 1413
;1413:		}
ADDRGP4 $694
JUMPV
LABELV $693
line 1414
;1414:		else if (fVel > 0)
ADDRLP4 40
INDIRF4
CNSTF4 0
LEF4 $698
line 1415
;1415:		{
line 1416
;1416:			qboolean doNotSet = qfalse;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1418
;1417:
;1418:			if (fVel > 250)
ADDRLP4 40
INDIRF4
CNSTF4 1132068864
LEF4 $700
line 1419
;1419:			{
line 1420
;1420:				animSpeedMult = 1.2;
ADDRFP4 16
CNSTF4 1067030938
ASGNF4
line 1421
;1421:			}
ADDRGP4 $701
JUMPV
LABELV $700
line 1422
;1422:			else if (fVel > 200)
ADDRLP4 40
INDIRF4
CNSTF4 1128792064
LEF4 $702
line 1423
;1423:			{
line 1424
;1424:				animSpeedMult = 1;
ADDRFP4 16
CNSTF4 1065353216
ASGNF4
line 1425
;1425:			}
ADDRGP4 $703
JUMPV
LABELV $702
line 1426
;1426:			else if (fVel > 100)
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
LEF4 $704
line 1427
;1427:			{
line 1428
;1428:				animSpeedMult = 0.9;
ADDRFP4 16
CNSTF4 1063675494
ASGNF4
line 1429
;1429:			}
ADDRGP4 $705
JUMPV
LABELV $704
line 1430
;1430:			else if (fVel > 0)
ADDRLP4 40
INDIRF4
CNSTF4 0
LEF4 $706
line 1431
;1431:			{
line 1432
;1432:				animSpeedMult = 0.8;
ADDRFP4 16
CNSTF4 1061997773
ASGNF4
line 1433
;1433:			}
ADDRGP4 $707
JUMPV
LABELV $706
line 1435
;1434:			else
;1435:			{
line 1436
;1436:				doNotSet = qtrue;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 1437
;1437:			}
LABELV $707
LABELV $705
LABELV $703
LABELV $701
line 1439
;1438:
;1439:			if (!doNotSet)
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $699
line 1440
;1440:			{
line 1441
;1441:				if ((cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN1 ||
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 833
EQI4 $713
ADDRLP4 56
INDIRI4
CNSTI4 852
EQI4 $713
ADDRLP4 56
INDIRI4
CNSTI4 822
NEI4 $710
LABELV $713
line 1444
;1442:					(cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_WALKBACK1 ||
;1443:					(cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK1)
;1444:				{
line 1445
;1445:					newAnimation = (cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT);
ADDRFP4 12
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1446
;1446:				}
ADDRGP4 $699
JUMPV
LABELV $710
line 1448
;1447:				else
;1448:				{
line 1449
;1449:					newAnimation = BOTH_RUN1;
ADDRFP4 12
CNSTI4 833
ASGNI4
line 1450
;1450:				}
line 1451
;1451:			}
line 1452
;1452:		}
ADDRGP4 $699
JUMPV
LABELV $698
line 1453
;1453:		else if ((cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN1START)
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 834
NEI4 $714
line 1454
;1454:		{
line 1455
;1455:			if (lf->animationNumber != BOTH_RUN1START)
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 834
EQI4 $716
line 1456
;1456:			{
line 1457
;1457:				trap_S_StartSound(NULL, cent->currentState.number, CHAN_BODY, trap_S_RegisterSound("sound/chars/atst/ATSTstart.wav"));
ADDRGP4 $718
ARGP4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1458
;1458:				cent->atstFootClang = cg.time + 650;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 650
ADDI4
ASGNI4
line 1459
;1459:			}
LABELV $716
line 1460
;1460:			newAnimation = BOTH_RUN1START;
ADDRFP4 12
CNSTI4 834
ASGNI4
line 1461
;1461:		}
ADDRGP4 $715
JUMPV
LABELV $714
line 1462
;1462:		else if (cent->pe.legs.yawing &&
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
CNSTI4 0
EQI4 $720
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 3248488448
LTF4 $722
ADDRLP4 56
INDIRF4
CNSTF4 1101004800
LEF4 $720
LABELV $722
line 1464
;1463:			(cent->pe.legs.yawSwingDif < -20 || cent->pe.legs.yawSwingDif > 20))
;1464:		{
line 1465
;1465:			if (cent->pe.legs.yawSwingDif > 0)
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
LEF4 $723
line 1466
;1466:			{
line 1467
;1467:				newAnimation = BOTH_TURN_LEFT1;//BOTH_RUN1;
ADDRFP4 12
CNSTI4 842
ASGNI4
line 1468
;1468:				if (lf->animationNumber != BOTH_TURN_LEFT1)
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 842
EQI4 $724
line 1469
;1469:				{
line 1470
;1470:					cent->atstFootClang = cg.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1471
;1471:				}
line 1472
;1472:			}
ADDRGP4 $724
JUMPV
LABELV $723
line 1474
;1473:			else
;1474:			{
line 1475
;1475:				newAnimation = BOTH_TURN_RIGHT1;//BOTH_RUN1;
ADDRFP4 12
CNSTI4 843
ASGNI4
line 1476
;1476:				if (lf->animationNumber != BOTH_TURN_RIGHT1)
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 843
EQI4 $728
line 1477
;1477:				{
line 1478
;1478:					cent->atstFootClang = cg.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1479
;1479:				}
LABELV $728
line 1480
;1480:			}
LABELV $724
line 1481
;1481:			animSpeedMult = 0.7;
ADDRFP4 16
CNSTF4 1060320051
ASGNF4
line 1482
;1482:		}
ADDRGP4 $721
JUMPV
LABELV $720
line 1484
;1483:		else
;1484:		{
line 1485
;1485:			newAnimation = BOTH_STAND1;
ADDRFP4 12
CNSTI4 571
ASGNI4
line 1486
;1486:		}
LABELV $721
LABELV $715
LABELV $699
LABELV $694
line 1488
;1487:
;1488:		if (newAnimation != BOTH_STAND1 && newAnimation != BOTH_RUN1 &&
ADDRLP4 60
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 571
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 833
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 834
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 822
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 852
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 1
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 47
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 843
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 842
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 97
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 98
EQI4 $731
line 1494
;1489:			newAnimation != BOTH_RUN1START && newAnimation != BOTH_WALK1 &&
;1490:			newAnimation != BOTH_WALKBACK1 && newAnimation != BOTH_DEATH1 &&
;1491:			newAnimation != BOTH_DEAD1 && newAnimation != BOTH_TURN_RIGHT1 &&
;1492:			newAnimation != BOTH_TURN_LEFT1 && newAnimation != BOTH_PAIN1 &&
;1493:			newAnimation != BOTH_PAIN2)
;1494:		{ //not a valid anim for the ATST..
line 1495
;1495:			newAnimation = BOTH_RUN1;
ADDRFP4 12
CNSTI4 833
ASGNI4
line 1496
;1496:		}
LABELV $731
line 1498
;1497:
;1498:		if (lf->animationNumber == newAnimation)
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 12
INDIRI4
NEI4 $733
line 1499
;1499:		{
line 1500
;1500:			return;
ADDRGP4 $674
JUMPV
LABELV $733
line 1502
;1501:		}
;1502:	}
LABELV $677
line 1504
;1503:
;1504:	oldAnim = lf->animationNumber;
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
line 1506
;1505:
;1506:	lf->animationNumber = newAnimation;
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 1507
;1507:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 12
ADDRFP4 12
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1509
;1508:
;1509:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $737
ADDRLP4 28
INDIRI4
CNSTI4 1211
LTI4 $735
LABELV $737
line 1510
;1510:		CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $738
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1511
;1511:	}
LABELV $735
line 1513
;1512:
;1513:	anim = &bgGlobalAnimations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 12
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 1515
;1514:
;1515:	lf->animation = anim;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1516
;1516:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1518
;1517:
;1518:	if ( cg_debugAnim.integer && (cg_debugAnim.integer < 0 || cg_debugAnim.integer == cent->currentState.clientNum) ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $739
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $744
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
NEI4 $739
LABELV $744
line 1519
;1519:		CG_Printf( "%d: %d Anim: %i, '%s'\n", cg.time, cent->currentState.clientNum, newAnimation, GetStringForID(animTable, newAnimation));
ADDRGP4 animTable
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 GetStringForID
CALLP4
ASGNP4
ADDRGP4 $745
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1520
;1520:	}
LABELV $739
line 1522
;1521:
;1522:	if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $747
line 1523
;1523:	{
line 1524
;1524:		animSpeed = 50.0f / anim->frameLerp;
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
line 1525
;1525:		if (lf->animation->loopFrames != -1)
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $749
line 1526
;1526:		{
line 1527
;1527:			flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 1528
;1528:		}
LABELV $749
line 1530
;1529:
;1530:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $751
line 1531
;1531:		{
line 1532
;1532:			if (animSpeed < 0.3)
ADDRLP4 8
INDIRF4
CNSTF4 1050253722
GEF4 $753
line 1533
;1533:			{
line 1534
;1534:				animSpeed = 0.3;
ADDRLP4 8
CNSTF4 1050253722
ASGNF4
line 1535
;1535:			}
LABELV $753
line 1537
;1536:
;1537:			if (newAnimation == BOTH_WALKBACK1)
ADDRFP4 12
INDIRI4
CNSTI4 852
NEI4 $755
line 1538
;1538:			{
line 1539
;1539:				animSpeed = 0.8;
ADDRLP4 8
CNSTF4 1061997773
ASGNF4
line 1540
;1540:			}
LABELV $755
line 1542
;1541:
;1542:			if (newAnimation != BOTH_DEATH1)
ADDRFP4 12
INDIRI4
CNSTI4 1
EQI4 $757
line 1543
;1543:			{
line 1544
;1544:				flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 1545
;1545:			}
LABELV $757
line 1546
;1546:		}
LABELV $751
line 1548
;1547:
;1548:		if (cg_animBlend.integer)
ADDRGP4 cg_animBlend+12
INDIRI4
CNSTI4 0
EQI4 $759
line 1549
;1549:		{
line 1550
;1550:			flags |= BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1551
;1551:		}
LABELV $759
line 1553
;1552:
;1553:		if (!cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $762
line 1554
;1554:		{
line 1555
;1555:			if (/*BG_FlippingAnim(newAnimation) ||*/ BG_InDeathAnim(newAnimation))
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $764
line 1556
;1556:			{
line 1557
;1557:				flags &= ~BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1558
;1558:			}
ADDRGP4 $765
JUMPV
LABELV $764
line 1559
;1559:			else if ( oldAnim != -1 &&
ADDRLP4 44
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 -1
EQI4 $766
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $766
line 1561
;1560:				(/*BG_FlippingAnim(oldAnim) ||*/ BG_InDeathAnim(oldAnim)) )
;1561:			{
line 1562
;1562:				flags &= ~BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1563
;1563:			}
LABELV $766
LABELV $765
line 1565
;1564:
;1565:			if (flags & BONE_ANIM_BLEND)
ADDRLP4 4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $768
line 1566
;1566:			{
line 1567
;1567:				if (BG_FlippingAnim(newAnimation))
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $770
line 1568
;1568:				{
line 1569
;1569:					blendTime = 200;
ADDRLP4 16
CNSTI4 200
ASGNI4
line 1570
;1570:				}
ADDRGP4 $771
JUMPV
LABELV $770
line 1571
;1571:				else if ( oldAnim != -1 &&
ADDRLP4 56
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 -1
EQI4 $772
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $772
line 1573
;1572:					(BG_FlippingAnim(oldAnim)) )
;1573:				{
line 1574
;1574:					blendTime = 200;
ADDRLP4 16
CNSTI4 200
ASGNI4
line 1575
;1575:				}
LABELV $772
LABELV $771
line 1576
;1576:			}
LABELV $768
line 1577
;1577:		}
LABELV $762
line 1579
;1578:
;1579:		animSpeed *= animSpeedMult;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1581
;1580:
;1581:		BG_SaberStartTransAnim(cent->currentState.fireflag, newAnimation, &animSpeed);
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 BG_SaberStartTransAnim
CALLV
pop
line 1583
;1582:
;1583:		if (torsoOnly)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $774
line 1584
;1584:		{
line 1585
;1585:			lf->animationTorsoSpeed = animSpeedMult;
ADDRFP4 8
INDIRP4
CNSTI4 56
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 1586
;1586:		}
ADDRGP4 $775
JUMPV
LABELV $774
line 1588
;1587:		else
;1588:		{
line 1589
;1589:			lf->animationSpeed = animSpeedMult;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 1590
;1590:		}
LABELV $775
line 1592
;1591:
;1592:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $776
line 1593
;1593:		{
line 1594
;1594:			int atstBlend = 400;
ADDRLP4 40
CNSTI4 400
ASGNI4
line 1596
;1595:
;1596:			if (torsoOnly)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $778
line 1597
;1597:			{
line 1598
;1598:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "pelvis", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, atstBlend);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
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
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1599
;1599:			}
ADDRGP4 $777
JUMPV
LABELV $778
line 1601
;1600:			else
;1601:			{
line 1602
;1602:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, atstBlend);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
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
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1603
;1603:			}
line 1604
;1604:		}
ADDRGP4 $777
JUMPV
LABELV $776
line 1606
;1605:		else
;1606:		{
line 1607
;1607:			int beginFrame = anim->firstFrame;
ADDRLP4 40
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 1609
;1608:
;1609:			if (torsoOnly)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $782
line 1610
;1610:			{
line 1611
;1611:				if ((cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) == (cent->currentState.legsAnim&~ANIM_TOGGLEBIT) && cent->pe.legs.frame >= anim->firstFrame && cent->pe.legs.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 -2049
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
BANDI4
ADDRLP4 44
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
BANDI4
NEI4 $784
ADDRLP4 52
ADDRLP4 44
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $784
ADDRLP4 52
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $784
line 1612
;1612:				{
line 1613
;1613:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "lower_lumbar", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed,cg.time, cent->pe.legs.frame, blendTime);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 72
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 64
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1614
;1614:					beginFrame = cent->pe.legs.frame;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 1615
;1615:				}
ADDRGP4 $785
JUMPV
LABELV $784
line 1617
;1616:				else
;1617:				{
line 1618
;1618:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "lower_lumbar", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed,cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 68
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 68
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
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
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1619
;1619:				}
LABELV $785
line 1620
;1620:				cgs.clientinfo[cent->currentState.number].torsoAnim = newAnimation;
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 1621
;1621:			}
ADDRGP4 $783
JUMPV
LABELV $782
line 1623
;1622:			else
;1623:			{
line 1624
;1624:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
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
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1626
;1625:				//cgs.clientinfo[cent->currentState.number].torsoAnim = newAnimation;
;1626:				cgs.clientinfo[cent->currentState.number].legsAnim = newAnimation;
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 1627
;1627:			}
LABELV $783
line 1629
;1628:
;1629:			if ((cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) == newAnimation)
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRFP4 12
INDIRI4
NEI4 $793
line 1630
;1630:			{
line 1631
;1631:				if (beginFrame != anim->firstFrame)
ADDRLP4 40
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $795
line 1632
;1632:				{
line 1633
;1633:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, beginFrame, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1634
;1634:				}
ADDRGP4 $796
JUMPV
LABELV $795
line 1636
;1635:				else
;1636:				{
line 1637
;1637:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
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
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1638
;1638:				}
LABELV $796
line 1639
;1639:			}
LABELV $793
line 1640
;1640:		}
LABELV $777
line 1641
;1641:	}
LABELV $747
line 1642
;1642:}
LABELV $674
endproc CG_SetLerpFrameAnimation 76 40
proc CG_FirstAnimFrame 4 0
line 1658
;1643:
;1644:
;1645:/*
;1646:===============
;1647:CG_FirstAnimFrame
;1648:
;1649:Returns true if the lerpframe is on its first frame of animation.
;1650:Otherwise false.
;1651:
;1652:This is used to scale an animation into higher-speed without restarting
;1653:the animation before it completes at normal speed, in the case of a looping
;1654:animation (such as the leg running anim).
;1655:===============
;1656:*/
;1657:static qboolean CG_FirstAnimFrame(lerpFrame_t *lf, qboolean torsoOnly, float speedScale)
;1658:{
line 1659
;1659:	if (torsoOnly)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $800
line 1660
;1660:	{
line 1661
;1661:		if (lf->animationTorsoSpeed == speedScale)
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
NEF4 $801
line 1662
;1662:		{
line 1663
;1663:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $799
JUMPV
line 1665
;1664:		}
;1665:	}
LABELV $800
line 1667
;1666:	else
;1667:	{
line 1668
;1668:		if (lf->animationSpeed == speedScale)
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
NEF4 $804
line 1669
;1669:		{
line 1670
;1670:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $799
JUMPV
LABELV $804
line 1672
;1671:		}
;1672:	}
LABELV $801
line 1674
;1673:
;1674:	if (lf->animation->numFrames < 2)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
GEI4 $806
line 1675
;1675:	{
line 1676
;1676:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $799
JUMPV
LABELV $806
line 1679
;1677:	}
;1678:
;1679:	if (lf->animation->firstFrame == lf->frame)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $808
line 1680
;1680:	{
line 1681
;1681:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $799
JUMPV
LABELV $808
line 1684
;1682:	}
;1683:
;1684:	return qfalse;
CNSTI4 0
RETI4
LABELV $799
endproc CG_FirstAnimFrame 4 0
export CG_InWalkingAnim
proc CG_InWalkingAnim 20 0
line 1696
;1685:}
;1686:
;1687:/*
;1688:===============
;1689:CG_InWalkingAnim
;1690:
;1691:Returns last frame to step on if the animation on the frame is desired for playing footstep sounds,
;1692:otherwise 0
;1693:===============
;1694:*/
;1695:int CG_InWalkingAnim(int animNum)
;1696:{
line 1697
;1697:	int anim = animNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 1699
;1698:	
;1699:	anim &= ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1701
;1700:
;1701:	if (anim == BOTH_WALL_RUN_RIGHT ||
ADDRLP4 0
INDIRI4
CNSTI4 915
EQI4 $813
ADDRLP4 0
INDIRI4
CNSTI4 918
NEI4 $811
LABELV $813
line 1703
;1702:		anim == BOTH_WALL_RUN_LEFT)
;1703:	{
line 1704
;1704:		return 8;
CNSTI4 8
RETI4
ADDRGP4 $810
JUMPV
LABELV $811
line 1707
;1705:	}
;1706:
;1707:	if (anim >= BOTH_WALK1 &&
ADDRLP4 0
INDIRI4
CNSTI4 822
LTI4 $814
ADDRLP4 0
INDIRI4
CNSTI4 850
GTI4 $814
line 1709
;1708:		anim <= BOTH_RUNAWAY1)
;1709:	{
line 1710
;1710:		if (anim == BOTH_RUN1)
ADDRLP4 0
INDIRI4
CNSTI4 833
NEI4 $816
line 1711
;1711:		{
line 1712
;1712:			return 18;//12;
CNSTI4 18
RETI4
ADDRGP4 $810
JUMPV
LABELV $816
line 1715
;1713:		}
;1714:		else
;1715:		{
line 1717
;1716:			//return 9;
;1717:			return 18;
CNSTI4 18
RETI4
ADDRGP4 $810
JUMPV
LABELV $814
line 1721
;1718:		}
;1719:	}
;1720:
;1721:	if (anim >= BOTH_WALKBACK1 &&
ADDRLP4 0
INDIRI4
CNSTI4 852
LTI4 $818
ADDRLP4 0
INDIRI4
CNSTI4 855
GTI4 $818
line 1723
;1722:		anim <= BOTH_RUNBACK2)
;1723:	{
line 1724
;1724:		if (anim == BOTH_WALKBACK1)
ADDRLP4 0
INDIRI4
CNSTI4 852
NEI4 $820
line 1725
;1725:		{
line 1726
;1726:			return 18;
CNSTI4 18
RETI4
ADDRGP4 $810
JUMPV
LABELV $820
line 1729
;1727:		}
;1728:		else
;1729:		{
line 1730
;1730:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $810
JUMPV
LABELV $818
line 1734
;1731:		}
;1732:	}
;1733:
;1734:	if (anim >= LEGS_WALKBACK1 &&
ADDRLP4 0
INDIRI4
CNSTI4 1139
LTI4 $822
ADDRLP4 0
INDIRI4
CNSTI4 1142
GTI4 $822
line 1736
;1735:		anim <= LEGS_RUNBACK2)
;1736:	{
line 1737
;1737:		if (anim == LEGS_WALKBACK1)
ADDRLP4 0
INDIRI4
CNSTI4 1139
NEI4 $824
line 1738
;1738:		{
line 1739
;1739:			return 18;
CNSTI4 18
RETI4
ADDRGP4 $810
JUMPV
LABELV $824
line 1742
;1740:		}
;1741:		else
;1742:		{
line 1743
;1743:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $810
JUMPV
LABELV $822
line 1747
;1744:		}
;1745:	}
;1746:
;1747:	return qfalse;
CNSTI4 0
RETI4
LABELV $810
endproc CG_InWalkingAnim 20 0
lit
align 4
LABELV $827
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV $828
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
code
proc CG_FootstepForSurface 1204 36
line 1754
;1748:}
;1749:
;1750:#define FOOTSTEP_GENERIC					1
;1751:#define FOOTSTEP_METAL						2
;1752:
;1753:static int CG_FootstepForSurface( centity_t *cent, int skip )
;1754:{
line 1757
;1755:	trace_t tr;
;1756:	vec3_t org, dOrg, legDir, bAngles;
;1757:	vec3_t playerMins = {-15, -15, DEFAULT_MINS_2};
ADDRLP4 1176
ADDRGP4 $827
INDIRB
ASGNB 12
line 1758
;1758:	vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 1188
ADDRGP4 $828
INDIRB
ASGNB 12
line 1768
;1759:	mdxaBone_t boltMatrix;
;1760:
;1761://	VectorCopy(ent->lerpOrigin, org);
;1762://	VectorCopy(org, dOrg);
;1763://	dOrg[2] -= 64; //should never have to go further than this because we're already onground
;1764:
;1765:	//We are now tracing off of a bolt point for footsteps, so that if we happen to be walking sideways on a wall we will
;1766:	//still play step sounds properly.
;1767:
;1768:	VectorCopy(cent->lerpAngles, bAngles);
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 1769
;1769:	bAngles[PITCH] = 0;
ADDRLP4 1116
CNSTF4 0
ASGNF4
line 1771
;1770:
;1771:	trap_G2API_GetBoltMatrix_NoReconstruct( cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_llumbar, &boltMatrix, bAngles, cent->lerpOrigin, cg.time, /*cgs.gameModels*/0, cent->modelScale);
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1200
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+528
ADDP4
INDIRI4
ARGI4
ADDRLP4 1128
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1200
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 1200
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix_NoReconstruct
CALLI4
pop
line 1772
;1772:	trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, ORIGIN, org );
ADDRLP4 1128
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 1773
;1773:	trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_Y, legDir );
ADDRLP4 1128
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1104
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 1775
;1774:
;1775:	dOrg[0] = org[0] + legDir[0]*64;
ADDRLP4 1092
ADDRLP4 0
INDIRF4
CNSTF4 1115684864
ADDRLP4 1104
INDIRF4
MULF4
ADDF4
ASGNF4
line 1776
;1776:	dOrg[1] = org[1] + legDir[1]*64;
ADDRLP4 1092+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1104+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1777
;1777:	dOrg[2] = org[2] + legDir[2]*64;
ADDRLP4 1092+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 1104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1781
;1778:
;1779:	//CG_TestLine(org, dOrg, 100, 0x0000ff, 3);
;1780:
;1781:	CG_Trace(&tr, org, playerMins, playerMaxs, dOrg, skip, MASK_PLAYERSOLID);
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1176
ARGP4
ADDRLP4 1188
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1783
;1782:
;1783:	if (tr.fraction == 1)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $838
line 1784
;1784:	{
line 1785
;1785:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $826
JUMPV
LABELV $838
line 1788
;1786:	}
;1787:
;1788:	if ( tr.surfaceFlags & SURF_NOSTEPS )
ADDRLP4 12+44
INDIRI4
CNSTI4 4194304
BANDI4
CNSTI4 0
EQI4 $841
line 1789
;1789:	{
line 1790
;1790:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $826
JUMPV
LABELV $841
line 1793
;1791:	}
;1792:
;1793:	if ( tr.surfaceFlags & SURF_METALSTEPS )
ADDRLP4 12+44
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $844
line 1794
;1794:	{
line 1795
;1795:		return FOOTSTEP_METAL;
CNSTI4 2
RETI4
ADDRGP4 $826
JUMPV
LABELV $844
line 1798
;1796:	}
;1797:
;1798:	return FOOTSTEP_GENERIC;
CNSTI4 1
RETI4
LABELV $826
endproc CG_FootstepForSurface 1204 36
export CG_FootStep
proc CG_FootStep 28 16
line 1802
;1799:}
;1800:
;1801:void CG_FootStep(centity_t *cent, clientInfo_t *ci, int anim)
;1802:{
line 1805
;1803:	int groundType;
;1804:
;1805:	if ((anim & ~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT ||
ADDRLP4 4
ADDRFP4 8
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 915
EQI4 $850
ADDRLP4 4
INDIRI4
CNSTI4 918
NEI4 $848
LABELV $850
line 1807
;1806:		(anim & ~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT)
;1807:	{
line 1808
;1808:		groundType = FOOTSTEP_GENERIC;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1809
;1809:		goto skipCheck;
ADDRGP4 $851
JUMPV
LABELV $848
line 1812
;1810:	}
;1811:
;1812:	if (cent->currentState.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $852
line 1813
;1813:	{
line 1814
;1814:		return;
ADDRGP4 $847
JUMPV
LABELV $852
LABELV $851
line 1818
;1815:	}
;1816:
;1817:skipCheck:
;1818:	groundType = CG_FootstepForSurface(cent, cent->currentState.number);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1822
;1819:
;1820://skipCheck:
;1821:
;1822:	if (!groundType)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $854
line 1823
;1823:	{
line 1824
;1824:		return;
ADDRGP4 $847
JUMPV
LABELV $854
line 1827
;1825:	}
;1826:
;1827:	switch (groundType)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $858
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $861
ADDRGP4 $857
JUMPV
line 1828
;1828:	{
LABELV $858
line 1830
;1829:	case FOOTSTEP_GENERIC:
;1830:		trap_S_StartSound (NULL, cent->currentState.number, CHAN_BODY, 
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 4
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
line 1832
;1831:			cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;1832:		break;
ADDRGP4 $857
JUMPV
LABELV $861
line 1834
;1833:	case FOOTSTEP_METAL:
;1834:		trap_S_StartSound (NULL, cent->currentState.number, CHAN_BODY, 
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 24
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
line 1836
;1835:			cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;1836:		break;
line 1838
;1837:	default:
;1838:		break;
LABELV $857
line 1840
;1839:	}
;1840:}
LABELV $847
endproc CG_FootStep 28 16
proc CG_RunLerpFrame 76 40
line 1850
;1841:/*
;1842:===============
;1843:CG_RunLerpFrame
;1844:
;1845:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1846:cg.time should be between oldFrameTime and frameTime after exit
;1847:===============
;1848:*/
;1849:static void CG_RunLerpFrame( centity_t *cent, clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale, qboolean torsoOnly) 
;1850:{
line 1855
;1851:	int			f, numFrames;
;1852:	animation_t	*anim;
;1853:
;1854:	// debugging tool to get no animations
;1855:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $866
line 1856
;1856:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1857
;1857:		return;
ADDRGP4 $865
JUMPV
LABELV $866
line 1861
;1858:	}
;1859:
;1860:	// see if the animation sequence is switching
;1861:	if (cent->currentState.forceFrame)
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 0
EQI4 $869
line 1862
;1862:	{
line 1863
;1863:		int flags = BONE_ANIM_OVERRIDE_FREEZE; //|BONE_ANIM_BLEND;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 1864
;1864:		float animSpeed = 1.0f;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1865
;1865:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "lower_lumbar", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
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
line 1866
;1866:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
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
line 1867
;1867:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
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
line 1869
;1868:
;1869:		lf->animationNumber = 0;
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 1870
;1870:	}
ADDRGP4 $870
JUMPV
LABELV $869
line 1871
;1871:	else if ( (newAnimation != lf->animationNumber || !lf->animation) || (CG_FirstAnimFrame(lf, torsoOnly, speedScale)) ) 
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 12
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $876
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $876
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 CG_FirstAnimFrame
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $874
LABELV $876
line 1872
;1872:	{
line 1873
;1873:		CG_SetLerpFrameAnimation( cent, ci, lf, newAnimation, speedScale, torsoOnly);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1874
;1874:	}
ADDRGP4 $875
JUMPV
LABELV $874
line 1875
;1875:	else if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $877
line 1876
;1876:	{
line 1877
;1877:		if (cent->pe.legs.yawing != !lf->torsoYawing)
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
NEI4 $882
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $883
JUMPV
LABELV $882
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $883
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $879
line 1878
;1878:		{
line 1879
;1879:			CG_SetLerpFrameAnimation( cent, ci, lf, newAnimation, speedScale, torsoOnly);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1880
;1880:			lf->torsoYawing = cent->pe.legs.yawing;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ASGNI4
line 1881
;1881:		}
LABELV $879
line 1882
;1882:	}
LABELV $877
LABELV $875
LABELV $870
line 1886
;1883:
;1884:	// if we have passed the current frame, move it to
;1885:	// oldFrame and calculate a new frame
;1886:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $884
line 1887
;1887:		if (lf->oldFrame != lf->frame &&
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $887
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CVPU4 4
NEU4 $887
line 1889
;1888:			lf == &(cent->pe.legs))
;1889:		{
line 1890
;1890:			int addFinalFrame = CG_InWalkingAnim(lf->animationNumber); //9;
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_InWalkingAnim
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 1892
;1891:
;1892:			if (!cent->isATST &&
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $889
ADDRLP4 32
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 915
EQI4 $891
ADDRLP4 32
INDIRI4
CNSTI4 918
NEI4 $889
LABELV $891
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $889
line 1895
;1893:				((lf->animationNumber&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT || (lf->animationNumber&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT) &&
;1894:				addFinalFrame)
;1895:			{
line 1896
;1896:				if ( lf->frame >= (lf->animation->firstFrame+2) &&
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $892
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 40
INDIRI4
GEI4 $892
line 1898
;1897:					lf->oldFrame < (lf->animation->firstFrame+2))
;1898:				{
line 1899
;1899:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1900
;1900:				}
ADDRGP4 $890
JUMPV
LABELV $892
line 1901
;1901:				else if ( lf->frame >= (lf->animation->firstFrame+addFinalFrame) &&
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $894
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 48
INDIRI4
GEI4 $894
line 1903
;1902:					lf->oldFrame < (lf->animation->firstFrame+addFinalFrame))
;1903:				{
line 1904
;1904:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1905
;1905:				}
ADDRGP4 $890
JUMPV
LABELV $894
line 1906
;1906:				else if ( lf->frame >= (lf->animation->firstFrame+12) &&
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $896
ADDRLP4 52
INDIRP4
INDIRI4
ADDRLP4 56
INDIRI4
GEI4 $896
line 1908
;1907:					lf->oldFrame < (lf->animation->firstFrame+12))
;1908:				{
line 1909
;1909:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1910
;1910:				}
ADDRGP4 $890
JUMPV
LABELV $896
line 1911
;1911:				else if ( lf->frame >= (lf->animation->firstFrame+16) &&
ADDRLP4 60
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LTI4 $898
ADDRLP4 60
INDIRP4
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $898
line 1913
;1912:					lf->oldFrame < (lf->animation->firstFrame+16))
;1913:				{
line 1914
;1914:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1915
;1915:				}
ADDRGP4 $890
JUMPV
LABELV $898
line 1916
;1916:				else if (lf->oldFrame > lf->frame && lf->frame > (lf->animation->firstFrame+1))
ADDRLP4 68
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRP4
INDIRI4
ADDRLP4 72
INDIRI4
LEI4 $890
ADDRLP4 72
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $890
line 1917
;1917:				{ //missed one
line 1918
;1918:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1919
;1919:				}
line 1920
;1920:			}
ADDRGP4 $890
JUMPV
LABELV $889
line 1921
;1921:			else if (addFinalFrame && !cent->isATST)
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $902
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $902
line 1922
;1922:			{
line 1923
;1923:				if ( lf->frame >= (lf->animation->firstFrame+3) &&
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $904
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $904
line 1925
;1924:					lf->oldFrame < (lf->animation->firstFrame+3))
;1925:				{
line 1926
;1926:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1927
;1927:				}
ADDRGP4 $905
JUMPV
LABELV $904
line 1928
;1928:				else if ( lf->frame >= (lf->animation->firstFrame+addFinalFrame) &&
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LTI4 $906
ADDRLP4 48
INDIRP4
INDIRI4
ADDRLP4 52
INDIRI4
GEI4 $906
line 1930
;1929:					lf->oldFrame < (lf->animation->firstFrame+addFinalFrame))
;1930:				{
line 1931
;1931:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1932
;1932:				}
ADDRGP4 $907
JUMPV
LABELV $906
line 1933
;1933:				else if (lf->oldFrame > lf->frame && lf->frame > (lf->animation->firstFrame+1))
ADDRLP4 56
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $908
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $908
line 1934
;1934:				{ //missed one
line 1935
;1935:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1936
;1936:				}
LABELV $908
LABELV $907
LABELV $905
line 1937
;1937:			}
LABELV $902
LABELV $890
line 1938
;1938:		}
LABELV $887
line 1940
;1939:
;1940:		lf->oldFrame = lf->frame;
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1941
;1941:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1944
;1942:
;1943:		// get the next frame based on the animation
;1944:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
ASGNP4
line 1945
;1945:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $910
line 1946
;1946:			return;		// shouldn't happen
ADDRGP4 $865
JUMPV
LABELV $910
line 1949
;1947:		}
;1948:
;1949:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
GEI4 $912
line 1950
;1950:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 1951
;1951:		} else {
ADDRGP4 $913
JUMPV
LABELV $912
line 1952
;1952:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 12
ASGNI4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1953
;1953:		}
LABELV $913
line 1954
;1954:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1955
;1955:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1957
;1956:
;1957:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1958
;1958:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $915
line 1959
;1959:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1960
;1960:		}
LABELV $915
line 1961
;1961:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $917
line 1962
;1962:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1963
;1963:			if ( anim->loopFrames != -1 ) //Before 0 meant no loop
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $919
line 1964
;1964:			{
line 1965
;1965:				if(anim->numFrames - anim->loopFrames == 0)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CNSTI4 0
NEI4 $921
line 1966
;1966:				{
line 1967
;1967:					f %= anim->numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
MODI4
ASGNI4
line 1968
;1968:				}
ADDRGP4 $922
JUMPV
LABELV $921
line 1970
;1969:				else
;1970:				{
line 1971
;1971:					f %= (anim->numFrames - anim->loopFrames);
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
MODI4
ASGNI4
line 1972
;1972:				}
LABELV $922
line 1973
;1973:				f += anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1974
;1974:			} 
ADDRGP4 $920
JUMPV
LABELV $919
line 1976
;1975:			else 
;1976:			{
line 1977
;1977:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1980
;1978:				// the animation is stuck at the end, so it
;1979:				// can immediately transition to another sequence
;1980:				lf->frameTime = cg.time;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1981
;1981:			}
LABELV $920
line 1982
;1982:		}
LABELV $917
line 1983
;1983:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $924
line 1984
;1984:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
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
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1985
;1985:		}
ADDRGP4 $925
JUMPV
LABELV $924
line 1986
;1986:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $926
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $926
line 1987
;1987:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 48
INDIRI4
MODI4
SUBI4
ASGNI4
line 1988
;1988:		}
ADDRGP4 $927
JUMPV
LABELV $926
line 1989
;1989:		else {
line 1990
;1990:			lf->frame = anim->firstFrame + f;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1991
;1991:		}
LABELV $927
LABELV $925
line 1992
;1992:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $928
line 1993
;1993:			lf->frameTime = cg.time;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1994
;1994:			if ( cg_debugAnim.integer && (cg_debugAnim.integer < 0 || cg_debugAnim.integer == cent->currentState.clientNum) ) {
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $932
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $937
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
NEI4 $932
LABELV $937
line 1995
;1995:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $938
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1996
;1996:			}
LABELV $932
line 1997
;1997:		}
LABELV $928
line 1998
;1998:	}
LABELV $884
line 2000
;1999:
;2000:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
CNSTI4 200
ADDI4
LEI4 $939
line 2001
;2001:		lf->frameTime = cg.time;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2002
;2002:	}
LABELV $939
line 2004
;2003:
;2004:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $943
line 2005
;2005:		lf->oldFrameTime = cg.time;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2006
;2006:	}
LABELV $943
line 2008
;2007:	// calculate current lerp value
;2008:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $947
line 2009
;2009:		lf->backlerp = 0;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 2010
;2010:	} else {
ADDRGP4 $948
JUMPV
LABELV $947
line 2011
;2011:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+64
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 2012
;2012:	}
LABELV $948
line 2013
;2013:}
LABELV $865
endproc CG_RunLerpFrame 76 40
proc CG_ClearLerpFrame 16 24
line 2021
;2014:
;2015:
;2016:/*
;2017:===============
;2018:CG_ClearLerpFrame
;2019:===============
;2020:*/
;2021:static void CG_ClearLerpFrame( centity_t *cent, clientInfo_t *ci, lerpFrame_t *lf, int animationNumber, qboolean torsoOnly) {
line 2022
;2022:	lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2023
;2023:	CG_SetLerpFrameAnimation( cent, ci, lf, animationNumber, 1, torsoOnly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 2024
;2024:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2025
;2025:}
LABELV $950
endproc CG_ClearLerpFrame 16 24
proc CG_PlayerAnimation 16 24
line 2034
;2026:
;2027:
;2028:/*
;2029:===============
;2030:CG_PlayerAnimation
;2031:===============
;2032:*/
;2033:static void CG_PlayerAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;2034:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 2039
;2035:	clientInfo_t	*ci;
;2036:	int				clientNum;
;2037:	float			speedScale;
;2038:
;2039:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 2041
;2040:
;2041:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $953
line 2042
;2042:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2043
;2043:		return;
ADDRGP4 $952
JUMPV
LABELV $953
line 2046
;2044:	}
;2045:
;2046:	if (cent->currentState.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $956
line 2047
;2047:	{
line 2048
;2048:		speedScale = 1.3;
ADDRLP4 0
CNSTF4 1067869798
ASGNF4
line 2049
;2049:	}
ADDRGP4 $957
JUMPV
LABELV $956
line 2050
;2050:	else if (cent->currentState.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $958
line 2051
;2051:	{
line 2052
;2052:		speedScale = 1.7;
ADDRLP4 0
CNSTF4 1071225242
ASGNF4
line 2053
;2053:	}
ADDRGP4 $959
JUMPV
LABELV $958
line 2055
;2054:	else
;2055:	{
line 2056
;2056:		speedScale = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2057
;2057:	}
LABELV $959
LABELV $957
line 2059
;2058:
;2059:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
CNSTI4 788
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 2062
;2060:
;2061:	// do the shuffle turn frames locally
;2062:	if(0){//	if ( cent->pe.legs.yawing && ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) == TORSO_WEAPONREADY3) {
ADDRGP4 $961
JUMPV
line 2063
;2063:		CG_RunLerpFrame( cent, ci, &cent->pe.legs, LEGS_TURN1, speedScale, qfalse);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 644
ADDP4
ARGP4
CNSTI4 1143
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 2064
;2064:	} else {
ADDRGP4 $962
JUMPV
LABELV $961
line 2065
;2065:		CG_RunLerpFrame( cent, ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale, qfalse);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 644
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 2066
;2066:	}
LABELV $962
line 2068
;2067:
;2068:	if (!(cent->currentState.forcePowersActive & (1 << FP_RAGE)))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $963
line 2069
;2069:	{ //don't affect torso anim speed unless raged
line 2070
;2070:		speedScale = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2071
;2071:	}
ADDRGP4 $964
JUMPV
LABELV $963
line 2073
;2072:	else
;2073:	{
line 2074
;2074:		speedScale = 1.7;
ADDRLP4 0
CNSTF4 1071225242
ASGNF4
line 2075
;2075:	}
LABELV $964
line 2077
;2076:
;2077:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ASGNI4
line 2078
;2078:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 2079
;2079:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRF4
ASGNF4
line 2081
;2080:
;2081:	CG_RunLerpFrame( cent, ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale, qtrue );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 2083
;2082:
;2083:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ASGNI4
line 2084
;2084:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 2085
;2085:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ASGNF4
line 2086
;2086:}
LABELV $952
endproc CG_PlayerAnimation 16 24
proc CG_SwingAngles 28 8
line 2105
;2087:
;2088:
;2089:
;2090:
;2091:/*
;2092:=============================================================================
;2093:
;2094:PLAYER ANGLES
;2095:
;2096:=============================================================================
;2097:*/
;2098:
;2099:/*
;2100:==================
;2101:CG_SwingAngles
;2102:==================
;2103:*/
;2104:static float CG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;2105:					float speed, float *angle, qboolean *swinging ) {
line 2110
;2106:	float	swing;
;2107:	float	move;
;2108:	float	scale;
;2109:
;2110:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $966
line 2112
;2111:		// see if a swing should be started
;2112:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2113
;2113:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $970
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $968
LABELV $970
line 2114
;2114:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 2115
;2115:		}
LABELV $968
line 2116
;2116:	}
LABELV $966
line 2118
;2117:
;2118:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $971
line 2119
;2119:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $965
JUMPV
LABELV $971
line 2124
;2120:	}
;2121:	
;2122:	// modify the speed depending on the delta
;2123:	// so it doesn't seem so linear
;2124:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2125
;2125:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 2126
;2126:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $973
line 2127
;2127:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 2128
;2128:	} else if ( scale < swingTolerance ) {
ADDRGP4 $974
JUMPV
LABELV $973
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $975
line 2129
;2129:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 2130
;2130:	} else {
ADDRGP4 $976
JUMPV
LABELV $975
line 2131
;2131:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 2132
;2132:	}
LABELV $976
LABELV $974
line 2135
;2133:
;2134:	// swing towards the destination angle
;2135:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $977
line 2136
;2136:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+60
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 2137
;2137:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $980
line 2138
;2138:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 2139
;2139:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 2140
;2140:		}
LABELV $980
line 2141
;2141:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2142
;2142:	} else if ( swing < 0 ) {
ADDRGP4 $978
JUMPV
LABELV $977
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $982
line 2143
;2143:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+60
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 2144
;2144:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $985
line 2145
;2145:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 2146
;2146:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 2147
;2147:		}
LABELV $985
line 2148
;2148:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2149
;2149:	}
LABELV $982
LABELV $978
line 2152
;2150:
;2151:	// clamp to no more than tolerance
;2152:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 2153
;2153:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $987
line 2154
;2154:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2155
;2155:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $988
JUMPV
LABELV $987
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $989
line 2156
;2156:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2157
;2157:	}
LABELV $989
LABELV $988
line 2159
;2158:
;2159:	return swing;
ADDRLP4 0
INDIRF4
RETF4
LABELV $965
endproc CG_SwingAngles 28 8
proc CG_SwingAnglesATST 36 8
line 2168
;2160:}
;2161:
;2162:/*
;2163:==================
;2164:CG_SwingAngles
;2165:==================
;2166:*/
;2167:static float CG_SwingAnglesATST( centity_t *cent, float destination, float swingTolerance, float clampTolerance,
;2168:					float speed, float *angle, qboolean *swinging ) {
line 2173
;2169:	float	swing;
;2170:	float	move;
;2171:	float	scale;
;2172:
;2173:	if ( !*swinging ) {
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $992
line 2175
;2174:		// see if a swing should be started
;2175:		swing = AngleSubtract( *angle, destination );
ADDRFP4 20
INDIRP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2176
;2176:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $996
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $994
LABELV $996
line 2177
;2177:			*swinging = qtrue;
ADDRFP4 24
INDIRP4
CNSTI4 1
ASGNI4
line 2178
;2178:		}
LABELV $994
line 2179
;2179:	}
LABELV $992
line 2181
;2180:
;2181:	if ( !*swinging ) {
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $997
line 2182
;2182:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $991
JUMPV
LABELV $997
line 2187
;2183:	}
;2184:	
;2185:	// modify the speed depending on the delta
;2186:	// so it doesn't seem so linear
;2187:	swing = AngleSubtract( destination, *angle );
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2188
;2188:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 2189
;2189:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 8
INDIRF4
MULF4
GEF4 $999
line 2190
;2190:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 2191
;2191:	} else if ( scale < swingTolerance ) {
ADDRGP4 $1000
JUMPV
LABELV $999
ADDRLP4 4
INDIRF4
ADDRFP4 8
INDIRF4
GEF4 $1001
line 2192
;2192:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 2193
;2193:	} else {
ADDRGP4 $1002
JUMPV
LABELV $1001
line 2194
;2194:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 2195
;2195:	}
LABELV $1002
LABELV $1000
line 2197
;2196:
;2197:	if (swing < 10 && swing > -10)
ADDRLP4 0
INDIRF4
CNSTF4 1092616192
GEF4 $1003
ADDRLP4 0
INDIRF4
CNSTF4 3240099840
LEF4 $1003
line 2198
;2198:	{
line 2199
;2199:		cent->atstSwinging = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
CNSTI4 0
ASGNI4
line 2200
;2200:	}
LABELV $1003
line 2201
;2201:	if (swing < 60 && swing > -60 && !cent->atstSwinging)
ADDRLP4 0
INDIRF4
CNSTF4 1114636288
GEF4 $1005
ADDRLP4 0
INDIRF4
CNSTF4 3262119936
LEF4 $1005
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1005
line 2202
;2202:	{
line 2203
;2203:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $991
JUMPV
LABELV $1005
line 2206
;2204:	}
;2205:
;2206:	cent->atstSwinging = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
CNSTI4 1
ASGNI4
line 2209
;2207:
;2208:	// swing towards the destination angle
;2209:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $1007
line 2210
;2210:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+60
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 2211
;2211:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $1010
line 2212
;2212:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 2213
;2213:			*swinging = qfalse;
ADDRFP4 24
INDIRP4
CNSTI4 0
ASGNI4
line 2214
;2214:		}
LABELV $1010
line 2215
;2215:		*angle = AngleMod( *angle + move );
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2216
;2216:	} else if ( swing < 0 ) {
ADDRGP4 $1008
JUMPV
LABELV $1007
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $1012
line 2217
;2217:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+60
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
NEGF4
MULF4
ASGNF4
line 2218
;2218:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $1015
line 2219
;2219:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 2220
;2220:			*swinging = qfalse;
ADDRFP4 24
INDIRP4
CNSTI4 0
ASGNI4
line 2221
;2221:		}
LABELV $1015
line 2222
;2222:		*angle = AngleMod( *angle + move );
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2223
;2223:	}
LABELV $1012
LABELV $1008
line 2226
;2224:
;2225:	// clamp to no more than tolerance
;2226:	swing = AngleSubtract( destination, *angle );
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 2227
;2227:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 12
INDIRF4
LEF4 $1017
line 2228
;2228:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 20
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2229
;2229:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $1018
JUMPV
LABELV $1017
ADDRLP4 0
INDIRF4
ADDRFP4 12
INDIRF4
NEGF4
GEF4 $1019
line 2230
;2230:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 20
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2231
;2231:	}
LABELV $1019
LABELV $1018
line 2233
;2232:
;2233:	return swing;
ADDRLP4 0
INDIRF4
RETF4
LABELV $991
endproc CG_SwingAnglesATST 36 8
proc CG_AddPainTwitch 12 0
line 2241
;2234:}
;2235:
;2236:/*
;2237:=================
;2238:CG_AddPainTwitch
;2239:=================
;2240:*/
;2241:static void CG_AddPainTwitch( centity_t *cent, vec3_t torsoAngles ) {
line 2245
;2242:	int		t;
;2243:	float	f;
;2244:
;2245:	t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2246
;2246:	if ( t >= PAIN_TWITCH_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $1023
line 2247
;2247:		return;
ADDRGP4 $1021
JUMPV
LABELV $1023
line 2250
;2248:	}
;2249:
;2250:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 2252
;2251:
;2252:	if ( cent->pe.painDirection ) {
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1025
line 2253
;2253:		torsoAngles[ROLL] += 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2254
;2254:	} else {
ADDRGP4 $1026
JUMPV
LABELV $1025
line 2255
;2255:		torsoAngles[ROLL] -= 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2256
;2256:	}
LABELV $1026
line 2257
;2257:}
LABELV $1021
endproc CG_AddPainTwitch 12 0
export CG_G2SetBoneAngles
proc CG_G2SetBoneAngles 0 44
ADDRFP4 16
ADDRFP4 16
INDIRI4
ASGNI4
ADDRFP4 20
ADDRFP4 20
INDIRI4
ASGNI4
ADDRFP4 24
ADDRFP4 24
INDIRI4
ASGNI4
ADDRFP4 28
ADDRFP4 28
INDIRI4
ASGNI4
line 2281
;2258:
;2259:
;2260:typedef struct boneAngleParms_s {
;2261:	void *ghoul2;
;2262:	int modelIndex;
;2263:	char *boneName;
;2264:	vec3_t angles;
;2265:	int flags;
;2266:	int up;
;2267:	int right;
;2268:	int forward;
;2269:	qhandle_t *modelList;
;2270:	int blendTime;
;2271:	int currentTime;
;2272:
;2273:	qboolean refreshSet;
;2274:} boneAngleParms_t;
;2275:
;2276:boneAngleParms_t cgBoneAnglePostSet;
;2277:
;2278:void CG_G2SetBoneAngles(void *ghoul2, int modelIndex, const char *boneName, const vec3_t angles, const int flags,
;2279:								const int up, const int right, const int forward, qhandle_t *modelList,
;2280:								int blendTime , int currentTime )
;2281:{ //we want to hold off on setting the bone angles until the end of the frame, because every time we set
line 2306
;2282:  //them the entire skeleton has to be reconstructed.
;2283:#if 0
;2284:	//This function should ONLY be called from CG_Player() or a function that is called only within CG_Player().
;2285:	//At the end of the frame we will check to use this information to call SetBoneAngles
;2286:	memset(&cgBoneAnglePostSet, 0, sizeof(cgBoneAnglePostSet));
;2287:	cgBoneAnglePostSet.ghoul2 = ghoul2;
;2288:	cgBoneAnglePostSet.modelIndex = modelIndex;
;2289:	cgBoneAnglePostSet.boneName = (char *)boneName;
;2290:
;2291:	cgBoneAnglePostSet.angles[0] = angles[0];
;2292:	cgBoneAnglePostSet.angles[1] = angles[1];
;2293:	cgBoneAnglePostSet.angles[2] = angles[2];
;2294:
;2295:	cgBoneAnglePostSet.flags = flags;
;2296:	cgBoneAnglePostSet.up = up;
;2297:	cgBoneAnglePostSet.right = right;
;2298:	cgBoneAnglePostSet.forward = forward;
;2299:	cgBoneAnglePostSet.modelList = modelList;
;2300:	cgBoneAnglePostSet.blendTime = blendTime;
;2301:	cgBoneAnglePostSet.currentTime = currentTime;
;2302:
;2303:	cgBoneAnglePostSet.refreshSet = qtrue;
;2304:#endif
;2305:	//Unfortunately the above doesn't really work.
;2306:	trap_G2API_SetBoneAngles(ghoul2, modelIndex, boneName, angles, flags, up, right, forward, modelList,
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRFP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 2308
;2307:		blendTime, currentTime);
;2308:}
LABELV $1027
endproc CG_G2SetBoneAngles 0 44
export CG_InKnockDown
proc CG_InKnockDown 8 0
line 2311
;2309:
;2310:qboolean CG_InKnockDown( int anim )
;2311:{
line 2312
;2312:	switch ( (anim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 924
LTI4 $1029
ADDRLP4 0
INDIRI4
CNSTI4 942
GTI4 $1029
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1034-3696
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1034
address $1032
address $1032
address $1032
address $1032
address $1032
address $1033
address $1033
address $1033
address $1033
address $1033
address $1029
address $1029
address $1033
address $1033
address $1033
address $1033
address $1033
address $1033
address $1033
code
line 2313
;2313:	{
LABELV $1032
line 2319
;2314:	case BOTH_KNOCKDOWN1:
;2315:	case BOTH_KNOCKDOWN2:
;2316:	case BOTH_KNOCKDOWN3:
;2317:	case BOTH_KNOCKDOWN4:
;2318:	case BOTH_KNOCKDOWN5:
;2319:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1028
JUMPV
line 2320
;2320:		break;
LABELV $1033
line 2333
;2321:	case BOTH_GETUP1:
;2322:	case BOTH_GETUP2:
;2323:	case BOTH_GETUP3:
;2324:	case BOTH_GETUP4:
;2325:	case BOTH_GETUP5:
;2326:	case BOTH_FORCE_GETUP_F1:
;2327:	case BOTH_FORCE_GETUP_F2:
;2328:	case BOTH_FORCE_GETUP_B1:
;2329:	case BOTH_FORCE_GETUP_B2:
;2330:	case BOTH_FORCE_GETUP_B3:
;2331:	case BOTH_FORCE_GETUP_B4:
;2332:	case BOTH_FORCE_GETUP_B5:
;2333:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1028
JUMPV
line 2334
;2334:		break;
LABELV $1029
line 2336
;2335:	}
;2336:	return qfalse;
CNSTI4 0
RETI4
LABELV $1028
endproc CG_InKnockDown 8 0
export CG_G2ClientSpineAngles
proc CG_G2ClientSpineAngles 248 36
line 2340
;2337:}
;2338:
;2339:void CG_G2ClientSpineAngles( centity_t *cent, vec3_t viewAngles, const vec3_t angles, vec3_t thoracicAngles, vec3_t ulAngles, vec3_t llAngles )
;2340:{
line 2341
;2341:	float legDif = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2343
;2342://	cent->pe.torso.pitchAngle = viewAngles[PITCH];
;2343:	viewAngles[YAW] = AngleDelta( cent->lerpAngles[YAW], angles[YAW] );
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 2344
;2344:	legDif = viewAngles[YAW];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 2354
;2345://	cent->pe.torso.yawAngle = viewAngles[YAW];
;2346:
;2347:	/*
;2348:	if ( !BG_FlippingAnim( cent->currentState.legsAnim ) 
;2349:		&& !BG_SpinningSaberAnim( cent->currentState.legsAnim ) 
;2350:		&& !BG_SpinningSaberAnim( cent->currentState.torsoAnim )
;2351:		&& !BG_SaberInSpecial(cent->currentState.saberMove)
;2352:		&& cent->currentState.legsAnim != cent->currentState.torsoAnim )//NOTE: presumes your legs & torso are on the same frame, though they *should* be because PM_SetAnimFinal tries to keep them in synch
;2353:	*/
;2354:	if ( !BG_FlippingAnim( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
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
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_InRoll
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 CG_InRollAnim
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 CG_InKnockDown
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 CG_InKnockDown
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_InKnockDown
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 CG_InKnockDown
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 108
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $1037
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 112
INDIRI4
NEI4 $1037
ADDRLP4 120
CNSTI4 -2049
ASGNI4
ADDRLP4 116
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
BANDI4
ADDRLP4 116
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
BANDI4
EQI4 $1037
ADDRLP4 124
CNSTI4 788
ADDRLP4 116
INDIRP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 124
INDIRI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
BANDI4
ADDRLP4 124
INDIRI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
BANDI4
EQI4 $1037
line 2385
;2355:		!BG_SpinningSaberAnim( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
;2356:		!BG_SpinningSaberAnim( cent->currentState.torsoAnim&~ANIM_TOGGLEBIT ) &&
;2357:		!BG_InSpecialJump( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
;2358:		!BG_InSpecialJump( cent->currentState.torsoAnim&~ANIM_TOGGLEBIT ) &&
;2359:		!BG_InDeathAnim(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) &&
;2360:		!BG_InDeathAnim(cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2361:		!CG_InRoll(cent) &&
;2362:		!CG_InRollAnim(cent) &&
;2363:		!BG_SaberInSpecial(cent->currentState.saberMove) &&
;2364:		!BG_SaberInSpecialAttack(cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2365:		!BG_SaberInSpecialAttack(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) &&
;2366:
;2367:		!CG_InKnockDown(cent->currentState.torsoAnim) &&
;2368:		!CG_InKnockDown(cent->currentState.legsAnim) &&
;2369:		!CG_InKnockDown(cgs.clientinfo[cent->currentState.number].torsoAnim) &&
;2370:		!CG_InKnockDown(cgs.clientinfo[cent->currentState.number].legsAnim) &&
;2371:
;2372:		!BG_FlippingAnim( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2373:		!BG_SpinningSaberAnim( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2374:		!BG_SpinningSaberAnim( cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT ) &&
;2375:		!BG_InSpecialJump( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2376:		!BG_InSpecialJump( cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT ) &&
;2377:		!BG_InDeathAnim(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) &&
;2378:		!BG_InDeathAnim(cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT) &&
;2379:		!BG_SaberInSpecialAttack(cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT) &&
;2380:		!BG_SaberInSpecialAttack(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) &&
;2381:
;2382:		!(cent->currentState.eFlags & EF_DEAD) &&
;2383:		(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) != (cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2384:		(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) != (cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT))
;2385:	{//FIXME: no need to do this if legs and torso on are same frame
line 2392
;2386:		//adjust for motion offset
;2387:		mdxaBone_t	boltMatrix;
;2388:		vec3_t		motionFwd, motionAngles;
;2389:		vec3_t		motionRt, tempAng;
;2390:		int			ang;
;2391:
;2392:		trap_G2API_GetBoltMatrix_NoRecNoRot( cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_motion, &boltMatrix, vec3_origin, cent->lerpOrigin, cg.time, /*cgs.gameModels*/0, cent->modelScale);
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 228
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+524
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 228
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 228
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix_NoRecNoRot
CALLI4
pop
line 2393
;2393:		trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_Y, motionFwd );
ADDRLP4 144
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 2395
;2394:
;2395:		vectoangles( motionFwd, motionAngles );
ADDRLP4 192
ARGP4
ADDRLP4 132
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2397
;2396:
;2397:		trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_X, motionRt );
ADDRLP4 144
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 204
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 2398
;2398:		vectoangles( motionRt, tempAng );
ADDRLP4 204
ARGP4
ADDRLP4 216
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2399
;2399:		motionAngles[ROLL] = -tempAng[PITCH];
ADDRLP4 132+8
ADDRLP4 216
INDIRF4
NEGF4
ASGNF4
line 2401
;2400:
;2401:		for ( ang = 0; ang < 3; ang++ )
ADDRLP4 128
CNSTI4 0
ASGNI4
LABELV $1069
line 2402
;2402:		{
line 2403
;2403:			viewAngles[ang] = AngleNormalize180( viewAngles[ang] - AngleNormalize180( motionAngles[ang] ) );
ADDRLP4 232
ADDRLP4 128
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 232
INDIRI4
ADDRLP4 132
ADDP4
INDIRF4
ARGF4
ADDRLP4 236
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 240
ADDRLP4 232
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
INDIRF4
ADDRLP4 236
INDIRF4
SUBF4
ARGF4
ADDRLP4 244
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 240
INDIRP4
ADDRLP4 244
INDIRF4
ASGNF4
line 2404
;2404:		}
LABELV $1070
line 2401
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 3
LTI4 $1069
line 2405
;2405:	}
LABELV $1037
line 2430
;2406:
;2407:	//Keep it within 80 degrees of the leg angles, on either side. Will hopefully prevent spine twisting.
;2408:	/*
;2409:	if (legDif > 0)
;2410:	{
;2411:		legDif += 80;
;2412:	}
;2413:	else
;2414:	{
;2415:		legDif -= 80;
;2416:	}
;2417:	
;2418:	if (legDif < 0 && viewAngles[YAW] < legDif)
;2419:	{
;2420:		viewAngles[YAW] = legDif;
;2421:	}
;2422:	if (legDif > 0 && viewAngles[YAW] > legDif)
;2423:	{
;2424:		viewAngles[YAW] = legDif;
;2425:	}
;2426:	*/
;2427:		
;2428:	//distribute the angles differently up the spine
;2429:	//NOTE: each of these distributions must add up to 1.0f
;2430:	thoracicAngles[PITCH] = viewAngles[PITCH]*0.20f;
ADDRFP4 12
INDIRP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2431
;2431:	llAngles[PITCH] = viewAngles[PITCH]*0.40f;
ADDRFP4 20
INDIRP4
CNSTF4 1053609165
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2432
;2432:	ulAngles[PITCH] = viewAngles[PITCH]*0.40f;
ADDRFP4 16
INDIRP4
CNSTF4 1053609165
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2434
;2433:
;2434:	thoracicAngles[YAW] = viewAngles[YAW]*0.20f;
ADDRLP4 128
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2435
;2435:	ulAngles[YAW] = viewAngles[YAW]*0.35f;
ADDRLP4 132
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2436
;2436:	llAngles[YAW] = viewAngles[YAW]*0.45f;
ADDRLP4 136
CNSTI4 4
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2438
;2437:
;2438:	thoracicAngles[ROLL] = viewAngles[ROLL]*0.20f;
ADDRLP4 140
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2439
;2439:	ulAngles[ROLL] = viewAngles[ROLL]*0.35f;
ADDRLP4 144
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2440
;2440:	llAngles[ROLL] = viewAngles[ROLL]*0.45f;
ADDRLP4 148
CNSTI4 8
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2441
;2441:}
LABELV $1036
endproc CG_G2ClientSpineAngles 248 36
data
align 4
LABELV $1074
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
lit
align 4
LABELV $1075
byte 4 0
byte 4 0
byte 4 0
code
proc CG_G2PlayerAngles 1460 44
line 2443
;2442:
;2443:static void CG_G2PlayerAngles( centity_t *cent, vec3_t legs[3], vec3_t legsAngles){
line 2451
;2444:	vec3_t		torsoAngles, headAngles;
;2445:	float		dest;
;2446:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;2447:	vec3_t		velocity;
;2448:	float		speed; //, speed_dif, speed_desired;
;2449:	int			dir;
;2450:	vec3_t		velPos, velAng;
;2451:	int			adddir = 0;
ADDRLP4 120
CNSTI4 0
ASGNI4
line 2453
;2452:	float		dif;
;2453:	float		degrees_negative = 0;
ADDRLP4 108
CNSTF4 0
ASGNF4
line 2454
;2454:	float		degrees_positive = 0;
ADDRLP4 112
CNSTF4 0
ASGNF4
line 2455
;2455:	vec3_t		ulAngles, llAngles, viewAngles, angles, thoracicAngles = {0,0,0};
ADDRLP4 96
ADDRGP4 $1075
INDIRB
ASGNB 12
line 2457
;2456:
;2457:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2458
;2458:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 148
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 148
INDIRF4
ASGNF4
line 2459
;2459:	VectorClear( legsAngles );
ADDRLP4 152
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 156
CNSTF4 0
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 156
INDIRF4
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 156
INDIRF4
ASGNF4
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRF4
ASGNF4
line 2460
;2460:	VectorClear( torsoAngles );
ADDRLP4 160
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 160
INDIRF4
ASGNF4
line 2465
;2461:
;2462:	// --------- yaw -------------
;2463:
;2464:	// allow yaw to drift a bit
;2465:	if ((( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != BOTH_STAND1) || 
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
CNSTI4 -2049
ASGNI4
ADDRLP4 164
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
BANDI4
CNSTI4 571
NEI4 $1082
ADDRLP4 164
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
BANDI4
ADDRLP4 164
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
EQI4 $1080
LABELV $1082
line 2467
;2466:			( cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT ) != WeaponReadyAnim[cent->currentState.weapon]  ) 
;2467:	{
line 2469
;2468:		// if not standing still, always point all in the same direction
;2469:		cent->pe.torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 1
ASGNI4
line 2470
;2470:		cent->pe.torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 1
ASGNI4
line 2471
;2471:		cent->pe.legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTI4 1
ASGNI4
line 2472
;2472:	}
LABELV $1080
line 2475
;2473:
;2474:	// adjust legs for movement dir
;2475:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1083
line 2477
;2476:		// don't let dead bodies twitch
;2477:		dir = 0;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 2478
;2478:	} else {
ADDRGP4 $1084
JUMPV
LABELV $1083
line 2479
;2479:		dir = cent->currentState.angles2[YAW];
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 2480
;2480:		if ( dir < 0 || dir > 7 ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
LTI4 $1087
ADDRLP4 88
INDIRI4
CNSTI4 7
LEI4 $1085
LABELV $1087
line 2481
;2481:			CG_Error( "Bad player movement angle" );
ADDRGP4 $1088
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2482
;2482:		}
LABELV $1085
line 2483
;2483:	}
LABELV $1084
line 2484
;2484:	if (!cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1089
line 2485
;2485:	{
line 2486
;2486:		torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 88
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1074
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2487
;2487:	}
ADDRGP4 $1090
JUMPV
LABELV $1089
line 2489
;2488:	else
;2489:	{
line 2490
;2490:		torsoAngles[YAW] = headAngles[YAW];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2491
;2491:	}
LABELV $1090
line 2498
;2492:
;2493:	// torso
;2494://	CG_SwingAngles( torsoAngles[YAW], 25, 90, /*cg_swingSpeed.value*/ 0.3, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing );
;2495://	torsoAngles[YAW] = cent->pe.torso.yawAngle;
;2496:
;2497:	//for now, turn torso instantly and let the legs swing to follow
;2498:	cent->pe.torso.yawAngle = torsoAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 2502
;2499:
;2500:	// --------- pitch -------------
;2501:
;2502:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 2503
;2503:	speed = VectorNormalize( velocity );
ADDRLP4 36
ARGP4
ADDRLP4 172
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 172
INDIRF4
ASGNF4
line 2505
;2504:
;2505:	if (!speed)
ADDRLP4 84
INDIRF4
CNSTF4 0
NEF4 $1096
line 2506
;2506:	{
line 2507
;2507:		torsoAngles[YAW] = headAngles[YAW];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2508
;2508:	}
LABELV $1096
line 2511
;2509:
;2510:	// only show a fraction of the pitch angle in the torso
;2511:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $1100
line 2512
;2512:		dest = (-360 + headAngles[PITCH]) * 0.75;
ADDRLP4 116
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 2513
;2513:	} else {
ADDRGP4 $1101
JUMPV
LABELV $1100
line 2514
;2514:		dest = headAngles[PITCH] * 0.75;
ADDRLP4 116
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 2515
;2515:	}
LABELV $1101
line 2516
;2516:	CG_SwingAngles( dest, 15, 30, 0.1, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
ADDRLP4 116
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 736
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLF4
pop
line 2517
;2517:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRF4
ASGNF4
line 2545
;2518:
;2519:	// --------- roll -------------
;2520:
;2521:
;2522:	// lean towards the direction of travel
;2523:
;2524:	/*
;2525:	speed_desired = cent->currentState.speed/4;
;2526:
;2527:	if (!speed)
;2528:	{
;2529:		speed_dif = 0;
;2530:	}
;2531:	else
;2532:	{
;2533:		speed_dif = (speed/speed_desired);
;2534:	}
;2535:
;2536:	if (speed_dif > 1)
;2537:	{
;2538:		speed_dif = 1;
;2539:	}
;2540:	else if (speed_dif < 0)
;2541:	{
;2542:		speed_dif = 0;
;2543:	}
;2544:	*/
;2545:	if ( speed ) {
ADDRLP4 84
INDIRF4
CNSTF4 0
EQF4 $1102
line 2549
;2546:		vec3_t	axis[3];
;2547:		float	side;
;2548:
;2549:		speed *= 0.05;
ADDRLP4 84
CNSTF4 1028443341
ADDRLP4 84
INDIRF4
MULF4
ASGNF4
line 2551
;2550:
;2551:		AnglesToAxis( legsAngles, axis );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2552
;2552:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 216
ADDRLP4 84
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 180+12
INDIRF4
MULF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 180+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 180+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 2553
;2553:		legsAngles[ROLL] -= side;
ADDRLP4 220
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 220
INDIRP4
ADDRLP4 220
INDIRP4
INDIRF4
ADDRLP4 216
INDIRF4
SUBF4
ASGNF4
line 2555
;2554:
;2555:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 216
ADDRLP4 84
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 180+4
INDIRF4
MULF4
ADDF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 180+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 2556
;2556:		legsAngles[PITCH] += side;
ADDRLP4 224
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 216
INDIRF4
ADDF4
ASGNF4
line 2557
;2557:	}
LABELV $1102
line 2562
;2558:
;2559:	//legsAngles[YAW] = headAngles[YAW] + (movementOffsets[ dir ]*speed_dif);
;2560:
;2561:	//rww - crazy velocity-based leg angle calculation
;2562:	legsAngles[YAW] = headAngles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2563
;2563:	velPos[0] = cent->lerpOrigin[0] + velocity[0];
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
line 2564
;2564:	velPos[1] = cent->lerpOrigin[1] + velocity[1];
ADDRLP4 48+4
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
line 2565
;2565:	velPos[2] = cent->lerpOrigin[2];// + velocity[2];
ADDRLP4 48+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ASGNF4
line 2567
;2566:
;2567:	if (cent->currentState.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1119
line 2568
;2568:	{ //off the ground, no direction-based leg angles
line 2569
;2569:		VectorCopy(cent->lerpOrigin, velPos);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2570
;2570:	}
LABELV $1119
line 2572
;2571:
;2572:	VectorSubtract(cent->lerpOrigin, velPos, velAng);
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 180
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 180
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 48+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 48+8
INDIRF4
SUBF4
ASGNF4
line 2574
;2573:
;2574:	if (!VectorCompare(velAng, vec3_origin))
ADDRLP4 60
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 184
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
NEI4 $1125
line 2575
;2575:	{
line 2576
;2576:		vectoangles(velAng, velAng);
ADDRLP4 60
ARGP4
ADDRLP4 60
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2578
;2577:
;2578:		if (velAng[YAW] <= legsAngles[YAW])
ADDRLP4 60+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
GTF4 $1127
line 2579
;2579:		{
line 2580
;2580:			degrees_negative = (legsAngles[YAW] - velAng[YAW]);
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 60+4
INDIRF4
SUBF4
ASGNF4
line 2581
;2581:			degrees_positive = (360 - legsAngles[YAW]) + velAng[YAW];
ADDRLP4 112
CNSTF4 1135869952
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ADDRLP4 60+4
INDIRF4
ADDF4
ASGNF4
line 2582
;2582:		}
ADDRGP4 $1128
JUMPV
LABELV $1127
line 2584
;2583:		else
;2584:		{
line 2585
;2585:			degrees_negative = legsAngles[YAW] + (360 - velAng[YAW]);
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1135869952
ADDRLP4 60+4
INDIRF4
SUBF4
ADDF4
ASGNF4
line 2586
;2586:			degrees_positive = (velAng[YAW] - legsAngles[YAW]);
ADDRLP4 112
ADDRLP4 60+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2587
;2587:		}
LABELV $1128
line 2589
;2588:
;2589:		if (degrees_negative < degrees_positive)
ADDRLP4 108
INDIRF4
ADDRLP4 112
INDIRF4
GEF4 $1134
line 2590
;2590:		{
line 2591
;2591:			dif = degrees_negative;
ADDRLP4 92
ADDRLP4 108
INDIRF4
ASGNF4
line 2592
;2592:			adddir = 0;
ADDRLP4 120
CNSTI4 0
ASGNI4
line 2593
;2593:		}
ADDRGP4 $1135
JUMPV
LABELV $1134
line 2595
;2594:		else
;2595:		{
line 2596
;2596:			dif = degrees_positive;
ADDRLP4 92
ADDRLP4 112
INDIRF4
ASGNF4
line 2597
;2597:			adddir = 1;
ADDRLP4 120
CNSTI4 1
ASGNI4
line 2598
;2598:		}
LABELV $1135
line 2600
;2599:
;2600:		if (dif > 90)
ADDRLP4 92
INDIRF4
CNSTF4 1119092736
LEF4 $1136
line 2601
;2601:		{
line 2602
;2602:			dif = (180 - dif);
ADDRLP4 92
CNSTF4 1127481344
ADDRLP4 92
INDIRF4
SUBF4
ASGNF4
line 2603
;2603:		}
LABELV $1136
line 2605
;2604:
;2605:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1138
line 2606
;2606:		{
line 2607
;2607:			if (dif > 360)
ADDRLP4 92
INDIRF4
CNSTF4 1135869952
LEF4 $1139
line 2608
;2608:			{
line 2609
;2609:				dif = 360;
ADDRLP4 92
CNSTF4 1135869952
ASGNF4
line 2610
;2610:			}
line 2611
;2611:		}
ADDRGP4 $1139
JUMPV
LABELV $1138
line 2613
;2612:		else
;2613:		{
line 2614
;2614:			if (dif > 60)
ADDRLP4 92
INDIRF4
CNSTF4 1114636288
LEF4 $1142
line 2615
;2615:			{
line 2616
;2616:				dif = 60;
ADDRLP4 92
CNSTF4 1114636288
ASGNF4
line 2617
;2617:			}
LABELV $1142
line 2618
;2618:		}
LABELV $1139
line 2621
;2619:
;2620:		//Slight hack for when playing is running backward
;2621:		if (dir == 3 || dir == 5)
ADDRLP4 88
INDIRI4
CNSTI4 3
EQI4 $1146
ADDRLP4 88
INDIRI4
CNSTI4 5
NEI4 $1144
LABELV $1146
line 2622
;2622:		{
line 2623
;2623:			dif = -dif;
ADDRLP4 92
ADDRLP4 92
INDIRF4
NEGF4
ASGNF4
line 2624
;2624:		}
LABELV $1144
line 2626
;2625:
;2626:		if (adddir)
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $1147
line 2627
;2627:		{
line 2628
;2628:			legsAngles[YAW] -= dif;
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ASGNF4
line 2629
;2629:		}
ADDRGP4 $1148
JUMPV
LABELV $1147
line 2631
;2630:		else
;2631:		{
line 2632
;2632:			legsAngles[YAW] += dif;
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 92
INDIRF4
ADDF4
ASGNF4
line 2633
;2633:		}
LABELV $1148
line 2634
;2634:	}
LABELV $1125
line 2636
;2635:
;2636:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1149
line 2637
;2637:	{
line 2638
;2638:		cent->pe.legs.yawSwingDif = CG_SwingAnglesATST( cent, legsAngles[YAW], 40, 360, /*cg_swingSpeed.value*/ 0.05, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1135869952
ARGF4
CNSTF4 1028443341
ARGF4
ADDRLP4 188
INDIRP4
CNSTI4 664
ADDP4
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 668
ADDP4
ARGP4
ADDRLP4 192
ADDRGP4 CG_SwingAnglesATST
CALLF4
ASGNF4
ADDRLP4 188
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 192
INDIRF4
ASGNF4
line 2639
;2639:	}
ADDRGP4 $1150
JUMPV
LABELV $1149
line 2641
;2640:	else
;2641:	{
line 2642
;2642:		if (!cg_swingAngles.integer)
ADDRGP4 cg_swingAngles+12
INDIRI4
CNSTI4 0
NEI4 $1151
line 2643
;2643:		{
line 2644
;2644:			cent->pe.legs.yawAngle = legsAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 2645
;2645:		}
ADDRGP4 $1152
JUMPV
LABELV $1151
line 2647
;2646:		else
;2647:		{
line 2648
;2648:			CG_SwingAngles( legsAngles[YAW], 40, 90, /*cg_swingSpeed.value*/ 0.3, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 664
ADDP4
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 668
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLF4
pop
line 2649
;2649:		}
LABELV $1152
line 2650
;2650:	}
LABELV $1150
line 2651
;2651:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRF4
ASGNF4
line 2654
;2652:
;2653:	// pain twitch
;2654:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 2656
;2655:
;2656:	legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 2657
;2657:	torsoAngles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2659
;2658:
;2659:	VectorCopy(legsAngles, cent->turAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2661
;2660:
;2661:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1155
line 2662
;2662:	{
line 2663
;2663:		legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 2664
;2664:		legsAngles[PITCH] = 0;
ADDRFP4 8
INDIRP4
CNSTF4 0
ASGNF4
line 2665
;2665:	}
LABELV $1155
line 2668
;2666:
;2667:	// pull the angles back out of the hierarchial chain
;2668:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 2669
;2669:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 2671
;2670:
;2671:	legsAngles[PITCH] = 0;
ADDRFP4 8
INDIRP4
CNSTF4 0
ASGNF4
line 2673
;2672:
;2673:	AnglesToAxis( legsAngles, legs );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2676
;2674:	// we assume that model 0 is the player model.
;2675:
;2676:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1157
line 2677
;2677:	{
line 2680
;2678:		vec3_t flatYaw;
;2679:
;2680:		flatYaw[YAW] = 0;//cent->lerpAngles[YAW];
ADDRLP4 188+4
CNSTF4 0
ASGNF4
line 2681
;2681:		flatYaw[ROLL] = 0;
ADDRLP4 188+8
CNSTF4 0
ASGNF4
line 2682
;2682:		flatYaw[PITCH] = 0;
ADDRLP4 188
CNSTF4 0
ASGNF4
line 2683
;2683:		CG_G2SetBoneAngles(cent->ghoul2, 0, "pelvis", flatYaw, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 188
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
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2685
;2684:
;2685:		CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", torsoAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $1163
ARGP4
ADDRLP4 0
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
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2687
;2686:
;2687:		return;
ADDRGP4 $1073
JUMPV
LABELV $1157
line 2692
;2688:	}
;2689:
;2690://	trap_G2API_SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", torsoAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
;2691:
;2692:	VectorCopy( cent->lerpAngles, viewAngles );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2693
;2693:	viewAngles[YAW] = viewAngles[ROLL] = 0;
ADDRLP4 188
CNSTF4 0
ASGNF4
ADDRLP4 72+8
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 72+4
ADDRLP4 188
INDIRF4
ASGNF4
line 2694
;2694:	viewAngles[PITCH] *= 0.5;
ADDRLP4 72
CNSTF4 1056964608
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
line 2696
;2695:
;2696:	VectorSet( angles, 0, legsAngles[1], 0 );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 24+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 2698
;2697:
;2698:	angles[0] = legsAngles[0];
ADDRLP4 24
ADDRFP4 8
INDIRP4
INDIRF4
ASGNF4
line 2699
;2699:	if ( angles[0] > 30 )
ADDRLP4 24
INDIRF4
CNSTF4 1106247680
LEF4 $1170
line 2700
;2700:	{
line 2701
;2701:		angles[0] = 30;
ADDRLP4 24
CNSTF4 1106247680
ASGNF4
line 2702
;2702:	}
ADDRGP4 $1171
JUMPV
LABELV $1170
line 2703
;2703:	else if ( angles[0] < -30 )
ADDRLP4 24
INDIRF4
CNSTF4 3253731328
GEF4 $1172
line 2704
;2704:	{
line 2705
;2705:		angles[0] = -30;
ADDRLP4 24
CNSTF4 3253731328
ASGNF4
line 2706
;2706:	}
LABELV $1172
LABELV $1171
line 2710
;2707:
;2708://	VectorCopy(legsAngles, angles);
;2709:
;2710:	CG_G2ClientSpineAngles(cent, viewAngles, angles, thoracicAngles, ulAngles, llAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 CG_G2ClientSpineAngles
CALLV
pop
line 2712
;2711:
;2712:	if ( cent->currentState.otherEntityNum2 && !(cent->currentState.eFlags & EF_DEAD) )
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRLP4 192
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $1174
ADDRLP4 192
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 196
INDIRI4
NEI4 $1174
line 2713
;2713:	{ //using an emplaced gun
line 2714
;2714:		centity_t *empEnt = &cg_entities[cent->currentState.otherEntityNum2];
ADDRLP4 212
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
line 2717
;2715:		vec3_t headAng;
;2716:
;2717:		VectorClear(headAng);
ADDRLP4 216
CNSTF4 0
ASGNF4
ADDRLP4 200+8
ADDRLP4 216
INDIRF4
ASGNF4
ADDRLP4 200+4
ADDRLP4 216
INDIRF4
ASGNF4
ADDRLP4 200
ADDRLP4 216
INDIRF4
ASGNF4
line 2719
;2718:
;2719:		if (empEnt)
ADDRLP4 212
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1178
line 2720
;2720:		{
line 2723
;2721:			vec3_t dif, empOrg, originalAngle;
;2722:
;2723:			VectorCopy(cent->lerpAngles, originalAngle);
ADDRLP4 244
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2725
;2724:
;2725:			VectorCopy(empEnt->lerpOrigin, empOrg);
ADDRLP4 232
ADDRLP4 212
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2727
;2726:
;2727:			empOrg[2] += 32;
ADDRLP4 232+8
ADDRLP4 232+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2729
;2728:
;2729:			VectorSubtract(empOrg, cent->lerpOrigin, dif);
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
ADDRLP4 232
INDIRF4
ADDRLP4 256
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 220+4
ADDRLP4 232+4
INDIRF4
ADDRLP4 256
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 220+8
ADDRLP4 232+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2730
;2730:			VectorNormalize(dif);
ADDRLP4 220
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2731
;2731:			vectoangles(dif, dif);
ADDRLP4 220
ARGP4
ADDRLP4 220
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2733
;2732:			
;2733:			VectorCopy(dif, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 220
INDIRB
ASGNB 12
line 2735
;2734:
;2735:			VectorCopy(cent->lerpAngles, legsAngles);
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2737
;2736:
;2737:			VectorSubtract(originalAngle, cent->lerpAngles, headAng);
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
ADDRLP4 244
INDIRF4
ADDRLP4 260
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200+4
ADDRLP4 244+4
INDIRF4
ADDRLP4 260
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200+8
ADDRLP4 244+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2739
;2738:
;2739:			headAng[PITCH] /= 3; //scale it down so that you can't bend your neck all the way back
ADDRLP4 200
ADDRLP4 200
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 2740
;2740:		}
ADDRGP4 $1179
JUMPV
LABELV $1178
line 2742
;2741:		else
;2742:		{
line 2743
;2743:			VectorClear(cent->lerpAngles);
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
CNSTF4 0
ASGNF4
ADDRLP4 220
INDIRP4
CNSTI4 948
ADDP4
ADDRLP4 224
INDIRF4
ASGNF4
ADDRLP4 220
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 224
INDIRF4
ASGNF4
ADDRLP4 220
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 224
INDIRF4
ASGNF4
line 2744
;2744:			VectorClear(legsAngles);
ADDRLP4 228
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 232
CNSTF4 0
ASGNF4
ADDRLP4 228
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 232
INDIRF4
ASGNF4
ADDRLP4 228
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 232
INDIRF4
ASGNF4
ADDRLP4 228
INDIRP4
ADDRLP4 232
INDIRF4
ASGNF4
line 2745
;2745:		}
LABELV $1179
line 2747
;2746:
;2747:		AnglesToAxis( legsAngles, legs );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2749
;2748:
;2749:		CG_G2SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 220
CNSTI4 0
ASGNI4
ADDRLP4 220
INDIRI4
ARGI4
ADDRGP4 $303
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
ADDRLP4 220
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2750
;2750:		CG_G2SetBoneAngles(cent->ghoul2, 0, "lower_lumbar", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 224
CNSTI4 0
ASGNI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRGP4 $312
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
ADDRLP4 224
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2751
;2751:		CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRLP4 228
INDIRI4
ARGI4
ADDRGP4 $1163
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
ADDRLP4 228
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2753
;2752:
;2753:		CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", headAng, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 232
CNSTI4 0
ASGNI4
ADDRLP4 232
INDIRI4
ARGI4
ADDRGP4 $1195
ARGP4
ADDRLP4 200
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
ADDRLP4 232
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2754
;2754:	}
ADDRGP4 $1175
JUMPV
LABELV $1174
line 2756
;2755:	else
;2756:	{
line 2757
;2757:		CG_G2SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 124
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
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2758
;2758:		CG_G2SetBoneAngles(cent->ghoul2, 0, "lower_lumbar", llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 136
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
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2759
;2759:		CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", thoracicAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 $1163
ARGP4
ADDRLP4 96
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
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2761
;2760:
;2761:		if (cg_duelHeadAngles.integer && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRGP4 cg_duelHeadAngles+12
INDIRI4
ADDRLP4 212
INDIRI4
EQI4 $1204
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 212
INDIRI4
NEI4 $1204
line 2762
;2762:		{
line 2763
;2763:			if ( !BG_FlippingAnim( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 216
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 220
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 224
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 228
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 232
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 236
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 240
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
ADDRGP4 CG_InRoll
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 248
ADDRGP4 CG_InRollAnim
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 252
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 256
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 260
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 264
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 268
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 272
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 276
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 280
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 284
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 288
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 292
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 296
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $1207
line 2785
;2764:				!BG_SpinningSaberAnim( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
;2765:				!BG_SpinningSaberAnim( cent->currentState.torsoAnim&~ANIM_TOGGLEBIT ) &&
;2766:				!BG_InSpecialJump( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
;2767:				!BG_InSpecialJump( cent->currentState.torsoAnim&~ANIM_TOGGLEBIT ) &&
;2768:				!BG_InDeathAnim(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) &&
;2769:				!BG_InDeathAnim(cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2770:				!CG_InRoll(cent) &&
;2771:				!CG_InRollAnim(cent) &&
;2772:				!BG_SaberInSpecial(cent->currentState.saberMove) &&
;2773:				!BG_SaberInSpecialAttack(cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2774:				!BG_SaberInSpecialAttack(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) &&
;2775:
;2776:				!BG_FlippingAnim( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2777:				!BG_SpinningSaberAnim( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2778:				!BG_SpinningSaberAnim( cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT ) &&
;2779:				!BG_InSpecialJump( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2780:				!BG_InSpecialJump( cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT ) &&
;2781:				!BG_InDeathAnim(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) &&
;2782:				!BG_InDeathAnim(cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT) &&
;2783:				!BG_SaberInSpecialAttack(cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT) &&
;2784:				!BG_SaberInSpecialAttack(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) )
;2785:			{ //use similar check to spine correction, these are the "safe" anims to be in for twisting around
line 2787
;2786:				vec3_t headAngles;
;2787:				int duelClient = -1;
ADDRLP4 300
CNSTI4 -1
ASGNI4
line 2789
;2788:
;2789:				if (cgs.gametype == GT_TOURNAMENT && (cent->currentState.number == cgs.duelist1 || cent->currentState.number == cgs.duelist2))
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $1227
ADDRLP4 316
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 316
INDIRI4
ADDRGP4 cgs+36340
INDIRI4
EQI4 $1232
ADDRLP4 316
INDIRI4
ADDRGP4 cgs+36344
INDIRI4
NEI4 $1227
LABELV $1232
line 2790
;2790:				{
line 2791
;2791:					if (cgs.duelist1 >= 0 && cgs.duelist1 < MAX_CLIENTS &&
ADDRLP4 320
CNSTI4 0
ASGNI4
ADDRGP4 cgs+36340
INDIRI4
ADDRLP4 320
INDIRI4
LTI4 $1228
ADDRLP4 324
CNSTI4 32
ASGNI4
ADDRGP4 cgs+36340
INDIRI4
ADDRLP4 324
INDIRI4
GEI4 $1228
ADDRGP4 cgs+36344
INDIRI4
ADDRLP4 320
INDIRI4
LTI4 $1228
ADDRGP4 cgs+36344
INDIRI4
ADDRLP4 324
INDIRI4
GEI4 $1228
line 2793
;2792:						cgs.duelist2 >= 0 && cgs.duelist2 < MAX_CLIENTS)
;2793:					{
line 2794
;2794:						if (cent->currentState.number == cgs.duelist1)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cgs+36340
INDIRI4
NEI4 $1239
line 2795
;2795:						{
line 2796
;2796:							duelClient = cgs.duelist2;
ADDRLP4 300
ADDRGP4 cgs+36344
INDIRI4
ASGNI4
line 2797
;2797:						}
ADDRGP4 $1228
JUMPV
LABELV $1239
line 2799
;2798:						else
;2799:						{
line 2800
;2800:							duelClient = cgs.duelist1;
ADDRLP4 300
ADDRGP4 cgs+36340
INDIRI4
ASGNI4
line 2801
;2801:						}
line 2802
;2802:					}
line 2803
;2803:				}
ADDRGP4 $1228
JUMPV
LABELV $1227
line 2804
;2804:				else if (cg.snap && cg.snap->ps.duelInProgress)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1244
ADDRGP4 cg+36
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1244
line 2805
;2805:				{
line 2806
;2806:					if (cent->currentState.number == cg.snap->ps.duelIndex)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
NEI4 $1248
line 2807
;2807:					{
line 2808
;2808:						duelClient = cg.snap->ps.clientNum;
ADDRLP4 300
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 2809
;2809:					}
ADDRGP4 $1249
JUMPV
LABELV $1248
line 2810
;2810:					else if (cent->currentState.number == cg.snap->ps.clientNum)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1252
line 2811
;2811:					{
line 2812
;2812:						duelClient = cg.snap->ps.duelIndex;
ADDRLP4 300
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ASGNI4
line 2813
;2813:					}
LABELV $1252
LABELV $1249
line 2814
;2814:				}
LABELV $1244
LABELV $1228
line 2816
;2815:
;2816:				if (duelClient != -1)
ADDRLP4 300
INDIRI4
CNSTI4 -1
EQI4 $1256
line 2817
;2817:				{
line 2820
;2818:					trace_t tr;
;2819:
;2820:					CG_Trace( &tr, cent->lerpOrigin, NULL, NULL, cg_entities[duelClient].lerpOrigin, cent->currentState.number, MASK_PLAYERSOLID );
ADDRLP4 320
ARGP4
ADDRLP4 1400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1400
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 1404
CNSTP4 0
ASGNP4
ADDRLP4 1404
INDIRP4
ARGP4
ADDRLP4 1404
INDIRP4
ARGP4
CNSTI4 1920
ADDRLP4 300
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
ARGP4
ADDRLP4 1400
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2822
;2821:
;2822:					if (tr.fraction == 1.0 ||
ADDRLP4 320+8
INDIRF4
CNSTF4 1065353216
EQF4 $1263
ADDRLP4 320+52
INDIRI4
ADDRLP4 300
INDIRI4
NEI4 $1259
LABELV $1263
line 2824
;2823:						tr.entityNum == duelClient)
;2824:					{
line 2825
;2825:						centity_t *duelCEnt = &cg_entities[duelClient];
ADDRLP4 1408
CNSTI4 1920
ADDRLP4 300
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2828
;2826:						vec3_t headSub;
;2827:
;2828:						VectorSubtract(duelCEnt->lerpOrigin, cent->lerpOrigin, headSub);
ADDRLP4 1424
ADDRLP4 1408
INDIRP4
ASGNP4
ADDRLP4 1428
CNSTI4 928
ASGNI4
ADDRLP4 1432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1412
ADDRLP4 1424
INDIRP4
ADDRLP4 1428
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1432
INDIRP4
ADDRLP4 1428
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1436
CNSTI4 932
ASGNI4
ADDRLP4 1412+4
ADDRLP4 1424
INDIRP4
ADDRLP4 1436
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1432
INDIRP4
ADDRLP4 1436
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1440
CNSTI4 936
ASGNI4
ADDRLP4 1412+8
ADDRLP4 1408
INDIRP4
ADDRLP4 1440
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 1440
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2829
;2829:						vectoangles(headSub, headSub);
ADDRLP4 1412
ARGP4
ADDRLP4 1412
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2831
;2830:
;2831:						headAngles[ROLL] = AngleSubtract(headSub[ROLL], cent->lerpAngles[ROLL]);
ADDRLP4 1412+8
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRF4
ARGF4
ADDRLP4 1444
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 304+8
ADDRLP4 1444
INDIRF4
ASGNF4
line 2832
;2832:						headAngles[YAW] = AngleSubtract(headSub[YAW], cent->lerpAngles[YAW]);
ADDRLP4 1412+4
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ARGF4
ADDRLP4 1448
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 304+4
ADDRLP4 1448
INDIRF4
ASGNF4
line 2834
;2833:
;2834:						if (headAngles[YAW] > 55)
ADDRLP4 304+4
INDIRF4
CNSTF4 1113325568
LEF4 $1270
line 2835
;2835:						{
line 2836
;2836:							headAngles[YAW] = 55;
ADDRLP4 304+4
CNSTF4 1113325568
ASGNF4
line 2837
;2837:						}
LABELV $1270
line 2838
;2838:						if (headAngles[YAW] < -55)
ADDRLP4 304+4
INDIRF4
CNSTF4 3260809216
GEF4 $1274
line 2839
;2839:						{
line 2840
;2840:							headAngles[YAW] = -55;
ADDRLP4 304+4
CNSTF4 3260809216
ASGNF4
line 2841
;2841:						}
LABELV $1274
line 2843
;2842:
;2843:						VectorCopy( cent->lerpAngles, viewAngles );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2844
;2844:						viewAngles[YAW] = viewAngles[ROLL] = 0;
ADDRLP4 1452
CNSTF4 0
ASGNF4
ADDRLP4 72+8
ADDRLP4 1452
INDIRF4
ASGNF4
ADDRLP4 72+4
ADDRLP4 1452
INDIRF4
ASGNF4
line 2845
;2845:						viewAngles[PITCH] *= 0.5;
ADDRLP4 72
CNSTF4 1056964608
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
line 2847
;2846:
;2847:						headAngles[PITCH] = AngleSubtract(headSub[PITCH], viewAngles[PITCH]);
ADDRLP4 1412
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 1456
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 304
ADDRLP4 1456
INDIRF4
ASGNF4
line 2848
;2848:						if (headAngles[PITCH] > 16)
ADDRLP4 304
INDIRF4
CNSTF4 1098907648
LEF4 $1280
line 2849
;2849:						{
line 2850
;2850:							headAngles[PITCH] = 16;
ADDRLP4 304
CNSTF4 1098907648
ASGNF4
line 2851
;2851:						}
LABELV $1280
line 2852
;2852:						if (headAngles[PITCH] < -16)
ADDRLP4 304
INDIRF4
CNSTF4 3246391296
GEF4 $1282
line 2853
;2853:						{
line 2854
;2854:							headAngles[PITCH] = -16;
ADDRLP4 304
CNSTF4 3246391296
ASGNF4
line 2855
;2855:						}
LABELV $1282
line 2856
;2856:						headAngles[PITCH] += 6;
ADDRLP4 304
ADDRLP4 304
INDIRF4
CNSTF4 1086324736
ADDF4
ASGNF4
line 2857
;2857:					}
ADDRGP4 $1257
JUMPV
LABELV $1259
line 2859
;2858:					else
;2859:					{
line 2860
;2860:						VectorClear(headAngles);
ADDRLP4 1408
CNSTF4 0
ASGNF4
ADDRLP4 304+8
ADDRLP4 1408
INDIRF4
ASGNF4
ADDRLP4 304+4
ADDRLP4 1408
INDIRF4
ASGNF4
ADDRLP4 304
ADDRLP4 1408
INDIRF4
ASGNF4
line 2861
;2861:					}
line 2862
;2862:				}
ADDRGP4 $1257
JUMPV
LABELV $1256
line 2864
;2863:				else
;2864:				{
line 2865
;2865:					VectorClear(headAngles);
ADDRLP4 320
CNSTF4 0
ASGNF4
ADDRLP4 304+8
ADDRLP4 320
INDIRF4
ASGNF4
ADDRLP4 304+4
ADDRLP4 320
INDIRF4
ASGNF4
ADDRLP4 304
ADDRLP4 320
INDIRF4
ASGNF4
line 2866
;2866:				}
LABELV $1257
line 2868
;2867:
;2868:				CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", headAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 320
CNSTI4 0
ASGNI4
ADDRLP4 320
INDIRI4
ARGI4
ADDRGP4 $1195
ARGP4
ADDRLP4 304
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
ADDRLP4 320
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2869
;2869:			}
ADDRGP4 $1205
JUMPV
LABELV $1207
line 2871
;2870:			else
;2871:			{
line 2872
;2872:				VectorClear(headAngles);
ADDRLP4 300
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 300
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 300
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 300
INDIRF4
ASGNF4
line 2873
;2873:				CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", headAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 304
CNSTI4 0
ASGNI4
ADDRLP4 304
INDIRI4
ARGI4
ADDRGP4 $1195
ARGP4
ADDRLP4 12
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
ADDRLP4 304
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2874
;2874:			}
line 2875
;2875:		}
ADDRGP4 $1205
JUMPV
LABELV $1204
line 2877
;2876:		else
;2877:		{
line 2878
;2878:			CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 216
CNSTI4 0
ASGNI4
ADDRLP4 216
INDIRI4
ARGI4
ADDRGP4 $1195
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
ADDRLP4 216
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2879
;2879:		}
LABELV $1205
line 2880
;2880:	}
LABELV $1175
line 2883
;2881:
;2882:	//trap_G2API_SetBoneAngles(cent->ghoul2, 0, "cranium", headAngles, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, cgs.gameModels, 0, cg.time); 
;2883:}
LABELV $1073
endproc CG_G2PlayerAngles 1460 44
proc CG_HasteTrail 40 48
line 2891
;2884://==========================================================================
;2885:
;2886:/*
;2887:===============
;2888:CG_HasteTrail
;2889:===============
;2890:*/
;2891:static void CG_HasteTrail( centity_t *cent ) {
line 2896
;2892:	localEntity_t	*smoke;
;2893:	vec3_t			origin;
;2894:	int				anim;
;2895:
;2896:	if ( cent->trailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $1297
line 2897
;2897:		return;
ADDRGP4 $1296
JUMPV
LABELV $1297
line 2899
;2898:	}
;2899:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2900
;2900:	if ( anim != BOTH_RUN1 && anim != BOTH_RUNBACK1 ) {
ADDRLP4 12
INDIRI4
CNSTI4 833
EQI4 $1300
ADDRLP4 12
INDIRI4
CNSTI4 854
EQI4 $1300
line 2901
;2901:		return;
ADDRGP4 $1296
JUMPV
LABELV $1300
line 2904
;2902:	}
;2903:
;2904:	cent->trailTime += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2905
;2905:	if ( cent->trailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
GEI4 $1302
line 2906
;2906:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2907
;2907:	}
LABELV $1302
line 2909
;2908:
;2909:	VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2910
;2910:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 2912
;2911:
;2912:	smoke = CG_SmokePuff( origin, vec3_origin, 
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1090519040
ARGF4
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 cgs+70296+476
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 2922
;2913:				  8, 
;2914:				  1, 1, 1, 1,
;2915:				  500, 
;2916:				  cg.time,
;2917:				  0,
;2918:				  0,
;2919:				  cgs.media.hastePuffShader );
;2920:
;2921:	// use the optimized local entity add
;2922:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 9
ASGNI4
line 2923
;2923:}
LABELV $1296
endproc CG_HasteTrail 40 48
proc CG_PlayerFlag 368 36
line 3009
;2924:
;2925:/*
;2926:===============
;2927:CG_DustTrail
;2928:===============
;2929:*/
;2930:/*
;2931:static void CG_DustTrail( centity_t *cent ) {
;2932:	int				anim;
;2933:	localEntity_t	*dust;
;2934:	vec3_t end, vel;
;2935:	trace_t tr;
;2936:
;2937:	if (!cg_enableDust.integer)
;2938:		return;
;2939:
;2940:	if ( cent->dustTrailTime > cg.time ) {
;2941:		return;
;2942:	}
;2943:
;2944:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
;2945:	if ( anim != LEGS_LANDB && anim != LEGS_LAND ) {
;2946:		return;
;2947:	}
;2948:
;2949:	cent->dustTrailTime += 40;
;2950:	if ( cent->dustTrailTime < cg.time ) {
;2951:		cent->dustTrailTime = cg.time;
;2952:	}
;2953:
;2954:	VectorCopy(cent->currentState.pos.trBase, end);
;2955:	end[2] -= 64;
;2956:	CG_Trace( &tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID );
;2957:
;2958:	if ( !(tr.surfaceFlags & SURF_DUST) )
;2959:		return;
;2960:
;2961:	VectorCopy( cent->currentState.pos.trBase, end );
;2962:	end[2] -= 16;
;2963:
;2964:	VectorSet(vel, 0, 0, -30);
;2965:	dust = CG_SmokePuff( end, vel,
;2966:				  24,
;2967:				  .8f, .8f, 0.7f, 0.33f,
;2968:				  500,
;2969:				  cg.time,
;2970:				  0,
;2971:				  0,
;2972:				  cgs.media.dustPuffShader );
;2973:}
;2974:*/
;2975:
;2976:/*
;2977:===============
;2978:CG_TrailItem
;2979:===============
;2980:*/
;2981:#if 0
;2982:static void CG_TrailItem( centity_t *cent, qhandle_t hModel ) {
;2983:	refEntity_t		ent;
;2984:	vec3_t			angles;
;2985:	vec3_t			axis[3];
;2986:
;2987:	VectorCopy( cent->lerpAngles, angles );
;2988:	angles[PITCH] = 0;
;2989:	angles[ROLL] = 0;
;2990:	AnglesToAxis( angles, axis );
;2991:
;2992:	memset( &ent, 0, sizeof( ent ) );
;2993:	VectorMA( cent->lerpOrigin, -16, axis[0], ent.origin );
;2994:	ent.origin[2] += 16;
;2995:	angles[YAW] += 90;
;2996:	AnglesToAxis( angles, ent.axis );
;2997:
;2998:	ent.hModel = hModel;
;2999:	trap_R_AddRefEntityToScene( &ent );
;3000:}
;3001:#endif
;3002:
;3003:
;3004:/*
;3005:===============
;3006:CG_PlayerFlag
;3007:===============
;3008:*/
;3009:static void CG_PlayerFlag( centity_t *cent, qhandle_t hModel ) {
line 3016
;3010:	refEntity_t		ent;
;3011:	vec3_t			angles;
;3012:	vec3_t			axis[3];
;3013:	vec3_t			boltOrg, tAng, getAng, right;
;3014:	mdxaBone_t		boltMatrix;
;3015:
;3016:	if (cent->currentState.number == cg.snap->ps.clientNum &&
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1311
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $1311
line 3018
;3017:		!cg.renderingThirdPerson)
;3018:	{
line 3019
;3019:		return;
ADDRGP4 $1310
JUMPV
LABELV $1311
line 3022
;3020:	}
;3021:
;3022:	if (!cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1315
line 3023
;3023:	{
line 3024
;3024:		return;
ADDRGP4 $1310
JUMPV
LABELV $1315
line 3027
;3025:	}
;3026:
;3027:	VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
ADDRLP4 356
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 224+4
ADDRLP4 356
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 224+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 3029
;3028:
;3029:	trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_llumbar, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 360
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+528
ADDP4
INDIRI4
ARGI4
ADDRLP4 308
ARGP4
ADDRLP4 224
ARGP4
ADDRLP4 360
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 360
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 3030
;3030:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, boltOrg);
ADDRLP4 308
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 212
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 3032
;3031:
;3032:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, POSITIVE_X, tAng);
ADDRLP4 308
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 224
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 3033
;3033:	vectoangles(tAng, tAng);
ADDRLP4 224
ARGP4
ADDRLP4 224
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3035
;3034:
;3035:	VectorCopy(cent->lerpAngles, angles);
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 3037
;3036:
;3037:	boltOrg[2] -= 12;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 3038
;3038:	VectorSet(getAng, 0, cent->lerpAngles[1], 0);
ADDRLP4 284
CNSTF4 0
ASGNF4
ADDRLP4 284+4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ASGNF4
ADDRLP4 284+8
CNSTF4 0
ASGNF4
line 3039
;3039:	AngleVectors(getAng, 0, right, 0);
ADDRLP4 284
ARGP4
ADDRLP4 364
CNSTP4 0
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 296
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3040
;3040:	boltOrg[0] += right[0]*8;
ADDRLP4 212
ADDRLP4 212
INDIRF4
CNSTF4 1090519040
ADDRLP4 296
INDIRF4
MULF4
ADDF4
ASGNF4
line 3041
;3041:	boltOrg[1] += right[1]*8;
ADDRLP4 212+4
ADDRLP4 212+4
INDIRF4
CNSTF4 1090519040
ADDRLP4 296+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3042
;3042:	boltOrg[2] += right[2]*8;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1090519040
ADDRLP4 296+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3044
;3043:
;3044:	angles[PITCH] = -cent->lerpAngles[PITCH]/2-30;
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
CNSTF4 1106247680
SUBF4
ASGNF4
line 3045
;3045:	angles[YAW] = tAng[YAW]+270;
ADDRLP4 236+4
ADDRLP4 224+4
INDIRF4
CNSTF4 1132920832
ADDF4
ASGNF4
line 3047
;3046:
;3047:	AnglesToAxis(angles, axis);
ADDRLP4 236
ARGP4
ADDRLP4 248
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3049
;3048:
;3049:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3050
;3050:	VectorMA( boltOrg, 24, axis[0], ent.origin );
ADDRLP4 0+52
ADDRLP4 212
INDIRF4
CNSTF4 1103101952
ADDRLP4 248
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+4
ADDRLP4 212+4
INDIRF4
CNSTF4 1103101952
ADDRLP4 248+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDRLP4 248+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3052
;3051:
;3052:	angles[ROLL] += 20;
ADDRLP4 236+8
ADDRLP4 236+8
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 3053
;3053:	AnglesToAxis( angles, ent.axis );
ADDRLP4 236
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3055
;3054:
;3055:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 3057
;3056:
;3057:	ent.modelScale[0] = 0.5;
ADDRLP4 0+196
CNSTF4 1056964608
ASGNF4
line 3058
;3058:	ent.modelScale[1] = 0.5;
ADDRLP4 0+196+4
CNSTF4 1056964608
ASGNF4
line 3059
;3059:	ent.modelScale[2] = 0.5;
ADDRLP4 0+196+8
CNSTF4 1056964608
ASGNF4
line 3060
;3060:	ScaleModelAxis(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 3071
;3061:
;3062:	/*
;3063:	if (cent->currentState.number == cg.snap->ps.clientNum)
;3064:	{ //If we're the current client (in third person), render the flag on our back transparently
;3065:		ent.renderfx |= RF_FORCE_ENT_ALPHA;
;3066:		ent.shaderRGBA[3] = 100;
;3067:	}
;3068:	*/
;3069:	//FIXME: Not doing this at the moment because sorting totally messes up
;3070:
;3071:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3072
;3072:}
LABELV $1310
endproc CG_PlayerFlag 368 36
proc CG_PlayerPowerups 16 20
line 3080
;3073:
;3074:
;3075:/*
;3076:===============
;3077:CG_PlayerPowerups
;3078:===============
;3079:*/
;3080:static void CG_PlayerPowerups( centity_t *cent, refEntity_t *torso ) {
line 3084
;3081:	int		powerups;
;3082:	clientInfo_t	*ci;
;3083:
;3084:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
line 3085
;3085:	if ( !powerups ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1350
line 3086
;3086:		return;
ADDRGP4 $1349
JUMPV
LABELV $1350
line 3090
;3087:	}
;3088:
;3089:	// quad gives a dlight
;3090:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1352
line 3091
;3091:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3092
;3092:	}
LABELV $1352
line 3094
;3093:
;3094:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 4
CNSTI4 788
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 3096
;3095:	// redflag
;3096:	if ( powerups & ( 1 << PW_REDFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1355
line 3097
;3097:		CG_PlayerFlag( cent, cgs.media.redFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+36
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 3098
;3098:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3099
;3099:	}
LABELV $1355
line 3102
;3100:
;3101:	// blueflag
;3102:	if ( powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1359
line 3103
;3103:		CG_PlayerFlag( cent, cgs.media.blueFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+40
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 3104
;3104:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1.0 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3105
;3105:	}
LABELV $1359
line 3108
;3106:
;3107:	// neutralflag
;3108:	if ( powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1363
line 3109
;3109:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 1.0, 1.0 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3110
;3110:	}
LABELV $1363
line 3113
;3111:
;3112:	// haste leaves smoke trails
;3113:	if ( powerups & ( 1 << PW_HASTE ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1365
line 3114
;3114:		CG_HasteTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 3115
;3115:	}
LABELV $1365
line 3116
;3116:}
LABELV $1349
endproc CG_PlayerPowerups 16 20
proc CG_PlayerFloatSprite 216 12
line 3126
;3117:
;3118:
;3119:/*
;3120:===============
;3121:CG_PlayerFloatSprite
;3122:
;3123:Float a sprite over the player's head
;3124:===============
;3125:*/
;3126:static void CG_PlayerFloatSprite( centity_t *cent, qhandle_t shader ) {
line 3130
;3127:	int				rf;
;3128:	refEntity_t		ent;
;3129:
;3130:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1368
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $1368
line 3131
;3131:		rf = RF_THIRD_PERSON;		// only show in mirrors
ADDRLP4 212
CNSTI4 2
ASGNI4
line 3132
;3132:	} else {
ADDRGP4 $1369
JUMPV
LABELV $1368
line 3133
;3133:		rf = 0;
ADDRLP4 212
CNSTI4 0
ASGNI4
line 3134
;3134:	}
LABELV $1369
line 3136
;3135:
;3136:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3137
;3137:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 3138
;3138:	ent.origin[2] += 48;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 3139
;3139:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 3140
;3140:	ent.customShader = shader;
ADDRLP4 0+76
ADDRFP4 4
INDIRI4
ASGNI4
line 3141
;3141:	ent.radius = 10;
ADDRLP4 0+92
CNSTF4 1092616192
ASGNF4
line 3142
;3142:	ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 212
INDIRI4
ASGNI4
line 3143
;3143:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 3144
;3144:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 3145
;3145:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 3146
;3146:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+80+3
CNSTU1 255
ASGNU1
line 3147
;3147:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3148
;3148:}
LABELV $1367
endproc CG_PlayerFloatSprite 216 12
proc CG_PlayerSprites 8 20
line 3193
;3149:
;3150:
;3151:
;3152:/*
;3153:===============
;3154:CG_PlayerFloatSprite
;3155:
;3156:Same as above but allows custom RGBA values
;3157:===============
;3158:*/
;3159:#if 0
;3160:static void CG_PlayerFloatSpriteRGBA( centity_t *cent, qhandle_t shader, vec4_t rgba ) {
;3161:	int				rf;
;3162:	refEntity_t		ent;
;3163:
;3164:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
;3165:		rf = RF_THIRD_PERSON;		// only show in mirrors
;3166:	} else {
;3167:		rf = 0;
;3168:	}
;3169:
;3170:	memset( &ent, 0, sizeof( ent ) );
;3171:	VectorCopy( cent->lerpOrigin, ent.origin );
;3172:	ent.origin[2] += 48;
;3173:	ent.reType = RT_SPRITE;
;3174:	ent.customShader = shader;
;3175:	ent.radius = 10;
;3176:	ent.renderfx = rf;
;3177:	ent.shaderRGBA[0] = rgba[0];
;3178:	ent.shaderRGBA[1] = rgba[1];
;3179:	ent.shaderRGBA[2] = rgba[2];
;3180:	ent.shaderRGBA[3] = rgba[3];
;3181:	trap_R_AddRefEntityToScene( &ent );
;3182:}
;3183:#endif
;3184:
;3185:
;3186:/*
;3187:===============
;3188:CG_PlayerSprites
;3189:
;3190:Float sprites over the player's head
;3191:===============
;3192:*/
;3193:static void CG_PlayerSprites( centity_t *cent ) {
line 3196
;3194://	int		team;
;3195:
;3196:	if (cg.snap &&
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1386
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1386
line 3202
;3197:		CG_IsMindTricked(cent->currentState.trickedentindex,
;3198:		cent->currentState.trickedentindex2,
;3199:		cent->currentState.trickedentindex3,
;3200:		cent->currentState.trickedentindex4,
;3201:		cg.snap->ps.clientNum))
;3202:	{
line 3203
;3203:		return; //this entity is mind-tricking the current client, so don't render it
ADDRGP4 $1385
JUMPV
LABELV $1386
line 3206
;3204:	}
;3205:
;3206:	if ( cent->currentState.eFlags & EF_CONNECTION ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1390
line 3207
;3207:		CG_PlayerFloatSprite( cent, cgs.media.connectionShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+188
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 3208
;3208:		return;
ADDRGP4 $1385
JUMPV
LABELV $1390
line 3211
;3209:	}
;3210:
;3211:	if ( cent->currentState.eFlags & EF_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1394
line 3212
;3212:		CG_PlayerFloatSprite( cent, cgs.media.balloonShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+184
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 3213
;3213:		return;
LABELV $1394
line 3256
;3214:	}
;3215:/*
;3216:	if ( cent->currentState.eFlags & EF_AWARD_IMPRESSIVE ) {
;3217:		CG_PlayerFloatSprite( cent, cgs.media.medalImpressive );
;3218:		return;
;3219:	}
;3220:
;3221:	if ( cent->currentState.eFlags & EF_AWARD_EXCELLENT ) {
;3222:		CG_PlayerFloatSprite( cent, cgs.media.medalExcellent );
;3223:		return;
;3224:	}
;3225:
;3226:	if ( cent->currentState.eFlags & EF_AWARD_GAUNTLET ) {
;3227:		CG_PlayerFloatSprite( cent, cgs.media.medalGauntlet );
;3228:		return;
;3229:	}
;3230:
;3231:	if ( cent->currentState.eFlags & EF_AWARD_DEFEND ) {
;3232:		CG_PlayerFloatSprite( cent, cgs.media.medalDefend );
;3233:		return;
;3234:	}
;3235:
;3236:	if ( cent->currentState.eFlags & EF_AWARD_ASSIST ) {
;3237:		CG_PlayerFloatSprite( cent, cgs.media.medalAssist );
;3238:		return;
;3239:	}
;3240:
;3241:	if ( cent->currentState.eFlags & EF_AWARD_CAP ) {
;3242:		CG_PlayerFloatSprite( cent, cgs.media.medalCapture );
;3243:		return;
;3244:	}
;3245:
;3246:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
;3247:	if ( !(cent->currentState.eFlags & EF_DEAD) && 
;3248:		cg.snap->ps.persistant[PERS_TEAM] == team &&
;3249:		cgs.gametype >= GT_TEAM) {
;3250:		if (cg_drawFriend.integer) {
;3251:			CG_PlayerFloatSprite( cent, cgs.media.friendShader );
;3252:		}
;3253:		return;
;3254:	}
;3255:*/
;3256:}
LABELV $1385
endproc CG_PlayerSprites 8 20
lit
align 4
LABELV $1399
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $1400
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 1136 44
line 3268
;3257:
;3258:/*
;3259:===============
;3260:CG_PlayerShadow
;3261:
;3262:Returns the Z component of the surface being shadowed
;3263:
;3264:  should it return a full plane instead of a Z?
;3265:===============
;3266:*/
;3267:#define	SHADOW_DISTANCE		128
;3268:static qboolean CG_PlayerShadow( centity_t *cent, float *shadowPlane ) {
line 3269
;3269:	vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 1096
ADDRGP4 $1399
INDIRB
ASGNB 12
ADDRLP4 1108
ADDRGP4 $1400
INDIRB
ASGNB 12
line 3273
;3270:	trace_t		trace;
;3271:	float		alpha;
;3272:
;3273:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 3275
;3274:
;3275:	if ( cg_shadows.integer == 0 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1401
line 3276
;3276:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1401
line 3279
;3277:	}
;3278:
;3279:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1404
line 3280
;3280:	{
line 3281
;3281:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1404
line 3284
;3282:	}
;3283:
;3284:	if (CG_IsMindTricked(cent->currentState.trickedentindex,
ADDRLP4 1120
ADDRFP4 0
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
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $1406
line 3289
;3285:		cent->currentState.trickedentindex2,
;3286:		cent->currentState.trickedentindex3,
;3287:		cent->currentState.trickedentindex4,
;3288:		cg.snap->ps.clientNum))
;3289:	{
line 3290
;3290:		return qfalse; //this entity is mind-tricking the current client, so don't render it
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1406
line 3294
;3291:	}
;3292:
;3293:	// send a trace down from the player to the ground
;3294:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 3295
;3295:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 1084+8
ADDRLP4 1084+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 3297
;3296:
;3297:	trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1096
ARGP4
ADDRLP4 1108
ARGP4
CNSTI4 0
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 3300
;3298:
;3299:	// no shadow if too high
;3300:	if ( trace.fraction == 1.0 || trace.startsolid || trace.allsolid ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1415
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $1415
ADDRLP4 0
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1410
LABELV $1415
line 3301
;3301:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1410
line 3304
;3302:	}
;3303:
;3304:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3306
;3305:
;3306:	if ( cg_shadows.integer != 1 ) {	// no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $1418
line 3307
;3307:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1418
line 3311
;3308:	}
;3309:
;3310:	// fade the shadow out with height
;3311:	alpha = 1.0 - trace.fraction;
ADDRLP4 1080
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 3318
;3312:
;3313:	// bk0101022 - hack / FPE - bogus planes?
;3314:	//assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f ) 
;3315:
;3316:	// add the mark as a temporary, so it goes directly to the renderer
;3317:	// without taking a spot in the cg_marks array
;3318:	CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal, 
ADDRGP4 cgs+70296+404
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRF4
ARGF4
ADDRLP4 1080
INDIRF4
ARGF4
ADDRLP4 1080
INDIRF4
ARGF4
ADDRLP4 1080
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1103101952
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 3321
;3319:		cent->pe.legs.yawAngle, alpha,alpha,alpha,1, qfalse, 24, qtrue );
;3320:
;3321:	return qtrue;
CNSTI4 1
RETI4
LABELV $1398
endproc CG_PlayerShadow 1136 44
proc CG_PlayerSplash 1216 28
line 3332
;3322:}
;3323:
;3324:
;3325:/*
;3326:===============
;3327:CG_PlayerSplash
;3328:
;3329:Draw a mark at the water surface
;3330:===============
;3331:*/
;3332:static void CG_PlayerSplash( centity_t *cent ) {
line 3338
;3333:	vec3_t		start, end;
;3334:	trace_t		trace;
;3335:	int			contents;
;3336:	polyVert_t	verts[4];
;3337:
;3338:	if ( !cg_shadows.integer ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1427
line 3339
;3339:		return;
ADDRGP4 $1426
JUMPV
LABELV $1427
line 3342
;3340:	}
;3341:
;3342:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 1188
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 3343
;3343:	end[2] -= 24;
ADDRLP4 1188+8
ADDRLP4 1188+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 3347
;3344:
;3345:	// if the feet aren't in liquid, don't make a mark
;3346:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;3347:	contents = trap_CM_PointContents( end, 0 );
ADDRLP4 1188
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1204
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 1200
ADDRLP4 1204
INDIRI4
ASGNI4
line 3348
;3348:	if ( !( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) ) {
ADDRLP4 1200
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
NEI4 $1431
line 3349
;3349:		return;
ADDRGP4 $1426
JUMPV
LABELV $1431
line 3352
;3350:	}
;3351:
;3352:	VectorCopy( cent->lerpOrigin, start );
ADDRLP4 1176
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 3353
;3353:	start[2] += 32;
ADDRLP4 1176+8
ADDRLP4 1176+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3356
;3354:
;3355:	// if the head isn't out of liquid, don't make a mark
;3356:	contents = trap_CM_PointContents( start, 0 );
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1208
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 1200
ADDRLP4 1208
INDIRI4
ASGNI4
line 3357
;3357:	if ( contents & ( CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 1200
INDIRI4
CNSTI4 131079
BANDI4
CNSTI4 0
EQI4 $1434
line 3358
;3358:		return;
ADDRGP4 $1426
JUMPV
LABELV $1434
line 3362
;3359:	}
;3360:
;3361:	// trace down to find the surface
;3362:	trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) );
ADDRLP4 96
ARGP4
ADDRLP4 1176
ARGP4
ADDRLP4 1188
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
CNSTI4 0
ARGI4
CNSTI4 131078
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 3364
;3363:
;3364:	if ( trace.fraction == 1.0 ) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $1436
line 3365
;3365:		return;
ADDRGP4 $1426
JUMPV
LABELV $1436
line 3369
;3366:	}
;3367:
;3368:	// create a mark polygon
;3369:	VectorCopy( trace.endpos, verts[0].xyz );
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 3370
;3370:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3371
;3371:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3372
;3372:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 3373
;3373:	verts[0].st[1] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 3374
;3374:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 3375
;3375:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 3376
;3376:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 3377
;3377:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 3379
;3378:
;3379:	VectorCopy( trace.endpos, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 3380
;3380:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3381
;3381:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3382
;3382:	verts[1].st[0] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 3383
;3383:	verts[1].st[1] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 3384
;3384:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 3385
;3385:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 3386
;3386:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 3387
;3387:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 3389
;3388:
;3389:	VectorCopy( trace.endpos, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 3390
;3390:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3391
;3391:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3392
;3392:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 3393
;3393:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 3394
;3394:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 3395
;3395:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 3396
;3396:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 3397
;3397:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 3399
;3398:
;3399:	VectorCopy( trace.endpos, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 3400
;3400:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3401
;3401:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3402
;3402:	verts[3].st[0] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 3403
;3403:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 3404
;3404:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 3405
;3405:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 3406
;3406:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 3407
;3407:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 3409
;3408:
;3409:	trap_R_AddPolyToScene( cgs.media.wakeMarkShader, 4, verts );
ADDRGP4 cgs+70296+412
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 3410
;3410:}
LABELV $1426
endproc CG_PlayerSplash 1216 28
export CG_ForcePushBlur
proc CG_ForcePushBlur 28 4
line 3413
;3411:
;3412:void CG_ForcePushBlur( vec3_t org )
;3413:{
line 3416
;3414:	localEntity_t	*ex;
;3415:
;3416:	ex = CG_AllocLocalEntity();
ADDRLP4 4
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 3417
;3417:	ex->leType = LE_PUFF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 5
ASGNI4
line 3418
;3418:	ex->refEntity.reType = RT_SPRITE;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3419
;3419:	ex->radius = 2.0f;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
CNSTF4 1073741824
ASGNF4
line 3420
;3420:	ex->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3421
;3421:	ex->endTime = ex->startTime + 120;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 120
ADDI4
ASGNI4
line 3422
;3422:	VectorCopy( org, ex->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3423
;3423:	ex->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3424
;3424:	ex->pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 2
ASGNI4
line 3425
;3425:	VectorScale( cg.refdef.viewaxis[1], 55, ex->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12+8
INDIRF4
MULF4
ASGNF4
line 3427
;3426:		
;3427:	ex->color[0] = 24;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1103101952
ASGNF4
line 3428
;3428:	ex->color[1] = 32;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 1107296256
ASGNF4
line 3429
;3429:	ex->color[2] = 40;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1109393408
ASGNF4
line 3430
;3430:	ex->refEntity.customShader = trap_R_RegisterShader( "gfx/effects/forcePush" );
ADDRGP4 $1530
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 3432
;3431:
;3432:	ex = CG_AllocLocalEntity();
ADDRLP4 16
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 3433
;3433:	ex->leType = LE_PUFF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 5
ASGNI4
line 3434
;3434:	ex->refEntity.reType = RT_SPRITE;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3435
;3435:	ex->refEntity.rotation = 180.0f;
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
CNSTF4 1127481344
ASGNF4
line 3436
;3436:	ex->radius = 2.0f;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
CNSTF4 1073741824
ASGNF4
line 3437
;3437:	ex->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3438
;3438:	ex->endTime = ex->startTime + 120;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 120
ADDI4
ASGNI4
line 3439
;3439:	VectorCopy( org, ex->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3440
;3440:	ex->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3441
;3441:	ex->pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 2
ASGNI4
line 3442
;3442:	VectorScale( cg.refdef.viewaxis[1], -55, ex->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12+8
INDIRF4
MULF4
ASGNF4
line 3444
;3443:		
;3444:	ex->color[0] = 24;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1103101952
ASGNF4
line 3445
;3445:	ex->color[1] = 32;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 1107296256
ASGNF4
line 3446
;3446:	ex->color[2] = 40;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1109393408
ASGNF4
line 3447
;3447:	ex->refEntity.customShader = trap_R_RegisterShader( "gfx/effects/forcePush" );
ADDRGP4 $1530
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 3448
;3448:}
LABELV $1516
endproc CG_ForcePushBlur 28 4
export CG_ForceGripEffect
proc CG_ForceGripEffect 32 4
line 3451
;3449:
;3450:void CG_ForceGripEffect( vec3_t org )
;3451:{
line 3453
;3452:	localEntity_t	*ex;
;3453:	float wv = sin( cg.time * 0.004f ) * 0.08f + 0.1f;
CNSTF4 998445679
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 8
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1034147594
ADDRLP4 8
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 3455
;3454:
;3455:	ex = CG_AllocLocalEntity();
ADDRLP4 12
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 3456
;3456:	ex->leType = LE_PUFF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 5
ASGNI4
line 3457
;3457:	ex->refEntity.reType = RT_SPRITE;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3458
;3458:	ex->radius = 2.0f;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
CNSTF4 1073741824
ASGNF4
line 3459
;3459:	ex->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3460
;3460:	ex->endTime = ex->startTime + 120;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 120
ADDI4
ASGNI4
line 3461
;3461:	VectorCopy( org, ex->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3462
;3462:	ex->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3463
;3463:	ex->pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 2
ASGNI4
line 3464
;3464:	VectorScale( cg.refdef.viewaxis[1], 55, ex->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12+8
INDIRF4
MULF4
ASGNF4
line 3466
;3465:		
;3466:	ex->color[0] = 200+((wv*255));
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1132396544
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1128792064
ADDF4
ASGNF4
line 3467
;3467:	if (ex->color[0] > 255)
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
CNSTF4 1132396544
LEF4 $1559
line 3468
;3468:	{
line 3469
;3469:		ex->color[0] = 255;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1132396544
ASGNF4
line 3470
;3470:	}
LABELV $1559
line 3471
;3471:	ex->color[1] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 0
ASGNF4
line 3472
;3472:	ex->color[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 0
ASGNF4
line 3473
;3473:	ex->refEntity.customShader = trap_R_RegisterShader( "gfx/effects/forcePush" );
ADDRGP4 $1530
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 3475
;3474:
;3475:	ex = CG_AllocLocalEntity();
ADDRLP4 24
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 3476
;3476:	ex->leType = LE_PUFF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 5
ASGNI4
line 3477
;3477:	ex->refEntity.reType = RT_SPRITE;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3478
;3478:	ex->refEntity.rotation = 180.0f;
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
CNSTF4 1127481344
ASGNF4
line 3479
;3479:	ex->radius = 2.0f;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
CNSTF4 1073741824
ASGNF4
line 3480
;3480:	ex->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3481
;3481:	ex->endTime = ex->startTime + 120;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 120
ADDI4
ASGNI4
line 3482
;3482:	VectorCopy( org, ex->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3483
;3483:	ex->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3484
;3484:	ex->pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 2
ASGNI4
line 3485
;3485:	VectorScale( cg.refdef.viewaxis[1], -55, ex->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12+8
INDIRF4
MULF4
ASGNF4
line 3494
;3486:
;3487:	/*
;3488:	ex->color[0] = 200+((wv*255));
;3489:	if (ex->color[0] > 255)
;3490:	{
;3491:		ex->color[0] = 255;
;3492:	}
;3493:	*/
;3494:	ex->color[0] = 255;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1132396544
ASGNF4
line 3495
;3495:	ex->color[1] = 255;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 1132396544
ASGNF4
line 3496
;3496:	ex->color[2] = 255;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1132396544
ASGNF4
line 3497
;3497:	ex->refEntity.customShader = cgs.media.redSaberGlowShader;//trap_R_RegisterShader( "gfx/effects/forcePush" );
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 3498
;3498:}
LABELV $1544
endproc CG_ForceGripEffect 32 4
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 8 20
line 3509
;3499:
;3500:
;3501:/*
;3502:===============
;3503:CG_AddRefEntityWithPowerups
;3504:
;3505:Adds a piece with modifications or duplications for powerups
;3506:Also called by CG_Missile for quad rockets, but nobody can tell...
;3507:===============
;3508:*/
;3509:void CG_AddRefEntityWithPowerups( refEntity_t *ent, entityState_t *state, int team ) {
line 3511
;3510:
;3511:	if (CG_IsMindTricked(state->trickedentindex,
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1577
line 3516
;3512:		state->trickedentindex2,
;3513:		state->trickedentindex3,
;3514:		state->trickedentindex4,
;3515:		cg.snap->ps.clientNum))
;3516:	{
line 3517
;3517:		return; //this entity is mind-tricking the current client, so don't render it
ADDRGP4 $1576
JUMPV
LABELV $1577
line 3520
;3518:	}
;3519:
;3520:	trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3522
;3521:
;3522:	if ( state->powerups & ( 1 << PW_QUAD ) )
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1580
line 3523
;3523:	{
line 3524
;3524:		if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1582
line 3525
;3525:			ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 cgs+70296+452
INDIRI4
ASGNI4
ADDRGP4 $1583
JUMPV
LABELV $1582
line 3527
;3526:		else
;3527:			ent->customShader = cgs.media.quadShader;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 cgs+70296+448
INDIRI4
ASGNI4
LABELV $1583
line 3528
;3528:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3529
;3529:	}
LABELV $1580
line 3530
;3530:	if ( state->powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1588
line 3531
;3531:		ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 cgs+70296+468
INDIRI4
ASGNI4
line 3532
;3532:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3533
;3533:	}
LABELV $1588
line 3534
;3534:}
LABELV $1576
endproc CG_AddRefEntityWithPowerups 8 20
export CG_PlayerShieldHit
proc CG_PlayerShieldHit 24 8
line 3541
;3535:
;3536:#define MAX_SHIELD_TIME	2000.0
;3537:#define MIN_SHIELD_TIME	2000.0
;3538:
;3539:
;3540:void CG_PlayerShieldHit(int entitynum, vec3_t dir, int amount)
;3541:{
line 3545
;3542:	centity_t *cent;
;3543:	int	time;
;3544:
;3545:	if (entitynum<0 || entitynum >= MAX_CLIENTS)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $1595
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $1593
LABELV $1595
line 3546
;3546:	{
line 3547
;3547:		return;
ADDRGP4 $1592
JUMPV
LABELV $1593
line 3550
;3548:	}
;3549:
;3550:	cent = &cg_entities[entitynum];
ADDRLP4 0
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 3552
;3551:
;3552:	if (amount > 100)
ADDRFP4 8
INDIRI4
CNSTI4 100
LEI4 $1596
line 3553
;3553:	{
line 3554
;3554:		time = cg.time + MAX_SHIELD_TIME;		// 2 sec.
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
CNSTF4 1157234688
ADDF4
CVFI4 4
ASGNI4
line 3555
;3555:	}
ADDRGP4 $1597
JUMPV
LABELV $1596
line 3557
;3556:	else
;3557:	{
line 3558
;3558:		time = cg.time + 500 + amount*15;
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
CNSTI4 500
ADDI4
CNSTI4 15
ADDRFP4 8
INDIRI4
MULI4
ADDI4
ASGNI4
line 3559
;3559:	}
LABELV $1597
line 3561
;3560:
;3561:	if (time > cent->damageTime)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
LEI4 $1600
line 3562
;3562:	{
line 3563
;3563:		cent->damageTime = time;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 3564
;3564:		VectorScale(dir, -1, dir);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 3212836864
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 3212836864
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTF4 3212836864
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 3565
;3565:		vectoangles(dir, cent->damageAngles);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3566
;3566:	}
LABELV $1600
line 3567
;3567:}
LABELV $1592
endproc CG_PlayerShieldHit 24 8
export CG_DrawPlayerShield
proc CG_DrawPlayerShield 224 12
line 3571
;3568:
;3569:
;3570:void CG_DrawPlayerShield(centity_t *cent, vec3_t origin)
;3571:{
line 3577
;3572:	refEntity_t ent;
;3573:	int			alpha;
;3574:	float		scale;
;3575:	
;3576:	// Don't draw the shield when the player is dead.
;3577:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1603
line 3578
;3578:	{
line 3579
;3579:		return;
ADDRGP4 $1602
JUMPV
LABELV $1603
line 3582
;3580:	}
;3581:
;3582:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3584
;3583:
;3584:	VectorCopy( origin, ent.origin );
ADDRLP4 0+52
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 3585
;3585:	ent.origin[2] += 10.0;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 3586
;3586:	AnglesToAxis( cent->damageAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3588
;3587:
;3588:	alpha = 255.0 * ((cent->damageTime - cg.time) / MIN_SHIELD_TIME) + random()*16;
ADDRLP4 220
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 216
CNSTF4 1132396544
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1157234688
DIVF4
MULF4
CNSTF4 1098907648
ADDRLP4 220
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3589
;3589:	if (alpha>255)
ADDRLP4 216
INDIRI4
CNSTI4 255
LEI4 $1610
line 3590
;3590:		alpha=255;
ADDRLP4 216
CNSTI4 255
ASGNI4
LABELV $1610
line 3593
;3591:
;3592:	// Make it bigger, but tighter if more solid
;3593:	scale = 1.4 - ((float)alpha*(0.4/255.0));		// Range from 1.0 to 1.4
ADDRLP4 212
CNSTF4 1068708659
CNSTF4 986552935
ADDRLP4 216
INDIRI4
CVIF4 4
MULF4
SUBF4
ASGNF4
line 3594
;3594:	VectorScale( ent.axis[0], scale, ent.axis[0] );
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
line 3595
;3595:	VectorScale( ent.axis[1], scale, ent.axis[1] );
ADDRLP4 0+12+12
ADDRLP4 0+12+12
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+4
ADDRLP4 0+12+12+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+8
ADDRLP4 0+12+12+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
line 3596
;3596:	VectorScale( ent.axis[2], scale, ent.axis[2] );
ADDRLP4 0+12+24
ADDRLP4 0+12+24
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+24+4
ADDRLP4 0+12+24+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+24+8
ADDRLP4 0+12+24+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
line 3598
;3597:
;3598:	ent.hModel = cgs.media.halfShieldModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+900
INDIRI4
ASGNI4
line 3599
;3599:	ent.customShader = cgs.media.halfShieldShader;
ADDRLP4 0+76
ADDRGP4 cgs+70296+904
INDIRI4
ASGNI4
line 3600
;3600:	ent.shaderRGBA[0] = alpha;
ADDRLP4 0+80
ADDRLP4 216
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3601
;3601:	ent.shaderRGBA[1] = alpha;
ADDRLP4 0+80+1
ADDRLP4 216
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3602
;3602:	ent.shaderRGBA[2] = alpha;
ADDRLP4 0+80+2
ADDRLP4 216
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3603
;3603:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+80+3
CNSTU1 255
ASGNU1
line 3604
;3604:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3605
;3605:}
LABELV $1602
endproc CG_DrawPlayerShield 224 12
export CG_PlayerHitFX
proc CG_PlayerHitFX 4 8
line 3609
;3606:
;3607:
;3608:void CG_PlayerHitFX(centity_t *cent)
;3609:{
line 3613
;3610:	centity_t *curent;
;3611:
;3612:	// only do the below fx if the cent in question is...uh...me, and it's first person.
;3613:	if (cent->currentState.clientNum != cg.predictedPlayerState.clientNum || cg.renderingThirdPerson)
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ADDRGP4 cg+96+144
INDIRI4
NEI4 $1673
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1668
LABELV $1673
line 3614
;3614:	{
line 3616
;3615:		// Get the NON-PREDICTED player entity, because the predicted one doesn't have the damage info on it.
;3616:		curent = &cg_entities[cent->currentState.number];
ADDRLP4 0
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 3618
;3617:
;3618:		if (curent->damageTime > cg.time)
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $1667
line 3619
;3619:		{
line 3620
;3620:			CG_DrawPlayerShield(curent, cent->lerpOrigin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 CG_DrawPlayerShield
CALLV
pop
line 3621
;3621:		}
line 3623
;3622:
;3623:		return;
LABELV $1668
line 3625
;3624:	}
;3625:}
LABELV $1667
endproc CG_PlayerHitFX 4 8
export CG_LightVerts
proc CG_LightVerts 88 16
line 3635
;3626:
;3627:
;3628:
;3629:/*
;3630:=================
;3631:CG_LightVerts
;3632:=================
;3633:*/
;3634:int CG_LightVerts( vec3_t normal, int numVerts, polyVert_t *verts )
;3635:{
line 3642
;3636:	int				i, j;
;3637:	float			incoming;
;3638:	vec3_t			ambientLight;
;3639:	vec3_t			lightDir;
;3640:	vec3_t			directedLight;
;3641:
;3642:	trap_R_LightForPoint( verts[0].xyz, ambientLight, directedLight, lightDir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 3644
;3643:
;3644:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1681
JUMPV
LABELV $1678
line 3645
;3645:		incoming = DotProduct (normal, lightDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3646
;3646:		if ( incoming <= 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1684
line 3647
;3647:			verts[i].modulate[0] = ambientLight[0];
ADDRLP4 56
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $1687
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
ADDRGP4 $1688
JUMPV
LABELV $1687
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1688
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 3648
;3648:			verts[i].modulate[1] = ambientLight[1];
ADDRLP4 68
ADDRLP4 12+4
INDIRF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $1691
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
ADDRGP4 $1692
JUMPV
LABELV $1691
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1692
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 3649
;3649:			verts[i].modulate[2] = ambientLight[2];
ADDRLP4 80
ADDRLP4 12+8
INDIRF4
ASGNF4
ADDRLP4 84
CNSTF4 1325400064
ASGNF4
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
LTF4 $1695
ADDRLP4 76
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1696
JUMPV
LABELV $1695
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1696
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 76
INDIRU4
CVUU1 4
ASGNU1
line 3650
;3650:			verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 3651
;3651:			continue;
ADDRGP4 $1679
JUMPV
LABELV $1684
line 3653
;3652:		} 
;3653:		j = ( ambientLight[0] + incoming * directedLight[0] );
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3654
;3654:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1697
line 3655
;3655:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 3656
;3656:		}
LABELV $1697
line 3657
;3657:		verts[i].modulate[0] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3659
;3658:
;3659:		j = ( ambientLight[1] + incoming * directedLight[1] );
ADDRLP4 0
ADDRLP4 12+4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3660
;3660:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1701
line 3661
;3661:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 3662
;3662:		}
LABELV $1701
line 3663
;3663:		verts[i].modulate[1] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3665
;3664:
;3665:		j = ( ambientLight[2] + incoming * directedLight[2] );
ADDRLP4 0
ADDRLP4 12+8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3666
;3666:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1705
line 3667
;3667:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 3668
;3668:		}
LABELV $1705
line 3669
;3669:		verts[i].modulate[2] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3671
;3670:
;3671:		verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 3672
;3672:	}
LABELV $1679
line 3644
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1681
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1678
line 3673
;3673:	return qtrue;
CNSTI4 1
RETI4
LABELV $1677
endproc CG_LightVerts 88 16
lit
align 4
LABELV $1708
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export CG_DoSaber
code
proc CG_DoSaber 313 20
line 3677
;3674:}
;3675:
;3676:void CG_DoSaber( vec3_t origin, vec3_t dir, float length, saber_colors_t color, int rfx )
;3677:{
line 3678
;3678:	vec3_t		mid, rgb={1,1,1};
ADDRLP4 212
ADDRGP4 $1708
INDIRB
ASGNB 12
line 3679
;3679:	qhandle_t	blade = 0, glow = 0;
ADDRLP4 240
CNSTI4 0
ASGNI4
ADDRLP4 244
CNSTI4 0
ASGNI4
line 3683
;3680:	refEntity_t saber;
;3681:	float radiusmult;
;3682:
;3683:	if ( length < 0.5f )
ADDRFP4 8
INDIRF4
CNSTF4 1056964608
GEF4 $1709
line 3684
;3684:	{
line 3686
;3685:		// if the thing is so short, just forget even adding me.
;3686:		return;
ADDRGP4 $1707
JUMPV
LABELV $1709
line 3690
;3687:	}
;3688:
;3689:	// Find the midpoint of the saber for lighting purposes
;3690:	VectorMA( origin, length * 0.5f, dir, mid );
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 256
CNSTF4 1056964608
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 224
ADDRLP4 248
INDIRP4
INDIRF4
ADDRLP4 252
INDIRP4
INDIRF4
ADDRLP4 256
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 260
CNSTI4 4
ASGNI4
ADDRLP4 224+4
ADDRLP4 248
INDIRP4
ADDRLP4 260
INDIRI4
ADDP4
INDIRF4
ADDRLP4 252
INDIRP4
ADDRLP4 260
INDIRI4
ADDP4
INDIRF4
ADDRLP4 256
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 264
CNSTI4 8
ASGNI4
ADDRLP4 224+8
ADDRFP4 0
INDIRP4
ADDRLP4 264
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 264
INDIRI4
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRFP4 8
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 3692
;3691:
;3692:	switch( color )
ADDRLP4 268
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
LTI4 $1713
ADDRLP4 268
INDIRI4
CNSTI4 5
GTI4 $1713
ADDRLP4 268
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1764
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1764
address $1716
address $1723
address $1730
address $1737
address $1744
address $1751
code
line 3693
;3693:	{
LABELV $1716
line 3695
;3694:		case SABER_RED:
;3695:			glow = cgs.media.redSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 3696
;3696:			blade = cgs.media.redSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+120
INDIRI4
ASGNI4
line 3697
;3697:			VectorSet( rgb, 1.0f, 0.2f, 0.2f );
ADDRLP4 212
CNSTF4 1065353216
ASGNF4
ADDRLP4 212+4
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+8
CNSTF4 1045220557
ASGNF4
line 3698
;3698:			break;
ADDRGP4 $1714
JUMPV
LABELV $1723
line 3700
;3699:		case SABER_ORANGE:
;3700:			glow = cgs.media.orangeSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+124
INDIRI4
ASGNI4
line 3701
;3701:			blade = cgs.media.orangeSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+128
INDIRI4
ASGNI4
line 3702
;3702:			VectorSet( rgb, 1.0f, 0.5f, 0.1f );
ADDRLP4 212
CNSTF4 1065353216
ASGNF4
ADDRLP4 212+4
CNSTF4 1056964608
ASGNF4
ADDRLP4 212+8
CNSTF4 1036831949
ASGNF4
line 3703
;3703:			break;
ADDRGP4 $1714
JUMPV
LABELV $1730
line 3705
;3704:		case SABER_YELLOW:
;3705:			glow = cgs.media.yellowSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+132
INDIRI4
ASGNI4
line 3706
;3706:			blade = cgs.media.yellowSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+136
INDIRI4
ASGNI4
line 3707
;3707:			VectorSet( rgb, 1.0f, 1.0f, 0.2f );
ADDRLP4 276
CNSTF4 1065353216
ASGNF4
ADDRLP4 212
ADDRLP4 276
INDIRF4
ASGNF4
ADDRLP4 212+4
ADDRLP4 276
INDIRF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1045220557
ASGNF4
line 3708
;3708:			break;
ADDRGP4 $1714
JUMPV
LABELV $1737
line 3710
;3709:		case SABER_GREEN:
;3710:			glow = cgs.media.greenSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 3711
;3711:			blade = cgs.media.greenSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+144
INDIRI4
ASGNI4
line 3712
;3712:			VectorSet( rgb, 0.2f, 1.0f, 0.2f );
ADDRLP4 212
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 212+8
CNSTF4 1045220557
ASGNF4
line 3713
;3713:			break;
ADDRGP4 $1714
JUMPV
LABELV $1744
line 3715
;3714:		case SABER_BLUE:
;3715:			glow = cgs.media.blueSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 3716
;3716:			blade = cgs.media.blueSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+152
INDIRI4
ASGNI4
line 3717
;3717:			VectorSet( rgb, 0.2f, 0.4f, 1.0f );
ADDRLP4 212
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+4
CNSTF4 1053609165
ASGNF4
ADDRLP4 212+8
CNSTF4 1065353216
ASGNF4
line 3718
;3718:			break;
ADDRGP4 $1714
JUMPV
LABELV $1751
line 3720
;3719:		case SABER_PURPLE:
;3720:			glow = cgs.media.purpleSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+156
INDIRI4
ASGNI4
line 3721
;3721:			blade = cgs.media.purpleSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+160
INDIRI4
ASGNI4
line 3722
;3722:			VectorSet( rgb, 0.9f, 0.2f, 1.0f );
ADDRLP4 212
CNSTF4 1063675494
ASGNF4
ADDRLP4 212+4
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+8
CNSTF4 1065353216
ASGNF4
line 3723
;3723:			break;
ADDRGP4 $1714
JUMPV
LABELV $1713
line 3725
;3724:		default:
;3725:			glow = cgs.media.blueSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 3726
;3726:			blade = cgs.media.blueSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+152
INDIRI4
ASGNI4
line 3727
;3727:			VectorSet( rgb, 0.2f, 0.4f, 1.0f );
ADDRLP4 212
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+4
CNSTF4 1053609165
ASGNF4
ADDRLP4 212+8
CNSTF4 1065353216
ASGNF4
line 3728
;3728:			break;
LABELV $1714
line 3732
;3729:	}
;3730:
;3731:	// always add a light because sabers cast a nice glow before they slice you in half!!  or something...
;3732:	trap_R_AddLightToScene( mid, (length*2.0f) + (random()*8.0f), rgb[0], rgb[1], rgb[2] );
ADDRLP4 276
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 224
ARGP4
CNSTF4 1073741824
ADDRFP4 8
INDIRF4
MULF4
CNSTF4 1090519040
ADDRLP4 276
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ARGF4
ADDRLP4 212
INDIRF4
ARGF4
ADDRLP4 212+4
INDIRF4
ARGF4
ADDRLP4 212+8
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3734
;3733:
;3734:	memset( &saber, 0, sizeof( refEntity_t ));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3738
;3735:
;3736:	// Saber glow is it's own ref type because it uses a ton of sprites, otherwise it would eat up too many
;3737:	//	refEnts to do each glow blob individually
;3738:	saber.saberLength = length;
ADDRLP4 0+180
ADDRFP4 8
INDIRF4
ASGNF4
line 3742
;3739:
;3740:	// Jeff, I did this because I foolishly wished to have a bright halo as the saber is unleashed.  
;3741:	// It's not quite what I'd hoped tho.  If you have any ideas, go for it!  --Pat
;3742:	if (length < SABER_LENGTH_MAX)
ADDRFP4 8
INDIRF4
CNSTF4 1109393408
GEF4 $1768
line 3743
;3743:	{
line 3744
;3744:		radiusmult = 1.0 + (2.0 / length);		// Note this creates a curve, and length cannot be < 0.5.
ADDRLP4 236
CNSTF4 1073741824
ADDRFP4 8
INDIRF4
DIVF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3745
;3745:	}
ADDRGP4 $1769
JUMPV
LABELV $1768
line 3747
;3746:	else
;3747:	{
line 3748
;3748:		radiusmult = 1.0;
ADDRLP4 236
CNSTF4 1065353216
ASGNF4
line 3749
;3749:	}
LABELV $1769
line 3752
;3750:
;3751:
;3752:	saber.radius = (2.8 + crandom() * 0.2f)*radiusmult;
ADDRLP4 280
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+92
CNSTF4 1045220557
CNSTF4 1073741824
ADDRLP4 280
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
CNSTF4 1077097267
ADDF4
ADDRLP4 236
INDIRF4
MULF4
ASGNF4
line 3755
;3753:
;3754:
;3755:	VectorCopy( origin, saber.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3756
;3756:	VectorCopy( dir, saber.axis[0] );
ADDRLP4 0+12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 3757
;3757:	saber.reType = RT_SABER_GLOW;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 3758
;3758:	saber.customShader = glow;
ADDRLP4 0+76
ADDRLP4 244
INDIRI4
ASGNI4
line 3759
;3759:	saber.shaderRGBA[0] = saber.shaderRGBA[1] = saber.shaderRGBA[2] = saber.shaderRGBA[3] = 0xff;
ADDRLP4 284
CNSTU1 255
ASGNU1
ADDRLP4 0+80+3
ADDRLP4 284
INDIRU1
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 284
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 284
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 284
INDIRU1
ASGNU1
line 3760
;3760:	saber.renderfx = rfx;
ADDRLP4 0+4
ADDRFP4 16
INDIRI4
ASGNI4
line 3762
;3761:
;3762:	trap_R_AddRefEntityToScene( &saber );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3765
;3763:
;3764:	// Do the hot core
;3765:	VectorMA( origin, length, dir, saber.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 288
CNSTI4 4
ASGNI4
ADDRLP4 0+52+4
ADDRFP4 0
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 292
CNSTI4 8
ASGNI4
ADDRLP4 0+52+8
ADDRFP4 0
INDIRP4
ADDRLP4 292
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 292
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3766
;3766:	VectorMA( origin, -1, dir, saber.oldorigin );
ADDRLP4 0+64
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 296
CNSTI4 4
ASGNI4
ADDRLP4 0+64+4
ADDRFP4 0
INDIRP4
ADDRLP4 296
INDIRI4
ADDP4
INDIRF4
CNSTF4 3212836864
ADDRFP4 4
INDIRP4
ADDRLP4 296
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 300
CNSTI4 8
ASGNI4
ADDRLP4 0+64+8
ADDRFP4 0
INDIRP4
ADDRLP4 300
INDIRI4
ADDP4
INDIRF4
CNSTF4 3212836864
ADDRFP4 4
INDIRP4
ADDRLP4 300
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3770
;3767:
;3768:
;3769://	CG_TestLine(saber.origin, saber.oldorigin, 50, 0x000000ff, 3);
;3770:	saber.customShader = blade;
ADDRLP4 0+76
ADDRLP4 240
INDIRI4
ASGNI4
line 3771
;3771:	saber.reType = RT_LINE;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 3772
;3772:	saber.radius = (1.0 + crandom() * 0.2f)*radiusmult;
ADDRLP4 304
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+92
CNSTF4 1045220557
CNSTF4 1073741824
ADDRLP4 304
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
CNSTF4 1065353216
ADDF4
ADDRLP4 236
INDIRF4
MULF4
ASGNF4
line 3774
;3773:
;3774:	saber.shaderTexCoord[0] = saber.shaderTexCoord[1] = 1.0f;
ADDRLP4 308
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+84+4
ADDRLP4 308
INDIRF4
ASGNF4
ADDRLP4 0+84
ADDRLP4 308
INDIRF4
ASGNF4
line 3775
;3775:	saber.shaderRGBA[0] = saber.shaderRGBA[1] = saber.shaderRGBA[2] = saber.shaderRGBA[3] = 0xff;
ADDRLP4 312
CNSTU1 255
ASGNU1
ADDRLP4 0+80+3
ADDRLP4 312
INDIRU1
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 312
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 312
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 312
INDIRU1
ASGNU1
line 3777
;3776:
;3777:	trap_R_AddRefEntityToScene( &saber );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3778
;3778:}
LABELV $1707
endproc CG_DoSaber 313 20
export CG_GetTagWorldPosition
proc CG_GetTagWorldPosition 100 24
line 3786
;3779:
;3780://--------------------------------------------------------------
;3781:// CG_GetTagWorldPosition
;3782://
;3783:// Can pass in NULL for the axis
;3784://--------------------------------------------------------------
;3785:void CG_GetTagWorldPosition( refEntity_t *model, char *tag, vec3_t pos, vec3_t axis[3] )
;3786:{
line 3788
;3787:	orientation_t	orientation;
;3788:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3791
;3789:
;3790:	// Get the requested tag
;3791:	trap_R_LerpTag( &orientation, model->hModel, model->oldframe, model->frame,
ADDRLP4 4
ARGP4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
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
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 3794
;3792:		1.0f - model->backlerp, tag );
;3793:
;3794:	VectorCopy( model->origin, pos );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRB
ASGNB 12
line 3795
;3795:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1805
line 3796
;3796:	{
line 3797
;3797:		VectorMA( pos, orientation.origin[i], model->axis[i], pos );
ADDRLP4 56
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 12
ASGNI4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
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
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 72
ADDRFP4 8
INDIRP4
ADDRLP4 68
INDIRI4
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
ADDRFP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDP4
ADDRLP4 68
INDIRI4
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
CNSTI4 8
ASGNI4
ADDRLP4 88
ADDRFP4 8
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ASGNP4
ADDRLP4 92
CNSTI4 12
ASGNI4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 92
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDP4
ADDRLP4 84
INDIRI4
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
line 3798
;3798:	}
LABELV $1806
line 3795
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1805
line 3800
;3799:
;3800:	if ( axis )
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1809
line 3801
;3801:	{
line 3802
;3802:		MatrixMultiply( orientation.axis, model->axis, axis );
ADDRLP4 4+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 3803
;3803:	}
LABELV $1809
line 3804
;3804:}
LABELV $1804
endproc CG_GetTagWorldPosition 100 24
export CG_CreateSaberMarks
proc CG_CreateSaberMarks 6252 28
line 3811
;3805:
;3806:#define	MAX_MARK_FRAGMENTS	128
;3807:#define	MAX_MARK_POINTS		384
;3808:extern markPoly_t *CG_AllocMark();
;3809:
;3810:void CG_CreateSaberMarks( vec3_t start, vec3_t end, vec3_t normal )
;3811:{
line 3821
;3812://	byte			colors[4];
;3813:	int				i, j;
;3814:	int				numFragments;
;3815:	vec3_t			axis[3], originalPoints[4], mid;
;3816:	vec3_t			markPoints[MAX_MARK_POINTS], projection;
;3817:	polyVert_t		*v, verts[MAX_VERTS_ON_POLY];
;3818:	markPoly_t		*mark;
;3819:	markFragment_t	markFragments[MAX_MARK_FRAGMENTS], *mf;
;3820:
;3821:	float	radius = 0.65f;
ADDRLP4 4916
CNSTF4 1059481190
ASGNF4
line 3823
;3822:
;3823:	if ( !cg_addMarks.integer ) 
ADDRGP4 cg_addMarks+12
INDIRI4
CNSTI4 0
NEI4 $1813
line 3824
;3824:	{
line 3825
;3825:		return;
ADDRGP4 $1812
JUMPV
LABELV $1813
line 3828
;3826:	}
;3827:
;3828:	VectorSubtract( end, start, axis[1] );
ADDRLP4 256+12
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6008
CNSTI4 4
ASGNI4
ADDRLP4 256+12+4
ADDRFP4 4
INDIRP4
ADDRLP4 6008
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 6008
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6012
CNSTI4 8
ASGNI4
ADDRLP4 256+12+8
ADDRFP4 4
INDIRP4
ADDRLP4 6012
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 6012
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3829
;3829:	VectorNormalize( axis[1] );
ADDRLP4 256+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3832
;3830:
;3831:	// create the texture axis
;3832:	VectorCopy( normal, axis[0] );
ADDRLP4 256
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 3833
;3833:	CrossProduct( axis[1], axis[0], axis[2] );
ADDRLP4 256+12
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 256+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 3836
;3834:
;3835:	// create the full polygon that we'll project
;3836:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 300
CNSTI4 0
ASGNI4
LABELV $1824
line 3837
;3837:	{	// stretch a bit more in the direction that we are traveling in...  debateable as to whether this makes things better or worse
line 3838
;3838:		originalPoints[0][i] = start[i] - radius * axis[1][i] - radius * axis[2][i];
ADDRLP4 6016
ADDRLP4 300
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6016
INDIRI4
ADDRLP4 4920
ADDP4
ADDRLP4 6016
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6016
INDIRI4
ADDRLP4 256+12
ADDP4
INDIRF4
MULF4
SUBF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6016
INDIRI4
ADDRLP4 256+24
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 3839
;3839:		originalPoints[1][i] = end[i] + radius * axis[1][i] - radius * axis[2][i];
ADDRLP4 6024
ADDRLP4 300
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6024
INDIRI4
ADDRLP4 4920+12
ADDP4
ADDRLP4 6024
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6024
INDIRI4
ADDRLP4 256+12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6024
INDIRI4
ADDRLP4 256+24
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 3840
;3840:		originalPoints[2][i] = end[i] + radius * axis[1][i] + radius * axis[2][i];
ADDRLP4 6032
ADDRLP4 300
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6032
INDIRI4
ADDRLP4 4920+24
ADDP4
ADDRLP4 6032
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6032
INDIRI4
ADDRLP4 256+12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6032
INDIRI4
ADDRLP4 256+24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3841
;3841:		originalPoints[3][i] = start[i] - radius * axis[1][i] + radius * axis[2][i];
ADDRLP4 6040
ADDRLP4 300
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6040
INDIRI4
ADDRLP4 4920+36
ADDP4
ADDRLP4 6040
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6040
INDIRI4
ADDRLP4 256+12
ADDP4
INDIRF4
MULF4
SUBF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6040
INDIRI4
ADDRLP4 256+24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3842
;3842:	}
LABELV $1825
line 3836
ADDRLP4 300
ADDRLP4 300
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 3
LTI4 $1824
line 3844
;3843:
;3844:	VectorScale( normal, -1, projection );
ADDRLP4 6016
CNSTF4 3212836864
ASGNF4
ADDRLP4 6020
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4972
ADDRLP4 6016
INDIRF4
ADDRLP4 6020
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4972+4
ADDRLP4 6016
INDIRF4
ADDRLP4 6020
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4972+8
CNSTF4 3212836864
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 3847
;3845:
;3846:	// get the fragments
;3847:	numFragments = trap_CM_MarkFragments( 4, (const float (*)[3])originalPoints,
CNSTI4 4
ARGI4
ADDRLP4 4920
ARGP4
ADDRLP4 4972
ARGP4
CNSTI4 384
ARGI4
ADDRLP4 304
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 4984
ARGP4
ADDRLP4 6024
ADDRGP4 trap_CM_MarkFragments
CALLI4
ASGNI4
ADDRLP4 4968
ADDRLP4 6024
INDIRI4
ASGNI4
line 3850
;3848:					projection, MAX_MARK_POINTS, markPoints[0], MAX_MARK_FRAGMENTS, markFragments );
;3849:
;3850:	for ( i = 0, mf = markFragments ; i < numFragments ; i++, mf++ ) 
ADDRLP4 300
CNSTI4 0
ASGNI4
ADDRLP4 296
ADDRLP4 4984
ASGNP4
ADDRGP4 $1844
JUMPV
LABELV $1841
line 3851
;3851:	{
line 3853
;3852:		// we have an upper limit on the complexity of polygons that we store persistantly
;3853:		if ( mf->numPoints > MAX_VERTS_ON_POLY ) 
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1845
line 3854
;3854:		{
line 3855
;3855:			mf->numPoints = MAX_VERTS_ON_POLY;
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 3856
;3856:		}
LABELV $1845
line 3858
;3857:
;3858:		for ( j = 0, v = verts ; j < mf->numPoints ; j++, v++ ) 
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 252
ADDRLP4 12
ASGNP4
ADDRGP4 $1850
JUMPV
LABELV $1847
line 3859
;3859:		{
line 3863
;3860:			vec3_t delta;
;3861:
;3862:			// Set up our texture coords, this may need some work 
;3863:			VectorCopy( markPoints[mf->firstPoint + j], v->xyz );
ADDRLP4 252
INDIRP4
CNSTI4 12
ADDRLP4 296
INDIRP4
INDIRI4
ADDRLP4 292
INDIRI4
ADDI4
MULI4
ADDRLP4 304
ADDP4
INDIRB
ASGNB 12
line 3864
;3864:			VectorAdd( end, start, mid );
ADDRLP4 6040
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 6044
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 6040
INDIRP4
INDIRF4
ADDRLP4 6044
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 6048
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 6040
INDIRP4
ADDRLP4 6048
INDIRI4
ADDP4
INDIRF4
ADDRLP4 6044
INDIRP4
ADDRLP4 6048
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 6052
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 6052
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 6052
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3865
;3865:			VectorScale( mid, 0.5f, mid );
ADDRLP4 6056
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 6056
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 6056
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 3866
;3866:			VectorSubtract( v->xyz, mid, delta );
ADDRLP4 6028
ADDRLP4 252
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6028+4
ADDRLP4 252
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6028+8
ADDRLP4 252
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 3868
;3867:
;3868:			v->st[0] = 0.5 + DotProduct( delta, axis[1] ) * (0.05f + random() * 0.03f); 
ADDRLP4 6064
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 252
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 6028
INDIRF4
ADDRLP4 256+12
INDIRF4
MULF4
ADDRLP4 6028+4
INDIRF4
ADDRLP4 256+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 6028+8
INDIRF4
ADDRLP4 256+12+8
INDIRF4
MULF4
ADDF4
CNSTF4 1022739087
ADDRLP4 6064
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1028443341
ADDF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3869
;3869:			v->st[1] = 0.5 + DotProduct( delta, axis[2] ) * (0.15f + random() * 0.05f);	
ADDRLP4 6068
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 252
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 6028
INDIRF4
ADDRLP4 256+24
INDIRF4
MULF4
ADDRLP4 6028+4
INDIRF4
ADDRLP4 256+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 6028+8
INDIRF4
ADDRLP4 256+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 1028443341
ADDRLP4 6068
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1041865114
ADDF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3870
;3870:		}
LABELV $1848
line 3858
ADDRLP4 292
ADDRLP4 292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 252
ADDRLP4 252
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
LABELV $1850
ADDRLP4 292
INDIRI4
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $1847
line 3872
;3871:
;3872:		if (cg_saberDynamicMarks.integer)
ADDRGP4 cg_saberDynamicMarks+12
INDIRI4
CNSTI4 0
EQI4 $1875
line 3873
;3873:		{
line 3874
;3874:			int i = 0;
ADDRLP4 6032
CNSTI4 0
ASGNI4
line 3875
;3875:			int i_2 = 0;
ADDRLP4 6028
CNSTI4 0
ASGNI4
line 3879
;3876:			addpolyArgStruct_t apArgs;
;3877:			vec3_t x;
;3878:
;3879:			memset (&apArgs, 0, sizeof(apArgs));
ADDRLP4 6036
ARGP4
CNSTI4 0
ARGI4
CNSTI4 180
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $1879
JUMPV
line 3882
;3880:
;3881:			while (i < 4)
;3882:			{
LABELV $1881
line 3884
;3883:				while (i_2 < 3)
;3884:				{
line 3885
;3885:					apArgs.p[i][i_2] = verts[i].xyz[i_2];
ADDRLP4 6228
ADDRLP4 6028
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6228
INDIRI4
CNSTI4 12
ADDRLP4 6032
INDIRI4
MULI4
ADDRLP4 6036
ADDP4
ADDP4
ADDRLP4 6228
INDIRI4
CNSTI4 24
ADDRLP4 6032
INDIRI4
MULI4
ADDRLP4 12
ADDP4
ADDP4
INDIRF4
ASGNF4
line 3887
;3886:
;3887:					i_2++;
ADDRLP4 6028
ADDRLP4 6028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3888
;3888:				}
LABELV $1882
line 3883
ADDRLP4 6028
INDIRI4
CNSTI4 3
LTI4 $1881
line 3890
;3889:
;3890:				i_2 = 0;
ADDRLP4 6028
CNSTI4 0
ASGNI4
line 3891
;3891:				i++;
ADDRLP4 6032
ADDRLP4 6032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3892
;3892:			}
LABELV $1879
line 3881
ADDRLP4 6032
INDIRI4
CNSTI4 4
LTI4 $1882
line 3894
;3893:
;3894:			i = 0;
ADDRLP4 6032
CNSTI4 0
ASGNI4
line 3895
;3895:			i_2 = 0;
ADDRLP4 6028
CNSTI4 0
ASGNI4
ADDRGP4 $1885
JUMPV
line 3898
;3896:
;3897:			while (i < 4)
;3898:			{
LABELV $1887
line 3900
;3899:				while (i_2 < 2)
;3900:				{
line 3901
;3901:					apArgs.ev[i][i_2] = verts[i].st[i_2];
ADDRLP4 6228
ADDRLP4 6028
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6228
INDIRI4
ADDRLP4 6032
INDIRI4
CNSTI4 3
LSHI4
ADDRLP4 6036+48
ADDP4
ADDP4
ADDRLP4 6228
INDIRI4
CNSTI4 24
ADDRLP4 6032
INDIRI4
MULI4
ADDRLP4 12+12
ADDP4
ADDP4
INDIRF4
ASGNF4
line 3903
;3902:
;3903:					i_2++;
ADDRLP4 6028
ADDRLP4 6028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3904
;3904:				}
LABELV $1888
line 3899
ADDRLP4 6028
INDIRI4
CNSTI4 2
LTI4 $1887
line 3906
;3905:
;3906:				i_2 = 0;
ADDRLP4 6028
CNSTI4 0
ASGNI4
line 3907
;3907:				i++;
ADDRLP4 6032
ADDRLP4 6032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3908
;3908:			}
LABELV $1885
line 3897
ADDRLP4 6032
INDIRI4
CNSTI4 4
LTI4 $1888
line 3913
;3909:
;3910:			//When using addpoly, having a situation like this tends to cause bad results.
;3911:			//(I assume it doesn't like trying to draw a polygon over two planes and extends
;3912:			//the vertex out to some odd value)
;3913:			VectorSubtract(apArgs.p[0], apArgs.p[3], x);
ADDRLP4 6216
ADDRLP4 6036
INDIRF4
ADDRLP4 6036+36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6216+4
ADDRLP4 6036+4
INDIRF4
ADDRLP4 6036+36+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6216+8
ADDRLP4 6036+8
INDIRF4
ADDRLP4 6036+36+8
INDIRF4
SUBF4
ASGNF4
line 3914
;3914:			if (VectorLength(x) > 3.0f)
ADDRLP4 6216
ARGP4
ADDRLP4 6228
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 6228
INDIRF4
CNSTF4 1077936128
LEF4 $1901
line 3915
;3915:			{
line 3916
;3916:				return;
ADDRGP4 $1812
JUMPV
LABELV $1901
line 3919
;3917:			}
;3918:
;3919:			apArgs.numVerts = mf->numPoints;
ADDRLP4 6036+80
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3920
;3920:			VectorCopy(vec3_origin, apArgs.vel);
ADDRLP4 6036+84
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 3921
;3921:			VectorCopy(vec3_origin, apArgs.accel);
ADDRLP4 6036+96
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 3923
;3922:
;3923:			apArgs.alpha1 = 1.0f;
ADDRLP4 6036+108
CNSTF4 1065353216
ASGNF4
line 3924
;3924:			apArgs.alpha2 = 0.0f;
ADDRLP4 6036+112
CNSTF4 0
ASGNF4
line 3925
;3925:			apArgs.alphaParm = 255.0f;
ADDRLP4 6036+116
CNSTF4 1132396544
ASGNF4
line 3927
;3926:
;3927:			VectorSet(apArgs.rgb1, 0.0f, 0.0f, 0.0f);
ADDRLP4 6036+120
CNSTF4 0
ASGNF4
ADDRLP4 6036+120+4
CNSTF4 0
ASGNF4
ADDRLP4 6036+120+8
CNSTF4 0
ASGNF4
line 3928
;3928:			VectorSet(apArgs.rgb2, 0.0f, 0.0f, 0.0f);
ADDRLP4 6036+132
CNSTF4 0
ASGNF4
ADDRLP4 6036+132+4
CNSTF4 0
ASGNF4
ADDRLP4 6036+132+8
CNSTF4 0
ASGNF4
line 3930
;3929:
;3930:			apArgs.rgbParm = 0.0f;
ADDRLP4 6036+144
CNSTF4 0
ASGNF4
line 3932
;3931:
;3932:			apArgs.bounce = 0;
ADDRLP4 6036+160
CNSTF4 0
ASGNF4
line 3933
;3933:			apArgs.motionDelay = 0;
ADDRLP4 6036+164
CNSTI4 0
ASGNI4
line 3934
;3934:			apArgs.killTime = cg_saberDynamicMarkTime.integer;
ADDRLP4 6036+168
ADDRGP4 cg_saberDynamicMarkTime+12
INDIRI4
ASGNI4
line 3935
;3935:			apArgs.shader = cgs.media.rivetMarkShader;
ADDRLP4 6036+172
ADDRGP4 cgs+70296+172
INDIRI4
ASGNI4
line 3936
;3936:			apArgs.flags = 0x08000000|0x00000004;
ADDRLP4 6036+176
CNSTI4 134217732
ASGNI4
line 3938
;3937:
;3938:			trap_FX_AddPoly(&apArgs);
ADDRLP4 6036
ARGP4
ADDRGP4 trap_FX_AddPoly
CALLV
pop
line 3940
;3939:
;3940:			apArgs.shader = trap_R_RegisterShader("gfx/effects/saberDamageGlow");
ADDRGP4 $1929
ARGP4
ADDRLP4 6232
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 6036+172
ADDRLP4 6232
INDIRI4
ASGNI4
line 3941
;3941:			apArgs.rgb1[0] = 215 + random() * 40.0f;
ADDRLP4 6236
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 6036+120
CNSTF4 1109393408
ADDRLP4 6236
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1129775104
ADDF4
ASGNF4
line 3942
;3942:			apArgs.rgb1[1] = 96 + random() * 32.0f;
ADDRLP4 6240
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 6036+120+4
CNSTF4 1107296256
ADDRLP4 6240
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1119879168
ADDF4
ASGNF4
line 3943
;3943:			apArgs.rgb1[2] = apArgs.alphaParm = random()*15.0f;
ADDRLP4 6244
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 6248
CNSTF4 1097859072
ADDRLP4 6244
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
ADDRLP4 6036+116
ADDRLP4 6248
INDIRF4
ASGNF4
ADDRLP4 6036+120+8
ADDRLP4 6248
INDIRF4
ASGNF4
line 3945
;3944:
;3945:			apArgs.rgb1[0] /= 255;
ADDRLP4 6036+120
ADDRLP4 6036+120
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 3946
;3946:			apArgs.rgb1[1] /= 255;
ADDRLP4 6036+120+4
ADDRLP4 6036+120+4
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 3947
;3947:			apArgs.rgb1[2] /= 255;
ADDRLP4 6036+120+8
ADDRLP4 6036+120+8
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 3948
;3948:			VectorCopy(apArgs.rgb1, apArgs.rgb2);
ADDRLP4 6036+132
ADDRLP4 6036+120
INDIRB
ASGNB 12
line 3950
;3949:
;3950:			apArgs.killTime = 100;
ADDRLP4 6036+168
CNSTI4 100
ASGNI4
line 3952
;3951:
;3952:			trap_FX_AddPoly(&apArgs);
ADDRLP4 6036
ARGP4
ADDRGP4 trap_FX_AddPoly
CALLV
pop
line 3953
;3953:		}
ADDRGP4 $1876
JUMPV
LABELV $1875
line 3955
;3954:		else
;3955:		{
line 3957
;3956:			// save it persistantly, do burn first
;3957:			mark = CG_AllocMark();
ADDRLP4 6028
ADDRGP4 CG_AllocMark
CALLP4
ASGNP4
ADDRLP4 4912
ADDRLP4 6028
INDIRP4
ASGNP4
line 3958
;3958:			mark->time = cg.time;
ADDRLP4 4912
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3959
;3959:			mark->alphaFade = qtrue;
ADDRLP4 4912
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
line 3960
;3960:			mark->markShader = cgs.media.rivetMarkShader;
ADDRLP4 4912
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cgs+70296+172
INDIRI4
ASGNI4
line 3961
;3961:			mark->poly.numVerts = mf->numPoints;
ADDRLP4 4912
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3962
;3962:			mark->color[0] = mark->color[1] = mark->color[2] = mark->color[3] = 255;
ADDRLP4 6036
CNSTF4 1132396544
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 6036
INDIRF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 6036
INDIRF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 6036
INDIRF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 6036
INDIRF4
ASGNF4
line 3963
;3963:			memcpy( mark->verts, verts, mf->numPoints * sizeof( verts[0] ) );
ADDRLP4 4912
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 12
ARGP4
CNSTU4 24
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3967
;3964:
;3965:			// And now do a glow pass
;3966:			// by moving the start time back, we can hack it to fade out way before the burn does
;3967:			mark = CG_AllocMark();
ADDRLP4 6040
ADDRGP4 CG_AllocMark
CALLP4
ASGNP4
ADDRLP4 4912
ADDRLP4 6040
INDIRP4
ASGNP4
line 3968
;3968:			mark->time = cg.time - 8500;
ADDRLP4 4912
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 8500
SUBI4
ASGNI4
line 3969
;3969:			mark->alphaFade = qfalse;
ADDRLP4 4912
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 3970
;3970:			mark->markShader = trap_R_RegisterShader("gfx/effects/saberDamageGlow");
ADDRGP4 $1929
ARGP4
ADDRLP4 6044
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 4912
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 6044
INDIRI4
ASGNI4
line 3971
;3971:			mark->poly.numVerts = mf->numPoints;
ADDRLP4 4912
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3972
;3972:			mark->color[0] = 215 + random() * 40.0f;
ADDRLP4 6048
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4912
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1109393408
ADDRLP4 6048
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1129775104
ADDF4
ASGNF4
line 3973
;3973:			mark->color[1] = 96 + random() * 32.0f;
ADDRLP4 6052
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4912
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 1107296256
ADDRLP4 6052
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1119879168
ADDF4
ASGNF4
line 3974
;3974:			mark->color[2] = mark->color[3] = random()*15.0f;
ADDRLP4 6056
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 6064
CNSTF4 1097859072
ADDRLP4 6056
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 6064
INDIRF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 6064
INDIRF4
ASGNF4
line 3975
;3975:			memcpy( mark->verts, verts, mf->numPoints * sizeof( verts[0] ) );
ADDRLP4 4912
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 12
ARGP4
CNSTU4 24
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3976
;3976:		}
LABELV $1876
line 3977
;3977:	}
LABELV $1842
line 3850
ADDRLP4 300
ADDRLP4 300
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 296
ADDRLP4 296
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $1844
ADDRLP4 300
INDIRI4
ADDRLP4 4968
INDIRI4
LTI4 $1841
line 3978
;3978:}
LABELV $1812
endproc CG_CreateSaberMarks 6252 28
lit
align 4
LABELV $1951
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export CG_G2TraceCollide
code
proc CG_G2TraceCollide 1076 48
line 3982
;3979:
;3980:#ifdef G2_COLLISION_ENABLED
;3981:qboolean CG_G2TraceCollide(trace_t *tr, vec3_t lastValidStart, vec3_t lastValidEnd)
;3982:{
line 3983
;3983:	if (tr->entityNum < MAX_CLIENTS)
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 32
GEI4 $1949
line 3984
;3984:	{ //Hit a client with the normal trace, try the collision trace.
line 3987
;3985:		G2Trace_t		G2Trace;
;3986:		centity_t		*g2Hit;
;3987:		vec3_t			vIdentity = {1.0f, 1.0f, 1.0f};
ADDRLP4 1032
ADDRGP4 $1951
INDIRB
ASGNB 12
line 3989
;3988:		vec3_t			angles;
;3989:		int				tN = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3990
;3990:		float			fRadius = 0;
ADDRLP4 1044
CNSTF4 0
ASGNF4
line 3992
;3991:
;3992:		memset (&G2Trace, 0, sizeof(G2Trace));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $1953
JUMPV
LABELV $1952
line 3995
;3993:
;3994:		while (tN < MAX_G2_COLLISIONS)
;3995:		{
line 3996
;3996:			G2Trace[tN].mEntityNum = -1;
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 4+4
ADDP4
CNSTI4 -1
ASGNI4
line 3997
;3997:			tN++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3998
;3998:		}
LABELV $1953
line 3994
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1952
line 3999
;3999:		g2Hit = &cg_entities[tr->entityNum];
ADDRLP4 1028
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 4001
;4000:
;4001:		if (g2Hit && g2Hit->ghoul2)
ADDRLP4 1060
ADDRLP4 1028
INDIRP4
ASGNP4
ADDRLP4 1064
CNSTU4 0
ASGNU4
ADDRLP4 1060
INDIRP4
CVPU4 4
ADDRLP4 1064
INDIRU4
EQU4 $1956
ADDRLP4 1060
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1064
INDIRU4
EQU4 $1956
line 4002
;4002:		{
line 4003
;4003:			angles[ROLL] = angles[PITCH] = 0;
ADDRLP4 1068
CNSTF4 0
ASGNF4
ADDRLP4 1048
ADDRLP4 1068
INDIRF4
ASGNF4
ADDRLP4 1048+8
ADDRLP4 1068
INDIRF4
ASGNF4
line 4004
;4004:			angles[YAW] = g2Hit->lerpAngles[YAW];
ADDRLP4 1048+4
ADDRLP4 1028
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ASGNF4
line 4006
;4005:
;4006:			trap_G2API_CollisionDetect ( G2Trace, g2Hit->ghoul2, angles, g2Hit->lerpOrigin, cg.time, g2Hit->currentState.number, lastValidStart, lastValidEnd, vIdentity, 0, 2, fRadius );
ADDRLP4 4
ARGP4
ADDRLP4 1072
ADDRLP4 1028
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1072
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1072
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRGP4 trap_G2API_CollisionDetect
CALLV
pop
line 4008
;4007:
;4008:			if (G2Trace[0].mEntityNum != g2Hit->currentState.number)
ADDRLP4 4+4
INDIRI4
ADDRLP4 1028
INDIRP4
INDIRI4
EQI4 $1961
line 4009
;4009:			{
line 4010
;4010:				tr->fraction = 1.0f;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 4011
;4011:				tr->entityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 1023
ASGNI4
line 4012
;4012:				tr->startsolid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 4013
;4013:				tr->allsolid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 4014
;4014:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1948
JUMPV
LABELV $1961
line 4017
;4015:			}
;4016:			else
;4017:			{ //Yay!
line 4018
;4018:				VectorCopy(G2Trace[0].mCollisionPosition, tr->endpos);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4+20
INDIRB
ASGNB 12
line 4019
;4019:				VectorCopy(G2Trace[0].mCollisionNormal, tr->plane.normal);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4+32
INDIRB
ASGNB 12
line 4020
;4020:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1948
JUMPV
LABELV $1956
line 4023
;4021:			}
;4022:		}
;4023:	}
LABELV $1949
line 4025
;4024:
;4025:	return qfalse;
CNSTI4 0
RETI4
LABELV $1948
endproc CG_G2TraceCollide 1076 48
export CG_G2SaberEffects
proc CG_G2SaberEffects 1120 28
line 4029
;4026:}
;4027:
;4028:void CG_G2SaberEffects(vec3_t start, vec3_t end, centity_t *owner)
;4029:{
line 4033
;4030:	trace_t trace;
;4031:	vec3_t startTr;
;4032:	vec3_t endTr;
;4033:	qboolean backWards = qfalse;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 4034
;4034:	qboolean doneWithTraces = qfalse;
ADDRLP4 1108
CNSTI4 0
ASGNI4
ADDRGP4 $1968
JUMPV
LABELV $1967
line 4037
;4035:
;4036:	while (!doneWithTraces)
;4037:	{
line 4038
;4038:		if (!backWards)
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1970
line 4039
;4039:		{
line 4040
;4040:			VectorCopy(start, startTr);
ADDRLP4 1084
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 4041
;4041:			VectorCopy(end, endTr);
ADDRLP4 1096
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4042
;4042:		}
ADDRGP4 $1971
JUMPV
LABELV $1970
line 4044
;4043:		else
;4044:		{
line 4045
;4045:			VectorCopy(end, startTr);
ADDRLP4 1084
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4046
;4046:			VectorCopy(start, endTr);
ADDRLP4 1096
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 4047
;4047:		}
LABELV $1971
line 4049
;4048:
;4049:		CG_Trace( &trace, startTr, NULL, NULL, endTr, owner->currentState.number, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1112
CNSTP4 0
ASGNP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 1096
ARGP4
ADDRFP4 8
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 4051
;4050:
;4051:		if (trace.entityNum < MAX_CLIENTS)
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $1972
line 4052
;4052:		{ //hit a client..
line 4053
;4053:			CG_G2TraceCollide(&trace, startTr, endTr);
ADDRLP4 0
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1096
ARGP4
ADDRGP4 CG_G2TraceCollide
CALLI4
pop
line 4055
;4054:
;4055:			if (trace.entityNum != ENTITYNUM_NONE)
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $1975
line 4056
;4056:			{ //it succeeded with the ghoul2 trace
line 4057
;4057:				trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), trace.endpos, trace.plane.normal );
ADDRGP4 $1978
ARGP4
ADDRLP4 1116
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 4058
;4058:			}
LABELV $1975
line 4059
;4059:		}
LABELV $1972
line 4061
;4060:
;4061:		if (!backWards)
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1981
line 4062
;4062:		{
line 4063
;4063:			backWards = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 4064
;4064:		}
ADDRGP4 $1982
JUMPV
LABELV $1981
line 4066
;4065:		else
;4066:		{
line 4067
;4067:			doneWithTraces = qtrue;
ADDRLP4 1108
CNSTI4 1
ASGNI4
line 4068
;4068:		}
LABELV $1982
line 4069
;4069:	}
LABELV $1968
line 4036
ADDRLP4 1108
INDIRI4
CNSTI4 0
EQI4 $1967
line 4070
;4070:}
LABELV $1966
endproc CG_G2SaberEffects 1120 28
lit
align 4
LABELV $1984
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV $2168
byte 4 1132396544
byte 4 1132396544
byte 4 1132396544
export CG_AddSaberBlade
code
proc CG_AddSaberBlade 1672 36
line 4077
;4071:#endif
;4072:
;4073:#define SABER_TRAIL_TIME	40.0f
;4074:#define FX_USE_ALPHA		0x08000000
;4075:
;4076:void CG_AddSaberBlade( centity_t *cent, centity_t *scent, refEntity_t *saber, int renderfx, int modelIndex, vec3_t origin, vec3_t angles, qboolean fromSaber)
;4077:{
line 4079
;4078:	vec3_t	org_, end, v,
;4079:			axis_[3] = {0,0,0, 0,0,0, 0,0,0};	// shut the compiler up
ADDRLP4 1136
ADDRGP4 $1984
INDIRB
ASGNB 36
line 4081
;4080:	trace_t	trace;
;4081:	int i = 0;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 4090
;4082:	float saberLen, dualSaberLen;
;4083:	float diff;
;4084:	clientInfo_t *client;
;4085:	centity_t *saberEnt;
;4086:	saberTrail_t *saberTrail;
;4087:	mdxaBone_t	boltMatrix;
;4088:	vec3_t futureAngles;
;4089:	effectTrailArgStruct_t fx;
;4090:	int scolor = 0;
ADDRLP4 1560
CNSTI4 0
ASGNI4
line 4092
;4091:	vec3_t otherPos, otherDir, otherEnd;
;4092:	float dualLen = 0.7;
ADDRLP4 1556
CNSTF4 1060320051
ASGNF4
line 4094
;4093:
;4094:	saberEnt = &cg_entities[cent->currentState.saberEntityNum];
ADDRLP4 1576
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 4097
;4095:
;4096:	if (/*cg.snap->ps.clientNum == cent->currentState.number && */
;4097:		cgs.clientinfo[ cent->currentState.clientNum ].team != TEAM_SPECTATOR &&
CNSTI4 788
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1985
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1985
line 4099
;4098:		!(cg.snap->ps.pm_flags & PMF_FOLLOW))
;4099:	{
line 4100
;4100:		if (cent->saberLength < 1)
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
CNSTF4 1065353216
GEF4 $1990
line 4101
;4101:		{
line 4102
;4102:			cent->saberLength = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1065353216
ASGNF4
line 4103
;4103:			cent->saberExtendTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4104
;4104:		}
LABELV $1990
line 4106
;4105:
;4106:		if (cent->saberLength < SABER_LENGTH_MAX)
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $1993
line 4107
;4107:		{
line 4108
;4108:			cent->saberLength += (cg.time - cent->saberExtendTime)*0.05;
ADDRLP4 1632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1636
ADDRLP4 1632
INDIRP4
CNSTI4 1000
ADDP4
ASGNP4
ADDRLP4 1636
INDIRP4
ADDRLP4 1636
INDIRP4
INDIRF4
CNSTF4 1028443341
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1632
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4109
;4109:		}
LABELV $1993
line 4111
;4110:
;4111:		if (cent->saberLength > SABER_LENGTH_MAX)
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
CNSTF4 1109393408
LEF4 $1996
line 4112
;4112:		{
line 4113
;4113:			cent->saberLength = SABER_LENGTH_MAX;
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1109393408
ASGNF4
line 4114
;4114:		}
LABELV $1996
line 4116
;4115:
;4116:		cent->saberExtendTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4117
;4117:		saberLen = cent->saberLength;
ADDRLP4 1520
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
ASGNF4
line 4118
;4118:	}
ADDRGP4 $1986
JUMPV
LABELV $1985
line 4120
;4119:	else
;4120:	{
line 4121
;4121:		saberLen = SABER_LENGTH_MAX;
ADDRLP4 1520
CNSTF4 1109393408
ASGNF4
line 4122
;4122:	}
LABELV $1986
line 4128
;4123:
;4124:/*
;4125:Ghoul2 Insert Start
;4126:*/
;4127:
;4128:	dualSaberLen = saberLen;
ADDRLP4 1552
ADDRLP4 1520
INDIRF4
ASGNF4
line 4130
;4129:
;4130:	if ((cent->currentState.eFlags & EF_DEAD) && !fromSaber)
ADDRLP4 1632
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1632
INDIRI4
EQI4 $1999
ADDRFP4 28
INDIRI4
ADDRLP4 1632
INDIRI4
NEI4 $1999
line 4131
;4131:	{ //trying to draw a saber on a corpse? That's bad.
line 4132
;4132:		return;
ADDRGP4 $1983
JUMPV
LABELV $1999
line 4135
;4133:	}
;4134:
;4135:	futureAngles[YAW] = angles[YAW];
ADDRLP4 1564+4
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 4136
;4136:	futureAngles[PITCH] = angles[PITCH];
ADDRLP4 1564
ADDRFP4 24
INDIRP4
INDIRF4
ASGNF4
line 4137
;4137:	futureAngles[ROLL] = angles[ROLL];
ADDRLP4 1564+8
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 4140
;4138:
;4139:	// figure out where the actual model muzzle is
;4140:	if (fromSaber)
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $2003
line 4141
;4141:	{
line 4142
;4142:		trap_G2API_GetBoltMatrix(scent->ghoul2, 0, 0, &boltMatrix, futureAngles, origin, cg.time, cgs.gameModels, scent->modelScale);
ADDRLP4 1636
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1636
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1640
CNSTI4 0
ASGNI4
ADDRLP4 1640
INDIRI4
ARGI4
ADDRLP4 1640
INDIRI4
ARGI4
ADDRLP4 1580
ARGP4
ADDRLP4 1564
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1636
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 4143
;4143:	}
ADDRGP4 $2004
JUMPV
LABELV $2003
line 4145
;4144:	else
;4145:	{
line 4146
;4146:		trap_G2API_GetBoltMatrix(scent->ghoul2, 1, 0, &boltMatrix, futureAngles, origin, cg.time, cgs.gameModels, scent->modelScale);
ADDRLP4 1636
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1636
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1580
ARGP4
ADDRLP4 1564
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1636
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 4147
;4147:	}
LABELV $2004
line 4149
;4148:	// work the matrix axis stuff into the original axis and origins used.
;4149:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, org_);
ADDRLP4 1580
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1088
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 4150
;4150:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, NEGATIVE_Y, axis_[0]);
ADDRLP4 1580
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1136
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 4152
;4151:
;4152:	if (!fromSaber && saberEnt)
ADDRFP4 28
INDIRI4
CNSTI4 0
NEI4 $2009
ADDRLP4 1576
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2009
line 4153
;4153:	{
line 4154
;4154:		VectorCopy(org_, saberEnt->currentState.pos.trBase);
ADDRLP4 1576
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1088
INDIRB
ASGNB 12
line 4156
;4155:
;4156:		VectorCopy(axis_[0], saberEnt->currentState.apos.trBase);
ADDRLP4 1576
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1136
INDIRB
ASGNB 12
line 4157
;4157:	}
LABELV $2009
line 4159
;4158:
;4159:	client = &cgs.clientinfo[cent->currentState.number];
ADDRLP4 1084
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 4161
;4160:
;4161:	if (!client)
ADDRLP4 1084
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2012
line 4162
;4162:	{ //something horrible has apparently happened
line 4163
;4163:		return;
ADDRGP4 $1983
JUMPV
LABELV $2012
line 4166
;4164:	}
;4165:
;4166:	if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2014
line 4167
;4167:	{
line 4168
;4168:		VectorMA( org_, saberLen*dualLen, axis_[0], end );
ADDRLP4 1636
ADDRLP4 1520
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
ASGNF4
ADDRLP4 1112
ADDRLP4 1088
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+4
ADDRLP4 1088+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+8
ADDRLP4 1088+8
INDIRF4
ADDRLP4 1136+8
INDIRF4
ADDRLP4 1520
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 4169
;4169:	}
ADDRGP4 $2015
JUMPV
LABELV $2014
line 4171
;4170:	else
;4171:	{
line 4172
;4172:		VectorMA( org_, saberLen, axis_[0], end );
ADDRLP4 1112
ADDRLP4 1088
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1520
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+4
ADDRLP4 1088+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
ADDRLP4 1520
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+8
ADDRLP4 1088+8
INDIRF4
ADDRLP4 1136+8
INDIRF4
ADDRLP4 1520
INDIRF4
MULF4
ADDF4
ASGNF4
line 4173
;4173:	}
LABELV $2015
line 4175
;4174:	
;4175:	VectorAdd( end, axis_[0], end );
ADDRLP4 1112
ADDRLP4 1112
INDIRF4
ADDRLP4 1136
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1112+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1112+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 1136+8
INDIRF4
ADDF4
ASGNF4
line 4177
;4176:
;4177:	if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2034
line 4178
;4178:	{
line 4179
;4179:		otherPos[0] = org_[0] - axis_[0][0]*12;
ADDRLP4 1124
ADDRLP4 1088
INDIRF4
CNSTF4 1094713344
ADDRLP4 1136
INDIRF4
MULF4
SUBF4
ASGNF4
line 4180
;4180:		otherPos[1] = org_[1] - axis_[0][1]*12;
ADDRLP4 1124+4
ADDRLP4 1088+4
INDIRF4
CNSTF4 1094713344
ADDRLP4 1136+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 4181
;4181:		otherPos[2] = org_[2] - axis_[0][2]*12;
ADDRLP4 1124+8
ADDRLP4 1088+8
INDIRF4
CNSTF4 1094713344
ADDRLP4 1136+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 4183
;4182:
;4183:		otherDir[0] = -axis_[0][0];
ADDRLP4 1540
ADDRLP4 1136
INDIRF4
NEGF4
ASGNF4
line 4184
;4184:		otherDir[1] = -axis_[0][1];
ADDRLP4 1540+4
ADDRLP4 1136+4
INDIRF4
NEGF4
ASGNF4
line 4185
;4185:		otherDir[2] = -axis_[0][2];
ADDRLP4 1540+8
ADDRLP4 1136+8
INDIRF4
NEGF4
ASGNF4
line 4187
;4186:
;4187:		VectorMA( otherPos, dualSaberLen*dualLen, otherDir, otherEnd );
ADDRLP4 1636
ADDRLP4 1552
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
ASGNF4
ADDRLP4 1524
ADDRLP4 1124
INDIRF4
ADDRLP4 1540
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1524+4
ADDRLP4 1124+4
INDIRF4
ADDRLP4 1540+4
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1524+8
ADDRLP4 1124+8
INDIRF4
ADDRLP4 1540+8
INDIRF4
ADDRLP4 1552
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 4188
;4188:		VectorAdd( otherEnd, otherDir, otherEnd );
ADDRLP4 1524
ADDRLP4 1524
INDIRF4
ADDRLP4 1540
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1524+4
ADDRLP4 1524+4
INDIRF4
ADDRLP4 1540+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1524+8
ADDRLP4 1524+8
INDIRF4
ADDRLP4 1540+8
INDIRF4
ADDF4
ASGNF4
line 4189
;4189:	}
LABELV $2034
line 4191
;4190:
;4191:	scolor = cgs.clientinfo[cent->currentState.number].icolor1;
ADDRLP4 1560
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+104
ADDP4
INDIRI4
ASGNI4
line 4193
;4192:
;4193:	if (cgs.gametype >= GT_TEAM && !cgs.jediVmerc )
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $2060
ADDRGP4 cgs+32996
INDIRI4
CNSTI4 0
NEI4 $2060
line 4194
;4194:	{
line 4195
;4195:		if (cgs.clientinfo[cent->currentState.number].team == TEAM_RED)
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2064
line 4196
;4196:		{
line 4197
;4197:			scolor = SABER_RED;
ADDRLP4 1560
CNSTI4 0
ASGNI4
line 4198
;4198:		}
ADDRGP4 $2065
JUMPV
LABELV $2064
line 4199
;4199:		else if (cgs.clientinfo[cent->currentState.number].team == TEAM_BLUE)
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2068
line 4200
;4200:		{
line 4201
;4201:			scolor = SABER_BLUE;
ADDRLP4 1560
CNSTI4 4
ASGNI4
line 4202
;4202:		}
LABELV $2068
LABELV $2065
line 4203
;4203:	}
LABELV $2060
line 4205
;4204:
;4205:	if (!cg_saberContact.integer)
ADDRGP4 cg_saberContact+12
INDIRI4
CNSTI4 0
NEI4 $2072
line 4206
;4206:	{ //if we don't have saber contact enabled, just add the blade and don't care what it's touching
line 4207
;4207:		goto CheckTrail;
ADDRGP4 $2075
JUMPV
LABELV $2072
line 4211
;4208:	}
;4209:
;4210:#ifdef G2_COLLISION_ENABLED
;4211:	if (cg_saberModelTraceEffect.integer)
ADDRGP4 cg_saberModelTraceEffect+12
INDIRI4
CNSTI4 0
EQI4 $2076
line 4212
;4212:	{
line 4213
;4213:		CG_G2SaberEffects(org_, end, cent);
ADDRLP4 1088
ARGP4
ADDRLP4 1112
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_G2SaberEffects
CALLV
pop
line 4214
;4214:	}
LABELV $2076
line 4217
;4215:#endif
;4216:
;4217:	for ( i = 0; i < 1; i++ )//was 2 because it would go through architecture and leave saber trails on either side of the brush - but still looks bad if we hit a corner, blade is still 8 longer than hit
ADDRLP4 1080
CNSTI4 0
ASGNI4
LABELV $2079
line 4218
;4218:	{
line 4219
;4219:		if ( i )
ADDRLP4 1080
INDIRI4
CNSTI4 0
EQI4 $2083
line 4220
;4220:		{//tracing from end to base
line 4221
;4221:			CG_Trace( &trace, end, NULL, NULL, org_, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 1112
ARGP4
ADDRLP4 1636
CNSTP4 0
ASGNP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1088
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 4222
;4222:		}
ADDRGP4 $2084
JUMPV
LABELV $2083
line 4224
;4223:		else
;4224:		{//tracing from base to end
line 4225
;4225:			CG_Trace( &trace, org_, NULL, NULL, end, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 1088
ARGP4
ADDRLP4 1636
CNSTP4 0
ASGNP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1112
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 4226
;4226:		}
LABELV $2084
line 4228
;4227:		
;4228:		if ( trace.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $2085
line 4229
;4229:		{
line 4231
;4230:			vec3_t trDir;
;4231:			VectorCopy(trace.plane.normal, trDir);
ADDRLP4 1636
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4232
;4232:			if (!trDir[0] && !trDir[1] && !trDir[2])
ADDRLP4 1648
CNSTF4 0
ASGNF4
ADDRLP4 1636
INDIRF4
ADDRLP4 1648
INDIRF4
NEF4 $2089
ADDRLP4 1636+4
INDIRF4
ADDRLP4 1648
INDIRF4
NEF4 $2089
ADDRLP4 1636+8
INDIRF4
ADDRLP4 1648
INDIRF4
NEF4 $2089
line 4233
;4233:			{
line 4234
;4234:				trDir[1] = 1;
ADDRLP4 1636+4
CNSTF4 1065353216
ASGNF4
line 4235
;4235:			}
LABELV $2089
line 4236
;4236:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/spark.efx"), trace.endpos, trDir );
ADDRGP4 $2094
ARGP4
ADDRLP4 1652
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1652
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 1636
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 4239
;4237:
;4238:			//Stop saber? (it wouldn't look right if it was stuck through a thin wall and unable to hurt players on the other side)
;4239:			VectorSubtract(org_, trace.endpos, v);
ADDRLP4 1100
ADDRLP4 1088
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1088+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1088+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 4240
;4240:			saberLen = VectorLength(v);
ADDRLP4 1100
ARGP4
ADDRLP4 1656
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1520
ADDRLP4 1656
INDIRF4
ASGNF4
line 4242
;4241:
;4242:			VectorCopy(trace.endpos, end);
ADDRLP4 1112
ADDRLP4 0+12
INDIRB
ASGNB 12
line 4244
;4243:
;4244:			if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2106
line 4245
;4245:			{
line 4246
;4246:				break;
ADDRGP4 $2081
JUMPV
LABELV $2106
line 4250
;4247:			}
;4248:			// All I need is a bool to mark whether I have a previous point to work with.
;4249:			//....come up with something better..
;4250:			if ( client->saberTrail.haveOldPos[i] )
ADDRLP4 1080
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1084
INDIRP4
CNSTI4 592
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2108
line 4251
;4251:			{
line 4252
;4252:				if ( trace.entityNum == ENTITYNUM_WORLD )
ADDRLP4 0+52
INDIRI4
CNSTI4 1022
NEI4 $2109
line 4253
;4253:				{//only put marks on architecture
line 4255
;4254:					// Let's do some cool burn/glowing mark bits!!!
;4255:					CG_CreateSaberMarks( client->saberTrail.oldPos[i], trace.endpos, trace.plane.normal );
CNSTI4 12
ADDRLP4 1080
INDIRI4
MULI4
ADDRLP4 1084
INDIRP4
CNSTI4 600
ADDP4
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRGP4 CG_CreateSaberMarks
CALLV
pop
line 4258
;4256:				
;4257:					//make a sound
;4258:					if ( cg.time - client->saberHitWallSoundDebounceTime >= 100 )
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1084
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
SUBI4
CNSTI4 100
LTI4 $2109
line 4259
;4259:					{//ugh, need to have a real sound debouncer... or do this game-side
line 4260
;4260:						client->saberHitWallSoundDebounceTime = cg.time;
ADDRLP4 1084
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4261
;4261:						trap_S_StartSound ( trace.endpos, -1, CHAN_WEAPON, trap_S_RegisterSound( va("sound/weapons/saber/saberhitwall%i", Q_irand(1, 3)) ) );
CNSTI4 1
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1660
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $2120
ARGP4
ADDRLP4 1660
INDIRI4
ARGI4
ADDRLP4 1664
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1664
INDIRP4
ARGP4
ADDRLP4 1668
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0+12
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1668
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 4262
;4262:					}
line 4263
;4263:				}
line 4264
;4264:			}
ADDRGP4 $2109
JUMPV
LABELV $2108
line 4266
;4265:			else
;4266:			{
line 4268
;4267:				// if we impact next frame, we'll mark a slash mark
;4268:				client->saberTrail.haveOldPos[i] = qtrue;
ADDRLP4 1080
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1084
INDIRP4
CNSTI4 592
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4271
;4269://				CG_ImpactMark( cgs.media.rivetMarkShader, client->saberTrail.oldPos[i], client->saberTrail.oldNormal[i],
;4270://						0.0f, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, 1.1f, qfalse );
;4271:			}
LABELV $2109
line 4274
;4272:
;4273:			// stash point so we can connect-the-dots later
;4274:			VectorCopy( trace.endpos, client->saberTrail.oldPos[i] );
CNSTI4 12
ADDRLP4 1080
INDIRI4
MULI4
ADDRLP4 1084
INDIRP4
CNSTI4 600
ADDP4
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 4275
;4275:			VectorCopy( trace.plane.normal, client->saberTrail.oldNormal[i] );
CNSTI4 12
ADDRLP4 1080
INDIRI4
MULI4
ADDRLP4 1084
INDIRP4
CNSTI4 624
ADDP4
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4276
;4276:		}
ADDRGP4 $2086
JUMPV
LABELV $2085
line 4278
;4277:		else
;4278:		{
line 4279
;4279:			if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2123
line 4280
;4280:			{
line 4281
;4281:				break;
ADDRGP4 $2081
JUMPV
LABELV $2123
line 4284
;4282:			}
;4283:
;4284:			if ( client->saberTrail.haveOldPos[i] )
ADDRLP4 1080
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1084
INDIRP4
CNSTI4 592
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2125
line 4285
;4285:			{
line 4291
;4286:				// Hmmm, no impact this frame, but we have an old point
;4287:				// Let's put the mark there, we should use an endcap mark to close the line, but we 
;4288:				//	can probably just get away with a round mark
;4289://					CG_ImpactMark( cgs.media.rivetMarkShader, client->saberTrail.oldPos[i], client->saberTrail.oldNormal[i],
;4290://							0.0f, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, 1.1f, qfalse );
;4291:			}
LABELV $2125
line 4294
;4292:
;4293:			// we aren't impacting, so turn off our mark tracking mechanism
;4294:			client->saberTrail.haveOldPos[i] = qfalse;
ADDRLP4 1080
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1084
INDIRP4
CNSTI4 592
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4295
;4295:		}
LABELV $2086
line 4296
;4296:	}
LABELV $2080
line 4217
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 1
LTI4 $2079
LABELV $2081
line 4298
;4297:
;4298:	if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2127
line 4299
;4299:	{
line 4300
;4300:		for ( i = 0; i < 1; i++ )//was 2 because it would go through architecture and leave saber trails on either side of the brush - but still looks bad if we hit a corner, blade is still 8 longer than hit
ADDRLP4 1080
CNSTI4 0
ASGNI4
LABELV $2129
line 4301
;4301:		{
line 4302
;4302:			CG_Trace( &trace, otherPos, NULL, NULL, otherEnd, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 1124
ARGP4
ADDRLP4 1636
CNSTP4 0
ASGNP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1524
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 4304
;4303:		
;4304:			if ( trace.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $2133
line 4305
;4305:			{
line 4307
;4306:				vec3_t trDir;
;4307:				VectorCopy(trace.plane.normal, trDir);
ADDRLP4 1640
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4308
;4308:				if (!trDir[0] && !trDir[1] && !trDir[2])
ADDRLP4 1652
CNSTF4 0
ASGNF4
ADDRLP4 1640
INDIRF4
ADDRLP4 1652
INDIRF4
NEF4 $2137
ADDRLP4 1640+4
INDIRF4
ADDRLP4 1652
INDIRF4
NEF4 $2137
ADDRLP4 1640+8
INDIRF4
ADDRLP4 1652
INDIRF4
NEF4 $2137
line 4309
;4309:				{
line 4310
;4310:					trDir[1] = 1;
ADDRLP4 1640+4
CNSTF4 1065353216
ASGNF4
line 4311
;4311:				}
LABELV $2137
line 4313
;4312:
;4313:				trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/spark.efx"), trace.endpos, trDir );
ADDRGP4 $2094
ARGP4
ADDRLP4 1656
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1656
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 1640
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 4316
;4314:
;4315:				//Stop saber? (it wouldn't look right if it was stuck through a thin wall and unable to hurt players on the other side)
;4316:				VectorSubtract(otherPos, trace.endpos, v);
ADDRLP4 1100
ADDRLP4 1124
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1124+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1124+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 4317
;4317:				dualSaberLen = VectorLength(v);
ADDRLP4 1100
ARGP4
ADDRLP4 1660
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1552
ADDRLP4 1660
INDIRF4
ASGNF4
line 4319
;4318:
;4319:				VectorCopy(trace.endpos, end);
ADDRLP4 1112
ADDRLP4 0+12
INDIRB
ASGNB 12
line 4320
;4320:			}
LABELV $2133
line 4321
;4321:		}
LABELV $2130
line 4300
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 1
LTI4 $2129
line 4322
;4322:	}
LABELV $2127
LABELV $2075
line 4325
;4323:CheckTrail:
;4324:
;4325:	if (!cg_saberTrail.integer)
ADDRGP4 cg_saberTrail+12
INDIRI4
CNSTI4 0
NEI4 $2153
line 4326
;4326:	{ //don't do the trail in this case
line 4327
;4327:		goto JustDoIt;
ADDRGP4 $2156
JUMPV
LABELV $2153
line 4330
;4328:	}
;4329:
;4330:	saberTrail = &client->saberTrail;
ADDRLP4 1536
ADDRLP4 1084
INDIRP4
CNSTI4 532
ADDP4
ASGNP4
line 4334
;4331:
;4332:	// if we happen to be timescaled or running in a high framerate situation, we don't want to flood
;4333:	//	the system with very small trail slices...but perhaps doing it by distance would yield better results?
;4334:	if ( cg.time > saberTrail->lastTime + 2 ) // 2ms
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1536
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
ADDI4
LEI4 $2157
line 4335
;4335:	{
line 4336
;4336:		if ( (saberMoveData[cent->currentState.saberMove].trailLength > 0 || ((cent->currentState.powerups & (1 << PW_SPEED) && cg_speedTrail.integer)) || cent->currentState.saberInFlight) && cg.time < saberTrail->lastTime + 2000 ) // if we have a stale segment, don't draw until we have a fresh one
ADDRLP4 1636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1640
CNSTI4 0
ASGNI4
CNSTI4 40
ADDRLP4 1636
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+36
ADDP4
INDIRI4
ADDRLP4 1640
INDIRI4
GTI4 $2166
ADDRLP4 1636
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 1640
INDIRI4
EQI4 $2167
ADDRGP4 cg_speedTrail+12
INDIRI4
ADDRLP4 1640
INDIRI4
NEI4 $2166
LABELV $2167
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2160
LABELV $2166
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1536
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2000
ADDI4
GEI4 $2160
line 4337
;4337:		{
line 4338
;4338:			vec3_t	rgb1={255.0f,255.0f,255.0f};
ADDRLP4 1644
ADDRGP4 $2168
INDIRB
ASGNB 12
line 4340
;4339:
;4340:			switch( scolor )
ADDRLP4 1560
INDIRI4
CNSTI4 0
LTI4 $2169
ADDRLP4 1560
INDIRI4
CNSTI4 5
GTI4 $2169
ADDRLP4 1560
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2191
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2191
address $2171
address $2174
address $2177
address $2180
address $2183
address $2186
code
line 4341
;4341:			{
LABELV $2171
line 4343
;4342:				case SABER_RED:
;4343:					VectorSet( rgb1, 255.0f, 0.0f, 0.0f );
ADDRLP4 1644
CNSTF4 1132396544
ASGNF4
ADDRLP4 1644+4
CNSTF4 0
ASGNF4
ADDRLP4 1644+8
CNSTF4 0
ASGNF4
line 4344
;4344:					break;
ADDRGP4 $2170
JUMPV
LABELV $2174
line 4346
;4345:				case SABER_ORANGE:
;4346:					VectorSet( rgb1, 255.0f, 64.0f, 0.0f );
ADDRLP4 1644
CNSTF4 1132396544
ASGNF4
ADDRLP4 1644+4
CNSTF4 1115684864
ASGNF4
ADDRLP4 1644+8
CNSTF4 0
ASGNF4
line 4347
;4347:					break;
ADDRGP4 $2170
JUMPV
LABELV $2177
line 4349
;4348:				case SABER_YELLOW:
;4349:					VectorSet( rgb1, 255.0f, 255.0f, 0.0f );
ADDRLP4 1660
CNSTF4 1132396544
ASGNF4
ADDRLP4 1644
ADDRLP4 1660
INDIRF4
ASGNF4
ADDRLP4 1644+4
ADDRLP4 1660
INDIRF4
ASGNF4
ADDRLP4 1644+8
CNSTF4 0
ASGNF4
line 4350
;4350:					break;
ADDRGP4 $2170
JUMPV
LABELV $2180
line 4352
;4351:				case SABER_GREEN:
;4352:					VectorSet( rgb1, 0.0f, 255.0f, 0.0f );
ADDRLP4 1644
CNSTF4 0
ASGNF4
ADDRLP4 1644+4
CNSTF4 1132396544
ASGNF4
ADDRLP4 1644+8
CNSTF4 0
ASGNF4
line 4353
;4353:					break;
ADDRGP4 $2170
JUMPV
LABELV $2183
line 4355
;4354:				case SABER_BLUE:
;4355:					VectorSet( rgb1, 0.0f, 64.0f, 255.0f );
ADDRLP4 1644
CNSTF4 0
ASGNF4
ADDRLP4 1644+4
CNSTF4 1115684864
ASGNF4
ADDRLP4 1644+8
CNSTF4 1132396544
ASGNF4
line 4356
;4356:					break;
ADDRGP4 $2170
JUMPV
LABELV $2186
line 4358
;4357:				case SABER_PURPLE:
;4358:					VectorSet( rgb1, 220.0f, 0.0f, 255.0f );
ADDRLP4 1644
CNSTF4 1130102784
ASGNF4
ADDRLP4 1644+4
CNSTF4 0
ASGNF4
ADDRLP4 1644+8
CNSTF4 1132396544
ASGNF4
line 4359
;4359:					break;
ADDRGP4 $2170
JUMPV
LABELV $2169
line 4361
;4360:				default:
;4361:					VectorSet( rgb1, 0.0f, 64.0f, 255.0f );
ADDRLP4 1644
CNSTF4 0
ASGNF4
ADDRLP4 1644+4
CNSTF4 1115684864
ASGNF4
ADDRLP4 1644+8
CNSTF4 1132396544
ASGNF4
line 4362
;4362:					break;
LABELV $2170
line 4371
;4363:			}
;4364:
;4365:			//Here we will use the happy process of filling a struct in with arguments and passing it to a trap function
;4366:			//so that we can take the struct and fill in an actual CTrail type using the data within it once we get it
;4367:			//into the effects area
;4368:
;4369:			// Go from new muzzle to new end...then to old end...back down to old muzzle...finally
;4370:			//	connect back to the new muzzle...this is our trail quad
;4371:			VectorCopy( org_, fx.mVerts[0].origin );
ADDRLP4 1172
ADDRLP4 1088
INDIRB
ASGNB 12
line 4372
;4372:			VectorMA( end, 3.0f, axis_[0], fx.mVerts[1].origin );
ADDRLP4 1172+84
ADDRLP4 1112
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1172+84+4
ADDRLP4 1112+4
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1172+84+8
ADDRLP4 1112+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4374
;4373:
;4374:			VectorCopy( saberTrail->tip, fx.mVerts[2].origin );
ADDRLP4 1172+168
ADDRLP4 1536
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 4375
;4375:			VectorCopy( saberTrail->base, fx.mVerts[3].origin );
ADDRLP4 1172+252
ADDRLP4 1536
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 4377
;4376:
;4377:			diff = cg.time - saberTrail->lastTime;
ADDRLP4 1628
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1536
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4382
;4378:
;4379:			// I'm not sure that clipping this is really the best idea
;4380:			//This prevents the trail from showing at all in low framerate situations.
;4381:			//if ( diff <= SABER_TRAIL_TIME * 2 )
;4382:			{
line 4383
;4383:				float oldAlpha = 1.0f - ( diff / SABER_TRAIL_TIME );
ADDRLP4 1660
CNSTF4 1065353216
ADDRLP4 1628
INDIRF4
CNSTF4 1109393408
DIVF4
SUBF4
ASGNF4
line 4386
;4384:
;4385:				// New muzzle
;4386:				VectorCopy( rgb1, fx.mVerts[0].rgb );
ADDRLP4 1172+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4387
;4387:				fx.mVerts[0].alpha = 255.0f;
ADDRLP4 1172+48
CNSTF4 1132396544
ASGNF4
line 4389
;4388:
;4389:				fx.mVerts[0].ST[0] = 0.0f;
ADDRLP4 1172+60
CNSTF4 0
ASGNF4
line 4390
;4390:				fx.mVerts[0].ST[1] = 1.0f;
ADDRLP4 1172+60+4
CNSTF4 1065353216
ASGNF4
line 4391
;4391:				fx.mVerts[0].destST[0] = 1.0f;
ADDRLP4 1172+68
CNSTF4 1065353216
ASGNF4
line 4392
;4392:				fx.mVerts[0].destST[1] = 1.0f;
ADDRLP4 1172+68+4
CNSTF4 1065353216
ASGNF4
line 4395
;4393:
;4394:				// new tip
;4395:				VectorCopy( rgb1, fx.mVerts[1].rgb );
ADDRLP4 1172+84+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4396
;4396:				fx.mVerts[1].alpha = 255.0f;
ADDRLP4 1172+84+48
CNSTF4 1132396544
ASGNF4
line 4398
;4397:				
;4398:				fx.mVerts[1].ST[0] = 0.0f;
ADDRLP4 1172+84+60
CNSTF4 0
ASGNF4
line 4399
;4399:				fx.mVerts[1].ST[1] = 0.0f;
ADDRLP4 1172+84+60+4
CNSTF4 0
ASGNF4
line 4400
;4400:				fx.mVerts[1].destST[0] = 1.0f;
ADDRLP4 1172+84+68
CNSTF4 1065353216
ASGNF4
line 4401
;4401:				fx.mVerts[1].destST[1] = 0.0f;
ADDRLP4 1172+84+68+4
CNSTF4 0
ASGNF4
line 4404
;4402:
;4403:				// old tip
;4404:				VectorCopy( rgb1, fx.mVerts[2].rgb );
ADDRLP4 1172+168+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4405
;4405:				fx.mVerts[2].alpha = 255.0f;
ADDRLP4 1172+168+48
CNSTF4 1132396544
ASGNF4
line 4407
;4406:
;4407:				fx.mVerts[2].ST[0] = 1.0f - oldAlpha; // NOTE: this just happens to contain the value I want
ADDRLP4 1172+168+60
CNSTF4 1065353216
ADDRLP4 1660
INDIRF4
SUBF4
ASGNF4
line 4408
;4408:				fx.mVerts[2].ST[1] = 0.0f;
ADDRLP4 1172+168+60+4
CNSTF4 0
ASGNF4
line 4409
;4409:				fx.mVerts[2].destST[0] = 1.0f + fx.mVerts[2].ST[0];
ADDRLP4 1172+168+68
ADDRLP4 1172+168+60
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4410
;4410:				fx.mVerts[2].destST[1] = 0.0f;
ADDRLP4 1172+168+68+4
CNSTF4 0
ASGNF4
line 4413
;4411:
;4412:				// old muzzle
;4413:				VectorCopy( rgb1, fx.mVerts[3].rgb );
ADDRLP4 1172+252+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4414
;4414:				fx.mVerts[3].alpha = 255.0f;
ADDRLP4 1172+252+48
CNSTF4 1132396544
ASGNF4
line 4416
;4415:
;4416:				fx.mVerts[3].ST[0] = 1.0f - oldAlpha; // NOTE: this just happens to contain the value I want
ADDRLP4 1172+252+60
CNSTF4 1065353216
ADDRLP4 1660
INDIRF4
SUBF4
ASGNF4
line 4417
;4417:				fx.mVerts[3].ST[1] = 1.0f;
ADDRLP4 1172+252+60+4
CNSTF4 1065353216
ASGNF4
line 4418
;4418:				fx.mVerts[3].destST[0] = 1.0f + fx.mVerts[2].ST[0];
ADDRLP4 1172+252+68
ADDRLP4 1172+168+60
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4419
;4419:				fx.mVerts[3].destST[1] = 1.0f;
ADDRLP4 1172+252+68+4
CNSTF4 1065353216
ASGNF4
line 4421
;4420:		
;4421:				fx.mShader = cgs.media.saberBlurShader;
ADDRLP4 1172+336
ADDRGP4 cgs+70296+164
INDIRI4
ASGNI4
line 4422
;4422:				fx.mSetFlags = FX_USE_ALPHA;
ADDRLP4 1172+340
CNSTI4 134217728
ASGNI4
line 4423
;4423:				fx.mKillTime = SABER_TRAIL_TIME;
ADDRLP4 1172+344
CNSTI4 40
ASGNI4
line 4425
;4424:
;4425:				trap_FX_AddPrimitive(&fx);
ADDRLP4 1172
ARGP4
ADDRGP4 trap_FX_AddPrimitive
CALLV
pop
line 4426
;4426:			}
line 4428
;4427:
;4428:			if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2263
line 4429
;4429:			{
line 4430
;4430:				float oldAlpha = 1.0f - ( diff / SABER_TRAIL_TIME );
ADDRLP4 1660
CNSTF4 1065353216
ADDRLP4 1628
INDIRF4
CNSTF4 1109393408
DIVF4
SUBF4
ASGNF4
line 4432
;4431:
;4432:				VectorCopy( otherPos, fx.mVerts[0].origin );
ADDRLP4 1172
ADDRLP4 1124
INDIRB
ASGNB 12
line 4433
;4433:				VectorMA( otherEnd, 3.0f, otherDir, fx.mVerts[1].origin );
ADDRLP4 1172+84
ADDRLP4 1524
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1172+84+4
ADDRLP4 1524+4
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1172+84+8
ADDRLP4 1524+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4435
;4434:
;4435:				VectorCopy( saberTrail->dualtip, fx.mVerts[2].origin );
ADDRLP4 1172+168
ADDRLP4 1536
INDIRP4
CNSTI4 48
ADDP4
INDIRB
ASGNB 12
line 4436
;4436:				VectorCopy( saberTrail->dualbase, fx.mVerts[3].origin );
ADDRLP4 1172+252
ADDRLP4 1536
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 4439
;4437:
;4438:				// New muzzle
;4439:				VectorCopy( rgb1, fx.mVerts[0].rgb );
ADDRLP4 1172+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4440
;4440:				fx.mVerts[0].alpha = 255.0f;
ADDRLP4 1172+48
CNSTF4 1132396544
ASGNF4
line 4442
;4441:
;4442:				fx.mVerts[0].ST[0] = 0.0f;
ADDRLP4 1172+60
CNSTF4 0
ASGNF4
line 4443
;4443:				fx.mVerts[0].ST[1] = 1.0f;
ADDRLP4 1172+60+4
CNSTF4 1065353216
ASGNF4
line 4444
;4444:				fx.mVerts[0].destST[0] = 1.0f;
ADDRLP4 1172+68
CNSTF4 1065353216
ASGNF4
line 4445
;4445:				fx.mVerts[0].destST[1] = 1.0f;
ADDRLP4 1172+68+4
CNSTF4 1065353216
ASGNF4
line 4448
;4446:
;4447:				// new tip
;4448:				VectorCopy( rgb1, fx.mVerts[1].rgb );
ADDRLP4 1172+84+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4449
;4449:				fx.mVerts[1].alpha = 255.0f;
ADDRLP4 1172+84+48
CNSTF4 1132396544
ASGNF4
line 4451
;4450:				
;4451:				fx.mVerts[1].ST[0] = 0.0f;
ADDRLP4 1172+84+60
CNSTF4 0
ASGNF4
line 4452
;4452:				fx.mVerts[1].ST[1] = 0.0f;
ADDRLP4 1172+84+60+4
CNSTF4 0
ASGNF4
line 4453
;4453:				fx.mVerts[1].destST[0] = 1.0f;
ADDRLP4 1172+84+68
CNSTF4 1065353216
ASGNF4
line 4454
;4454:				fx.mVerts[1].destST[1] = 0.0f;
ADDRLP4 1172+84+68+4
CNSTF4 0
ASGNF4
line 4457
;4455:
;4456:				// old tip
;4457:				VectorCopy( rgb1, fx.mVerts[2].rgb );
ADDRLP4 1172+168+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4458
;4458:				fx.mVerts[2].alpha = 255.0f;
ADDRLP4 1172+168+48
CNSTF4 1132396544
ASGNF4
line 4460
;4459:
;4460:				fx.mVerts[2].ST[0] = 1.0f - oldAlpha; // NOTE: this just happens to contain the value I want
ADDRLP4 1172+168+60
CNSTF4 1065353216
ADDRLP4 1660
INDIRF4
SUBF4
ASGNF4
line 4461
;4461:				fx.mVerts[2].ST[1] = 0.0f;
ADDRLP4 1172+168+60+4
CNSTF4 0
ASGNF4
line 4462
;4462:				fx.mVerts[2].destST[0] = 1.0f + fx.mVerts[2].ST[0];
ADDRLP4 1172+168+68
ADDRLP4 1172+168+60
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4463
;4463:				fx.mVerts[2].destST[1] = 0.0f;
ADDRLP4 1172+168+68+4
CNSTF4 0
ASGNF4
line 4466
;4464:
;4465:				// old muzzle
;4466:				VectorCopy( rgb1, fx.mVerts[3].rgb );
ADDRLP4 1172+252+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4467
;4467:				fx.mVerts[3].alpha = 255.0f;
ADDRLP4 1172+252+48
CNSTF4 1132396544
ASGNF4
line 4469
;4468:
;4469:				fx.mVerts[3].ST[0] = 1.0f - oldAlpha; // NOTE: this just happens to contain the value I want
ADDRLP4 1172+252+60
CNSTF4 1065353216
ADDRLP4 1660
INDIRF4
SUBF4
ASGNF4
line 4470
;4470:				fx.mVerts[3].ST[1] = 1.0f;
ADDRLP4 1172+252+60+4
CNSTF4 1065353216
ASGNF4
line 4471
;4471:				fx.mVerts[3].destST[0] = 1.0f + fx.mVerts[2].ST[0];
ADDRLP4 1172+252+68
ADDRLP4 1172+168+60
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4472
;4472:				fx.mVerts[3].destST[1] = 1.0f;
ADDRLP4 1172+252+68+4
CNSTF4 1065353216
ASGNF4
line 4474
;4473:		
;4474:				fx.mShader = cgs.media.saberBlurShader;
ADDRLP4 1172+336
ADDRGP4 cgs+70296+164
INDIRI4
ASGNI4
line 4475
;4475:				fx.mSetFlags = FX_USE_ALPHA;
ADDRLP4 1172+340
CNSTI4 134217728
ASGNI4
line 4476
;4476:				fx.mKillTime = SABER_TRAIL_TIME;
ADDRLP4 1172+344
CNSTI4 40
ASGNI4
line 4478
;4477:
;4478:				trap_FX_AddPrimitive(&fx);
ADDRLP4 1172
ARGP4
ADDRGP4 trap_FX_AddPrimitive
CALLV
pop
line 4479
;4479:			}
LABELV $2263
line 4480
;4480:		}
LABELV $2160
line 4483
;4481:
;4482:		// we must always do this, even if we aren't active..otherwise we won't know where to pick up from
;4483:		VectorCopy( org_, saberTrail->base );
ADDRLP4 1536
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1088
INDIRB
ASGNB 12
line 4484
;4484:		VectorMA( end, 3.0f, axis_[0], saberTrail->tip );
ADDRLP4 1536
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1112
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1536
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 1112+4
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1536
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1112+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4485
;4485:		saberTrail->lastTime = cg.time;
ADDRLP4 1536
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4487
;4486:
;4487:		if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2340
line 4488
;4488:		{
line 4489
;4489:			VectorCopy( otherPos, saberTrail->dualbase );
ADDRLP4 1536
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1124
INDIRB
ASGNB 12
line 4490
;4490:			VectorMA( otherEnd, 3.0f, otherDir, saberTrail->dualtip );
ADDRLP4 1536
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 1524
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1536
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1524+4
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1536
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 1524+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4491
;4491:		}
LABELV $2340
line 4492
;4492:	}
LABELV $2157
LABELV $2156
line 4496
;4493:
;4494:JustDoIt:
;4495:
;4496:	if (client && cent->currentState.bolt2)
ADDRLP4 1084
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2346
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2346
line 4497
;4497:	{
line 4498
;4498:		float sideOneLen = saberLen*dualLen;
ADDRLP4 1636
ADDRLP4 1520
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
ASGNF4
line 4499
;4499:		float sideTwoLen = dualSaberLen*dualLen;
ADDRLP4 1640
ADDRLP4 1552
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
ASGNF4
line 4501
;4500:
;4501:		if (sideOneLen < 1)
ADDRLP4 1636
INDIRF4
CNSTF4 1065353216
GEF4 $2348
line 4502
;4502:		{
line 4503
;4503:			sideOneLen = 1;
ADDRLP4 1636
CNSTF4 1065353216
ASGNF4
line 4504
;4504:		}
LABELV $2348
line 4506
;4505:		
;4506:		CG_DoSaber( org_, axis_[0], sideOneLen, scolor, renderfx );
ADDRLP4 1088
ARGP4
ADDRLP4 1136
ARGP4
ADDRLP4 1636
INDIRF4
ARGF4
ADDRLP4 1560
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DoSaber
CALLV
pop
line 4508
;4507:
;4508:		CG_DoSaber( otherPos, otherDir, sideTwoLen, scolor, renderfx );
ADDRLP4 1124
ARGP4
ADDRLP4 1540
ARGP4
ADDRLP4 1640
INDIRF4
ARGF4
ADDRLP4 1560
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DoSaber
CALLV
pop
line 4509
;4509:	}
ADDRGP4 $2347
JUMPV
LABELV $2346
line 4511
;4510:	else
;4511:	{
line 4514
;4512:		// Pass in the renderfx flags attached to the saber weapon model...this is done so that saber glows
;4513:		//	will get rendered properly in a mirror...not sure if this is necessary??
;4514:		CG_DoSaber( org_, axis_[0], saberLen, scolor, renderfx );
ADDRLP4 1088
ARGP4
ADDRLP4 1136
ARGP4
ADDRLP4 1520
INDIRF4
ARGF4
ADDRLP4 1560
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DoSaber
CALLV
pop
line 4515
;4515:	}
LABELV $2347
line 4516
;4516:}
LABELV $1983
endproc CG_AddSaberBlade 1672 36
export CG_IsMindTricked
proc CG_IsMindTricked 8 0
line 4519
;4517:
;4518:int CG_IsMindTricked(int trickIndex1, int trickIndex2, int trickIndex3, int trickIndex4, int client)
;4519:{
line 4521
;4520:	int checkIn;
;4521:	int sub = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4523
;4522:
;4523:	if (cg_entities[client].currentState.forcePowersActive & (1 << FP_SEE))
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+240
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $2351
line 4524
;4524:	{
line 4525
;4525:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2350
JUMPV
LABELV $2351
line 4528
;4526:	}
;4527:
;4528:	if (client > 47)
ADDRFP4 16
INDIRI4
CNSTI4 47
LEI4 $2354
line 4529
;4529:	{
line 4530
;4530:		checkIn = trickIndex4;
ADDRLP4 4
ADDRFP4 12
INDIRI4
ASGNI4
line 4531
;4531:		sub = 48;
ADDRLP4 0
CNSTI4 48
ASGNI4
line 4532
;4532:	}
ADDRGP4 $2355
JUMPV
LABELV $2354
line 4533
;4533:	else if (client > 31)
ADDRFP4 16
INDIRI4
CNSTI4 31
LEI4 $2356
line 4534
;4534:	{
line 4535
;4535:		checkIn = trickIndex3;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
line 4536
;4536:		sub = 32;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 4537
;4537:	}
ADDRGP4 $2357
JUMPV
LABELV $2356
line 4538
;4538:	else if (client > 15)
ADDRFP4 16
INDIRI4
CNSTI4 15
LEI4 $2358
line 4539
;4539:	{
line 4540
;4540:		checkIn = trickIndex2;
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
line 4541
;4541:		sub = 16;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 4542
;4542:	}
ADDRGP4 $2359
JUMPV
LABELV $2358
line 4544
;4543:	else
;4544:	{
line 4545
;4545:		checkIn = trickIndex1;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 4546
;4546:	}
LABELV $2359
LABELV $2357
LABELV $2355
line 4548
;4547:
;4548:	if (checkIn & (1 << (client-sub)))
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRFP4 16
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2360
line 4549
;4549:	{
line 4550
;4550:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2350
JUMPV
LABELV $2360
line 4553
;4551:	}
;4552:	
;4553:	return 0;
CNSTI4 0
RETI4
LABELV $2350
endproc CG_IsMindTricked 8 0
export CG_DrawPlayerSphere
proc CG_DrawPlayerSphere 216 12
line 4559
;4554:}
;4555:
;4556:#define SPEED_TRAIL_DISTANCE 6
;4557:
;4558:void CG_DrawPlayerSphere(centity_t *cent, vec3_t origin, float scale, int shader)
;4559:{
line 4563
;4560:	refEntity_t ent;
;4561:	
;4562:	// Don't draw the shield when the player is dead.
;4563:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2363
line 4564
;4564:	{
line 4565
;4565:		return;
ADDRGP4 $2362
JUMPV
LABELV $2363
line 4568
;4566:	}
;4567:
;4568:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4570
;4569:
;4570:	VectorCopy( origin, ent.origin );
ADDRLP4 0+52
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4571
;4571:	ent.origin[2] += 9.0;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 4573
;4572:
;4573:	VectorSubtract(cg.refdef.vieworg, ent.origin, ent.axis[0]);
ADDRLP4 0+12
ADDRGP4 cg+3616+24
INDIRF4
ADDRLP4 0+52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+4
ADDRGP4 cg+3616+24+4
INDIRF4
ADDRLP4 0+52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+8
ADDRGP4 cg+3616+24+8
INDIRF4
ADDRLP4 0+52+8
INDIRF4
SUBF4
ASGNF4
line 4574
;4574:	if (VectorNormalize(ent.axis[0]) <= 0.1f)
ADDRLP4 0+12
ARGP4
ADDRLP4 212
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 212
INDIRF4
CNSTF4 1036831949
GTF4 $2386
line 4575
;4575:	{	// Entity is right on vieworg.  quit.
line 4576
;4576:		return;
ADDRGP4 $2362
JUMPV
LABELV $2386
line 4579
;4577:	}
;4578:
;4579:	VectorCopy(cg.refdef.viewaxis[2], ent.axis[2]);
ADDRLP4 0+12+24
ADDRGP4 cg+3616+36+24
INDIRB
ASGNB 12
line 4580
;4580:	CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
ADDRLP4 0+12
ARGP4
ADDRLP4 0+12+24
ARGP4
ADDRLP4 0+12+12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4582
;4581:
;4582:	VectorScale(ent.axis[0], scale, ent.axis[0]);
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 4583
;4583:	VectorScale(ent.axis[1], scale, ent.axis[1]);
ADDRLP4 0+12+12
ADDRLP4 0+12+12
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+4
ADDRLP4 0+12+12+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+8
ADDRLP4 0+12+12+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 4584
;4584:	VectorScale(ent.axis[2], -scale, ent.axis[2]);
ADDRLP4 0+12+24
ADDRLP4 0+12+24
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 0+12+24+4
ADDRLP4 0+12+24+4
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 0+12+24+8
ADDRLP4 0+12+24+8
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
line 4586
;4585:
;4586:	ent.hModel = cgs.media.halfShieldModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+900
INDIRI4
ASGNI4
line 4587
;4587:	ent.customShader = shader;	
ADDRLP4 0+76
ADDRFP4 12
INDIRI4
ASGNI4
line 4589
;4588:
;4589:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 4590
;4590:}
LABELV $2362
endproc CG_DrawPlayerSphere 216 12
export CG_AddLightningBeam
proc CG_AddLightningBeam 276 4
line 4593
;4591:
;4592:void CG_AddLightningBeam(vec3_t start, vec3_t end)
;4593:{
line 4602
;4594:	vec3_t	dir, chaos,
;4595:			c1, c2,
;4596:			v1, v2;
;4597:	float	len,
;4598:			s1, s2, s3;
;4599:
;4600:	addbezierArgStruct_t b;
;4601:
;4602:	VectorCopy(start, b.start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 4603
;4603:	VectorCopy(end, b.end);
ADDRLP4 0+12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4605
;4604:
;4605:	VectorSubtract( b.end, b.start, dir );
ADDRLP4 152
ADDRLP4 0+12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 152+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 152+8
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 4606
;4606:	len = VectorNormalize( dir );
ADDRLP4 152
ARGP4
ADDRLP4 224
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 148
ADDRLP4 224
INDIRF4
ASGNF4
line 4609
;4607:
;4608:	// Get the base control points, we'll work from there
;4609:	VectorMA( b.start, 0.3333f * len, dir, c1 );
ADDRLP4 228
CNSTF4 1051371084
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 164
ADDRLP4 0
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 228
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 164+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 152+4
INDIRF4
ADDRLP4 228
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 164+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 1051371084
ADDRLP4 148
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 4610
;4610:	VectorMA( b.start, 0.6666f * len, dir, c2 );
ADDRLP4 232
CNSTF4 1059759692
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 176
ADDRLP4 0
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 232
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 152+4
INDIRF4
ADDRLP4 232
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 176+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 1059759692
ADDRLP4 148
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 4613
;4611:
;4612:	// get some chaos values that really aren't very chaotic :)
;4613:	s1 = sin( cg.time * 0.005f ) * 2 + crandom() * 0.2f;
CNSTF4 1000593162
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 236
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 240
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 188
CNSTF4 1073741824
ADDRLP4 236
INDIRF4
MULF4
CNSTF4 1045220557
CNSTF4 1073741824
ADDRLP4 240
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
ASGNF4
line 4614
;4614:	s2 = sin( cg.time * 0.001f );
CNSTF4 981668463
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 244
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 192
ADDRLP4 244
INDIRF4
ASGNF4
line 4615
;4615:	s3 = sin( cg.time * 0.011f );
CNSTF4 1010055512
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 248
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 196
ADDRLP4 248
INDIRF4
ASGNF4
line 4617
;4616:
;4617:	VectorSet( chaos, len * 0.01f * s1,
ADDRLP4 136
CNSTF4 1008981770
ADDRLP4 148
INDIRF4
MULF4
ADDRLP4 188
INDIRF4
MULF4
ASGNF4
ADDRLP4 136+4
CNSTF4 1017370378
ADDRLP4 148
INDIRF4
MULF4
ADDRLP4 192
INDIRF4
MULF4
ASGNF4
ADDRLP4 136+8
CNSTF4 1025758986
ADDRLP4 148
INDIRF4
MULF4
ADDRLP4 188
INDIRF4
ADDRLP4 192
INDIRF4
ADDF4
ADDRLP4 196
INDIRF4
ADDF4
MULF4
ASGNF4
line 4621
;4618:						len * 0.02f * s2,
;4619:						len * 0.04f * (s1 + s2 + s3));
;4620:
;4621:	VectorAdd( c1, chaos, c1 );
ADDRLP4 164
ADDRLP4 164
INDIRF4
ADDRLP4 136
INDIRF4
ADDF4
ASGNF4
ADDRLP4 164+4
ADDRLP4 164+4
INDIRF4
ADDRLP4 136+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
ADDRLP4 136+8
INDIRF4
ADDF4
ASGNF4
line 4622
;4622:	VectorScale( chaos, 4.0f, v1 );
ADDRLP4 256
CNSTF4 1082130432
ASGNF4
ADDRLP4 200
ADDRLP4 256
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ASGNF4
ADDRLP4 200+4
ADDRLP4 256
INDIRF4
ADDRLP4 136+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 200+8
CNSTF4 1082130432
ADDRLP4 136+8
INDIRF4
MULF4
ASGNF4
line 4624
;4623:
;4624:	VectorSet( chaos, -len * 0.02f * s3,
ADDRLP4 136
CNSTF4 1017370378
ADDRLP4 148
INDIRF4
NEGF4
MULF4
ADDRLP4 196
INDIRF4
MULF4
ASGNF4
ADDRLP4 136+4
CNSTF4 1008981770
ADDRLP4 148
INDIRF4
MULF4
ADDRLP4 188
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 136+8
CNSTF4 1017370378
ADDRLP4 148
INDIRF4
NEGF4
MULF4
ADDRLP4 188
INDIRF4
ADDRLP4 192
INDIRF4
ADDRLP4 196
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 4628
;4625:						len * 0.01f * (s1 * s2),
;4626:						-len * 0.02f * (s1 + s2 * s3));
;4627:
;4628:	VectorAdd( c2, chaos, c2 );
ADDRLP4 176
ADDRLP4 176
INDIRF4
ADDRLP4 136
INDIRF4
ADDF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 176+4
INDIRF4
ADDRLP4 136+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 176+8
ADDRLP4 176+8
INDIRF4
ADDRLP4 136+8
INDIRF4
ADDF4
ASGNF4
line 4629
;4629:	VectorScale( chaos, 2.0f, v2 );
ADDRLP4 264
CNSTF4 1073741824
ASGNF4
ADDRLP4 212
ADDRLP4 264
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ASGNF4
ADDRLP4 212+4
ADDRLP4 264
INDIRF4
ADDRLP4 136+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1073741824
ADDRLP4 136+8
INDIRF4
MULF4
ASGNF4
line 4631
;4630:
;4631:	VectorSet( chaos, 1.0f, 1.0f, 1.0f );
ADDRLP4 268
CNSTF4 1065353216
ASGNF4
ADDRLP4 136
ADDRLP4 268
INDIRF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 268
INDIRF4
ASGNF4
ADDRLP4 136+8
CNSTF4 1065353216
ASGNF4
line 4633
;4632:
;4633:	VectorCopy(c1, b.control1);
ADDRLP4 0+24
ADDRLP4 164
INDIRB
ASGNB 12
line 4634
;4634:	VectorCopy(vec3_origin, b.control1Vel);
ADDRLP4 0+36
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 4635
;4635:	VectorCopy(c2, b.control2);
ADDRLP4 0+48
ADDRLP4 176
INDIRB
ASGNB 12
line 4636
;4636:	VectorCopy(vec3_origin, b.control2Vel);
ADDRLP4 0+60
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 4638
;4637:
;4638:	b.size1 = 6.0f;
ADDRLP4 0+72
CNSTF4 1086324736
ASGNF4
line 4639
;4639:	b.size2 = 6.0f;
ADDRLP4 0+76
CNSTF4 1086324736
ASGNF4
line 4640
;4640:	b.sizeParm = 0.0f;
ADDRLP4 0+80
CNSTF4 0
ASGNF4
line 4641
;4641:	b.alpha1 = 0.0f;
ADDRLP4 0+84
CNSTF4 0
ASGNF4
line 4642
;4642:	b.alpha2 = 0.2f;
ADDRLP4 0+88
CNSTF4 1045220557
ASGNF4
line 4643
;4643:	b.alphaParm = 0.5f;
ADDRLP4 0+92
CNSTF4 1056964608
ASGNF4
line 4650
;4644:	
;4645:	/*
;4646:	VectorCopy(WHITE, b.sRGB);
;4647:	VectorCopy(WHITE, b.eRGB);
;4648:	*/
;4649:
;4650:	b.sRGB[0] = 255;
ADDRLP4 0+96
CNSTF4 1132396544
ASGNF4
line 4651
;4651:	b.sRGB[1] = 255;
ADDRLP4 0+96+4
CNSTF4 1132396544
ASGNF4
line 4652
;4652:	b.sRGB[2] = 255;
ADDRLP4 0+96+8
CNSTF4 1132396544
ASGNF4
line 4653
;4653:	VectorCopy(b.sRGB, b.eRGB);
ADDRLP4 0+108
ADDRLP4 0+96
INDIRB
ASGNB 12
line 4655
;4654:
;4655:	b.rgbParm = 0.0f;
ADDRLP4 0+120
CNSTF4 0
ASGNF4
line 4656
;4656:	b.killTime = 50;
ADDRLP4 0+124
CNSTI4 50
ASGNI4
line 4657
;4657:	b.shader = trap_R_RegisterShader( "gfx/misc/electric2" );
ADDRGP4 $2517
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+128
ADDRLP4 272
INDIRI4
ASGNI4
line 4658
;4658:	b.flags = 0x00000001; //FX_ALPHA_LINEAR
ADDRLP4 0+132
CNSTI4 1
ASGNI4
line 4660
;4659:
;4660:	trap_FX_AddBezier(&b);
ADDRLP4 0
ARGP4
ADDRGP4 trap_FX_AddBezier
CALLV
pop
line 4661
;4661:}
LABELV $2445
endproc CG_AddLightningBeam 276 4
export CG_AddRandomLightning
proc CG_AddRandomLightning 44 8
line 4664
;4662:
;4663:void CG_AddRandomLightning(vec3_t start, vec3_t end)
;4664:{
line 4667
;4665:	vec3_t inOrg, outOrg;
;4666:
;4667:	VectorCopy(start, inOrg);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 4668
;4668:	VectorCopy(end, outOrg);
ADDRLP4 12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4670
;4669:
;4670:	if ( rand() & 1 )
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2520
line 4671
;4671:	{
line 4672
;4672:		outOrg[0] += Q_irand(0, 24);
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4673
;4673:		inOrg[0] += Q_irand(0, 8);
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4674
;4674:	}
ADDRGP4 $2521
JUMPV
LABELV $2520
line 4676
;4675:	else
;4676:	{
line 4677
;4677:		outOrg[0] -= Q_irand(0, 24);
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4678
;4678:		inOrg[0] -= Q_irand(0, 8);
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4679
;4679:	}
LABELV $2521
line 4681
;4680:
;4681:	if ( rand() & 1 )
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2522
line 4682
;4682:	{
line 4683
;4683:		outOrg[1] += Q_irand(0, 24);
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4684
;4684:		inOrg[1] += Q_irand(0, 8);
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4685
;4685:	}
ADDRGP4 $2523
JUMPV
LABELV $2522
line 4687
;4686:	else
;4687:	{
line 4688
;4688:		outOrg[1] -= Q_irand(0, 24);
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4689
;4689:		inOrg[1] -= Q_irand(0, 8);
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4690
;4690:	}
LABELV $2523
line 4692
;4691:
;4692:	if ( rand() & 1 )
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2528
line 4693
;4693:	{
line 4694
;4694:		outOrg[2] += Q_irand(0, 50);
CNSTI4 0
ARGI4
CNSTI4 50
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4695
;4695:		inOrg[2] += Q_irand(0, 40);
CNSTI4 0
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 40
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 40
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4696
;4696:	}
ADDRGP4 $2529
JUMPV
LABELV $2528
line 4698
;4697:	else
;4698:	{
line 4699
;4699:		outOrg[2] -= Q_irand(0, 64);
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4700
;4700:		inOrg[2] -= Q_irand(0, 40);
CNSTI4 0
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 40
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 40
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4701
;4701:	}
LABELV $2529
line 4703
;4702:
;4703:	CG_AddLightningBeam(inOrg, outOrg);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CG_AddLightningBeam
CALLV
pop
line 4704
;4704:}
LABELV $2519
endproc CG_AddRandomLightning 44 8
export CG_ThereIsAMaster
proc CG_ThereIsAMaster 12 0
line 4709
;4705:
;4706:extern char *forceHolocronModels[];
;4707:
;4708:qboolean CG_ThereIsAMaster(void)
;4709:{
line 4710
;4710:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2536
JUMPV
LABELV $2535
line 4714
;4711:	centity_t *cent;
;4712:
;4713:	while (i < MAX_CLIENTS)
;4714:	{
line 4715
;4715:		cent = &cg_entities[i];
ADDRLP4 4
CNSTI4 1920
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 4717
;4716:
;4717:		if (cent && cent->currentState.isJediMaster)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2538
ADDRLP4 4
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2538
line 4718
;4718:		{
line 4719
;4719:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2534
JUMPV
LABELV $2538
line 4722
;4720:		}
;4721:
;4722:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4723
;4723:	}
LABELV $2536
line 4713
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2535
line 4725
;4724:
;4725:	return qfalse;
CNSTI4 0
RETI4
LABELV $2534
endproc CG_ThereIsAMaster 12 0
export CG_FootStepGeneric
proc CG_FootStepGeneric 20 16
line 4730
;4726:}
;4727:
;4728://rww - here begins the majority of my g2animent stuff.
;4729:void CG_FootStepGeneric(centity_t *cent, int anim)
;4730:{
line 4733
;4731:	int groundType;
;4732:
;4733:	if ((anim & ~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT ||
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 915
EQI4 $2543
ADDRLP4 4
INDIRI4
CNSTI4 918
NEI4 $2541
LABELV $2543
line 4735
;4734:		(anim & ~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT)
;4735:	{
line 4736
;4736:		groundType = FOOTSTEP_GENERIC;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4737
;4737:		goto skipCheck;
ADDRGP4 $2544
JUMPV
LABELV $2541
line 4740
;4738:	}
;4739:
;4740:	if (cent->currentState.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2545
line 4741
;4741:	{
line 4742
;4742:		return;
ADDRGP4 $2540
JUMPV
LABELV $2545
LABELV $2544
line 4746
;4743:	}
;4744:
;4745:skipCheck:
;4746:	groundType = FOOTSTEP_GENERIC;//CG_FootstepForSurface(cent, cent->currentState.number);
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4750
;4747:
;4748://skipCheck:
;4749:
;4750:	if (!groundType)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2547
line 4751
;4751:	{
line 4752
;4752:		return;
ADDRGP4 $2540
JUMPV
LABELV $2547
line 4755
;4753:	}
;4754:
;4755:	switch (groundType)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $2551
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $2554
ADDRGP4 $2550
JUMPV
line 4756
;4756:	{
LABELV $2551
line 4758
;4757:	case FOOTSTEP_GENERIC:
;4758:		trap_S_StartSound (NULL, cent->currentState.number, CHAN_BODY, 
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 4760
;4759:			cgs.media.footsteps[ FOOTSTEP_NORMAL ][rand()&3] );
;4760:		break;
ADDRGP4 $2550
JUMPV
LABELV $2554
line 4762
;4761:	case FOOTSTEP_METAL:
;4762:		trap_S_StartSound (NULL, cent->currentState.number, CHAN_BODY, 
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 16
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
line 4764
;4763:			cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;4764:		break;
line 4766
;4765:	default:
;4766:		break;
LABELV $2550
line 4768
;4767:	}
;4768:}
LABELV $2540
endproc CG_FootStepGeneric 20 16
proc CG_G2EntSetLerpFrameAnimation 64 40
line 4770
;4769:
;4770:static void CG_G2EntSetLerpFrameAnimation( centity_t *cent, lerpFrame_t *lf, int newAnimation, float animSpeedMult, qboolean torsoOnly) {
line 4773
;4771:	animation_t	*anim;
;4772:	float animSpeed;
;4773:	int	  flags=BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 4
CNSTI4 72
ASGNI4
line 4774
;4774:	int oldAnim = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4775
;4775:	int blendTime = 150;
ADDRLP4 16
CNSTI4 150
ASGNI4
line 4777
;4776:
;4777:	if (cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $2559
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $2559
ADDRLP4 20
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $2559
line 4780
;4778:		cent->currentState.teamowner &&
;4779:		!cent->isATST)
;4780:	{
line 4781
;4781:		return;
ADDRGP4 $2558
JUMPV
LABELV $2559
line 4784
;4782:	}
;4783:
;4784:	oldAnim = lf->animationNumber;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
line 4786
;4785:
;4786:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 4787
;4787:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 4789
;4788:
;4789:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $2563
ADDRLP4 28
INDIRI4
CNSTI4 1211
LTI4 $2561
LABELV $2563
line 4791
;4790://		CG_Error( "Bad animation number: %i", newAnimation );
;4791:		return;
ADDRGP4 $2558
JUMPV
LABELV $2561
line 4794
;4792:	}
;4793:
;4794:	anim = &bgGlobalAnimations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 4796
;4795:
;4796:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 4797
;4797:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4799
;4798:
;4799:	if ( cg_debugAnim.integer && (cg_debugAnim.integer < 0 || cg_debugAnim.integer == cent->currentState.clientNum) ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $2564
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $2569
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
NEI4 $2564
LABELV $2569
line 4800
;4800:		CG_Printf( "%d: %d Anim: %i, '%s'\n", cg.time, cent->currentState.clientNum, newAnimation, GetStringForID(animTable, newAnimation));
ADDRGP4 animTable
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 GetStringForID
CALLP4
ASGNP4
ADDRGP4 $745
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 4801
;4801:	}
LABELV $2564
line 4803
;4802:
;4803:	if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2571
line 4804
;4804:	{
line 4805
;4805:		animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 12
CNSTF4 1112014848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 4806
;4806:		if (lf->animation->loopFrames != -1)
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2573
line 4807
;4807:		{
line 4808
;4808:			flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 4809
;4809:		}
LABELV $2573
line 4811
;4810:
;4811:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2575
line 4812
;4812:		{
line 4813
;4813:			if (animSpeed < 0.3)
ADDRLP4 12
INDIRF4
CNSTF4 1050253722
GEF4 $2577
line 4814
;4814:			{
line 4815
;4815:				animSpeed = 0.3;
ADDRLP4 12
CNSTF4 1050253722
ASGNF4
line 4816
;4816:			}
LABELV $2577
line 4818
;4817:
;4818:			if (newAnimation == BOTH_WALKBACK1)
ADDRFP4 8
INDIRI4
CNSTI4 852
NEI4 $2579
line 4819
;4819:			{
line 4820
;4820:				animSpeed = 0.8;
ADDRLP4 12
CNSTF4 1061997773
ASGNF4
line 4821
;4821:			}
LABELV $2579
line 4823
;4822:
;4823:			if (newAnimation != BOTH_DEATH1)
ADDRFP4 8
INDIRI4
CNSTI4 1
EQI4 $2581
line 4824
;4824:			{
line 4825
;4825:				flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 4826
;4826:			}
LABELV $2581
line 4827
;4827:		}
LABELV $2575
line 4829
;4828:
;4829:		if (cg_animBlend.integer)
ADDRGP4 cg_animBlend+12
INDIRI4
CNSTI4 0
EQI4 $2583
line 4830
;4830:		{
line 4831
;4831:			flags |= BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 4832
;4832:		}
LABELV $2583
line 4834
;4833:
;4834:		if (!cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2586
line 4835
;4835:		{
line 4836
;4836:			if (/*BG_FlippingAnim(newAnimation) ||*/ BG_InDeathAnim(newAnimation))
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2588
line 4837
;4837:			{
line 4838
;4838:				flags &= ~BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 4839
;4839:			}
ADDRGP4 $2589
JUMPV
LABELV $2588
line 4840
;4840:			else if ( oldAnim != -1 &&
ADDRLP4 44
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 -1
EQI4 $2590
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $2590
line 4842
;4841:				(/*BG_FlippingAnim(oldAnim) ||*/ BG_InDeathAnim(oldAnim)) )
;4842:			{
line 4843
;4843:				flags &= ~BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 4844
;4844:			}
LABELV $2590
LABELV $2589
line 4846
;4845:
;4846:			if (flags & BONE_ANIM_BLEND)
ADDRLP4 4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2592
line 4847
;4847:			{
line 4848
;4848:				if (BG_FlippingAnim(newAnimation))
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $2594
line 4849
;4849:				{
line 4850
;4850:					blendTime = 200;
ADDRLP4 16
CNSTI4 200
ASGNI4
line 4851
;4851:				}
ADDRGP4 $2595
JUMPV
LABELV $2594
line 4852
;4852:				else if ( oldAnim != -1 &&
ADDRLP4 56
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 -1
EQI4 $2596
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $2596
line 4854
;4853:					(BG_FlippingAnim(oldAnim)) )
;4854:				{
line 4855
;4855:					blendTime = 200;
ADDRLP4 16
CNSTI4 200
ASGNI4
line 4856
;4856:				}
LABELV $2596
LABELV $2595
line 4857
;4857:			}
LABELV $2592
line 4858
;4858:		}
LABELV $2586
line 4860
;4859:
;4860:		animSpeed *= animSpeedMult;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 4862
;4861:
;4862:		if (torsoOnly)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $2598
line 4863
;4863:		{
line 4864
;4864:			lf->animationTorsoSpeed = animSpeedMult;
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDRFP4 12
INDIRF4
ASGNF4
line 4865
;4865:		}
ADDRGP4 $2599
JUMPV
LABELV $2598
line 4867
;4866:		else
;4867:		{
line 4868
;4868:			lf->animationSpeed = animSpeedMult;
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDRFP4 12
INDIRF4
ASGNF4
line 4869
;4869:		}
LABELV $2599
line 4871
;4870:
;4871:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2600
line 4872
;4872:		{
line 4873
;4873:			int atstBlend = 400;
ADDRLP4 40
CNSTI4 400
ASGNI4
line 4875
;4874:
;4875:			if (torsoOnly)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $2602
line 4876
;4876:			{
line 4877
;4877:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "pelvis", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, atstBlend);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4878
;4878:			}
ADDRGP4 $2601
JUMPV
LABELV $2602
line 4880
;4879:			else
;4880:			{
line 4881
;4881:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, atstBlend);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4882
;4882:			}
line 4883
;4883:		}
ADDRGP4 $2601
JUMPV
LABELV $2600
line 4885
;4884:		else
;4885:		{
line 4886
;4886:			if (torsoOnly)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $2606
line 4887
;4887:			{
line 4888
;4888:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "upper_lumbar", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed,cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4889
;4889:			}
ADDRGP4 $2607
JUMPV
LABELV $2606
line 4891
;4890:			else
;4891:			{
line 4892
;4892:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4893
;4893:			}
LABELV $2607
line 4909
;4894:
;4895:			/*
;4896:			if ((cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) == newAnimation &&
;4897:				!BG_FlippingAnim( cent->currentState.legsAnim ) &&
;4898:				!BG_SpinningSaberAnim( cent->currentState.legsAnim ) &&
;4899:				!BG_SpinningSaberAnim( cent->currentState.torsoAnim ) &&
;4900:				!BG_InSpecialJump( cent->currentState.legsAnim ) &&
;4901:				!BG_InSpecialJump( cent->currentState.torsoAnim ) &&
;4902:				!BG_InDeathAnim(cent->currentState.legsAnim) &&
;4903:				!BG_InDeathAnim(cent->currentState.torsoAnim) &&
;4904:				!CG_InRoll(cent) &&
;4905:				!BG_SaberInSpecial(cent->currentState.saberMove) &&
;4906:				!BG_SaberInSpecialAttack(cent->currentState.torsoAnim) &&
;4907:				!BG_SaberInSpecialAttack(cent->currentState.legsAnim) )
;4908:				*/
;4909:			if (cg.snap && cg.snap->ps.clientNum == cent->currentState.number)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2610
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $2610
line 4910
;4910:			{ //go ahead and use the predicted state if you can.
line 4911
;4911:				if ((cg.predictedPlayerState.torsoAnim&~ANIM_TOGGLEBIT) == newAnimation)
ADDRGP4 cg+96+100
INDIRI4
CNSTI4 -2049
BANDI4
ADDRFP4 8
INDIRI4
NEI4 $2611
line 4912
;4912:				{
line 4913
;4913:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4914
;4914:				}
line 4915
;4915:			}
ADDRGP4 $2611
JUMPV
LABELV $2610
line 4917
;4916:			else
;4917:			{
line 4918
;4918:				if ((cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) == newAnimation)
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRFP4 8
INDIRI4
NEI4 $2619
line 4919
;4919:				{
line 4920
;4920:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4921
;4921:				}
LABELV $2619
line 4922
;4922:			}
LABELV $2611
line 4923
;4923:		}
LABELV $2601
line 4924
;4924:	}
LABELV $2571
line 4925
;4925:}
LABELV $2558
endproc CG_G2EntSetLerpFrameAnimation 64 40
proc CG_G2EntRunLerpFrame 76 40
line 4928
;4926:
;4927:static void CG_G2EntRunLerpFrame( centity_t *cent, lerpFrame_t *lf, int newAnimation, float speedScale, qboolean torsoOnly) 
;4928:{
line 4933
;4929:	int			f, numFrames;
;4930:	animation_t	*anim;
;4931:
;4932:	// debugging tool to get no animations
;4933:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $2623
line 4934
;4934:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 4935
;4935:		return;
ADDRGP4 $2622
JUMPV
LABELV $2623
line 4939
;4936:	}
;4937:
;4938:	// see if the animation sequence is switching
;4939:	if (cent->currentState.forceFrame)
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2626
line 4940
;4940:	{
line 4941
;4941:		int flags = BONE_ANIM_OVERRIDE_FREEZE; //|BONE_ANIM_BLEND;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 4942
;4942:		float animSpeed = 1.0f;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 4943
;4943:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "upper_lumbar", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
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
line 4944
;4944:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
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
line 4945
;4945:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
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
line 4947
;4946:
;4947:		lf->animationNumber = 0;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 4948
;4948:	}
ADDRGP4 $2627
JUMPV
LABELV $2626
line 4949
;4949:	else if ( (newAnimation != lf->animationNumber || !lf->animation) || (CG_FirstAnimFrame(lf, torsoOnly, speedScale)) ) 
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $2633
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2633
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 CG_FirstAnimFrame
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2631
LABELV $2633
line 4950
;4950:	{
line 4951
;4951:		CG_G2EntSetLerpFrameAnimation( cent, lf, newAnimation, speedScale, torsoOnly);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_G2EntSetLerpFrameAnimation
CALLV
pop
line 4952
;4952:	}
ADDRGP4 $2632
JUMPV
LABELV $2631
line 4953
;4953:	else if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2634
line 4954
;4954:	{
line 4955
;4955:		if (cent->pe.legs.yawing != !lf->torsoYawing)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2639
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $2640
JUMPV
LABELV $2639
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $2640
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2636
line 4956
;4956:		{
line 4957
;4957:			CG_G2EntSetLerpFrameAnimation( cent, lf, newAnimation, speedScale, torsoOnly);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_G2EntSetLerpFrameAnimation
CALLV
pop
line 4958
;4958:			lf->torsoYawing = cent->pe.legs.yawing;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ASGNI4
line 4959
;4959:		}
LABELV $2636
line 4960
;4960:	}
LABELV $2634
LABELV $2632
LABELV $2627
line 4964
;4961:
;4962:	// if we have passed the current frame, move it to
;4963:	// oldFrame and calculate a new frame
;4964:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $2641
line 4965
;4965:		if (lf->oldFrame != lf->frame &&
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $2644
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CVPU4 4
NEU4 $2644
line 4967
;4966:			lf == &(cent->pe.legs))
;4967:		{
line 4968
;4968:			int addFinalFrame = CG_InWalkingAnim(lf->animationNumber); //9;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_InWalkingAnim
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 4970
;4969:
;4970:			if (!cent->isATST &&
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2646
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 915
EQI4 $2648
ADDRLP4 32
INDIRI4
CNSTI4 918
NEI4 $2646
LABELV $2648
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2646
line 4973
;4971:				((lf->animationNumber&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT || (lf->animationNumber&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT) &&
;4972:				addFinalFrame)
;4973:			{
line 4974
;4974:				if ( lf->frame >= (lf->animation->firstFrame+2) &&
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $2649
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 40
INDIRI4
GEI4 $2649
line 4976
;4975:					lf->oldFrame < (lf->animation->firstFrame+2))
;4976:				{
line 4977
;4977:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4978
;4978:				}
ADDRGP4 $2647
JUMPV
LABELV $2649
line 4979
;4979:				else if ( lf->frame >= (lf->animation->firstFrame+addFinalFrame) &&
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $2651
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 48
INDIRI4
GEI4 $2651
line 4981
;4980:					lf->oldFrame < (lf->animation->firstFrame+addFinalFrame))
;4981:				{
line 4982
;4982:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4983
;4983:				}
ADDRGP4 $2647
JUMPV
LABELV $2651
line 4984
;4984:				else if ( lf->frame >= (lf->animation->firstFrame+12) &&
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $2653
ADDRLP4 52
INDIRP4
INDIRI4
ADDRLP4 56
INDIRI4
GEI4 $2653
line 4986
;4985:					lf->oldFrame < (lf->animation->firstFrame+12))
;4986:				{
line 4987
;4987:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4988
;4988:				}
ADDRGP4 $2647
JUMPV
LABELV $2653
line 4989
;4989:				else if ( lf->frame >= (lf->animation->firstFrame+16) &&
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LTI4 $2655
ADDRLP4 60
INDIRP4
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $2655
line 4991
;4990:					lf->oldFrame < (lf->animation->firstFrame+16))
;4991:				{
line 4992
;4992:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4993
;4993:				}
ADDRGP4 $2647
JUMPV
LABELV $2655
line 4994
;4994:				else if (lf->oldFrame > lf->frame && lf->frame > (lf->animation->firstFrame+1))
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRP4
INDIRI4
ADDRLP4 72
INDIRI4
LEI4 $2647
ADDRLP4 72
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $2647
line 4995
;4995:				{ //missed one
line 4996
;4996:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4997
;4997:				}
line 4998
;4998:			}
ADDRGP4 $2647
JUMPV
LABELV $2646
line 4999
;4999:			else if (addFinalFrame && !cent->isATST)
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $2659
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $2659
line 5000
;5000:			{
line 5001
;5001:				if ( lf->frame >= (lf->animation->firstFrame+3) &&
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $2661
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $2661
line 5003
;5002:					lf->oldFrame < (lf->animation->firstFrame+3))
;5003:				{
line 5004
;5004:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 5005
;5005:				}
ADDRGP4 $2662
JUMPV
LABELV $2661
line 5006
;5006:				else if ( lf->frame >= (lf->animation->firstFrame+addFinalFrame) &&
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LTI4 $2663
ADDRLP4 48
INDIRP4
INDIRI4
ADDRLP4 52
INDIRI4
GEI4 $2663
line 5008
;5007:					lf->oldFrame < (lf->animation->firstFrame+addFinalFrame))
;5008:				{
line 5009
;5009:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 5010
;5010:				}
ADDRGP4 $2664
JUMPV
LABELV $2663
line 5011
;5011:				else if (lf->oldFrame > lf->frame && lf->frame > (lf->animation->firstFrame+1))
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $2665
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $2665
line 5012
;5012:				{ //missed one
line 5013
;5013:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 5014
;5014:				}
LABELV $2665
LABELV $2664
LABELV $2662
line 5015
;5015:			}
LABELV $2659
LABELV $2647
line 5016
;5016:		}
LABELV $2644
line 5018
;5017:
;5018:		lf->oldFrame = lf->frame;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 5019
;5019:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 5022
;5020:
;5021:		// get the next frame based on the animation
;5022:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
ASGNP4
line 5023
;5023:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2667
line 5024
;5024:			return;		// shouldn't happen
ADDRGP4 $2622
JUMPV
LABELV $2667
line 5027
;5025:		}
;5026:
;5027:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
GEI4 $2669
line 5028
;5028:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 5029
;5029:		} else {
ADDRGP4 $2670
JUMPV
LABELV $2669
line 5030
;5030:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 12
ASGNI4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 5031
;5031:		}
LABELV $2670
line 5032
;5032:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 5033
;5033:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 5035
;5034:
;5035:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 5036
;5036:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2672
line 5037
;5037:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 5038
;5038:		}
LABELV $2672
line 5039
;5039:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2674
line 5040
;5040:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 5041
;5041:			if ( anim->loopFrames != -1 ) //Before 0 meant no loop
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2676
line 5042
;5042:			{
line 5043
;5043:				if(anim->numFrames - anim->loopFrames == 0)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CNSTI4 0
NEI4 $2678
line 5044
;5044:				{
line 5045
;5045:					f %= anim->numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
MODI4
ASGNI4
line 5046
;5046:				}
ADDRGP4 $2679
JUMPV
LABELV $2678
line 5048
;5047:				else
;5048:				{
line 5049
;5049:					f %= (anim->numFrames - anim->loopFrames);
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
MODI4
ASGNI4
line 5050
;5050:				}
LABELV $2679
line 5051
;5051:				f += anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 5052
;5052:			} 
ADDRGP4 $2677
JUMPV
LABELV $2676
line 5054
;5053:			else 
;5054:			{
line 5055
;5055:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5058
;5056:				// the animation is stuck at the end, so it
;5057:				// can immediately transition to another sequence
;5058:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5059
;5059:			}
LABELV $2677
line 5060
;5060:		}
LABELV $2674
line 5061
;5061:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2681
line 5062
;5062:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
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
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 5063
;5063:		}
ADDRGP4 $2682
JUMPV
LABELV $2681
line 5064
;5064:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2683
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $2683
line 5065
;5065:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 48
INDIRI4
MODI4
SUBI4
ASGNI4
line 5066
;5066:		}
ADDRGP4 $2684
JUMPV
LABELV $2683
line 5067
;5067:		else {
line 5068
;5068:			lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 5069
;5069:		}
LABELV $2684
LABELV $2682
line 5070
;5070:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $2685
line 5071
;5071:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5072
;5072:			if ( cg_debugAnim.integer && (cg_debugAnim.integer < 0 || cg_debugAnim.integer == cent->currentState.clientNum) ) {
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $2689
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $2694
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
NEI4 $2689
LABELV $2694
line 5073
;5073:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $938
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 5074
;5074:			}
LABELV $2689
line 5075
;5075:		}
LABELV $2685
line 5076
;5076:	}
LABELV $2641
line 5078
;5077:
;5078:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
CNSTI4 200
ADDI4
LEI4 $2695
line 5079
;5079:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5080
;5080:	}
LABELV $2695
line 5082
;5081:
;5082:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $2699
line 5083
;5083:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5084
;5084:	}
LABELV $2699
line 5086
;5085:	// calculate current lerp value
;5086:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $2703
line 5087
;5087:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 5088
;5088:	} else {
ADDRGP4 $2704
JUMPV
LABELV $2703
line 5089
;5089:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+64
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 5090
;5090:	}
LABELV $2704
line 5091
;5091:}
LABELV $2622
endproc CG_G2EntRunLerpFrame 76 40
proc CG_G2EntAnimation 12 20
line 5094
;5092:
;5093:static void CG_G2EntAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;5094:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 5097
;5095:	float			speedScale;
;5096:
;5097:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $2707
line 5098
;5098:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
line 5099
;5099:		return;
ADDRGP4 $2706
JUMPV
LABELV $2707
line 5102
;5100:	}
;5101:
;5102:	if (cent->currentState.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2710
line 5103
;5103:	{
line 5104
;5104:		speedScale = 1.3;
ADDRLP4 0
CNSTF4 1067869798
ASGNF4
line 5105
;5105:	}
ADDRGP4 $2711
JUMPV
LABELV $2710
line 5106
;5106:	else if (cent->currentState.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2712
line 5107
;5107:	{
line 5108
;5108:		speedScale = 1.7;
ADDRLP4 0
CNSTF4 1071225242
ASGNF4
line 5109
;5109:	}
ADDRGP4 $2713
JUMPV
LABELV $2712
line 5111
;5110:	else
;5111:	{
line 5112
;5112:		speedScale = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 5113
;5113:	}
LABELV $2713
LABELV $2711
line 5115
;5114:
;5115:	CG_G2EntRunLerpFrame( cent, &cent->pe.legs, cent->currentState.legsAnim, speedScale, qfalse);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 644
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_G2EntRunLerpFrame
CALLV
pop
line 5117
;5116:
;5117:	if (!(cent->currentState.forcePowersActive & (1 << FP_RAGE)))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $2714
line 5118
;5118:	{ //don't affect torso anim speed unless raged
line 5119
;5119:		speedScale = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 5120
;5120:	}
ADDRGP4 $2715
JUMPV
LABELV $2714
line 5122
;5121:	else
;5122:	{
line 5123
;5123:		speedScale = 1.7;
ADDRLP4 0
CNSTF4 1071225242
ASGNF4
line 5124
;5124:	}
LABELV $2715
line 5126
;5125:
;5126:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ASGNI4
line 5127
;5127:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 5128
;5128:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRF4
ASGNF4
line 5130
;5129:
;5130:	CG_G2EntRunLerpFrame( cent, &cent->pe.torso, cent->currentState.torsoAnim, speedScale, qtrue );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_G2EntRunLerpFrame
CALLV
pop
line 5132
;5131:
;5132:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ASGNI4
line 5133
;5133:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 5134
;5134:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ASGNF4
line 5135
;5135:}
LABELV $2706
endproc CG_G2EntAnimation 12 20
export CG_G2AnimEntSpineAngles
proc CG_G2AnimEntSpineAngles 88 8
line 5138
;5136:
;5137:void CG_G2AnimEntSpineAngles( centity_t *cent, vec3_t viewAngles, const vec3_t angles, vec3_t thoracicAngles, vec3_t ulAngles, vec3_t llAngles )
;5138:{
line 5139
;5139:	int ang = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5141
;5140:
;5141:	if (cent->isATST || cent->currentState.teamowner)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $2719
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2717
LABELV $2719
line 5142
;5142:	{
line 5143
;5143:		return;
ADDRGP4 $2716
JUMPV
LABELV $2717
line 5146
;5144:	}
;5145:
;5146:	VectorClear(ulAngles);
ADDRLP4 12
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
line 5147
;5147:	VectorClear(llAngles);
ADDRLP4 20
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 5150
;5148:
;5149:	//cent->pe.torso.pitchAngle = viewAngles[PITCH];
;5150:	viewAngles[YAW] = AngleDelta( cent->lerpAngles[YAW], angles[YAW] );
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 5155
;5151:	//cent->pe.torso.yawAngle = viewAngles[YAW];
;5152:
;5153:	//distribute the angles differently up the spine
;5154:	//NOTE: each of these distributions must add up to 1.0f
;5155:	thoracicAngles[PITCH] = 0;//viewAngles[PITCH]*0.20f;
ADDRFP4 12
INDIRP4
CNSTF4 0
ASGNF4
line 5156
;5156:	llAngles[PITCH] = 0;//viewAngles[PITCH]*0.40f;
ADDRFP4 20
INDIRP4
CNSTF4 0
ASGNF4
line 5157
;5157:	ulAngles[PITCH] = 0;//viewAngles[PITCH]*0.40f;
ADDRFP4 16
INDIRP4
CNSTF4 0
ASGNF4
line 5159
;5158:
;5159:	thoracicAngles[YAW] = viewAngles[YAW]*0.20f - (viewAngles[PITCH]*(viewAngles[YAW]*.020f));
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1017370378
ADDRLP4 44
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 5160
;5160:	ulAngles[YAW] = viewAngles[YAW]*0.25f - (viewAngles[PITCH]*(viewAngles[YAW]*.0005f));
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
CNSTF4 1048576000
ADDRLP4 56
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 973279855
ADDRLP4 56
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 5161
;5161:	llAngles[YAW] = viewAngles[YAW]*0.25f - (viewAngles[PITCH]*(viewAngles[YAW]*.0005f));
ADDRLP4 60
CNSTI4 4
ASGNI4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 20
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
CNSTF4 1048576000
ADDRLP4 68
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 973279855
ADDRLP4 68
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 5163
;5162:
;5163:	if (thoracicAngles[YAW] > 20)
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $2720
line 5164
;5164:	{
line 5165
;5165:		thoracicAngles[YAW] = 20;
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 5166
;5166:	}
LABELV $2720
line 5167
;5167:	if (ulAngles[YAW] > 20)
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $2722
line 5168
;5168:	{
line 5169
;5169:		ulAngles[YAW] = 20;
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 5170
;5170:	}
LABELV $2722
line 5171
;5171:	if (llAngles[YAW] > 20)
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $2724
line 5172
;5172:	{
line 5173
;5173:		llAngles[YAW] = 20;
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 5174
;5174:	}
LABELV $2724
line 5176
;5175:
;5176:	thoracicAngles[ROLL] = viewAngles[ROLL]*0.20f;
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 5177
;5177:	ulAngles[ROLL] = viewAngles[ROLL]*0.35f;
ADDRLP4 76
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 5178
;5178:	llAngles[ROLL] = viewAngles[ROLL]*0.45f;
ADDRLP4 80
CNSTI4 8
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 5180
;5179:	
;5180:	for ( ang = 0; ang < 3; ang++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2726
line 5181
;5181:	{
line 5182
;5182:		if (ulAngles[ang] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2730
line 5183
;5183:		{
line 5184
;5184:			ulAngles[ang] += 360;
ADDRLP4 84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 5185
;5185:		}
LABELV $2730
line 5186
;5186:	}
LABELV $2727
line 5180
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2726
line 5187
;5187:}
LABELV $2716
endproc CG_G2AnimEntSpineAngles 88 8
data
align 4
LABELV $2733
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
lit
align 4
LABELV $2734
byte 4 0
byte 4 0
byte 4 0
code
proc CG_G2AnimEntAngles 228 44
line 5190
;5188:
;5189:static void CG_G2AnimEntAngles( centity_t *cent, vec3_t legs[3], vec3_t legsAngles)
;5190:{
line 5198
;5191:	vec3_t		torsoAngles, headAngles;
;5192:	float		dest;
;5193:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;5194:	vec3_t		velocity;
;5195:	float		speed; //, speed_dif, speed_desired;
;5196:	int			dir;
;5197:	vec3_t		velPos, velAng;
;5198:	int			adddir = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 5200
;5199:	float		dif;
;5200:	float		degrees_negative = 0;
ADDRLP4 132
CNSTF4 0
ASGNF4
line 5201
;5201:	float		degrees_positive = 0;
ADDRLP4 136
CNSTF4 0
ASGNF4
line 5202
;5202:	vec3_t		ulAngles, llAngles, viewAngles, angles, thoracicAngles = {0,0,0};
ADDRLP4 60
ADDRGP4 $2734
INDIRB
ASGNB 12
line 5204
;5203:
;5204:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 5205
;5205:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 148
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 148
INDIRF4
ASGNF4
line 5206
;5206:	VectorClear( legsAngles );
ADDRLP4 152
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 156
CNSTF4 0
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 156
INDIRF4
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 156
INDIRF4
ASGNF4
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRF4
ASGNF4
line 5207
;5207:	VectorClear( torsoAngles );
ADDRLP4 160
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 160
INDIRF4
ASGNF4
line 5212
;5208:
;5209:	// --------- yaw -------------
;5210:
;5211:	// allow yaw to drift a bit
;5212:	if ((( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != BOTH_STAND1) || 
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
CNSTI4 -2049
ASGNI4
ADDRLP4 164
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
BANDI4
CNSTI4 571
NEI4 $2741
ADDRLP4 164
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
BANDI4
ADDRLP4 164
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
EQI4 $2739
LABELV $2741
line 5214
;5213:			( cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT ) != WeaponReadyAnim[cent->currentState.weapon]  ) 
;5214:	{
line 5216
;5215:		// if not standing still, always point all in the same direction
;5216:		cent->pe.torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 1
ASGNI4
line 5217
;5217:		cent->pe.torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 1
ASGNI4
line 5218
;5218:		cent->pe.legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTI4 1
ASGNI4
line 5219
;5219:	}
LABELV $2739
line 5221
;5220:
;5221:	dir = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
line 5222
;5222:	if (!cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2742
line 5223
;5223:	{
line 5224
;5224:		torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2733
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 5225
;5225:	}
ADDRGP4 $2743
JUMPV
LABELV $2742
line 5227
;5226:	else
;5227:	{
line 5228
;5228:		torsoAngles[YAW] = headAngles[YAW];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 5229
;5229:	}
LABELV $2743
line 5232
;5230:
;5231:	//for now, turn torso instantly and let the legs swing to follow
;5232:	cent->pe.torso.yawAngle = torsoAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 5236
;5233:
;5234:	// --------- pitch -------------
;5235:
;5236:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 5237
;5237:	speed = VectorNormalize( velocity );
ADDRLP4 24
ARGP4
ADDRLP4 172
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 172
INDIRF4
ASGNF4
line 5239
;5238:
;5239:	if (!speed)
ADDRLP4 108
INDIRF4
CNSTF4 0
NEF4 $2749
line 5240
;5240:	{
line 5241
;5241:		torsoAngles[YAW] = headAngles[YAW];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 5242
;5242:	}
LABELV $2749
line 5245
;5243:
;5244:	// only show a fraction of the pitch angle in the torso
;5245:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $2753
line 5246
;5246:		dest = (-360 + headAngles[PITCH]) * 0.75;
ADDRLP4 140
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 5247
;5247:	} else {
ADDRGP4 $2754
JUMPV
LABELV $2753
line 5248
;5248:		dest = headAngles[PITCH] * 0.75;
ADDRLP4 140
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 5249
;5249:	}
LABELV $2754
line 5250
;5250:	CG_SwingAngles( dest, 15, 30, 0.1, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
ADDRLP4 140
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 736
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLF4
pop
line 5251
;5251:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRF4
ASGNF4
line 5253
;5252:
;5253:	if ( speed ) {
ADDRLP4 108
INDIRF4
CNSTF4 0
EQF4 $2755
line 5257
;5254:		vec3_t	axis[3];
;5255:		float	side;
;5256:
;5257:		speed *= 0.05;
ADDRLP4 108
CNSTF4 1028443341
ADDRLP4 108
INDIRF4
MULF4
ASGNF4
line 5259
;5258:
;5259:		AnglesToAxis( legsAngles, axis );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 5260
;5260:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 216
ADDRLP4 108
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 180+12
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 180+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 180+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 5261
;5261:		legsAngles[ROLL] -= side;
ADDRLP4 220
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 220
INDIRP4
ADDRLP4 220
INDIRP4
INDIRF4
ADDRLP4 216
INDIRF4
SUBF4
ASGNF4
line 5263
;5262:
;5263:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 216
ADDRLP4 108
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 180+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 180+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 5264
;5264:		legsAngles[PITCH] += side;
ADDRLP4 224
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 216
INDIRF4
ADDF4
ASGNF4
line 5265
;5265:	}
LABELV $2755
line 5268
;5266:
;5267:	//rww - crazy velocity-based leg angle calculation
;5268:	legsAngles[YAW] = headAngles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 5269
;5269:	velPos[0] = cent->lerpOrigin[0] + velocity[0];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 5270
;5270:	velPos[1] = cent->lerpOrigin[1] + velocity[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
line 5271
;5271:	velPos[2] = cent->lerpOrigin[2];// + velocity[2];
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ASGNF4
line 5273
;5272:
;5273:	if (cent->currentState.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2772
line 5274
;5274:	{ //off the ground, no direction-based leg angles
line 5275
;5275:		VectorCopy(cent->lerpOrigin, velPos);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 5276
;5276:	}
LABELV $2772
line 5278
;5277:
;5278:	VectorSubtract(cent->lerpOrigin, velPos, velAng);
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 180
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 180
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 36+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 36+8
INDIRF4
SUBF4
ASGNF4
line 5280
;5279:
;5280:	if (!VectorCompare(velAng, vec3_origin))
ADDRLP4 48
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 184
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
NEI4 $2778
line 5281
;5281:	{
line 5282
;5282:		vectoangles(velAng, velAng);
ADDRLP4 48
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 5284
;5283:
;5284:		if (velAng[YAW] <= legsAngles[YAW])
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
GTF4 $2780
line 5285
;5285:		{
line 5286
;5286:			degrees_negative = (legsAngles[YAW] - velAng[YAW]);
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 48+4
INDIRF4
SUBF4
ASGNF4
line 5287
;5287:			degrees_positive = (360 - legsAngles[YAW]) + velAng[YAW];
ADDRLP4 136
CNSTF4 1135869952
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ADDRLP4 48+4
INDIRF4
ADDF4
ASGNF4
line 5288
;5288:		}
ADDRGP4 $2781
JUMPV
LABELV $2780
line 5290
;5289:		else
;5290:		{
line 5291
;5291:			degrees_negative = legsAngles[YAW] + (360 - velAng[YAW]);
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1135869952
ADDRLP4 48+4
INDIRF4
SUBF4
ADDF4
ASGNF4
line 5292
;5292:			degrees_positive = (velAng[YAW] - legsAngles[YAW]);
ADDRLP4 136
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5293
;5293:		}
LABELV $2781
line 5295
;5294:
;5295:		if (degrees_negative < degrees_positive)
ADDRLP4 132
INDIRF4
ADDRLP4 136
INDIRF4
GEF4 $2787
line 5296
;5296:		{
line 5297
;5297:			dif = degrees_negative;
ADDRLP4 112
ADDRLP4 132
INDIRF4
ASGNF4
line 5298
;5298:			adddir = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 5299
;5299:		}
ADDRGP4 $2788
JUMPV
LABELV $2787
line 5301
;5300:		else
;5301:		{
line 5302
;5302:			dif = degrees_positive;
ADDRLP4 112
ADDRLP4 136
INDIRF4
ASGNF4
line 5303
;5303:			adddir = 1;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 5304
;5304:		}
LABELV $2788
line 5306
;5305:
;5306:		if (dif > 90)
ADDRLP4 112
INDIRF4
CNSTF4 1119092736
LEF4 $2789
line 5307
;5307:		{
line 5308
;5308:			dif = (180 - dif);
ADDRLP4 112
CNSTF4 1127481344
ADDRLP4 112
INDIRF4
SUBF4
ASGNF4
line 5309
;5309:		}
LABELV $2789
line 5311
;5310:
;5311:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2791
line 5312
;5312:		{
line 5313
;5313:			if (dif > 360)
ADDRLP4 112
INDIRF4
CNSTF4 1135869952
LEF4 $2792
line 5314
;5314:			{
line 5315
;5315:				dif = 360;
ADDRLP4 112
CNSTF4 1135869952
ASGNF4
line 5316
;5316:			}
line 5317
;5317:		}
ADDRGP4 $2792
JUMPV
LABELV $2791
line 5319
;5318:		else
;5319:		{
line 5320
;5320:			if (dif > 60)
ADDRLP4 112
INDIRF4
CNSTF4 1114636288
LEF4 $2795
line 5321
;5321:			{
line 5322
;5322:				dif = 60;
ADDRLP4 112
CNSTF4 1114636288
ASGNF4
line 5323
;5323:			}
LABELV $2795
line 5324
;5324:		}
LABELV $2792
line 5327
;5325:
;5326:		//Slight hack for when playing is running backward
;5327:		if (dir == 3 || dir == 5)
ADDRLP4 188
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 3
EQI4 $2799
ADDRLP4 188
INDIRI4
CNSTI4 5
NEI4 $2797
LABELV $2799
line 5328
;5328:		{
line 5329
;5329:			dif = -dif;
ADDRLP4 112
ADDRLP4 112
INDIRF4
NEGF4
ASGNF4
line 5330
;5330:		}
LABELV $2797
line 5332
;5331:
;5332:		if (adddir)
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $2800
line 5333
;5333:		{
line 5334
;5334:			legsAngles[YAW] -= dif;
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 112
INDIRF4
SUBF4
ASGNF4
line 5335
;5335:		}
ADDRGP4 $2801
JUMPV
LABELV $2800
line 5337
;5336:		else
;5337:		{
line 5338
;5338:			legsAngles[YAW] += dif;
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 112
INDIRF4
ADDF4
ASGNF4
line 5339
;5339:		}
LABELV $2801
line 5340
;5340:	}
LABELV $2778
line 5342
;5341:
;5342:	cent->pe.legs.yawAngle = legsAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 5343
;5343:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRF4
ASGNF4
line 5346
;5344:
;5345:	// pain twitch
;5346:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 5348
;5347:
;5348:	legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 5349
;5349:	torsoAngles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 5354
;5350:
;5351:	//VectorCopy(legsAngles, cent->turAngles);
;5352:	//turAngles is used as a smoothing storage vector for g2animents.
;5353:
;5354:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2803
line 5355
;5355:	{
line 5356
;5356:		legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 5357
;5357:		legsAngles[PITCH] = 0;
ADDRFP4 8
INDIRP4
CNSTF4 0
ASGNF4
line 5358
;5358:	}
LABELV $2803
line 5361
;5359:
;5360:	// pull the angles back out of the hierarchial chain
;5361:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 5362
;5362:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 5363
;5363:	AnglesToAxis( legsAngles, legs );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 5366
;5364:	// we assume that model 0 is the player model.
;5365:
;5366:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2805
line 5367
;5367:	{
line 5370
;5368:		vec3_t flatYaw;
;5369:
;5370:		flatYaw[YAW] = 0;//cent->lerpAngles[YAW];
ADDRLP4 188+4
CNSTF4 0
ASGNF4
line 5371
;5371:		flatYaw[ROLL] = 0;
ADDRLP4 188+8
CNSTF4 0
ASGNF4
line 5372
;5372:		flatYaw[PITCH] = 0;
ADDRLP4 188
CNSTF4 0
ASGNF4
line 5373
;5373:		CG_G2SetBoneAngles(cent->ghoul2, 0, "pelvis", flatYaw, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 188
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
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5375
;5374:
;5375:		CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", torsoAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $1163
ARGP4
ADDRLP4 0
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
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5377
;5376:
;5377:		return;
ADDRGP4 $2732
JUMPV
LABELV $2805
line 5380
;5378:	}
;5379:
;5380:	VectorCopy( cent->lerpAngles, viewAngles );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 5381
;5381:	viewAngles[YAW] = viewAngles[ROLL] = 0;
ADDRLP4 188
CNSTF4 0
ASGNF4
ADDRLP4 96+8
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 188
INDIRF4
ASGNF4
line 5382
;5382:	viewAngles[PITCH] *= 0.5;
ADDRLP4 96
CNSTF4 1056964608
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
line 5384
;5383:
;5384:	VectorCopy( cent->lerpAngles, angles );
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 5385
;5385:	angles[PITCH] = 0;
ADDRLP4 116
CNSTF4 0
ASGNF4
line 5387
;5386:
;5387:	CG_G2AnimEntSpineAngles(cent, viewAngles, angles, thoracicAngles, ulAngles, llAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CG_G2AnimEntSpineAngles
CALLV
pop
line 5389
;5388:
;5389:	ulAngles[YAW] += torsoAngles[YAW]*0.3;
ADDRLP4 72+4
ADDRLP4 72+4
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5390
;5390:	llAngles[YAW] += torsoAngles[YAW]*0.3;
ADDRLP4 84+4
ADDRLP4 84+4
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5391
;5391:	thoracicAngles[YAW] += torsoAngles[YAW]*0.4;
ADDRLP4 60+4
ADDRLP4 60+4
INDIRF4
CNSTF4 1053609165
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5393
;5392:
;5393:	ulAngles[PITCH] = torsoAngles[PITCH]*0.3;
ADDRLP4 72
CNSTF4 1050253722
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 5394
;5394:	llAngles[PITCH] = torsoAngles[PITCH]*0.3;
ADDRLP4 84
CNSTF4 1050253722
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 5395
;5395:	thoracicAngles[PITCH] = torsoAngles[PITCH]*0.4;
ADDRLP4 60
CNSTF4 1053609165
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 5397
;5396:
;5397:	ulAngles[ROLL] += torsoAngles[ROLL]*0.3;
ADDRLP4 72+8
ADDRLP4 72+8
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5398
;5398:	llAngles[ROLL] += torsoAngles[ROLL]*0.3;
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5399
;5399:	thoracicAngles[ROLL] += torsoAngles[ROLL]*0.4;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1053609165
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5401
;5400:
;5401:	CG_G2SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRLP4 192
INDIRI4
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 72
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
ADDRLP4 192
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5402
;5402:	CG_G2SetBoneAngles(cent->ghoul2, 0, "lower_lumbar", llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 84
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
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5403
;5403:	CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", thoracicAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $1163
ARGP4
ADDRLP4 60
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
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5404
;5404:	CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $1195
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
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5405
;5405:}
LABELV $2732
endproc CG_G2AnimEntAngles 228 44
export CG_DrawNoForceSphere
proc CG_DrawNoForceSphere 217 12
line 5410
;5406:
;5407:#define SMOOTH_G2ANIM_LERPORIGIN
;5408:
;5409:void CG_DrawNoForceSphere(centity_t *cent, vec3_t origin, float scale, int shader)
;5410:{
line 5414
;5411:	refEntity_t ent;
;5412:	
;5413:	// Don't draw the shield when the player is dead.
;5414:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2836
line 5415
;5415:	{
line 5416
;5416:		return;
ADDRGP4 $2835
JUMPV
LABELV $2836
line 5419
;5417:	}
;5418:
;5419:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5421
;5420:
;5421:	VectorCopy( origin, ent.origin );
ADDRLP4 0+52
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 5422
;5422:	ent.origin[2] += 9.0;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 5424
;5423:
;5424:	VectorSubtract(cg.refdef.vieworg, ent.origin, ent.axis[0]);
ADDRLP4 0+12
ADDRGP4 cg+3616+24
INDIRF4
ADDRLP4 0+52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+4
ADDRGP4 cg+3616+24+4
INDIRF4
ADDRLP4 0+52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+8
ADDRGP4 cg+3616+24+8
INDIRF4
ADDRLP4 0+52+8
INDIRF4
SUBF4
ASGNF4
line 5425
;5425:	if (VectorNormalize(ent.axis[0]) <= 0.1f)
ADDRLP4 0+12
ARGP4
ADDRLP4 212
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 212
INDIRF4
CNSTF4 1036831949
GTF4 $2859
line 5426
;5426:	{	// Entity is right on vieworg.  quit.
line 5427
;5427:		return;
ADDRGP4 $2835
JUMPV
LABELV $2859
line 5430
;5428:	}
;5429:
;5430:	VectorCopy(cg.refdef.viewaxis[2], ent.axis[2]);
ADDRLP4 0+12+24
ADDRGP4 cg+3616+36+24
INDIRB
ASGNB 12
line 5431
;5431:	CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
ADDRLP4 0+12
ARGP4
ADDRLP4 0+12+24
ARGP4
ADDRLP4 0+12+12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 5433
;5432:
;5433:	VectorScale(ent.axis[0], scale, ent.axis[0]);
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 5434
;5434:	VectorScale(ent.axis[1], scale, ent.axis[1]);
ADDRLP4 0+12+12
ADDRLP4 0+12+12
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+4
ADDRLP4 0+12+12+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+8
ADDRLP4 0+12+12+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 5435
;5435:	VectorScale(ent.axis[2], -scale, ent.axis[2]);
ADDRLP4 0+12+24
ADDRLP4 0+12+24
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 0+12+24+4
ADDRLP4 0+12+24+4
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 0+12+24+8
ADDRLP4 0+12+24+8
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
line 5437
;5436:
;5437:	ent.shaderRGBA[3] = (cent->currentState.genericenemyindex - cg.time)/8;
ADDRLP4 0+80+3
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CNSTI4 8
DIVI4
CVIU4 4
CVUU1 4
ASGNU1
line 5438
;5438:	ent.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 5439
;5439:	if (ent.shaderRGBA[3] > 200)
ADDRLP4 0+80+3
INDIRU1
CVUI4 1
CNSTI4 200
LEI4 $2918
line 5440
;5440:	{
line 5441
;5441:		ent.shaderRGBA[3] = 200;
ADDRLP4 0+80+3
CNSTU1 200
ASGNU1
line 5442
;5442:	}
LABELV $2918
line 5443
;5443:	if (ent.shaderRGBA[3] < 1)
ADDRLP4 0+80+3
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $2924
line 5444
;5444:	{
line 5445
;5445:		ent.shaderRGBA[3] = 1;
ADDRLP4 0+80+3
CNSTU1 1
ASGNU1
line 5446
;5446:	}
LABELV $2924
line 5448
;5447:
;5448:	ent.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 5449
;5449:	ent.shaderRGBA[0] = ent.shaderRGBA[1] = ent.shaderRGBA[3];
ADDRLP4 216
ADDRLP4 0+80+3
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 216
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 216
INDIRU1
ASGNU1
line 5451
;5450:
;5451:	ent.hModel = cgs.media.halfShieldModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+900
INDIRI4
ASGNI4
line 5452
;5452:	ent.customShader = shader;	
ADDRLP4 0+76
ADDRFP4 12
INDIRI4
ASGNI4
line 5454
;5453:
;5454:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 5455
;5455:}
LABELV $2835
endproc CG_DrawNoForceSphere 217 12
export CG_G2Animated
proc CG_G2Animated 612 36
line 5458
;5456:
;5457:void CG_G2Animated( centity_t *cent )
;5458:{
line 5461
;5459:	refEntity_t		legs;
;5460:	refEntity_t		torso;
;5461:	int				renderfx = 0;
ADDRLP4 444
CNSTI4 0
ASGNI4
line 5462
;5462:	qboolean		shadow = qfalse;
ADDRLP4 448
CNSTI4 0
ASGNI4
line 5463
;5463:	float			shadowPlane = 0;
ADDRLP4 452
CNSTF4 0
ASGNF4
line 5464
;5464:	qboolean		dead = qfalse;
ADDRLP4 456
CNSTI4 0
ASGNI4
line 5468
;5465:	vec3_t			rootAngles;
;5466:#ifdef SMOOTH_G2ANIM_LERPORIGIN
;5467:	vec3_t			posDif;
;5468:	float			smoothFactor = 0.4f;
ADDRLP4 228
CNSTF4 1053609165
ASGNF4
line 5469
;5469:	int				k = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5472
;5470:#endif
;5471:
;5472:	cent->ghoul2 = cg_entities[cent->currentState.number].ghoul2;
ADDRLP4 472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 472
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 1920
ADDRLP4 472
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ASGNP4
line 5474
;5473:
;5474:	if (!cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2943
line 5475
;5475:	{ //Initialize this g2 anim ent, then return (will start rendering next frame)
line 5476
;5476:		const char *modelName = CG_ConfigString( CS_MODELS+cent->currentState.modelindex );
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 480
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 476
ADDRLP4 480
INDIRP4
ASGNP4
line 5478
;5477:
;5478:		if (modelName && modelName[0])
ADDRLP4 484
ADDRLP4 476
INDIRP4
ASGNP4
ADDRLP4 484
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2941
ADDRLP4 484
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2941
line 5479
;5479:		{
line 5480
;5480:			trap_G2API_InitGhoul2Model(&cent->ghoul2, modelName, 0, 0, 0, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRLP4 476
INDIRP4
ARGP4
ADDRLP4 488
CNSTI4 0
ASGNI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 5481
;5481:			if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2941
line 5482
;5482:			{
line 5483
;5483:				trap_G2API_AddBolt(cent->ghoul2, 0, "*r_hand");
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $296
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 5484
;5484:				trap_G2API_AddBolt(cent->ghoul2, 0, "*l_hand");
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $309
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 5485
;5485:				trap_G2API_AddBolt(cent->ghoul2, 0, "*head_top");
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $310
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 5486
;5486:				trap_G2API_AddBolt(cent->ghoul2, 0, "Motion");
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 5487
;5487:			}
line 5488
;5488:		}
line 5489
;5489:		return;
ADDRGP4 $2941
JUMPV
LABELV $2943
line 5492
;5490:	}
;5491:
;5492:	if (cent->currentState.weapon &&
ADDRLP4 476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 476
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2949
ADDRLP4 476
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 480
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 484
CNSTI4 0
ASGNI4
ADDRLP4 480
INDIRI4
ADDRLP4 484
INDIRI4
NEI4 $2949
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 484
INDIRI4
NEI4 $2949
line 5495
;5493:		!trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1) &&
;5494:		!(cent->currentState.eFlags & EF_DEAD))
;5495:	{ //if the server says we have a weapon and we haven't copied one onto ourselves yet, then do so.
line 5496
;5496:		trap_G2API_CopySpecificGhoul2Model(g2WeaponInstances[cent->currentState.weapon], 0, cent->ghoul2, 1);
ADDRLP4 488
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 488
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 488
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
line 5497
;5497:	}
LABELV $2949
line 5499
;5498:
;5499:	if (cent->torsoBolt && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 488
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 492
CNSTI4 0
ASGNI4
ADDRLP4 488
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 492
INDIRI4
EQI4 $2951
ADDRLP4 488
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 492
INDIRI4
NEI4 $2951
line 5500
;5500:	{ //he's alive and has a limb missing still, reattach it and reset the weapon
line 5501
;5501:		CG_ReattachLimb(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ReattachLimb
CALLV
pop
line 5502
;5502:	}
LABELV $2951
line 5505
;5503:
;5504:#ifdef SMOOTH_G2ANIM_LERPORIGIN
;5505:	if (DistanceSquared(cent->turAngles,cent->lerpOrigin)>12000.0f)
ADDRLP4 496
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 496
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 496
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 500
ADDRGP4 DistanceSquared
CALLF4
ASGNF4
ADDRLP4 500
INDIRF4
CNSTF4 1178304512
LEF4 $2953
line 5506
;5506:	{
line 5507
;5507:		VectorCopy(cent->lerpOrigin, cent->turAngles);
ADDRLP4 504
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 504
INDIRP4
CNSTI4 1016
ADDP4
ADDRLP4 504
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 5508
;5508:	}
LABELV $2953
line 5510
;5509:
;5510:	VectorSubtract(cent->lerpOrigin, cent->turAngles, posDif);
ADDRLP4 504
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
ADDRLP4 504
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 504
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 216+4
ADDRLP4 504
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 504
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 508
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216+8
ADDRLP4 508
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 508
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5512
;5511:	
;5512:	for (k=0;k<3;k++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2957
line 5513
;5513:	{
line 5514
;5514:		cent->turAngles[k]=(cent->turAngles[k]+posDif[k]*smoothFactor);
ADDRLP4 512
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 516
ADDRLP4 512
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ASGNP4
ADDRLP4 516
INDIRP4
ADDRLP4 516
INDIRP4
INDIRF4
ADDRLP4 512
INDIRI4
ADDRLP4 216
ADDP4
INDIRF4
ADDRLP4 228
INDIRF4
MULF4
ADDF4
ASGNF4
line 5515
;5515:		cent->lerpOrigin[k]=cent->turAngles[k];
ADDRLP4 520
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 520
INDIRI4
ADDRLP4 524
INDIRP4
CNSTI4 928
ADDP4
ADDP4
ADDRLP4 520
INDIRI4
ADDRLP4 524
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
INDIRF4
ASGNF4
line 5516
;5516:	}
LABELV $2958
line 5512
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2957
line 5519
;5517:#endif
;5518:
;5519:	if (cent->currentState.weapon)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2961
line 5520
;5520:	{
line 5521
;5521:		weaponInfo_t *weapon = NULL;
ADDRLP4 512
CNSTP4 0
ASGNP4
line 5523
;5522:
;5523:		CG_RegisterWeapon(cent->currentState.weapon);
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 5525
;5524:
;5525:		weapon = &cg_weapons[cent->currentState.weapon];
ADDRLP4 512
CNSTI4 208
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 5526
;5526:		if (weapon)
ADDRLP4 512
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2963
line 5527
;5527:		{
line 5528
;5528:			if ( cg.time - cent->muzzleFlashTime <= MUZZLE_FLASH_TIME + 10 )
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
SUBI4
CNSTI4 30
GTI4 $2965
line 5529
;5529:			{	// Handle muzzle flashes
line 5533
;5530:				vec3_t flashorigin, flashdir;
;5531:				mdxaBone_t boltMatrix;
;5532:
;5533:				if (trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1))
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 588
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $2968
line 5534
;5534:				{
line 5536
;5535:					vec3_t boltAngle;
;5536:					VectorClear(boltAngle);
ADDRLP4 604
CNSTF4 0
ASGNF4
ADDRLP4 592+8
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 592+4
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 592
ADDRLP4 604
INDIRF4
ASGNF4
line 5537
;5537:					boltAngle[YAW] = cent->lerpAngles[YAW];
ADDRLP4 592+4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ASGNF4
line 5538
;5538: 					trap_G2API_GetBoltMatrix(cent->ghoul2, 1, 0, &boltMatrix, boltAngle, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 608
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 608
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 516
ARGP4
ADDRLP4 592
ARGP4
ADDRLP4 608
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 608
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 5540
;5539:					
;5540:					trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, flashorigin);
ADDRLP4 516
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 564
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 5541
;5541:					trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, POSITIVE_X, flashdir);
ADDRLP4 516
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 576
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 5543
;5542:
;5543:					if ( cent->currentState.eFlags & EF_ALT_FIRING )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2975
line 5544
;5544:					{	// Check the alt firing first.
line 5545
;5545:						if (weapon->altMuzzleEffect)
ADDRLP4 512
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2976
line 5546
;5546:						{
line 5547
;5547:							trap_FX_PlayEffectID(weapon->altMuzzleEffect, flashorigin, flashdir);
ADDRLP4 512
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 564
ARGP4
ADDRLP4 576
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 5548
;5548:						}
line 5549
;5549:					}
ADDRGP4 $2976
JUMPV
LABELV $2975
line 5551
;5550:					else
;5551:					{	// Regular firing
line 5552
;5552:						if (weapon->muzzleEffect)
ADDRLP4 512
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2979
line 5553
;5553:						{
line 5554
;5554:							trap_FX_PlayEffectID(weapon->muzzleEffect, flashorigin, flashdir);
ADDRLP4 512
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 564
ARGP4
ADDRLP4 576
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 5555
;5555:						}
LABELV $2979
line 5556
;5556:					}
LABELV $2976
line 5557
;5557:				}
LABELV $2968
line 5558
;5558:			}
LABELV $2965
line 5559
;5559:		}
LABELV $2963
line 5560
;5560:	}
LABELV $2961
line 5562
;5561:
;5562:	memset (&legs, 0, sizeof(legs));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5564
;5563:
;5564:	CG_SetGhoul2Info(&legs, cent);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetGhoul2Info
CALLV
pop
line 5566
;5565:
;5566:	VectorSet(legs.modelScale, 1,1,1);
ADDRLP4 4+196
CNSTF4 1065353216
ASGNF4
ADDRLP4 4+196+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4+196+8
CNSTF4 1065353216
ASGNF4
line 5567
;5567:	legs.radius = cent->currentState.g2radius;
ADDRLP4 4+92
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 5568
;5568:	VectorClear(legs.angles);
ADDRLP4 512
CNSTF4 0
ASGNF4
ADDRLP4 4+184+8
ADDRLP4 512
INDIRF4
ASGNF4
ADDRLP4 4+184+4
ADDRLP4 512
INDIRF4
ASGNF4
ADDRLP4 4+184
ADDRLP4 512
INDIRF4
ASGNF4
line 5571
;5569:
;5570:	// add the shadow
;5571:	shadow = CG_PlayerShadow( cent, &shadowPlane );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 452
ARGP4
ADDRLP4 516
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 516
INDIRI4
ASGNI4
line 5573
;5572:
;5573:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $2992
ADDRLP4 448
INDIRI4
CNSTI4 0
EQI4 $2992
line 5574
;5574:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 444
ADDRLP4 444
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 5575
;5575:	}
LABELV $2992
line 5576
;5576:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 444
ADDRLP4 444
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 5578
;5577:
;5578:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 4+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 5579
;5579:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 4+108
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 5580
;5580:	legs.shadowPlane = shadowPlane;
ADDRLP4 4+120
ADDRLP4 452
INDIRF4
ASGNF4
line 5581
;5581:	legs.renderfx = renderfx;
ADDRLP4 4+4
ADDRLP4 444
INDIRI4
ASGNI4
line 5582
;5582:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 4+64
ADDRLP4 4+52
INDIRB
ASGNB 12
line 5584
;5583:
;5584:	CG_G2AnimEntAngles( cent, legs.axis, rootAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 460
ARGP4
ADDRGP4 CG_G2AnimEntAngles
CALLV
pop
line 5586
;5585:
;5586:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3002
line 5587
;5587:	{
line 5588
;5588:		dead = qtrue;
ADDRLP4 456
CNSTI4 1
ASGNI4
line 5592
;5589:		//rww - since our angles are fixed when we're dead this shouldn't be an issue anyway
;5590:		//we need to render the dying/dead player because we are now spawning the body on respawn instead of death
;5591:		//return;
;5592:	}
LABELV $3002
line 5594
;5593:
;5594:	ScaleModelAxis(&legs);
ADDRLP4 4
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 5596
;5595:
;5596:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 232
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5598
;5597:
;5598:	VectorCopy(cent->turAngles, cg_entities[cent->currentState.number].turAngles);
ADDRLP4 520
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 520
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1016
ADDP4
ADDRLP4 520
INDIRP4
CNSTI4 1016
ADDP4
INDIRB
ASGNB 12
line 5599
;5599:	VectorCopy(legs.origin, cg_entities[cent->currentState.number].lerpOrigin);
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
ADDRLP4 4+52
INDIRB
ASGNB 12
line 5602
;5600:
;5601:	// get the animation state (after rotation, to allow feet shuffle)
;5602:	CG_G2EntAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+124
ARGP4
ADDRLP4 4+104
ARGP4
ADDRLP4 4+128
ARGP4
ADDRLP4 232+124
ARGP4
ADDRLP4 232+104
ARGP4
ADDRLP4 232+128
ARGP4
ADDRGP4 CG_G2EntAnimation
CALLV
pop
line 5605
;5603:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;5604:
;5605:	trap_R_AddRefEntityToScene(&legs);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 5610
;5606:
;5607:
;5608:	// Electricity
;5609:	//------------------------------------------------
;5610:	if ( cent->currentState.emplacedOwner > cg.time ) 
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $3013
line 5611
;5611:	{
line 5612
;5612:		int	dif = cent->currentState.emplacedOwner - cg.time;
ADDRLP4 524
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
ASGNI4
line 5614
;5613:
;5614:		if ( dif > 0 && random() > 0.4f )
ADDRLP4 524
INDIRI4
CNSTI4 0
LEI4 $3017
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
LEF4 $3017
line 5615
;5615:		{
line 5617
;5616:			// fade out over the last 500 ms
;5617:			int brightness = 255;
ADDRLP4 532
CNSTI4 255
ASGNI4
line 5619
;5618:			
;5619:			if ( dif < 500 )
ADDRLP4 524
INDIRI4
CNSTI4 500
GEI4 $3019
line 5620
;5620:			{
line 5621
;5621:				brightness = floor((dif - 500.0f) / 500.0f * 255.0f );
ADDRLP4 536
CNSTF4 1140457472
ASGNF4
CNSTF4 1132396544
ADDRLP4 524
INDIRI4
CVIF4 4
ADDRLP4 536
INDIRF4
SUBF4
ADDRLP4 536
INDIRF4
DIVF4
MULF4
ARGF4
ADDRLP4 540
ADDRGP4 floor
CALLF4
ASGNF4
ADDRLP4 532
ADDRLP4 540
INDIRF4
CVFI4 4
ASGNI4
line 5622
;5622:			}
LABELV $3019
line 5624
;5623:
;5624:			legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 5625
;5625:			legs.renderfx &= ~RF_MINLIGHT;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 5627
;5626:
;5627:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 5628
;5628:			legs.shaderRGBA[0] = legs.shaderRGBA[1] = legs.shaderRGBA[2] = brightness;
ADDRLP4 536
ADDRLP4 532
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRLP4 4+80+2
ADDRLP4 536
INDIRU1
ASGNU1
ADDRLP4 4+80+1
ADDRLP4 536
INDIRU1
ASGNU1
ADDRLP4 4+80
ADDRLP4 536
INDIRU1
ASGNU1
line 5629
;5629:			legs.shaderRGBA[3] = 255;
ADDRLP4 4+80+3
CNSTU1 255
ASGNU1
line 5631
;5630:
;5631:			if ( rand() & 1 )
ADDRLP4 540
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 540
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3031
line 5632
;5632:			{
line 5633
;5633:				legs.customShader = cgs.media.electricBodyShader;	
ADDRLP4 4+76
ADDRGP4 cgs+70296+396
INDIRI4
ASGNI4
line 5634
;5634:			}
ADDRGP4 $3032
JUMPV
LABELV $3031
line 5636
;5635:			else
;5636:			{
line 5637
;5637:				legs.customShader = cgs.media.electricBody2Shader;
ADDRLP4 4+76
ADDRGP4 cgs+70296+400
INDIRI4
ASGNI4
line 5638
;5638:			}
LABELV $3032
line 5640
;5639:
;5640:			trap_R_AddRefEntityToScene( &legs );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 5642
;5641:
;5642:			if ( random() > 0.9f )
ADDRLP4 544
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1063675494
LEF4 $3039
line 5643
;5643:				trap_S_StartSound ( NULL, cent->currentState.number, CHAN_AUTO, cgs.media.crackleSound );
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+676
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $3039
line 5644
;5644:		}
LABELV $3017
line 5645
;5645:	} 
LABELV $3013
line 5647
;5646:
;5647:	if (cent->currentState.genericenemyindex > cg.time)
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $3043
line 5648
;5648:	{
line 5649
;5649:		CG_DrawNoForceSphere(cent, cent->lerpOrigin, 1.4, cgs.media.ysalimariShader );
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+580
INDIRI4
ARGI4
ADDRGP4 CG_DrawNoForceSphere
CALLV
pop
line 5650
;5650:	}
LABELV $3043
line 5651
;5651:}
LABELV $2941
endproc CG_G2Animated 612 36
data
export cgFPLSState
align 4
LABELV cgFPLSState
byte 4 0
export CG_ForceFPLSPlayerModel
code
proc CG_ForceFPLSPlayerModel 84 44
line 5657
;5652://rww - here ends the majority of my g2animent stuff.
;5653:
;5654:int cgFPLSState = 0;
;5655:
;5656:void CG_ForceFPLSPlayerModel(centity_t *cent, clientInfo_t *ci)
;5657:{
line 5658
;5658:	int clientNum = cent->currentState.number;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 5661
;5659:	animation_t *anim;
;5660:
;5661:	if (cg_fpls.integer && !cg.renderingThirdPerson)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 cg_fpls+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $3049
ADDRGP4 cg+88
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $3049
line 5662
;5662:	{
line 5665
;5663:		int				skinHandle;
;5664:
;5665:		skinHandle = trap_R_RegisterSkin("models/players/kyle/model_fpls2.skin");
ADDRGP4 $3053
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 5667
;5666:
;5667:		trap_G2API_CleanGhoul2Models(&(ci->ghoul2Model));
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 5669
;5668:
;5669:		ci->torsoSkin = skinHandle;
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 5670
;5670:		trap_G2API_InitGhoul2Model(&ci->ghoul2Model, "models/players/kyle/model.glm", 0, ci->torsoSkin, 0, 0, 0);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 $3054
ARGP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 5672
;5671:
;5672:		ci->bolt_rhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*r_hand");
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $296
ARGP4
ADDRLP4 32
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 5674
;5673:		
;5674:		trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, cg.time, -1, -1);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 5675
;5675:		trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "upper_lumbar", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, cg.time);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 $303
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
CNSTP4 0
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 5676
;5676:		trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "cranium", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, cg.time);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 $307
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 48
CNSTI4 2
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 5678
;5677:
;5678:		ci->bolt_lhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*l_hand");
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $309
ARGP4
ADDRLP4 56
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 5679
;5679:		ci->bolt_head = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*head_top");
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $310
ARGP4
ADDRLP4 64
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 5681
;5680:
;5681:		ci->bolt_motion = trap_G2API_AddBolt(ci->ghoul2Model, 0, "Motion");
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 72
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 5684
;5682:
;5683:		//We need a lower lumbar bolt for footsteps
;5684:		ci->bolt_llumbar = trap_G2API_AddBolt(ci->ghoul2Model, 0, "lower_lumbar");
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 80
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 5685
;5685:	}
ADDRGP4 $3050
JUMPV
LABELV $3049
line 5687
;5686:	else
;5687:	{
line 5688
;5688:		CG_RegisterClientModelname(ci, ci->modelName, ci->skinName, ci->teamName, cent->currentState.number);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 416
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterClientModelname
CALLI4
pop
line 5689
;5689:	}
LABELV $3050
line 5691
;5690:
;5691:	anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.legsAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 0
CNSTI4 28
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 5693
;5692:
;5693:	if (anim)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3059
line 5694
;5694:	{
line 5695
;5695:		int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 5696
;5696:		int firstFrame = anim->firstFrame;
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 5697
;5697:		int setFrame = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 5698
;5698:		float animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 24
CNSTF4 1112014848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 5700
;5699:
;5700:		if (anim->loopFrames != -1)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3061
line 5701
;5701:		{
line 5702
;5702:			flags |= BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 5703
;5703:		}
LABELV $3061
line 5705
;5704:
;5705:		if (cent->pe.legs.frame >= anim->firstFrame && cent->pe.legs.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $3063
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $3063
line 5706
;5706:		{
line 5707
;5707:			setFrame = cent->pe.legs.frame;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 5708
;5708:		}
LABELV $3063
line 5710
;5709:
;5710:		trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, setFrame, 150);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 20
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
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 5712
;5711:
;5712:		cg_entities[clientNum].currentState.legsAnim = 0;
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
CNSTI4 0
ASGNI4
line 5713
;5713:	}
LABELV $3059
line 5715
;5714:
;5715:	anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.torsoAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 0
CNSTI4 28
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 5717
;5716:
;5717:	if (anim)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3068
line 5718
;5718:	{
line 5719
;5719:		int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 5720
;5720:		int firstFrame = anim->firstFrame;
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 5721
;5721:		int setFrame = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 5722
;5722:		float animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 24
CNSTF4 1112014848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 5724
;5723:
;5724:		if (anim->loopFrames != -1)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3070
line 5725
;5725:		{
line 5726
;5726:			flags |= BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 5727
;5727:		}
LABELV $3070
line 5729
;5728:
;5729:		if (cent->pe.torso.frame >= anim->firstFrame && cent->pe.torso.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $3072
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $3072
line 5730
;5730:		{
line 5731
;5731:			setFrame = cent->pe.torso.frame;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 5732
;5732:		}
LABELV $3072
line 5734
;5733:
;5734:		trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "lower_lumbar", firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, setFrame, 150);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 20
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
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 5736
;5735:
;5736:		cg_entities[clientNum].currentState.torsoAnim = 0;
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
CNSTI4 0
ASGNI4
line 5737
;5737:	}
LABELV $3068
line 5739
;5738:
;5739:	trap_G2API_CleanGhoul2Models(&(cent->ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 5740
;5740:	trap_G2API_DuplicateGhoul2Instance(ci->ghoul2Model, &cent->ghoul2);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 5741
;5741:	cg_entities[clientNum].ghoul2 = cent->ghoul2;
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ASGNP4
line 5742
;5742:}
LABELV $3048
endproc CG_ForceFPLSPlayerModel 84 44
export CG_Player
proc CG_Player 1380 44
line 5749
;5743:
;5744:/*
;5745:===============
;5746:CG_Player
;5747:===============
;5748:*/
;5749:void CG_Player( centity_t *cent ) {
line 5755
;5750:	clientInfo_t	*ci;
;5751:	refEntity_t		legs;
;5752:	refEntity_t		torso;
;5753:	int				clientNum;
;5754:	int				renderfx;
;5755:	qboolean		shadow = qfalse;
ADDRLP4 836
CNSTI4 0
ASGNI4
line 5756
;5756:	float			shadowPlane = 0;
ADDRLP4 540
CNSTF4 0
ASGNF4
line 5757
;5757:	qboolean		dead = qfalse;
ADDRLP4 864
CNSTI4 0
ASGNI4
line 5762
;5758:	vec3_t			rootAngles;
;5759:	refEntity_t		seeker;
;5760:	float			angle;
;5761:	vec3_t			angles, dir, elevated, enang, seekorg;
;5762:	int				iwantout = 0, successchange = 0;
ADDRLP4 768
CNSTI4 0
ASGNI4
ADDRLP4 860
CNSTI4 0
ASGNI4
line 5764
;5763:	int				team;
;5764:	float			prefig = 0;
ADDRLP4 856
CNSTF4 0
ASGNF4
line 5770
;5765:	centity_t		*enent;
;5766:	mdxaBone_t 		boltMatrix, lHandMatrix;
;5767:	vec3_t			efOrg;
;5768:	vec3_t			tDir;
;5769:	int				distVelBase;
;5770:	int				doAlpha = 0;
ADDRLP4 832
CNSTI4 0
ASGNI4
line 5771
;5771:	int				effectTimeLayer = 0;
ADDRLP4 756
CNSTI4 0
ASGNI4
line 5772
;5772:	qboolean		gotLHandMatrix = qfalse;
ADDRLP4 772
CNSTI4 0
ASGNI4
line 5773
;5773:	qboolean		g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 5775
;5774:
;5775:	if (cgQueueLoad)
ADDRGP4 cgQueueLoad
INDIRI4
CNSTI4 0
EQI4 $3078
line 5776
;5776:	{
line 5777
;5777:		CG_ActualLoadDeferredPlayers();
ADDRGP4 CG_ActualLoadDeferredPlayers
CALLV
pop
line 5778
;5778:		cgQueueLoad = qfalse;
ADDRGP4 cgQueueLoad
CNSTI4 0
ASGNI4
line 5779
;5779:	}
LABELV $3078
line 5784
;5780:
;5781:	// the client number is stored in clientNum.  It can't be derived
;5782:	// from the entity number, because a single client may have
;5783:	// multiple corpses on the level using the same clientinfo
;5784:	clientNum = cent->currentState.clientNum;
ADDRLP4 760
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 5785
;5785:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 760
INDIRI4
CNSTI4 0
LTI4 $3082
ADDRLP4 760
INDIRI4
CNSTI4 32
LTI4 $3080
LABELV $3082
line 5786
;5786:		CG_Error( "Bad clientNum on player entity");
ADDRGP4 $3083
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 5787
;5787:	}
LABELV $3080
line 5788
;5788:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 828
CNSTI4 788
ADDRLP4 760
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 5792
;5789:
;5790:	// it is possible to see corpses from disconnected players that may
;5791:	// not have valid clientinfo
;5792:	if ( !ci->infoValid ) {
ADDRLP4 828
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $3085
line 5793
;5793:		return;
ADDRGP4 $3077
JUMPV
LABELV $3085
line 5796
;5794:	}
;5795:
;5796:	cent->ghoul2 = cg_entities[cent->currentState.number].ghoul2;
ADDRLP4 900
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 900
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 1920
ADDRLP4 900
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ASGNP4
line 5798
;5797:
;5798:	if (!cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3088
line 5799
;5799:	{ //not ready yet?
line 5803
;5800:#ifdef _DEBUG
;5801:		Com_Printf("WARNING: Client %i has a null ghoul2 instance\n", cent->currentState.number);
;5802:#endif
;5803:		if (cgs.clientinfo[cent->currentState.number].ghoul2Model &&
ADDRLP4 904
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 904
INDIRI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3077
ADDRLP4 904
INDIRI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRLP4 908
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 908
INDIRI4
CNSTI4 0
EQI4 $3077
line 5805
;5804:			trap_G2_HaveWeGhoul2Models(cgs.clientinfo[cent->currentState.number].ghoul2Model))
;5805:		{
line 5809
;5806:#ifdef _DEBUG
;5807:			Com_Printf("Clientinfo instance was valid, duplicating for cent\n");
;5808:#endif
;5809:			trap_G2API_DuplicateGhoul2Instance(cgs.clientinfo[cent->currentState.number].ghoul2Model, &cent->ghoul2);
ADDRLP4 912
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 788
ADDRLP4 912
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRLP4 912
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 5810
;5810:			cg_entities[cent->currentState.number].ghoul2 = cent->ghoul2;
ADDRLP4 916
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 916
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ADDRLP4 916
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ASGNP4
line 5811
;5811:		}
line 5812
;5812:		return;
ADDRGP4 $3077
JUMPV
LABELV $3088
line 5815
;5813:	}
;5814:
;5815:	g2HasWeapon = trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 904
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 536
ADDRLP4 904
INDIRI4
ASGNI4
line 5817
;5816:
;5817:	if (!g2HasWeapon)
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $3099
line 5818
;5818:	{ //force a redup of the weapon instance onto the client instance
line 5819
;5819:		cent->ghoul2weapon = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 5820
;5820:	}
LABELV $3099
line 5822
;5821:
;5822:	if (cent->torsoBolt && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 908
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 912
CNSTI4 0
ASGNI4
ADDRLP4 908
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 912
INDIRI4
EQI4 $3101
ADDRLP4 908
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 912
INDIRI4
NEI4 $3101
line 5823
;5823:	{ //he's alive and has a limb missing still, reattach it and reset the weapon
line 5824
;5824:		CG_ReattachLimb(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ReattachLimb
CALLV
pop
line 5825
;5825:	}
ADDRGP4 $3102
JUMPV
LABELV $3101
line 5826
;5826:	else if (cg_entities[cent->currentState.number].torsoBolt && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 916
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 920
CNSTI4 0
ASGNI4
CNSTI4 1920
ADDRLP4 916
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1012
ADDP4
INDIRI4
ADDRLP4 920
INDIRI4
EQI4 $3103
ADDRLP4 916
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 920
INDIRI4
NEI4 $3103
line 5827
;5827:	{ //It happens. (usually between odd level change events)
line 5828
;5828:		cent->torsoBolt = cg_entities[cent->currentState.number].torsoBolt;
ADDRLP4 924
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 924
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 1920
ADDRLP4 924
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1012
ADDP4
INDIRI4
ASGNI4
line 5829
;5829:		cg_entities[cent->currentState.number].torsoBolt = 0;
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1012
ADDP4
CNSTI4 0
ASGNI4
line 5830
;5830:		CG_ReattachLimb(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ReattachLimb
CALLV
pop
line 5831
;5831:	}
LABELV $3103
LABELV $3102
line 5833
;5832:
;5833:	if (cent->ghoul2 && cent->torsoBolt && (cent->torsoBolt == G2_MODELPART_RARM || cent->torsoBolt == G2_MODELPART_RHAND || cent->torsoBolt == G2_MODELPART_WAIST) && g2HasWeapon)
ADDRLP4 924
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 924
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3108
ADDRLP4 928
ADDRLP4 924
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ASGNI4
ADDRLP4 928
INDIRI4
CNSTI4 0
EQI4 $3108
ADDRLP4 928
INDIRI4
CNSTI4 13
EQI4 $3111
ADDRLP4 928
INDIRI4
CNSTI4 14
EQI4 $3111
ADDRLP4 928
INDIRI4
CNSTI4 11
NEI4 $3108
LABELV $3111
ADDRLP4 536
INDIRI4
CNSTI4 0
EQI4 $3108
line 5834
;5834:	{ //kill the weapon if the limb holding it is no longer on the model
line 5835
;5835:		trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
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
line 5836
;5836:		g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 5837
;5837:	}
LABELV $3108
line 5839
;5838:
;5839:	if (cent->currentState.teamowner && !cent->isATST)
ADDRLP4 932
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 936
CNSTI4 0
ASGNI4
ADDRLP4 932
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 936
INDIRI4
EQI4 $3112
ADDRLP4 932
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 936
INDIRI4
NEI4 $3112
line 5840
;5840:	{
line 5841
;5841:		cg_entities[cent->currentState.number].currentState.teamowner = cent->currentState.teamowner;
ADDRLP4 940
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 940
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+264
ADDP4
ADDRLP4 940
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 5842
;5842:		cg_entities[cent->currentState.number].isATST = cent->isATST;
ADDRLP4 944
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 944
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
ADDRLP4 944
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
line 5844
;5843:
;5844:		if (CG_RegisterClientModelname(&cgs.clientinfo[cent->currentState.number], cgs.clientinfo[cent->currentState.number].modelName, cgs.clientinfo[cent->currentState.number].skinName,
ADDRLP4 948
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 952
CNSTI4 788
ADDRLP4 948
INDIRI4
MULI4
ASGNI4
ADDRLP4 952
INDIRI4
ADDRGP4 cgs+43024
ADDP4
ARGP4
ADDRLP4 952
INDIRI4
ADDRGP4 cgs+43024+160
ADDP4
ARGP4
ADDRLP4 952
INDIRI4
ADDRGP4 cgs+43024+224
ADDP4
ARGP4
ADDRLP4 952
INDIRI4
ADDRGP4 cgs+43024+416
ADDP4
ARGP4
ADDRLP4 948
INDIRI4
ARGI4
ADDRLP4 956
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
EQI4 $3113
line 5846
;5845:			cgs.clientinfo[cent->currentState.number].teamName, cent->currentState.number))
;5846:		{
line 5847
;5847:			cent->isATST = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 5848
;5848:			cg_entities[cent->currentState.number].isATST = cent->isATST;
ADDRLP4 960
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 960
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
ADDRLP4 960
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
line 5849
;5849:			return;
ADDRGP4 $3077
JUMPV
line 5851
;5850:		}
;5851:	}
LABELV $3112
line 5852
;5852:	else if (!cent->currentState.teamowner && cent->isATST)
ADDRLP4 940
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 944
CNSTI4 0
ASGNI4
ADDRLP4 940
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 944
INDIRI4
NEI4 $3126
ADDRLP4 940
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 944
INDIRI4
EQI4 $3126
line 5853
;5853:	{
line 5854
;5854:		cg_entities[cent->currentState.number].currentState.teamowner = cent->currentState.teamowner;
ADDRLP4 948
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 948
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+264
ADDP4
ADDRLP4 948
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 5855
;5855:		cg_entities[cent->currentState.number].isATST = cent->isATST;
ADDRLP4 952
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 952
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
ADDRLP4 952
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
line 5857
;5856:
;5857:		if (CG_RegisterClientModelname(&cgs.clientinfo[cent->currentState.number], cgs.clientinfo[cent->currentState.number].modelName, cgs.clientinfo[cent->currentState.number].skinName,
ADDRLP4 956
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 960
CNSTI4 788
ADDRLP4 956
INDIRI4
MULI4
ASGNI4
ADDRLP4 960
INDIRI4
ADDRGP4 cgs+43024
ADDP4
ARGP4
ADDRLP4 960
INDIRI4
ADDRGP4 cgs+43024+160
ADDP4
ARGP4
ADDRLP4 960
INDIRI4
ADDRGP4 cgs+43024+224
ADDP4
ARGP4
ADDRLP4 960
INDIRI4
ADDRGP4 cgs+43024+416
ADDP4
ARGP4
ADDRLP4 956
INDIRI4
ARGI4
ADDRLP4 964
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 964
INDIRI4
CNSTI4 0
EQI4 $3130
line 5859
;5858:			cgs.clientinfo[cent->currentState.number].teamName, cent->currentState.number))
;5859:		{
line 5860
;5860:			cent->isATST = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 0
ASGNI4
line 5861
;5861:			cg_entities[cent->currentState.number].isATST = cent->isATST;
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 968
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
ADDRLP4 968
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
line 5862
;5862:			return;
ADDRGP4 $3077
JUMPV
LABELV $3130
line 5864
;5863:		}
;5864:	}
LABELV $3126
LABELV $3113
line 5866
;5865:
;5866:	if (cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 948
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 948
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $3140
ADDRLP4 952
CNSTI4 0
ASGNI4
ADDRLP4 948
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 952
INDIRI4
EQI4 $3140
ADDRLP4 948
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 952
INDIRI4
NEI4 $3140
line 5869
;5867:		cent->currentState.teamowner &&
;5868:		!cent->isATST)
;5869:	{
line 5870
;5870:		return;
ADDRGP4 $3077
JUMPV
LABELV $3140
line 5873
;5871:	}
;5872:
;5873:	if (!cent->trickAlphaTime || (cg.time - cent->trickAlphaTime) > 1000)
ADDRLP4 956
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
INDIRI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
EQI4 $3145
ADDRGP4 cg+64
INDIRI4
ADDRLP4 956
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $3142
LABELV $3145
line 5874
;5874:	{ //things got out of sync, perhaps a new client is trying to fill in this slot
line 5875
;5875:		cent->trickAlpha = 255;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 255
ASGNI4
line 5876
;5876:		cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5877
;5877:	}
LABELV $3142
line 5880
;5878:
;5879:	//If this client has tricked you.
;5880:	if (CG_IsMindTricked(cent->currentState.trickedentindex,
ADDRLP4 960
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 960
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 960
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 960
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 960
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 964
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 964
INDIRI4
CNSTI4 0
EQI4 $3147
line 5885
;5881:		cent->currentState.trickedentindex2,
;5882:		cent->currentState.trickedentindex3,
;5883:		cent->currentState.trickedentindex4,
;5884:		cg.snap->ps.clientNum))
;5885:	{
line 5886
;5886:		if (cent->trickAlpha > 1)
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CNSTI4 1
LEI4 $3150
line 5887
;5887:		{
line 5888
;5888:			cent->trickAlpha -= (cg.time - cent->trickAlphaTime)*0.5;
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 972
ADDRLP4 968
INDIRP4
CNSTI4 1904
ADDP4
ASGNP4
ADDRLP4 972
INDIRP4
ADDRLP4 972
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRGP4 cg+64
INDIRI4
ADDRLP4 968
INDIRP4
CNSTI4 1908
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 5889
;5889:			cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5891
;5890:
;5891:			if (cent->trickAlpha < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CNSTI4 0
GEI4 $3154
line 5892
;5892:			{
line 5893
;5893:				cent->trickAlpha = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 0
ASGNI4
line 5894
;5894:			}
LABELV $3154
line 5896
;5895:
;5896:			doAlpha = 1;
ADDRLP4 832
CNSTI4 1
ASGNI4
line 5897
;5897:		}
ADDRGP4 $3148
JUMPV
LABELV $3150
line 5899
;5898:		else
;5899:		{
line 5900
;5900:			doAlpha = 1;
ADDRLP4 832
CNSTI4 1
ASGNI4
line 5901
;5901:			cent->trickAlpha = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 1
ASGNI4
line 5902
;5902:			cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5903
;5903:			iwantout = 1;
ADDRLP4 768
CNSTI4 1
ASGNI4
line 5904
;5904:		}
line 5905
;5905:	}
ADDRGP4 $3148
JUMPV
LABELV $3147
line 5907
;5906:	else
;5907:	{
line 5908
;5908:		if (cent->trickAlpha < 255)
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CNSTI4 255
GEI4 $3157
line 5909
;5909:		{
line 5910
;5910:			cent->trickAlpha += (cg.time - cent->trickAlphaTime);
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 972
ADDRLP4 968
INDIRP4
CNSTI4 1904
ADDP4
ASGNP4
ADDRLP4 972
INDIRP4
ADDRLP4 972
INDIRP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
ADDRLP4 968
INDIRP4
CNSTI4 1908
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 5911
;5911:			cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5913
;5912:
;5913:			if (cent->trickAlpha > 255)
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CNSTI4 255
LEI4 $3161
line 5914
;5914:			{
line 5915
;5915:				cent->trickAlpha = 255;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 255
ASGNI4
line 5916
;5916:			}
LABELV $3161
line 5918
;5917:
;5918:			doAlpha = 1;
ADDRLP4 832
CNSTI4 1
ASGNI4
line 5919
;5919:		}
ADDRGP4 $3158
JUMPV
LABELV $3157
line 5921
;5920:		else
;5921:		{
line 5922
;5922:			cent->trickAlpha = 255;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 255
ASGNI4
line 5923
;5923:			cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5924
;5924:		}
LABELV $3158
line 5925
;5925:	}
LABELV $3148
line 5928
;5926:
;5927:	// get the player model information
;5928:	renderfx = 0;
ADDRLP4 776
CNSTI4 0
ASGNI4
line 5929
;5929:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $3164
line 5930
;5930:		if (!cg.renderingThirdPerson) {
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $3167
line 5931
;5931:			if (!cg_fpls.integer || cent->currentState.weapon != WP_SABER)
ADDRGP4 cg_fpls+12
INDIRI4
CNSTI4 0
EQI4 $3173
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
EQI4 $3168
LABELV $3173
line 5932
;5932:			{
line 5933
;5933:				renderfx = RF_THIRD_PERSON;			// only draw in mirrors
ADDRLP4 776
CNSTI4 2
ASGNI4
line 5934
;5934:			}
line 5935
;5935:		} else {
ADDRGP4 $3168
JUMPV
LABELV $3167
line 5936
;5936:			if (cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $3174
line 5937
;5937:				iwantout = 1;
ADDRLP4 768
CNSTI4 1
ASGNI4
line 5943
;5938:
;5939:				
;5940:				// goto minimal_add;
;5941:				
;5942:				// NOTENOTE Temporary
;5943:				return;
ADDRGP4 $3077
JUMPV
LABELV $3174
line 5945
;5944:			}
;5945:		}
LABELV $3168
line 5946
;5946:	}
LABELV $3164
line 5955
;5947:
;5948:	// Update the player's client entity information regarding weapons.
;5949:	// Explanation:  The entitystate has a weapond defined on it.  The cliententity does as well.
;5950:	// The cliententity's weapon tells us what the ghoul2 instance on the cliententity has bolted to it.
;5951:	// If the entitystate and cliententity weapons differ, then the state's needs to be copied to the client.
;5952:	// Save the old weapon, to verify that it is or is not the same as the new weapon.
;5953:	// rww - Make sure weapons don't get set BEFORE cent->ghoul2 is initialized or else we'll have no
;5954:	// weapon bolted on
;5955:	if (cent->currentState.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3177
line 5956
;5956:	{
line 5957
;5957:		cent->ghoul2weapon = g2WeaponInstances[WP_SABER];
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
ADDRGP4 g2WeaponInstances+8
INDIRP4
ASGNP4
line 5958
;5958:	}
LABELV $3177
line 5960
;5959:
;5960:	if (cent->ghoul2 && 
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 968
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3180
ADDRLP4 968
INDIRP4
CNSTI4 960
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 968
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
CVPU4 4
EQU4 $3180
ADDRLP4 972
CNSTI4 0
ASGNI4
ADDRLP4 968
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 972
INDIRI4
NEI4 $3180
ADDRLP4 968
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 972
INDIRI4
NEI4 $3180
ADDRLP4 968
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 972
INDIRI4
NEI4 $3180
line 5963
;5961:		cent->ghoul2weapon != g2WeaponInstances[cent->currentState.weapon] &&
;5962:		!(cent->currentState.eFlags & EF_DEAD) && !cent->torsoBolt && !cent->isATST)
;5963:	{
line 5964
;5964:		CG_CopyG2WeaponInstance(cent->currentState.weapon, cent->ghoul2);
ADDRLP4 976
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 976
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 976
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_CopyG2WeaponInstance
CALLV
pop
line 5966
;5965:
;5966:		if (!(cg.snap->ps.pm_flags & PMF_FOLLOW))
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $3182
line 5967
;5967:		{
line 5968
;5968:			if (cent->weapon == WP_SABER && cent->weapon != cent->currentState.weapon && !cent->currentState.shouldtarget)
ADDRLP4 980
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 984
ADDRLP4 980
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 2
NEI4 $3185
ADDRLP4 984
INDIRI4
ADDRLP4 980
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
EQI4 $3185
ADDRLP4 980
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3185
line 5969
;5969:			{ //switching away from the saber
line 5970
;5970:				trap_S_StartSound(cent->lerpOrigin, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberoffquick.wav" ));
ADDRGP4 $3187
ARGP4
ADDRLP4 988
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 992
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 988
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 5971
;5971:			}
ADDRGP4 $3186
JUMPV
LABELV $3185
line 5972
;5972:			else if (cent->currentState.weapon == WP_SABER && cent->weapon != cent->currentState.weapon)
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
ADDRLP4 988
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 2
NEI4 $3188
ADDRLP4 988
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRLP4 992
INDIRI4
EQI4 $3188
line 5973
;5973:			{ //switching to the saber
line 5974
;5974:				trap_S_StartSound(cent->lerpOrigin, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberon.wav" ));
ADDRGP4 $3190
ARGP4
ADDRLP4 996
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 1000
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 996
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 5975
;5975:			}
LABELV $3188
LABELV $3186
line 5976
;5976:		}
LABELV $3182
line 5978
;5977:
;5978:		cent->weapon = cent->currentState.weapon;
ADDRLP4 980
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 980
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 980
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 5979
;5979:		cent->ghoul2weapon = g2WeaponInstances[cent->currentState.weapon];
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 984
INDIRP4
CNSTI4 960
ADDP4
ADDRLP4 984
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
ASGNP4
line 5980
;5980:	}
ADDRGP4 $3181
JUMPV
LABELV $3180
line 5981
;5981:	else if ((cent->currentState.eFlags & EF_DEAD) || cent->torsoBolt)
ADDRLP4 976
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 980
CNSTI4 0
ASGNI4
ADDRLP4 976
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 980
INDIRI4
NEI4 $3193
ADDRLP4 976
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 980
INDIRI4
EQI4 $3191
LABELV $3193
line 5982
;5982:	{
line 5983
;5983:		cent->ghoul2weapon = NULL; //be sure to update after respawning/getting limb regrown
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 5984
;5984:	}
LABELV $3191
LABELV $3181
line 5987
;5985:
;5986:	
;5987:	memset (&legs, 0, sizeof(legs));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5989
;5988:
;5989:	CG_SetGhoul2Info(&legs, cent);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetGhoul2Info
CALLV
pop
line 5991
;5990:
;5991:	VectorSet(legs.modelScale, 1,1,1);
ADDRLP4 0+196
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+196+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+196+8
CNSTF4 1065353216
ASGNF4
line 5992
;5992:	legs.radius = 64;
ADDRLP4 0+92
CNSTF4 1115684864
ASGNF4
line 5993
;5993:	VectorClear(legs.angles);
ADDRLP4 984
CNSTF4 0
ASGNF4
ADDRLP4 0+184+8
ADDRLP4 984
INDIRF4
ASGNF4
ADDRLP4 0+184+4
ADDRLP4 984
INDIRF4
ASGNF4
ADDRLP4 0+184
ADDRLP4 984
INDIRF4
ASGNF4
line 5995
;5994:
;5995:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3205
line 5996
;5996:	{
line 5997
;5997:		legs.radius = 400;
ADDRLP4 0+92
CNSTF4 1137180672
ASGNF4
line 5998
;5998:	}
LABELV $3205
line 6002
;5999:
;6000:// minimal_add:
;6001:
;6002:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
ADDRLP4 852
CNSTI4 788
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
ASGNI4
line 6004
;6003:
;6004:	if (cgs.gametype >= GT_TEAM && cg_drawFriend.integer &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $3210
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $3210
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $3210
line 6006
;6005:		cent->currentState.number != cg.snap->ps.clientNum)			// Don't show a sprite above a player's own head in 3rd person.
;6006:	{	// If the view is either a spectator or on the same team as this character, show a symbol above their head.
line 6007
;6007:		if ((cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.snap->ps.persistant[PERS_TEAM] == team) &&
ADDRLP4 988
CNSTI4 336
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 988
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $3219
ADDRGP4 cg+36
INDIRP4
ADDRLP4 988
INDIRI4
ADDP4
INDIRI4
ADDRLP4 852
INDIRI4
NEI4 $3215
LABELV $3219
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $3215
line 6009
;6008:			!(cent->currentState.eFlags & EF_DEAD))
;6009:		{
line 6010
;6010:			if (team == TEAM_RED)
ADDRLP4 852
INDIRI4
CNSTI4 1
NEI4 $3220
line 6011
;6011:			{
line 6012
;6012:				CG_PlayerFloatSprite( cent, cgs.media.teamRedShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+176
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 6013
;6013:			}
ADDRGP4 $3221
JUMPV
LABELV $3220
line 6015
;6014:			else	// if (team == TEAM_BLUE)
;6015:			{
line 6016
;6016:				CG_PlayerFloatSprite( cent, cgs.media.teamBlueShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+180
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 6017
;6017:			}
LABELV $3221
line 6018
;6018:		}
LABELV $3215
line 6019
;6019:	}
LABELV $3210
line 6021
;6020:
;6021:	if (cgs.gametype == GT_JEDIMASTER && cg_drawFriend.integer &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $3226
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $3226
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $3226
line 6023
;6022:		cent->currentState.number != cg.snap->ps.clientNum)			// Don't show a sprite above a player's own head in 3rd person.
;6023:	{	// If the view is either a spectator or on the same team as this character, show a symbol above their head.
line 6024
;6024:		if ((cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.snap->ps.persistant[PERS_TEAM] == team) &&
ADDRLP4 988
CNSTI4 336
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 988
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $3235
ADDRGP4 cg+36
INDIRP4
ADDRLP4 988
INDIRI4
ADDP4
INDIRI4
ADDRLP4 852
INDIRI4
NEI4 $3231
LABELV $3235
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $3231
line 6026
;6025:			!(cent->currentState.eFlags & EF_DEAD))
;6026:		{
line 6027
;6027:			if (CG_ThereIsAMaster())
ADDRLP4 992
ADDRGP4 CG_ThereIsAMaster
CALLI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 0
EQI4 $3236
line 6028
;6028:			{
line 6029
;6029:				if (!cg.snap->ps.isJediMaster)
ADDRGP4 cg+36
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3238
line 6030
;6030:				{
line 6031
;6031:					if (!cent->currentState.isJediMaster)
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3241
line 6032
;6032:					{
line 6033
;6033:						CG_PlayerFloatSprite( cent, cgs.media.teamRedShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+176
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 6034
;6034:					}
LABELV $3241
line 6035
;6035:				}
LABELV $3238
line 6036
;6036:			}
LABELV $3236
line 6037
;6037:		}
LABELV $3231
line 6038
;6038:	}
LABELV $3226
line 6040
;6039:
;6040:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3245
line 6041
;6041:	{
line 6042
;6042:		goto doEssentialOne;
ADDRGP4 $3247
JUMPV
LABELV $3245
line 6046
;6043:	}
;6044:
;6045:	// add the shadow
;6046:	shadow = CG_PlayerShadow( cent, &shadowPlane );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 540
ARGP4
ADDRLP4 988
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 836
ADDRLP4 988
INDIRI4
ASGNI4
line 6048
;6047:
;6048:	if ( (cent->currentState.eFlags & EF_SEEKERDRONE) || cent->currentState.genericenemyindex != -1 )
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
NEI4 $3250
ADDRLP4 992
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3248
LABELV $3250
line 6049
;6049:	{
line 6050
;6050:		memset( &seeker, 0, sizeof(seeker) );
ADDRLP4 276
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6052
;6051:
;6052:		VectorCopy(cent->lerpOrigin, elevated);
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6053
;6053:		elevated[2] += 40;
ADDRLP4 224+8
ADDRLP4 224+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 6055
;6054:
;6055:		VectorCopy( elevated, seeker.lightingOrigin );
ADDRLP4 276+108
ADDRLP4 224
INDIRB
ASGNB 12
line 6056
;6056:		seeker.shadowPlane = shadowPlane;
ADDRLP4 276+120
ADDRLP4 540
INDIRF4
ASGNF4
line 6057
;6057:		seeker.renderfx = 0; //renderfx;
ADDRLP4 276+4
CNSTI4 0
ASGNI4
line 6060
;6058:							 //don't show in first person?
;6059:
;6060:		angle = ((cg.time / 12) & 255) * (M_PI * 2) / 255;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
INDIRI4
CNSTI4 12
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 6061
;6061:		dir[0] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 996
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 996
INDIRF4
MULF4
ASGNF4
line 6062
;6062:		dir[1] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1000
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1000
INDIRF4
MULF4
ASGNF4
line 6063
;6063:		dir[2] = cos(angle) * 5;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1004
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1084227584
ADDRLP4 1004
INDIRF4
MULF4
ASGNF4
line 6064
;6064:		VectorAdd(elevated, dir, seeker.origin);
ADDRLP4 276+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 276+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 276+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6066
;6065:
;6066:		VectorCopy(seeker.origin, seekorg);
ADDRLP4 868
ADDRLP4 276+52
INDIRB
ASGNB 12
line 6068
;6067:
;6068:		if (cent->currentState.genericenemyindex > 1024)
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 1024
LEI4 $3268
line 6069
;6069:		{
line 6070
;6070:			prefig = (cent->currentState.genericenemyindex-cg.time)/80;
ADDRLP4 856
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CNSTI4 80
DIVI4
CVIF4 4
ASGNF4
line 6072
;6071:
;6072:			if (prefig > 55)
ADDRLP4 856
INDIRF4
CNSTF4 1113325568
LEF4 $3271
line 6073
;6073:			{
line 6074
;6074:				prefig = 55;
ADDRLP4 856
CNSTF4 1113325568
ASGNF4
line 6075
;6075:			}
ADDRGP4 $3272
JUMPV
LABELV $3271
line 6076
;6076:			else if (prefig < 1)
ADDRLP4 856
INDIRF4
CNSTF4 1065353216
GEF4 $3273
line 6077
;6077:			{
line 6078
;6078:				prefig = 1;
ADDRLP4 856
CNSTF4 1065353216
ASGNF4
line 6079
;6079:			}
LABELV $3273
LABELV $3272
line 6081
;6080:
;6081:			elevated[2] -= 55-prefig;
ADDRLP4 224+8
ADDRLP4 224+8
INDIRF4
CNSTF4 1113325568
ADDRLP4 856
INDIRF4
SUBF4
SUBF4
ASGNF4
line 6083
;6082:
;6083:			angle = ((cg.time / 12) & 255) * (M_PI * 2) / 255;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
INDIRI4
CNSTI4 12
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 6084
;6084:			dir[0] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1008
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 1008
INDIRF4
MULF4
ASGNF4
line 6085
;6085:			dir[1] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1012
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1012
INDIRF4
MULF4
ASGNF4
line 6086
;6086:			dir[2] = cos(angle) * 5;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1016
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1084227584
ADDRLP4 1016
INDIRF4
MULF4
ASGNF4
line 6087
;6087:			VectorAdd(elevated, dir, seeker.origin);
ADDRLP4 276+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 276+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 276+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6088
;6088:		}
ADDRGP4 $3269
JUMPV
LABELV $3268
line 6089
;6089:		else if (cent->currentState.genericenemyindex != ENTITYNUM_NONE && cent->currentState.genericenemyindex != -1)
ADDRLP4 1008
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1008
INDIRI4
CNSTI4 1023
EQI4 $3288
ADDRLP4 1008
INDIRI4
CNSTI4 -1
EQI4 $3288
line 6090
;6090:		{
line 6091
;6091:			enent = &cg_entities[cent->currentState.genericenemyindex];
ADDRLP4 880
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 6093
;6092:
;6093:			if (enent)
ADDRLP4 880
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3290
line 6094
;6094:			{
line 6095
;6095:				VectorSubtract(enent->lerpOrigin, seekorg, enang);
ADDRLP4 1012
ADDRLP4 880
INDIRP4
ASGNP4
ADDRLP4 884
ADDRLP4 1012
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 868
INDIRF4
SUBF4
ASGNF4
ADDRLP4 884+4
ADDRLP4 1012
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 868+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 884+8
ADDRLP4 880
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 868+8
INDIRF4
SUBF4
ASGNF4
line 6096
;6096:				VectorNormalize(enang);
ADDRLP4 884
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6097
;6097:				vectoangles(enang, angles);
ADDRLP4 884
ARGP4
ADDRLP4 252
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6098
;6098:				successchange = 1;
ADDRLP4 860
CNSTI4 1
ASGNI4
line 6099
;6099:			}
LABELV $3290
line 6100
;6100:		}
LABELV $3288
LABELV $3269
line 6102
;6101:
;6102:		if (!successchange)
ADDRLP4 860
INDIRI4
CNSTI4 0
NEI4 $3296
line 6103
;6103:		{
line 6104
;6104:			angles[0] = sin(angle) * 30;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1012
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 252
CNSTF4 1106247680
ADDRLP4 1012
INDIRF4
MULF4
ASGNF4
line 6105
;6105:			angles[1] = (angle * 180 / M_PI) + 90;
ADDRLP4 252+4
CNSTF4 1127481344
ADDRLP4 236
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 6106
;6106:			if (angles[1] > 360)
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
LEF4 $3299
line 6107
;6107:				angles[1] -= 360;
ADDRLP4 252+4
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $3299
line 6108
;6108:			angles[2] = 0;
ADDRLP4 252+8
CNSTF4 0
ASGNF4
line 6109
;6109:		}
LABELV $3296
line 6111
;6110:
;6111:		AnglesToAxis( angles, seeker.axis );
ADDRLP4 252
ARGP4
ADDRLP4 276+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 6113
;6112:
;6113:		seeker.hModel = trap_R_RegisterModel("models/items/remote.md3");
ADDRGP4 $3306
ARGP4
ADDRLP4 1012
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 276+8
ADDRLP4 1012
INDIRI4
ASGNI4
line 6114
;6114:		trap_R_AddRefEntityToScene( &seeker );
ADDRLP4 276
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6115
;6115:	}
LABELV $3248
LABELV $3247
line 6119
;6116:
;6117:doEssentialOne:
;6118:	// add a water splash if partially in and out of water
;6119:	CG_PlayerSplash( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 6121
;6120:
;6121:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $3307
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $3307
line 6122
;6122:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 776
ADDRLP4 776
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 6123
;6123:	}
LABELV $3307
line 6124
;6124:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 776
ADDRLP4 776
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 6127
;6125:
;6126:	// if we've been hit, display proper fullscreen fx
;6127:	CG_PlayerHitFX(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerHitFX
CALLV
pop
line 6129
;6128:
;6129:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6131
;6130:
;6131:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 0+108
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6132
;6132:	legs.shadowPlane = shadowPlane;
ADDRLP4 0+120
ADDRLP4 540
INDIRF4
ASGNF4
line 6133
;6133:	legs.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 776
INDIRI4
ASGNI4
line 6134
;6134:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 0+64
ADDRLP4 0+52
INDIRB
ASGNB 12
line 6136
;6135:
;6136:	CG_G2PlayerAngles( cent, legs.axis, rootAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 840
ARGP4
ADDRGP4 CG_G2PlayerAngles
CALLV
pop
line 6144
;6137:
;6138:	//This call is mainly just to reconstruct the skeleton. But we'll get the left hand matrix while we're at it.
;6139:	//If we don't reconstruct the skeleton after setting the bone angles, we will get bad bolt points on the model
;6140:	//(e.g. the weapon model bolt will look "lagged") if there's no other GetBoltMatrix call for the rest of the
;6141:	//frame. Yes, this is stupid and needs to be fixed properly.
;6142:	//The current solution is to force it not to reconstruct the skeleton for the first GBM call in G2PlayerAngles.
;6143:	//It works and we end up only reconstructing it once, but it doesn't seem like the best solution.
;6144:	trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &lHandMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 996
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 996
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 996
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+516
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRLP4 996
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 996
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 996
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6145
;6145:	gotLHandMatrix = qtrue;
ADDRLP4 772
CNSTI4 1
ASGNI4
line 6147
;6146:
;6147:	if (cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $3321
line 6148
;6148:	{
line 6149
;6149:		if (cgFPLSState != 0)
ADDRGP4 cgFPLSState
INDIRI4
CNSTI4 0
EQI4 $3322
line 6150
;6150:		{
line 6151
;6151:			CG_ForceFPLSPlayerModel(cent, ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 CG_ForceFPLSPlayerModel
CALLV
pop
line 6152
;6152:			cgFPLSState = 0;
ADDRGP4 cgFPLSState
CNSTI4 0
ASGNI4
line 6153
;6153:			return;
ADDRGP4 $3077
JUMPV
line 6155
;6154:		}
;6155:	}
LABELV $3321
line 6156
;6156:	else if (ci->team == TEAM_SPECTATOR || (cg.snap && (cg.snap->ps.pm_flags & PMF_FOLLOW)))
ADDRLP4 828
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 3
EQI4 $3330
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3326
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $3326
LABELV $3330
line 6157
;6157:	{ //don't allow this when spectating
line 6158
;6158:		if (cgFPLSState != 0)
ADDRGP4 cgFPLSState
INDIRI4
CNSTI4 0
EQI4 $3331
line 6159
;6159:		{
line 6160
;6160:			trap_Cvar_Set("cg_fpls", "0");
ADDRGP4 $3333
ARGP4
ADDRGP4 $3334
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6161
;6161:			cg_fpls.integer = 0;
ADDRGP4 cg_fpls+12
CNSTI4 0
ASGNI4
line 6163
;6162:
;6163:			CG_ForceFPLSPlayerModel(cent, ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 CG_ForceFPLSPlayerModel
CALLV
pop
line 6164
;6164:			cgFPLSState = 0;
ADDRGP4 cgFPLSState
CNSTI4 0
ASGNI4
line 6165
;6165:			return;
ADDRGP4 $3077
JUMPV
LABELV $3331
line 6168
;6166:		}
;6167:
;6168:		if (cg_fpls.integer)
ADDRGP4 cg_fpls+12
INDIRI4
CNSTI4 0
EQI4 $3327
line 6169
;6169:		{
line 6170
;6170:			trap_Cvar_Set("cg_fpls", "0");
ADDRGP4 $3333
ARGP4
ADDRGP4 $3334
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6171
;6171:		}
line 6172
;6172:	}
ADDRGP4 $3327
JUMPV
LABELV $3326
line 6174
;6173:	else
;6174:	{
line 6175
;6175:		if (cg_fpls.integer && cent->currentState.weapon == WP_SABER && cg.snap && cent->currentState.number == cg.snap->ps.clientNum)
ADDRGP4 cg_fpls+12
INDIRI4
CNSTI4 0
EQI4 $3339
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $3339
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3339
ADDRLP4 1000
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $3339
line 6176
;6176:		{
line 6178
;6177:
;6178:			if (cgFPLSState != cg_fpls.integer)
ADDRGP4 cgFPLSState
INDIRI4
ADDRGP4 cg_fpls+12
INDIRI4
EQI4 $3340
line 6179
;6179:			{
line 6180
;6180:				CG_ForceFPLSPlayerModel(cent, ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 CG_ForceFPLSPlayerModel
CALLV
pop
line 6181
;6181:				cgFPLSState = cg_fpls.integer;
ADDRGP4 cgFPLSState
ADDRGP4 cg_fpls+12
INDIRI4
ASGNI4
line 6182
;6182:				return;
ADDRGP4 $3077
JUMPV
line 6190
;6183:			}
;6184:
;6185:			/*
;6186:			mdxaBone_t 		headMatrix;
;6187:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_head, &headMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
;6188:			trap_G2API_GiveMeVectorFromMatrix(&headMatrix, ORIGIN, cg.refdef.vieworg);
;6189:			*/
;6190:		}
LABELV $3339
line 6191
;6191:		else if (!cg_fpls.integer && cgFPLSState)
ADDRLP4 1004
CNSTI4 0
ASGNI4
ADDRGP4 cg_fpls+12
INDIRI4
ADDRLP4 1004
INDIRI4
NEI4 $3348
ADDRGP4 cgFPLSState
INDIRI4
ADDRLP4 1004
INDIRI4
EQI4 $3348
line 6192
;6192:		{
line 6193
;6193:			if (cgFPLSState != cg_fpls.integer)
ADDRGP4 cgFPLSState
INDIRI4
ADDRGP4 cg_fpls+12
INDIRI4
EQI4 $3351
line 6194
;6194:			{
line 6195
;6195:				CG_ForceFPLSPlayerModel(cent, ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 CG_ForceFPLSPlayerModel
CALLV
pop
line 6196
;6196:				cgFPLSState = cg_fpls.integer;
ADDRGP4 cgFPLSState
ADDRGP4 cg_fpls+12
INDIRI4
ASGNI4
line 6197
;6197:				return;
ADDRGP4 $3077
JUMPV
LABELV $3351
line 6199
;6198:			}
;6199:		}
LABELV $3348
LABELV $3340
line 6200
;6200:	}
LABELV $3327
LABELV $3322
line 6202
;6201:
;6202:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3355
line 6203
;6203:	{
line 6204
;6204:		dead = qtrue;
ADDRLP4 864
CNSTI4 1
ASGNI4
line 6208
;6205:		//rww - since our angles are fixed when we're dead this shouldn't be an issue anyway
;6206:		//we need to render the dying/dead player because we are now spawning the body on respawn instead of death
;6207:		//return;
;6208:	}
LABELV $3355
line 6210
;6209:
;6210:	ScaleModelAxis(&legs);
ADDRLP4 0
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 6212
;6211:
;6212:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 544
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6214
;6213:
;6214:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3357
line 6215
;6215:	{
line 6216
;6216:		goto doEssentialTwo;
ADDRGP4 $3359
JUMPV
LABELV $3357
line 6220
;6217:	}
;6218:
;6219:	//rww - force speed "trail" effect
;6220:	if (!(cent->currentState.powerups & (1 << PW_SPEED)) || doAlpha || !cg_speedTrail.integer)
ADDRLP4 1000
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 1000
INDIRI4
EQI4 $3364
ADDRLP4 832
INDIRI4
ADDRLP4 1000
INDIRI4
NEI4 $3364
ADDRGP4 cg_speedTrail+12
INDIRI4
ADDRLP4 1000
INDIRI4
NEI4 $3360
LABELV $3364
line 6221
;6221:	{
line 6222
;6222:		cent->frame_minus1_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 0
ASGNI4
line 6223
;6223:		cent->frame_minus2_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1468
ADDP4
CNSTI4 0
ASGNI4
line 6224
;6224:	}
LABELV $3360
line 6226
;6225:
;6226:	if (cent->frame_minus1.ghoul2 != cent->ghoul2)
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
CNSTI4 1248
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1004
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
EQU4 $3365
line 6227
;6227:	{
line 6228
;6228:		cent->frame_minus1_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 0
ASGNI4
line 6229
;6229:	}
LABELV $3365
line 6230
;6230:	if (cent->frame_minus2.ghoul2 != cent->ghoul2)
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 1460
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1008
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
EQU4 $3367
line 6231
;6231:	{
line 6232
;6232:		cent->frame_minus2_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1468
ADDP4
CNSTI4 0
ASGNI4
line 6233
;6233:	}
LABELV $3367
line 6235
;6234:
;6235:	VectorCopy(cent->currentState.pos.trDelta, tDir);
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 6237
;6236:
;6237:	distVelBase = SPEED_TRAIL_DISTANCE*(VectorNormalize(tDir)*0.004);
ADDRLP4 264
ARGP4
ADDRLP4 1012
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 764
CNSTF4 1086324736
CNSTF4 998445679
ADDRLP4 1012
INDIRF4
MULF4
MULF4
CVFI4 4
ASGNI4
line 6239
;6238:
;6239:	if (cent->frame_minus1.ghoul2 && cent->frame_minus1_refreshed)
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1016
INDIRP4
CNSTI4 1248
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3369
ADDRLP4 1016
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3369
line 6240
;6240:	{
line 6241
;6241:		cent->frame_minus1.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 1020
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
ASGNP4
ADDRLP4 1020
INDIRP4
ADDRLP4 1020
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 6242
;6242:		cent->frame_minus1.shaderRGBA[3] = 100;
ADDRFP4 0
INDIRP4
CNSTI4 1123
ADDP4
CNSTU1 100
ASGNU1
line 6248
;6243:
;6244:		//rww - if the client gets a bad framerate we will only receive frame positions
;6245:		//once per frame anyway, so we might end up with speed trails very spread out.
;6246:		//in order to avoid that, we'll get the direction of the last trail from the player
;6247:		//and place the trail refent a set distance from the player location this frame
;6248:		VectorSubtract(cent->frame_minus1.origin, legs.origin, tDir);
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
ADDRLP4 1024
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
ADDRLP4 0+52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 264+4
ADDRLP4 1024
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 0+52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 264+8
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
INDIRF4
ADDRLP4 0+52+8
INDIRF4
SUBF4
ASGNF4
line 6249
;6249:		VectorNormalize(tDir);
ADDRLP4 264
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6251
;6250:
;6251:		cent->frame_minus1.origin[0] = legs.origin[0]+tDir[0]*distVelBase;
ADDRFP4 0
INDIRP4
CNSTI4 1092
ADDP4
ADDRLP4 0+52
INDIRF4
ADDRLP4 264
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6252
;6252:		cent->frame_minus1.origin[1] = legs.origin[1]+tDir[1]*distVelBase;
ADDRFP4 0
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 0+52+4
INDIRF4
ADDRLP4 264+4
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6253
;6253:		cent->frame_minus1.origin[2] = legs.origin[2]+tDir[2]*distVelBase;
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
ADDRLP4 0+52+8
INDIRF4
ADDRLP4 264+8
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6255
;6254:
;6255:		trap_R_AddRefEntityToScene(&cent->frame_minus1);
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6256
;6256:	}
LABELV $3369
line 6258
;6257:
;6258:	if (cent->frame_minus2.ghoul2 && cent->frame_minus2_refreshed)
ADDRLP4 1020
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1020
INDIRP4
CNSTI4 1460
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3385
ADDRLP4 1020
INDIRP4
CNSTI4 1468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3385
line 6259
;6259:	{
line 6260
;6260:		cent->frame_minus2.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
ASGNP4
ADDRLP4 1024
INDIRP4
ADDRLP4 1024
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 6261
;6261:		cent->frame_minus2.shaderRGBA[3] = 50;
ADDRFP4 0
INDIRP4
CNSTI4 1335
ADDP4
CNSTU1 50
ASGNU1
line 6264
;6262:
;6263:		//Same as above but do it between trail points instead of the player and first trail entry
;6264:		VectorSubtract(cent->frame_minus2.origin, cent->frame_minus1.origin, tDir);
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
ADDRLP4 1028
INDIRP4
CNSTI4 1304
ADDP4
INDIRF4
ADDRLP4 1028
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 264+4
ADDRLP4 1028
INDIRP4
CNSTI4 1308
ADDP4
INDIRF4
ADDRLP4 1028
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264+8
ADDRLP4 1032
INDIRP4
CNSTI4 1312
ADDP4
INDIRF4
ADDRLP4 1032
INDIRP4
CNSTI4 1100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6265
;6265:		VectorNormalize(tDir);
ADDRLP4 264
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6267
;6266:
;6267:		cent->frame_minus2.origin[0] = cent->frame_minus1.origin[0]+tDir[0]*distVelBase;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 1304
ADDP4
ADDRLP4 1036
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
ADDRLP4 264
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6268
;6268:		cent->frame_minus2.origin[1] = cent->frame_minus1.origin[1]+tDir[1]*distVelBase;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 1308
ADDP4
ADDRLP4 1040
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 264+4
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6269
;6269:		cent->frame_minus2.origin[2] = cent->frame_minus1.origin[2]+tDir[2]*distVelBase;
ADDRLP4 1044
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI4 1312
ADDP4
ADDRLP4 1044
INDIRP4
CNSTI4 1100
ADDP4
INDIRF4
ADDRLP4 264+8
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6271
;6270:
;6271:		trap_R_AddRefEntityToScene(&cent->frame_minus2);
ADDRFP4 0
INDIRP4
CNSTI4 1252
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6272
;6272:	}
LABELV $3385
LABELV $3359
line 6275
;6273:
;6274:doEssentialTwo:
;6275:	VectorCopy(cent->turAngles, cg_entities[cent->currentState.number].turAngles);
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 1024
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1016
ADDP4
ADDRLP4 1024
INDIRP4
CNSTI4 1016
ADDP4
INDIRB
ASGNB 12
line 6276
;6276:	VectorCopy(legs.origin, cg_entities[cent->currentState.number].lerpOrigin);
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
ADDRLP4 0+52
INDIRB
ASGNB 12
line 6279
;6277:
;6278:	// get the animation state (after rotation, to allow feet shuffle)
;6279:	CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+124
ARGP4
ADDRLP4 0+104
ARGP4
ADDRLP4 0+128
ARGP4
ADDRLP4 544+124
ARGP4
ADDRLP4 544+104
ARGP4
ADDRLP4 544+128
ARGP4
ADDRGP4 CG_PlayerAnimation
CALLV
pop
line 6283
;6280:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;6281:
;6282:	//Need these set because we use them in other functions (cent pointer differs from cg_entities values)
;6283:	cg_entities[cent->currentState.number].pe.torso.frame = cent->pe.torso.frame;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 1028
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+644+64+8
ADDP4
ADDRLP4 1028
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 6284
;6284:	cg_entities[cent->currentState.number].pe.legs.frame = cent->pe.legs.frame;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 1032
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+644+8
ADDP4
ADDRLP4 1032
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 6287
;6285:
;6286:	// add the talk baloon or disconnect icon
;6287:	CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 6289
;6288:
;6289:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3405
line 6290
;6290:	{ //keep track of death anim frame for when we copy off the bodyqueue
line 6291
;6291:		cgs.clientinfo[cent->currentState.number].frame = cent->pe.torso.frame;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 788
ADDRLP4 1036
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+76
ADDP4
ADDRLP4 1036
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 6292
;6292:	}
LABELV $3405
line 6294
;6293:
;6294:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3409
line 6295
;6295:	{
line 6296
;6296:		goto doEssentialThree;
ADDRGP4 $3411
JUMPV
LABELV $3409
line 6302
;6297:	}
;6298:
;6299:	//rww - render effects multiple times to compensate for low framerate? This won't do much because
;6300:	//the effect still gets rendered in this frame and expires, possibly before the next frame. So
;6301:	//it is disabled for now (setting effectTimeLayer to 0 after one play)
;6302:	if (cent->trailTime < cg.time)
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
GEI4 $3412
line 6303
;6303:	{
line 6304
;6304:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6305
;6305:	}
LABELV $3412
line 6308
;6306:
;6307:	//compensate for up to 300ms
;6308:	effectTimeLayer = (300 - (cent->trailTime - cg.time));
ADDRLP4 756
CNSTI4 300
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
SUBI4
ASGNI4
line 6310
;6309:
;6310:	if (effectTimeLayer < 50)
ADDRLP4 756
INDIRI4
CNSTI4 50
GEI4 $3417
line 6311
;6311:	{ //play at least once
line 6312
;6312:		effectTimeLayer = 50;
ADDRLP4 756
CNSTI4 50
ASGNI4
line 6313
;6313:	}
LABELV $3417
line 6315
;6314:
;6315:	cent->trailTime = cg.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 6317
;6316:
;6317:	if (cent->currentState.activeForcePass > FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 3
LEI4 $3420
line 6318
;6318:	{
line 6319
;6319:		int effectTimeLayerL = effectTimeLayer;
ADDRLP4 1036
ADDRLP4 756
INDIRI4
ASGNI4
line 6323
;6320:
;6321:		vec3_t axis[3];
;6322:		vec3_t tAng, fAng, fxDir;
;6323:		int realForceLev = (cent->currentState.activeForcePass - FORCE_LEVEL_3);
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 6325
;6324:
;6325:		VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
ADDRLP4 1116
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1116
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1092+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 6327
;6326:
;6327:		VectorSet( fAng, cent->pe.torso.pitchAngle, cent->pe.torso.yawAngle, 0 );
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1120
INDIRP4
CNSTI4 736
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1120
INDIRP4
CNSTI4 728
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1080+8
CNSTF4 0
ASGNF4
line 6329
;6328:
;6329:		AngleVectors( fAng, fxDir, NULL, NULL );
ADDRLP4 1080
ARGP4
ADDRLP4 1104
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
line 6332
;6330:
;6331:		//trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
;6332:		if (!gotLHandMatrix)
ADDRLP4 772
INDIRI4
CNSTI4 0
NEI4 $3426
line 6333
;6333:		{
line 6334
;6334:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &lHandMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1128
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+516
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRLP4 1128
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 1128
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1128
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6335
;6335:			gotLHandMatrix = qtrue;
ADDRLP4 772
CNSTI4 1
ASGNI4
line 6336
;6336:		}
LABELV $3426
line 6338
;6337:
;6338:		efOrg[0] = lHandMatrix.matrix[0][3];
ADDRLP4 240
ADDRLP4 488+12
INDIRF4
ASGNF4
line 6339
;6339:		efOrg[1] = lHandMatrix.matrix[1][3];
ADDRLP4 240+4
ADDRLP4 488+16+12
INDIRF4
ASGNF4
line 6340
;6340:		efOrg[2] = lHandMatrix.matrix[2][3];
ADDRLP4 240+8
ADDRLP4 488+32+12
INDIRF4
ASGNF4
line 6342
;6341:
;6342:		AnglesToAxis( fAng, axis );
ADDRLP4 1080
ARGP4
ADDRLP4 1044
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
ADDRGP4 $3440
JUMPV
LABELV $3439
line 6345
;6343:	
;6344:		while (effectTimeLayerL > 0)
;6345:		{
line 6346
;6346:			if ( realForceLev > FORCE_LEVEL_2 )
ADDRLP4 1040
INDIRI4
CNSTI4 2
LEI4 $3442
line 6347
;6347:			{//arc
line 6349
;6348:				//trap_FX_PlayEffectID( cgs.effects.forceLightningWide, efOrg, fxDir );
;6349:				trap_FX_PlayEntityEffectID(cgs.effects.forceDrainWide, efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 cgs+71564+156
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 1044
ARGP4
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1128
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6350
;6350:			}
ADDRGP4 $3443
JUMPV
LABELV $3442
line 6352
;6351:			else
;6352:			{//line
line 6354
;6353:				//trap_FX_PlayEffectID( cgs.effects.forceLightning, efOrg, fxDir );
;6354:				trap_FX_PlayEntityEffectID(cgs.effects.forceDrain, efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 cgs+71564+152
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 1044
ARGP4
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1128
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6355
;6355:			}
LABELV $3443
line 6357
;6356:
;6357:			effectTimeLayerL = 0;//-= 50;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 6358
;6358:		}
LABELV $3440
line 6344
ADDRLP4 1036
INDIRI4
CNSTI4 0
GTI4 $3439
line 6367
;6359:
;6360:		/*
;6361:		if (cent->bolt4 < cg.time)
;6362:		{
;6363:			cent->bolt4 = cg.time + 100;
;6364:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/force/drain.wav") );
;6365:		}
;6366:		*/
;6367:	}
ADDRGP4 $3421
JUMPV
LABELV $3420
line 6368
;6368:	else if ( cent->currentState.activeForcePass )
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3448
line 6369
;6369:	{//doing the electrocuting
line 6370
;6370:		int effectTimeLayerL = effectTimeLayer;
ADDRLP4 1036
ADDRLP4 756
INDIRI4
ASGNI4
line 6374
;6371:
;6372:		vec3_t axis[3];
;6373:		vec3_t tAng, fAng, fxDir;
;6374:		VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
ADDRLP4 1112
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 1112
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1088+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 6376
;6375:
;6376:		VectorSet( fAng, cent->pe.torso.pitchAngle, cent->pe.torso.yawAngle, 0 );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1076
ADDRLP4 1116
INDIRP4
CNSTI4 736
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1076+4
ADDRLP4 1116
INDIRP4
CNSTI4 728
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1076+8
CNSTF4 0
ASGNF4
line 6378
;6377:
;6378:		AngleVectors( fAng, fxDir, NULL, NULL );
ADDRLP4 1076
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1120
CNSTP4 0
ASGNP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 6381
;6379:
;6380:		//trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
;6381:		if (!gotLHandMatrix)
ADDRLP4 772
INDIRI4
CNSTI4 0
NEI4 $3454
line 6382
;6382:		{
line 6383
;6383:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &lHandMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1124
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+516
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRLP4 1124
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 1124
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1124
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6384
;6384:			gotLHandMatrix = qtrue;
ADDRLP4 772
CNSTI4 1
ASGNI4
line 6385
;6385:		}
LABELV $3454
line 6387
;6386:
;6387:		efOrg[0] = lHandMatrix.matrix[0][3];
ADDRLP4 240
ADDRLP4 488+12
INDIRF4
ASGNF4
line 6388
;6388:		efOrg[1] = lHandMatrix.matrix[1][3];
ADDRLP4 240+4
ADDRLP4 488+16+12
INDIRF4
ASGNF4
line 6389
;6389:		efOrg[2] = lHandMatrix.matrix[2][3];
ADDRLP4 240+8
ADDRLP4 488+32+12
INDIRF4
ASGNF4
line 6391
;6390:
;6391:		AnglesToAxis( fAng, axis );
ADDRLP4 1076
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
ADDRGP4 $3468
JUMPV
LABELV $3467
line 6394
;6392:	
;6393:		while (effectTimeLayerL > 0)
;6394:		{
line 6395
;6395:			if ( cent->currentState.activeForcePass > FORCE_LEVEL_2 )
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 2
LEI4 $3470
line 6396
;6396:			{//arc
line 6398
;6397:				//trap_FX_PlayEffectID( cgs.effects.forceLightningWide, efOrg, fxDir );
;6398:				trap_FX_PlayEntityEffectID(cgs.effects.forceLightningWide, efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 cgs+71564+148
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 1040
ARGP4
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1124
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6399
;6399:			}
ADDRGP4 $3471
JUMPV
LABELV $3470
line 6401
;6400:			else
;6401:			{//line
line 6403
;6402:				//trap_FX_PlayEffectID( cgs.effects.forceLightning, efOrg, fxDir );
;6403:				trap_FX_PlayEntityEffectID(cgs.effects.forceLightning, efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 cgs+71564+144
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 1040
ARGP4
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1124
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6404
;6404:			}
LABELV $3471
line 6406
;6405:
;6406:			effectTimeLayerL = 0;//-= 50;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 6407
;6407:		}
LABELV $3468
line 6393
ADDRLP4 1036
INDIRI4
CNSTI4 0
GTI4 $3467
line 6416
;6408:
;6409:		/*
;6410:		if (cent->bolt4 < cg.time)
;6411:		{
;6412:			cent->bolt4 = cg.time + 100;
;6413:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/force/lightning.wav") );
;6414:		}
;6415:		*/
;6416:	}
LABELV $3448
LABELV $3421
line 6418
;6417:
;6418:	if ( cent->currentState.powerups & (1 << PW_DISINT_4) )
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $3476
line 6419
;6419:	{
line 6422
;6420:		vec3_t tAng;
;6421:		//VectorSet( tAng, 0, cent->pe.torso.yawAngle, 0 );
;6422:		VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
ADDRLP4 1048
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1036+4
ADDRLP4 1048
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1036+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 6425
;6423:
;6424:		//trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
;6425:		if (!gotLHandMatrix)
ADDRLP4 772
INDIRI4
CNSTI4 0
NEI4 $3480
line 6426
;6426:		{
line 6427
;6427:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &lHandMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1052
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+516
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRLP4 1052
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 1052
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1052
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6428
;6428:			gotLHandMatrix = qtrue;
ADDRLP4 772
CNSTI4 1
ASGNI4
line 6429
;6429:		}
LABELV $3480
line 6431
;6430:
;6431:		efOrg[0] = lHandMatrix.matrix[0][3];
ADDRLP4 240
ADDRLP4 488+12
INDIRF4
ASGNF4
line 6432
;6432:		efOrg[1] = lHandMatrix.matrix[1][3];
ADDRLP4 240+4
ADDRLP4 488+16+12
INDIRF4
ASGNF4
line 6433
;6433:		efOrg[2] = lHandMatrix.matrix[2][3];
ADDRLP4 240+8
ADDRLP4 488+32+12
INDIRF4
ASGNF4
line 6435
;6434:
;6435:		if ( (cent->currentState.forcePowersActive & (1 << FP_GRIP)) &&
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 1056
INDIRI4
EQI4 $3493
ADDRGP4 cg+88
INDIRI4
ADDRLP4 1056
INDIRI4
NEI4 $3497
ADDRLP4 1052
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $3493
LABELV $3497
line 6437
;6436:			(cg.renderingThirdPerson || cent->currentState.number != cg.snap->ps.clientNum) )
;6437:		{
line 6440
;6438:			vec3_t boltDir;
;6439:			vec3_t origBolt;
;6440:			VectorCopy(efOrg, origBolt);
ADDRLP4 1072
ADDRLP4 240
INDIRB
ASGNB 12
line 6441
;6441:			trap_G2API_GiveMeVectorFromMatrix( &lHandMatrix, NEGATIVE_Y, boltDir );
ADDRLP4 488
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1060
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6443
;6442:
;6443:			CG_ForceGripEffect( efOrg );
ADDRLP4 240
ARGP4
ADDRGP4 CG_ForceGripEffect
CALLV
pop
line 6444
;6444:			CG_ForceGripEffect( efOrg );
ADDRLP4 240
ARGP4
ADDRGP4 CG_ForceGripEffect
CALLV
pop
line 6447
;6445:
;6446:			//Render a scaled version of the model's hand with a n337 looking shader
;6447:			{
line 6452
;6448:				const char *rotateBone;
;6449:				char *limbName;
;6450:				char *limbCapName;
;6451:				vec3_t armAng;
;6452:				float wv = sin( cg.time * 0.003f ) * 0.08f + 0.1f;
CNSTF4 994352038
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 1112
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 1096
CNSTF4 1034147594
ADDRLP4 1112
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 6454
;6453:
;6454:				rotateBone = "lradius";
ADDRLP4 1100
ADDRGP4 $3499
ASGNP4
line 6455
;6455:				limbName = "l_arm";
ADDRLP4 1104
ADDRGP4 $3500
ASGNP4
line 6456
;6456:				limbCapName = "l_arm_cap_torso_off";
ADDRLP4 1108
ADDRGP4 $3501
ASGNP4
line 6458
;6457:
;6458:				if (cent->grip_arm.ghoul2 && trap_G2_HaveWeGhoul2Models(cent->grip_arm.ghoul2))
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3502
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
EQI4 $3502
line 6459
;6459:				{
line 6460
;6460:					trap_G2API_CleanGhoul2Models(&(cent->grip_arm.ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 6461
;6461:				}
LABELV $3502
line 6463
;6462:
;6463:				memset( &cent->grip_arm, 0, sizeof(cent->grip_arm) );
ADDRFP4 0
INDIRP4
CNSTI4 1692
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6465
;6464:
;6465:				VectorCopy(origBolt, efOrg);
ADDRLP4 240
ADDRLP4 1072
INDIRB
ASGNB 12
line 6466
;6466:				trap_G2API_GiveMeVectorFromMatrix( &lHandMatrix, NEGATIVE_Y, boltDir );
ADDRLP4 488
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1060
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6467
;6467:				efOrg[0] += boltDir[0]*8;
ADDRLP4 240
ADDRLP4 240
INDIRF4
CNSTF4 1090519040
ADDRLP4 1060
INDIRF4
MULF4
ADDF4
ASGNF4
line 6468
;6468:				efOrg[1] += boltDir[1]*8;
ADDRLP4 240+4
ADDRLP4 240+4
INDIRF4
CNSTF4 1090519040
ADDRLP4 1060+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 6469
;6469:				efOrg[2] += boltDir[2]*8;
ADDRLP4 240+8
ADDRLP4 240+8
INDIRF4
CNSTF4 1090519040
ADDRLP4 1060+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 6470
;6470:				trap_G2API_GiveMeVectorFromMatrix( &lHandMatrix, NEGATIVE_X, boltDir );
ADDRLP4 488
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1060
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6471
;6471:				efOrg[0] -= boltDir[0]*4;
ADDRLP4 240
ADDRLP4 240
INDIRF4
CNSTF4 1082130432
ADDRLP4 1060
INDIRF4
MULF4
SUBF4
ASGNF4
line 6472
;6472:				efOrg[1] -= boltDir[1]*4;
ADDRLP4 240+4
ADDRLP4 240+4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1060+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 6473
;6473:				efOrg[2] -= boltDir[2]*4;
ADDRLP4 240+8
ADDRLP4 240+8
INDIRF4
CNSTF4 1082130432
ADDRLP4 1060+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 6476
;6474:
;6475:				//efOrg[2] += 8;
;6476:				efOrg[2] -= 4;
ADDRLP4 240+8
ADDRLP4 240+8
INDIRF4
CNSTF4 1082130432
SUBF4
ASGNF4
line 6478
;6477:
;6478:				VectorCopy(efOrg, cent->grip_arm.origin);
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ADDRLP4 240
INDIRB
ASGNB 12
line 6479
;6479:				VectorCopy(cent->grip_arm.origin, cent->grip_arm.lightingOrigin);
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 1800
ADDP4
ADDRLP4 1124
INDIRP4
CNSTI4 1744
ADDP4
INDIRB
ASGNB 12
line 6482
;6480:
;6481:				//VectorCopy(cent->lerpAngles, armAng);
;6482:				VectorAdd(vec3_origin, rootAngles, armAng);
ADDRLP4 1084
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 840
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1084+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 840+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1084+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 840+8
INDIRF4
ADDF4
ASGNF4
line 6484
;6483:				//armAng[ROLL] = -90;
;6484:				armAng[ROLL] = 0;
ADDRLP4 1084+8
CNSTF4 0
ASGNF4
line 6485
;6485:				armAng[PITCH] = 0;
ADDRLP4 1084
CNSTF4 0
ASGNF4
line 6486
;6486:				AnglesToAxis(armAng, cent->grip_arm.axis);
ADDRLP4 1084
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1704
ADDP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 6488
;6487:				
;6488:				trap_G2API_DuplicateGhoul2Instance(cent->ghoul2, &cent->grip_arm.ghoul2);
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
CNSTI4 1900
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 6490
;6489:
;6490:				trap_G2API_SetRootSurface(cent->grip_arm.ghoul2, 0, limbName);
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRGP4 trap_G2API_SetRootSurface
CALLI4
pop
line 6491
;6491:				trap_G2API_SetNewOrigin(cent->grip_arm.ghoul2, trap_G2API_AddBolt(cent->grip_arm.ghoul2, 0, rotateBone));
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ARGP4
ADDRLP4 1132
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetNewOrigin
CALLI4
pop
line 6492
;6492:				trap_G2API_SetSurfaceOnOff(cent->grip_arm.ghoul2, limbCapName, 0);
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 6494
;6493:
;6494:				cent->grip_arm.modelScale[0] = 1;//+(wv*6);
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTF4 1065353216
ASGNF4
line 6495
;6495:				cent->grip_arm.modelScale[1] = 1;//+(wv*6);
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
CNSTF4 1065353216
ASGNF4
line 6496
;6496:				cent->grip_arm.modelScale[2] = 1;//+(wv*6);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
CNSTF4 1065353216
ASGNF4
line 6497
;6497:				ScaleModelAxis(&cent->grip_arm);
ADDRFP4 0
INDIRP4
CNSTI4 1692
ADDP4
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 6499
;6498:
;6499:				cent->grip_arm.radius = 64;
ADDRFP4 0
INDIRP4
CNSTI4 1784
ADDP4
CNSTF4 1115684864
ASGNF4
line 6501
;6500:
;6501:				cent->grip_arm.customShader = trap_R_RegisterShader( "gfx/misc/red_portashield" );
ADDRGP4 $3520
ARGP4
ADDRLP4 1136
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
ADDRLP4 1136
INDIRI4
ASGNI4
line 6503
;6502:				
;6503:				cent->grip_arm.renderfx |= RF_RGB_TINT;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1696
ADDP4
ASGNP4
ADDRLP4 1140
INDIRP4
ADDRLP4 1140
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 6504
;6504:				cent->grip_arm.shaderRGBA[0] = 255 - (wv*900);
ADDRLP4 1148
CNSTF4 1132396544
CNSTF4 1147207680
ADDRLP4 1096
INDIRF4
MULF4
SUBF4
ASGNF4
ADDRLP4 1152
CNSTF4 1325400064
ASGNF4
ADDRLP4 1148
INDIRF4
ADDRLP4 1152
INDIRF4
LTF4 $3522
ADDRLP4 1144
ADDRLP4 1148
INDIRF4
ADDRLP4 1152
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3523
JUMPV
LABELV $3522
ADDRLP4 1144
ADDRLP4 1148
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3523
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
ADDRLP4 1144
INDIRU4
CVUU1 4
ASGNU1
line 6505
;6505:				if (cent->grip_arm.shaderRGBA[0] < 30)
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRU1
CVUI4 1
CNSTI4 30
GEI4 $3524
line 6506
;6506:				{
line 6507
;6507:					cent->grip_arm.shaderRGBA[0] = 30;
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
CNSTU1 30
ASGNU1
line 6508
;6508:				}
LABELV $3524
line 6509
;6509:				if (cent->grip_arm.shaderRGBA[0] > 255)
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRU1
CVUI4 1
CNSTI4 255
LEI4 $3526
line 6510
;6510:				{
line 6511
;6511:					cent->grip_arm.shaderRGBA[0] = 255;
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
CNSTU1 255
ASGNU1
line 6512
;6512:				}
LABELV $3526
line 6513
;6513:				cent->grip_arm.shaderRGBA[1] = cent->grip_arm.shaderRGBA[2] = cent->grip_arm.shaderRGBA[0];
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1160
ADDRLP4 1156
INDIRP4
CNSTI4 1772
ADDP4
INDIRU1
ASGNU1
ADDRLP4 1156
INDIRP4
CNSTI4 1774
ADDP4
ADDRLP4 1160
INDIRU1
ASGNU1
ADDRLP4 1156
INDIRP4
CNSTI4 1773
ADDP4
ADDRLP4 1160
INDIRU1
ASGNU1
line 6515
;6514:				
;6515:				trap_R_AddRefEntityToScene( &cent->grip_arm );
ADDRFP4 0
INDIRP4
CNSTI4 1692
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6516
;6516:			}
line 6517
;6517:		}
ADDRGP4 $3494
JUMPV
LABELV $3493
line 6518
;6518:		else if (!(cent->currentState.forcePowersActive & (1 << FP_GRIP)))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $3528
line 6519
;6519:		{
line 6520
;6520:			CG_ForcePushBlur( efOrg );
ADDRLP4 240
ARGP4
ADDRGP4 CG_ForcePushBlur
CALLV
pop
line 6521
;6521:		}
LABELV $3528
LABELV $3494
line 6522
;6522:	}
LABELV $3476
line 6524
;6523:
;6524:	if (cent->currentState.weapon == WP_STUN_BATON && cent->currentState.number == cg.snap->ps.clientNum)
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 1
NEI4 $3530
ADDRLP4 1036
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $3530
line 6525
;6525:	{
line 6526
;6526:		trap_S_AddLoopingSound( cent->currentState.number, cg.refdef.vieworg, vec3_origin, 
ADDRGP4 $3535
ARGP4
ADDRLP4 1040
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 cg+3616+24
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 6528
;6527:			trap_S_RegisterSound( "sound/weapons/baton/idle.wav" ) );
;6528:	}
LABELV $3530
line 6532
;6529:
;6530:	//NOTE: All effects that should be visible during mindtrick should go above here
;6531:
;6532:	if (iwantout)
ADDRLP4 768
INDIRI4
CNSTI4 0
EQI4 $3536
line 6533
;6533:	{
line 6534
;6534:		goto stillDoSaber;
ADDRGP4 $3538
JUMPV
LABELV $3536
line 6537
;6535:		//return;
;6536:	}
;6537:	else if (doAlpha)
ADDRLP4 832
INDIRI4
CNSTI4 0
EQI4 $3539
line 6538
;6538:	{
line 6539
;6539:		legs.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 6540
;6540:		legs.shaderRGBA[3] = cent->trickAlpha;
ADDRLP4 0+80+3
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 6542
;6541:
;6542:		if (legs.shaderRGBA[3] < 1)
ADDRLP4 0+80+3
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $3544
line 6543
;6543:		{ //don't cancel it out even if it's < 1
line 6544
;6544:			legs.shaderRGBA[3] = 1;
ADDRLP4 0+80+3
CNSTU1 1
ASGNU1
line 6545
;6545:		}
LABELV $3544
line 6546
;6546:	}
LABELV $3539
line 6548
;6547:
;6548:	if (cg_entities[cent->currentState.number].teamPowerEffectTime > cg.time)
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $3550
line 6549
;6549:	{
line 6550
;6550:		if (cg_entities[cent->currentState.number].teamPowerType == 3)
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
INDIRI4
CNSTI4 3
NEI4 $3554
line 6551
;6551:		{ //absorb is a somewhat different effect entirely
line 6553
;6552:			//Guess I'll take care of it where it's always been, just checking these values instead.
;6553:		}
ADDRGP4 $3555
JUMPV
LABELV $3554
line 6555
;6554:		else
;6555:		{
line 6559
;6556:			vec4_t preCol;
;6557:			int preRFX;
;6558:
;6559:			preRFX = legs.renderfx;
ADDRLP4 1056
ADDRLP4 0+4
INDIRI4
ASGNI4
line 6561
;6560:
;6561:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 6562
;6562:			legs.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 6564
;6563:
;6564:			preCol[0] = legs.shaderRGBA[0];
ADDRLP4 1040
ADDRLP4 0+80
INDIRU1
CVUI4 1
CVIF4 4
ASGNF4
line 6565
;6565:			preCol[1] = legs.shaderRGBA[1];
ADDRLP4 1040+4
ADDRLP4 0+80+1
INDIRU1
CVUI4 1
CVIF4 4
ASGNF4
line 6566
;6566:			preCol[2] = legs.shaderRGBA[2];
ADDRLP4 1040+8
ADDRLP4 0+80+2
INDIRU1
CVUI4 1
CVIF4 4
ASGNF4
line 6567
;6567:			preCol[3] = legs.shaderRGBA[3];
ADDRLP4 1040+12
ADDRLP4 0+80+3
INDIRU1
CVUI4 1
CVIF4 4
ASGNF4
line 6569
;6568:
;6569:			if (cg_entities[cent->currentState.number].teamPowerType == 1)
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
INDIRI4
CNSTI4 1
NEI4 $3570
line 6570
;6570:			{ //heal
line 6571
;6571:				legs.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 6572
;6572:				legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 6573
;6573:				legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 6574
;6574:			}
ADDRGP4 $3571
JUMPV
LABELV $3570
line 6575
;6575:			else if (cg_entities[cent->currentState.number].teamPowerType == 0)
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3578
line 6576
;6576:			{ //regen
line 6577
;6577:				legs.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 6578
;6578:				legs.shaderRGBA[1] = 0;
ADDRLP4 0+80+1
CNSTU1 0
ASGNU1
line 6579
;6579:				legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 6580
;6580:			}
ADDRGP4 $3579
JUMPV
LABELV $3578
line 6582
;6581:			else
;6582:			{ //drain
line 6583
;6583:				legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 6584
;6584:				legs.shaderRGBA[1] = 0;
ADDRLP4 0+80+1
CNSTU1 0
ASGNU1
line 6585
;6585:				legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 6586
;6586:			}
LABELV $3579
LABELV $3571
line 6588
;6587:
;6588:			legs.shaderRGBA[3] = ((cg_entities[cent->currentState.number].teamPowerEffectTime - cg.time)/8);
ADDRLP4 0+80+3
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CNSTI4 8
DIVI4
CVIU4 4
CVUU1 4
ASGNU1
line 6590
;6589:
;6590:			legs.customShader = trap_R_RegisterShader( "powerups/ysalimarishell" );
ADDRGP4 $3596
ARGP4
ADDRLP4 1060
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+76
ADDRLP4 1060
INDIRI4
ASGNI4
line 6591
;6591:			trap_R_AddRefEntityToScene(&legs);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6593
;6592:
;6593:			legs.customShader = 0;
ADDRLP4 0+76
CNSTI4 0
ASGNI4
line 6594
;6594:			legs.renderfx = preRFX;
ADDRLP4 0+4
ADDRLP4 1056
INDIRI4
ASGNI4
line 6595
;6595:			legs.shaderRGBA[0] = preCol[0];
ADDRLP4 1068
ADDRLP4 1040
INDIRF4
ASGNF4
ADDRLP4 1072
CNSTF4 1325400064
ASGNF4
ADDRLP4 1068
INDIRF4
ADDRLP4 1072
INDIRF4
LTF4 $3601
ADDRLP4 1064
ADDRLP4 1068
INDIRF4
ADDRLP4 1072
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3602
JUMPV
LABELV $3601
ADDRLP4 1064
ADDRLP4 1068
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3602
ADDRLP4 0+80
ADDRLP4 1064
INDIRU4
CVUU1 4
ASGNU1
line 6596
;6596:			legs.shaderRGBA[1] = preCol[1];
ADDRLP4 1080
ADDRLP4 1040+4
INDIRF4
ASGNF4
ADDRLP4 1084
CNSTF4 1325400064
ASGNF4
ADDRLP4 1080
INDIRF4
ADDRLP4 1084
INDIRF4
LTF4 $3607
ADDRLP4 1076
ADDRLP4 1080
INDIRF4
ADDRLP4 1084
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3608
JUMPV
LABELV $3607
ADDRLP4 1076
ADDRLP4 1080
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3608
ADDRLP4 0+80+1
ADDRLP4 1076
INDIRU4
CVUU1 4
ASGNU1
line 6597
;6597:			legs.shaderRGBA[2] = preCol[2];
ADDRLP4 1092
ADDRLP4 1040+8
INDIRF4
ASGNF4
ADDRLP4 1096
CNSTF4 1325400064
ASGNF4
ADDRLP4 1092
INDIRF4
ADDRLP4 1096
INDIRF4
LTF4 $3613
ADDRLP4 1088
ADDRLP4 1092
INDIRF4
ADDRLP4 1096
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3614
JUMPV
LABELV $3613
ADDRLP4 1088
ADDRLP4 1092
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3614
ADDRLP4 0+80+2
ADDRLP4 1088
INDIRU4
CVUU1 4
ASGNU1
line 6598
;6598:			legs.shaderRGBA[3] = preCol[3];
ADDRLP4 1104
ADDRLP4 1040+12
INDIRF4
ASGNF4
ADDRLP4 1108
CNSTF4 1325400064
ASGNF4
ADDRLP4 1104
INDIRF4
ADDRLP4 1108
INDIRF4
LTF4 $3619
ADDRLP4 1100
ADDRLP4 1104
INDIRF4
ADDRLP4 1108
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3620
JUMPV
LABELV $3619
ADDRLP4 1100
ADDRLP4 1104
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3620
ADDRLP4 0+80+3
ADDRLP4 1100
INDIRU4
CVUU1 4
ASGNU1
line 6599
;6599:		}
LABELV $3555
line 6600
;6600:	}
LABELV $3550
line 6603
;6601:
;6602:	//If you've tricked this client.
;6603:	if (CG_IsMindTricked(cg.snap->ps.fd.forceMindtrickTargetIndex,
ADDRGP4 cg+36
INDIRP4
CNSTI4 1200
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $3621
line 6608
;6604:		cg.snap->ps.fd.forceMindtrickTargetIndex2,
;6605:		cg.snap->ps.fd.forceMindtrickTargetIndex3,
;6606:		cg.snap->ps.fd.forceMindtrickTargetIndex4,
;6607:		cent->currentState.number))
;6608:	{
line 6609
;6609:		if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3627
line 6610
;6610:		{
line 6614
;6611:			vec3_t efOrg;
;6612:			vec3_t tAng, fxAng;
;6613:			vec3_t axis[3];
;6614:			int effectTimeLayerC = effectTimeLayer;
ADDRLP4 1044
ADDRLP4 756
INDIRI4
ASGNI4
line 6618
;6615:			sharedBoltInterface_t fxObj;
;6616:
;6617:			//VectorSet( tAng, 0, cent->pe.torso.yawAngle, 0 );
;6618:			VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
ADDRLP4 1176
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1152+4
ADDRLP4 1176
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1152+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 6620
;6619:
;6620:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_head, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1180
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+520
ADDP4
INDIRI4
ARGI4
ADDRLP4 780
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6622
;6621:
;6622:			trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, efOrg);
ADDRLP4 780
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1084
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6623
;6623:			trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, NEGATIVE_Y, fxAng);
ADDRLP4 780
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1164
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6625
;6624:
;6625: 			axis[0][0] = boltMatrix.matrix[0][0];
ADDRLP4 1048
ADDRLP4 780
INDIRF4
ASGNF4
line 6626
;6626: 			axis[0][1] = boltMatrix.matrix[1][0];
ADDRLP4 1048+4
ADDRLP4 780+16
INDIRF4
ASGNF4
line 6627
;6627:		 	axis[0][2] = boltMatrix.matrix[2][0];
ADDRLP4 1048+8
ADDRLP4 780+32
INDIRF4
ASGNF4
line 6629
;6628:
;6629: 			axis[1][0] = boltMatrix.matrix[0][1];
ADDRLP4 1048+12
ADDRLP4 780+4
INDIRF4
ASGNF4
line 6630
;6630: 			axis[1][1] = boltMatrix.matrix[1][1];
ADDRLP4 1048+12+4
ADDRLP4 780+16+4
INDIRF4
ASGNF4
line 6631
;6631:		 	axis[1][2] = boltMatrix.matrix[2][1];
ADDRLP4 1048+12+8
ADDRLP4 780+32+4
INDIRF4
ASGNF4
line 6633
;6632:
;6633: 			axis[2][0] = boltMatrix.matrix[0][2];
ADDRLP4 1048+24
ADDRLP4 780+8
INDIRF4
ASGNF4
line 6634
;6634: 			axis[2][1] = boltMatrix.matrix[1][2];
ADDRLP4 1048+24+4
ADDRLP4 780+16+8
INDIRF4
ASGNF4
line 6635
;6635:		 	axis[2][2] = boltMatrix.matrix[2][2];
ADDRLP4 1048+24+8
ADDRLP4 780+32+8
INDIRF4
ASGNF4
line 6637
;6636:
;6637:			VectorCopy(/*efOrg*/cent->lerpOrigin, fxObj.origin);
ADDRLP4 1096+28
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6638
;6638:			VectorCopy(/*fxAng*/tAng, fxObj.angles);
ADDRLP4 1096+16
ADDRLP4 1152
INDIRB
ASGNB 12
line 6639
;6639:			VectorCopy(cent->modelScale, fxObj.scale);
ADDRLP4 1096+40
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRB
ASGNB 12
line 6640
;6640:			fxObj.ghoul2 = cent->ghoul2;
ADDRLP4 1096+4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ASGNP4
line 6641
;6641:			fxObj.isValid = 1;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 6642
;6642:			fxObj.modelNum = 0;
ADDRLP4 1096+8
CNSTI4 0
ASGNI4
line 6643
;6643:			fxObj.boltNum = cgs.clientinfo[cent->currentState.number].bolt_head;
ADDRLP4 1096+12
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+520
ADDP4
INDIRI4
ASGNI4
line 6644
;6644:			fxObj.entNum = cent->currentState.number;
ADDRLP4 1096+52
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $3669
JUMPV
LABELV $3668
line 6647
;6645:	
;6646:			while (effectTimeLayerC > 0)
;6647:			{
line 6648
;6648:				trap_FX_PlayEntityEffectID(trap_FX_RegisterEffect("force/confusion.efx"), efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 $3671
ARGP4
ADDRLP4 1184
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
ARGI4
ADDRLP4 1084
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1188
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6654
;6649:
;6650:				//FIXME: Due to the horrible inefficiency involved in the current effect bolt process an effect with as many particles as this won't
;6651:				//work too happily. It also doesn't look a lot better due to the lag between origin updates with the effect bolt. If those issues
;6652:				//are ever resolved it should be switched over to BoltedEffect.
;6653:				//trap_FX_PlayBoltedEffectID(trap_FX_RegisterEffect("force/confusion.efx"), &fxObj);
;6654:				effectTimeLayerC = 0;//-= 50;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 6655
;6655:			}
LABELV $3669
line 6646
ADDRLP4 1044
INDIRI4
CNSTI4 0
GTI4 $3668
line 6656
;6656:		}
LABELV $3627
line 6657
;6657:	}
LABELV $3621
line 6659
;6658:
;6659:	if (cgs.gametype == GT_HOLOCRON && cent->currentState.time2 && (cg.renderingThirdPerson || cg.snap->ps.clientNum != cent->currentState.number))
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 1
NEI4 $3672
ADDRLP4 1044
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRLP4 1044
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 1048
INDIRI4
EQI4 $3672
ADDRGP4 cg+88
INDIRI4
ADDRLP4 1048
INDIRI4
NEI4 $3677
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 1044
INDIRP4
INDIRI4
EQI4 $3672
LABELV $3677
line 6660
;6660:	{
line 6661
;6661:		int i = 0;
ADDRLP4 1264
CNSTI4 0
ASGNI4
line 6662
;6662:		int renderedHolos = 0;
ADDRLP4 1268
CNSTI4 0
ASGNI4
ADDRGP4 $3679
JUMPV
LABELV $3678
line 6666
;6663:		refEntity_t		holoRef;
;6664:
;6665:		while (i < NUM_FORCE_POWERS && renderedHolos < 3)
;6666:		{
line 6667
;6667:			if (cent->currentState.time2 & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 1264
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3681
line 6668
;6668:			{
line 6669
;6669:				memset( &holoRef, 0, sizeof(holoRef) );
ADDRLP4 1052
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6671
;6670:
;6671:				VectorCopy(cent->lerpOrigin, elevated);
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6672
;6672:				elevated[2] += 8;
ADDRLP4 224+8
ADDRLP4 224+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 6674
;6673:
;6674:				VectorCopy( elevated, holoRef.lightingOrigin );
ADDRLP4 1052+108
ADDRLP4 224
INDIRB
ASGNB 12
line 6675
;6675:				holoRef.shadowPlane = shadowPlane;
ADDRLP4 1052+120
ADDRLP4 540
INDIRF4
ASGNF4
line 6676
;6676:				holoRef.renderfx = 0;//RF_THIRD_PERSON;
ADDRLP4 1052+4
CNSTI4 0
ASGNI4
line 6678
;6677:
;6678:				if (renderedHolos == 0)
ADDRLP4 1268
INDIRI4
CNSTI4 0
NEI4 $3687
line 6679
;6679:				{
line 6680
;6680:					angle = ((cg.time / 8) & 255) * (M_PI * 2) / 255;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
INDIRI4
CNSTI4 8
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 6681
;6681:					dir[0] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1272
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 1272
INDIRF4
MULF4
ASGNF4
line 6682
;6682:					dir[1] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1276
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1276
INDIRF4
MULF4
ASGNF4
line 6683
;6683:					dir[2] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1280
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1101004800
ADDRLP4 1280
INDIRF4
MULF4
ASGNF4
line 6684
;6684:					VectorAdd(elevated, dir, holoRef.origin);
ADDRLP4 1052+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1052+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1052+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6686
;6685:
;6686:					angles[0] = sin(angle) * 30;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1284
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 252
CNSTF4 1106247680
ADDRLP4 1284
INDIRF4
MULF4
ASGNF4
line 6687
;6687:					angles[1] = (angle * 180 / M_PI) + 90;
ADDRLP4 252+4
CNSTF4 1127481344
ADDRLP4 236
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 6688
;6688:					if (angles[1] > 360)
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
LEF4 $3702
line 6689
;6689:						angles[1] -= 360;
ADDRLP4 252+4
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $3702
line 6690
;6690:					angles[2] = 0;
ADDRLP4 252+8
CNSTF4 0
ASGNF4
line 6691
;6691:					AnglesToAxis( angles, holoRef.axis );
ADDRLP4 252
ARGP4
ADDRLP4 1052+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 6692
;6692:				}
ADDRGP4 $3688
JUMPV
LABELV $3687
line 6693
;6693:				else if (renderedHolos == 1)
ADDRLP4 1268
INDIRI4
CNSTI4 1
NEI4 $3708
line 6694
;6694:				{
line 6695
;6695:					angle = ((cg.time / 8) & 255) * (M_PI * 2) / 255 + M_PI;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
INDIRI4
CNSTI4 8
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
CNSTF4 1078530011
ADDF4
ASGNF4
line 6696
;6696:					if (angle > M_PI * 2)
ADDRLP4 236
INDIRF4
CNSTF4 1086918619
LEF4 $3711
line 6697
;6697:						angle -= (float)M_PI * 2;
ADDRLP4 236
ADDRLP4 236
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $3711
line 6698
;6698:					dir[0] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1272
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 1272
INDIRF4
MULF4
ASGNF4
line 6699
;6699:					dir[1] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1276
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1276
INDIRF4
MULF4
ASGNF4
line 6700
;6700:					dir[2] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1280
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1101004800
ADDRLP4 1280
INDIRF4
MULF4
ASGNF4
line 6701
;6701:					VectorAdd(elevated, dir, holoRef.origin);
ADDRLP4 1052+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1052+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1052+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6703
;6702:
;6703:					angles[0] = cos(angle - 0.5 * M_PI) * 30;
ADDRLP4 236
INDIRF4
CNSTF4 1070141403
SUBF4
ARGF4
ADDRLP4 1284
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 252
CNSTF4 1106247680
ADDRLP4 1284
INDIRF4
MULF4
ASGNF4
line 6704
;6704:					angles[1] = 360 - (angle * 180 / M_PI);
ADDRLP4 252+4
CNSTF4 1135869952
CNSTF4 1127481344
ADDRLP4 236
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
SUBF4
ASGNF4
line 6705
;6705:					if (angles[1] > 360)
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
LEF4 $3725
line 6706
;6706:						angles[1] -= 360;
ADDRLP4 252+4
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $3725
line 6707
;6707:					angles[2] = 0;
ADDRLP4 252+8
CNSTF4 0
ASGNF4
line 6708
;6708:					AnglesToAxis( angles, holoRef.axis );
ADDRLP4 252
ARGP4
ADDRLP4 1052+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 6709
;6709:				}
ADDRGP4 $3709
JUMPV
LABELV $3708
line 6711
;6710:				else
;6711:				{
line 6712
;6712:					angle = ((cg.time / 6) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
INDIRI4
CNSTI4 6
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
CNSTF4 1070141403
ADDF4
ASGNF4
line 6713
;6713:					if (angle > M_PI * 2)
ADDRLP4 236
INDIRF4
CNSTF4 1086918619
LEF4 $3732
line 6714
;6714:						angle -= (float)M_PI * 2;
ADDRLP4 236
ADDRLP4 236
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $3732
line 6715
;6715:					dir[0] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1272
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 1272
INDIRF4
MULF4
ASGNF4
line 6716
;6716:					dir[1] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1276
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1276
INDIRF4
MULF4
ASGNF4
line 6717
;6717:					dir[2] = 0;
ADDRLP4 212+8
CNSTF4 0
ASGNF4
line 6718
;6718:					VectorAdd(elevated, dir, holoRef.origin);
ADDRLP4 1052+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1052+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1052+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6720
;6719:			
;6720:					VectorCopy(dir, holoRef.axis[1]);
ADDRLP4 1052+12+12
ADDRLP4 212
INDIRB
ASGNB 12
line 6721
;6721:					VectorNormalize(holoRef.axis[1]);
ADDRLP4 1052+12+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6722
;6722:					VectorSet(holoRef.axis[2], 0, 0, 1);
ADDRLP4 1052+12+24
CNSTF4 0
ASGNF4
ADDRLP4 1052+12+24+4
CNSTF4 0
ASGNF4
ADDRLP4 1052+12+24+8
CNSTF4 1065353216
ASGNF4
line 6723
;6723:					CrossProduct(holoRef.axis[1], holoRef.axis[2], holoRef.axis[0]);
ADDRLP4 1052+12+12
ARGP4
ADDRLP4 1052+12+24
ARGP4
ADDRLP4 1052+12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 6724
;6724:				}
LABELV $3709
LABELV $3688
line 6726
;6725:
;6726:				holoRef.modelScale[0] = 0.5;
ADDRLP4 1052+196
CNSTF4 1056964608
ASGNF4
line 6727
;6727:				holoRef.modelScale[1] = 0.5;
ADDRLP4 1052+196+4
CNSTF4 1056964608
ASGNF4
line 6728
;6728:				holoRef.modelScale[2] = 0.5;
ADDRLP4 1052+196+8
CNSTF4 1056964608
ASGNF4
line 6729
;6729:				ScaleModelAxis(&holoRef);
ADDRLP4 1052
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 6731
;6730:
;6731:				{
line 6736
;6732:					float wv;
;6733:					addspriteArgStruct_t fxSArgs;
;6734:					vec3_t holoCenter;
;6735:
;6736:					holoCenter[0] = holoRef.origin[0] + holoRef.axis[2][0]*18;
ADDRLP4 1348
ADDRLP4 1052+52
INDIRF4
CNSTF4 1099956224
ADDRLP4 1052+12+24
INDIRF4
MULF4
ADDF4
ASGNF4
line 6737
;6737:					holoCenter[1] = holoRef.origin[1] + holoRef.axis[2][1]*18;
ADDRLP4 1348+4
ADDRLP4 1052+52+4
INDIRF4
CNSTF4 1099956224
ADDRLP4 1052+12+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 6738
;6738:					holoCenter[2] = holoRef.origin[2] + holoRef.axis[2][2]*18;
ADDRLP4 1348+8
ADDRLP4 1052+52+8
INDIRF4
CNSTF4 1099956224
ADDRLP4 1052+12+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 6740
;6739:
;6740:					wv = sin( cg.time * 0.004f ) * 0.08f + 0.1f;
CNSTF4 998445679
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 1360
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 1344
CNSTF4 1034147594
ADDRLP4 1360
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 6742
;6741:
;6742:					VectorCopy(holoCenter, fxSArgs.origin);
ADDRLP4 1272
ADDRLP4 1348
INDIRB
ASGNB 12
line 6743
;6743:					VectorClear(fxSArgs.vel);
ADDRLP4 1364
CNSTF4 0
ASGNF4
ADDRLP4 1272+12+8
ADDRLP4 1364
INDIRF4
ASGNF4
ADDRLP4 1272+12+4
ADDRLP4 1364
INDIRF4
ASGNF4
ADDRLP4 1272+12
ADDRLP4 1364
INDIRF4
ASGNF4
line 6744
;6744:					VectorClear(fxSArgs.accel);
ADDRLP4 1368
CNSTF4 0
ASGNF4
ADDRLP4 1272+24+8
ADDRLP4 1368
INDIRF4
ASGNF4
ADDRLP4 1272+24+4
ADDRLP4 1368
INDIRF4
ASGNF4
ADDRLP4 1272+24
ADDRLP4 1368
INDIRF4
ASGNF4
line 6745
;6745:					fxSArgs.scale = wv*60;
ADDRLP4 1272+36
CNSTF4 1114636288
ADDRLP4 1344
INDIRF4
MULF4
ASGNF4
line 6746
;6746:					fxSArgs.dscale = wv*60;
ADDRLP4 1272+40
CNSTF4 1114636288
ADDRLP4 1344
INDIRF4
MULF4
ASGNF4
line 6747
;6747:					fxSArgs.sAlpha = wv*12;
ADDRLP4 1272+44
CNSTF4 1094713344
ADDRLP4 1344
INDIRF4
MULF4
ASGNF4
line 6748
;6748:					fxSArgs.eAlpha = wv*12;
ADDRLP4 1272+48
CNSTF4 1094713344
ADDRLP4 1344
INDIRF4
MULF4
ASGNF4
line 6749
;6749:					fxSArgs.rotation = 0.0f;
ADDRLP4 1272+52
CNSTF4 0
ASGNF4
line 6750
;6750:					fxSArgs.bounce = 0.0f;
ADDRLP4 1272+56
CNSTF4 0
ASGNF4
line 6751
;6751:					fxSArgs.life = 1.0f;
ADDRLP4 1272+60
CNSTI4 1
ASGNI4
line 6753
;6752:
;6753:					fxSArgs.flags = 0x08000000|0x00000001;
ADDRLP4 1272+68
CNSTI4 134217729
ASGNI4
line 6755
;6754:
;6755:					if (forcePowerDarkLight[i] == FORCE_DARKSIDE)
ADDRLP4 1372
CNSTI4 2
ASGNI4
ADDRLP4 1264
INDIRI4
ADDRLP4 1372
INDIRI4
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
ADDRLP4 1372
INDIRI4
NEI4 $3801
line 6756
;6756:					{ //dark
line 6757
;6757:						fxSArgs.sAlpha *= 3;
ADDRLP4 1272+44
CNSTF4 1077936128
ADDRLP4 1272+44
INDIRF4
MULF4
ASGNF4
line 6758
;6758:						fxSArgs.eAlpha *= 3;
ADDRLP4 1272+48
CNSTF4 1077936128
ADDRLP4 1272+48
INDIRF4
MULF4
ASGNF4
line 6759
;6759:						fxSArgs.shader = cgs.media.redSaberGlowShader;
ADDRLP4 1272+64
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 6760
;6760:						trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1272
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6761
;6761:					}
ADDRGP4 $3802
JUMPV
LABELV $3801
line 6762
;6762:					else if (forcePowerDarkLight[i] == FORCE_LIGHTSIDE)
ADDRLP4 1264
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
CNSTI4 1
NEI4 $3808
line 6763
;6763:					{ //light
line 6764
;6764:						fxSArgs.sAlpha *= 1.5;
ADDRLP4 1272+44
CNSTF4 1069547520
ADDRLP4 1272+44
INDIRF4
MULF4
ASGNF4
line 6765
;6765:						fxSArgs.eAlpha *= 1.5;
ADDRLP4 1272+48
CNSTF4 1069547520
ADDRLP4 1272+48
INDIRF4
MULF4
ASGNF4
line 6766
;6766:						fxSArgs.shader = cgs.media.redSaberGlowShader;
ADDRLP4 1272+64
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 6767
;6767:						trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1272
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6768
;6768:						fxSArgs.shader = cgs.media.greenSaberGlowShader;
ADDRLP4 1272+64
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 6769
;6769:						trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1272
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6770
;6770:						fxSArgs.shader = cgs.media.blueSaberGlowShader;
ADDRLP4 1272+64
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 6771
;6771:						trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1272
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6772
;6772:					}
ADDRGP4 $3809
JUMPV
LABELV $3808
line 6774
;6773:					else
;6774:					{ //neutral
line 6775
;6775:						if (i == FP_SABERATTACK ||
ADDRLP4 1264
INDIRI4
CNSTI4 15
EQI4 $3824
ADDRLP4 1264
INDIRI4
CNSTI4 16
EQI4 $3824
ADDRLP4 1264
INDIRI4
CNSTI4 17
NEI4 $3821
LABELV $3824
line 6778
;6776:							i == FP_SABERDEFEND ||
;6777:							i == FP_SABERTHROW)
;6778:						{ //saber power
line 6779
;6779:							fxSArgs.sAlpha *= 1.5;
ADDRLP4 1272+44
CNSTF4 1069547520
ADDRLP4 1272+44
INDIRF4
MULF4
ASGNF4
line 6780
;6780:							fxSArgs.eAlpha *= 1.5;
ADDRLP4 1272+48
CNSTF4 1069547520
ADDRLP4 1272+48
INDIRF4
MULF4
ASGNF4
line 6781
;6781:							fxSArgs.shader = cgs.media.greenSaberGlowShader;
ADDRLP4 1272+64
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 6782
;6782:							trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1272
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6783
;6783:						}
ADDRGP4 $3822
JUMPV
LABELV $3821
line 6785
;6784:						else
;6785:						{
line 6786
;6786:							fxSArgs.sAlpha *= 0.5;
ADDRLP4 1272+44
CNSTF4 1056964608
ADDRLP4 1272+44
INDIRF4
MULF4
ASGNF4
line 6787
;6787:							fxSArgs.eAlpha *= 0.5;
ADDRLP4 1272+48
CNSTF4 1056964608
ADDRLP4 1272+48
INDIRF4
MULF4
ASGNF4
line 6788
;6788:							fxSArgs.shader = cgs.media.greenSaberGlowShader;
ADDRLP4 1272+64
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 6789
;6789:							trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1272
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6790
;6790:							fxSArgs.shader = cgs.media.blueSaberGlowShader;
ADDRLP4 1272+64
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 6791
;6791:							trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1272
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6792
;6792:						}
LABELV $3822
line 6793
;6793:					}
LABELV $3809
LABELV $3802
line 6794
;6794:				}
line 6796
;6795:
;6796:				holoRef.hModel = trap_R_RegisterModel(forceHolocronModels[i]);
ADDRLP4 1264
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceHolocronModels
ADDP4
INDIRP4
ARGP4
ADDRLP4 1272
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 1052+8
ADDRLP4 1272
INDIRI4
ASGNI4
line 6797
;6797:				trap_R_AddRefEntityToScene( &holoRef );
ADDRLP4 1052
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6799
;6798:
;6799:				renderedHolos++;
ADDRLP4 1268
ADDRLP4 1268
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6800
;6800:			}
LABELV $3681
line 6801
;6801:			i++;
ADDRLP4 1264
ADDRLP4 1264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6802
;6802:		}
LABELV $3679
line 6665
ADDRLP4 1264
INDIRI4
CNSTI4 18
GEI4 $3839
ADDRLP4 1268
INDIRI4
CNSTI4 3
LTI4 $3678
LABELV $3839
line 6803
;6803:	}
LABELV $3672
line 6805
;6804:
;6805:	if ((cent->currentState.powerups & (1 << PW_YSALAMIRI)) ||
ADDRLP4 1052
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 32768
BANDI4
ADDRLP4 1056
INDIRI4
NEI4 $3844
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $3840
ADDRLP4 1052
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 1056
INDIRI4
NEI4 $3844
ADDRLP4 1052
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 1056
INDIRI4
EQI4 $3840
LABELV $3844
line 6807
;6806:		(cgs.gametype == GT_CTY && ((cent->currentState.powerups & (1 << PW_REDFLAG)) || (cent->currentState.powerups & (1 << PW_BLUEFLAG)))) )
;6807:	{
line 6808
;6808:		if (cgs.gametype == GT_CTY && (cent->currentState.powerups & (1 << PW_REDFLAG)))
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $3845
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $3845
line 6809
;6809:		{
line 6810
;6810:			CG_DrawPlayerSphere(cent, cent->lerpOrigin, 1.4, cgs.media.ysaliredShader );
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+572
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6811
;6811:		}
ADDRGP4 $3846
JUMPV
LABELV $3845
line 6812
;6812:		else if (cgs.gametype == GT_CTY && (cent->currentState.powerups & (1 << PW_BLUEFLAG)))
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $3850
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $3850
line 6813
;6813:		{
line 6814
;6814:			CG_DrawPlayerSphere(cent, cent->lerpOrigin, 1.4, cgs.media.ysaliblueShader );
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+576
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6815
;6815:		}
ADDRGP4 $3851
JUMPV
LABELV $3850
line 6817
;6816:		else
;6817:		{
line 6818
;6818:			CG_DrawPlayerSphere(cent, cent->lerpOrigin, 1.4, cgs.media.ysalimariShader );
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+580
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6819
;6819:		}
LABELV $3851
LABELV $3846
line 6820
;6820:	}
LABELV $3840
line 6822
;6821:	
;6822:	if (cent->currentState.powerups & (1 << PW_FORCE_BOON))
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $3857
line 6823
;6823:	{
line 6824
;6824:		CG_DrawPlayerSphere(cent, cent->lerpOrigin, 2.0, cgs.media.boonShader );
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 cgs+70296+584
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6825
;6825:	}
LABELV $3857
line 6827
;6826:
;6827:	if (cent->currentState.powerups & (1 << PW_FORCE_ENLIGHTENED_DARK))
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $3861
line 6828
;6828:	{
line 6829
;6829:		CG_DrawPlayerSphere(cent, cent->lerpOrigin, 2.0, cgs.media.endarkenmentShader );
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 cgs+70296+588
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6830
;6830:	}
ADDRGP4 $3862
JUMPV
LABELV $3861
line 6831
;6831:	else if (cent->currentState.powerups & (1 << PW_FORCE_ENLIGHTENED_LIGHT))
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $3865
line 6832
;6832:	{
line 6833
;6833:		CG_DrawPlayerSphere(cent, cent->lerpOrigin, 2.0, cgs.media.enlightenmentShader );
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 cgs+70296+592
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6834
;6834:	}
LABELV $3865
LABELV $3862
line 6836
;6835:
;6836:	if (cent->currentState.eFlags & EF_INVULNERABLE)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $3869
line 6837
;6837:	{
line 6838
;6838:		CG_DrawPlayerSphere(cent, cent->lerpOrigin, 1.4, cgs.media.invulnerabilityShader );
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+596
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6839
;6839:	}
LABELV $3869
LABELV $3538
line 6841
;6840:stillDoSaber:
;6841:	if (cent->currentState.weapon == WP_SABER && !cent->currentState.shouldtarget)
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $3873
ADDRLP4 1060
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3873
line 6842
;6842:	{
line 6843
;6843:		if (!cent->currentState.saberInFlight && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $3875
ADDRLP4 1064
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1068
INDIRI4
NEI4 $3875
line 6844
;6844:		{
line 6845
;6845:			if (cg.snap->ps.clientNum == cent->currentState.number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $3877
line 6846
;6846:			{
line 6847
;6847:				trap_S_AddLoopingSound( cent->currentState.number, cg.refdef.vieworg, vec3_origin, 
ADDRGP4 $3882
ARGP4
ADDRLP4 1072
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 cg+3616+24
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 6849
;6848:					trap_S_RegisterSound( "sound/weapons/saber/saberhum1.wav" ) );
;6849:			}
ADDRGP4 $3878
JUMPV
LABELV $3877
line 6851
;6850:			else
;6851:			{
line 6852
;6852:				trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRGP4 $3882
ARGP4
ADDRLP4 1072
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 1076
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1076
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1076
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 6854
;6853:					trap_S_RegisterSound( "sound/weapons/saber/saberhum1.wav" ) );
;6854:			}
LABELV $3878
line 6855
;6855:		}
LABELV $3875
line 6857
;6856:
;6857:		if (iwantout && !cent->currentState.saberInFlight)
ADDRLP4 1072
CNSTI4 0
ASGNI4
ADDRLP4 768
INDIRI4
ADDRLP4 1072
INDIRI4
EQI4 $3883
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1072
INDIRI4
NEI4 $3883
line 6858
;6858:		{
line 6859
;6859:			if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3889
line 6860
;6860:			{
line 6861
;6861:				if (cent->ghoul2 && cent->currentState.saberInFlight && g2HasWeapon)
ADDRLP4 1076
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1076
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3889
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 1076
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1080
INDIRI4
EQI4 $3889
ADDRLP4 536
INDIRI4
ADDRLP4 1080
INDIRI4
EQI4 $3889
line 6862
;6862:				{ //special case, kill the saber on a freshly dead player if another source says to.
line 6863
;6863:					trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
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
line 6864
;6864:					g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 6865
;6865:				}
line 6866
;6866:			}
line 6868
;6867:			//return;
;6868:			goto endOfCall;
ADDRGP4 $3889
JUMPV
LABELV $3883
line 6871
;6869:		}
;6870:
;6871:		if (cent->currentState.saberInFlight && cent->currentState.saberEntityNum)
ADDRLP4 1076
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 1076
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1080
INDIRI4
EQI4 $3890
ADDRLP4 1076
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ADDRLP4 1080
INDIRI4
EQI4 $3890
line 6872
;6872:		{
line 6875
;6873:			centity_t *saberEnt;
;6874:
;6875:			saberEnt = &cg_entities[cent->currentState.saberEntityNum];
ADDRLP4 1084
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 6877
;6876:
;6877:			if (/*!cent->bolt4 &&*/ g2HasWeapon)
ADDRLP4 536
INDIRI4
CNSTI4 0
EQI4 $3892
line 6878
;6878:			{ //saber is in flight, do not have it as a standard weapon model
line 6879
;6879:				trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
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
line 6880
;6880:				g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 6884
;6881:
;6882:				//cent->bolt4 = 1;
;6883:
;6884:				saberEnt->currentState.pos.trTime = cg.time;
ADDRLP4 1084
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6885
;6885:				saberEnt->currentState.apos.trTime = cg.time;
ADDRLP4 1084
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6887
;6886:
;6887:				VectorCopy(saberEnt->currentState.pos.trBase, saberEnt->lerpOrigin);
ADDRLP4 1084
INDIRP4
CNSTI4 928
ADDP4
ADDRLP4 1084
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 6888
;6888:				VectorCopy(saberEnt->currentState.apos.trBase, saberEnt->lerpAngles);
ADDRLP4 1084
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 1084
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 6890
;6889:
;6890:				cent->bolt3 = saberEnt->currentState.apos.trBase[0];
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
ADDRLP4 1084
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 6891
;6891:				cent->bolt2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 6893
;6892:
;6893:				saberEnt->currentState.bolt2 = 123;
ADDRLP4 1084
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 123
ASGNI4
line 6895
;6894:
;6895:				if (saberEnt->ghoul2)
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3896
line 6896
;6896:				{
line 6898
;6897:					// now set up the gun bolt on it
;6898:					trap_G2API_AddBolt(saberEnt->ghoul2, 0, "*flash");
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $3898
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 6899
;6899:				}
ADDRGP4 $3897
JUMPV
LABELV $3896
line 6901
;6900:				else
;6901:				{
line 6902
;6902:					trap_G2API_InitGhoul2Model(&saberEnt->ghoul2, "models/weapons2/saber/saber_w.glm", 0, 0, 0, 0, 0);
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 $3899
ARGP4
ADDRLP4 1096
CNSTI4 0
ASGNI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 6904
;6903:
;6904:					if (saberEnt->ghoul2)
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3900
line 6905
;6905:					{
line 6906
;6906:						trap_G2API_AddBolt(saberEnt->ghoul2, 0, "*flash");
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $3898
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 6909
;6907:						//cent->bolt4 = 2;
;6908:						
;6909:						VectorCopy(saberEnt->currentState.pos.trBase, saberEnt->lerpOrigin);
ADDRLP4 1084
INDIRP4
CNSTI4 928
ADDP4
ADDRLP4 1084
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 6910
;6910:						VectorCopy(saberEnt->currentState.apos.trBase, saberEnt->lerpAngles);
ADDRLP4 1084
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 1084
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 6911
;6911:						saberEnt->currentState.pos.trTime = cg.time;
ADDRLP4 1084
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6912
;6912:						saberEnt->currentState.apos.trTime = cg.time;
ADDRLP4 1084
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6913
;6913:					}
LABELV $3900
line 6914
;6914:				}
LABELV $3897
line 6915
;6915:			}
LABELV $3892
line 6925
;6916:			/*else if (cent->bolt4 != 2)
;6917:			{
;6918:				if (saberEnt->ghoul2)
;6919:				{
;6920:					trap_G2API_AddBolt(saberEnt->ghoul2, 0, "*flash");
;6921:					cent->bolt4 = 2;
;6922:				}
;6923:			}*/
;6924:
;6925:			if (saberEnt && saberEnt->ghoul2 /*&& cent->bolt4 == 2*/)
ADDRLP4 1092
CNSTU4 0
ASGNU4
ADDRLP4 1084
INDIRP4
CVPU4 4
ADDRLP4 1092
INDIRU4
EQU4 $3874
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1092
INDIRU4
EQU4 $3874
line 6926
;6926:			{
line 6929
;6927:				vec3_t bladeAngles;
;6928:
;6929:				if (!cent->bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3906
line 6930
;6930:				{
line 6931
;6931:					cent->bolt2 = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6932
;6932:				}
LABELV $3906
line 6934
;6933:
;6934:				if (cent->bolt3 != 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
EQI4 $3909
line 6935
;6935:				{
line 6936
;6936:					if (cent->bolt3 < 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
GEI4 $3911
line 6937
;6937:					{
line 6938
;6938:						cent->bolt3 += (cg.time - cent->bolt2)*0.5;
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
ADDRLP4 1108
INDIRP4
CNSTI4 992
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1108
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 6940
;6939:
;6940:						if (cent->bolt3 > 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
LEI4 $3912
line 6941
;6941:						{
line 6942
;6942:							cent->bolt3 = 90;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 90
ASGNI4
line 6943
;6943:						}
line 6944
;6944:					}
ADDRGP4 $3912
JUMPV
LABELV $3911
line 6945
;6945:					else if (cent->bolt3 > 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
LEI4 $3916
line 6946
;6946:					{
line 6947
;6947:						cent->bolt3 -= (cg.time - cent->bolt2)*0.5;
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
ADDRLP4 1108
INDIRP4
CNSTI4 992
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1108
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 6949
;6948:
;6949:						if (cent->bolt3 < 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
GEI4 $3919
line 6950
;6950:						{
line 6951
;6951:							cent->bolt3 = 90;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 90
ASGNI4
line 6952
;6952:						}
LABELV $3919
line 6953
;6953:					}
LABELV $3916
LABELV $3912
line 6954
;6954:				}
LABELV $3909
line 6956
;6955:
;6956:				cent->bolt2 = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6958
;6957:
;6958:				saberEnt->currentState.apos.trBase[0] = cent->bolt3;
ADDRLP4 1084
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 6959
;6959:				saberEnt->lerpAngles[0] = cent->bolt3;
ADDRLP4 1084
INDIRP4
CNSTI4 940
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 6961
;6960:
;6961:				if (!saberEnt->currentState.saberInFlight && saberEnt->currentState.bolt2 != 123)
ADDRLP4 1084
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3922
ADDRLP4 1084
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 123
EQI4 $3922
line 6962
;6962:				{ //owner is pulling is back
line 6965
;6963:					vec3_t owndir;
;6964:
;6965:					VectorSubtract(saberEnt->lerpOrigin, cent->lerpOrigin, owndir);
ADDRLP4 1128
CNSTI4 928
ASGNI4
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
ADDRLP4 1084
INDIRP4
ADDRLP4 1128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
ADDRLP4 1128
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1136
CNSTI4 932
ASGNI4
ADDRLP4 1112+4
ADDRLP4 1084
INDIRP4
ADDRLP4 1136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
ADDRLP4 1136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1140
CNSTI4 936
ASGNI4
ADDRLP4 1112+8
ADDRLP4 1084
INDIRP4
ADDRLP4 1140
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 1140
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6966
;6966:					VectorNormalize(owndir);
ADDRLP4 1112
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6968
;6967:
;6968:					vectoangles(owndir, owndir);
ADDRLP4 1112
ARGP4
ADDRLP4 1112
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6970
;6969:
;6970:					owndir[0] += 90;
ADDRLP4 1112
ADDRLP4 1112
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 6972
;6971:
;6972:					VectorCopy(owndir, saberEnt->currentState.apos.trBase);
ADDRLP4 1084
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1112
INDIRB
ASGNB 12
line 6973
;6973:					VectorCopy(owndir, saberEnt->lerpAngles);
ADDRLP4 1084
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 1112
INDIRB
ASGNB 12
line 6974
;6974:					VectorClear(saberEnt->currentState.apos.trDelta);
ADDRLP4 1148
CNSTF4 0
ASGNF4
ADDRLP4 1084
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 1148
INDIRF4
ASGNF4
ADDRLP4 1084
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 1148
INDIRF4
ASGNF4
ADDRLP4 1084
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 1148
INDIRF4
ASGNF4
line 6975
;6975:				}
LABELV $3922
line 6980
;6976:
;6977:				//We don't actually want to rely entirely on server updates to render the position of the saber, because we actually know generally where
;6978:				//it's going to be before the first position update even gets here, and it needs to start getting rendered the instant the saber model is
;6979:				//removed from the player hand. So we'll just render it manually and let normal rendering for the entity be ignored.
;6980:				if (!saberEnt->currentState.saberInFlight && saberEnt->currentState.bolt2 != 123)
ADDRLP4 1084
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3926
ADDRLP4 1084
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 123
EQI4 $3926
line 6981
;6981:				{ //tell it that we're a saber and to render the glow around our handle because we're being pulled back
line 6982
;6982:					saberEnt->bolt3 = 999;
ADDRLP4 1084
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 999
ASGNI4
line 6983
;6983:				}
LABELV $3926
line 6985
;6984:
;6985:				saberEnt->currentState.modelGhoul2 = 1;
ADDRLP4 1084
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 6986
;6986:				CG_ManualEntityRender(saberEnt);
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 CG_ManualEntityRender
CALLV
pop
line 6987
;6987:				saberEnt->bolt3 = 0;
ADDRLP4 1084
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 6988
;6988:				saberEnt->currentState.modelGhoul2 = 127;
ADDRLP4 1084
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 127
ASGNI4
line 6990
;6989:
;6990:				VectorCopy(saberEnt->lerpAngles, bladeAngles);
ADDRLP4 1096
ADDRLP4 1084
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 6991
;6991:				bladeAngles[ROLL] = 0;
ADDRLP4 1096+8
CNSTF4 0
ASGNF4
line 6992
;6992:				CG_AddSaberBlade(cent, saberEnt, NULL, 0, 0, saberEnt->lerpOrigin, bladeAngles, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1120
CNSTI4 0
ASGNI4
ADDRLP4 1120
INDIRI4
ARGI4
ADDRLP4 1120
INDIRI4
ARGI4
ADDRLP4 1084
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 1096
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_AddSaberBlade
CALLV
pop
line 6995
;6993:
;6994:				//Make the player's hand glow while guiding the saber
;6995:				{
line 7000
;6996:					vec3_t tAng;
;6997:					float wv;
;6998:					addspriteArgStruct_t fxSArgs;
;6999:
;7000:					VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
ADDRLP4 1212
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1196+4
ADDRLP4 1212
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1196+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 7002
;7001:
;7002:					trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_rhand, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1216
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+512
ADDP4
INDIRI4
ARGI4
ADDRLP4 780
ARGP4
ADDRLP4 1196
ARGP4
ADDRLP4 1216
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1216
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 7004
;7003:
;7004:					efOrg[0] = boltMatrix.matrix[0][3];
ADDRLP4 240
ADDRLP4 780+12
INDIRF4
ASGNF4
line 7005
;7005:					efOrg[1] = boltMatrix.matrix[1][3];
ADDRLP4 240+4
ADDRLP4 780+16+12
INDIRF4
ASGNF4
line 7006
;7006:					efOrg[2] = boltMatrix.matrix[2][3];
ADDRLP4 240+8
ADDRLP4 780+32+12
INDIRF4
ASGNF4
line 7008
;7007:
;7008:					wv = sin( cg.time * 0.003f ) * 0.08f + 0.1f;
CNSTF4 994352038
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 1220
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 1208
CNSTF4 1034147594
ADDRLP4 1220
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 7011
;7009:
;7010:					//trap_FX_AddSprite( NULL, efOrg, NULL, NULL, 8.0f, 8.0f, wv, wv, 0.0f, 0.0f, 1.0f, cgs.media.yellowSaberGlowShader, 0x08000000 );
;7011:					VectorCopy(efOrg, fxSArgs.origin);
ADDRLP4 1124
ADDRLP4 240
INDIRB
ASGNB 12
line 7012
;7012:					VectorClear(fxSArgs.vel);
ADDRLP4 1224
CNSTF4 0
ASGNF4
ADDRLP4 1124+12+8
ADDRLP4 1224
INDIRF4
ASGNF4
ADDRLP4 1124+12+4
ADDRLP4 1224
INDIRF4
ASGNF4
ADDRLP4 1124+12
ADDRLP4 1224
INDIRF4
ASGNF4
line 7013
;7013:					VectorClear(fxSArgs.accel);
ADDRLP4 1228
CNSTF4 0
ASGNF4
ADDRLP4 1124+24+8
ADDRLP4 1228
INDIRF4
ASGNF4
ADDRLP4 1124+24+4
ADDRLP4 1228
INDIRF4
ASGNF4
ADDRLP4 1124+24
ADDRLP4 1228
INDIRF4
ASGNF4
line 7014
;7014:					fxSArgs.scale = 8.0f;
ADDRLP4 1124+36
CNSTF4 1090519040
ASGNF4
line 7015
;7015:					fxSArgs.dscale = 8.0f;
ADDRLP4 1124+40
CNSTF4 1090519040
ASGNF4
line 7016
;7016:					fxSArgs.sAlpha = wv;
ADDRLP4 1124+44
ADDRLP4 1208
INDIRF4
ASGNF4
line 7017
;7017:					fxSArgs.eAlpha = wv;
ADDRLP4 1124+48
ADDRLP4 1208
INDIRF4
ASGNF4
line 7018
;7018:					fxSArgs.rotation = 0.0f;
ADDRLP4 1124+52
CNSTF4 0
ASGNF4
line 7019
;7019:					fxSArgs.bounce = 0.0f;
ADDRLP4 1124+56
CNSTF4 0
ASGNF4
line 7020
;7020:					fxSArgs.life = 1.0f;
ADDRLP4 1124+60
CNSTI4 1
ASGNI4
line 7021
;7021:					fxSArgs.shader = cgs.media.yellowDroppedSaberShader;
ADDRLP4 1124+64
ADDRGP4 cgs+70296+168
INDIRI4
ASGNI4
line 7022
;7022:					fxSArgs.flags = 0x08000000;
ADDRLP4 1124+68
CNSTI4 134217728
ASGNI4
line 7023
;7023:					trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1124
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 7024
;7024:				}
line 7025
;7025:			}
line 7026
;7026:		}
ADDRGP4 $3874
JUMPV
LABELV $3890
line 7028
;7027:		else
;7028:		{
line 7031
;7029:			centity_t *saberEnt;
;7030:
;7031:			saberEnt = &cg_entities[cent->currentState.saberEntityNum];
ADDRLP4 1084
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 7033
;7032:
;7033:			if (/*cent->bolt4 && */!g2HasWeapon)
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $3964
line 7034
;7034:			{
line 7035
;7035:				trap_G2API_CopySpecificGhoul2Model(g2WeaponInstances[WP_SABER], 0, cent->ghoul2, 1);
ADDRGP4 g2WeaponInstances+8
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
line 7037
;7036:
;7037:				if (saberEnt && saberEnt->ghoul2)
ADDRLP4 1088
ADDRLP4 1084
INDIRP4
ASGNP4
ADDRLP4 1092
CNSTU4 0
ASGNU4
ADDRLP4 1088
INDIRP4
CVPU4 4
ADDRLP4 1092
INDIRU4
EQU4 $3967
ADDRLP4 1088
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1092
INDIRU4
EQU4 $3967
line 7038
;7038:				{
line 7039
;7039:					trap_G2API_CleanGhoul2Models(&(saberEnt->ghoul2));
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 7040
;7040:				}
LABELV $3967
line 7042
;7041:
;7042:				saberEnt->currentState.modelindex = 0;
ADDRLP4 1084
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 7043
;7043:				saberEnt->ghoul2 = NULL;
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
CNSTP4 0
ASGNP4
line 7044
;7044:				VectorClear(saberEnt->currentState.pos.trBase);
ADDRLP4 1096
ADDRLP4 1084
INDIRP4
ASGNP4
ADDRLP4 1100
CNSTF4 0
ASGNF4
ADDRLP4 1096
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1100
INDIRF4
ASGNF4
ADDRLP4 1096
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 1100
INDIRF4
ASGNF4
ADDRLP4 1096
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1100
INDIRF4
ASGNF4
line 7045
;7045:			}
LABELV $3964
line 7046
;7046:			CG_AddSaberBlade( cent, cent, NULL, 0, 0, legs.origin, rootAngles, qfalse);
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1092
CNSTI4 0
ASGNI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRLP4 0+52
ARGP4
ADDRLP4 840
ARGP4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 CG_AddSaberBlade
CALLV
pop
line 7047
;7047:			cent->bolt3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 7048
;7048:			cent->bolt2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 7051
;7049:
;7050:			//cent->bolt4 = 0;
;7051:		}
line 7052
;7052:	}
ADDRGP4 $3874
JUMPV
LABELV $3873
line 7054
;7053:	else
;7054:	{
line 7055
;7055:		cent->saberLength = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 0
ASGNF4
line 7056
;7056:	}
LABELV $3874
line 7058
;7057:
;7058:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3970
line 7059
;7059:	{
line 7060
;7060:		if (cent->ghoul2 && cent->currentState.saberInFlight && g2HasWeapon)
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3972
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1068
INDIRI4
EQI4 $3972
ADDRLP4 536
INDIRI4
ADDRLP4 1068
INDIRI4
EQI4 $3972
line 7061
;7061:		{ //special case, kill the saber on a freshly dead player if another source says to.
line 7062
;7062:			trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
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
line 7063
;7063:			g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 7064
;7064:		}
LABELV $3972
line 7065
;7065:	}
LABELV $3970
line 7067
;7066:
;7067:	if (iwantout)
ADDRLP4 768
INDIRI4
CNSTI4 0
EQI4 $3974
line 7068
;7068:	{
line 7070
;7069:		//return;
;7070:		goto endOfCall;
ADDRGP4 $3889
JUMPV
LABELV $3974
line 7073
;7071:	}
;7072:
;7073:	if ((cg.snap->ps.fd.forcePowersActive & (1 << FP_SEE)) && cg.snap->ps.clientNum != cent->currentState.number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $3976
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $3976
line 7074
;7074:	{
line 7075
;7075:		legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7076
;7076:		legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 7077
;7077:		legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 7078
;7078:		legs.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 7079
;7079:	}
LABELV $3976
line 7081
;7080:
;7081:	if (cg.snap->ps.duelInProgress /*&& cent->currentState.number != cg.snap->ps.clientNum*/)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3986
line 7082
;7082:	{ //I guess go ahead and glow your own client too in a duel
line 7083
;7083:		if (cent->currentState.number != cg.snap->ps.duelIndex &&
ADDRLP4 1064
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 1064
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
EQI4 $3989
ADDRLP4 1064
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $3989
line 7085
;7084:			cent->currentState.number != cg.snap->ps.clientNum)
;7085:		{ //everyone not involved in the duel is drawn very dark
line 7086
;7086:			legs.shaderRGBA[0] = 50;
ADDRLP4 0+80
CNSTU1 50
ASGNU1
line 7087
;7087:			legs.shaderRGBA[1] = 50;
ADDRLP4 0+80+1
CNSTU1 50
ASGNU1
line 7088
;7088:			legs.shaderRGBA[2] = 50;
ADDRLP4 0+80+2
CNSTU1 50
ASGNU1
line 7089
;7089:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7090
;7090:		}
ADDRGP4 $3987
JUMPV
LABELV $3989
line 7092
;7091:		else
;7092:		{ //adjust the glow by how far away you are from your dueling partner
line 7095
;7093:			centity_t *duelEnt;
;7094:
;7095:			duelEnt = &cg_entities[cg.snap->ps.duelIndex];
ADDRLP4 1068
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 7097
;7096:			
;7097:			if (duelEnt)
ADDRLP4 1068
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3987
line 7098
;7098:			{
line 7100
;7099:				vec3_t vecSub;
;7100:				float subLen = 0;
ADDRLP4 1072
CNSTF4 0
ASGNF4
line 7102
;7101:
;7102:				VectorSubtract(duelEnt->lerpOrigin, cg.snap->ps.origin, vecSub);
ADDRLP4 1088
ADDRLP4 1068
INDIRP4
ASGNP4
ADDRLP4 1076
ADDRLP4 1088
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1076+4
ADDRLP4 1088
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1076+8
ADDRLP4 1068
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
SUBF4
ASGNF4
line 7103
;7103:				subLen = VectorLength(vecSub);
ADDRLP4 1076
ARGP4
ADDRLP4 1092
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1072
ADDRLP4 1092
INDIRF4
ASGNF4
line 7105
;7104:
;7105:				if (subLen < 1)
ADDRLP4 1072
INDIRF4
CNSTF4 1065353216
GEF4 $4007
line 7106
;7106:				{
line 7107
;7107:					subLen = 1;
ADDRLP4 1072
CNSTF4 1065353216
ASGNF4
line 7108
;7108:				}
LABELV $4007
line 7110
;7109:
;7110:				if (subLen > 1020)
ADDRLP4 1072
INDIRF4
CNSTF4 1149173760
LEF4 $4009
line 7111
;7111:				{
line 7112
;7112:					subLen = 1020;
ADDRLP4 1072
CNSTF4 1149173760
ASGNF4
line 7113
;7113:				}
LABELV $4009
line 7115
;7114:
;7115:				legs.shaderRGBA[0] = 255 - subLen/4;
ADDRLP4 1100
CNSTF4 1132396544
ADDRLP4 1072
INDIRF4
CNSTF4 1082130432
DIVF4
SUBF4
ASGNF4
ADDRLP4 1104
CNSTF4 1325400064
ASGNF4
ADDRLP4 1100
INDIRF4
ADDRLP4 1104
INDIRF4
LTF4 $4013
ADDRLP4 1096
ADDRLP4 1100
INDIRF4
ADDRLP4 1104
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4014
JUMPV
LABELV $4013
ADDRLP4 1096
ADDRLP4 1100
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4014
ADDRLP4 0+80
ADDRLP4 1096
INDIRU4
CVUU1 4
ASGNU1
line 7116
;7116:				legs.shaderRGBA[1] = 255 - subLen/4;
ADDRLP4 1112
CNSTF4 1132396544
ADDRLP4 1072
INDIRF4
CNSTF4 1082130432
DIVF4
SUBF4
ASGNF4
ADDRLP4 1116
CNSTF4 1325400064
ASGNF4
ADDRLP4 1112
INDIRF4
ADDRLP4 1116
INDIRF4
LTF4 $4018
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
ADDRGP4 $4019
JUMPV
LABELV $4018
ADDRLP4 1108
ADDRLP4 1112
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4019
ADDRLP4 0+80+1
ADDRLP4 1108
INDIRU4
CVUU1 4
ASGNU1
line 7117
;7117:				legs.shaderRGBA[2] = 255 - subLen/4;
ADDRLP4 1124
CNSTF4 1132396544
ADDRLP4 1072
INDIRF4
CNSTF4 1082130432
DIVF4
SUBF4
ASGNF4
ADDRLP4 1128
CNSTF4 1325400064
ASGNF4
ADDRLP4 1124
INDIRF4
ADDRLP4 1128
INDIRF4
LTF4 $4023
ADDRLP4 1120
ADDRLP4 1124
INDIRF4
ADDRLP4 1128
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4024
JUMPV
LABELV $4023
ADDRLP4 1120
ADDRLP4 1124
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4024
ADDRLP4 0+80+2
ADDRLP4 1120
INDIRU4
CVUU1 4
ASGNU1
line 7119
;7118:
;7119:				if (legs.shaderRGBA[2] < 1) legs.shaderRGBA[2] = 1;
ADDRLP4 0+80+2
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $4025
ADDRLP4 0+80+2
CNSTU1 1
ASGNU1
LABELV $4025
line 7121
;7120:
;7121:				legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7122
;7122:				legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7123
;7123:				legs.customShader = cgs.media.forceShell;
ADDRLP4 0+76
ADDRGP4 cgs+70296+496
INDIRI4
ASGNI4
line 7125
;7124:		
;7125:				trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7127
;7126:
;7127:				legs.customShader = 0;
ADDRLP4 0+76
CNSTI4 0
ASGNI4
line 7129
;7128:
;7129:				legs.shaderRGBA[0] = 255 - subLen/8;
ADDRLP4 1136
CNSTF4 1132396544
ADDRLP4 1072
INDIRF4
CNSTF4 1090519040
DIVF4
SUBF4
ASGNF4
ADDRLP4 1140
CNSTF4 1325400064
ASGNF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1140
INDIRF4
LTF4 $4039
ADDRLP4 1132
ADDRLP4 1136
INDIRF4
ADDRLP4 1140
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4040
JUMPV
LABELV $4039
ADDRLP4 1132
ADDRLP4 1136
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4040
ADDRLP4 0+80
ADDRLP4 1132
INDIRU4
CVUU1 4
ASGNU1
line 7130
;7130:				legs.shaderRGBA[1] = 255 - subLen/8;
ADDRLP4 1148
CNSTF4 1132396544
ADDRLP4 1072
INDIRF4
CNSTF4 1090519040
DIVF4
SUBF4
ASGNF4
ADDRLP4 1152
CNSTF4 1325400064
ASGNF4
ADDRLP4 1148
INDIRF4
ADDRLP4 1152
INDIRF4
LTF4 $4044
ADDRLP4 1144
ADDRLP4 1148
INDIRF4
ADDRLP4 1152
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4045
JUMPV
LABELV $4044
ADDRLP4 1144
ADDRLP4 1148
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4045
ADDRLP4 0+80+1
ADDRLP4 1144
INDIRU4
CVUU1 4
ASGNU1
line 7131
;7131:				legs.shaderRGBA[2] = 255 - subLen/8;
ADDRLP4 1160
CNSTF4 1132396544
ADDRLP4 1072
INDIRF4
CNSTF4 1090519040
DIVF4
SUBF4
ASGNF4
ADDRLP4 1164
CNSTF4 1325400064
ASGNF4
ADDRLP4 1160
INDIRF4
ADDRLP4 1164
INDIRF4
LTF4 $4049
ADDRLP4 1156
ADDRLP4 1160
INDIRF4
ADDRLP4 1164
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4050
JUMPV
LABELV $4049
ADDRLP4 1156
ADDRLP4 1160
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4050
ADDRLP4 0+80+2
ADDRLP4 1156
INDIRU4
CVUU1 4
ASGNU1
line 7133
;7132:
;7133:				if (legs.shaderRGBA[2] < 1)
ADDRLP4 0+80+2
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $4051
line 7134
;7134:				{
line 7135
;7135:					legs.shaderRGBA[2] = 1;
ADDRLP4 0+80+2
CNSTU1 1
ASGNU1
line 7136
;7136:				}
LABELV $4051
line 7137
;7137:				if (legs.shaderRGBA[2] > 255)
ADDRLP4 0+80+2
INDIRU1
CVUI4 1
CNSTI4 255
LEI4 $4057
line 7138
;7138:				{
line 7139
;7139:					legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7140
;7140:				}
LABELV $4057
line 7142
;7141:
;7142:				if (subLen <= 1024)
ADDRLP4 1072
INDIRF4
CNSTF4 1149239296
GTF4 $3987
line 7143
;7143:				{
line 7144
;7144:					legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7145
;7145:				}
line 7146
;7146:			}
line 7147
;7147:		}
line 7148
;7148:	}
ADDRGP4 $3987
JUMPV
LABELV $3986
line 7150
;7149:	else
;7150:	{
line 7151
;7151:		if (cent->currentState.bolt1 && !(cent->currentState.eFlags & EF_DEAD) && cent->currentState.number != cg.snap->ps.clientNum && (!cg.snap->ps.duelInProgress || cg.snap->ps.duelIndex != cent->currentState.number))
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 1068
INDIRI4
EQI4 $4066
ADDRLP4 1064
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1068
INDIRI4
NEI4 $4066
ADDRLP4 1072
ADDRLP4 1064
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 1072
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $4066
ADDRGP4 cg+36
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 1068
INDIRI4
EQI4 $4071
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 1072
INDIRI4
EQI4 $4066
LABELV $4071
line 7152
;7152:		{
line 7153
;7153:			legs.shaderRGBA[0] = 50;
ADDRLP4 0+80
CNSTU1 50
ASGNU1
line 7154
;7154:			legs.shaderRGBA[1] = 50;
ADDRLP4 0+80+1
CNSTU1 50
ASGNU1
line 7155
;7155:			legs.shaderRGBA[2] = 50;
ADDRLP4 0+80+2
CNSTU1 50
ASGNU1
line 7156
;7156:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7157
;7157:		}
LABELV $4066
line 7158
;7158:	}
LABELV $3987
LABELV $3411
line 7160
;7159:doEssentialThree:
;7160:	if (cent->currentState.eFlags & EF_DISINTEGRATION)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $4078
line 7161
;7161:	{
line 7165
;7162:		vec3_t tempAng, hitLoc;
;7163:		float tempLength;
;7164:
;7165:		if (!cent->dustTrailTime)
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
NEI4 $4080
line 7166
;7166:		{
line 7167
;7167:			cent->dustTrailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 7168
;7168:			cent->miscTime = legs.frame;
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 0+104
INDIRI4
ASGNI4
line 7169
;7169:		}
LABELV $4080
line 7171
;7170:
;7171:		if ((cg.time - cent->dustTrailTime) > 1500)
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
SUBI4
CNSTI4 1500
LEI4 $4084
line 7172
;7172:		{ //avoid rendering the entity after disintegration has finished anyway
line 7173
;7173:			goto endOfCall;
ADDRGP4 $3889
JUMPV
LABELV $4084
line 7176
;7174:		}
;7175:
;7176:		trap_G2API_SetBoneAnim(legs.ghoul2, 0, "model_root", cent->miscTime, cent->miscTime, BONE_ANIM_OVERRIDE_FREEZE, 1.0f, cg.time, cent->miscTime, -1);
ADDRLP4 0+208
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
CNSTI4 72
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1092
INDIRI4
CVIF4 4
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 7177
;7177:		trap_G2API_SetBoneAnim(legs.ghoul2, 0, "lower_lumbar", cent->miscTime, cent->miscTime, BONE_ANIM_OVERRIDE_FREEZE, 1.0f, cg.time, cent->miscTime, -1);
ADDRLP4 0+208
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
CNSTI4 72
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
CVIF4 4
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 7178
;7178:		trap_G2API_SetBoneAnim(legs.ghoul2, 0, "Motion", cent->miscTime, cent->miscTime, BONE_ANIM_OVERRIDE_FREEZE, 1.0f, cg.time, cent->miscTime, -1);
ADDRLP4 0+208
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
ARGI4
CNSTI4 72
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
CVIF4 4
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 7180
;7179:
;7180:		VectorCopy(cent->currentState.origin2, hitLoc);
ADDRLP4 1064
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 7182
;7181:
;7182:		VectorSubtract( hitLoc, legs.origin, legs.oldorigin );
ADDRLP4 0+64
ADDRLP4 1064
INDIRF4
ADDRLP4 0+52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+64+4
ADDRLP4 1064+4
INDIRF4
ADDRLP4 0+52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+64+8
ADDRLP4 1064+8
INDIRF4
ADDRLP4 0+52+8
INDIRF4
SUBF4
ASGNF4
line 7184
;7183:		
;7184:		tempLength = VectorNormalize( legs.oldorigin );
ADDRLP4 0+64
ARGP4
ADDRLP4 1104
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 1076
ADDRLP4 1104
INDIRF4
ASGNF4
line 7185
;7185:		vectoangles( legs.oldorigin, tempAng );
ADDRLP4 0+64
ARGP4
ADDRLP4 1080
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 7186
;7186:		tempAng[YAW] -= cent->lerpAngles[YAW];
ADDRLP4 1080+4
ADDRLP4 1080+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 7187
;7187:		AngleVectors( tempAng, legs.oldorigin, NULL, NULL );
ADDRLP4 1080
ARGP4
ADDRLP4 0+64
ARGP4
ADDRLP4 1108
CNSTP4 0
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 7188
;7188:		VectorScale( legs.oldorigin, tempLength, legs.oldorigin );
ADDRLP4 0+64
ADDRLP4 0+64
INDIRF4
ADDRLP4 1076
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+64+4
ADDRLP4 0+64+4
INDIRF4
ADDRLP4 1076
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+64+8
ADDRLP4 0+64+8
INDIRF4
ADDRLP4 1076
INDIRF4
MULF4
ASGNF4
line 7189
;7189:		legs.endTime = cent->dustTrailTime;
ADDRLP4 0+176
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 7198
;7190:
;7191:		//FIXME: Sorting is all wrong here, it can't decide if it should render this part or the outer body first
;7192:		/*
;7193:		legs.renderfx |= RF_DISINTEGRATE2;
;7194:		legs.customShader = cgs.media.disruptorShader;
;7195:		trap_R_AddRefEntityToScene( &legs );
;7196:		*/
;7197:
;7198:		legs.renderfx &= ~(RF_DISINTEGRATE2);
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -262145
BANDI4
ASGNI4
line 7199
;7199:		legs.renderfx |= (RF_DISINTEGRATE1);
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 7201
;7200:
;7201:		legs.customShader = 0;
ADDRLP4 0+76
CNSTI4 0
ASGNI4
line 7202
;7202:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7204
;7203:
;7204:		goto endOfCall;
ADDRGP4 $3889
JUMPV
LABELV $4078
line 7207
;7205:	}
;7206:	else
;7207:	{
line 7208
;7208:		cent->dustTrailTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 7209
;7209:		cent->miscTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 0
ASGNI4
line 7210
;7210:	}
line 7212
;7211:
;7212:	trap_R_AddRefEntityToScene(&legs);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7214
;7213:
;7214:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4123
line 7215
;7215:	{
line 7217
;7216:		//return;
;7217:		goto endOfCall;
ADDRGP4 $3889
JUMPV
LABELV $4123
line 7220
;7218:	}
;7219:
;7220:	cent->frame_minus2 = cent->frame_minus1;
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 1064
INDIRP4
CNSTI4 1040
ADDP4
INDIRB
ASGNB 212
line 7221
;7221:	if (cent->frame_minus1_refreshed)
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4125
line 7222
;7222:	{
line 7223
;7223:		cent->frame_minus2_refreshed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1468
ADDP4
CNSTI4 1
ASGNI4
line 7224
;7224:	}
LABELV $4125
line 7225
;7225:	cent->frame_minus1 = legs;
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
ADDRLP4 0
INDIRB
ASGNB 212
line 7226
;7226:	cent->frame_minus1_refreshed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 1
ASGNI4
line 7228
;7227:
;7228:	if (!cent->frame_hold_refreshed && (cent->currentState.powerups & (1 << PW_SPEEDBURST)))
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
CNSTI4 0
ASGNI4
ADDRLP4 1068
INDIRP4
CNSTI4 1688
ADDP4
INDIRI4
ADDRLP4 1072
INDIRI4
NEI4 $4127
ADDRLP4 1068
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 1072
INDIRI4
EQI4 $4127
line 7229
;7229:	{
line 7230
;7230:		cent->frame_hold_time = cg.time + 254;
ADDRFP4 0
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 254
ADDI4
ASGNI4
line 7231
;7231:	}
LABELV $4127
line 7233
;7232:
;7233:	if (cent->frame_hold_time >= cg.time)
ADDRFP4 0
INDIRP4
CNSTI4 1684
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LTI4 $4130
line 7234
;7234:	{
line 7235
;7235:		if (!cent->frame_hold_refreshed)
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $4133
line 7236
;7236:		{ //We're taking the ghoul2 instance from the original refent and duplicating it onto our refent alias so that we can then freeze the frame and fade it for the effect
line 7237
;7237:			if (cent->frame_hold.ghoul2 && trap_G2_HaveWeGhoul2Models(cent->frame_hold.ghoul2) &&
ADDRLP4 1076
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1076
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4135
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
EQI4 $4135
ADDRLP4 1084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1084
INDIRP4
CNSTI4 1680
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
EQU4 $4135
line 7239
;7238:				cent->frame_hold.ghoul2 != cent->ghoul2)
;7239:			{
line 7240
;7240:				trap_G2API_CleanGhoul2Models(&(cent->frame_hold.ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 7241
;7241:			}
LABELV $4135
line 7242
;7242:			cent->frame_hold = legs;
ADDRFP4 0
INDIRP4
CNSTI4 1472
ADDP4
ADDRLP4 0
INDIRB
ASGNB 212
line 7243
;7243:			cent->frame_hold_refreshed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
CNSTI4 1
ASGNI4
line 7244
;7244:			cent->frame_hold.ghoul2 = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
CNSTP4 0
ASGNP4
line 7246
;7245:	
;7246:			trap_G2API_DuplicateGhoul2Instance(cent->ghoul2, &cent->frame_hold.ghoul2);
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1088
INDIRP4
CNSTI4 1680
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 7250
;7247:
;7248:			//Set the animation to the current frame and freeze on end
;7249:			//trap_G2API_SetBoneAnim(cent->frame_hold.ghoul2, 0, "model_root", cent->frame_hold.frame, cent->frame_hold.frame, BONE_ANIM_OVERRIDE_FREEZE, 1.0f, cg.time, cent->frame_hold.frame, -1);
;7250:			trap_G2API_SetBoneAnim(cent->frame_hold.ghoul2, 0, "model_root", cent->frame_hold.frame, cent->frame_hold.frame, 0, 1.0f, cg.time, cent->frame_hold.frame, -1);
ADDRLP4 1092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 1680
ADDP4
INDIRP4
ARGP4
ADDRLP4 1096
CNSTI4 0
ASGNI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 1100
ADDRLP4 1092
INDIRP4
CNSTI4 1576
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
CVIF4 4
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 7251
;7251:		}
LABELV $4133
line 7253
;7252:
;7253:		cent->frame_hold.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 1076
ADDRFP4 0
INDIRP4
CNSTI4 1476
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
ADDRLP4 1076
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 7254
;7254:		cent->frame_hold.shaderRGBA[3] = (cent->frame_hold_time - cg.time);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 1555
ADDP4
ADDRLP4 1080
INDIRP4
CNSTI4 1684
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 7255
;7255:		if (cent->frame_hold.shaderRGBA[3] > 254)
ADDRFP4 0
INDIRP4
CNSTI4 1555
ADDP4
INDIRU1
CVUI4 1
CNSTI4 254
LEI4 $4139
line 7256
;7256:		{
line 7257
;7257:			cent->frame_hold.shaderRGBA[3] = 254;
ADDRFP4 0
INDIRP4
CNSTI4 1555
ADDP4
CNSTU1 254
ASGNU1
line 7258
;7258:		}
LABELV $4139
line 7259
;7259:		if (cent->frame_hold.shaderRGBA[3] < 1)
ADDRFP4 0
INDIRP4
CNSTI4 1555
ADDP4
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $4141
line 7260
;7260:		{
line 7261
;7261:			cent->frame_hold.shaderRGBA[3] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1555
ADDP4
CNSTU1 1
ASGNU1
line 7262
;7262:		}
LABELV $4141
line 7264
;7263:
;7264:		trap_R_AddRefEntityToScene(&cent->frame_hold);
ADDRFP4 0
INDIRP4
CNSTI4 1472
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7265
;7265:	}
ADDRGP4 $4131
JUMPV
LABELV $4130
line 7267
;7266:	else
;7267:	{
line 7268
;7268:		cent->frame_hold_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
CNSTI4 0
ASGNI4
line 7269
;7269:	}
LABELV $4131
line 7274
;7270:
;7271:	//
;7272:	// add the gun / barrel / flash
;7273:	//
;7274:	if (cent->currentState.weapon != WP_EMPLACED_GUN)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 14
EQI4 $4143
line 7275
;7275:	{
line 7276
;7276:		CG_AddPlayerWeapon( &legs, NULL, cent, ci->team, rootAngles, qtrue );
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 840
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 7277
;7277:	}
LABELV $4143
line 7279
;7278:	// add powerups floating behind the player
;7279:	CG_PlayerPowerups( cent, &legs );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 7281
;7280:
;7281:	if ((cent->currentState.forcePowersActive & (1 << FP_RAGE)) &&
ADDRLP4 1076
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 1076
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 1080
INDIRI4
EQI4 $4145
ADDRGP4 cg+88
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $4149
ADDRLP4 1076
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $4145
LABELV $4149
line 7283
;7282:		(cg.renderingThirdPerson || cent->currentState.number != cg.snap->ps.clientNum))
;7283:	{
line 7285
;7284:		//legs.customShader = cgs.media.rageShader;
;7285:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7286
;7286:		legs.renderfx &= ~RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 7288
;7287:
;7288:		legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7289
;7289:		legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7290
;7290:		legs.shaderRGBA[1] = legs.shaderRGBA[2] = 0;
ADDRLP4 1084
CNSTU1 0
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 1084
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 1084
INDIRU1
ASGNU1
line 7291
;7291:		legs.shaderRGBA[3] = 255;
ADDRLP4 0+80+3
CNSTU1 255
ASGNU1
line 7293
;7292:
;7293:		if ( rand() & 1 )
ADDRLP4 1088
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $4160
line 7294
;7294:		{
line 7295
;7295:			legs.customShader = cgs.media.electricBodyShader;	
ADDRLP4 0+76
ADDRGP4 cgs+70296+396
INDIRI4
ASGNI4
line 7296
;7296:		}
ADDRGP4 $4161
JUMPV
LABELV $4160
line 7298
;7297:		else
;7298:		{
line 7299
;7299:			legs.customShader = cgs.media.electricBody2Shader;
ADDRLP4 0+76
ADDRGP4 cgs+70296+400
INDIRI4
ASGNI4
line 7300
;7300:		}
LABELV $4161
line 7302
;7301:
;7302:		trap_R_AddRefEntityToScene(&legs);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7303
;7303:	}
LABELV $4145
line 7305
;7304:
;7305:	if (!cg.snap->ps.duelInProgress && cent->currentState.bolt1 && !(cent->currentState.eFlags & EF_DEAD) && cent->currentState.number != cg.snap->ps.clientNum && (!cg.snap->ps.duelInProgress || cg.snap->ps.duelIndex != cent->currentState.number))
ADDRLP4 1084
CNSTI4 1348
ASGNI4
ADDRLP4 1088
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 1084
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1088
INDIRI4
NEI4 $4168
ADDRLP4 1092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $4168
ADDRLP4 1092
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1088
INDIRI4
NEI4 $4168
ADDRLP4 1096
ADDRLP4 1092
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 1096
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $4168
ADDRGP4 cg+36
INDIRP4
ADDRLP4 1084
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $4174
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 1096
INDIRI4
EQI4 $4168
LABELV $4174
line 7306
;7306:	{
line 7307
;7307:		legs.shaderRGBA[0] = 50;
ADDRLP4 0+80
CNSTU1 50
ASGNU1
line 7308
;7308:		legs.shaderRGBA[1] = 50;
ADDRLP4 0+80+1
CNSTU1 50
ASGNU1
line 7309
;7309:		legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7311
;7310:
;7311:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7312
;7312:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7313
;7313:		legs.customShader = cgs.media.forceSightBubble;
ADDRLP4 0+76
ADDRGP4 cgs+70296+492
INDIRI4
ASGNI4
line 7315
;7314:		
;7315:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7316
;7316:	}
LABELV $4168
line 7320
;7317:
;7318:	//For now, these two are using the old shield shader. This is just so that you
;7319:	//can tell it apart from the JM/duel shaders, but it's still very obvious.
;7320:	if (cent->currentState.forcePowersActive & (1 << FP_PROTECT))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $4185
line 7321
;7321:	{ //aborb is represented by green..
line 7322
;7322:		legs.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 7323
;7323:		legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 7324
;7324:		legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 7325
;7325:		legs.shaderRGBA[3] = 254;
ADDRLP4 0+80+3
CNSTU1 254
ASGNU1
line 7327
;7326:
;7327:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7328
;7328:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7329
;7329:		legs.customShader = cgs.media.playerShieldDamage;
ADDRLP4 0+76
ADDRGP4 cgs+70296+488
INDIRI4
ASGNI4
line 7331
;7330:		
;7331:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7332
;7332:	}
LABELV $4185
line 7335
;7333:	//if (cent->currentState.forcePowersActive & (1 << FP_ABSORB))
;7334:	//Showing only when the power has been active (absorbed something) recently now, instead of always.
;7335:	if (cg_entities[cent->currentState.number].teamPowerEffectTime > cg.time && cg_entities[cent->currentState.number].teamPowerType == 3)
ADDRLP4 1100
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 1100
INDIRI4
ADDRGP4 cg_entities+1912
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $4199
ADDRLP4 1100
INDIRI4
ADDRGP4 cg_entities+1916
ADDP4
INDIRI4
CNSTI4 3
NEI4 $4199
line 7336
;7336:	{ //aborb is represented by blue..
line 7337
;7337:		legs.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 7338
;7338:		legs.shaderRGBA[1] = 0;
ADDRLP4 0+80+1
CNSTU1 0
ASGNU1
line 7339
;7339:		legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7340
;7340:		legs.shaderRGBA[3] = 254;
ADDRLP4 0+80+3
CNSTU1 254
ASGNU1
line 7342
;7341:
;7342:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7343
;7343:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7344
;7344:		legs.customShader = cgs.media.playerShieldDamage;
ADDRLP4 0+76
ADDRGP4 cgs+70296+488
INDIRI4
ASGNI4
line 7346
;7345:		
;7346:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7347
;7347:	}
LABELV $4199
line 7349
;7348:
;7349:	if (cent->currentState.isJediMaster && cg.snap->ps.clientNum != cent->currentState.number)
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4216
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 1104
INDIRP4
INDIRI4
EQI4 $4216
line 7350
;7350:	{
line 7351
;7351:		legs.shaderRGBA[0] = 100;
ADDRLP4 0+80
CNSTU1 100
ASGNU1
line 7352
;7352:		legs.shaderRGBA[1] = 100;
ADDRLP4 0+80+1
CNSTU1 100
ASGNU1
line 7353
;7353:		legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7355
;7354:
;7355:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7356
;7356:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7357
;7357:		legs.renderfx |= RF_NODEPTH;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 7358
;7358:		legs.customShader = cgs.media.forceShell;
ADDRLP4 0+76
ADDRGP4 cgs+70296+496
INDIRI4
ASGNI4
line 7360
;7359:		
;7360:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7362
;7361:
;7362:		legs.renderfx &= ~RF_NODEPTH;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 7363
;7363:	}
LABELV $4216
line 7365
;7364:
;7365:	if ((cg.snap->ps.fd.forcePowersActive & (1 << FP_SEE)) && cg.snap->ps.clientNum != cent->currentState.number && cg_auraShell.integer)
ADDRLP4 1108
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 1108
INDIRI4
EQI4 $4231
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $4231
ADDRGP4 cg_auraShell+12
INDIRI4
ADDRLP4 1108
INDIRI4
EQI4 $4231
line 7366
;7366:	{
line 7367
;7367:		if (cgs.gametype >= GT_TEAM)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $4236
line 7368
;7368:		{	// A team game
line 7369
;7369:			switch(cgs.clientinfo[ cent->currentState.clientNum ].team)
ADDRLP4 1112
CNSTI4 788
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 1
EQI4 $4244
ADDRLP4 1112
INDIRI4
CNSTI4 2
EQI4 $4250
ADDRGP4 $4239
JUMPV
line 7370
;7370:			{
LABELV $4244
line 7372
;7371:			case TEAM_RED:
;7372:				legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7373
;7373:				legs.shaderRGBA[1] = 50;
ADDRLP4 0+80+1
CNSTU1 50
ASGNU1
line 7374
;7374:				legs.shaderRGBA[2] = 50;
ADDRLP4 0+80+2
CNSTU1 50
ASGNU1
line 7375
;7375:				break;
ADDRGP4 $4237
JUMPV
LABELV $4250
line 7377
;7376:			case TEAM_BLUE:
;7377:				legs.shaderRGBA[0] = 75;
ADDRLP4 0+80
CNSTU1 75
ASGNU1
line 7378
;7378:				legs.shaderRGBA[1] = 75;
ADDRLP4 0+80+1
CNSTU1 75
ASGNU1
line 7379
;7379:				legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7380
;7380:				break;
ADDRGP4 $4237
JUMPV
LABELV $4239
line 7383
;7381:
;7382:			default:
;7383:				legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7384
;7384:				legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 7385
;7385:				legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 7386
;7386:				break;
line 7388
;7387:			}
;7388:		}
ADDRGP4 $4237
JUMPV
LABELV $4236
line 7390
;7389:		else
;7390:		{	// Not a team game
line 7391
;7391:			legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7392
;7392:			legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 7393
;7393:			legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 7394
;7394:		}
LABELV $4237
line 7396
;7395:
;7396:/*		if (cg.snap->ps.fd.forcePowerLevel[FP_SEE] <= FORCE_LEVEL_1)
line 7402
;7397:		{
;7398:			legs.renderfx |= RF_MINLIGHT;
;7399:		}
;7400:		else
;7401:*/		{	// See through walls.
;7402:			legs.renderfx |= RF_MINLIGHT | RF_NODEPTH;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 17
BORI4
ASGNI4
line 7404
;7403:
;7404:			if (cg.snap->ps.fd.forcePowerLevel[FP_SEE] < FORCE_LEVEL_2)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
CNSTI4 2
GEI4 $4267
line 7405
;7405:			{ //only level 2+ can see players through walls
line 7406
;7406:				legs.renderfx &= ~RF_NODEPTH;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 7407
;7407:			}
LABELV $4267
line 7408
;7408:		}
line 7410
;7409:
;7410:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7411
;7411:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7412
;7412:		legs.customShader = cgs.media.sightShell;
ADDRLP4 0+76
ADDRGP4 cgs+70296+500
INDIRI4
ASGNI4
line 7414
;7413:		
;7414:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7415
;7415:	}
LABELV $4231
line 7419
;7416:
;7417:	// Electricity
;7418:	//------------------------------------------------
;7419:	if ( cent->currentState.emplacedOwner > cg.time ) 
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $4276
line 7420
;7420:	{
line 7421
;7421:		int	dif = cent->currentState.emplacedOwner - cg.time;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
ASGNI4
line 7423
;7422:
;7423:		if ( dif > 0 && random() > 0.4f )
ADDRLP4 1112
INDIRI4
CNSTI4 0
LEI4 $4280
ADDRLP4 1116
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
LEF4 $4280
line 7424
;7424:		{
line 7426
;7425:			// fade out over the last 500 ms
;7426:			int brightness = 255;
ADDRLP4 1120
CNSTI4 255
ASGNI4
line 7428
;7427:			
;7428:			if ( dif < 500 )
ADDRLP4 1112
INDIRI4
CNSTI4 500
GEI4 $4282
line 7429
;7429:			{
line 7430
;7430:				brightness = floor((dif - 500.0f) / 500.0f * 255.0f );
ADDRLP4 1124
CNSTF4 1140457472
ASGNF4
CNSTF4 1132396544
ADDRLP4 1112
INDIRI4
CVIF4 4
ADDRLP4 1124
INDIRF4
SUBF4
ADDRLP4 1124
INDIRF4
DIVF4
MULF4
ARGF4
ADDRLP4 1128
ADDRGP4 floor
CALLF4
ASGNF4
ADDRLP4 1120
ADDRLP4 1128
INDIRF4
CVFI4 4
ASGNI4
line 7431
;7431:			}
LABELV $4282
line 7433
;7432:
;7433:			legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7434
;7434:			legs.renderfx &= ~RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 7436
;7435:
;7436:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7437
;7437:			legs.shaderRGBA[0] = legs.shaderRGBA[1] = legs.shaderRGBA[2] = brightness;
ADDRLP4 1124
ADDRLP4 1120
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 1124
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 1124
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 1124
INDIRU1
ASGNU1
line 7438
;7438:			legs.shaderRGBA[3] = 255;
ADDRLP4 0+80+3
CNSTU1 255
ASGNU1
line 7440
;7439:
;7440:			if ( rand() & 1 )
ADDRLP4 1128
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $4294
line 7441
;7441:			{
line 7442
;7442:				legs.customShader = cgs.media.electricBodyShader;	
ADDRLP4 0+76
ADDRGP4 cgs+70296+396
INDIRI4
ASGNI4
line 7443
;7443:			}
ADDRGP4 $4295
JUMPV
LABELV $4294
line 7445
;7444:			else
;7445:			{
line 7446
;7446:				legs.customShader = cgs.media.electricBody2Shader;
ADDRLP4 0+76
ADDRGP4 cgs+70296+400
INDIRI4
ASGNI4
line 7447
;7447:			}
LABELV $4295
line 7449
;7448:
;7449:			trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7451
;7450:
;7451:			if ( random() > 0.9f )
ADDRLP4 1132
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1063675494
LEF4 $4302
line 7452
;7452:				trap_S_StartSound ( NULL, cent->currentState.number, CHAN_AUTO, cgs.media.crackleSound );
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+676
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $4302
line 7453
;7453:		}
LABELV $4280
line 7454
;7454:	} 
LABELV $4276
line 7456
;7455:
;7456:	if (cent->currentState.powerups & (1 << PW_SHIELDHIT))
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $4306
line 7457
;7457:	{
line 7465
;7458:		/*
;7459:		legs.shaderRGBA[0] = legs.shaderRGBA[1] = legs.shaderRGBA[2] = 255.0f * 0.5f;//t;
;7460:		legs.shaderRGBA[3] = 255;
;7461:		legs.renderfx &= ~RF_ALPHA_FADE;
;7462:		legs.renderfx |= RF_RGB_TINT;
;7463:		*/
;7464:
;7465:		legs.shaderRGBA[0] = legs.shaderRGBA[1] = legs.shaderRGBA[2] = Q_irand(1, 255);
CNSTI4 1
ARGI4
CNSTI4 255
ARGI4
ADDRLP4 1112
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1116
ADDRLP4 1112
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 1116
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 1116
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 1116
INDIRU1
ASGNU1
line 7467
;7466:
;7467:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7468
;7468:		legs.renderfx &= ~RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 7469
;7469:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7470
;7470:		legs.customShader = cgs.media.playerShieldDamage;
ADDRLP4 0+76
ADDRGP4 cgs+70296+488
INDIRI4
ASGNI4
line 7472
;7471:		
;7472:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7473
;7473:	}
LABELV $4306
LABELV $3889
line 7476
;7474:endOfCall:
;7475:	
;7476:	if (cgBoneAnglePostSet.refreshSet)
ADDRGP4 cgBoneAnglePostSet+52
INDIRI4
CNSTI4 0
EQI4 $4319
line 7477
;7477:	{
line 7478
;7478:		trap_G2API_SetBoneAngles(cgBoneAnglePostSet.ghoul2, cgBoneAnglePostSet.modelIndex, cgBoneAnglePostSet.boneName,
ADDRGP4 cgBoneAnglePostSet
INDIRP4
ARGP4
ADDRGP4 cgBoneAnglePostSet+4
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+8
INDIRP4
ARGP4
ADDRGP4 cgBoneAnglePostSet+12
ARGP4
ADDRGP4 cgBoneAnglePostSet+24
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+28
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+32
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+36
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+40
INDIRP4
ARGP4
ADDRGP4 cgBoneAnglePostSet+44
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+48
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 7482
;7479:			cgBoneAnglePostSet.angles, cgBoneAnglePostSet.flags, cgBoneAnglePostSet.up, cgBoneAnglePostSet.right,
;7480:			cgBoneAnglePostSet.forward, cgBoneAnglePostSet.modelList, cgBoneAnglePostSet.blendTime, cgBoneAnglePostSet.currentTime);
;7481:
;7482:		cgBoneAnglePostSet.refreshSet = qfalse;
ADDRGP4 cgBoneAnglePostSet+52
CNSTI4 0
ASGNI4
line 7483
;7483:	}
LABELV $4319
line 7484
;7484:}
LABELV $3077
endproc CG_Player 1380 44
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 56 20
line 7497
;7485:
;7486:
;7487://=====================================================================
;7488:
;7489:/*
;7490:===============
;7491:CG_ResetPlayerEntity
;7492:
;7493:A player just came into view or teleported, so reset all animation info
;7494:===============
;7495:*/
;7496:void CG_ResetPlayerEntity( centity_t *cent ) 
;7497:{
line 7498
;7498:	cent->errorTime = -99999;		// guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 860
ADDP4
CNSTI4 -99999
ASGNI4
line 7499
;7499:	cent->extrapolated = qfalse;	
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
CNSTI4 0
ASGNI4
line 7501
;7500:
;7501:	CG_ClearLerpFrame( cent, &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.legs, cent->currentState.legsAnim, qfalse);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 788
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 7502
;7502:	CG_ClearLerpFrame( cent, &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.torso, cent->currentState.torsoAnim, qtrue);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 788
ADDRLP4 4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 7504
;7503:
;7504:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
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
line 7505
;7505:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
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
line 7507
;7506:
;7507:	VectorCopy( cent->lerpOrigin, cent->rawOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 892
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 7508
;7508:	VectorCopy( cent->lerpAngles, cent->rawAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 904
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 7510
;7509:
;7510:	memset( &cent->pe.legs, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 7511
;7511:	cent->pe.legs.yawAngle = cent->rawAngles[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 664
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 908
ADDP4
INDIRF4
ASGNF4
line 7512
;7512:	cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTI4 0
ASGNI4
line 7513
;7513:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 0
ASGNF4
line 7514
;7514:	cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 7516
;7515:
;7516:	memset( &cent->pe.torso, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 7517
;7517:	cent->pe.torso.yawAngle = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 908
ADDP4
INDIRF4
ASGNF4
line 7518
;7518:	cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 0
ASGNI4
line 7519
;7519:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 736
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 904
ADDP4
INDIRF4
ASGNF4
line 7520
;7520:	cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 0
ASGNI4
line 7522
;7521:
;7522:	if ((cent->ghoul2 == NULL) && trap_G2_HaveWeGhoul2Models(cgs.clientinfo[cent->currentState.clientNum].ghoul2Model))
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $4338
CNSTI4 788
ADDRLP4 36
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $4338
line 7523
;7523:	{
line 7524
;7524:		trap_G2API_DuplicateGhoul2Instance(cgs.clientinfo[cent->currentState.clientNum].ghoul2Model, &cent->ghoul2);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 788
ADDRLP4 44
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 7525
;7525:		CG_CopyG2WeaponInstance(cent->currentState.weapon, cgs.clientinfo[cent->currentState.clientNum].ghoul2Model);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
CNSTI4 788
ADDRLP4 48
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_CopyG2WeaponInstance
CALLV
pop
line 7526
;7526:		cent->weapon = cent->currentState.weapon;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 7527
;7527:	}
LABELV $4338
line 7529
;7528:
;7529:	if ( cg_debugPosition.integer ) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $4346
line 7530
;7530:		CG_Printf("%i ResetPlayerEntity yaw=%i\n", cent->currentState.number, cent->pe.torso.yawAngle );
ADDRGP4 $4349
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 728
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 7531
;7531:	}
LABELV $4346
line 7532
;7532:}
LABELV $4333
endproc CG_ResetPlayerEntity 56 20
import forceHolocronModels
import CG_AllocMark
bss
export cgBoneAnglePostSet
align 4
LABELV cgBoneAnglePostSet
skip 56
import animTable
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
import CG_ReattachLimb
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
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
LABELV $4349
char 1 37
char 1 105
char 1 32
char 1 82
char 1 101
char 1 115
char 1 101
char 1 116
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 69
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 32
char 1 121
char 1 97
char 1 119
char 1 61
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $3899
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
LABELV $3898
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 0
align 1
LABELV $3882
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
char 1 109
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $3671
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 99
char 1 111
char 1 110
char 1 102
char 1 117
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
LABELV $3596
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 117
char 1 112
char 1 115
char 1 47
char 1 121
char 1 115
char 1 97
char 1 108
char 1 105
char 1 109
char 1 97
char 1 114
char 1 105
char 1 115
char 1 104
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $3535
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
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 105
char 1 100
char 1 108
char 1 101
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $3520
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
LABELV $3501
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
LABELV $3500
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $3499
char 1 108
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $3334
char 1 48
char 1 0
align 1
LABELV $3333
char 1 99
char 1 103
char 1 95
char 1 102
char 1 112
char 1 108
char 1 115
char 1 0
align 1
LABELV $3306
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 114
char 1 101
char 1 109
char 1 111
char 1 116
char 1 101
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $3190
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
LABELV $3187
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
LABELV $3083
char 1 66
char 1 97
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 78
char 1 117
char 1 109
char 1 32
char 1 111
char 1 110
char 1 32
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 32
char 1 101
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $3054
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
LABELV $3053
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
char 1 95
char 1 102
char 1 112
char 1 108
char 1 115
char 1 50
char 1 46
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $2517
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 114
char 1 105
char 1 99
char 1 50
char 1 0
align 1
LABELV $2120
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
char 1 119
char 1 97
char 1 108
char 1 108
char 1 37
char 1 105
char 1 0
align 1
LABELV $2094
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
LABELV $1978
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
LABELV $1929
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
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 68
char 1 97
char 1 109
char 1 97
char 1 103
char 1 101
char 1 71
char 1 108
char 1 111
char 1 119
char 1 0
align 1
LABELV $1530
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 80
char 1 117
char 1 115
char 1 104
char 1 0
align 1
LABELV $1195
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
LABELV $1163
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
LABELV $1088
char 1 66
char 1 97
char 1 100
char 1 32
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 32
char 1 109
char 1 111
char 1 118
char 1 101
char 1 109
char 1 101
char 1 110
char 1 116
char 1 32
char 1 97
char 1 110
char 1 103
char 1 108
char 1 101
char 1 0
align 1
LABELV $938
char 1 67
char 1 108
char 1 97
char 1 109
char 1 112
char 1 32
char 1 108
char 1 102
char 1 45
char 1 62
char 1 102
char 1 114
char 1 97
char 1 109
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 10
char 1 0
align 1
LABELV $745
char 1 37
char 1 100
char 1 58
char 1 32
char 1 37
char 1 100
char 1 32
char 1 65
char 1 110
char 1 105
char 1 109
char 1 58
char 1 32
char 1 37
char 1 105
char 1 44
char 1 32
char 1 39
char 1 37
char 1 115
char 1 39
char 1 10
char 1 0
align 1
LABELV $738
char 1 66
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
char 1 110
char 1 117
char 1 109
char 1 98
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $718
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 97
char 1 116
char 1 115
char 1 116
char 1 47
char 1 65
char 1 84
char 1 83
char 1 84
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
LABELV $697
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 97
char 1 116
char 1 115
char 1 116
char 1 47
char 1 65
char 1 84
char 1 83
char 1 84
char 1 99
char 1 114
char 1 97
char 1 115
char 1 104
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $691
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 97
char 1 116
char 1 115
char 1 116
char 1 47
char 1 65
char 1 84
char 1 83
char 1 84
char 1 115
char 1 116
char 1 101
char 1 112
char 1 50
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $690
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 97
char 1 116
char 1 115
char 1 116
char 1 47
char 1 65
char 1 84
char 1 83
char 1 84
char 1 115
char 1 116
char 1 101
char 1 112
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $610
char 1 77
char 1 101
char 1 109
char 1 111
char 1 114
char 1 121
char 1 32
char 1 105
char 1 115
char 1 32
char 1 108
char 1 111
char 1 119
char 1 46
char 1 32
char 1 32
char 1 85
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 100
char 1 101
char 1 102
char 1 101
char 1 114
char 1 114
char 1 101
char 1 100
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 46
char 1 10
char 1 0
align 1
LABELV $577
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
LABELV $544
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $542
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
LABELV $540
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
LABELV $538
char 1 116
char 1 108
char 1 0
align 1
LABELV $536
char 1 116
char 1 116
char 1 0
align 1
LABELV $534
char 1 116
char 1 0
align 1
LABELV $532
char 1 108
char 1 0
align 1
LABELV $530
char 1 119
char 1 0
align 1
LABELV $528
char 1 104
char 1 99
char 1 0
align 1
LABELV $526
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $524
char 1 99
char 1 50
char 1 0
align 1
LABELV $521
char 1 99
char 1 49
char 1 0
align 1
LABELV $518
char 1 110
char 1 0
align 1
LABELV $511
char 1 67
char 1 71
char 1 95
char 1 83
char 1 101
char 1 116
char 1 68
char 1 101
char 1 102
char 1 101
char 1 114
char 1 114
char 1 101
char 1 100
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 73
char 1 110
char 1 102
char 1 111
char 1 58
char 1 32
char 1 110
char 1 111
char 1 32
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 33
char 1 10
char 1 0
align 1
LABELV $434
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 37
char 1 115
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $431
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 109
char 1 112
char 1 95
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 95
char 1 102
char 1 101
char 1 109
char 1 97
char 1 108
char 1 101
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 0
align 1
LABELV $426
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 37
char 1 115
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $423
char 1 37
char 1 115
char 1 0
align 1
LABELV $403
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
char 1 37
char 1 115
char 1 47
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 115
char 1 95
char 1 37
char 1 115
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $402
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
char 1 37
char 1 115
char 1 47
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 115
char 1 95
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $399
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
char 1 37
char 1 115
char 1 47
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 115
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $395
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 109
char 1 112
char 1 95
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 95
char 1 109
char 1 97
char 1 108
char 1 101
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 0
align 1
LABELV $394
char 1 116
char 1 97
char 1 103
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $381
char 1 68
char 1 69
char 1 70
char 1 65
char 1 85
char 1 76
char 1 84
char 1 95
char 1 77
char 1 79
char 1 68
char 1 69
char 1 76
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 32
char 1 102
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 114
char 1 101
char 1 103
char 1 105
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $378
char 1 68
char 1 69
char 1 70
char 1 65
char 1 85
char 1 76
char 1 84
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 77
char 1 79
char 1 68
char 1 69
char 1 76
char 1 32
char 1 47
char 1 32
char 1 115
char 1 107
char 1 105
char 1 110
char 1 32
char 1 40
char 1 37
char 1 115
char 1 47
char 1 37
char 1 115
char 1 41
char 1 32
char 1 102
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 114
char 1 101
char 1 103
char 1 105
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $375
char 1 69
char 1 109
char 1 112
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $374
char 1 82
char 1 101
char 1 98
char 1 101
char 1 108
char 1 108
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $366
char 1 47
char 1 0
align 1
LABELV $341
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
char 1 37
char 1 115
char 1 47
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 37
char 1 115
char 1 0
align 1
LABELV $312
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
LABELV $311
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $310
char 1 42
char 1 104
char 1 101
char 1 97
char 1 100
char 1 95
char 1 116
char 1 111
char 1 112
char 1 0
align 1
LABELV $309
char 1 42
char 1 108
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $307
char 1 99
char 1 114
char 1 97
char 1 110
char 1 105
char 1 117
char 1 109
char 1 0
align 1
LABELV $303
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
LABELV $299
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
LABELV $296
char 1 42
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $295
char 1 112
char 1 101
char 1 108
char 1 118
char 1 105
char 1 115
char 1 0
align 1
LABELV $294
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 50
char 1 0
align 1
LABELV $292
char 1 114
char 1 95
char 1 99
char 1 108
char 1 97
char 1 118
char 1 105
char 1 99
char 1 97
char 1 108
char 1 0
align 1
LABELV $290
char 1 108
char 1 95
char 1 99
char 1 108
char 1 97
char 1 118
char 1 105
char 1 99
char 1 97
char 1 108
char 1 0
align 1
LABELV $288
char 1 77
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
LABELV $287
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 49
char 1 0
align 1
LABELV $257
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
char 1 10
char 1 0
align 1
LABELV $254
char 1 77
char 1 111
char 1 100
char 1 101
char 1 108
char 1 32
char 1 100
char 1 111
char 1 101
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 115
char 1 117
char 1 112
char 1 112
char 1 111
char 1 114
char 1 116
char 1 101
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
char 1 99
char 1 111
char 1 110
char 1 102
char 1 105
char 1 103
char 1 46
char 1 10
char 1 0
align 1
LABELV $251
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
LABELV $248
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
LABELV $247
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
LABELV $240
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
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 37
char 1 115
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
LABELV $232
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
char 1 37
char 1 115
char 1 47
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 37
char 1 115
char 1 46
char 1 115
char 1 107
char 1 105
char 1 110
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
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 97
char 1 116
char 1 115
char 1 116
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
LABELV $214
char 1 87
char 1 65
char 1 82
char 1 78
char 1 73
char 1 78
char 1 71
char 1 58
char 1 32
char 1 65
char 1 116
char 1 116
char 1 101
char 1 109
char 1 112
char 1 116
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
char 1 32
char 1 117
char 1 110
char 1 115
char 1 117
char 1 112
char 1 112
char 1 111
char 1 114
char 1 116
char 1 101
char 1 100
char 1 32
char 1 109
char 1 117
char 1 108
char 1 116
char 1 105
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 33
char 1 32
char 1 40
char 1 98
char 1 97
char 1 100
char 1 32
char 1 111
char 1 114
char 1 32
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 98
char 1 111
char 1 110
char 1 101
char 1 44
char 1 32
char 1 111
char 1 114
char 1 32
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 110
char 1 103
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
char 1 115
char 1 101
char 1 113
char 1 117
char 1 101
char 1 110
char 1 99
char 1 101
char 1 41
char 1 10
char 1 0
align 1
LABELV $213
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $201
char 1 115
char 1 117
char 1 114
char 1 102
char 1 79
char 1 110
char 1 0
align 1
LABELV $198
char 1 44
char 1 0
align 1
LABELV $193
char 1 115
char 1 117
char 1 114
char 1 102
char 1 79
char 1 102
char 1 102
char 1 0
align 1
LABELV $184
char 1 70
char 1 105
char 1 108
char 1 101
char 1 32
char 1 37
char 1 115
char 1 32
char 1 116
char 1 111
char 1 111
char 1 32
char 1 108
char 1 111
char 1 110
char 1 103
char 1 10
char 1 0
align 1
LABELV $179
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
char 1 37
char 1 115
char 1 47
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 37
char 1 115
char 1 46
char 1 115
char 1 117
char 1 114
char 1 102
char 1 0
align 1
LABELV $177
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $176
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $175
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 95
char 1 109
char 1 112
char 1 0
align 1
LABELV $172
char 1 109
char 1 111
char 1 114
char 1 103
char 1 97
char 1 110
char 1 0
align 1
LABELV $169
char 1 102
char 1 112
char 1 108
char 1 115
char 1 51
char 1 0
align 1
LABELV $166
char 1 102
char 1 112
char 1 108
char 1 115
char 1 50
char 1 0
align 1
LABELV $163
char 1 102
char 1 112
char 1 108
char 1 115
char 1 0
align 1
LABELV $160
char 1 107
char 1 121
char 1 108
char 1 101
char 1 0
align 1
LABELV $149
char 1 85
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 99
char 1 117
char 1 115
char 1 116
char 1 111
char 1 109
char 1 32
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $134
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
LABELV $133
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
LABELV $132
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
LABELV $131
char 1 42
char 1 99
char 1 104
char 1 111
char 1 107
char 1 101
char 1 51
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $130
char 1 42
char 1 99
char 1 104
char 1 111
char 1 107
char 1 101
char 1 50
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $129
char 1 42
char 1 99
char 1 104
char 1 111
char 1 107
char 1 101
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $128
char 1 42
char 1 102
char 1 97
char 1 108
char 1 108
char 1 105
char 1 110
char 1 103
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $127
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
LABELV $126
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
LABELV $125
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
LABELV $124
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
LABELV $123
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
LABELV $122
char 1 42
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 51
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $121
char 1 42
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 50
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $120
char 1 42
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
