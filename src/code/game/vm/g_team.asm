export Team_InitGame
code
proc Team_InitGame 8 12
file "../g_team.c"
line 22
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:#include "bg_saga.h"
;6:
;7:
;8:typedef struct teamgame_s {
;9:	float			last_flag_capture;
;10:	int				last_capture_team;
;11:	flagStatus_t	redStatus;	// CTF
;12:	flagStatus_t	blueStatus;	// CTF
;13:	flagStatus_t	flagStatus;	// One Flag CTF
;14:	int				redTakenTime;
;15:	int				blueTakenTime;
;16:} teamgame_t;
;17:
;18:teamgame_t teamgame;
;19:
;20:void Team_SetFlagStatus( int team, flagStatus_t status );
;21:
;22:void Team_InitGame( void ) {
line 23
;23:	memset(&teamgame, 0, sizeof teamgame);
ADDRGP4 teamgame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 28
ARGI4
ADDRGP4 memset
CALLP4
pop
line 25
;24:
;25:	switch( g_gametype.integer ) {
ADDRLP4 0
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $82
ADDRLP4 0
INDIRI4
CNSTI4 8
EQI4 $82
ADDRGP4 $80
JUMPV
LABELV $82
line 28
;26:	case GT_CTF:
;27:	case GT_CTY:
;28:		teamgame.redStatus = teamgame.blueStatus = -1; // Invalid to force update
ADDRLP4 4
CNSTI4 -1
ASGNI4
ADDRGP4 teamgame+12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 teamgame+8
ADDRLP4 4
INDIRI4
ASGNI4
line 29
;29:		Team_SetFlagStatus( TEAM_RED, FLAG_ATBASE );
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 30
;30:		Team_SetFlagStatus( TEAM_BLUE, FLAG_ATBASE );
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 31
;31:		break;
line 33
;32:	default:
;33:		break;
LABELV $80
line 35
;34:	}
;35:}
LABELV $78
endproc Team_InitGame 8 12
export OtherTeam
proc OtherTeam 0 0
line 37
;36:
;37:int OtherTeam(int team) {
line 38
;38:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $86
line 39
;39:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $85
JUMPV
LABELV $86
line 40
;40:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $88
line 41
;41:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $85
JUMPV
LABELV $88
line 42
;42:	return team;
ADDRFP4 0
INDIRI4
RETI4
LABELV $85
endproc OtherTeam 0 0
export TeamName
proc TeamName 0 0
line 45
;43:}
;44:
;45:const char *TeamName(int team)  {
line 46
;46:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $91
line 47
;47:		return "RED";
ADDRGP4 $93
RETP4
ADDRGP4 $90
JUMPV
LABELV $91
line 48
;48:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $94
line 49
;49:		return "BLUE";
ADDRGP4 $96
RETP4
ADDRGP4 $90
JUMPV
LABELV $94
line 50
;50:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $97
line 51
;51:		return "SPECTATOR";
ADDRGP4 $99
RETP4
ADDRGP4 $90
JUMPV
LABELV $97
line 52
;52:	return "FREE";
ADDRGP4 $100
RETP4
LABELV $90
endproc TeamName 0 0
export OtherTeamName
proc OtherTeamName 0 0
line 55
;53:}
;54:
;55:const char *OtherTeamName(int team) {
line 56
;56:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $102
line 57
;57:		return "BLUE";
ADDRGP4 $96
RETP4
ADDRGP4 $101
JUMPV
LABELV $102
line 58
;58:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $104
line 59
;59:		return "RED";
ADDRGP4 $93
RETP4
ADDRGP4 $101
JUMPV
LABELV $104
line 60
;60:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $106
line 61
;61:		return "SPECTATOR";
ADDRGP4 $99
RETP4
ADDRGP4 $101
JUMPV
LABELV $106
line 62
;62:	return "FREE";
ADDRGP4 $100
RETP4
LABELV $101
endproc OtherTeamName 0 0
export TeamColorString
proc TeamColorString 0 0
line 65
;63:}
;64:
;65:const char *TeamColorString(int team) {
line 66
;66:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $109
line 67
;67:		return S_COLOR_RED;
ADDRGP4 $111
RETP4
ADDRGP4 $108
JUMPV
LABELV $109
line 68
;68:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $112
line 69
;69:		return S_COLOR_BLUE;
ADDRGP4 $114
RETP4
ADDRGP4 $108
JUMPV
LABELV $112
line 70
;70:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $115
line 71
;71:		return S_COLOR_YELLOW;
ADDRGP4 $117
RETP4
ADDRGP4 $108
JUMPV
LABELV $115
line 72
;72:	return S_COLOR_WHITE;
ADDRGP4 $118
RETP4
LABELV $108
endproc TeamColorString 0 0
export PrintCTFMessage
proc PrintCTFMessage 12 8
line 101
;73:}
;74:
;75:// NULL for everyone
;76:/*
;77:void QDECL PrintMsg( gentity_t *ent, const char *fmt, ... ) {
;78:	char		msg[1024];
;79:	va_list		argptr;
;80:	char		*p;
;81:	
;82:	va_start (argptr,fmt);
;83:	if (vsprintf (msg, fmt, argptr) > sizeof(msg)) {
;84:		G_Error ( "PrintMsg overrun" );
;85:	}
;86:	va_end (argptr);
;87:
;88:	// double quotes are bad
;89:	while ((p = strchr(msg, '"')) != NULL)
;90:		*p = '\'';
;91:
;92:	trap_SendServerCommand ( ( (ent == NULL) ? -1 : ent-g_entities ), va("print \"%s\"", msg ));
;93:}
;94:*/
;95://Printing messages to players via this method is no longer done, StripEd stuff is client only.
;96:
;97:
;98://plIndex used to print pl->client->pers.netname
;99://teamIndex used to print team name
;100:void PrintCTFMessage(int plIndex, int teamIndex, int ctfMessage)
;101:{
line 104
;102:	gentity_t *te;
;103:
;104:	if (plIndex == -1)
ADDRFP4 0
INDIRI4
CNSTI4 -1
NEI4 $120
line 105
;105:	{
line 106
;106:		plIndex = MAX_CLIENTS+1;
ADDRFP4 0
CNSTI4 33
ASGNI4
line 107
;107:	}
LABELV $120
line 108
;108:	if (teamIndex == -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
NEI4 $122
line 109
;109:	{
line 110
;110:		teamIndex = 50;
ADDRFP4 4
CNSTI4 50
ASGNI4
line 111
;111:	}
LABELV $122
line 113
;112:
;113:	te = G_TempEntity(vec3_origin, EV_CTFMESSAGE);
ADDRGP4 vec3_origin
ARGP4
CNSTI4 87
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 114
;114:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 115
;115:	te->s.eventParm = ctfMessage;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 116
;116:	te->s.trickedentindex = plIndex;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 117
;117:	if (ctfMessage == CTFMESSAGE_PLAYER_CAPTURED_FLAG)
ADDRFP4 8
INDIRI4
CNSTI4 3
NEI4 $124
line 118
;118:	{
line 119
;119:		if (teamIndex == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $126
line 120
;120:		{
line 121
;121:			te->s.trickedentindex2 = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 2
ASGNI4
line 122
;122:		}
ADDRGP4 $125
JUMPV
LABELV $126
line 124
;123:		else
;124:		{
line 125
;125:			te->s.trickedentindex2 = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 1
ASGNI4
line 126
;126:		}
line 127
;127:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 129
;128:	else
;129:	{
line 130
;130:		te->s.trickedentindex2 = teamIndex;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 131
;131:	}
LABELV $125
line 132
;132:}
LABELV $119
endproc PrintCTFMessage 12 8
export AddTeamScore
proc AddTeamScore 16 8
line 142
;133:
;134:/*
;135:==============
;136:AddTeamScore
;137:
;138: used for gametype > GT_TEAM
;139: for gametype GT_TEAM the level.teamScores is updated in AddScore in g_combat.c
;140:==============
;141:*/
;142:void AddTeamScore(vec3_t origin, int team, int score) {
line 145
;143:	gentity_t	*te;
;144:
;145:	te = G_TempEntity(origin, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 146
;146:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 148
;147:
;148:	if ( team == TEAM_RED ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $129
line 149
;149:		if ( level.teamScores[ TEAM_RED ] + score == level.teamScores[ TEAM_BLUE ] ) {
ADDRGP4 level+44+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $131
line 151
;150:			//teams are tied sound
;151:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 10
ASGNI4
line 152
;152:		}
ADDRGP4 $130
JUMPV
LABELV $131
line 153
;153:		else if ( level.teamScores[ TEAM_RED ] <= level.teamScores[ TEAM_BLUE ] &&
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
GTI4 $137
ADDRGP4 level+44+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $137
line 154
;154:					level.teamScores[ TEAM_RED ] + score > level.teamScores[ TEAM_BLUE ]) {
line 156
;155:			// red took the lead sound
;156:			te->s.eventParm = GTS_REDTEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 8
ASGNI4
line 157
;157:		}
ADDRGP4 $130
JUMPV
LABELV $137
line 158
;158:		else {
line 160
;159:			// red scored sound
;160:			te->s.eventParm = GTS_REDTEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 6
ASGNI4
line 161
;161:		}
line 162
;162:	}
ADDRGP4 $130
JUMPV
LABELV $129
line 163
;163:	else {
line 164
;164:		if ( level.teamScores[ TEAM_BLUE ] + score == level.teamScores[ TEAM_RED ] ) {
ADDRGP4 level+44+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+4
INDIRI4
NEI4 $147
line 166
;165:			//teams are tied sound
;166:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 10
ASGNI4
line 167
;167:		}
ADDRGP4 $148
JUMPV
LABELV $147
line 168
;168:		else if ( level.teamScores[ TEAM_BLUE ] <= level.teamScores[ TEAM_RED ] &&
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
GTI4 $153
ADDRGP4 level+44+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $153
line 169
;169:					level.teamScores[ TEAM_BLUE ] + score > level.teamScores[ TEAM_RED ]) {
line 171
;170:			// blue took the lead sound
;171:			te->s.eventParm = GTS_BLUETEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 9
ASGNI4
line 172
;172:		}
ADDRGP4 $154
JUMPV
LABELV $153
line 173
;173:		else {
line 175
;174:			// blue scored sound
;175:			te->s.eventParm = GTS_BLUETEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 7
ASGNI4
line 176
;176:		}
LABELV $154
LABELV $148
line 177
;177:	}
LABELV $130
line 178
;178:	level.teamScores[ team ] += score;
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 179
;179:}
LABELV $128
endproc AddTeamScore 16 8
export OnSameTeam
proc OnSameTeam 24 0
line 186
;180:
;181:/*
;182:==============
;183:OnSameTeam
;184:==============
;185:*/
;186:qboolean OnSameTeam( gentity_t *ent1, gentity_t *ent2 ) {
line 187
;187:	if ( !ent1->client || !ent2->client ) {
ADDRLP4 0
CNSTI4 408
ASGNI4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $167
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $165
LABELV $167
line 188
;188:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $164
JUMPV
LABELV $165
line 191
;189:	}
;190:
;191:	if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $168
line 192
;192:	{
line 193
;193:		qboolean ent1IsBot = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 194
;194:		qboolean ent2IsBot = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 196
;195:
;196:		if (ent1->r.svFlags & SVF_BOT)
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $171
line 197
;197:		{
line 198
;198:			ent1IsBot = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 199
;199:		}
LABELV $171
line 200
;200:		if (ent2->r.svFlags & SVF_BOT)
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $173
line 201
;201:		{
line 202
;202:			ent2IsBot = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 203
;203:		}
LABELV $173
line 205
;204:
;205:		if ((ent1IsBot && ent2IsBot) || (!ent1IsBot && !ent2IsBot))
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $178
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $177
LABELV $178
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $175
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $175
LABELV $177
line 206
;206:		{
line 207
;207:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $164
JUMPV
LABELV $175
line 209
;208:		}
;209:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $164
JUMPV
LABELV $168
line 212
;210:	}
;211:
;212:	if ( g_gametype.integer < GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $179
line 213
;213:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $164
JUMPV
LABELV $179
line 216
;214:	}
;215:
;216:	if ( ent1->client->sess.sessionTeam == ent2->client->sess.sessionTeam ) {
ADDRLP4 8
CNSTI4 408
ASGNI4
ADDRLP4 12
CNSTI4 1532
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
NEI4 $182
line 217
;217:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $164
JUMPV
LABELV $182
line 220
;218:	}
;219:
;220:	return qfalse;
CNSTI4 0
RETI4
LABELV $164
endproc OnSameTeam 24 0
data
align 1
LABELV ctfFlagStatusRemap
char 1 48
char 1 49
char 1 42
char 1 42
char 1 50
export Team_SetFlagStatus
code
proc Team_SetFlagStatus 12 8
line 226
;221:}
;222:
;223:
;224:static char ctfFlagStatusRemap[] = { '0', '1', '*', '*', '2' };
;225:
;226:void Team_SetFlagStatus( int team, flagStatus_t status ) {
line 227
;227:	qboolean modified = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 229
;228:
;229:	switch( team ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $197
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $187
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $192
ADDRGP4 $185
JUMPV
LABELV $187
line 231
;230:	case TEAM_RED:	// CTF
;231:		if( teamgame.redStatus != status ) {
ADDRGP4 teamgame+8
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $186
line 232
;232:			teamgame.redStatus = status;
ADDRGP4 teamgame+8
ADDRFP4 4
INDIRI4
ASGNI4
line 233
;233:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 234
;234:		}
line 235
;235:		break;
ADDRGP4 $186
JUMPV
LABELV $192
line 238
;236:
;237:	case TEAM_BLUE:	// CTF
;238:		if( teamgame.blueStatus != status ) {
ADDRGP4 teamgame+12
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $186
line 239
;239:			teamgame.blueStatus = status;
ADDRGP4 teamgame+12
ADDRFP4 4
INDIRI4
ASGNI4
line 240
;240:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 241
;241:		}
line 242
;242:		break;
ADDRGP4 $186
JUMPV
LABELV $197
line 245
;243:
;244:	case TEAM_FREE:	// One Flag CTF
;245:		if( teamgame.flagStatus != status ) {
ADDRGP4 teamgame+16
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $186
line 246
;246:			teamgame.flagStatus = status;
ADDRGP4 teamgame+16
ADDRFP4 4
INDIRI4
ASGNI4
line 247
;247:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 248
;248:		}
line 249
;249:		break;
LABELV $185
LABELV $186
line 252
;250:	}
;251:
;252:	if( modified ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $202
line 255
;253:		char st[4];
;254:
;255:		if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $208
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $204
LABELV $208
line 256
;256:			st[0] = ctfFlagStatusRemap[teamgame.redStatus];
ADDRLP4 8
ADDRGP4 teamgame+8
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 257
;257:			st[1] = ctfFlagStatusRemap[teamgame.blueStatus];
ADDRLP4 8+1
ADDRGP4 teamgame+12
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 258
;258:			st[2] = 0;
ADDRLP4 8+2
CNSTI1 0
ASGNI1
line 259
;259:		}
LABELV $204
line 261
;260:
;261:		trap_SetConfigstring( CS_FLAGSTATUS, st );
CNSTI4 23
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 262
;262:	}
LABELV $202
line 263
;263:}
LABELV $184
endproc Team_SetFlagStatus 12 8
export Team_CheckDroppedItem
proc Team_CheckDroppedItem 0 8
line 265
;264:
;265:void Team_CheckDroppedItem( gentity_t *dropped ) {
line 266
;266:	if( dropped->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $214
line 267
;267:		Team_SetFlagStatus( TEAM_RED, FLAG_DROPPED );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 268
;268:	}
ADDRGP4 $215
JUMPV
LABELV $214
line 269
;269:	else if( dropped->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $216
line 270
;270:		Team_SetFlagStatus( TEAM_BLUE, FLAG_DROPPED );
CNSTI4 2
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 271
;271:	}
ADDRGP4 $217
JUMPV
LABELV $216
line 272
;272:	else if( dropped->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
NEI4 $218
line 273
;273:		Team_SetFlagStatus( TEAM_FREE, FLAG_DROPPED );
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 274
;274:	}
LABELV $218
LABELV $217
LABELV $215
line 275
;275:}
LABELV $213
endproc Team_CheckDroppedItem 0 8
export Team_ForceGesture
proc Team_ForceGesture 12 0
line 282
;276:
;277:/*
;278:================
;279:Team_ForceGesture
;280:================
;281:*/
;282:void Team_ForceGesture(int team) {
line 286
;283:	int i;
;284:	gentity_t *ent;
;285:
;286:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $221
line 287
;287:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 288
;288:		if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $225
line 289
;289:			continue;
ADDRGP4 $222
JUMPV
LABELV $225
line 290
;290:		if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $227
line 291
;291:			continue;
ADDRGP4 $222
JUMPV
LABELV $227
line 292
;292:		if (ent->client->sess.sessionTeam != team)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $229
line 293
;293:			continue;
ADDRGP4 $222
JUMPV
LABELV $229
line 295
;294:		//
;295:		ent->flags |= FL_FORCE_GESTURE;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 296
;296:	}
LABELV $222
line 286
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $221
line 297
;297:}
LABELV $220
endproc Team_ForceGesture 12 0
export Team_FragBonuses
proc Team_FragBonuses 276 12
line 309
;298:
;299:/*
;300:================
;301:Team_FragBonuses
;302:
;303:Calculate the bonuses for flag defense, flag carrier defense, etc.
;304:Note that bonuses are not cumulative.  You get one, they are in importance
;305:order.
;306:================
;307:*/
;308:void Team_FragBonuses(gentity_t *targ, gentity_t *inflictor, gentity_t *attacker)
;309:{
line 315
;310:	int i;
;311:	gentity_t *ent;
;312:	int flag_pw, enemy_flag_pw;
;313:	int otherteam;
;314:	int tokens;
;315:	gentity_t *flag, *carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 321
;316:	char *c;
;317:	vec3_t v1, v2;
;318:	int team;
;319:
;320:	// no bonus for fragging yourself or team mates
;321:	if (!targ->client || !attacker->client || targ == attacker || OnSameTeam(targ, attacker))
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 408
ASGNI4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $236
ADDRLP4 76
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $236
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRP4
CVPU4 4
EQU4 $236
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $232
LABELV $236
line 322
;322:		return;
ADDRGP4 $231
JUMPV
LABELV $232
line 324
;323:
;324:	team = targ->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 325
;325:	otherteam = OtherTeam(targ->client->sess.sessionTeam);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 84
INDIRI4
ASGNI4
line 326
;326:	if (otherteam < 0)
ADDRLP4 20
INDIRI4
CNSTI4 0
GEI4 $237
line 327
;327:		return; // whoever died isn't on a team
ADDRGP4 $231
JUMPV
LABELV $237
line 330
;328:
;329:	// same team, if the flag at base, check to he has the enemy flag
;330:	if (team == TEAM_RED) {
ADDRLP4 52
INDIRI4
CNSTI4 1
NEI4 $239
line 331
;331:		flag_pw = PW_REDFLAG;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 332
;332:		enemy_flag_pw = PW_BLUEFLAG;
ADDRLP4 60
CNSTI4 5
ASGNI4
line 333
;333:	} else {
ADDRGP4 $240
JUMPV
LABELV $239
line 334
;334:		flag_pw = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 5
ASGNI4
line 335
;335:		enemy_flag_pw = PW_REDFLAG;
ADDRLP4 60
CNSTI4 4
ASGNI4
line 336
;336:	}
LABELV $240
line 339
;337:
;338:	// did the attacker frag the flag carrier?
;339:	tokens = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 340
;340:	if (targ->client->ps.powerups[enemy_flag_pw]) {
ADDRLP4 60
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
CNSTI4 0
EQI4 $241
line 341
;341:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1516
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 342
;342:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 343
;343:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 88
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1496
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 346
;344:		//PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's flag carrier!\n",
;345:		//	attacker->client->pers.netname, TeamName(team));
;346:		PrintCTFMessage(attacker->s.number, team, CTFMESSAGE_FRAGGED_FLAG_CARRIER);
ADDRFP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 350
;347:
;348:		// the target had the flag, clear the hurt carrier
;349:		// field on the other team
;350:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $244
line 351
;351:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 352
;352:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $249
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $249
line 353
;353:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
CNSTF4 0
ASGNF4
LABELV $249
line 354
;354:		}
LABELV $245
line 350
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $247
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $244
line 355
;355:		return;
ADDRGP4 $231
JUMPV
LABELV $241
line 359
;356:	}
;357:
;358:	// did the attacker frag a head carrier? other->client->ps.generic1
;359:	if (tokens) {
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $251
line 360
;360:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1516
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 361
;361:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS * tokens * tokens);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 20
ADDRLP4 56
INDIRI4
MULI4
ADDRLP4 56
INDIRI4
MULI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 362
;362:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1496
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 368
;363:		//PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's skull carrier!\n",
;364:		//	attacker->client->pers.netname, TeamName(team));
;365:
;366:		// the target had the flag, clear the hurt carrier
;367:		// field on the other team
;368:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $254
line 369
;369:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 370
;370:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $259
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $259
line 371
;371:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
CNSTF4 0
ASGNF4
LABELV $259
line 372
;372:		}
LABELV $255
line 368
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $257
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $254
line 373
;373:		return;
ADDRGP4 $231
JUMPV
LABELV $251
line 376
;374:	}
;375:
;376:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 88
CNSTI4 408
ASGNI4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
INDIRF4
ASGNF4
ADDRLP4 92
INDIRF4
CNSTF4 0
EQF4 $261
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $261
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $261
line 378
;377:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT &&
;378:		!attacker->client->ps.powerups[flag_pw]) {
line 381
;379:		// attacker is on the same team as the flag carrier and
;380:		// fragged a guy who hurt our flag carrier
;381:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 383
;382:
;383:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1488
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 384
;384:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
CNSTF4 0
ASGNF4
line 386
;385:
;386:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 387
;387:		team = attacker->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 389
;388:		// add the sprite over the player's head
;389:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 390
;390:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 391
;391:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 393
;392:
;393:		return;
ADDRGP4 $231
JUMPV
LABELV $261
line 396
;394:	}
;395:
;396:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
INDIRF4
ASGNF4
ADDRLP4 96
INDIRF4
CNSTF4 0
EQF4 $265
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 96
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $265
line 397
;397:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT) {
line 399
;398:		// attacker is on the same team as the skull carrier and
;399:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 401
;400:
;401:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1488
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 402
;402:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
CNSTF4 0
ASGNF4
line 404
;403:
;404:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 405
;405:		team = attacker->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 407
;406:		// add the sprite over the player's head
;407:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 408
;408:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 409
;409:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 411
;410:
;411:		return;
ADDRGP4 $231
JUMPV
LABELV $265
line 419
;412:	}
;413:
;414:	// flag and flag carrier area defense bonuses
;415:
;416:	// we have to find the flag and carrier entities
;417:
;418:	// find the flag
;419:	switch (attacker->client->sess.sessionTeam) {
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $272
ADDRLP4 100
INDIRI4
CNSTI4 2
EQI4 $274
ADDRGP4 $231
JUMPV
LABELV $272
line 421
;420:	case TEAM_RED:
;421:		c = "team_CTF_redflag";
ADDRLP4 24
ADDRGP4 $273
ASGNP4
line 422
;422:		break;
ADDRGP4 $270
JUMPV
LABELV $274
line 424
;423:	case TEAM_BLUE:
;424:		c = "team_CTF_blueflag";
ADDRLP4 24
ADDRGP4 $275
ASGNP4
line 425
;425:		break;		
line 427
;426:	default:
;427:		return;
LABELV $270
line 430
;428:	}
;429:	// find attacker's team's flag carrier
;430:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $279
JUMPV
LABELV $276
line 431
;431:		carrier = g_entities + i;
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 432
;432:		if (carrier->inuse && carrier->client->ps.powerups[flag_pw])
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $281
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $281
line 433
;433:			break;
ADDRGP4 $278
JUMPV
LABELV $281
line 434
;434:		carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 435
;435:	}
LABELV $277
line 430
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $279
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $276
LABELV $278
line 436
;436:	flag = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRGP4 $284
JUMPV
LABELV $283
line 437
;437:	while ((flag = G_Find (flag, FOFS(classname), c)) != NULL) {
line 438
;438:		if (!(flag->flags & FL_DROPPED_ITEM))
ADDRLP4 8
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $286
line 439
;439:			break;
ADDRGP4 $285
JUMPV
LABELV $286
line 440
;440:	}
LABELV $284
line 437
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 108
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $283
LABELV $285
line 442
;441:
;442:	if (!flag)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $288
line 443
;443:		return; // can't find attacker's flag
ADDRGP4 $231
JUMPV
LABELV $288
line 448
;444:
;445:	// ok we have the attackers flag and a pointer to the carrier
;446:
;447:	// check to see if we are defending the base's flag
;448:	VectorSubtract(targ->r.currentOrigin, flag->r.currentOrigin, v1);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
CNSTI4 368
ASGNI4
ADDRLP4 28
ADDRLP4 112
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124
CNSTI4 372
ASGNI4
ADDRLP4 28+4
ADDRLP4 112
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 128
CNSTI4 376
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 449
;449:	VectorSubtract(attacker->r.currentOrigin, flag->r.currentOrigin, v2);
ADDRLP4 132
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 136
CNSTI4 368
ASGNI4
ADDRLP4 40
ADDRLP4 132
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144
CNSTI4 372
ASGNI4
ADDRLP4 40+4
ADDRLP4 132
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148
CNSTI4 376
ASGNI4
ADDRLP4 40+8
ADDRFP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 451
;450:
;451:	if ( ( ( VectorLength(v1) < CTF_TARGET_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 152
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 1148846080
GEF4 $297
ADDRLP4 156
CNSTI4 368
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $296
LABELV $297
ADDRLP4 40
ARGP4
ADDRLP4 164
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 164
INDIRF4
CNSTF4 1148846080
GEF4 $294
ADDRLP4 168
CNSTI4 368
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $294
LABELV $296
ADDRLP4 176
CNSTI4 408
ASGNI4
ADDRLP4 180
CNSTI4 1532
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
EQI4 $294
line 455
;452:		trap_InPVS(flag->r.currentOrigin, targ->r.currentOrigin ) ) ||
;453:		( VectorLength(v2) < CTF_TARGET_PROTECT_RADIUS &&
;454:		trap_InPVS(flag->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;455:		attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 458
;456:
;457:		// we defended the base flag
;458:		AddScore(attacker, targ->r.currentOrigin, CTF_FLAG_DEFENSE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 459
;459:		attacker->client->pers.teamState.basedefense++;
ADDRLP4 184
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1484
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 461
;460:
;461:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 463
;462:		// add the sprite over the player's head
;463:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 464
;464:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 465
;465:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 467
;466:
;467:		return;
ADDRGP4 $231
JUMPV
LABELV $294
line 470
;468:	}
;469:
;470:	if (carrier && carrier != attacker) {
ADDRLP4 184
ADDRLP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 184
INDIRU4
CNSTU4 0
EQU4 $299
ADDRLP4 184
INDIRU4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $299
line 471
;471:		VectorSubtract(targ->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
CNSTI4 368
ASGNI4
ADDRLP4 28
ADDRLP4 188
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200
CNSTI4 372
ASGNI4
ADDRLP4 28+4
ADDRLP4 188
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 204
CNSTI4 376
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 472
;472:		VectorSubtract(attacker->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 208
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 212
CNSTI4 368
ASGNI4
ADDRLP4 28
ADDRLP4 208
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 220
CNSTI4 372
ASGNI4
ADDRLP4 28+4
ADDRLP4 208
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 224
CNSTI4 376
ASGNI4
ADDRLP4 28+8
ADDRFP4 8
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 474
;473:
;474:		if ( ( ( VectorLength(v1) < CTF_ATTACKER_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 228
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 228
INDIRF4
CNSTF4 1148846080
GEF4 $308
ADDRLP4 232
CNSTI4 368
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
ARGP4
ADDRLP4 236
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
NEI4 $307
LABELV $308
ADDRLP4 40
ARGP4
ADDRLP4 240
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 240
INDIRF4
CNSTF4 1148846080
GEF4 $305
ADDRLP4 244
CNSTI4 368
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
ARGP4
ADDRLP4 248
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
EQI4 $305
LABELV $307
ADDRLP4 252
CNSTI4 408
ASGNI4
ADDRLP4 256
CNSTI4 1532
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
EQI4 $305
line 478
;475:			trap_InPVS(carrier->r.currentOrigin, targ->r.currentOrigin ) ) ||
;476:			( VectorLength(v2) < CTF_ATTACKER_PROTECT_RADIUS &&
;477:				trap_InPVS(carrier->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;478:			attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 479
;479:			AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 480
;480:			attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 260
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1488
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 482
;481:
;482:			attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 264
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 484
;483:			// add the sprite over the player's head
;484:			attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 268
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 485
;485:			attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 272
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 486
;486:			attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 488
;487:
;488:			return;
LABELV $305
line 490
;489:		}
;490:	}
LABELV $299
line 491
;491:}
LABELV $231
endproc Team_FragBonuses 276 12
export Team_CheckHurtCarrier
proc Team_CheckHurtCarrier 36 0
line 502
;492:
;493:/*
;494:================
;495:Team_CheckHurtCarrier
;496:
;497:Check to see if attacker hurt the flag carrier.  Needed when handing out bonuses for assistance to flag
;498:carrier defense.
;499:================
;500:*/
;501:void Team_CheckHurtCarrier(gentity_t *targ, gentity_t *attacker)
;502:{
line 505
;503:	int flag_pw;
;504:
;505:	if (!targ->client || !attacker->client)
ADDRLP4 4
CNSTI4 408
ASGNI4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $313
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $311
LABELV $313
line 506
;506:		return;
ADDRGP4 $310
JUMPV
LABELV $311
line 508
;507:
;508:	if (targ->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $314
line 509
;509:		flag_pw = PW_BLUEFLAG;
ADDRLP4 0
CNSTI4 5
ASGNI4
ADDRGP4 $315
JUMPV
LABELV $314
line 511
;510:	else
;511:		flag_pw = PW_REDFLAG;
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $315
line 514
;512:
;513:	// flags
;514:	if (targ->client->ps.powerups[flag_pw] &&
ADDRLP4 12
CNSTI4 408
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $316
ADDRLP4 20
CNSTI4 1532
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $316
line 516
;515:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;516:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
LABELV $316
line 519
;517:
;518:	// skulls
;519:	if (targ->client->ps.generic1 &&
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $319
ADDRLP4 32
CNSTI4 1532
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $319
line 521
;520:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;521:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
LABELV $319
line 522
;522:}
LABELV $310
endproc Team_CheckHurtCarrier 36 0
export Team_ResetFlag
proc Team_ResetFlag 20 12
line 525
;523:
;524:
;525:gentity_t *Team_ResetFlag( int team ) {
line 527
;526:	char *c;
;527:	gentity_t *ent, *rent = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 529
;528:
;529:	switch (team) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $327
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $325
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $326
ADDRGP4 $323
JUMPV
LABELV $325
line 531
;530:	case TEAM_RED:
;531:		c = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $273
ASGNP4
line 532
;532:		break;
ADDRGP4 $324
JUMPV
LABELV $326
line 534
;533:	case TEAM_BLUE:
;534:		c = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $275
ASGNP4
line 535
;535:		break;
ADDRGP4 $324
JUMPV
LABELV $327
line 537
;536:	case TEAM_FREE:
;537:		c = "team_CTF_neutralflag";
ADDRLP4 4
ADDRGP4 $328
ASGNP4
line 538
;538:		break;
ADDRGP4 $324
JUMPV
LABELV $323
line 540
;539:	default:
;540:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $322
JUMPV
LABELV $324
line 543
;541:	}
;542:
;543:	ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $330
JUMPV
LABELV $329
line 544
;544:	while ((ent = G_Find (ent, FOFS(classname), c)) != NULL) {
line 545
;545:		if (ent->flags & FL_DROPPED_ITEM)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $332
line 546
;546:			G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
ADDRGP4 $333
JUMPV
LABELV $332
line 547
;547:		else {
line 548
;548:			rent = ent;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 549
;549:			RespawnItem(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 550
;550:		}
LABELV $333
line 551
;551:	}
LABELV $330
line 544
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $329
line 553
;552:
;553:	Team_SetFlagStatus( team, FLAG_ATBASE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 555
;554:
;555:	return rent;
ADDRLP4 8
INDIRP4
RETP4
LABELV $322
endproc Team_ResetFlag 20 12
export Team_ResetFlags
proc Team_ResetFlags 0 4
line 558
;556:}
;557:
;558:void Team_ResetFlags( void ) {
line 559
;559:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $339
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $335
LABELV $339
line 560
;560:		Team_ResetFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 561
;561:		Team_ResetFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 562
;562:	}
LABELV $335
line 563
;563:}
LABELV $334
endproc Team_ResetFlags 0 4
export Team_ReturnFlagSound
proc Team_ReturnFlagSound 12 8
line 565
;564:
;565:void Team_ReturnFlagSound( gentity_t *ent, int team ) {
line 568
;566:	gentity_t	*te;
;567:
;568:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $341
line 569
;569:		G_Printf ("Warning:  NULL passed to Team_ReturnFlagSound\n");
ADDRGP4 $343
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 570
;570:		return;
ADDRGP4 $340
JUMPV
LABELV $341
line 573
;571:	}
;572:
;573:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 574
;574:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $344
line 575
;575:		te->s.eventParm = GTS_RED_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 2
ASGNI4
line 576
;576:	}
ADDRGP4 $345
JUMPV
LABELV $344
line 577
;577:	else {
line 578
;578:		te->s.eventParm = GTS_BLUE_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 3
ASGNI4
line 579
;579:	}
LABELV $345
line 580
;580:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 581
;581:}
LABELV $340
endproc Team_ReturnFlagSound 12 8
export Team_TakeFlagSound
proc Team_TakeFlagSound 16 8
line 583
;582:
;583:void Team_TakeFlagSound( gentity_t *ent, int team ) {
line 586
;584:	gentity_t	*te;
;585:
;586:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $347
line 587
;587:		G_Printf ("Warning:  NULL passed to Team_TakeFlagSound\n");
ADDRGP4 $349
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 588
;588:		return;
ADDRGP4 $346
JUMPV
LABELV $347
line 593
;589:	}
;590:
;591:	// only play sound when the flag was at the base
;592:	// or not picked up the last 10 seconds
;593:	switch(team) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $352
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $362
ADDRGP4 $350
JUMPV
LABELV $352
line 595
;594:		case TEAM_RED:
;595:			if( teamgame.blueStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+12
INDIRI4
CNSTI4 0
EQI4 $353
line 596
;596:				if (teamgame.blueTakenTime > level.time - 10000)
ADDRGP4 teamgame+24
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $356
line 597
;597:					return;
ADDRGP4 $346
JUMPV
LABELV $356
line 598
;598:			}
LABELV $353
line 599
;599:			teamgame.blueTakenTime = level.time;
ADDRGP4 teamgame+24
ADDRGP4 level+32
INDIRI4
ASGNI4
line 600
;600:			break;
ADDRGP4 $351
JUMPV
LABELV $362
line 603
;601:
;602:		case TEAM_BLUE:	// CTF
;603:			if( teamgame.redStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+8
INDIRI4
CNSTI4 0
EQI4 $363
line 604
;604:				if (teamgame.redTakenTime > level.time - 10000)
ADDRGP4 teamgame+20
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $366
line 605
;605:					return;
ADDRGP4 $346
JUMPV
LABELV $366
line 606
;606:			}
LABELV $363
line 607
;607:			teamgame.redTakenTime = level.time;
ADDRGP4 teamgame+20
ADDRGP4 level+32
INDIRI4
ASGNI4
line 608
;608:			break;
LABELV $350
LABELV $351
line 611
;609:	}
;610:
;611:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 612
;612:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $372
line 613
;613:		te->s.eventParm = GTS_RED_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 4
ASGNI4
line 614
;614:	}
ADDRGP4 $373
JUMPV
LABELV $372
line 615
;615:	else {
line 616
;616:		te->s.eventParm = GTS_BLUE_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 5
ASGNI4
line 617
;617:	}
LABELV $373
line 618
;618:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 619
;619:}
LABELV $346
endproc Team_TakeFlagSound 16 8
export Team_CaptureFlagSound
proc Team_CaptureFlagSound 12 8
line 621
;620:
;621:void Team_CaptureFlagSound( gentity_t *ent, int team ) {
line 624
;622:	gentity_t	*te;
;623:
;624:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $375
line 625
;625:		G_Printf ("Warning:  NULL passed to Team_CaptureFlagSound\n");
ADDRGP4 $377
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 626
;626:		return;
ADDRGP4 $374
JUMPV
LABELV $375
line 629
;627:	}
;628:
;629:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 630
;630:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $378
line 631
;631:		te->s.eventParm = GTS_BLUE_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 632
;632:	}
ADDRGP4 $379
JUMPV
LABELV $378
line 633
;633:	else {
line 634
;634:		te->s.eventParm = GTS_RED_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 635
;635:	}
LABELV $379
line 636
;636:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 637
;637:}
LABELV $374
endproc Team_CaptureFlagSound 12 8
export Team_ReturnFlag
proc Team_ReturnFlag 4 12
line 639
;638:
;639:void Team_ReturnFlag( int team ) {
line 640
;640:	Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 641
;641:	if( team == TEAM_FREE ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $381
line 643
;642:		//PrintMsg(NULL, "The flag has returned!\n" );
;643:	}
ADDRGP4 $382
JUMPV
LABELV $381
line 644
;644:	else { //flag should always have team in normal CTF
line 646
;645:		//PrintMsg(NULL, "The %s flag has returned!\n", TeamName(team));
;646:		PrintCTFMessage(-1, team, CTFMESSAGE_FLAG_RETURNED);
CNSTI4 -1
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 647
;647:	}
LABELV $382
line 648
;648:}
LABELV $380
endproc Team_ReturnFlag 4 12
export Team_FreeEntity
proc Team_FreeEntity 0 4
line 650
;649:
;650:void Team_FreeEntity( gentity_t *ent ) {
line 651
;651:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $384
line 652
;652:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 653
;653:	}
ADDRGP4 $385
JUMPV
LABELV $384
line 654
;654:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $386
line 655
;655:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 656
;656:	}
ADDRGP4 $387
JUMPV
LABELV $386
line 657
;657:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
NEI4 $388
line 658
;658:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 659
;659:	}
LABELV $388
LABELV $387
LABELV $385
line 660
;660:}
LABELV $383
endproc Team_FreeEntity 0 4
export Team_DroppedFlagThink
proc Team_DroppedFlagThink 8 8
line 671
;661:
;662:/*
;663:==============
;664:Team_DroppedFlagThink
;665:
;666:Automatically set in Launch_Item if the item is one of the flags
;667:
;668:Flags are unique in that if they are dropped, the base flag must be respawned when they time out
;669:==============
;670:*/
;671:void Team_DroppedFlagThink(gentity_t *ent) {
line 672
;672:	int		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 674
;673:
;674:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $391
line 675
;675:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 676
;676:	}
ADDRGP4 $392
JUMPV
LABELV $391
line 677
;677:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $393
line 678
;678:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 679
;679:	}
ADDRGP4 $394
JUMPV
LABELV $393
line 680
;680:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
NEI4 $395
line 681
;681:		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 682
;682:	}
LABELV $395
LABELV $394
LABELV $392
line 684
;683:
;684:	Team_ReturnFlagSound( Team_ResetFlag( team ), team );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 686
;685:	// Reset Flag will delete this entity
;686:}
LABELV $390
endproc Team_DroppedFlagThink 8 8
export Team_TouchOurFlag
proc Team_TouchOurFlag 56 12
line 694
;687:
;688:
;689:/*
;690:==============
;691:Team_DroppedFlagThink
;692:==============
;693:*/
;694:int Team_TouchOurFlag( gentity_t *ent, gentity_t *other, int team ) {
line 697
;695:	int			i;
;696:	gentity_t	*player;
;697:	gclient_t	*cl = other->client;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 700
;698:	int			enemy_flag;
;699:
;700:	if (cl->sess.sessionTeam == TEAM_RED) {
ADDRLP4 8
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $398
line 701
;701:		enemy_flag = PW_BLUEFLAG;
ADDRLP4 12
CNSTI4 5
ASGNI4
line 702
;702:	} else {
ADDRGP4 $399
JUMPV
LABELV $398
line 703
;703:		enemy_flag = PW_REDFLAG;
ADDRLP4 12
CNSTI4 4
ASGNI4
line 704
;704:	}
LABELV $399
line 706
;705:
;706:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $400
line 710
;707:		// hey, its not home.  return it by teleporting it back
;708:		//PrintMsg( NULL, "%s" S_COLOR_WHITE " returned the %s flag!\n", 
;709:		//	cl->pers.netname, TeamName(team));
;710:		PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_RETURNED_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 712
;711:
;712:		AddScore(other, ent->r.currentOrigin, CTF_RECOVERY_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 713
;713:		other->client->pers.teamState.flagrecovery++;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 714
;714:		other->client->pers.teamState.lastreturnedflag = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1508
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 716
;715:		//ResetFlag will remove this entity!  We must return zero
;716:		Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 717
;717:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $397
JUMPV
LABELV $400
line 722
;718:	}
;719:
;720:	// the flag is at home base.  if the player has the enemy
;721:	// flag, he's just won!
;722:	if (!cl->ps.powerups[enemy_flag])
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $403
line 723
;723:		return 0; // We don't have the flag
CNSTI4 0
RETI4
ADDRGP4 $397
JUMPV
LABELV $403
line 725
;724:	//PrintMsg( NULL, "%s" S_COLOR_WHITE " captured the %s flag!\n", cl->pers.netname, TeamName(OtherTeam(team)));
;725:	PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_CAPTURED_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 727
;726:
;727:	cl->ps.powerups[enemy_flag] = 0;
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 344
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 729
;728:
;729:	teamgame.last_flag_capture = level.time;
ADDRGP4 teamgame
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 730
;730:	teamgame.last_capture_team = team;
ADDRGP4 teamgame+4
ADDRFP4 8
INDIRI4
ASGNI4
line 733
;731:
;732:	// Increase the team's score
;733:	AddTeamScore(ent->s.pos.trBase, other->client->sess.sessionTeam, 1);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 737
;734://	Team_ForceGesture(other->client->sess.sessionTeam);
;735:	//rww - don't really want to do this now. Mainly because performing a gesture disables your upper torso animations until it's done and you can't fire
;736:
;737:	other->client->pers.teamState.captures++;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1480
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 739
;738:	// add the sprite over the player's head
;739:	other->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 740
;740:	other->client->ps.eFlags |= EF_AWARD_CAP;
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 741
;741:	other->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 742
;742:	other->client->ps.persistant[PERS_CAPTURES]++;
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 745
;743:
;744:	// other gets another 10 frag bonus
;745:	AddScore(other, ent->r.currentOrigin, CTF_CAPTURE_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 747
;746:
;747:	Team_CaptureFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_CaptureFlagSound
CALLV
pop
line 750
;748:
;749:	// Ok, let's do the player loop, hand out the bonuses
;750:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $411
JUMPV
LABELV $408
line 751
;751:		player = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 752
;752:		if (!player->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $413
line 753
;753:			continue;
ADDRGP4 $409
JUMPV
LABELV $413
line 755
;754:
;755:		if (player->client->sess.sessionTeam !=
ADDRLP4 32
CNSTI4 1532
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $415
line 756
;756:			cl->sess.sessionTeam) {
line 757
;757:			player->client->pers.teamState.lasthurtcarrier = -5;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
CNSTF4 3231711232
ASGNF4
line 758
;758:		} else if (player->client->sess.sessionTeam ==
ADDRGP4 $416
JUMPV
LABELV $415
ADDRLP4 36
CNSTI4 1532
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
NEI4 $417
line 759
;759:			cl->sess.sessionTeam) {
line 760
;760:			if (player != other)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $419
line 761
;761:				AddScore(player, ent->r.currentOrigin, CTF_TEAM_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 25
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $419
line 763
;762:			// award extra points for capture assists
;763:			if (player->client->pers.teamState.lastreturnedflag + 
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1508
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $421
line 764
;764:				CTF_RETURN_FLAG_ASSIST_TIMEOUT > level.time) {
line 765
;765:				AddScore (player, ent->r.currentOrigin, CTF_RETURN_FLAG_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 766
;766:				other->client->pers.teamState.assists++;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1500
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 768
;767:
;768:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 770
;769:				// add the sprite over the player's head
;770:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 48
ADDRLP4 0
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
CNSTI4 -231497
BANDI4
ASGNI4
line 771
;771:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 52
ADDRLP4 0
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
CNSTI4 131072
BORI4
ASGNI4
line 772
;772:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 774
;773:
;774:			} else if (player->client->pers.teamState.lastfraggedcarrier + 
ADDRGP4 $422
JUMPV
LABELV $421
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1516
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $425
line 775
;775:				CTF_FRAG_CARRIER_ASSIST_TIMEOUT > level.time) {
line 776
;776:				AddScore(player, ent->r.currentOrigin, CTF_FRAG_CARRIER_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 777
;777:				other->client->pers.teamState.assists++;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1500
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 778
;778:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 780
;779:				// add the sprite over the player's head
;780:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 48
ADDRLP4 0
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
CNSTI4 -231497
BANDI4
ASGNI4
line 781
;781:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 52
ADDRLP4 0
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
CNSTI4 131072
BORI4
ASGNI4
line 782
;782:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 783
;783:			}
LABELV $425
LABELV $422
line 784
;784:		}
LABELV $417
LABELV $416
line 785
;785:	}
LABELV $409
line 750
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $411
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $408
line 786
;786:	Team_ResetFlags();
ADDRGP4 Team_ResetFlags
CALLV
pop
line 788
;787:
;788:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 790
;789:
;790:	return 0; // Do not respawn this automatically
CNSTI4 0
RETI4
LABELV $397
endproc Team_TouchOurFlag 56 12
export Team_TouchEnemyFlag
proc Team_TouchEnemyFlag 4 12
line 793
;791:}
;792:
;793:int Team_TouchEnemyFlag( gentity_t *ent, gentity_t *other, int team ) {
line 794
;794:	gclient_t *cl = other->client;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 798
;795:
;796:	//PrintMsg (NULL, "%s" S_COLOR_WHITE " got the %s flag!\n",
;797:	//	other->client->pers.netname, TeamName(team));
;798:	PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_GOT_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 800
;799:
;800:	if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $430
line 801
;801:		cl->ps.powerups[PW_REDFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
CNSTI4 2147483647
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $430
line 803
;802:	else
;803:		cl->ps.powerups[PW_BLUEFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
CNSTI4 2147483647
ASGNI4
LABELV $431
line 805
;804:
;805:	Team_SetFlagStatus( team, FLAG_TAKEN );
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 807
;806:
;807:	AddScore(other, ent->r.currentOrigin, CTF_FLAG_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 808
;808:	cl->pers.teamState.flagsince = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1512
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 809
;809:	Team_TakeFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_TakeFlagSound
CALLV
pop
line 811
;810:
;811:	return -1; // Do not respawn this automatically, but do delete it if it was FL_DROPPED
CNSTI4 -1
RETI4
LABELV $429
endproc Team_TouchEnemyFlag 4 12
export Pickup_Team
proc Pickup_Team 24 12
line 814
;812:}
;813:
;814:int Pickup_Team( gentity_t *ent, gentity_t *other ) {
line 816
;815:	int team;
;816:	gclient_t *cl = other->client;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 819
;817:
;818:	// figure out what team this flag is
;819:	if( strcmp(ent->classname, "team_CTF_redflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $273
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $434
line 820
;820:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 821
;821:	}
ADDRGP4 $435
JUMPV
LABELV $434
line 822
;822:	else if( strcmp(ent->classname, "team_CTF_blueflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $436
line 823
;823:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 824
;824:	}
ADDRGP4 $437
JUMPV
LABELV $436
line 825
;825:	else if( strcmp(ent->classname, "team_CTF_neutralflag") == 0  ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $328
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $438
line 826
;826:		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 827
;827:	}
ADDRGP4 $439
JUMPV
LABELV $438
line 828
;828:	else {
line 830
;829://		PrintMsg ( other, "Don't know what team the flag is on.\n");
;830:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $433
JUMPV
LABELV $439
LABELV $437
LABELV $435
line 833
;831:	}
;832:	// GT_CTF
;833:	if( team == cl->sess.sessionTeam) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
NEI4 $440
line 834
;834:		return Team_TouchOurFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_TouchOurFlag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $433
JUMPV
LABELV $440
line 836
;835:	}
;836:	return Team_TouchEnemyFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_TouchEnemyFlag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
LABELV $433
endproc Pickup_Team 24 12
export Team_GetLocation
proc Team_GetLocation 48 8
line 847
;837:}
;838:
;839:/*
;840:===========
;841:Team_GetLocation
;842:
;843:Report a location for the player. Uses placed nearby target_location entities
;844:============
;845:*/
;846:gentity_t *Team_GetLocation(gentity_t *ent)
;847:{
line 852
;848:	gentity_t		*eloc, *best;
;849:	float			bestlen, len;
;850:	vec3_t			origin;
;851:
;852:	best = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 853
;853:	bestlen = 3*8192.0*8192.0;
ADDRLP4 20
CNSTF4 1296039936
ASGNF4
line 855
;854:
;855:	VectorCopy( ent->r.currentOrigin, origin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 857
;856:
;857:	for (eloc = level.locationHead; eloc; eloc = eloc->nextTrain) {
ADDRLP4 0
ADDRGP4 level+9052
INDIRP4
ASGNP4
ADDRGP4 $446
JUMPV
LABELV $443
line 858
;858:		len = ( origin[0] - eloc->r.currentOrigin[0] ) * ( origin[0] - eloc->r.currentOrigin[0] )
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 862
;859:			+ ( origin[1] - eloc->r.currentOrigin[1] ) * ( origin[1] - eloc->r.currentOrigin[1] )
;860:			+ ( origin[2] - eloc->r.currentOrigin[2] ) * ( origin[2] - eloc->r.currentOrigin[2] );
;861:
;862:		if ( len > bestlen ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
LEF4 $452
line 863
;863:			continue;
ADDRGP4 $444
JUMPV
LABELV $452
line 866
;864:		}
;865:
;866:		if ( !trap_InPVS( origin, eloc->r.currentOrigin ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $454
line 867
;867:			continue;
ADDRGP4 $444
JUMPV
LABELV $454
line 870
;868:		}
;869:
;870:		bestlen = len;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 871
;871:		best = eloc;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 872
;872:	}
LABELV $444
line 857
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
LABELV $446
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $443
line 874
;873:
;874:	return best;
ADDRLP4 24
INDIRP4
RETP4
LABELV $442
endproc Team_GetLocation 48 8
export Team_GetLocationMsg
proc Team_GetLocationMsg 12 24
line 886
;875:}
;876:
;877:
;878:/*
;879:===========
;880:Team_GetLocation
;881:
;882:Report a location for the player. Uses placed nearby target_location entities
;883:============
;884:*/
;885:qboolean Team_GetLocationMsg(gentity_t *ent, char *loc, int loclen)
;886:{
line 889
;887:	gentity_t *best;
;888:
;889:	best = Team_GetLocation( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 891
;890:	
;891:	if (!best)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $457
line 892
;892:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $456
JUMPV
LABELV $457
line 894
;893:
;894:	if (best->count) {
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $459
line 895
;895:		if (best->count < 0)
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
GEI4 $461
line 896
;896:			best->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 0
ASGNI4
LABELV $461
line 897
;897:		if (best->count > 7)
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 7
LEI4 $463
line 898
;898:			best->count = 7;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 7
ASGNI4
LABELV $463
line 899
;899:		Com_sprintf(loc, loclen, "%c%c%s" S_COLOR_WHITE, Q_COLOR_ESCAPE, best->count + '0', best->message );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $465
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 900
;900:	} else
ADDRGP4 $460
JUMPV
LABELV $459
line 901
;901:		Com_sprintf(loc, loclen, "%s", best->message);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $466
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $460
line 903
;902:
;903:	return qtrue;
CNSTI4 1
RETI4
LABELV $456
endproc Team_GetLocationMsg 12 24
export SelectRandomTeamSpawnPoint
proc SelectRandomTeamSpawnPoint 152 12
line 917
;904:}
;905:
;906:
;907:/*---------------------------------------------------------------------------*/
;908:
;909:/*
;910:================
;911:SelectRandomDeathmatchSpawnPoint
;912:
;913:go to a random point that doesn't telefrag
;914:================
;915:*/
;916:#define	MAX_TEAM_SPAWN_POINTS	32
;917:gentity_t *SelectRandomTeamSpawnPoint( int teamstate, team_t team ) {
line 924
;918:	gentity_t	*spot;
;919:	int			count;
;920:	int			selection;
;921:	gentity_t	*spots[MAX_TEAM_SPAWN_POINTS];
;922:	char		*classname;
;923:
;924:	if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $468
line 925
;925:	{
line 926
;926:		if (team == SAGATEAM_IMPERIAL)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $471
line 927
;927:		{
line 928
;928:			classname = "info_player_imperial";
ADDRLP4 8
ADDRGP4 $473
ASGNP4
line 929
;929:		}
ADDRGP4 $469
JUMPV
LABELV $471
line 931
;930:		else
;931:		{
line 932
;932:			classname = "info_player_rebel";
ADDRLP4 8
ADDRGP4 $474
ASGNP4
line 933
;933:		}
line 934
;934:	}
ADDRGP4 $469
JUMPV
LABELV $468
line 936
;935:	else
;936:	{
line 937
;937:		if (teamstate == TEAM_BEGIN) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $475
line 938
;938:			if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $477
line 939
;939:				classname = "team_CTF_redplayer";
ADDRLP4 8
ADDRGP4 $479
ASGNP4
ADDRGP4 $476
JUMPV
LABELV $477
line 940
;940:			else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $480
line 941
;941:				classname = "team_CTF_blueplayer";
ADDRLP4 8
ADDRGP4 $482
ASGNP4
ADDRGP4 $476
JUMPV
LABELV $480
line 943
;942:			else
;943:				return NULL;
CNSTP4 0
RETP4
ADDRGP4 $467
JUMPV
line 944
;944:		} else {
LABELV $475
line 945
;945:			if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $483
line 946
;946:				classname = "team_CTF_redspawn";
ADDRLP4 8
ADDRGP4 $485
ASGNP4
ADDRGP4 $484
JUMPV
LABELV $483
line 947
;947:			else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $486
line 948
;948:				classname = "team_CTF_bluespawn";
ADDRLP4 8
ADDRGP4 $488
ASGNP4
ADDRGP4 $487
JUMPV
LABELV $486
line 950
;949:			else
;950:				return NULL;
CNSTP4 0
RETP4
ADDRGP4 $467
JUMPV
LABELV $487
LABELV $484
line 951
;951:		}
LABELV $476
line 952
;952:	}
LABELV $469
line 953
;953:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 955
;954:
;955:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $490
JUMPV
LABELV $489
line 957
;956:
;957:	while ((spot = G_Find (spot, FOFS(classname), classname)) != NULL) {
line 958
;958:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $492
line 959
;959:			continue;
ADDRGP4 $490
JUMPV
LABELV $492
line 961
;960:		}
;961:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 962
;962:		if (++count == MAX_TEAM_SPAWN_POINTS)
ADDRLP4 148
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 32
NEI4 $494
line 963
;963:			break;
ADDRGP4 $491
JUMPV
LABELV $494
line 964
;964:	}
LABELV $490
line 957
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 144
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $489
LABELV $491
line 966
;965:
;966:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $496
line 967
;967:		return G_Find( NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 416
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
RETP4
ADDRGP4 $467
JUMPV
LABELV $496
line 970
;968:	}
;969:
;970:	selection = rand() % count;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 971
;971:	return spots[ selection ];
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
RETP4
LABELV $467
endproc SelectRandomTeamSpawnPoint 152 12
export SelectCTFSpawnPoint
proc SelectCTFSpawnPoint 12 12
line 981
;972:}
;973:
;974:
;975:/*
;976:===========
;977:SelectCTFSpawnPoint
;978:
;979:============
;980:*/
;981:gentity_t *SelectCTFSpawnPoint ( team_t team, int teamstate, vec3_t origin, vec3_t angles ) {
line 984
;982:	gentity_t	*spot;
;983:
;984:	spot = SelectRandomTeamSpawnPoint ( teamstate, team );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 986
;985:
;986:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $499
line 987
;987:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $498
JUMPV
LABELV $499
line 990
;988:	}
;989:
;990:	VectorCopy (spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 991
;991:	origin[2] += 9;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 992
;992:	VectorCopy (spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 994
;993:
;994:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $498
endproc SelectCTFSpawnPoint 12 12
export SelectSagaSpawnPoint
proc SelectSagaSpawnPoint 12 12
line 1003
;995:}
;996:
;997:/*
;998:===========
;999:SelectSagaSpawnPoint
;1000:
;1001:============
;1002:*/
;1003:gentity_t *SelectSagaSpawnPoint ( team_t team, int teamstate, vec3_t origin, vec3_t angles ) {
line 1006
;1004:	gentity_t	*spot;
;1005:
;1006:	spot = SelectRandomTeamSpawnPoint ( teamstate, team );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1008
;1007:
;1008:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $502
line 1009
;1009:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $501
JUMPV
LABELV $502
line 1012
;1010:	}
;1011:
;1012:	VectorCopy (spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1013
;1013:	origin[2] += 9;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 1014
;1014:	VectorCopy (spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1016
;1015:
;1016:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $501
endproc SelectSagaSpawnPoint 12 12
proc SortClients 0 0
line 1021
;1017:}
;1018:
;1019:/*---------------------------------------------------------------------------*/
;1020:
;1021:static int QDECL SortClients( const void *a, const void *b ) {
line 1022
;1022:	return *(int *)a - *(int *)b;
ADDRFP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
SUBI4
RETI4
LABELV $504
endproc SortClients 0 0
export TeamplayInfoMessage
proc TeamplayInfoMessage 9404 36
line 1035
;1023:}
;1024:
;1025:
;1026:/*
;1027:==================
;1028:TeamplayLocationsMessage
;1029:
;1030:Format:
;1031:	clientNum location health armor weapon powerups
;1032:
;1033:==================
;1034:*/
;1035:void TeamplayInfoMessage( gentity_t *ent ) {
line 1045
;1036:	char		entry[1024];
;1037:	char		string[8192];
;1038:	int			stringlength;
;1039:	int			i, j;
;1040:	gentity_t	*player;
;1041:	int			cnt;
;1042:	int			h, a;
;1043:	int			clients[TEAM_MAXOVERLAY];
;1044:
;1045:	if ( ! ent->client->pers.teamInfo )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $506
line 1046
;1046:		return;
ADDRGP4 $505
JUMPV
LABELV $506
line 1051
;1047:
;1048:	// figure out what client should be on the display
;1049:	// we are limited to 8, but we want to use the top eight players
;1050:	// but in client order (so they don't keep changing position on the overlay)
;1051:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9372
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRGP4 $511
JUMPV
LABELV $508
line 1052
;1052:		player = g_entities + level.sortedClients[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
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
line 1053
;1053:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $514
ADDRLP4 9380
CNSTI4 408
ASGNI4
ADDRLP4 9384
CNSTI4 1532
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
NEI4 $514
line 1054
;1054:			ent->client->sess.sessionTeam ) {
line 1055
;1055:			clients[cnt++] = level.sortedClients[i];
ADDRLP4 9388
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9388
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 9392
CNSTI4 2
ASGNI4
ADDRLP4 9388
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRLP4 9244
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 1056
;1056:		}
LABELV $514
line 1057
;1057:	}
LABELV $509
line 1051
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $511
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $517
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $508
LABELV $517
line 1060
;1058:
;1059:	// We have the top eight players, sort them by clientNum
;1060:	qsort( clients, cnt, sizeof( clients[0] ), SortClients );
ADDRLP4 9244
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortClients
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1063
;1061:
;1062:	// send the latest information on all clients
;1063:	string[0] = 0;
ADDRLP4 1052
CNSTI1 0
ASGNI1
line 1064
;1064:	stringlength = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 1066
;1065:
;1066:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9376
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRGP4 $521
JUMPV
LABELV $518
line 1067
;1067:		player = g_entities + i;
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1068
;1068:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $523
ADDRLP4 9384
CNSTI4 408
ASGNI4
ADDRLP4 9388
CNSTI4 1532
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
NEI4 $523
line 1069
;1069:			ent->client->sess.sessionTeam ) {
line 1071
;1070:
;1071:			h = player->client->ps.stats[STAT_HEALTH];
ADDRLP4 1036
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 1072
;1072:			a = player->client->ps.stats[STAT_ARMOR];
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 1073
;1073:			if (h < 0) h = 0;
ADDRLP4 1036
INDIRI4
CNSTI4 0
GEI4 $525
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $525
line 1074
;1074:			if (a < 0) a = 0;
ADDRLP4 1040
INDIRI4
CNSTI4 0
GEI4 $527
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $527
line 1076
;1075:
;1076:			Com_sprintf (entry, sizeof(entry),
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $529
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 9396
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9396
INDIRP4
CNSTI4 1476
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 9396
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1081
;1077:				" %i %i %i %i %i %i", 
;1078://				level.sortedClients[i], player->client->pers.teamState.location, h, a, 
;1079:				i, player->client->pers.teamState.location, h, a, 
;1080:				player->client->ps.weapon, player->s.powerups);
;1081:			j = strlen(entry);
ADDRLP4 12
ARGP4
ADDRLP4 9400
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 9400
INDIRI4
ASGNI4
line 1082
;1082:			if (stringlength + j > sizeof(string))
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
CVIU4 4
CNSTU4 8192
LEU4 $530
line 1083
;1083:				break;
ADDRGP4 $520
JUMPV
LABELV $530
line 1084
;1084:			strcpy (string + stringlength, entry);
ADDRLP4 1044
INDIRI4
ADDRLP4 1052
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1085
;1085:			stringlength += j;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
ASGNI4
line 1086
;1086:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1087
;1087:		}
LABELV $523
line 1088
;1088:	}
LABELV $519
line 1066
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $521
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $532
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $518
LABELV $532
LABELV $520
line 1090
;1089:
;1090:	trap_SendServerCommand( ent-g_entities, va("tinfo %i %s", cnt, string) );
ADDRGP4 $533
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRLP4 9380
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 9380
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1091
;1091:}
LABELV $505
endproc TeamplayInfoMessage 9404 36
export CheckTeamStatus
proc CheckTeamStatus 24 4
line 1093
;1092:
;1093:void CheckTeamStatus(void) {
line 1097
;1094:	int i;
;1095:	gentity_t *loc, *ent;
;1096:
;1097:	if (level.time - level.lastTeamLocationTime > TEAM_LOCATION_UPDATE_TIME) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+60
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $535
line 1099
;1098:
;1099:		level.lastTeamLocationTime = level.time;
ADDRGP4 level+60
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1101
;1100:
;1101:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $544
JUMPV
LABELV $541
line 1102
;1102:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1104
;1103:
;1104:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $546
line 1105
;1105:				continue;
ADDRGP4 $542
JUMPV
LABELV $546
line 1108
;1106:			}
;1107:
;1108:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $548
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $550
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $548
LABELV $550
line 1109
;1109:				loc = Team_GetLocation( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1110
;1110:				if (loc)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $551
line 1111
;1111:					ent->client->pers.teamState.location = loc->health;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1476
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $552
JUMPV
LABELV $551
line 1113
;1112:				else
;1113:					ent->client->pers.teamState.location = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1476
ADDP4
CNSTI4 0
ASGNI4
LABELV $552
line 1114
;1114:			}
LABELV $548
line 1115
;1115:		}
LABELV $542
line 1101
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $544
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $541
line 1117
;1116:
;1117:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $556
JUMPV
LABELV $553
line 1118
;1118:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1120
;1119:
;1120:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $558
line 1121
;1121:				continue;
ADDRGP4 $554
JUMPV
LABELV $558
line 1124
;1122:			}
;1123:
;1124:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $560
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $562
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $560
LABELV $562
line 1125
;1125:				TeamplayInfoMessage( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 TeamplayInfoMessage
CALLV
pop
line 1126
;1126:			}
LABELV $560
line 1127
;1127:		}
LABELV $554
line 1117
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $556
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $553
line 1128
;1128:	}
LABELV $535
line 1129
;1129:}
LABELV $534
endproc CheckTeamStatus 24 4
export SP_team_CTF_redplayer
proc SP_team_CTF_redplayer 0 0
line 1136
;1130:
;1131:/*-----------------------------------------------------------------*/
;1132:
;1133:/*QUAKED team_CTF_redplayer (1 0 0) (-16 -16 -16) (16 16 32)
;1134:Only in CTF games.  Red players spawn here at game start.
;1135:*/
;1136:void SP_team_CTF_redplayer( gentity_t *ent ) {
line 1137
;1137:}
LABELV $563
endproc SP_team_CTF_redplayer 0 0
export SP_team_CTF_blueplayer
proc SP_team_CTF_blueplayer 0 0
line 1143
;1138:
;1139:
;1140:/*QUAKED team_CTF_blueplayer (0 0 1) (-16 -16 -16) (16 16 32)
;1141:Only in CTF games.  Blue players spawn here at game start.
;1142:*/
;1143:void SP_team_CTF_blueplayer( gentity_t *ent ) {
line 1144
;1144:}
LABELV $564
endproc SP_team_CTF_blueplayer 0 0
export SP_team_CTF_redspawn
proc SP_team_CTF_redspawn 0 0
line 1151
;1145:
;1146:
;1147:/*QUAKED team_CTF_redspawn (1 0 0) (-16 -16 -24) (16 16 32)
;1148:potential spawning position for red team in CTF games.
;1149:Targets will be fired when someone spawns in on them.
;1150:*/
;1151:void SP_team_CTF_redspawn(gentity_t *ent) {
line 1152
;1152:}
LABELV $565
endproc SP_team_CTF_redspawn 0 0
export SP_team_CTF_bluespawn
proc SP_team_CTF_bluespawn 0 0
line 1158
;1153:
;1154:/*QUAKED team_CTF_bluespawn (0 0 1) (-16 -16 -24) (16 16 32)
;1155:potential spawning position for blue team in CTF games.
;1156:Targets will be fired when someone spawns in on them.
;1157:*/
;1158:void SP_team_CTF_bluespawn(gentity_t *ent) {
line 1159
;1159:}
LABELV $566
endproc SP_team_CTF_bluespawn 0 0
bss
export teamgame
align 4
LABELV teamgame
skip 28
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
import G_RunClient
import ClientEndFrame
import ClientThink
import G_CheckClientTimeouts
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
LABELV $533
char 1 116
char 1 105
char 1 110
char 1 102
char 1 111
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $529
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $488
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $485
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 114
char 1 101
char 1 100
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $482
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $479
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 114
char 1 101
char 1 100
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $474
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
char 1 114
char 1 101
char 1 98
char 1 101
char 1 108
char 1 0
align 1
LABELV $473
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
char 1 105
char 1 109
char 1 112
char 1 101
char 1 114
char 1 105
char 1 97
char 1 108
char 1 0
align 1
LABELV $466
char 1 37
char 1 115
char 1 0
align 1
LABELV $465
char 1 37
char 1 99
char 1 37
char 1 99
char 1 37
char 1 115
char 1 94
char 1 55
char 1 0
align 1
LABELV $377
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 112
char 1 97
char 1 115
char 1 115
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 70
char 1 108
char 1 97
char 1 103
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 10
char 1 0
align 1
LABELV $349
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 112
char 1 97
char 1 115
char 1 115
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 95
char 1 84
char 1 97
char 1 107
char 1 101
char 1 70
char 1 108
char 1 97
char 1 103
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 10
char 1 0
align 1
LABELV $343
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 112
char 1 97
char 1 115
char 1 115
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 95
char 1 82
char 1 101
char 1 116
char 1 117
char 1 114
char 1 110
char 1 70
char 1 108
char 1 97
char 1 103
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 10
char 1 0
align 1
LABELV $328
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 110
char 1 101
char 1 117
char 1 116
char 1 114
char 1 97
char 1 108
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $275
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $273
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 114
char 1 101
char 1 100
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $118
char 1 94
char 1 55
char 1 0
align 1
LABELV $117
char 1 94
char 1 51
char 1 0
align 1
LABELV $114
char 1 94
char 1 52
char 1 0
align 1
LABELV $111
char 1 94
char 1 49
char 1 0
align 1
LABELV $100
char 1 70
char 1 82
char 1 69
char 1 69
char 1 0
align 1
LABELV $99
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
LABELV $96
char 1 66
char 1 76
char 1 85
char 1 69
char 1 0
align 1
LABELV $93
char 1 82
char 1 69
char 1 68
char 1 0
