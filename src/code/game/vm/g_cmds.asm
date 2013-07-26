export DeathmatchScoreboardMessage
code
proc DeathmatchScoreboardMessage 2484 68
file "../g_cmds.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#include "../../ui/menudef.h"			// for the voice chats
;6:
;7://rww - for getting bot commands...
;8:int AcceptBotCommand(char *cmd, gentity_t *pl);
;9://end rww
;10:
;11:void BG_CycleInven(playerState_t *ps, int direction);
;12:void BG_CycleForce(playerState_t *ps, int direction);
;13:
;14:/*
;15:==================
;16:DeathmatchScoreboardMessage
;17:
;18:==================
;19:*/
;20:void DeathmatchScoreboardMessage( gentity_t *ent ) {
line 29
;21:	char		entry[1024];
;22:	char		string[1400];
;23:	int			stringlength;
;24:	int			i, j;
;25:	gclient_t	*cl;
;26:	int			numSorted, scoreFlags, accuracy, perfect;
;27:
;28:	// send the latest information on all clients
;29:	string[0] = 0;
ADDRLP4 1052
CNSTI1 0
ASGNI1
line 30
;30:	stringlength = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 31
;31:	scoreFlags = 0;
ADDRLP4 2452
CNSTI4 0
ASGNI4
line 33
;32:
;33:	numSorted = level.numConnectedClients;
ADDRLP4 1048
ADDRGP4 level+72
INDIRI4
ASGNI4
line 35
;34:	
;35:	if (numSorted > MAX_CLIENT_SCORE_SEND)
ADDRLP4 1048
INDIRI4
CNSTI4 20
LEI4 $80
line 36
;36:	{
line 37
;37:		numSorted = MAX_CLIENT_SCORE_SEND;
ADDRLP4 1048
CNSTI4 20
ASGNI4
line 38
;38:	}
LABELV $80
line 40
;39:
;40:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $82
line 43
;41:		int		ping;
;42:
;43:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 1800
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 45
;44:
;45:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 1
NEI4 $87
line 46
;46:			ping = -1;
ADDRLP4 2456
CNSTI4 -1
ASGNI4
line 47
;47:		} else {
ADDRGP4 $88
JUMPV
LABELV $87
line 48
;48:			ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 999
GEI4 $90
ADDRLP4 2460
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $91
JUMPV
LABELV $90
ADDRLP4 2460
CNSTI4 999
ASGNI4
LABELV $91
ADDRLP4 2456
ADDRLP4 2460
INDIRI4
ASGNI4
line 49
;49:		}
LABELV $88
line 51
;50:
;51:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 1664
ADDP4
INDIRI4
CNSTI4 0
EQI4 $92
line 52
;52:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1040
CNSTI4 100
ADDRLP4 0
INDIRP4
CNSTI4 1668
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 1664
ADDP4
INDIRI4
DIVI4
ASGNI4
line 53
;53:		}
ADDRGP4 $93
JUMPV
LABELV $92
line 54
;54:		else {
line 55
;55:			accuracy = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 56
;56:		}
LABELV $93
line 57
;57:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
ADDRLP4 2468
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $95
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $95
ADDRLP4 2460
CNSTI4 1
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $95
ADDRLP4 2460
CNSTI4 0
ASGNI4
LABELV $96
ADDRLP4 1044
ADDRLP4 2460
INDIRI4
ASGNI4
line 59
;58:
;59:		Com_sprintf (entry, sizeof(entry),
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $97
ARGP4
ADDRLP4 2472
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2472
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 2456
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1468
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 2452
INDIRI4
ARGI4
CNSTI4 828
ADDRLP4 2472
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+272
ADDP4
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 70
;60:			" %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i],
;61:			cl->ps.persistant[PERS_SCORE], ping, (level.time - cl->pers.enterTime)/60000,
;62:			scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy, 
;63:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;64:			cl->ps.persistant[PERS_EXCELLENT_COUNT],
;65:			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
;66:			cl->ps.persistant[PERS_DEFEND_COUNT], 
;67:			cl->ps.persistant[PERS_ASSIST_COUNT], 
;68:			perfect,
;69:			cl->ps.persistant[PERS_CAPTURES]);
;70:		j = strlen(entry);
ADDRLP4 8
ARGP4
ADDRLP4 2480
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 2480
INDIRI4
ASGNI4
line 71
;71:		if (stringlength + j > 1022)
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
CNSTI4 1022
LEI4 $102
line 72
;72:			break;
ADDRGP4 $84
JUMPV
LABELV $102
line 73
;73:		strcpy (string + stringlength, entry);
ADDRLP4 1032
INDIRI4
ADDRLP4 1052
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 74
;74:		stringlength += j;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 75
;75:	}
LABELV $83
line 40
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $85
ADDRLP4 4
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $82
LABELV $84
line 78
;76:
;77:	//still want to know the total # of clients
;78:	i = level.numConnectedClients;
ADDRLP4 4
ADDRGP4 level+72
INDIRI4
ASGNI4
line 80
;79:
;80:	trap_SendServerCommand( ent-g_entities, va("scores %i %i %i%s", i, 
ADDRGP4 $105
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+44+4
INDIRI4
ARGI4
ADDRGP4 level+44+8
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRLP4 2456
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
ADDRLP4 2456
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 83
;81:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
;82:		string ) );
;83:}
LABELV $78
endproc DeathmatchScoreboardMessage 2484 68
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 93
;84:
;85:
;86:/*
;87:==================
;88:Cmd_Score_f
;89:
;90:Request current scoreboard information
;91:==================
;92:*/
;93:void Cmd_Score_f( gentity_t *ent ) {
line 94
;94:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 95
;95:}
LABELV $110
endproc Cmd_Score_f 0 4
export CheatsOk
proc CheatsOk 8 8
line 104
;96:
;97:
;98:
;99:/*
;100:==================
;101:CheatsOk
;102:==================
;103:*/
;104:qboolean	CheatsOk( gentity_t *ent ) {
line 105
;105:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $112
line 106
;106:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOCHEATS")));
ADDRGP4 $116
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 107
;107:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $111
JUMPV
LABELV $112
line 109
;108:	}
;109:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $118
line 110
;110:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MUSTBEALIVE")));
ADDRGP4 $116
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 111
;111:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $111
JUMPV
LABELV $118
line 113
;112:	}
;113:	return qtrue;
CNSTI4 1
RETI4
LABELV $111
endproc CheatsOk 8 8
bss
align 1
LABELV $122
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 122
;114:}
;115:
;116:
;117:/*
;118:==================
;119:ConcatArgs
;120:==================
;121:*/
;122:char	*ConcatArgs( int start ) {
line 128
;123:	int		i, c, tlen;
;124:	static char	line[MAX_STRING_CHARS];
;125:	int		len;
;126:	char	arg[MAX_STRING_CHARS];
;127:
;128:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 129
;129:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 130
;130:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $123
line 131
;131:		trap_Argv( i, arg, sizeof( arg ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 132
;132:		tlen = strlen( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1044
INDIRI4
ASGNI4
line 133
;133:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $127
line 134
;134:			break;
ADDRGP4 $125
JUMPV
LABELV $127
line 136
;135:		}
;136:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $122
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 137
;137:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 138
;138:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $129
line 139
;139:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $122
ADDP4
CNSTI1 32
ASGNI1
line 140
;140:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 141
;141:		}
LABELV $129
line 142
;142:	}
LABELV $124
line 130
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $126
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $123
LABELV $125
line 144
;143:
;144:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $122
ADDP4
CNSTI1 0
ASGNI1
line 146
;145:
;146:	return line;
ADDRGP4 $122
RETP4
LABELV $121
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 16 4
line 156
;147:}
;148:
;149:/*
;150:==================
;151:SanitizeString
;152:
;153:Remove case and control characters
;154:==================
;155:*/
;156:void SanitizeString( char *in, char *out ) {
ADDRGP4 $133
JUMPV
LABELV $132
line 157
;157:	while ( *in ) {
line 158
;158:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $135
line 159
;159:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 160
;160:			continue;
ADDRGP4 $133
JUMPV
LABELV $135
line 162
;161:		}
;162:		if ( *in < 32 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $137
line 163
;163:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 164
;164:			continue;
ADDRGP4 $133
JUMPV
LABELV $137
line 166
;165:		}
;166:		*out++ = tolower( *in++ );
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 167
;167:	}
LABELV $133
line 157
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $132
line 169
;168:
;169:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 170
;170:}
LABELV $131
endproc SanitizeString 16 4
export ClientNumberFromString
proc ClientNumberFromString 2072 8
line 180
;171:
;172:/*
;173:==================
;174:ClientNumberFromString
;175:
;176:Returns a player number for either a number or name string
;177:Returns -1 if invalid
;178:==================
;179:*/
;180:int ClientNumberFromString( gentity_t *to, char *s ) {
line 187
;181:	gclient_t	*cl;
;182:	int			idnum;
;183:	char		s2[MAX_STRING_CHARS];
;184:	char		n2[MAX_STRING_CHARS];
;185:
;186:	// numeric values are just slot numbers
;187:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $140
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $140
line 188
;188:		idnum = atoi( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRI4
ASGNI4
line 189
;189:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $145
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $142
LABELV $145
line 190
;190:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $146
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2068
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
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 191
;191:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $139
JUMPV
LABELV $142
line 194
;192:		}
;193:
;194:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 1800
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 195
;195:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $147
line 196
;196:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $149
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2068
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
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 197
;197:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $139
JUMPV
LABELV $147
line 199
;198:		}
;199:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $139
JUMPV
LABELV $140
line 203
;200:	}
;201:
;202:	// check for a name match
;203:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 204
;204:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $153
JUMPV
LABELV $150
line 205
;205:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $155
line 206
;206:			continue;
ADDRGP4 $151
JUMPV
LABELV $155
line 208
;207:		}
;208:		SanitizeString( cl->pers.netname, n2 );
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 209
;209:		if ( !strcmp( n2, s2 ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $157
line 210
;210:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $139
JUMPV
LABELV $157
line 212
;211:		}
;212:	}
LABELV $151
line 204
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
ASGNP4
LABELV $153
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $150
line 214
;213:
;214:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $159
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
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
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 215
;215:	return -1;
CNSTI4 -1
RETI4
LABELV $139
endproc ClientNumberFromString 2072 8
export Cmd_Give_f
proc Cmd_Give_f 3200 12
line 226
;216:}
;217:
;218:/*
;219:==================
;220:Cmd_Give_f
;221:
;222:Give items to a client
;223:==================
;224:*/
;225:void Cmd_Give_f (gentity_t *ent)
;226:{
line 235
;227:	char		name[MAX_TOKEN_CHARS];
;228:	gitem_t		*it;
;229:	int			i;
;230:	qboolean	give_all;
;231:	gentity_t		*it_ent;
;232:	trace_t		trace;
;233:	char		arg[MAX_TOKEN_CHARS];
;234:
;235:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 3144
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 3144
INDIRI4
CNSTI4 0
NEI4 $161
line 236
;236:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 239
;237:	}
;238:
;239:	trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 241
;240:
;241:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 3148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3148
INDIRI4
CNSTI4 0
NEI4 $163
line 242
;242:		give_all = qtrue;
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $163
line 244
;243:	else
;244:		give_all = qfalse;
ADDRLP4 1028
CNSTI4 0
ASGNI4
LABELV $164
line 246
;245:
;246:	if (give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $166
line 247
;247:	{
line 248
;248:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $168
line 250
;249:		while (i < HI_NUM_HOLDABLE)
;250:		{
line 251
;251:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] |= (1 << i);
ADDRLP4 3152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 3152
INDIRP4
ADDRLP4 3152
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 252
;252:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 253
;253:		}
LABELV $169
line 249
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $168
line 254
;254:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 255
;255:	}
LABELV $166
line 257
;256:
;257:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $174
ADDRLP4 4
ARGP4
ADDRGP4 $173
ARGP4
ADDRLP4 3152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3152
INDIRI4
CNSTI4 0
NEI4 $171
LABELV $174
line 258
;258:	{
line 259
;259:		if (trap_Argc() == 3) {
ADDRLP4 3156
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 3156
INDIRI4
CNSTI4 3
NEI4 $175
line 260
;260:			trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 261
;261:			ent->health = atoi(arg);
ADDRLP4 1036
ARGP4
ADDRLP4 3160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 3160
INDIRI4
ASGNI4
line 262
;262:			if (ent->health > ent->client->ps.stats[STAT_MAX_HEALTH]) {
ADDRLP4 3164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3164
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 3164
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $176
line 263
;263:				ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 3168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3168
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 3168
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 264
;264:			}
line 265
;265:		}
ADDRGP4 $176
JUMPV
LABELV $175
line 266
;266:		else {
line 267
;267:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 3160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3160
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 3160
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 268
;268:		}
LABELV $176
line 269
;269:		if (!give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $179
line 270
;270:			return;
ADDRGP4 $160
JUMPV
LABELV $179
line 271
;271:	}
LABELV $171
line 273
;272:
;273:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $184
ADDRLP4 4
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 3156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3156
INDIRI4
CNSTI4 0
NEI4 $181
LABELV $184
line 274
;274:	{
line 275
;275:		ent->client->ps.stats[STAT_WEAPONS] = (1 << (WP_DET_PACK+1))  - ( 1 << WP_NONE );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 16383
ASGNI4
line 276
;276:		if (!give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $185
line 277
;277:			return;
ADDRGP4 $160
JUMPV
LABELV $185
line 278
;278:	}
LABELV $181
line 280
;279:	
;280:	if ( !give_all && Q_stricmp(name, "weaponnum") == 0 )
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $187
ADDRLP4 4
ARGP4
ADDRGP4 $189
ARGP4
ADDRLP4 3160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3160
INDIRI4
CNSTI4 0
NEI4 $187
line 281
;281:	{
line 282
;282:		trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 283
;283:		ent->client->ps.stats[STAT_WEAPONS] |= (1 << atoi(arg));
ADDRLP4 1036
ARGP4
ADDRLP4 3164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3168
INDIRP4
ADDRLP4 3168
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 3164
INDIRI4
LSHI4
BORI4
ASGNI4
line 284
;284:		return;
ADDRGP4 $160
JUMPV
LABELV $187
line 287
;285:	}
;286:
;287:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $193
ADDRLP4 4
ARGP4
ADDRGP4 $192
ARGP4
ADDRLP4 3164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3164
INDIRI4
CNSTI4 0
NEI4 $190
LABELV $193
line 288
;288:	{
line 289
;289:		int num = 999;
ADDRLP4 3168
CNSTI4 999
ASGNI4
line 290
;290:		if (trap_Argc() == 3) {
ADDRLP4 3172
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 3172
INDIRI4
CNSTI4 3
NEI4 $194
line 291
;291:			trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 292
;292:			num = atoi(arg);
ADDRLP4 1036
ARGP4
ADDRLP4 3176
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3168
ADDRLP4 3176
INDIRI4
ASGNI4
line 293
;293:		}
LABELV $194
line 294
;294:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $196
line 295
;295:			ent->client->ps.ammo[i] = num;
ADDRLP4 3176
CNSTI4 408
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 3176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 3176
INDIRI4
ADDP4
ADDP4
ADDRLP4 3168
INDIRI4
ASGNI4
line 296
;296:		}
LABELV $197
line 294
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $196
line 297
;297:		if (!give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $200
line 298
;298:			return;
ADDRGP4 $160
JUMPV
LABELV $200
line 299
;299:	}
LABELV $190
line 301
;300:
;301:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $205
ADDRLP4 4
ARGP4
ADDRGP4 $204
ARGP4
ADDRLP4 3168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3168
INDIRI4
CNSTI4 0
NEI4 $202
LABELV $205
line 302
;302:	{
line 303
;303:		if (trap_Argc() == 3) {
ADDRLP4 3172
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 3172
INDIRI4
CNSTI4 3
NEI4 $206
line 304
;304:			trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 305
;305:			ent->client->ps.stats[STAT_ARMOR] = atoi(arg);
ADDRLP4 1036
ARGP4
ADDRLP4 3176
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 3176
INDIRI4
ASGNI4
line 306
;306:		} else {
ADDRGP4 $207
JUMPV
LABELV $206
line 307
;307:			ent->client->ps.stats[STAT_ARMOR] = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 3176
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 3176
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 3176
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 308
;308:		}
LABELV $207
line 310
;309:
;310:		if (!give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $208
line 311
;311:			return;
ADDRGP4 $160
JUMPV
LABELV $208
line 312
;312:	}
LABELV $202
line 314
;313:
;314:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 3172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3172
INDIRI4
CNSTI4 0
NEI4 $210
line 315
;315:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 3176
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRLP4 3176
INDIRP4
ADDRLP4 3176
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 316
;316:		return;
ADDRGP4 $160
JUMPV
LABELV $210
line 318
;317:	}
;318:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 3176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3176
INDIRI4
CNSTI4 0
NEI4 $213
line 319
;319:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 3180
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 316
ADDP4
ASGNP4
ADDRLP4 3180
INDIRP4
ADDRLP4 3180
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 320
;320:		return;
ADDRGP4 $160
JUMPV
LABELV $213
line 322
;321:	}
;322:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $218
ARGP4
ADDRLP4 3180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3180
INDIRI4
CNSTI4 0
NEI4 $216
line 323
;323:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 3184
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 332
ADDP4
ASGNP4
ADDRLP4 3184
INDIRP4
ADDRLP4 3184
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 324
;324:		return;
ADDRGP4 $160
JUMPV
LABELV $216
line 326
;325:	}
;326:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $221
ARGP4
ADDRLP4 3184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3184
INDIRI4
CNSTI4 0
NEI4 $219
line 327
;327:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 3188
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 3188
INDIRP4
ADDRLP4 3188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 328
;328:		return;
ADDRGP4 $160
JUMPV
LABELV $219
line 330
;329:	}
;330:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $224
ARGP4
ADDRLP4 3188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3188
INDIRI4
CNSTI4 0
NEI4 $222
line 331
;331:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 3192
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 3192
INDIRP4
ADDRLP4 3192
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 332
;332:		return;
ADDRGP4 $160
JUMPV
LABELV $222
line 336
;333:	}
;334:
;335:	// spawn a specific item right on the player
;336:	if ( !give_all ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $225
line 337
;337:		it = BG_FindItem (name);
ADDRLP4 4
ARGP4
ADDRLP4 3192
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 2060
ADDRLP4 3192
INDIRP4
ASGNP4
line 338
;338:		if (!it) {
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $227
line 339
;339:			return;
ADDRGP4 $160
JUMPV
LABELV $227
line 342
;340:		}
;341:
;342:		it_ent = G_Spawn();
ADDRLP4 3196
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 3196
INDIRP4
ASGNP4
line 343
;343:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
ADDRLP4 1032
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 344
;344:		it_ent->classname = it->classname;
ADDRLP4 1032
INDIRP4
CNSTI4 416
ADDP4
ADDRLP4 2060
INDIRP4
INDIRP4
ASGNP4
line 345
;345:		G_SpawnItem (it_ent, it);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 346
;346:		FinishSpawningItem(it_ent );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 347
;347:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 2064
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 348
;348:		Touch_Item (it_ent, ent, &trace);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2064
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 349
;349:		if (it_ent->inuse) {
ADDRLP4 1032
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $229
line 350
;350:			G_FreeEntity( it_ent );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 351
;351:		}
LABELV $229
line 352
;352:	}
LABELV $225
line 353
;353:}
LABELV $160
endproc Cmd_Give_f 3200 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 366
;354:
;355:
;356:/*
;357:==================
;358:Cmd_God_f
;359:
;360:Sets client to godmode
;361:
;362:argv(0) god
;363:==================
;364:*/
;365:void Cmd_God_f (gentity_t *ent)
;366:{
line 369
;367:	char	*msg;
;368:
;369:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $232
line 370
;370:		return;
ADDRGP4 $231
JUMPV
LABELV $232
line 373
;371:	}
;372:
;373:	ent->flags ^= FL_GODMODE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 374
;374:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $234
line 375
;375:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $236
ASGNP4
ADDRGP4 $235
JUMPV
LABELV $234
line 377
;376:	else
;377:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $237
ASGNP4
LABELV $235
line 379
;378:
;379:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $238
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 380
;380:}
LABELV $231
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 392
;381:
;382:
;383:/*
;384:==================
;385:Cmd_Notarget_f
;386:
;387:Sets client to notarget
;388:
;389:argv(0) notarget
;390:==================
;391:*/
;392:void Cmd_Notarget_f( gentity_t *ent ) {
line 395
;393:	char	*msg;
;394:
;395:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $240
line 396
;396:		return;
ADDRGP4 $239
JUMPV
LABELV $240
line 399
;397:	}
;398:
;399:	ent->flags ^= FL_NOTARGET;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 400
;400:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $242
line 401
;401:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $244
ASGNP4
ADDRGP4 $243
JUMPV
LABELV $242
line 403
;402:	else
;403:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $245
ASGNP4
LABELV $243
line 405
;404:
;405:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $238
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 406
;406:}
LABELV $239
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 416
;407:
;408:
;409:/*
;410:==================
;411:Cmd_Noclip_f
;412:
;413:argv(0) noclip
;414:==================
;415:*/
;416:void Cmd_Noclip_f( gentity_t *ent ) {
line 419
;417:	char	*msg;
;418:
;419:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $247
line 420
;420:		return;
ADDRGP4 $246
JUMPV
LABELV $247
line 423
;421:	}
;422:
;423:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $249
line 424
;424:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $251
ASGNP4
line 425
;425:	} else {
ADDRGP4 $250
JUMPV
LABELV $249
line 426
;426:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $252
ASGNP4
line 427
;427:	}
LABELV $250
line 428
;428:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1588
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $254
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $254
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $255
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 430
;429:
;430:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $238
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
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
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 431
;431:}
LABELV $246
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 444
;432:
;433:
;434:/*
;435:==================
;436:Cmd_LevelShot_f
;437:
;438:This is just to help generate the level pictures
;439:for the menus.  It goes to the intermission immediately
;440:and sends over a command to the client to resize the view,
;441:hide the scoreboard, and take a special screenshot
;442:==================
;443:*/
;444:void Cmd_LevelShot_f( gentity_t *ent ) {
line 445
;445:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $257
line 446
;446:		return;
ADDRGP4 $256
JUMPV
LABELV $257
line 450
;447:	}
;448:
;449:	// doesn't work in single player
;450:	if ( g_gametype.integer != 0 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $259
line 451
;451:		trap_SendServerCommand( ent-g_entities, 
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
ADDRGP4 $262
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 453
;452:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;453:		return;
ADDRGP4 $256
JUMPV
LABELV $259
line 456
;454:	}
;455:
;456:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 457
;457:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
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
ADDRGP4 $263
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 458
;458:}
LABELV $256
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 471
;459:
;460:
;461:/*
;462:==================
;463:Cmd_LevelShot_f
;464:
;465:This is just to help generate the level pictures
;466:for the menus.  It goes to the intermission immediately
;467:and sends over a command to the client to resize the view,
;468:hide the scoreboard, and take a special screenshot
;469:==================
;470:*/
;471:void Cmd_TeamTask_f( gentity_t *ent ) {
line 475
;472:	char userinfo[MAX_INFO_STRING];
;473:	char		arg[MAX_TOKEN_CHARS];
;474:	int task;
;475:	int client = ent->client - level.clients;
ADDRLP4 1024
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
ASGNI4
line 477
;476:
;477:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $265
line 478
;478:		return;
ADDRGP4 $264
JUMPV
LABELV $265
line 480
;479:	}
;480:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 481
;481:	task = atoi( arg );
ADDRLP4 1028
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
ASGNI4
line 483
;482:
;483:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 484
;484:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $268
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 485
;485:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 486
;486:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 487
;487:}
LABELV $264
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 496
;488:
;489:
;490:
;491:/*
;492:=================
;493:Cmd_Kill_f
;494:=================
;495:*/
;496:void Cmd_Kill_f( gentity_t *ent ) {
line 497
;497:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $270
line 498
;498:		return;
ADDRGP4 $269
JUMPV
LABELV $270
line 500
;499:	}
;500:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $272
line 501
;501:		return;
ADDRGP4 $269
JUMPV
LABELV $272
line 504
;502:	}
;503:
;504:	if (g_gametype.integer == GT_TOURNAMENT && level.numPlayingClients > 1 && !level.warmupTime)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $274
ADDRGP4 level+80
INDIRI4
CNSTI4 1
LEI4 $274
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $274
line 505
;505:	{
line 506
;506:		if (!g_allowDuelSuicide.integer)
ADDRGP4 g_allowDuelSuicide+12
INDIRI4
CNSTI4 0
NEI4 $279
line 507
;507:		{
line 508
;508:			trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "ATTEMPTDUELKILL")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 509
;509:			return;
ADDRGP4 $269
JUMPV
LABELV $279
line 511
;510:		}
;511:	}
LABELV $274
line 513
;512:
;513:	ent->flags &= ~FL_GODMODE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 514
;514:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 -999
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 515
;515:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 35
ARGI4
ADDRGP4 player_die
CALLV
pop
line 516
;516:}
LABELV $269
endproc Cmd_Kill_f 16 20
export G_GetDuelWinner
proc G_GetDuelWinner 16 0
line 519
;517:
;518:gentity_t *G_GetDuelWinner(gclient_t *client)
;519:{
line 523
;520:	gclient_t *wCl;
;521:	int i;
;522:
;523:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $284
line 524
;524:		wCl = &level.clients[i];
ADDRLP4 0
CNSTI4 1800
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 526
;525:		
;526:		if (wCl && wCl != client && /*wCl->ps.clientNum != client->ps.clientNum &&*/
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTU4 0
EQU4 $289
ADDRLP4 12
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $289
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $289
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $289
line 528
;527:			wCl->pers.connected == CON_CONNECTED && wCl->sess.sessionTeam != TEAM_SPECTATOR)
;528:		{
line 529
;529:			return &g_entities[wCl->ps.clientNum];
CNSTI4 828
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $283
JUMPV
LABELV $289
line 531
;530:		}
;531:	}
LABELV $285
line 523
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $287
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $284
line 533
;532:
;533:	return NULL;
CNSTP4 0
RETP4
LABELV $283
endproc G_GetDuelWinner 16 0
export BroadcastTeamChange
proc BroadcastTeamChange 12 16
line 544
;534:}
;535:
;536:/*
;537:=================
;538:BroadCastTeamChange
;539:
;540:Let everyone know about a team change
;541:=================
;542:*/
;543:void BroadcastTeamChange( gclient_t *client, int oldTeam )
;544:{
line 545
;545:	client->ps.fd.forceDoInit = 1; //every time we change teams make sure our force powers are set right
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 1
ASGNI4
line 547
;546:
;547:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $292
line 548
;548:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
ADDRGP4 $116
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 550
;549:			client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEREDTEAM")) );
;550:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $293
JUMPV
LABELV $292
ADDRFP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 2
NEI4 $296
line 551
;551:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
ADDRGP4 $116
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 553
;552:		client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEBLUETEAM")));
;553:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $297
JUMPV
LABELV $296
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $299
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $299
line 554
;554:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
ADDRGP4 $116
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 4
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 556
;555:		client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHESPECTATORS")));
;556:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $300
JUMPV
LABELV $299
ADDRFP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $302
line 557
;557:		if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $304
line 558
;558:		{
line 574
;559:			/*
;560:			gentity_t *currentWinner = G_GetDuelWinner(client);
;561:
;562:			if (currentWinner && currentWinner->client)
;563:			{
;564:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s %s\n\"",
;565:				currentWinner->client->pers.netname, G_GetStripEdString("SVINGAME", "VERSUS"), client->pers.netname));
;566:			}
;567:			else
;568:			{
;569:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
;570:				client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEBATTLE")));
;571:			}
;572:			*/
;573:			//NOTE: Just doing a vs. once it counts two players up
;574:		}
ADDRGP4 $305
JUMPV
LABELV $304
line 576
;575:		else
;576:		{
line 577
;577:			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
ADDRGP4 $116
ARGP4
ADDRGP4 $307
ARGP4
ADDRLP4 4
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 579
;578:			client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEBATTLE")));
;579:		}
LABELV $305
line 580
;580:	}
LABELV $302
LABELV $300
LABELV $297
LABELV $293
line 582
;581:
;582:	G_LogPrintf ( "setteam:  %i %s %s\n",
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $308
ARGP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 586
;583:				  client - &level.clients[0],
;584:				  TeamName ( oldTeam ),
;585:				  TeamName ( client->sess.sessionTeam ) );
;586:}
LABELV $291
endproc BroadcastTeamChange 12 16
export SetTeam
proc SetTeam 108 20
line 593
;587:
;588:/*
;589:=================
;590:SetTeam
;591:=================
;592:*/
;593:void SetTeam( gentity_t *ent, char *s ) {
line 604
;594:	int					team, oldTeam;
;595:	gclient_t			*client;
;596:	int					clientNum;
;597:	spectatorState_t	specState;
;598:	int					specClient;
;599:	int					teamLeader;
;600:
;601:	//
;602:	// see what change is requested
;603:	//
;604:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 606
;605:
;606:	clientNum = client - level.clients;
ADDRLP4 12
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
ASGNI4
line 607
;607:	specClient = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 608
;608:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 609
;609:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $312
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $314
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $310
LABELV $314
line 610
;610:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 611
;611:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 612
;612:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $311
JUMPV
LABELV $310
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $315
line 613
;613:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 614
;614:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 615
;615:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 616
;616:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $316
JUMPV
LABELV $315
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $318
line 617
;617:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 618
;618:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 619
;619:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 620
;620:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $319
JUMPV
LABELV $318
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $325
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $321
LABELV $325
line 621
;621:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 622
;622:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 623
;623:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $322
JUMPV
LABELV $321
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $326
line 625
;624:		// if running a team game, assign player to one of the teams
;625:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 626
;626:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $331
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $333
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $332
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $329
LABELV $333
line 627
;627:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 628
;628:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $330
JUMPV
LABELV $329
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $336
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $338
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $334
LABELV $338
line 629
;629:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 630
;630:		} else {
ADDRGP4 $335
JUMPV
LABELV $334
line 648
;631:			// pick the team with the least number of players
;632:			//For now, don't do this. The legalize function will set powers properly now.
;633:			/*
;634:			if (g_forceBasedTeams.integer)
;635:			{
;636:				if (ent->client->ps.fd.forceSide == FORCE_LIGHTSIDE)
;637:				{
;638:					team = TEAM_BLUE;
;639:				}
;640:				else
;641:				{
;642:					team = TEAM_RED;
;643:				}
;644:			}
;645:			else
;646:			{
;647:			*/
;648:				team = PickTeam( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 68
INDIRI4
ASGNI4
line 650
;649:			//}
;650:		}
LABELV $335
LABELV $330
line 652
;651:
;652:		if ( g_teamForceBalance.integer && !g_trueJedi.integer ) {
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 g_teamForceBalance+12
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $327
ADDRGP4 g_trueJedi+12
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $327
line 655
;653:			int		counts[TEAM_NUM_TEAMS];
;654:
;655:			counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 88
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 72+8
ADDRLP4 88
INDIRI4
ASGNI4
line 656
;656:			counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 92
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 72+4
ADDRLP4 92
INDIRI4
ASGNI4
line 659
;657:
;658:			// We allow a spread of two
;659:			if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRLP4 96
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $345
ADDRLP4 72+4
INDIRI4
ADDRLP4 72+8
INDIRI4
SUBI4
ADDRLP4 96
INDIRI4
LEI4 $345
line 669
;660:				//For now, don't do this. The legalize function will set powers properly now.
;661:				/*
;662:				if (g_forceBasedTeams.integer && ent->client->ps.fd.forceSide == FORCE_DARKSIDE)
;663:				{
;664:					trap_SendServerCommand( ent->client->ps.clientNum, 
;665:						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYRED_SWITCH")) );
;666:				}
;667:				else
;668:				*/
;669:				{
line 670
;670:					trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRGP4 $116
ARGP4
ADDRGP4 $349
ARGP4
ADDRLP4 100
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 672
;671:						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYRED")) );
;672:				}
line 673
;673:				return; // ignore the request
ADDRGP4 $309
JUMPV
LABELV $345
line 675
;674:			}
;675:			if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $327
ADDRLP4 72+8
INDIRI4
ADDRLP4 72+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $327
line 685
;676:				//For now, don't do this. The legalize function will set powers properly now.
;677:				/*
;678:				if (g_forceBasedTeams.integer && ent->client->ps.fd.forceSide == FORCE_LIGHTSIDE)
;679:				{
;680:					trap_SendServerCommand( ent->client->ps.clientNum, 
;681:						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYBLUE_SWITCH")) );
;682:				}
;683:				else
;684:				*/
;685:				{
line 686
;686:					trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRGP4 $116
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 100
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 688
;687:						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYBLUE")) );
;688:				}
line 689
;689:				return; // ignore the request
ADDRGP4 $309
JUMPV
line 693
;690:			}
;691:
;692:			// It's ok, the team we are switching to has less or same number of players
;693:		}
line 712
;694:
;695:		//For now, don't do this. The legalize function will set powers properly now.
;696:		/*
;697:		if (g_forceBasedTeams.integer)
;698:		{
;699:			if (team == TEAM_BLUE && ent->client->ps.fd.forceSide != FORCE_LIGHTSIDE)
;700:			{
;701:				trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MUSTBELIGHT")) );
;702:				return;
;703:			}
;704:			if (team == TEAM_RED && ent->client->ps.fd.forceSide != FORCE_DARKSIDE)
;705:			{
;706:				trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MUSTBEDARK")) );
;707:				return;
;708:			}
;709:		}
;710:		*/
;711:
;712:	} else {
LABELV $326
line 714
;713:		// force them to spectators if there aren't any spots free
;714:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 715
;715:	}
LABELV $327
LABELV $322
LABELV $319
LABELV $316
LABELV $311
line 718
;716:
;717:	// override decision if limiting the players
;718:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $355
ADDRGP4 level+76
INDIRI4
CNSTI4 2
LTI4 $355
line 719
;719:		&& level.numNonSpectatorClients >= 2 ) {
line 720
;720:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 721
;721:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $356
JUMPV
LABELV $355
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $359
ADDRGP4 level+76
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $359
line 722
;722:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 723
;723:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 724
;724:	}
LABELV $359
LABELV $356
line 729
;725:
;726:	//
;727:	// decide if we will allow the change
;728:	//
;729:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 730
;730:	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $364
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $364
line 731
;731:		return;
ADDRGP4 $309
JUMPV
LABELV $364
line 739
;732:	}
;733:
;734:	//
;735:	// execute the team change
;736:	//
;737:
;738:	// if the player was dead leave the body
;739:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $366
line 740
;740:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 741
;741:	}
LABELV $366
line 744
;742:
;743:	// he starts at 'base'
;744:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 0
ASGNI4
line 745
;745:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $368
line 747
;746:		// Kill him (makes sure he loses flags, etc)
;747:		ent->flags &= ~FL_GODMODE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 748
;748:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 749
;749:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 35
ARGI4
ADDRGP4 player_die
CALLV
pop
line 751
;750:
;751:	}
LABELV $368
line 753
;752:	// they go to the end of the line for tournements
;753:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $370
line 754
;754:		if ( (g_gametype.integer != GT_TOURNAMENT) || (oldTeam != TEAM_SPECTATOR) )	{//so you don't get dropped to the bottom of the queue for changing skins, etc.
ADDRLP4 56
CNSTI4 3
ASGNI4
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $375
ADDRLP4 8
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $372
LABELV $375
line 755
;755:			client->sess.spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 756
;756:		}
LABELV $372
line 757
;757:	}
LABELV $370
line 759
;758:
;759:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 760
;760:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 1540
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 761
;761:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 1544
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 763
;762:
;763:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 764
;764:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $379
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $377
LABELV $379
line 765
;765:		teamLeader = TeamLeader( team );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 TeamLeader
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
ASGNI4
line 767
;766:		// if there is no team leader or the team leader is a bot and this client is not a bot
;767:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $386
ADDRLP4 68
CNSTI4 828
ASGNI4
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
ADDRLP4 76
INDIRI4
NEI4 $380
ADDRLP4 68
INDIRI4
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
ADDRLP4 76
INDIRI4
EQI4 $380
LABELV $386
line 768
;768:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 769
;769:		}
LABELV $380
line 770
;770:	}
LABELV $377
line 772
;771:	// make sure there is a team leader on the team the player came from
;772:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $389
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $387
LABELV $389
line 773
;773:		CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 774
;774:	}
LABELV $387
line 776
;775:
;776:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 779
;777:
;778:	// get and distribute relevent paramters
;779:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 781
;780:
;781:	ClientBegin( clientNum, qfalse );
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 782
;782:}
LABELV $309
endproc SetTeam 108 20
export StopFollowing
proc StopFollowing 12 0
line 792
;783:
;784:/*
;785:=================
;786:StopFollowing
;787:
;788:If the client being followed leaves the game, or you just want to drop
;789:to free floating spectator mode
;790:=================
;791:*/
;792:void StopFollowing( gentity_t *ent ) {
line 793
;793:	ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 3
ASGNI4
line 794
;794:	ent->client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 3
ASGNI4
line 795
;795:	ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 796
;796:	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
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
line 797
;797:	ent->r.svFlags &= ~SVF_BOT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 304
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
line 798
;798:	ent->client->ps.clientNum = ent - g_entities;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ASGNI4
line 799
;799:	ent->client->ps.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 800
;800:}
LABELV $390
endproc StopFollowing 12 0
export Cmd_Team_f
proc Cmd_Team_f 1068 12
line 807
;801:
;802:/*
;803:=================
;804:Cmd_Team_f
;805:=================
;806:*/
;807:void Cmd_Team_f( gentity_t *ent ) {
line 811
;808:	int			oldTeam;
;809:	char		s[MAX_TOKEN_CHARS];
;810:
;811:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $392
line 812
;812:		oldTeam = ent->client->sess.sessionTeam;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 813
;813:		switch ( oldTeam ) {
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $391
ADDRLP4 1032
INDIRI4
CNSTI4 3
GTI4 $391
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $407
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $407
address $401
address $398
address $396
address $404
code
LABELV $396
line 815
;814:		case TEAM_BLUE:
;815:			trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PRINTBLUETEAM")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $397
ARGP4
ADDRLP4 1036
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
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
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 816
;816:			break;
ADDRGP4 $391
JUMPV
LABELV $398
line 818
;817:		case TEAM_RED:
;818:			trap_SendServerCommand( ent-g_entities, va("print \"Red team\n\"", G_GetStripEdString("SVINGAME", "PRINTREDTEAM")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $400
ARGP4
ADDRLP4 1044
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $399
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
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
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 819
;819:			break;
ADDRGP4 $391
JUMPV
LABELV $401
line 821
;820:		case TEAM_FREE:
;821:			trap_SendServerCommand( ent-g_entities, va("print \"Free team\n\"", G_GetStripEdString("SVINGAME", "PRINTFREETEAM")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $403
ARGP4
ADDRLP4 1052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $402
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 822
;822:			break;
ADDRGP4 $391
JUMPV
LABELV $404
line 824
;823:		case TEAM_SPECTATOR:
;824:			trap_SendServerCommand( ent-g_entities, va("print \"Spectator team\n\"", G_GetStripEdString("SVINGAME", "PRINTSPECTEAM")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $406
ARGP4
ADDRLP4 1060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $405
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
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
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 825
;825:			break;
line 827
;826:		}
;827:		return;
ADDRGP4 $391
JUMPV
LABELV $392
line 830
;828:	}
;829:
;830:	if ( ent->client->switchTeamTime > level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1716
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $408
line 831
;831:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOSWITCH")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $411
ARGP4
ADDRLP4 1032
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
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
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 832
;832:		return;
ADDRGP4 $391
JUMPV
LABELV $408
line 835
;833:	}
;834:
;835:	if (gEscaping)
ADDRGP4 gEscaping
INDIRI4
CNSTI4 0
EQI4 $412
line 836
;836:	{
line 837
;837:		return;
ADDRGP4 $391
JUMPV
LABELV $412
line 841
;838:	}
;839:
;840:	// if they are playing a tournement game, count as a loss
;841:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $414
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $414
line 842
;842:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {//in a tournament game
line 844
;843:		//disallow changing teams
;844:		trap_SendServerCommand( ent-g_entities, "print \"Cannot switch teams in Duel\n\"" );
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
ADDRGP4 $417
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 845
;845:		return;
ADDRGP4 $391
JUMPV
LABELV $414
line 850
;846:		//FIXME: why should this be a loss???
;847:		//ent->client->sess.losses++;
;848:	}
;849:
;850:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 852
;851:
;852:	SetTeam( ent, s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 854
;853:
;854:	ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1716
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 855
;855:}
LABELV $391
endproc Cmd_Team_f 1068 12
export Cmd_ForceChanged_f
proc Cmd_ForceChanged_f 2064 12
line 863
;856:
;857:/*
;858:=================
;859:Cmd_Team_f
;860:=================
;861:*/
;862:void Cmd_ForceChanged_f( gentity_t *ent )
;863:{
line 867
;864:	char fpChStr[1024];
;865:	const char *buf;
;866://	Cmd_Kill_f(ent);
;867:	if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $420
line 868
;868:	{ //if it's a spec, just make the changes now
line 871
;869:		//trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "FORCEAPPLIED")) );
;870:		//No longer print it, as the UI calls this a lot.
;871:		WP_InitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 872
;872:		goto argCheck;
ADDRGP4 $422
JUMPV
LABELV $420
line 875
;873:	}
;874:
;875:	buf = G_GetStripEdString("SVINGAME", "FORCEPOWERCHANGED");
ADDRGP4 $116
ARGP4
ADDRGP4 $423
ARGP4
ADDRLP4 1028
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 877
;876:
;877:	strcpy(fpChStr, buf);
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 879
;878:
;879:	trap_SendServerCommand( ent-g_entities, va("print \"%s%s\n\n\"", S_COLOR_GREEN, fpChStr) );
ADDRGP4 $424
ARGP4
ADDRGP4 $425
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1032
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
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 881
;880:
;881:	ent->client->ps.fd.forceDoInit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 1
ASGNI4
LABELV $422
line 883
;882:argCheck:
;883:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $426
line 884
;884:	{ //If this is duel, don't even bother changing team in relation to this.
line 885
;885:		return;
ADDRGP4 $419
JUMPV
LABELV $426
line 888
;886:	}
;887:
;888:	if (trap_Argc() > 1)
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
LEI4 $429
line 889
;889:	{
line 892
;890:		char	arg[MAX_TOKEN_CHARS];
;891:
;892:		trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 894
;893:
;894:		if (arg && arg[0])
ADDRLP4 1040
CVPU4 4
CNSTU4 0
EQU4 $431
ADDRLP4 1040
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $431
line 895
;895:		{ //if there's an arg, assume it's a combo team command from the UI.
line 896
;896:			Cmd_Team_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
line 897
;897:		}
LABELV $431
line 898
;898:	}
LABELV $429
line 899
;899:}
LABELV $419
endproc Cmd_ForceChanged_f 2064 12
export Cmd_Follow_f
proc Cmd_Follow_f 1040 12
line 906
;900:
;901:/*
;902:=================
;903:Cmd_Follow_f
;904:=================
;905:*/
;906:void Cmd_Follow_f( gentity_t *ent ) {
line 910
;907:	int		i;
;908:	char	arg[MAX_TOKEN_CHARS];
;909:
;910:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $434
line 911
;911:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 2
NEI4 $433
line 912
;912:			StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 913
;913:		}
line 914
;914:		return;
ADDRGP4 $433
JUMPV
LABELV $434
line 917
;915:	}
;916:
;917:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 918
;918:	i = ClientNumberFromString( ent, arg );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 919
;919:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $438
line 920
;920:		return;
ADDRGP4 $433
JUMPV
LABELV $438
line 924
;921:	}
;922:
;923:	// can't follow self
;924:	if ( &level.clients[ i ] == ent->client ) {
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
NEU4 $440
line 925
;925:		return;
ADDRGP4 $433
JUMPV
LABELV $440
line 929
;926:	}
;927:
;928:	// can't follow another spectator
;929:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
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
CNSTI4 3
NEI4 $442
line 930
;930:		return;
ADDRGP4 $433
JUMPV
LABELV $442
line 934
;931:	}
;932:
;933:	// if they are playing a tournement game, count as a loss
;934:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $444
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $444
line 935
;935:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 937
;936:		//WTF???
;937:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 938
;938:	}
LABELV $444
line 941
;939:
;940:	// first set them to spectator
;941:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $447
line 942
;942:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 943
;943:	}
LABELV $447
line 945
;944:
;945:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 2
ASGNI4
line 946
;946:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 947
;947:}
LABELV $433
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 12 8
line 954
;948:
;949:/*
;950:=================
;951:Cmd_FollowCycle_f
;952:=================
;953:*/
;954:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 959
;955:	int		clientnum;
;956:	int		original;
;957:
;958:	// if they are playing a tournement game, count as a loss
;959:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $450
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $450
line 960
;960:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {\
line 962
;961:		//WTF???
;962:		ent->client->sess.losses++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1552
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
line 963
;963:	}
LABELV $450
line 965
;964:	// first set them to spectator
;965:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 0
NEI4 $453
line 966
;966:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 967
;967:	}
LABELV $453
line 969
;968:
;969:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $455
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $455
line 970
;970:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $457
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 971
;971:	}
LABELV $455
line 973
;972:
;973:	clientnum = ent->client->sess.spectatorClient;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ASGNI4
line 974
;974:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $458
line 975
;975:	do {
line 976
;976:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 977
;977:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $461
line 978
;978:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 979
;979:		}
LABELV $461
line 980
;980:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $464
line 981
;981:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 982
;982:		}
LABELV $464
line 985
;983:
;984:		// can only follow connected clients
;985:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
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
CNSTI4 2
EQI4 $467
line 986
;986:			continue;
ADDRGP4 $459
JUMPV
LABELV $467
line 990
;987:		}
;988:
;989:		// can't follow another spectator
;990:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
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
CNSTI4 3
NEI4 $469
line 991
;991:			continue;
ADDRGP4 $459
JUMPV
LABELV $469
line 995
;992:		}
;993:
;994:		// this is good, we can use it
;995:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 996
;996:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 2
ASGNI4
line 997
;997:		return;
ADDRGP4 $449
JUMPV
LABELV $459
line 998
;998:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $458
line 1001
;999:
;1000:	// leave it where it was
;1001:}
LABELV $449
endproc Cmd_FollowCycle_f 12 8
proc G_SayTo 24 24
line 1010
;1002:
;1003:
;1004:/*
;1005:==================
;1006:G_Say
;1007:==================
;1008:*/
;1009:
;1010:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 1011
;1011:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $472
line 1012
;1012:		return;
ADDRGP4 $471
JUMPV
LABELV $472
line 1014
;1013:	}
;1014:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $474
line 1015
;1015:		return;
ADDRGP4 $471
JUMPV
LABELV $474
line 1017
;1016:	}
;1017:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $476
line 1018
;1018:		return;
ADDRGP4 $471
JUMPV
LABELV $476
line 1020
;1019:	}
;1020:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $478
line 1021
;1021:		return;
ADDRGP4 $471
JUMPV
LABELV $478
line 1023
;1022:	}
;1023:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $480
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $480
line 1024
;1024:		return;
ADDRGP4 $471
JUMPV
LABELV $480
line 1027
;1025:	}
;1026:	// no chatting to players in tournements
;1027:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $482
ADDRLP4 4
CNSTI4 408
ASGNI4
ADDRLP4 8
CNSTI4 1532
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $482
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $482
line 1029
;1028:		&& other->client->sess.sessionTeam == TEAM_FREE
;1029:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 1031
;1030:		//Hmm, maybe some option to do so if allowed?  Or at least in developer mode...
;1031:		return;
ADDRGP4 $471
JUMPV
LABELV $482
line 1034
;1032:	}
;1033:
;1034:	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"", 
ADDRGP4 $485
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $489
ADDRLP4 16
ADDRGP4 $486
ASGNP4
ADDRGP4 $490
JUMPV
LABELV $489
ADDRLP4 16
ADDRGP4 $487
ASGNP4
LABELV $490
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1037
;1035:		mode == SAY_TEAM ? "tchat" : "chat",
;1036:		name, Q_COLOR_ESCAPE, color, message));
;1037:}
LABELV $471
endproc G_SayTo 24 24
export G_Say
proc G_Say 320 28
line 1041
;1038:
;1039:#define EC		"\x19"
;1040:
;1041:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 1050
;1042:	int			j;
;1043:	gentity_t	*other;
;1044:	int			color;
;1045:	char		name[64];
;1046:	// don't let text be too long for malicious reasons
;1047:	char		text[MAX_SAY_TEXT];
;1048:	char		location[64];
;1049:
;1050:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $492
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $492
line 1051
;1051:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1052
;1052:	}
LABELV $492
line 1054
;1053:
;1054:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $497
ADDRLP4 292
INDIRI4
CNSTI4 1
EQI4 $500
ADDRLP4 292
INDIRI4
CNSTI4 2
EQI4 $506
ADDRGP4 $495
JUMPV
LABELV $495
LABELV $497
line 1057
;1055:	default:
;1056:	case SAY_ALL:
;1057:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $498
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1058
;1058:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $499
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1059
;1059:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1060
;1060:		break;
ADDRGP4 $496
JUMPV
LABELV $500
line 1062
;1061:	case SAY_TEAM:
;1062:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $501
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1063
;1063:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 296
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $502
line 1064
;1064:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $504
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $503
JUMPV
LABELV $502
line 1067
;1065:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1066:		else
;1067:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $505
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $503
line 1069
;1068:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;1069:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 1070
;1070:		break;
ADDRGP4 $496
JUMPV
LABELV $506
line 1072
;1071:	case SAY_TELL:
;1072:		if (target && g_gametype.integer >= GT_TEAM &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $507
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $507
ADDRLP4 304
CNSTI4 408
ASGNI4
ADDRLP4 308
CNSTI4 1532
ASGNI4
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRI4
ADDRLP4 312
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRI4
NEI4 $507
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 316
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $507
line 1075
;1073:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;1074:			Team_GetLocationMsg(ent, location, sizeof(location)))
;1075:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $510
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $508
JUMPV
LABELV $507
line 1077
;1076:		else
;1077:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $511
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $508
line 1078
;1078:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 1079
;1079:		break;
LABELV $496
line 1082
;1080:	}
;1081:
;1082:	Q_strncpyz( text, chatText, sizeof(text) );
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1084
;1083:
;1084:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $512
line 1085
;1085:		G_SayTo( ent, target, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1086
;1086:		return;
ADDRGP4 $491
JUMPV
LABELV $512
line 1090
;1087:	}
;1088:
;1089:	// echo the text to the console
;1090:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $514
line 1091
;1091:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $517
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1092
;1092:	}
LABELV $514
line 1095
;1093:
;1094:	// send it to all the apropriate clients
;1095:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $521
JUMPV
LABELV $518
line 1096
;1096:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1097
;1097:		G_SayTo( ent, other, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1098
;1098:	}
LABELV $519
line 1095
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $521
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $518
line 1099
;1099:}
LABELV $491
endproc G_Say 320 28
proc Cmd_Say_f 12 16
line 1107
;1100:
;1101:
;1102:/*
;1103:==================
;1104:Cmd_Say_f
;1105:==================
;1106:*/
;1107:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 1110
;1108:	char		*p;
;1109:
;1110:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $524
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $524
line 1111
;1111:		return;
ADDRGP4 $523
JUMPV
LABELV $524
line 1114
;1112:	}
;1113:
;1114:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $526
line 1115
;1115:	{
line 1116
;1116:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1117
;1117:	}
ADDRGP4 $527
JUMPV
LABELV $526
line 1119
;1118:	else
;1119:	{
line 1120
;1120:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1121
;1121:	}
LABELV $527
line 1123
;1122:
;1123:	G_Say( ent, NULL, mode, p );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1124
;1124:}
LABELV $523
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1076 16
line 1131
;1125:
;1126:/*
;1127:==================
;1128:Cmd_Tell_f
;1129:==================
;1130:*/
;1131:static void Cmd_Tell_f( gentity_t *ent ) {
line 1137
;1132:	int			targetNum;
;1133:	gentity_t	*target;
;1134:	char		*p;
;1135:	char		arg[MAX_TOKEN_CHARS];
;1136:
;1137:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $529
line 1138
;1138:		return;
ADDRGP4 $528
JUMPV
LABELV $529
line 1141
;1139:	}
;1140:
;1141:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1142
;1142:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1143
;1143:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $534
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $531
LABELV $534
line 1144
;1144:		return;
ADDRGP4 $528
JUMPV
LABELV $531
line 1147
;1145:	}
;1146:
;1147:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1148
;1148:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $538
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $538
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $535
LABELV $538
line 1149
;1149:		return;
ADDRGP4 $528
JUMPV
LABELV $535
line 1152
;1150:	}
;1151:
;1152:	p = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 1154
;1153:
;1154:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $539
ARGP4
ADDRLP4 1060
CNSTI4 408
ASGNI4
ADDRLP4 1064
CNSTI4 1428
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1155
;1155:	G_Say( ent, target, SAY_TELL, p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1158
;1156:	// don't tell to the player self if it was already directed to this player
;1157:	// also don't send the chat back to a bot
;1158:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $540
ADDRLP4 1068
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $540
line 1159
;1159:		G_Say( ent, ent, SAY_TELL, p );
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1160
;1160:	}
LABELV $540
line 1161
;1161:}
LABELV $528
endproc Cmd_Tell_f 1076 16
proc G_VoiceTo 16 24
line 1164
;1162:
;1163:
;1164:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 1168
;1165:	int color;
;1166:	char *cmd;
;1167:
;1168:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $543
line 1169
;1169:		return;
ADDRGP4 $542
JUMPV
LABELV $543
line 1171
;1170:	}
;1171:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $545
line 1172
;1172:		return;
ADDRGP4 $542
JUMPV
LABELV $545
line 1174
;1173:	}
;1174:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $547
line 1175
;1175:		return;
ADDRGP4 $542
JUMPV
LABELV $547
line 1177
;1176:	}
;1177:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $549
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $549
line 1178
;1178:		return;
ADDRGP4 $542
JUMPV
LABELV $549
line 1181
;1179:	}
;1180:	// no chatting to players in tournements
;1181:	if ( (g_gametype.integer == GT_TOURNAMENT )) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $551
line 1182
;1182:		return;
ADDRGP4 $542
JUMPV
LABELV $551
line 1185
;1183:	}
;1184:
;1185:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $554
line 1186
;1186:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 1187
;1187:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $556
ASGNP4
line 1188
;1188:	}
ADDRGP4 $555
JUMPV
LABELV $554
line 1189
;1189:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $557
line 1190
;1190:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 1191
;1191:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $559
ASGNP4
line 1192
;1192:	}
ADDRGP4 $558
JUMPV
LABELV $557
line 1193
;1193:	else {
line 1194
;1194:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1195
;1195:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $560
ASGNP4
line 1196
;1196:	}
LABELV $558
LABELV $555
line 1198
;1197:
;1198:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $561
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1199
;1199:}
LABELV $542
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 1201
;1200:
;1201:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 1205
;1202:	int			j;
;1203:	gentity_t	*other;
;1204:
;1205:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $563
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $563
line 1206
;1206:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1207
;1207:	}
LABELV $563
line 1209
;1208:
;1209:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $566
line 1210
;1210:		G_VoiceTo( ent, target, mode, id, voiceonly );
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
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1211
;1211:		return;
ADDRGP4 $562
JUMPV
LABELV $566
line 1215
;1212:	}
;1213:
;1214:	// echo the text to the console
;1215:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $568
line 1216
;1216:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $571
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1217
;1217:	}
LABELV $568
line 1220
;1218:
;1219:	// send it to all the apropriate clients
;1220:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $575
JUMPV
LABELV $572
line 1221
;1221:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1222
;1222:		G_VoiceTo( ent, other, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1223
;1223:	}
LABELV $573
line 1220
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $575
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $572
line 1224
;1224:}
LABELV $562
endproc G_Voice 8 20
proc Cmd_Voice_f 12 20
line 1231
;1225:
;1226:/*
;1227:==================
;1228:Cmd_Voice_f
;1229:==================
;1230:*/
;1231:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
line 1234
;1232:	char		*p;
;1233:
;1234:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $578
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $578
line 1235
;1235:		return;
ADDRGP4 $577
JUMPV
LABELV $578
line 1238
;1236:	}
;1237:
;1238:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $580
line 1239
;1239:	{
line 1240
;1240:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1241
;1241:	}
ADDRGP4 $581
JUMPV
LABELV $580
line 1243
;1242:	else
;1243:	{
line 1244
;1244:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1245
;1245:	}
LABELV $581
line 1247
;1246:
;1247:	G_Voice( ent, NULL, mode, p, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1248
;1248:}
LABELV $577
endproc Cmd_Voice_f 12 20
proc Cmd_VoiceTell_f 1076 20
line 1255
;1249:
;1250:/*
;1251:==================
;1252:Cmd_VoiceTell_f
;1253:==================
;1254:*/
;1255:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
line 1261
;1256:	int			targetNum;
;1257:	gentity_t	*target;
;1258:	char		*id;
;1259:	char		arg[MAX_TOKEN_CHARS];
;1260:
;1261:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $583
line 1262
;1262:		return;
ADDRGP4 $582
JUMPV
LABELV $583
line 1265
;1263:	}
;1264:
;1265:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1266
;1266:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1267
;1267:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $588
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $585
LABELV $588
line 1268
;1268:		return;
ADDRGP4 $582
JUMPV
LABELV $585
line 1271
;1269:	}
;1270:
;1271:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1272
;1272:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $592
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $592
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $589
LABELV $592
line 1273
;1273:		return;
ADDRGP4 $582
JUMPV
LABELV $589
line 1276
;1274:	}
;1275:
;1276:	id = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 1278
;1277:
;1278:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $593
ARGP4
ADDRLP4 1060
CNSTI4 408
ASGNI4
ADDRLP4 1064
CNSTI4 1428
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1279
;1279:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1282
;1280:	// don't tell to the player self if it was already directed to this player
;1281:	// also don't send the chat back to a bot
;1282:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $594
ADDRLP4 1068
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $594
line 1283
;1283:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1284
;1284:	}
LABELV $594
line 1285
;1285:}
LABELV $582
endproc Cmd_VoiceTell_f 1076 20
proc Cmd_VoiceTaunt_f 56 20
line 1293
;1286:
;1287:
;1288:/*
;1289:==================
;1290:Cmd_VoiceTaunt_f
;1291:==================
;1292:*/
;1293:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 1297
;1294:	gentity_t *who;
;1295:	int i;
;1296:
;1297:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $597
line 1298
;1298:		return;
ADDRGP4 $596
JUMPV
LABELV $597
line 1302
;1299:	}
;1300:
;1301:	// insult someone who just killed you
;1302:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $599
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $599
ADDRLP4 20
INDIRP4
CNSTI4 1672
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $599
line 1304
;1303:		// i am a dead corpse
;1304:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $601
line 1305
;1305:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $603
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1306
;1306:		}
LABELV $601
line 1307
;1307:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $604
line 1308
;1308:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $603
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1309
;1309:		}
LABELV $604
line 1310
;1310:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 1311
;1311:		return;
ADDRGP4 $596
JUMPV
LABELV $599
line 1314
;1312:	}
;1313:	// insult someone you just killed
;1314:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $606
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
EQI4 $606
line 1315
;1315:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1316
;1316:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $608
line 1318
;1317:			// who is the person I just killed
;1318:			if (who->client->lasthurt_mod == MOD_STUN_BATON) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1680
ADDP4
INDIRI4
CNSTI4 1
NEI4 $610
line 1319
;1319:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $612
line 1320
;1320:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $614
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1321
;1321:				}
LABELV $612
line 1322
;1322:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $611
line 1323
;1323:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $614
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1324
;1324:				}
line 1325
;1325:			} else {
ADDRGP4 $611
JUMPV
LABELV $610
line 1326
;1326:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $617
line 1327
;1327:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $619
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1328
;1328:				}
LABELV $617
line 1329
;1329:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $620
line 1330
;1330:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $619
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1331
;1331:				}
LABELV $620
line 1332
;1332:			}
LABELV $611
line 1333
;1333:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
CNSTI4 -1
ASGNI4
line 1334
;1334:			return;
ADDRGP4 $596
JUMPV
LABELV $608
line 1336
;1335:		}
;1336:	}
LABELV $606
line 1338
;1337:
;1338:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $622
line 1340
;1339:		// praise a team mate who just got a reward
;1340:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $625
line 1341
;1341:			who = g_entities + i;
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1342
;1342:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
ADDRLP4 36
CNSTI4 408
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $629
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRP4
CVPU4 4
EQU4 $629
ADDRLP4 48
CNSTI4 1532
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $629
line 1343
;1343:				if (who->client->rewardTime > level.time) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1696
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $631
line 1344
;1344:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $634
line 1345
;1345:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $636
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1346
;1346:					}
LABELV $634
line 1347
;1347:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $596
line 1348
;1348:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $636
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1349
;1349:					}
line 1350
;1350:					return;
ADDRGP4 $596
JUMPV
LABELV $631
line 1352
;1351:				}
;1352:			}
LABELV $629
line 1353
;1353:		}
LABELV $626
line 1340
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $625
line 1354
;1354:	}
LABELV $622
line 1357
;1355:
;1356:	// just say something
;1357:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 $639
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1358
;1358:}
LABELV $596
endproc Cmd_VoiceTaunt_f 56 20
data
align 4
LABELV gc_orders
address $640
address $641
address $642
address $643
address $644
address $645
address $646
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1060 16
line 1372
;1359:
;1360:
;1361:
;1362:static char	*gc_orders[] = {
;1363:	"hold your position",
;1364:	"hold this position",
;1365:	"come here",
;1366:	"cover me",
;1367:	"guard location",
;1368:	"search and destroy",
;1369:	"report"
;1370:};
;1371:
;1372:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1377
;1373:	int		player;
;1374:	int		order;
;1375:	char	str[MAX_TOKEN_CHARS];
;1376:
;1377:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1378
;1378:	player = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 1379
;1379:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1380
;1380:	order = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1382
;1381:
;1382:	if ( player < 0 || player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $650
ADDRLP4 1028
INDIRI4
CNSTI4 32
LTI4 $648
LABELV $650
line 1383
;1383:		return;
ADDRGP4 $647
JUMPV
LABELV $648
line 1385
;1384:	}
;1385:	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $653
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $651
LABELV $653
line 1386
;1386:		return;
ADDRGP4 $647
JUMPV
LABELV $651
line 1388
;1387:	}
;1388:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1048
CNSTI4 2
ASGNI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1048
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1389
;1389:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
CNSTI4 2
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1056
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1390
;1390:}
LABELV $647
endproc Cmd_GameCommand_f 1060 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1397
;1391:
;1392:/*
;1393:==================
;1394:Cmd_Where_f
;1395:==================
;1396:*/
;1397:void Cmd_Where_f( gentity_t *ent ) {
line 1398
;1398:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1399
;1399:}
LABELV $654
endproc Cmd_Where_f 8 8
data
align 4
LABELV gameNames
address $655
address $656
address $657
address $658
address $659
address $660
address $661
address $662
address $663
export G_ClientNumberFromName
code
proc G_ClientNumberFromName 2060 8
line 1421
;1400:
;1401:static const char *gameNames[] = {
;1402:	"Free For All",
;1403:	"Holocron FFA",
;1404:	"Jedi Master",
;1405:	"Duel",
;1406:	"Single Player",
;1407:	"Team FFA",
;1408:	"N/A",
;1409:	"Capture the Flag",
;1410:	"Capture the Ysalamiri"
;1411:};
;1412:
;1413:/*
;1414:==================
;1415:G_ClientNumberFromName
;1416:
;1417:Finds the client number of the client with the given name
;1418:==================
;1419:*/
;1420:int G_ClientNumberFromName ( const char* name )
;1421:{
line 1428
;1422:	char		s2[MAX_STRING_CHARS];
;1423:	char		n2[MAX_STRING_CHARS];
;1424:	int			i;
;1425:	gclient_t*	cl;
;1426:
;1427:	// check for a name match
;1428:	SanitizeString( (char*)name, s2 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 1429
;1429:	for ( i=0, cl=level.clients ; i < level.numConnectedClients ; i++, cl++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $668
JUMPV
LABELV $665
line 1430
;1430:	{
line 1431
;1431:		SanitizeString( cl->pers.netname, n2 );
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 1432
;1432:		if ( !strcmp( n2, s2 ) ) 
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2056
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $670
line 1433
;1433:		{
line 1434
;1434:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $664
JUMPV
LABELV $670
line 1436
;1435:		}
;1436:	}
LABELV $666
line 1429
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
ASGNP4
LABELV $668
ADDRLP4 0
INDIRI4
ADDRGP4 level+72
INDIRI4
LTI4 $665
line 1438
;1437:
;1438:	return -1;
CNSTI4 -1
RETI4
LABELV $664
endproc G_ClientNumberFromName 2060 8
export SanitizeString2
proc SanitizeString2 12 0
line 1449
;1439:}
;1440:
;1441:/*
;1442:==================
;1443:SanitizeString2
;1444:
;1445:Rich's revised version of SanitizeString
;1446:==================
;1447:*/
;1448:void SanitizeString2( char *in, char *out )
;1449:{
line 1450
;1450:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1451
;1451:	int r = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $674
JUMPV
LABELV $673
line 1454
;1452:
;1453:	while (in[i])
;1454:	{
line 1455
;1455:		if (i >= MAX_NAME_LENGTH-1)
ADDRLP4 0
INDIRI4
CNSTI4 31
LTI4 $676
line 1456
;1456:		{ //the ui truncates the name here..
line 1457
;1457:			break;
ADDRGP4 $675
JUMPV
LABELV $676
line 1460
;1458:		}
;1459:
;1460:		if (in[i] == '^')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $678
line 1461
;1461:		{
line 1462
;1462:			if (in[i+1] >= 48 && //'0'
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 48
LTI4 $680
ADDRLP4 8
INDIRI4
CNSTI4 57
GTI4 $680
line 1464
;1463:				in[i+1] <= 57) //'9'
;1464:			{ //only skip it if there's a number after it for the color
line 1465
;1465:				i += 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 1466
;1466:				continue;
ADDRGP4 $674
JUMPV
LABELV $680
line 1469
;1467:			}
;1468:			else
;1469:			{ //just skip the ^
line 1470
;1470:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1471
;1471:				continue;
ADDRGP4 $674
JUMPV
LABELV $678
line 1475
;1472:			}
;1473:		}
;1474:
;1475:		if (in[i] < 32)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $682
line 1476
;1476:		{
line 1477
;1477:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1478
;1478:			continue;
ADDRGP4 $674
JUMPV
LABELV $682
line 1481
;1479:		}
;1480:
;1481:		out[r] = in[i];
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 1482
;1482:		r++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
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
LABELV $674
line 1453
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $673
LABELV $675
line 1485
;1485:	out[r] = 0;
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1486
;1486:}
LABELV $672
endproc SanitizeString2 12 0
export G_ClientNumberFromStrippedName
proc G_ClientNumberFromStrippedName 2060 8
line 1496
;1487:
;1488:/*
;1489:==================
;1490:G_ClientNumberFromStrippedName
;1491:
;1492:Same as above, but strips special characters out of the names before comparing.
;1493:==================
;1494:*/
;1495:int G_ClientNumberFromStrippedName ( const char* name )
;1496:{
line 1503
;1497:	char		s2[MAX_STRING_CHARS];
;1498:	char		n2[MAX_STRING_CHARS];
;1499:	int			i;
;1500:	gclient_t*	cl;
;1501:
;1502:	// check for a name match
;1503:	SanitizeString2( (char*)name, s2 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString2
CALLV
pop
line 1504
;1504:	for ( i=0, cl=level.clients ; i < level.numConnectedClients ; i++, cl++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $688
JUMPV
LABELV $685
line 1505
;1505:	{
line 1506
;1506:		SanitizeString2( cl->pers.netname, n2 );
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString2
CALLV
pop
line 1507
;1507:		if ( !strcmp( n2, s2 ) ) 
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2056
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $690
line 1508
;1508:		{
line 1509
;1509:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $684
JUMPV
LABELV $690
line 1511
;1510:		}
;1511:	}
LABELV $686
line 1504
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
ASGNP4
LABELV $688
ADDRLP4 0
INDIRI4
ADDRGP4 level+72
INDIRI4
LTI4 $685
line 1513
;1512:
;1513:	return -1;
CNSTI4 -1
RETI4
LABELV $684
endproc G_ClientNumberFromStrippedName 2060 8
export Cmd_CallVote_f
proc Cmd_CallVote_f 3144 24
line 1521
;1514:}
;1515:
;1516:/*
;1517:==================
;1518:Cmd_CallVote_f
;1519:==================
;1520:*/
;1521:void Cmd_CallVote_f( gentity_t *ent ) {
line 1526
;1522:	int		i;
;1523:	char	arg1[MAX_STRING_TOKENS];
;1524:	char	arg2[MAX_STRING_TOKENS];
;1525:
;1526:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $693
line 1527
;1527:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $696
ARGP4
ADDRLP4 2052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2056
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
ADDRLP4 2056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1528
;1528:		return;
ADDRGP4 $692
JUMPV
LABELV $693
line 1531
;1529:	}
;1530:
;1531:	if ( level.voteTime ) {
ADDRGP4 level+2276
INDIRI4
CNSTI4 0
EQI4 $697
line 1532
;1532:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "VOTEINPROGRESS")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $700
ARGP4
ADDRLP4 2052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2056
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
ADDRLP4 2056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1533
;1533:		return;
ADDRGP4 $692
JUMPV
LABELV $697
line 1535
;1534:	}
;1535:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
LTI4 $701
line 1536
;1536:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MAXVOTES")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $703
ARGP4
ADDRLP4 2052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2056
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
ADDRLP4 2056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1537
;1537:		return;
ADDRGP4 $692
JUMPV
LABELV $701
line 1539
;1538:	}
;1539:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $704
line 1540
;1540:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOSPECVOTE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $706
ARGP4
ADDRLP4 2052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2056
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
ADDRLP4 2056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1541
;1541:		return;
ADDRGP4 $692
JUMPV
LABELV $704
line 1545
;1542:	}
;1543:
;1544:	// make sure it is a valid command to vote on
;1545:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1546
;1546:	trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1548
;1547:
;1548:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2052
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2052
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $709
ADDRLP4 1028
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2056
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2056
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $707
LABELV $709
line 1549
;1549:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $710
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1550
;1550:		return;
ADDRGP4 $692
JUMPV
LABELV $707
line 1553
;1551:	}
;1552:
;1553:	if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $713
ARGP4
ADDRLP4 2060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $711
line 1554
;1554:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $712
JUMPV
LABELV $711
ADDRLP4 4
ARGP4
ADDRGP4 $716
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $714
line 1555
;1555:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $715
JUMPV
LABELV $714
ADDRLP4 4
ARGP4
ADDRGP4 $719
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $717
line 1556
;1556:	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRGP4 $718
JUMPV
LABELV $717
ADDRLP4 4
ARGP4
ADDRGP4 $722
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $720
line 1557
;1557:	} else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $721
JUMPV
LABELV $720
ADDRLP4 4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $723
line 1558
;1558:	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $724
JUMPV
LABELV $723
ADDRLP4 4
ARGP4
ADDRGP4 $728
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $726
line 1559
;1559:	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $727
JUMPV
LABELV $726
ADDRLP4 4
ARGP4
ADDRGP4 $731
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $729
line 1560
;1560:	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $730
JUMPV
LABELV $729
ADDRLP4 4
ARGP4
ADDRGP4 $734
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $732
line 1561
;1561:	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $733
JUMPV
LABELV $732
ADDRLP4 4
ARGP4
ADDRGP4 $737
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $735
line 1562
;1562:	} else {
ADDRGP4 $736
JUMPV
LABELV $735
line 1563
;1563:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $710
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1564
;1564:		trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
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
ADDRGP4 $738
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1565
;1565:		return;
ADDRGP4 $692
JUMPV
LABELV $736
LABELV $733
LABELV $730
LABELV $727
LABELV $724
LABELV $721
LABELV $718
LABELV $715
LABELV $712
line 1569
;1566:	}
;1567:
;1568:	// if there is still a vote to be executed
;1569:	if ( level.voteExecuteTime ) {
ADDRGP4 level+2280
INDIRI4
CNSTI4 0
EQI4 $739
line 1570
;1570:		level.voteExecuteTime = 0;
ADDRGP4 level+2280
CNSTI4 0
ASGNI4
line 1571
;1571:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $743
ARGP4
ADDRGP4 level+228
ARGP4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1572
;1572:	}
LABELV $739
line 1575
;1573:
;1574:	// special case for g_gametype, check for bad values
;1575:	if ( !Q_stricmp( arg1, "g_gametype" ) )
ADDRLP4 4
ARGP4
ADDRGP4 $722
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $745
line 1576
;1576:	{
line 1577
;1577:		i = atoi( arg2 );
ADDRLP4 1028
ARGP4
ADDRLP4 2100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2100
INDIRI4
ASGNI4
line 1578
;1578:		if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $750
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $750
ADDRLP4 0
INDIRI4
CNSTI4 9
LTI4 $747
LABELV $750
line 1579
;1579:			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
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
ADDRGP4 $751
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1580
;1580:			return;
ADDRGP4 $692
JUMPV
LABELV $747
line 1583
;1581:		}
;1582:
;1583:		level.votingGametype = qtrue;
ADDRGP4 level+2296
CNSTI4 1
ASGNI4
line 1584
;1584:		level.votingGametypeTo = i;
ADDRGP4 level+2300
ADDRLP4 0
INDIRI4
ASGNI4
line 1586
;1585:
;1586:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d", arg1, i );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $756
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1587
;1587:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s %s", arg1, gameNames[i] );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $759
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gameNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1588
;1588:	}
ADDRGP4 $746
JUMPV
LABELV $745
line 1589
;1589:	else if ( !Q_stricmp( arg1, "map" ) ) 
ADDRLP4 4
ARGP4
ADDRGP4 $719
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $760
line 1590
;1590:	{
line 1595
;1591:		// special case for map changes, we want to reset the nextmap setting
;1592:		// this allows a player to change maps, but not upset the map rotation
;1593:		char	s[MAX_STRING_CHARS];
;1594:
;1595:		if (!G_DoesMapSupportGametype(arg2, trap_Cvar_VariableIntegerValue("g_gametype")))
ADDRGP4 $722
ARGP4
ADDRLP4 3128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1028
ARGP4
ADDRLP4 3128
INDIRI4
ARGI4
ADDRLP4 3132
ADDRGP4 G_DoesMapSupportGametype
CALLI4
ASGNI4
ADDRLP4 3132
INDIRI4
CNSTI4 0
NEI4 $762
line 1596
;1596:		{
line 1598
;1597:			//trap_SendServerCommand( ent-g_entities, "print \"You can't vote for this map, it isn't supported by the current gametype.\n\"" );
;1598:			trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTE_MAPNOTSUPPORTEDBYGAME")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $764
ARGP4
ADDRLP4 3136
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 3136
INDIRP4
ARGP4
ADDRLP4 3140
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
ADDRLP4 3140
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1599
;1599:			return;
ADDRGP4 $692
JUMPV
LABELV $762
line 1602
;1600:		}
;1601:
;1602:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $716
ARGP4
ADDRLP4 2104
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1603
;1603:		if (*s) {
ADDRLP4 2104
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $765
line 1604
;1604:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $769
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 2104
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1605
;1605:		} else {
ADDRGP4 $766
JUMPV
LABELV $765
line 1606
;1606:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $759
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1607
;1607:		}
LABELV $766
line 1608
;1608:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $774
ARGP4
ADDRGP4 level+228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1609
;1609:	}
ADDRGP4 $761
JUMPV
LABELV $760
line 1610
;1610:	else if ( !Q_stricmp ( arg1, "clientkick" ) )
ADDRLP4 4
ARGP4
ADDRGP4 $728
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $776
line 1611
;1611:	{
line 1612
;1612:		int n = atoi ( arg2 );
ADDRLP4 1028
ARGP4
ADDRLP4 2112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2108
ADDRLP4 2112
INDIRI4
ASGNI4
line 1614
;1613:
;1614:		if ( n < 0 || n >= MAX_CLIENTS )
ADDRLP4 2116
ADDRLP4 2108
INDIRI4
ASGNI4
ADDRLP4 2116
INDIRI4
CNSTI4 0
LTI4 $780
ADDRLP4 2116
INDIRI4
CNSTI4 32
LTI4 $778
LABELV $780
line 1615
;1615:		{
line 1616
;1616:			trap_SendServerCommand( ent-g_entities, va("print \"invalid client number %d.\n\"", n ) );
ADDRGP4 $781
ARGP4
ADDRLP4 2108
INDIRI4
ARGI4
ADDRLP4 2120
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
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1617
;1617:			return;
ADDRGP4 $692
JUMPV
LABELV $778
line 1620
;1618:		}
;1619:
;1620:		if ( g_entities[n].client->pers.connected == CON_DISCONNECTED )
CNSTI4 828
ADDRLP4 2108
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $782
line 1621
;1621:		{
line 1622
;1622:			trap_SendServerCommand( ent-g_entities, va("print \"there is no client with the client number %d.\n\"", n ) );
ADDRGP4 $785
ARGP4
ADDRLP4 2108
INDIRI4
ARGI4
ADDRLP4 2120
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
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1623
;1623:			return;
ADDRGP4 $692
JUMPV
LABELV $782
line 1626
;1624:		}
;1625:			
;1626:		Com_sprintf ( level.voteString, sizeof(level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $759
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1627
;1627:		Com_sprintf ( level.voteDisplayString, sizeof(level.voteDisplayString), "kick %s", g_entities[n].client->pers.netname );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $790
ARGP4
CNSTI4 828
ADDRLP4 2108
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1628
;1628:	}
ADDRGP4 $777
JUMPV
LABELV $776
line 1629
;1629:	else if ( !Q_stricmp ( arg1, "kick" ) )
ADDRLP4 4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 2108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $792
line 1630
;1630:	{
line 1631
;1631:		int clientid = G_ClientNumberFromName ( arg2 );
ADDRLP4 1028
ARGP4
ADDRLP4 2116
ADDRGP4 G_ClientNumberFromName
CALLI4
ASGNI4
ADDRLP4 2112
ADDRLP4 2116
INDIRI4
ASGNI4
line 1633
;1632:
;1633:		if ( clientid == -1 )
ADDRLP4 2112
INDIRI4
CNSTI4 -1
NEI4 $794
line 1634
;1634:		{
line 1635
;1635:			clientid = G_ClientNumberFromStrippedName(arg2);
ADDRLP4 1028
ARGP4
ADDRLP4 2120
ADDRGP4 G_ClientNumberFromStrippedName
CALLI4
ASGNI4
ADDRLP4 2112
ADDRLP4 2120
INDIRI4
ASGNI4
line 1637
;1636:
;1637:			if (clientid == -1)
ADDRLP4 2112
INDIRI4
CNSTI4 -1
NEI4 $796
line 1638
;1638:			{
line 1639
;1639:				trap_SendServerCommand( ent-g_entities, va("print \"there is no client named '%s' currently on the server.\n\"", arg2 ) );
ADDRGP4 $798
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 2124
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
ADDRLP4 2124
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1640
;1640:				return;
ADDRGP4 $692
JUMPV
LABELV $796
line 1642
;1641:			}
;1642:		}
LABELV $794
line 1644
;1643:
;1644:		Com_sprintf ( level.voteString, sizeof(level.voteString ), "clientkick %d", clientid );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $801
ARGP4
ADDRLP4 2112
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1645
;1645:		Com_sprintf ( level.voteDisplayString, sizeof(level.voteDisplayString), "kick %s", g_entities[clientid].client->pers.netname );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $790
ARGP4
CNSTI4 828
ADDRLP4 2112
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1646
;1646:	}
ADDRGP4 $793
JUMPV
LABELV $792
line 1647
;1647:	else if ( !Q_stricmp( arg1, "nextmap" ) ) 
ADDRLP4 4
ARGP4
ADDRGP4 $716
ARGP4
ADDRLP4 2112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $805
line 1648
;1648:	{
line 1651
;1649:		char	s[MAX_STRING_CHARS];
;1650:
;1651:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $716
ARGP4
ADDRLP4 2116
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1652
;1652:		if (!*s) {
ADDRLP4 2116
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $807
line 1653
;1653:			trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
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
ADDRGP4 $809
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1654
;1654:			return;
ADDRGP4 $692
JUMPV
LABELV $807
line 1656
;1655:		}
;1656:		Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $812
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1657
;1657:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $774
ARGP4
ADDRGP4 level+228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1658
;1658:	} 
ADDRGP4 $806
JUMPV
LABELV $805
line 1660
;1659:	else
;1660:	{
line 1661
;1661:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $818
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1662
;1662:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $774
ARGP4
ADDRGP4 level+228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1663
;1663:	}
LABELV $806
LABELV $793
LABELV $777
LABELV $761
LABELV $746
line 1665
;1664:
;1665:	trap_SendServerCommand( -1, va("print \"%s %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLCALLEDVOTE") ) );
ADDRGP4 $116
ARGP4
ADDRGP4 $823
ARGP4
ADDRLP4 2116
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $822
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 2116
INDIRP4
ARGP4
ADDRLP4 2120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1668
;1666:
;1667:	// start the voting, the caller autoamtically votes yes
;1668:	level.voteTime = level.time;
ADDRGP4 level+2276
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1669
;1669:	level.voteYes = 1;
ADDRGP4 level+2284
CNSTI4 1
ASGNI4
line 1670
;1670:	level.voteNo = 0;
ADDRGP4 level+2288
CNSTI4 0
ASGNI4
line 1672
;1671:
;1672:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $831
JUMPV
LABELV $828
line 1673
;1673:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2124
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 2124
INDIRP4
ADDRLP4 2124
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1674
;1674:	}
LABELV $829
line 1672
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $831
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $828
line 1675
;1675:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 2124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 2124
INDIRP4
ADDRLP4 2124
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1677
;1676:
;1677:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $833
ARGP4
ADDRGP4 level+2276
INDIRI4
ARGI4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1678
;1678:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+1252
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1679
;1679:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $833
ARGP4
ADDRGP4 level+2284
INDIRI4
ARGI4
ADDRLP4 2132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 2132
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1680
;1680:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $833
ARGP4
ADDRGP4 level+2288
INDIRI4
ARGI4
ADDRLP4 2136
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 2136
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1681
;1681:}
LABELV $692
endproc Cmd_CallVote_f 3144 24
export Cmd_Vote_f
proc Cmd_Vote_f 84 12
line 1688
;1682:
;1683:/*
;1684:==================
;1685:Cmd_Vote_f
;1686:==================
;1687:*/
;1688:void Cmd_Vote_f( gentity_t *ent ) {
line 1691
;1689:	char		msg[64];
;1690:
;1691:	if ( !level.voteTime ) {
ADDRGP4 level+2276
INDIRI4
CNSTI4 0
NEI4 $839
line 1692
;1692:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTEINPROG")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $842
ARGP4
ADDRLP4 64
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
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
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1693
;1693:		return;
ADDRGP4 $838
JUMPV
LABELV $839
line 1695
;1694:	}
;1695:	if ( ent->client->ps.eFlags & EF_VOTED ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $843
line 1696
;1696:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "VOTEALREADY")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $845
ARGP4
ADDRLP4 64
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
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
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1697
;1697:		return;
ADDRGP4 $838
JUMPV
LABELV $843
line 1699
;1698:	}
;1699:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $846
line 1700
;1700:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTEASSPEC")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $848
ARGP4
ADDRLP4 64
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
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
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1701
;1701:		return;
ADDRGP4 $838
JUMPV
LABELV $846
line 1704
;1702:	}
;1703:
;1704:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PLVOTECAST")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $849
ARGP4
ADDRLP4 64
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
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
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1706
;1705:
;1706:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1708
;1707:
;1708:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1710
;1709:
;1710:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $855
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $855
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $850
LABELV $855
line 1711
;1711:		level.voteYes++;
ADDRLP4 76
ADDRGP4 level+2284
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1712
;1712:		trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $833
ARGP4
ADDRGP4 level+2284
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1713
;1713:	} else {
ADDRGP4 $851
JUMPV
LABELV $850
line 1714
;1714:		level.voteNo++;
ADDRLP4 76
ADDRGP4 level+2288
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1715
;1715:		trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $833
ARGP4
ADDRGP4 level+2288
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1716
;1716:	}
LABELV $851
line 1720
;1717:
;1718:	// a majority will be determined in CheckVote, which will also account
;1719:	// for players entering or leaving
;1720:}
LABELV $838
endproc Cmd_Vote_f 84 12
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2164 20
line 1727
;1721:
;1722:/*
;1723:==================
;1724:Cmd_CallTeamVote_f
;1725:==================
;1726:*/
;1727:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1732
;1728:	int		i, team, cs_offset;
;1729:	char	arg1[MAX_STRING_TOKENS];
;1730:	char	arg2[MAX_STRING_TOKENS];
;1731:
;1732:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1733
;1733:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $861
line 1734
;1734:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $862
JUMPV
LABELV $861
line 1735
;1735:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $860
line 1736
;1736:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1738
;1737:	else
;1738:		return;
LABELV $864
LABELV $862
line 1740
;1739:
;1740:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $865
line 1741
;1741:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $696
ARGP4
ADDRLP4 2060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRLP4 2064
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1742
;1742:		return;
ADDRGP4 $860
JUMPV
LABELV $865
line 1745
;1743:	}
;1744:
;1745:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $868
line 1746
;1746:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TEAMVOTEALREADY")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $871
ARGP4
ADDRLP4 2060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRLP4 2064
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1747
;1747:		return;
ADDRGP4 $860
JUMPV
LABELV $868
line 1749
;1748:	}
;1749:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1524
ADDP4
INDIRI4
CNSTI4 3
LTI4 $872
line 1750
;1750:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MAXTEAMVOTES")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $874
ARGP4
ADDRLP4 2060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRLP4 2064
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1751
;1751:		return;
ADDRGP4 $860
JUMPV
LABELV $872
line 1753
;1752:	}
;1753:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $875
line 1754
;1754:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOSPECVOTE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $706
ARGP4
ADDRLP4 2060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRLP4 2064
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1755
;1755:		return;
ADDRGP4 $860
JUMPV
LABELV $875
line 1759
;1756:	}
;1757:
;1758:	// make sure it is a valid command to vote on
;1759:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1760
;1760:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1761
;1761:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $880
JUMPV
LABELV $877
line 1762
;1762:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $881
line 1763
;1763:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $883
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $881
line 1764
;1764:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 2064
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1765
;1765:	}
LABELV $878
line 1761
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $880
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $877
line 1767
;1766:
;1767:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
ADDRLP4 1036
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2064
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $886
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2068
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2068
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $884
LABELV $886
line 1768
;1768:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $710
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1769
;1769:		return;
ADDRGP4 $860
JUMPV
LABELV $884
line 1772
;1770:	}
;1771:
;1772:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $889
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $887
line 1775
;1773:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1774:
;1775:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $890
line 1776
;1776:			i = ent->client->ps.clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 1777
;1777:		}
ADDRGP4 $891
JUMPV
LABELV $890
line 1778
;1778:		else {
line 1780
;1779:			// numeric values are just slot numbers
;1780:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $892
line 1781
;1781:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
ADDRLP4 2148
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2148
INDIRI4
CNSTI4 0
EQI4 $899
ADDRLP4 2148
INDIRI4
CNSTI4 48
LTI4 $899
ADDRLP4 2148
INDIRI4
CNSTI4 57
LEI4 $896
LABELV $899
line 1782
;1782:					break;
ADDRGP4 $894
JUMPV
LABELV $896
line 1783
;1783:			}
LABELV $893
line 1780
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $892
LABELV $894
line 1784
;1784:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $902
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $900
LABELV $902
line 1785
;1785:				i = atoi( arg2 );
ADDRLP4 4
ARGP4
ADDRLP4 2152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2152
INDIRI4
ASGNI4
line 1786
;1786:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $906
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $903
LABELV $906
line 1787
;1787:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $146
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
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
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1788
;1788:					return;
ADDRGP4 $860
JUMPV
LABELV $903
line 1791
;1789:				}
;1790:
;1791:				if ( !g_entities[i].inuse ) {
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $901
line 1792
;1792:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $149
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
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
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1793
;1793:					return;
ADDRGP4 $860
JUMPV
line 1795
;1794:				}
;1795:			}
LABELV $900
line 1796
;1796:			else {
line 1797
;1797:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2112
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1798
;1798:				Q_CleanStr(leader);
ADDRLP4 2112
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1799
;1799:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $913
JUMPV
LABELV $910
line 1800
;1800:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $915
line 1801
;1801:						continue;
ADDRGP4 $911
JUMPV
LABELV $915
line 1802
;1802:					if (level.clients[i].sess.sessionTeam != team)
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
ADDRLP4 1028
INDIRI4
EQI4 $917
line 1803
;1803:						continue;
ADDRGP4 $911
JUMPV
LABELV $917
line 1804
;1804:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2076
ARGP4
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1805
;1805:					Q_CleanStr(netname);
ADDRLP4 2076
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1806
;1806:					if ( !Q_stricmp(netname, leader) ) {
ADDRLP4 2076
ARGP4
ADDRLP4 2112
ARGP4
ADDRLP4 2152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2152
INDIRI4
CNSTI4 0
NEI4 $919
line 1807
;1807:						break;
ADDRGP4 $912
JUMPV
LABELV $919
line 1809
;1808:					}
;1809:				}
LABELV $911
line 1799
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $913
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $910
LABELV $912
line 1810
;1810:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $921
line 1811
;1811:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $924
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2152
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
ADDRLP4 2152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1812
;1812:					return;
ADDRGP4 $860
JUMPV
LABELV $921
line 1814
;1813:				}
;1814:			}
LABELV $901
line 1815
;1815:		}
LABELV $891
line 1816
;1816:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $268
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1817
;1817:	} else {
ADDRGP4 $888
JUMPV
LABELV $887
line 1818
;1818:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $710
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1819
;1819:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
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
ADDRGP4 $925
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1820
;1820:		return;
ADDRGP4 $860
JUMPV
LABELV $888
line 1823
;1821:	}
;1822:
;1823:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2304
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $759
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1825
;1824:
;1825:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $931
JUMPV
LABELV $928
line 1826
;1826:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $933
line 1827
;1827:			continue;
ADDRGP4 $929
JUMPV
LABELV $933
line 1828
;1828:		if (level.clients[i].sess.sessionTeam == team)
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
ADDRLP4 1028
INDIRI4
NEI4 $935
line 1829
;1829:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $937
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $935
line 1830
;1830:	}
LABELV $929
line 1825
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $931
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $928
line 1833
;1831:
;1832:	// start the voting, the caller autoamtically votes yes
;1833:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1834
;1834:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4360
ADDP4
CNSTI4 1
ASGNI4
line 1835
;1835:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4368
ADDP4
CNSTI4 0
ASGNI4
line 1837
;1836:
;1837:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $945
JUMPV
LABELV $942
line 1838
;1838:		if (level.clients[i].sess.sessionTeam == team)
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
ADDRLP4 1028
INDIRI4
NEI4 $947
line 1839
;1839:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2076
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
LABELV $947
line 1840
;1840:	}
LABELV $943
line 1837
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $945
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $942
line 1841
;1841:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 2076
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1843
;1842:
;1843:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $833
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
INDIRI4
ARGI4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1844
;1844:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
ADDRLP4 1032
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2304
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1845
;1845:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $833
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4360
ADDP4
INDIRI4
ARGI4
ADDRLP4 2088
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1846
;1846:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $833
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4368
ADDP4
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1847
;1847:}
LABELV $860
endproc Cmd_CallTeamVote_f 2164 20
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 92 12
line 1854
;1848:
;1849:/*
;1850:==================
;1851:Cmd_TeamVote_f
;1852:==================
;1853:*/
;1854:void Cmd_TeamVote_f( gentity_t *ent ) {
line 1858
;1855:	int			team, cs_offset;
;1856:	char		msg[64];
;1857:
;1858:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1859
;1859:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $954
line 1860
;1860:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $955
JUMPV
LABELV $954
line 1861
;1861:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $953
line 1862
;1862:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1864
;1863:	else
;1864:		return;
LABELV $957
LABELV $955
line 1866
;1865:
;1866:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
INDIRI4
CNSTI4 0
NEI4 $958
line 1867
;1867:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOTEAMVOTEINPROG")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $961
ARGP4
ADDRLP4 72
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
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
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1868
;1868:		return;
ADDRGP4 $953
JUMPV
LABELV $958
line 1870
;1869:	}
;1870:	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $962
line 1871
;1871:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TEAMVOTEALREADYCAST")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $964
ARGP4
ADDRLP4 72
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
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
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1872
;1872:		return;
ADDRGP4 $953
JUMPV
LABELV $962
line 1874
;1873:	}
;1874:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $965
line 1875
;1875:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTEASSPEC")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $848
ARGP4
ADDRLP4 72
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
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
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1876
;1876:		return;
ADDRGP4 $953
JUMPV
LABELV $965
line 1879
;1877:	}
;1878:
;1879:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PLTEAMVOTECAST")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $967
ARGP4
ADDRLP4 72
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
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
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1881
;1880:
;1881:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1883
;1882:
;1883:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1885
;1884:
;1885:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $973
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $973
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $968
LABELV $973
line 1886
;1886:		level.teamVoteYes[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4360
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1887
;1887:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $833
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4360
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1888
;1888:	} else {
ADDRGP4 $969
JUMPV
LABELV $968
line 1889
;1889:		level.teamVoteNo[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4368
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1890
;1890:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $833
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4368
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1891
;1891:	}
LABELV $969
line 1895
;1892:
;1893:	// a majority will be determined in TeamCheckVote, which will also account
;1894:	// for players entering or leaving
;1895:}
LABELV $953
endproc Cmd_TeamVote_f 92 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 1903
;1896:
;1897:
;1898:/*
;1899:=================
;1900:Cmd_SetViewpos_f
;1901:=================
;1902:*/
;1903:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 1908
;1904:	vec3_t		origin, angles;
;1905:	char		buffer[MAX_TOKEN_CHARS];
;1906:	int			i;
;1907:
;1908:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $979
line 1909
;1909:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOCHEATS")));
ADDRGP4 $116
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 1052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1910
;1910:		return;
ADDRGP4 $978
JUMPV
LABELV $979
line 1912
;1911:	}
;1912:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $982
line 1913
;1913:		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $984
ARGP4
ADDRLP4 1056
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1914
;1914:		return;
ADDRGP4 $978
JUMPV
LABELV $982
line 1917
;1915:	}
;1916:
;1917:	VectorClear( angles );
ADDRLP4 1056
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1056
INDIRF4
ASGNF4
line 1918
;1918:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $987
line 1919
;1919:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1920
;1920:		origin[i] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1060
INDIRF4
ASGNF4
line 1921
;1921:	}
LABELV $988
line 1918
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $987
line 1923
;1922:
;1923:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1924
;1924:	angles[YAW] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1060
INDIRF4
ASGNF4
line 1926
;1925:
;1926:	TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1927
;1927:}
LABELV $978
endproc Cmd_SetViewpos_f 1064 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 1936
;1928:
;1929:
;1930:
;1931:/*
;1932:=================
;1933:Cmd_Stats_f
;1934:=================
;1935:*/
;1936:void Cmd_Stats_f( gentity_t *ent ) {
line 1951
;1937:/*
;1938:	int max, n, i;
;1939:
;1940:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;1941:
;1942:	n = 0;
;1943:	for ( i = 0; i < max; i++ ) {
;1944:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;1945:			n++;
;1946:	}
;1947:
;1948:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;1949:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;1950:*/
;1951:}
LABELV $992
endproc Cmd_Stats_f 0 0
export G_ItemUsable
proc G_ItemUsable 1228 28
line 1954
;1952:
;1953:int G_ItemUsable(playerState_t *ps, int forcedUse)
;1954:{
line 1961
;1955:	vec3_t fwd, fwdorg, dest, pos;
;1956:	vec3_t yawonly;
;1957:	vec3_t mins, maxs;
;1958:	vec3_t trtest;
;1959:	trace_t tr;
;1960:
;1961:	if (ps->usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $994
line 1962
;1962:	{
line 1963
;1963:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $993
JUMPV
LABELV $994
line 1966
;1964:	}
;1965:	
;1966:	if (ps->pm_flags & PMF_USE_ITEM_HELD)
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $996
line 1967
;1967:	{ //force to let go first
line 1968
;1968:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $993
JUMPV
LABELV $996
line 1971
;1969:	}
;1970:
;1971:	if (!forcedUse)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $998
line 1972
;1972:	{
line 1973
;1973:		forcedUse = bg_itemlist[ps->stats[STAT_HOLDABLE_ITEM]].giTag;
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
line 1974
;1974:	}
LABELV $998
line 1976
;1975:
;1976:	switch (forcedUse)
ADDRLP4 1176
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 1
LTI4 $1001
ADDRLP4 1176
INDIRI4
CNSTI4 6
GTI4 $1001
ADDRLP4 1176
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1060-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1060
address $1008
address $1038
address $1003
address $1001
address $1001
address $1011
code
line 1977
;1977:	{
LABELV $1003
line 1979
;1978:	case HI_MEDPAC:
;1979:		if (ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH])
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
LTI4 $1004
line 1980
;1980:		{
line 1981
;1981:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $993
JUMPV
LABELV $1004
line 1984
;1982:		}
;1983:
;1984:		if (ps->stats[STAT_HEALTH] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1006
line 1985
;1985:		{
line 1986
;1986:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $993
JUMPV
LABELV $1006
line 1989
;1987:		}
;1988:
;1989:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $993
JUMPV
LABELV $1008
line 1991
;1990:	case HI_SEEKER:
;1991:		if (ps->eFlags & EF_SEEKERDRONE)
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $1009
line 1992
;1992:		{
line 1993
;1993:			G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SEEKER_ALREADYDEPLOYED);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 56
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1994
;1994:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $993
JUMPV
LABELV $1009
line 1997
;1995:		}
;1996:
;1997:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $993
JUMPV
LABELV $1011
line 1999
;1998:	case HI_SENTRY_GUN:
;1999:		if (ps->fd.sentryDeployed)
ADDRFP4 0
INDIRP4
CNSTI4 1224
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1012
line 2000
;2000:		{
line 2001
;2001:			G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SENTRY_ALREADYPLACED);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 56
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2002
;2002:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $993
JUMPV
LABELV $1012
line 2005
;2003:		}
;2004:
;2005:		yawonly[ROLL] = 0;
ADDRLP4 1140+8
CNSTF4 0
ASGNF4
line 2006
;2006:		yawonly[PITCH] = 0;
ADDRLP4 1140
CNSTF4 0
ASGNF4
line 2007
;2007:		yawonly[YAW] = ps->viewangles[YAW];
ADDRLP4 1140+4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2009
;2008:
;2009:		VectorSet( mins, -8, -8, 0 );
ADDRLP4 1184
CNSTF4 3238002688
ASGNF4
ADDRLP4 1092
ADDRLP4 1184
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1184
INDIRF4
ASGNF4
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 2010
;2010:		VectorSet( maxs, 8, 8, 24 );
ADDRLP4 1188
CNSTF4 1090519040
ASGNF4
ADDRLP4 1104
ADDRLP4 1188
INDIRF4
ASGNF4
ADDRLP4 1104+4
ADDRLP4 1188
INDIRF4
ASGNF4
ADDRLP4 1104+8
CNSTF4 1103101952
ASGNF4
line 2012
;2011:
;2012:		AngleVectors(yawonly, fwd, NULL, NULL);
ADDRLP4 1140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1192
CNSTP4 0
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2014
;2013:
;2014:		fwdorg[0] = ps->origin[0] + fwd[0]*64;
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
line 2015
;2015:		fwdorg[1] = ps->origin[1] + fwd[1]*64;
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
line 2016
;2016:		fwdorg[2] = ps->origin[2] + fwd[2]*64;
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
line 2018
;2017:
;2018:		trtest[0] = fwdorg[0] + fwd[0]*16;
ADDRLP4 1152
ADDRLP4 1116
INDIRF4
CNSTF4 1098907648
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2019
;2019:		trtest[1] = fwdorg[1] + fwd[1]*16;
ADDRLP4 1152+4
ADDRLP4 1116+4
INDIRF4
CNSTF4 1098907648
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2020
;2020:		trtest[2] = fwdorg[2] + fwd[2]*16;
ADDRLP4 1152+8
ADDRLP4 1116+8
INDIRF4
CNSTF4 1098907648
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2022
;2021:
;2022:		trap_Trace(&tr, ps->origin, mins, maxs, trtest, ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 12
ARGP4
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
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
ADDRLP4 1196
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2024
;2023:
;2024:		if ((tr.fraction != 1 && tr.entityNum != ps->clientNum) || tr.startsolid || tr.allsolid)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $1036
ADDRLP4 12+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $1037
LABELV $1036
ADDRLP4 1200
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1200
INDIRI4
NEI4 $1037
ADDRLP4 12
INDIRI4
ADDRLP4 1200
INDIRI4
EQI4 $1030
LABELV $1037
line 2025
;2025:		{
line 2026
;2026:			G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SENTRY_NOROOM);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 56
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2027
;2027:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $993
JUMPV
LABELV $1030
line 2030
;2028:		}
;2029:
;2030:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $993
JUMPV
LABELV $1038
line 2032
;2031:	case HI_SHIELD:
;2032:		mins[0] = -8;
ADDRLP4 1092
CNSTF4 3238002688
ASGNF4
line 2033
;2033:		mins[1] = -8;
ADDRLP4 1092+4
CNSTF4 3238002688
ASGNF4
line 2034
;2034:		mins[2] = 0;
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 2036
;2035:
;2036:		maxs[0] = 8;
ADDRLP4 1104
CNSTF4 1090519040
ASGNF4
line 2037
;2037:		maxs[1] = 8;
ADDRLP4 1104+4
CNSTF4 1090519040
ASGNF4
line 2038
;2038:		maxs[2] = 8;
ADDRLP4 1104+8
CNSTF4 1090519040
ASGNF4
line 2040
;2039:
;2040:		AngleVectors (ps->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1204
CNSTP4 0
ASGNP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2041
;2041:		fwd[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2042
;2042:		VectorMA(ps->origin, 64, fwd, dest);
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
CNSTF4 1115684864
ASGNF4
ADDRLP4 1128
ADDRLP4 1208
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1212
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1128+4
ADDRLP4 1208
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1212
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
line 2043
;2043:		trap_Trace(&tr, ps->origin, mins, maxs, dest, ps->clientNum, MASK_SHOT );
ADDRLP4 12
ARGP4
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
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
ADDRLP4 1216
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2044
;2044:		if (tr.fraction > 0.9 && !tr.startsolid && !tr.allsolid)
ADDRLP4 12+8
INDIRF4
CNSTF4 1063675494
LEF4 $1048
ADDRLP4 1220
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1220
INDIRI4
NEI4 $1048
ADDRLP4 12
INDIRI4
ADDRLP4 1220
INDIRI4
NEI4 $1048
line 2045
;2045:		{
line 2046
;2046:			VectorCopy(tr.endpos, pos);
ADDRLP4 1164
ADDRLP4 12+12
INDIRB
ASGNB 12
line 2047
;2047:			VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
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
line 2048
;2048:			trap_Trace( &tr, pos, mins, maxs, dest, ps->clientNum, MASK_SOLID );
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
ADDRGP4 trap_Trace
CALLV
pop
line 2049
;2049:			if ( !tr.startsolid && !tr.allsolid )
ADDRLP4 1224
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1224
INDIRI4
NEI4 $1057
ADDRLP4 12
INDIRI4
ADDRLP4 1224
INDIRI4
NEI4 $1057
line 2050
;2050:			{
line 2051
;2051:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $993
JUMPV
LABELV $1057
line 2053
;2052:			}
;2053:		}
LABELV $1048
line 2054
;2054:		G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SHIELD_NOROOM);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 56
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2055
;2055:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $993
JUMPV
LABELV $1001
line 2057
;2056:	default:
;2057:		return 1;
CNSTI4 1
RETI4
LABELV $993
endproc G_ItemUsable 1228 28
export Cmd_ToggleSaber_f
proc Cmd_ToggleSaber_f 12 12
line 2065
;2058:	}
;2059:}
;2060:
;2061:extern int saberOffSound;
;2062:extern int saberOnSound;
;2063:
;2064:void Cmd_ToggleSaber_f(gentity_t *ent)
;2065:{
line 2066
;2066:	if (!saberOffSound || !saberOnSound)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 saberOffSound
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1065
ADDRGP4 saberOnSound
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1063
LABELV $1065
line 2067
;2067:	{
line 2068
;2068:		saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $1066
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 4
INDIRI4
ASGNI4
line 2069
;2069:		saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $1067
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 8
INDIRI4
ASGNI4
line 2070
;2070:	}
LABELV $1063
line 2072
;2071:
;2072:	if (ent->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1068
line 2073
;2073:	{
line 2074
;2074:		return;
ADDRGP4 $1062
JUMPV
LABELV $1068
line 2077
;2075:	}
;2076:
;2077:	if (ent->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1070
line 2078
;2078:	{
line 2079
;2079:		return;
ADDRGP4 $1062
JUMPV
LABELV $1070
line 2082
;2080:	}
;2081:
;2082:	if (ent->client->ps.weapon != WP_SABER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1072
line 2083
;2083:	{
line 2084
;2084:		return;
ADDRGP4 $1062
JUMPV
LABELV $1072
line 2092
;2085:	}
;2086:
;2087://	if (ent->client->ps.duelInProgress && !ent->client->ps.saberHolstered)
;2088://	{
;2089://		return;
;2090://	}
;2091:
;2092:	if (ent->client->ps.duelTime >= level.time)
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
LTI4 $1074
line 2093
;2093:	{
line 2094
;2094:		return;
ADDRGP4 $1062
JUMPV
LABELV $1074
line 2097
;2095:	}
;2096:
;2097:	if (ent->client->ps.saberLockTime >= level.time)
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
LTI4 $1077
line 2098
;2098:	{
line 2099
;2099:		return;
ADDRGP4 $1062
JUMPV
LABELV $1077
line 2102
;2100:	}
;2101:
;2102:	if (ent->client && ent->client->ps.weaponTime < 1)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1080
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1080
line 2103
;2103:	{
line 2104
;2104:		if (ent->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1082
line 2105
;2105:		{
line 2106
;2106:			ent->client->ps.saberHolstered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 0
ASGNI4
line 2107
;2107:			G_Sound(ent, CHAN_AUTO, saberOnSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOnSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2108
;2108:		}
ADDRGP4 $1083
JUMPV
LABELV $1082
line 2110
;2109:		else
;2110:		{
line 2111
;2111:			ent->client->ps.saberHolstered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 1
ASGNI4
line 2112
;2112:			G_Sound(ent, CHAN_AUTO, saberOffSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOffSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2115
;2113:
;2114:			//prevent anything from being done for 400ms after holster
;2115:			ent->client->ps.weaponTime = 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 400
ASGNI4
line 2116
;2116:		}
LABELV $1083
line 2117
;2117:	}
LABELV $1080
line 2118
;2118:}
LABELV $1062
endproc Cmd_ToggleSaber_f 12 12
export Cmd_SaberAttackCycle_f
proc Cmd_SaberAttackCycle_f 12 0
line 2121
;2119:
;2120:void Cmd_SaberAttackCycle_f(gentity_t *ent)
;2121:{
line 2122
;2122:	int selectLevel = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2124
;2123:
;2124:	if ( !ent || !ent->client )
ADDRLP4 4
ADDRFP4 0
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
EQU4 $1087
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $1085
LABELV $1087
line 2125
;2125:	{
line 2126
;2126:		return;
ADDRGP4 $1084
JUMPV
LABELV $1085
line 2135
;2127:	}
;2128:	/*
;2129:	if (ent->client->ps.weaponTime > 0)
;2130:	{ //no switching attack level when busy
;2131:		return;
;2132:	}
;2133:	*/
;2134:
;2135:	if (ent->client->saberCycleQueue)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1088
line 2136
;2136:	{ //resume off of the queue if we haven't gotten a chance to update it yet
line 2137
;2137:		selectLevel = ent->client->saberCycleQueue;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
ASGNI4
line 2138
;2138:	}
ADDRGP4 $1089
JUMPV
LABELV $1088
line 2140
;2139:	else
;2140:	{
line 2141
;2141:		selectLevel = ent->client->ps.fd.saberAnimLevel;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 2142
;2142:	}
LABELV $1089
line 2144
;2143:
;2144:	selectLevel++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2145
;2145:	if ( selectLevel > ent->client->ps.fd.forcePowerLevel[FP_SABERATTACK] )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
LEI4 $1090
line 2146
;2146:	{
line 2147
;2147:		selectLevel = FORCE_LEVEL_1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2148
;2148:	}
LABELV $1090
line 2165
;2149:/*
;2150:#ifndef FINAL_BUILD
;2151:	switch ( selectLevel )
;2152:	{
;2153:	case FORCE_LEVEL_1:
;2154:		trap_SendServerCommand( ent-g_entities, va("print \"Lightsaber Combat Style: %sfast\n\"", S_COLOR_BLUE) );
;2155:		break;
;2156:	case FORCE_LEVEL_2:
;2157:		trap_SendServerCommand( ent-g_entities, va("print \"Lightsaber Combat Style: %smedium\n\"", S_COLOR_YELLOW) );
;2158:		break;
;2159:	case FORCE_LEVEL_3:
;2160:		trap_SendServerCommand( ent-g_entities, va("print \"Lightsaber Combat Style: %sstrong\n\"", S_COLOR_RED) );
;2161:		break;
;2162:	}
;2163:#endif
;2164:*/
;2165:	if (ent->client->ps.weaponTime <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1092
line 2166
;2166:	{ //not busy, set it now
line 2167
;2167:		ent->client->ps.fd.saberAnimLevel = selectLevel;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2168
;2168:	}
ADDRGP4 $1093
JUMPV
LABELV $1092
line 2170
;2169:	else
;2170:	{ //can't set it now or we might cause unexpected chaining, so queue it
line 2171
;2171:		ent->client->saberCycleQueue = selectLevel;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1580
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2172
;2172:	}
LABELV $1093
line 2173
;2173:}
LABELV $1084
endproc Cmd_SaberAttackCycle_f 12 0
export G_OtherPlayersDueling
proc G_OtherPlayersDueling 24 0
line 2176
;2174:
;2175:qboolean G_OtherPlayersDueling(void)
;2176:{
line 2177
;2177:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1096
JUMPV
LABELV $1095
line 2181
;2178:	gentity_t *ent;
;2179:
;2180:	while (i < MAX_CLIENTS)
;2181:	{
line 2182
;2182:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2184
;2183:
;2184:		if (ent && ent->inuse && ent->client && ent->client->ps.duelInProgress)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1098
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1098
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1098
ADDRLP4 20
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1098
line 2185
;2185:		{
line 2186
;2186:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1094
JUMPV
LABELV $1098
line 2188
;2187:		}
;2188:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2189
;2189:	}
LABELV $1096
line 2180
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1095
line 2191
;2190:
;2191:	return qfalse;
CNSTI4 0
RETI4
LABELV $1094
endproc G_OtherPlayersDueling 24 0
export Cmd_EngageDuel_f
proc Cmd_EngageDuel_f 1204 28
line 2195
;2192:}
;2193:
;2194:void Cmd_EngageDuel_f(gentity_t *ent)
;2195:{
line 2199
;2196:	trace_t tr;
;2197:	vec3_t forward, fwdOrg;
;2198:
;2199:	if (!g_privateDuel.integer)
ADDRGP4 g_privateDuel+12
INDIRI4
CNSTI4 0
NEI4 $1101
line 2200
;2200:	{
line 2201
;2201:		return;
ADDRGP4 $1100
JUMPV
LABELV $1101
line 2204
;2202:	}
;2203:
;2204:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1104
line 2205
;2205:	{ //rather pointless in this mode..
line 2206
;2206:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NODUEL_GAMETYPE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1107
ARGP4
ADDRLP4 1104
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
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
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2207
;2207:		return;
ADDRGP4 $1100
JUMPV
LABELV $1104
line 2210
;2208:	}
;2209:
;2210:	if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $1108
line 2211
;2211:	{ //no private dueling in team modes
line 2212
;2212:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NODUEL_GAMETYPE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1107
ARGP4
ADDRLP4 1104
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
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
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2213
;2213:		return;
ADDRGP4 $1100
JUMPV
LABELV $1108
line 2216
;2214:	}
;2215:
;2216:	if (ent->client->ps.duelTime >= level.time)
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
LTI4 $1111
line 2217
;2217:	{
line 2218
;2218:		return;
ADDRGP4 $1100
JUMPV
LABELV $1111
line 2221
;2219:	}
;2220:
;2221:	if (ent->client->ps.weapon != WP_SABER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1114
line 2222
;2222:	{
line 2223
;2223:		return;
ADDRGP4 $1100
JUMPV
LABELV $1114
line 2234
;2224:	}
;2225:
;2226:	/*
;2227:	if (!ent->client->ps.saberHolstered)
;2228:	{ //must have saber holstered at the start of the duel
;2229:		return;
;2230:	}
;2231:	*/
;2232:	//NOTE: No longer doing this..
;2233:
;2234:	if (ent->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1116
line 2235
;2235:	{
line 2236
;2236:		return;
ADDRGP4 $1100
JUMPV
LABELV $1116
line 2239
;2237:	}
;2238:
;2239:	if (ent->client->ps.duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1118
line 2240
;2240:	{
line 2241
;2241:		return;
ADDRGP4 $1100
JUMPV
LABELV $1118
line 2245
;2242:	}
;2243:
;2244:	//New: Don't let a player duel if he just did and hasn't waited 10 seconds yet (note: If someone challenges him, his duel timer will reset so he can accept)
;2245:	if (ent->client->ps.fd.privateDuelTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1240
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1120
line 2246
;2246:	{
line 2247
;2247:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "CANTDUEL_JUSTDID")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1123
ARGP4
ADDRLP4 1104
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
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
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2248
;2248:		return;
ADDRGP4 $1100
JUMPV
LABELV $1120
line 2251
;2249:	}
;2250:
;2251:	if (G_OtherPlayersDueling())
ADDRLP4 1104
ADDRGP4 G_OtherPlayersDueling
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $1124
line 2252
;2252:	{
line 2253
;2253:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "CANTDUEL_BUSY")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1126
ARGP4
ADDRLP4 1108
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1112
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
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2254
;2254:		return;
ADDRGP4 $1100
JUMPV
LABELV $1124
line 2257
;2255:	}
;2256:
;2257:	AngleVectors( ent->client->ps.viewangles, forward, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 0
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
line 2259
;2258:
;2259:	fwdOrg[0] = ent->client->ps.origin[0] + forward[0]*256;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1132462080
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2260
;2260:	fwdOrg[1] = ent->client->ps.origin[1] + forward[1]*256;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1132462080
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2261
;2261:	fwdOrg[2] = (ent->client->ps.origin[2]+ent->client->ps.viewheight) + forward[2]*256;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 1112
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1112
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1132462080
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2263
;2262:
;2263:	trap_Trace(&tr, ent->client->ps.origin, NULL, NULL, fwdOrg, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 24
ARGP4
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
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
ADDRLP4 12
ARGP4
ADDRLP4 1116
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2265
;2264:
;2265:	if (tr.fraction != 1 && tr.entityNum < MAX_CLIENTS)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $1131
ADDRLP4 24+52
INDIRI4
CNSTI4 32
GEI4 $1131
line 2266
;2266:	{
line 2267
;2267:		gentity_t *challenged = &g_entities[tr.entityNum];
ADDRLP4 1124
CNSTI4 828
ADDRLP4 24+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2269
;2268:
;2269:		if (!challenged || !challenged->client || !challenged->inuse ||
ADDRLP4 1132
CNSTU4 0
ASGNU4
ADDRLP4 1124
INDIRP4
CVPU4 4
ADDRLP4 1132
INDIRU4
EQU4 $1144
ADDRLP4 1136
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CVPU4 4
ADDRLP4 1132
INDIRU4
EQU4 $1144
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 1124
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
EQI4 $1144
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRLP4 1124
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 1144
INDIRI4
LTI4 $1144
ADDRLP4 1136
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 1144
INDIRI4
LTI4 $1144
ADDRLP4 1136
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1144
ADDRLP4 1136
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $1144
ADDRLP4 1136
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
EQI4 $1136
LABELV $1144
line 2273
;2270:			challenged->health < 1 || challenged->client->ps.stats[STAT_HEALTH] < 1 ||
;2271:			challenged->client->ps.weapon != WP_SABER || challenged->client->ps.duelInProgress ||
;2272:			challenged->client->ps.saberInFlight)
;2273:		{
line 2274
;2274:			return;
ADDRGP4 $1100
JUMPV
LABELV $1136
line 2277
;2275:		}
;2276:
;2277:		if (g_gametype.integer >= GT_TEAM && OnSameTeam(ent, challenged))
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $1145
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
EQI4 $1145
line 2278
;2278:		{
line 2279
;2279:			return;
ADDRGP4 $1100
JUMPV
LABELV $1145
line 2282
;2280:		}
;2281:
;2282:		if (challenged->client->ps.duelIndex == ent->s.number && challenged->client->ps.duelTime >= level.time)
ADDRLP4 1152
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $1148
ADDRLP4 1152
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $1148
line 2283
;2283:		{
line 2284
;2284:			trap_SendServerCommand( /*challenged-g_entities*/-1, va("print \"%s %s %s!\n\"", challenged->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELACCEPT"), ent->client->pers.netname) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1152
ARGP4
ADDRLP4 1156
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1151
ARGP4
ADDRLP4 1160
CNSTI4 408
ASGNI4
ADDRLP4 1164
CNSTI4 1428
ASGNI4
ADDRLP4 1124
INDIRP4
ADDRLP4 1160
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1164
INDIRI4
ADDP4
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 1160
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1164
INDIRI4
ADDP4
ARGP4
ADDRLP4 1168
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2286
;2285:
;2286:			ent->client->ps.duelInProgress = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 1
ASGNI4
line 2287
;2287:			challenged->client->ps.duelInProgress = qtrue;
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 1
ASGNI4
line 2289
;2288:
;2289:			ent->client->ps.duelTime = level.time + 2000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2290
;2290:			challenged->client->ps.duelTime = level.time + 2000;
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2292
;2291:
;2292:			G_AddEvent(ent, EV_PRIVATE_DUEL, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2293
;2293:			G_AddEvent(challenged, EV_PRIVATE_DUEL, 1);
ADDRLP4 1124
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2297
;2294:            
;2295:            
;2296:            //DeMBones - Full health niggas!
;2297:            ent->client->ps.stats[STAT_ARMOR] = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 1172
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 1172
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 2298
;2298:            ent->client->ps.stats[STAT_HEALTH] = ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 1176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
ADDRLP4 1176
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1184
ADDRLP4 1180
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1176
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
ADDRLP4 1180
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 2300
;2299:            
;2300:            challenged->client->ps.stats[STAT_ARMOR] = challenged->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 1188
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 1188
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 2301
;2301:            challenged->client->ps.stats[STAT_HEALTH] = challenged->health = challenged->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 1196
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1200
ADDRLP4 1196
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1124
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
ADDRLP4 1196
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 2305
;2302:
;2303:			//Holster their sabers now, until the duel starts (then they'll get auto-turned on to look cool)
;2304:
;2305:			if (!ent->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1155
line 2306
;2306:			{
line 2307
;2307:				G_Sound(ent, CHAN_AUTO, saberOffSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOffSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2308
;2308:				ent->client->ps.weaponTime = 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 400
ASGNI4
line 2309
;2309:				ent->client->ps.saberHolstered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 1
ASGNI4
line 2310
;2310:			}
LABELV $1155
line 2311
;2311:			if (!challenged->client->ps.saberHolstered)
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1149
line 2312
;2312:			{
line 2313
;2313:				G_Sound(challenged, CHAN_AUTO, saberOffSound);
ADDRLP4 1124
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOffSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2314
;2314:				challenged->client->ps.weaponTime = 400;
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 400
ASGNI4
line 2315
;2315:				challenged->client->ps.saberHolstered = qtrue;
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 1
ASGNI4
line 2316
;2316:			}
line 2317
;2317:		}
ADDRGP4 $1149
JUMPV
LABELV $1148
line 2319
;2318:		else
;2319:		{
line 2321
;2320:			//Print the message that a player has been challenged in private, only announce the actual duel initiation in private
;2321:			trap_SendServerCommand( challenged-g_entities, va("cp \"%s %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELCHALLENGE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1160
ARGP4
ADDRLP4 1156
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1159
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ARGI4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2322
;2322:			trap_SendServerCommand( ent-g_entities, va("cp \"%s %s\n\"", G_GetStripEdString("SVINGAME", "PLDUELCHALLENGED"), challenged->client->pers.netname) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1161
ARGP4
ADDRLP4 1164
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1159
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1168
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
ADDRLP4 1168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2323
;2323:		}
LABELV $1149
line 2325
;2324:
;2325:		challenged->client->ps.fd.privateDuelTime = 0; //reset the timer in case this player just got out of a duel. He should still be able to accept the challenge.
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 0
ASGNI4
line 2327
;2326:
;2327:		ent->client->ps.forceHandExtend = HANDEXTEND_DUELCHALLENGE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 9
ASGNI4
line 2328
;2328:		ent->client->ps.forceHandExtendTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2330
;2329:
;2330:		ent->client->ps.duelIndex = challenged->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
ADDRLP4 1124
INDIRP4
INDIRI4
ASGNI4
line 2331
;2331:		ent->client->ps.duelTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 2332
;2332:	}
LABELV $1131
line 2333
;2333:}
LABELV $1100
endproc Cmd_EngageDuel_f 1204 28
export StandardSetBodyAnim
proc StandardSetBodyAnim 380 16
line 2418
;2334:
;2335:void PM_SetAnim(int setAnimParts,int anim,int setAnimFlags, int blendTime);
;2336:
;2337:#ifdef _DEBUG
;2338:extern stringID_table_t animTable[MAX_ANIMATIONS+1];
;2339:
;2340:void Cmd_DebugSetSaberMove_f(gentity_t *self)
;2341:{
;2342:	int argNum = trap_Argc();
;2343:	char arg[MAX_STRING_CHARS];
;2344:
;2345:	if (argNum < 2)
;2346:	{
;2347:		return;
;2348:	}
;2349:
;2350:	trap_Argv( 1, arg, sizeof( arg ) );
;2351:
;2352:	if (!arg[0])
;2353:	{
;2354:		return;
;2355:	}
;2356:
;2357:	self->client->ps.saberMove = atoi(arg);
;2358:	self->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
;2359:
;2360:	if (self->client->ps.saberMove >= LS_MOVE_MAX)
;2361:	{
;2362:		self->client->ps.saberMove = LS_MOVE_MAX-1;
;2363:	}
;2364:
;2365:	Com_Printf("Anim for move: %s\n", animTable[saberMoveData[self->client->ps.saberMove].animToUse].name);
;2366:}
;2367:
;2368:void Cmd_DebugSetBodyAnim_f(gentity_t *self, int flags)
;2369:{
;2370:	int argNum = trap_Argc();
;2371:	char arg[MAX_STRING_CHARS];
;2372:	int i = 0;
;2373:	pmove_t pmv;
;2374:
;2375:	if (argNum < 2)
;2376:	{
;2377:		return;
;2378:	}
;2379:
;2380:	trap_Argv( 1, arg, sizeof( arg ) );
;2381:
;2382:	if (!arg[0])
;2383:	{
;2384:		return;
;2385:	}
;2386:
;2387:	while (i < MAX_ANIMATIONS)
;2388:	{
;2389:		if (!Q_stricmp(arg, animTable[i].name))
;2390:		{
;2391:			break;
;2392:		}
;2393:		i++;
;2394:	}
;2395:
;2396:	if (i == MAX_ANIMATIONS)
;2397:	{
;2398:		Com_Printf("Animation '%s' does not exist\n", arg);
;2399:		return;
;2400:	}
;2401:
;2402:	memset (&pmv, 0, sizeof(pmv));
;2403:	pmv.ps = &self->client->ps;
;2404:	pmv.animations = bgGlobalAnimations;
;2405:	pmv.cmd = self->client->pers.cmd;
;2406:	pmv.trace = trap_Trace;
;2407:	pmv.pointcontents = trap_PointContents;
;2408:	pmv.gametype = g_gametype.integer;
;2409:
;2410:	pm = &pmv;
;2411:	PM_SetAnim(SETANIM_BOTH, i, flags, 0);
;2412:
;2413:	Com_Printf("Set body anim to %s\n", arg);
;2414:}
;2415:#endif
;2416:
;2417:void StandardSetBodyAnim(gentity_t *self, int anim, int flags)
;2418:{
line 2421
;2419:	pmove_t pmv;
;2420:
;2421:	memset (&pmv, 0, sizeof(pmv));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 380
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2422
;2422:	pmv.ps = &self->client->ps;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 2423
;2423:	pmv.animations = bgGlobalAnimations;
ADDRLP4 0+224
ADDRGP4 bgGlobalAnimations
ASGNP4
line 2424
;2424:	pmv.cmd = self->client->pers.cmd;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRB
ASGNB 28
line 2425
;2425:	pmv.trace = trap_Trace;
ADDRLP4 0+240
ADDRGP4 trap_Trace
ASGNP4
line 2426
;2426:	pmv.pointcontents = trap_PointContents;
ADDRLP4 0+244
ADDRGP4 trap_PointContents
ASGNP4
line 2427
;2427:	pmv.gametype = g_gametype.integer;
ADDRLP4 0+220
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
line 2429
;2428:
;2429:	pm = &pmv;
ADDRGP4 pm
ADDRLP4 0
ASGNP4
line 2430
;2430:	PM_SetAnim(SETANIM_BOTH, anim, flags, 0);
CNSTI4 3
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2431
;2431:}
LABELV $1164
endproc StandardSetBodyAnim 380 16
export ClientCommand
proc ClientCommand 1196 20
line 2444
;2432:
;2433:void DismembermentTest(gentity_t *self);
;2434:
;2435:#ifdef _DEBUG
;2436:void DismembermentByNum(gentity_t *self, int num);
;2437:#endif
;2438:
;2439:/*
;2440:=================
;2441:ClientCommand
;2442:=================
;2443:*/
;2444:void ClientCommand( int clientNum ) {
line 2448
;2445:	gentity_t *ent;
;2446:	char	cmd[MAX_TOKEN_CHARS];
;2447:
;2448:	ent = g_entities + clientNum;
ADDRLP4 1024
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2449
;2449:	if ( !ent->client ) {
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1172
line 2450
;2450:		return;		// not fully in game yet
ADDRGP4 $1171
JUMPV
LABELV $1172
line 2454
;2451:	}
;2452:
;2453:
;2454:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2457
;2455:
;2456:	//rww - redirect bot commands
;2457:	if (strstr(cmd, "bot_") && AcceptBotCommand(cmd, ent))
ADDRLP4 0
ARGP4
ADDRGP4 $1176
ARGP4
ADDRLP4 1028
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1174
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 AcceptBotCommand
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $1174
line 2458
;2458:	{
line 2459
;2459:		return;
ADDRGP4 $1171
JUMPV
LABELV $1174
line 2463
;2460:	}
;2461:	//end rww
;2462:
;2463:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1179
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1177
line 2464
;2464:		Cmd_Say_f (ent, SAY_ALL, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1040
CNSTI4 0
ASGNI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 2465
;2465:		return;
ADDRGP4 $1171
JUMPV
LABELV $1177
line 2467
;2466:	}
;2467:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1182
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1180
line 2468
;2468:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 2469
;2469:		return;
ADDRGP4 $1171
JUMPV
LABELV $1180
line 2471
;2470:	}
;2471:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1185
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1183
line 2472
;2472:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 2473
;2473:		return;
ADDRGP4 $1171
JUMPV
LABELV $1183
line 2475
;2474:	}
;2475:	if (Q_stricmp (cmd, "vsay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1188
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $1186
line 2476
;2476:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2477
;2477:		return;
ADDRGP4 $1171
JUMPV
LABELV $1186
line 2479
;2478:	}
;2479:	if (Q_stricmp (cmd, "vsay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1191
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1189
line 2480
;2480:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2481
;2481:		return;
ADDRGP4 $1171
JUMPV
LABELV $1189
line 2483
;2482:	}
;2483:	if (Q_stricmp (cmd, "vtell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $559
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1192
line 2484
;2484:		Cmd_VoiceTell_f ( ent, qfalse );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2485
;2485:		return;
ADDRGP4 $1171
JUMPV
LABELV $1192
line 2487
;2486:	}
;2487:	if (Q_stricmp (cmd, "vosay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1196
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1194
line 2488
;2488:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRLP4 1064
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2489
;2489:		return;
ADDRGP4 $1171
JUMPV
LABELV $1194
line 2491
;2490:	}
;2491:	if (Q_stricmp (cmd, "vosay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1199
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1197
line 2492
;2492:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRLP4 1068
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2493
;2493:		return;
ADDRGP4 $1171
JUMPV
LABELV $1197
line 2495
;2494:	}
;2495:	if (Q_stricmp (cmd, "votell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1202
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1200
line 2496
;2496:		Cmd_VoiceTell_f ( ent, qtrue );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2497
;2497:		return;
ADDRGP4 $1171
JUMPV
LABELV $1200
line 2499
;2498:	}
;2499:	if (Q_stricmp (cmd, "vtaunt") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1205
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1203
line 2500
;2500:		Cmd_VoiceTaunt_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_VoiceTaunt_f
CALLV
pop
line 2501
;2501:		return;
ADDRGP4 $1171
JUMPV
LABELV $1203
line 2503
;2502:	}
;2503:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1206
line 2504
;2504:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2505
;2505:		return;
ADDRGP4 $1171
JUMPV
LABELV $1206
line 2509
;2506:	}
;2507:
;2508:	// ignore all other commands when at intermission
;2509:	if (level.intermissiontime)
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $1208
line 2510
;2510:	{
line 2511
;2511:		qboolean giveError = qfalse;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 2513
;2512:
;2513:		if (!Q_stricmp(cmd, "give"))
ADDRLP4 0
ARGP4
ADDRGP4 $1213
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1211
line 2514
;2514:		{
line 2515
;2515:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2516
;2516:		}
ADDRGP4 $1212
JUMPV
LABELV $1211
line 2517
;2517:		else if (!Q_stricmp(cmd, "god"))
ADDRLP4 0
ARGP4
ADDRGP4 $1216
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1214
line 2518
;2518:		{
line 2519
;2519:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2520
;2520:		}
ADDRGP4 $1215
JUMPV
LABELV $1214
line 2521
;2521:		else if (!Q_stricmp(cmd, "notarget"))
ADDRLP4 0
ARGP4
ADDRGP4 $1219
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1217
line 2522
;2522:		{
line 2523
;2523:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2524
;2524:		}
ADDRGP4 $1218
JUMPV
LABELV $1217
line 2525
;2525:		else if (!Q_stricmp(cmd, "noclip"))
ADDRLP4 0
ARGP4
ADDRGP4 $1222
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1220
line 2526
;2526:		{
line 2527
;2527:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2528
;2528:		}
ADDRGP4 $1221
JUMPV
LABELV $1220
line 2529
;2529:		else if (!Q_stricmp(cmd, "kill"))
ADDRLP4 0
ARGP4
ADDRGP4 $1225
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1223
line 2530
;2530:		{
line 2531
;2531:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2532
;2532:		}
ADDRGP4 $1224
JUMPV
LABELV $1223
line 2533
;2533:		else if (!Q_stricmp(cmd, "teamtask"))
ADDRLP4 0
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1226
line 2534
;2534:		{
line 2535
;2535:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2536
;2536:		}
ADDRGP4 $1227
JUMPV
LABELV $1226
line 2537
;2537:		else if (!Q_stricmp(cmd, "levelshot"))
ADDRLP4 0
ARGP4
ADDRGP4 $1230
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1228
line 2538
;2538:		{
line 2539
;2539:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2540
;2540:		}
ADDRGP4 $1229
JUMPV
LABELV $1228
line 2541
;2541:		else if (!Q_stricmp(cmd, "follow"))
ADDRLP4 0
ARGP4
ADDRGP4 $1233
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1231
line 2542
;2542:		{
line 2543
;2543:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2544
;2544:		}
ADDRGP4 $1232
JUMPV
LABELV $1231
line 2545
;2545:		else if (!Q_stricmp(cmd, "follownext"))
ADDRLP4 0
ARGP4
ADDRGP4 $1236
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1234
line 2546
;2546:		{
line 2547
;2547:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2548
;2548:		}
ADDRGP4 $1235
JUMPV
LABELV $1234
line 2549
;2549:		else if (!Q_stricmp(cmd, "followprev"))
ADDRLP4 0
ARGP4
ADDRGP4 $1239
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1237
line 2550
;2550:		{
line 2551
;2551:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2552
;2552:		}
ADDRGP4 $1238
JUMPV
LABELV $1237
line 2553
;2553:		else if (!Q_stricmp(cmd, "team"))
ADDRLP4 0
ARGP4
ADDRGP4 $1242
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1240
line 2554
;2554:		{
line 2555
;2555:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2556
;2556:		}
ADDRGP4 $1241
JUMPV
LABELV $1240
line 2557
;2557:		else if (!Q_stricmp(cmd, "forcechanged"))
ADDRLP4 0
ARGP4
ADDRGP4 $1245
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1243
line 2558
;2558:		{ //special case: still update force change
line 2559
;2559:			Cmd_ForceChanged_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ForceChanged_f
CALLV
pop
line 2560
;2560:			return;
ADDRGP4 $1171
JUMPV
LABELV $1243
line 2562
;2561:		}
;2562:		else if (!Q_stricmp(cmd, "where"))
ADDRLP4 0
ARGP4
ADDRGP4 $1248
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1246
line 2563
;2563:		{
line 2564
;2564:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2565
;2565:		}
ADDRGP4 $1247
JUMPV
LABELV $1246
line 2566
;2566:		else if (!Q_stricmp(cmd, "callvote"))
ADDRLP4 0
ARGP4
ADDRGP4 $1251
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1249
line 2567
;2567:		{
line 2568
;2568:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2569
;2569:		}
ADDRGP4 $1250
JUMPV
LABELV $1249
line 2570
;2570:		else if (!Q_stricmp(cmd, "vote"))
ADDRLP4 0
ARGP4
ADDRGP4 $1254
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1252
line 2571
;2571:		{
line 2572
;2572:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2573
;2573:		}
ADDRGP4 $1253
JUMPV
LABELV $1252
line 2574
;2574:		else if (!Q_stricmp(cmd, "callteamvote"))
ADDRLP4 0
ARGP4
ADDRGP4 $1257
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1255
line 2575
;2575:		{
line 2576
;2576:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2577
;2577:		}
ADDRGP4 $1256
JUMPV
LABELV $1255
line 2578
;2578:		else if (!Q_stricmp(cmd, "teamvote"))
ADDRLP4 0
ARGP4
ADDRGP4 $1260
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1258
line 2579
;2579:		{
line 2580
;2580:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2581
;2581:		}
ADDRGP4 $1259
JUMPV
LABELV $1258
line 2582
;2582:		else if (!Q_stricmp(cmd, "gc"))
ADDRLP4 0
ARGP4
ADDRGP4 $1263
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1261
line 2583
;2583:		{
line 2584
;2584:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2585
;2585:		}
ADDRGP4 $1262
JUMPV
LABELV $1261
line 2586
;2586:		else if (!Q_stricmp(cmd, "setviewpos"))
ADDRLP4 0
ARGP4
ADDRGP4 $1266
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1264
line 2587
;2587:		{
line 2588
;2588:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2589
;2589:		}
ADDRGP4 $1265
JUMPV
LABELV $1264
line 2590
;2590:		else if (!Q_stricmp(cmd, "stats"))
ADDRLP4 0
ARGP4
ADDRGP4 $1269
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1267
line 2591
;2591:		{
line 2592
;2592:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2593
;2593:		}
LABELV $1267
LABELV $1265
LABELV $1262
LABELV $1259
LABELV $1256
LABELV $1253
LABELV $1250
LABELV $1247
LABELV $1241
LABELV $1238
LABELV $1235
LABELV $1232
LABELV $1229
LABELV $1227
LABELV $1224
LABELV $1221
LABELV $1218
LABELV $1215
LABELV $1212
line 2595
;2594:
;2595:		if (giveError)
ADDRLP4 1080
INDIRI4
CNSTI4 0
EQI4 $1270
line 2596
;2596:		{
line 2597
;2597:			trap_SendServerCommand( clientNum, va("print \"You cannot perform this task (%s) during the intermission.\n\"", cmd ) );
ADDRGP4 $1272
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1164
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2598
;2598:		}
ADDRGP4 $1171
JUMPV
LABELV $1270
line 2600
;2599:		else
;2600:		{
line 2601
;2601:			Cmd_Say_f (ent, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 2602
;2602:		}
line 2603
;2603:		return;
ADDRGP4 $1171
JUMPV
LABELV $1208
line 2606
;2604:	}
;2605:
;2606:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1213
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1273
line 2607
;2607:	{
line 2608
;2608:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
line 2609
;2609:	}
ADDRGP4 $1274
JUMPV
LABELV $1273
line 2610
;2610:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1216
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1275
line 2611
;2611:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $1276
JUMPV
LABELV $1275
line 2612
;2612:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1219
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1277
line 2613
;2613:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $1278
JUMPV
LABELV $1277
line 2614
;2614:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1222
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1279
line 2615
;2615:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $1280
JUMPV
LABELV $1279
line 2616
;2616:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1225
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1281
line 2617
;2617:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $1282
JUMPV
LABELV $1281
line 2618
;2618:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1283
line 2619
;2619:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $1284
JUMPV
LABELV $1283
line 2620
;2620:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1230
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1285
line 2621
;2621:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $1286
JUMPV
LABELV $1285
line 2622
;2622:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1233
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1287
line 2623
;2623:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $1288
JUMPV
LABELV $1287
line 2624
;2624:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1236
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1289
line 2625
;2625:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1290
JUMPV
LABELV $1289
line 2626
;2626:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1239
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1291
line 2627
;2627:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1292
JUMPV
LABELV $1291
line 2628
;2628:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1242
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1293
line 2629
;2629:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $1294
JUMPV
LABELV $1293
line 2630
;2630:	else if (Q_stricmp (cmd, "forcechanged") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1245
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1295
line 2631
;2631:		Cmd_ForceChanged_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ForceChanged_f
CALLV
pop
ADDRGP4 $1296
JUMPV
LABELV $1295
line 2632
;2632:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1248
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1297
line 2633
;2633:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $1298
JUMPV
LABELV $1297
line 2634
;2634:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1251
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1299
line 2635
;2635:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $1300
JUMPV
LABELV $1299
line 2636
;2636:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1254
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1301
line 2637
;2637:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $1302
JUMPV
LABELV $1301
line 2638
;2638:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1257
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1303
line 2639
;2639:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $1304
JUMPV
LABELV $1303
line 2640
;2640:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1260
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1305
line 2641
;2641:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $1306
JUMPV
LABELV $1305
line 2642
;2642:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1263
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1307
line 2643
;2643:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $1308
JUMPV
LABELV $1307
line 2644
;2644:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1266
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1309
line 2645
;2645:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $1310
JUMPV
LABELV $1309
line 2646
;2646:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1269
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1311
line 2647
;2647:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $1312
JUMPV
LABELV $1311
line 2733
;2648:	/*
;2649:	else if (Q_stricmp(cmd, "#mm") == 0 && CheatsOk( ent ))
;2650:	{
;2651:		G_PlayerBecomeATST(ent);
;2652:	}
;2653:	*/
;2654:	//I broke the ATST when I restructured it to use a single global anim set for all client animation.
;2655:	//You can fix it, but you'll have to implement unique animations (per character) again.
;2656:#ifdef _DEBUG //sigh..
;2657:	else if (Q_stricmp(cmd, "headexplodey") == 0 && CheatsOk( ent ))
;2658:	{
;2659:		Cmd_Kill_f (ent);
;2660:		if (ent->health < 1)
;2661:		{
;2662:			float presaveVel = ent->client->ps.velocity[2];
;2663:			ent->client->ps.velocity[2] = 500;
;2664:			DismembermentTest(ent);
;2665:			ent->client->ps.velocity[2] = presaveVel;
;2666:		}
;2667:	}
;2668:	else if (Q_stricmp(cmd, "g2animent") == 0 && CheatsOk( ent ))
;2669:	{
;2670:		G_CreateExampleAnimEnt(ent);
;2671:	}
;2672:	else if (Q_stricmp(cmd, "loveandpeace") == 0 && CheatsOk( ent ))
;2673:	{
;2674:		trace_t tr;
;2675:		vec3_t fPos;
;2676:
;2677:		AngleVectors(ent->client->ps.viewangles, fPos, 0, 0);
;2678:
;2679:		fPos[0] = ent->client->ps.origin[0] + fPos[0]*40;
;2680:		fPos[1] = ent->client->ps.origin[1] + fPos[1]*40;
;2681:		fPos[2] = ent->client->ps.origin[2] + fPos[2]*40;
;2682:
;2683:		trap_Trace(&tr, ent->client->ps.origin, 0, 0, fPos, ent->s.number, ent->clipmask);
;2684:
;2685:		if (tr.entityNum < MAX_CLIENTS && tr.entityNum != ent->s.number)
;2686:		{
;2687:			gentity_t *other = &g_entities[tr.entityNum];
;2688:
;2689:			if (other && other->inuse && other->client)
;2690:			{
;2691:				vec3_t entDir;
;2692:				vec3_t otherDir;
;2693:				vec3_t entAngles;
;2694:				vec3_t otherAngles;
;2695:
;2696:				if (ent->client->ps.weapon == WP_SABER && !ent->client->ps.saberHolstered)
;2697:				{
;2698:					Cmd_ToggleSaber_f(ent);
;2699:				}
;2700:
;2701:				if (other->client->ps.weapon == WP_SABER && !other->client->ps.saberHolstered)
;2702:				{
;2703:					Cmd_ToggleSaber_f(other);
;2704:				}
;2705:
;2706:				if ((ent->client->ps.weapon != WP_SABER || ent->client->ps.saberHolstered) &&
;2707:					(other->client->ps.weapon != WP_SABER || other->client->ps.saberHolstered))
;2708:				{
;2709:					VectorSubtract( other->client->ps.origin, ent->client->ps.origin, otherDir );
;2710:					VectorCopy( ent->client->ps.viewangles, entAngles );
;2711:					entAngles[YAW] = vectoyaw( otherDir );
;2712:					SetClientViewAngle( ent, entAngles );
;2713:
;2714:					StandardSetBodyAnim(ent, BOTH_KISSER1LOOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
;2715:					ent->client->ps.saberMove = LS_NONE;
;2716:					ent->client->ps.saberBlocked = 0;
;2717:					ent->client->ps.saberBlocking = 0;
;2718:
;2719:					VectorSubtract( ent->client->ps.origin, other->client->ps.origin, entDir );
;2720:					VectorCopy( other->client->ps.viewangles, otherAngles );
;2721:					otherAngles[YAW] = vectoyaw( entDir );
;2722:					SetClientViewAngle( other, otherAngles );
;2723:
;2724:					StandardSetBodyAnim(other, BOTH_KISSEE1LOOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
;2725:					other->client->ps.saberMove = LS_NONE;
;2726:					other->client->ps.saberBlocked = 0;
;2727:					other->client->ps.saberBlocking = 0;
;2728:				}
;2729:			}
;2730:		}
;2731:	}
;2732:#endif
;2733:	else if (Q_stricmp(cmd, "thedestroyer") == 0 && CheatsOk( ent ) && ent && ent->client && ent->client->ps.saberHolstered && ent->client->ps.weapon == WP_SABER)
ADDRLP4 0
ARGP4
ADDRGP4 $1315
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1313
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 1168
CNSTI4 0
ASGNI4
ADDRLP4 1164
INDIRI4
ADDRLP4 1168
INDIRI4
EQI4 $1313
ADDRLP4 1176
CNSTU4 0
ASGNU4
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRLP4 1176
INDIRU4
EQU4 $1313
ADDRLP4 1180
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CVPU4 4
ADDRLP4 1176
INDIRU4
EQU4 $1313
ADDRLP4 1180
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 1168
INDIRI4
EQI4 $1313
ADDRLP4 1180
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1313
line 2734
;2734:	{
line 2735
;2735:		Cmd_ToggleSaber_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ToggleSaber_f
CALLV
pop
line 2737
;2736:
;2737:		if (!ent->client->ps.saberHolstered)
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1314
line 2738
;2738:		{
line 2739
;2739:			if (ent->client->ps.dualBlade)
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1318
line 2740
;2740:			{
line 2741
;2741:				ent->client->ps.dualBlade = qfalse;
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
CNSTI4 0
ASGNI4
line 2743
;2742:				//ent->client->ps.fd.saberAnimLevel = FORCE_LEVEL_1;
;2743:			}
ADDRGP4 $1314
JUMPV
LABELV $1318
line 2745
;2744:			else
;2745:			{
line 2746
;2746:				ent->client->ps.dualBlade = qtrue;
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
CNSTI4 1
ASGNI4
line 2748
;2747:
;2748:				trap_SendServerCommand( -1, va("print \"%sTHE DESTROYER COMETH\n\"", S_COLOR_RED) );
ADDRGP4 $1320
ARGP4
ADDRGP4 $1321
ARGP4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2749
;2749:				G_ScreenShake(vec3_origin, NULL, 10.0f, 800, qtrue);
ADDRGP4 vec3_origin
ARGP4
CNSTP4 0
ARGP4
CNSTF4 1092616192
ARGF4
CNSTI4 800
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 2751
;2750:				//ent->client->ps.fd.saberAnimLevel = FORCE_LEVEL_3;
;2751:			}
line 2752
;2752:		}
line 2753
;2753:	}
ADDRGP4 $1314
JUMPV
LABELV $1313
line 2802
;2754:#ifdef _DEBUG
;2755:	else if (Q_stricmp(cmd, "debugSetSaberMove") == 0)
;2756:	{
;2757:		Cmd_DebugSetSaberMove_f(ent);
;2758:	}
;2759:	else if (Q_stricmp(cmd, "debugSetBodyAnim") == 0)
;2760:	{
;2761:		Cmd_DebugSetBodyAnim_f(ent, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD);
;2762:	}
;2763:	else if (Q_stricmp(cmd, "debugDismemberment") == 0)
;2764:	{
;2765:		Cmd_Kill_f (ent);
;2766:		if (ent->health < 1)
;2767:		{
;2768:			char	arg[MAX_STRING_CHARS];
;2769:			int		iArg = 0;
;2770:
;2771:			if (trap_Argc() > 1)
;2772:			{
;2773:				trap_Argv( 1, arg, sizeof( arg ) );
;2774:
;2775:				if (arg[0])
;2776:				{
;2777:					iArg = atoi(arg);
;2778:				}
;2779:			}
;2780:
;2781:			DismembermentByNum(ent, iArg);
;2782:		}
;2783:	}
;2784:	else if (Q_stricmp(cmd, "debugKnockMeDown") == 0)
;2785:	{
;2786:		ent->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
;2787:		ent->client->ps.forceDodgeAnim = 0;
;2788:		if (trap_Argc() > 1)
;2789:		{
;2790:			ent->client->ps.forceHandExtendTime = level.time + 1100;
;2791:			ent->client->ps.quickerGetup = qfalse;
;2792:		}
;2793:		else
;2794:		{
;2795:			ent->client->ps.forceHandExtendTime = level.time + 700;
;2796:			ent->client->ps.quickerGetup = qtrue;
;2797:		}
;2798:	}
;2799:#endif
;2800:
;2801:	else
;2802:	{
line 2803
;2803:		if (Q_stricmp(cmd, "addbot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1324
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1322
line 2804
;2804:		{ //because addbot isn't a recognized command unless you're the server, but it is in the menus regardless
line 2806
;2805://			trap_SendServerCommand( clientNum, va("print \"You can only add bots as the server.\n\"" ) );
;2806:			trap_SendServerCommand( clientNum, va("print \"%s.\n\"", G_GetStripEdString("SVINGAME", "ONLY_ADD_BOTS_AS_SERVER")));
ADDRGP4 $116
ARGP4
ADDRGP4 $1326
ARGP4
ADDRLP4 1188
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1325
ARGP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRLP4 1192
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2807
;2807:		}
ADDRGP4 $1323
JUMPV
LABELV $1322
line 2809
;2808:		else
;2809:		{
line 2810
;2810:			trap_SendServerCommand( clientNum, va("print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $1327
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2811
;2811:		}
LABELV $1323
line 2812
;2812:	}
LABELV $1314
LABELV $1312
LABELV $1310
LABELV $1308
LABELV $1306
LABELV $1304
LABELV $1302
LABELV $1300
LABELV $1298
LABELV $1296
LABELV $1294
LABELV $1292
LABELV $1290
LABELV $1288
LABELV $1286
LABELV $1284
LABELV $1282
LABELV $1280
LABELV $1278
LABELV $1276
LABELV $1274
line 2813
;2813:}
LABELV $1171
endproc ClientCommand 1196 20
import DismembermentTest
import PM_SetAnim
import saberOnSound
import saberOffSound
import BG_CycleForce
import BG_CycleInven
import AcceptBotCommand
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
LABELV $1327
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 99
char 1 109
char 1 100
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $1326
char 1 79
char 1 78
char 1 76
char 1 89
char 1 95
char 1 65
char 1 68
char 1 68
char 1 95
char 1 66
char 1 79
char 1 84
char 1 83
char 1 95
char 1 65
char 1 83
char 1 95
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 0
align 1
LABELV $1325
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $1324
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 0
align 1
LABELV $1321
char 1 94
char 1 49
char 1 0
align 1
LABELV $1320
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 84
char 1 72
char 1 69
char 1 32
char 1 68
char 1 69
char 1 83
char 1 84
char 1 82
char 1 79
char 1 89
char 1 69
char 1 82
char 1 32
char 1 67
char 1 79
char 1 77
char 1 69
char 1 84
char 1 72
char 1 10
char 1 34
char 1 0
align 1
LABELV $1315
char 1 116
char 1 104
char 1 101
char 1 100
char 1 101
char 1 115
char 1 116
char 1 114
char 1 111
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $1272
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 89
char 1 111
char 1 117
char 1 32
char 1 99
char 1 97
char 1 110
char 1 110
char 1 111
char 1 116
char 1 32
char 1 112
char 1 101
char 1 114
char 1 102
char 1 111
char 1 114
char 1 109
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 116
char 1 97
char 1 115
char 1 107
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 32
char 1 100
char 1 117
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 105
char 1 110
char 1 116
char 1 101
char 1 114
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 111
char 1 110
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $1269
char 1 115
char 1 116
char 1 97
char 1 116
char 1 115
char 1 0
align 1
LABELV $1266
char 1 115
char 1 101
char 1 116
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 0
align 1
LABELV $1263
char 1 103
char 1 99
char 1 0
align 1
LABELV $1260
char 1 116
char 1 101
char 1 97
char 1 109
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1257
char 1 99
char 1 97
char 1 108
char 1 108
char 1 116
char 1 101
char 1 97
char 1 109
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1254
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1251
char 1 99
char 1 97
char 1 108
char 1 108
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1248
char 1 119
char 1 104
char 1 101
char 1 114
char 1 101
char 1 0
align 1
LABELV $1245
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 0
align 1
LABELV $1242
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1239
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 112
char 1 114
char 1 101
char 1 118
char 1 0
align 1
LABELV $1236
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 110
char 1 101
char 1 120
char 1 116
char 1 0
align 1
LABELV $1233
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 0
align 1
LABELV $1230
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 115
char 1 104
char 1 111
char 1 116
char 1 0
align 1
LABELV $1225
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $1222
char 1 110
char 1 111
char 1 99
char 1 108
char 1 105
char 1 112
char 1 0
align 1
LABELV $1219
char 1 110
char 1 111
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 0
align 1
LABELV $1216
char 1 103
char 1 111
char 1 100
char 1 0
align 1
LABELV $1213
char 1 103
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $1205
char 1 118
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $1202
char 1 118
char 1 111
char 1 116
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $1199
char 1 118
char 1 111
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1196
char 1 118
char 1 111
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1191
char 1 118
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1188
char 1 118
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1185
char 1 116
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $1182
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1179
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1176
char 1 98
char 1 111
char 1 116
char 1 95
char 1 0
align 1
LABELV $1161
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 67
char 1 72
char 1 65
char 1 76
char 1 76
char 1 69
char 1 78
char 1 71
char 1 69
char 1 68
char 1 0
align 1
LABELV $1160
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 67
char 1 72
char 1 65
char 1 76
char 1 76
char 1 69
char 1 78
char 1 71
char 1 69
char 1 0
align 1
LABELV $1159
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
LABELV $1152
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 65
char 1 67
char 1 67
char 1 69
char 1 80
char 1 84
char 1 0
align 1
LABELV $1151
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
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
LABELV $1126
char 1 67
char 1 65
char 1 78
char 1 84
char 1 68
char 1 85
char 1 69
char 1 76
char 1 95
char 1 66
char 1 85
char 1 83
char 1 89
char 1 0
align 1
LABELV $1123
char 1 67
char 1 65
char 1 78
char 1 84
char 1 68
char 1 85
char 1 69
char 1 76
char 1 95
char 1 74
char 1 85
char 1 83
char 1 84
char 1 68
char 1 73
char 1 68
char 1 0
align 1
LABELV $1107
char 1 78
char 1 79
char 1 68
char 1 85
char 1 69
char 1 76
char 1 95
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 89
char 1 80
char 1 69
char 1 0
align 1
LABELV $1067
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
LABELV $1066
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
LABELV $984
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 117
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 115
char 1 101
char 1 116
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 32
char 1 120
char 1 32
char 1 121
char 1 32
char 1 122
char 1 32
char 1 121
char 1 97
char 1 119
char 1 10
char 1 34
char 1 0
align 1
LABELV $967
char 1 80
char 1 76
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 67
char 1 65
char 1 83
char 1 84
char 1 0
align 1
LABELV $964
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 67
char 1 65
char 1 83
char 1 84
char 1 0
align 1
LABELV $961
char 1 78
char 1 79
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 73
char 1 78
char 1 80
char 1 82
char 1 79
char 1 71
char 1 0
align 1
LABELV $937
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 99
char 1 97
char 1 108
char 1 108
char 1 101
char 1 100
char 1 32
char 1 97
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 118
char 1 111
char 1 116
char 1 101
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $925
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 118
char 1 111
char 1 116
char 1 101
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 115
char 1 32
char 1 97
char 1 114
char 1 101
char 1 58
char 1 32
char 1 108
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 32
char 1 60
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 62
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $924
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 97
char 1 32
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 32
char 1 111
char 1 110
char 1 32
char 1 121
char 1 111
char 1 117
char 1 114
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $889
char 1 108
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $883
char 1 32
char 1 0
align 1
LABELV $874
char 1 77
char 1 65
char 1 88
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 83
char 1 0
align 1
LABELV $871
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 0
align 1
LABELV $849
char 1 80
char 1 76
char 1 86
char 1 79
char 1 84
char 1 69
char 1 67
char 1 65
char 1 83
char 1 84
char 1 0
align 1
LABELV $848
char 1 78
char 1 79
char 1 86
char 1 79
char 1 84
char 1 69
char 1 65
char 1 83
char 1 83
char 1 80
char 1 69
char 1 67
char 1 0
align 1
LABELV $845
char 1 86
char 1 79
char 1 84
char 1 69
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 0
align 1
LABELV $842
char 1 78
char 1 79
char 1 86
char 1 79
char 1 84
char 1 69
char 1 73
char 1 78
char 1 80
char 1 82
char 1 79
char 1 71
char 1 0
align 1
LABELV $833
char 1 37
char 1 105
char 1 0
align 1
LABELV $823
char 1 80
char 1 76
char 1 67
char 1 65
char 1 76
char 1 76
char 1 69
char 1 68
char 1 86
char 1 79
char 1 84
char 1 69
char 1 0
align 1
LABELV $822
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
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
LABELV $818
char 1 37
char 1 115
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $812
char 1 118
char 1 115
char 1 116
char 1 114
char 1 32
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $809
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 115
char 1 101
char 1 116
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $801
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 37
char 1 100
char 1 0
align 1
LABELV $798
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 116
char 1 104
char 1 101
char 1 114
char 1 101
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 110
char 1 97
char 1 109
char 1 101
char 1 100
char 1 32
char 1 39
char 1 37
char 1 115
char 1 39
char 1 32
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 108
char 1 121
char 1 32
char 1 111
char 1 110
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $790
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $785
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 116
char 1 104
char 1 101
char 1 114
char 1 101
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 110
char 1 117
char 1 109
char 1 98
char 1 101
char 1 114
char 1 32
char 1 37
char 1 100
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $781
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 105
char 1 110
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
char 1 32
char 1 110
char 1 117
char 1 109
char 1 98
char 1 101
char 1 114
char 1 32
char 1 37
char 1 100
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $774
char 1 37
char 1 115
char 1 0
align 1
LABELV $769
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 59
char 1 32
char 1 115
char 1 101
char 1 116
char 1 32
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $764
char 1 78
char 1 79
char 1 86
char 1 79
char 1 84
char 1 69
char 1 95
char 1 77
char 1 65
char 1 80
char 1 78
char 1 79
char 1 84
char 1 83
char 1 85
char 1 80
char 1 80
char 1 79
char 1 82
char 1 84
char 1 69
char 1 68
char 1 66
char 1 89
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $759
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $756
char 1 37
char 1 115
char 1 32
char 1 37
char 1 100
char 1 0
align 1
LABELV $751
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 73
char 1 110
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $743
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $738
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 86
char 1 111
char 1 116
char 1 101
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 115
char 1 32
char 1 97
char 1 114
char 1 101
char 1 58
char 1 32
char 1 109
char 1 97
char 1 112
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 44
char 1 32
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 44
char 1 32
char 1 109
char 1 97
char 1 112
char 1 32
char 1 60
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 62
char 1 44
char 1 32
char 1 103
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 32
char 1 60
char 1 110
char 1 62
char 1 44
char 1 32
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 60
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 62
char 1 44
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 60
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 110
char 1 117
char 1 109
char 1 62
char 1 44
char 1 32
char 1 103
char 1 95
char 1 100
char 1 111
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 44
char 1 32
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 60
char 1 116
char 1 105
char 1 109
char 1 101
char 1 62
char 1 44
char 1 32
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 60
char 1 102
char 1 114
char 1 97
char 1 103
char 1 115
char 1 62
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $737
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $734
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $731
char 1 103
char 1 95
char 1 100
char 1 111
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $728
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 107
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $725
char 1 107
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $722
char 1 103
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $719
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $716
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $713
char 1 109
char 1 97
char 1 112
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 0
align 1
LABELV $710
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 73
char 1 110
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 118
char 1 111
char 1 116
char 1 101
char 1 32
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $706
char 1 78
char 1 79
char 1 83
char 1 80
char 1 69
char 1 67
char 1 86
char 1 79
char 1 84
char 1 69
char 1 0
align 1
LABELV $703
char 1 77
char 1 65
char 1 88
char 1 86
char 1 79
char 1 84
char 1 69
char 1 83
char 1 0
align 1
LABELV $700
char 1 86
char 1 79
char 1 84
char 1 69
char 1 73
char 1 78
char 1 80
char 1 82
char 1 79
char 1 71
char 1 82
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $696
char 1 78
char 1 79
char 1 86
char 1 79
char 1 84
char 1 69
char 1 0
align 1
LABELV $663
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 89
char 1 115
char 1 97
char 1 108
char 1 97
char 1 109
char 1 105
char 1 114
char 1 105
char 1 0
align 1
LABELV $662
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 70
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $661
char 1 78
char 1 47
char 1 65
char 1 0
align 1
LABELV $660
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $659
char 1 83
char 1 105
char 1 110
char 1 103
char 1 108
char 1 101
char 1 32
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $658
char 1 68
char 1 117
char 1 101
char 1 108
char 1 0
align 1
LABELV $657
char 1 74
char 1 101
char 1 100
char 1 105
char 1 32
char 1 77
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $656
char 1 72
char 1 111
char 1 108
char 1 111
char 1 99
char 1 114
char 1 111
char 1 110
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $655
char 1 70
char 1 114
char 1 101
char 1 101
char 1 32
char 1 70
char 1 111
char 1 114
char 1 32
char 1 65
char 1 108
char 1 108
char 1 0
align 1
LABELV $646
char 1 114
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 0
align 1
LABELV $645
char 1 115
char 1 101
char 1 97
char 1 114
char 1 99
char 1 104
char 1 32
char 1 97
char 1 110
char 1 100
char 1 32
char 1 100
char 1 101
char 1 115
char 1 116
char 1 114
char 1 111
char 1 121
char 1 0
align 1
LABELV $644
char 1 103
char 1 117
char 1 97
char 1 114
char 1 100
char 1 32
char 1 108
char 1 111
char 1 99
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $643
char 1 99
char 1 111
char 1 118
char 1 101
char 1 114
char 1 32
char 1 109
char 1 101
char 1 0
align 1
LABELV $642
char 1 99
char 1 111
char 1 109
char 1 101
char 1 32
char 1 104
char 1 101
char 1 114
char 1 101
char 1 0
align 1
LABELV $641
char 1 104
char 1 111
char 1 108
char 1 100
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 112
char 1 111
char 1 115
char 1 105
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $640
char 1 104
char 1 111
char 1 108
char 1 100
char 1 32
char 1 121
char 1 111
char 1 117
char 1 114
char 1 32
char 1 112
char 1 111
char 1 115
char 1 105
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $639
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $636
char 1 112
char 1 114
char 1 97
char 1 105
char 1 115
char 1 101
char 1 0
align 1
LABELV $619
char 1 107
char 1 105
char 1 108
char 1 108
char 1 95
char 1 105
char 1 110
char 1 115
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $614
char 1 107
char 1 105
char 1 108
char 1 108
char 1 95
char 1 103
char 1 97
char 1 117
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 0
align 1
LABELV $603
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 95
char 1 105
char 1 110
char 1 115
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $593
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $571
char 1 118
char 1 111
char 1 105
char 1 99
char 1 101
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $561
char 1 37
char 1 115
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $560
char 1 118
char 1 99
char 1 104
char 1 97
char 1 116
char 1 0
align 1
LABELV $559
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $556
char 1 118
char 1 116
char 1 99
char 1 104
char 1 97
char 1 116
char 1 0
align 1
LABELV $539
char 1 116
char 1 101
char 1 108
char 1 108
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $517
char 1 37
char 1 115
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $511
char 1 25
char 1 91
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 93
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $510
char 1 25
char 1 91
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 93
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $505
char 1 25
char 1 40
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 41
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $504
char 1 25
char 1 40
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 41
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $501
char 1 115
char 1 97
char 1 121
char 1 116
char 1 101
char 1 97
char 1 109
char 1 58
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $499
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $498
char 1 115
char 1 97
char 1 121
char 1 58
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $487
char 1 99
char 1 104
char 1 97
char 1 116
char 1 0
align 1
LABELV $486
char 1 116
char 1 99
char 1 104
char 1 97
char 1 116
char 1 0
align 1
LABELV $485
char 1 37
char 1 115
char 1 32
char 1 34
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $457
char 1 67
char 1 109
char 1 100
char 1 95
char 1 70
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 67
char 1 121
char 1 99
char 1 108
char 1 101
char 1 95
char 1 102
char 1 58
char 1 32
char 1 98
char 1 97
char 1 100
char 1 32
char 1 100
char 1 105
char 1 114
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $425
char 1 94
char 1 50
char 1 0
align 1
LABELV $424
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 37
char 1 115
char 1 10
char 1 10
char 1 34
char 1 0
align 1
LABELV $423
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 67
char 1 72
char 1 65
char 1 78
char 1 71
char 1 69
char 1 68
char 1 0
align 1
LABELV $417
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 67
char 1 97
char 1 110
char 1 110
char 1 111
char 1 116
char 1 32
char 1 115
char 1 119
char 1 105
char 1 116
char 1 99
char 1 104
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 115
char 1 32
char 1 105
char 1 110
char 1 32
char 1 68
char 1 117
char 1 101
char 1 108
char 1 10
char 1 34
char 1 0
align 1
LABELV $411
char 1 78
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 0
align 1
LABELV $406
char 1 80
char 1 82
char 1 73
char 1 78
char 1 84
char 1 83
char 1 80
char 1 69
char 1 67
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $405
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 10
char 1 34
char 1 0
align 1
LABELV $403
char 1 80
char 1 82
char 1 73
char 1 78
char 1 84
char 1 70
char 1 82
char 1 69
char 1 69
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $402
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 70
char 1 114
char 1 101
char 1 101
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 10
char 1 34
char 1 0
align 1
LABELV $400
char 1 80
char 1 82
char 1 73
char 1 78
char 1 84
char 1 82
char 1 69
char 1 68
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $399
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 82
char 1 101
char 1 100
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 10
char 1 34
char 1 0
align 1
LABELV $397
char 1 80
char 1 82
char 1 73
char 1 78
char 1 84
char 1 66
char 1 76
char 1 85
char 1 69
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $354
char 1 84
char 1 79
char 1 79
char 1 77
char 1 65
char 1 78
char 1 89
char 1 66
char 1 76
char 1 85
char 1 69
char 1 0
align 1
LABELV $349
char 1 84
char 1 79
char 1 79
char 1 77
char 1 65
char 1 78
char 1 89
char 1 82
char 1 69
char 1 68
char 1 0
align 1
LABELV $337
char 1 98
char 1 0
align 1
LABELV $336
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $332
char 1 114
char 1 0
align 1
LABELV $331
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $324
char 1 115
char 1 0
align 1
LABELV $323
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
LABELV $320
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 50
char 1 0
align 1
LABELV $317
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 49
char 1 0
align 1
LABELV $313
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $312
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
LABELV $308
char 1 115
char 1 101
char 1 116
char 1 116
char 1 101
char 1 97
char 1 109
char 1 58
char 1 32
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $307
char 1 74
char 1 79
char 1 73
char 1 78
char 1 69
char 1 68
char 1 84
char 1 72
char 1 69
char 1 66
char 1 65
char 1 84
char 1 84
char 1 76
char 1 69
char 1 0
align 1
LABELV $301
char 1 74
char 1 79
char 1 73
char 1 78
char 1 69
char 1 68
char 1 84
char 1 72
char 1 69
char 1 83
char 1 80
char 1 69
char 1 67
char 1 84
char 1 65
char 1 84
char 1 79
char 1 82
char 1 83
char 1 0
align 1
LABELV $298
char 1 74
char 1 79
char 1 73
char 1 78
char 1 69
char 1 68
char 1 84
char 1 72
char 1 69
char 1 66
char 1 76
char 1 85
char 1 69
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $295
char 1 74
char 1 79
char 1 73
char 1 78
char 1 69
char 1 68
char 1 84
char 1 72
char 1 69
char 1 82
char 1 69
char 1 68
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $294
char 1 99
char 1 112
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
LABELV $282
char 1 65
char 1 84
char 1 84
char 1 69
char 1 77
char 1 80
char 1 84
char 1 68
char 1 85
char 1 69
char 1 76
char 1 75
char 1 73
char 1 76
char 1 76
char 1 0
align 1
LABELV $268
char 1 37
char 1 100
char 1 0
align 1
LABELV $267
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
LABELV $263
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 76
char 1 101
char 1 118
char 1 101
char 1 108
char 1 83
char 1 104
char 1 111
char 1 116
char 1 0
align 1
LABELV $262
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 77
char 1 117
char 1 115
char 1 116
char 1 32
char 1 98
char 1 101
char 1 32
char 1 105
char 1 110
char 1 32
char 1 103
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 32
char 1 48
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 115
char 1 104
char 1 111
char 1 116
char 1 10
char 1 34
char 1 0
align 1
LABELV $252
char 1 110
char 1 111
char 1 99
char 1 108
char 1 105
char 1 112
char 1 32
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $251
char 1 110
char 1 111
char 1 99
char 1 108
char 1 105
char 1 112
char 1 32
char 1 79
char 1 70
char 1 70
char 1 10
char 1 0
align 1
LABELV $245
char 1 110
char 1 111
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $244
char 1 110
char 1 111
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 79
char 1 70
char 1 70
char 1 10
char 1 0
align 1
LABELV $238
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $237
char 1 103
char 1 111
char 1 100
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $236
char 1 103
char 1 111
char 1 100
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 79
char 1 70
char 1 70
char 1 10
char 1 0
align 1
LABELV $224
char 1 97
char 1 115
char 1 115
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $221
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 0
align 1
LABELV $218
char 1 103
char 1 97
char 1 117
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 97
char 1 119
char 1 97
char 1 114
char 1 100
char 1 0
align 1
LABELV $215
char 1 105
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $212
char 1 101
char 1 120
char 1 99
char 1 101
char 1 108
char 1 108
char 1 101
char 1 110
char 1 116
char 1 0
align 1
LABELV $204
char 1 97
char 1 114
char 1 109
char 1 111
char 1 114
char 1 0
align 1
LABELV $192
char 1 97
char 1 109
char 1 109
char 1 111
char 1 0
align 1
LABELV $189
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 110
char 1 117
char 1 109
char 1 0
align 1
LABELV $183
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $173
char 1 104
char 1 101
char 1 97
char 1 108
char 1 116
char 1 104
char 1 0
align 1
LABELV $165
char 1 97
char 1 108
char 1 108
char 1 0
align 1
LABELV $159
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 85
char 1 115
char 1 101
char 1 114
char 1 32
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 111
char 1 110
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 10
char 1 34
char 1 0
align 1
LABELV $149
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 105
char 1 115
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
char 1 10
char 1 34
char 1 0
align 1
LABELV $146
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
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
char 1 32
char 1 115
char 1 108
char 1 111
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 34
char 1 0
align 1
LABELV $120
char 1 77
char 1 85
char 1 83
char 1 84
char 1 66
char 1 69
char 1 65
char 1 76
char 1 73
char 1 86
char 1 69
char 1 0
align 1
LABELV $117
char 1 78
char 1 79
char 1 67
char 1 72
char 1 69
char 1 65
char 1 84
char 1 83
char 1 0
align 1
LABELV $116
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
LABELV $115
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
LABELV $105
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 37
char 1 115
char 1 0
align 1
LABELV $97
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
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 0
