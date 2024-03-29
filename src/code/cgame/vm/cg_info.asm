export CG_LoadingString
code
proc CG_LoadingString 0 12
file "../cg_info.c"
line 21
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_info.c -- display information while data is being loading
;4:
;5:#include "cg_local.h"
;6:
;7:#define MAX_LOADING_PLAYER_ICONS	16
;8:#define MAX_LOADING_ITEM_ICONS		26
;9:
;10://static int			loadingPlayerIconCount;
;11://static qhandle_t	loadingPlayerIcons[MAX_LOADING_PLAYER_ICONS];
;12:
;13:void CG_LoadBar(void);
;14:
;15:/*
;16:======================
;17:CG_LoadingString
;18:
;19:======================
;20:*/
;21:void CG_LoadingString( const char *s ) {
line 22
;22:	Q_strncpyz( cg.infoScreenText, s, sizeof( cg.infoScreenText ) );
ADDRGP4 cg+4020
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 24
;23:
;24:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 25
;25:}
LABELV $120
endproc CG_LoadingString 0 12
export CG_LoadingItem
proc CG_LoadingItem 8 8
line 32
;26:
;27:/*
;28:===================
;29:CG_LoadingItem
;30:===================
;31:*/
;32:void CG_LoadingItem( int itemNum ) {
line 35
;33:	gitem_t		*item;
;34:
;35:	item = &bg_itemlist[itemNum];
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 37
;36:
;37:	CG_LoadingString( CG_GetStripEdString("INGAME",item->classname) );
ADDRGP4 $124
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 38
;38:}
LABELV $123
endproc CG_LoadingItem 8 8
export CG_LoadingClient
proc CG_LoadingClient 76 12
line 45
;39:
;40:/*
;41:===================
;42:CG_LoadingClient
;43:===================
;44:*/
;45:void CG_LoadingClient( int clientNum ) {
line 49
;46:	const char		*info;
;47:	char			personality[MAX_QPATH];
;48:
;49:	info = CG_ConfigString( CS_PLAYERS + clientNum );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 80
;50:
;51:/*
;52:	char			model[MAX_QPATH];
;53:	char			iconName[MAX_QPATH];
;54:	char			*skin;
;55:	if ( loadingPlayerIconCount < MAX_LOADING_PLAYER_ICONS ) {
;56:		Q_strncpyz( model, Info_ValueForKey( info, "model" ), sizeof( model ) );
;57:		skin = Q_strrchr( model, '/' );
;58:		if ( skin ) {
;59:			*skin++ = '\0';
;60:		} else {
;61:			skin = "default";
;62:		}
;63:
;64:		Com_sprintf( iconName, MAX_QPATH, "models/players/%s/icon_%s.tga", model, skin );
;65:		
;66:		loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
;67:		if ( !loadingPlayerIcons[loadingPlayerIconCount] ) {
;68:			Com_sprintf( iconName, MAX_QPATH, "models/players/characters/%s/icon_%s.tga", model, skin );
;69:			loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
;70:		}
;71:		if ( !loadingPlayerIcons[loadingPlayerIconCount] ) {
;72:			Com_sprintf( iconName, MAX_QPATH, "models/players/%s/icon_%s.tga", DEFAULT_MODEL, "default" );
;73:			loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
;74:		}
;75:		if ( loadingPlayerIcons[loadingPlayerIconCount] ) {
;76:			loadingPlayerIconCount++;
;77:		}
;78:	}
;79:*/
;80:	Q_strncpyz( personality, Info_ValueForKey( info, "n" ), sizeof(personality) );
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 81
;81:	Q_CleanStr( personality );
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 89
;82:
;83:	/*
;84:	if( cgs.gametype == GT_SINGLE_PLAYER ) {
;85:		trap_S_RegisterSound( va( "sound/player/announce/%s.wav", personality ));
;86:	}
;87:	*/
;88:
;89:	CG_LoadingString( personality );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 90
;90:}
LABELV $125
endproc CG_LoadingClient 76 12
export CG_DrawInformation
proc CG_DrawInformation 2160 20
line 101
;91:
;92:
;93:/*
;94:====================
;95:CG_DrawInformation
;96:
;97:Draw all the status / pacifier stuff during level loading
;98:====================
;99:*/
;100:#define UI_INFOFONT (UI_BIGFONT)
;101:void CG_DrawInformation( void ) {
line 109
;102:	const char	*s;
;103:	const char	*info;
;104:	const char	*sysInfo;
;105:	int			y;
;106:	int			value, valueNOFP;
;107:	qhandle_t	levelshot;
;108:	char		buf[1024];
;109:	int			iPropHeight = 18;	// I know, this is total crap, but as a post release asian-hack....  -Ste
ADDRLP4 12
CNSTI4 18
ASGNI4
line 111
;110:
;111:	info = CG_ConfigString( CS_SERVERINFO );
CNSTI4 0
ARGI4
ADDRLP4 1056
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1056
INDIRP4
ASGNP4
line 112
;112:	sysInfo = CG_ConfigString( CS_SYSTEMINFO );
CNSTI4 1
ARGI4
ADDRLP4 1060
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1052
ADDRLP4 1060
INDIRP4
ASGNP4
line 114
;113:
;114:	s = Info_ValueForKey( info, "mapname" );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1064
INDIRP4
ASGNP4
line 115
;115:	levelshot = trap_R_RegisterShaderNoMip( va( "levelshots/%s", s ) );
ADDRGP4 $129
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1072
INDIRI4
ASGNI4
line 116
;116:	if ( !levelshot ) {
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $130
line 117
;117:		levelshot = trap_R_RegisterShaderNoMip( "menu/art/unknownmap" );
ADDRGP4 $132
ARGP4
ADDRLP4 1076
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1076
INDIRI4
ASGNI4
line 118
;118:	}
LABELV $130
line 119
;119:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 120
;120:	CG_DrawPic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, levelshot );
ADDRLP4 1076
CNSTF4 0
ASGNF4
ADDRLP4 1076
INDIRF4
ARGF4
ADDRLP4 1076
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 122
;121:
;122:	CG_LoadBar();
ADDRGP4 CG_LoadBar
CALLV
pop
line 129
;123:				   
;124:	// draw the icons of things as they are loaded
;125://	CG_DrawLoadingIcons();
;126:
;127:	// the first 150 rows are reserved for the client connection
;128:	// screen to write into
;129:	if ( cg.infoScreenText[0] ) {
ADDRGP4 cg+4020
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $133
line 130
;130:		const char *psLoading = CG_GetStripEdString("MENUS3", "LOADING_MAPNAME");
ADDRGP4 $136
ARGP4
ADDRGP4 $137
ARGP4
ADDRLP4 1084
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1084
INDIRP4
ASGNP4
line 131
;131:		UI_DrawProportionalString( 320, 128-32, va(/*"Loading... %s"*/ psLoading, cg.infoScreenText),
ADDRLP4 1080
INDIRP4
ARGP4
ADDRGP4 cg+4020
ARGP4
ADDRLP4 1088
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 96
ARGI4
ADDRLP4 1088
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 133
;132:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;133:	} else {
ADDRGP4 $134
JUMPV
LABELV $133
line 134
;134:		const char *psAwaitingSnapshot = CG_GetStripEdString("MENUS3", "AWAITING_SNAPSHOT");
ADDRGP4 $136
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 1084
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1084
INDIRP4
ASGNP4
line 135
;135:		UI_DrawProportionalString( 320, 128-32, /*"Awaiting snapshot..."*/psAwaitingSnapshot,
CNSTI4 320
ARGI4
CNSTI4 96
ARGI4
ADDRLP4 1080
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 137
;136:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;137:	}
LABELV $134
line 141
;138:
;139:	// draw info string information
;140:
;141:	y = 180-32;
ADDRLP4 0
CNSTI4 148
ASGNI4
line 144
;142:
;143:	// don't print server lines if playing a local game
;144:	trap_Cvar_VariableStringBuffer( "sv_running", buf, sizeof( buf ) );
ADDRGP4 $140
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 145
;145:	if ( !atoi( buf ) ) {
ADDRLP4 20
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $141
line 147
;146:		// server hostname
;147:		Q_strncpyz(buf, Info_ValueForKey( info, "sv_hostname" ), 1024);
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 148
;148:		Q_CleanStr(buf);
ADDRLP4 20
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 149
;149:		UI_DrawProportionalString( 320, y, buf,
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 151
;150:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;151:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 154
;152:
;153:		// pure server
;154:		s = Info_ValueForKey( sysInfo, "sv_pure" );
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1088
INDIRP4
ASGNP4
line 155
;155:		if ( s[0] == '1' ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $145
line 156
;156:			const char *psPure = CG_GetStripEdString("INGAMETEXT", "PURE_SERVER");
ADDRGP4 $147
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 1096
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 1092
ADDRLP4 1096
INDIRP4
ASGNP4
line 157
;157:			UI_DrawProportionalString( 320, y, psPure,
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 159
;158:				UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;159:			y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 160
;160:		}
LABELV $145
line 163
;161:
;162:		// server-specific message of the day
;163:		s = CG_ConfigString( CS_MOTD );
CNSTI4 4
ARGI4
ADDRLP4 1092
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1092
INDIRP4
ASGNP4
line 164
;164:		if ( s[0] ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $149
line 165
;165:			UI_DrawProportionalString( 320, y, s,
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 167
;166:				UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;167:			y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 168
;168:		}
LABELV $149
line 170
;169:
;170:		{	// display global MOTD at bottom (mirrors ui_main UI_DrawConnectScreen
line 172
;171:			char motdString[1024];
;172:			trap_Cvar_VariableStringBuffer( "cl_motdString", motdString, sizeof( motdString ) );
ADDRGP4 $151
ARGP4
ADDRLP4 1096
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 174
;173:
;174:			if (motdString[0])
ADDRLP4 1096
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $152
line 175
;175:			{
line 176
;176:				UI_DrawProportionalString( 320, 425, motdString,
CNSTI4 320
ARGI4
CNSTI4 425
ARGI4
ADDRLP4 1096
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 178
;177:					UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;178:			}
LABELV $152
line 179
;179:		}
line 182
;180:
;181:		// some extra space after hostname and motd
;182:		y += 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 183
;183:	}
LABELV $141
line 186
;184:
;185:	// map-specific message (long map name)
;186:	s = CG_ConfigString( CS_MESSAGE );
CNSTI4 3
ARGI4
ADDRLP4 1084
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1084
INDIRP4
ASGNP4
line 187
;187:	if ( s[0] ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $154
line 188
;188:		UI_DrawProportionalString( 320, y, s,
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 190
;189:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;190:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 191
;191:	}
LABELV $154
line 194
;192:
;193:	// cheats warning
;194:	s = Info_ValueForKey( sysInfo, "sv_cheats" );
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1088
INDIRP4
ASGNP4
line 195
;195:	if ( s[0] == '1' ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $157
line 196
;196:		UI_DrawProportionalString( 320, y, CG_GetStripEdString("INGAMETEXT", "CHEATSAREENABLED"),
ADDRGP4 $147
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 1092
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 198
;197:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;198:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 199
;199:	}
LABELV $157
line 202
;200:
;201:	// game type
;202:	switch ( cgs.gametype ) {
ADDRLP4 1092
ADDRGP4 cgs+32960
INDIRI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
LTI4 $160
ADDRLP4 1092
INDIRI4
CNSTI4 8
GTI4 $160
ADDRLP4 1092
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $183
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $183
address $164
address $166
address $168
address $172
address $170
address $174
address $176
address $178
address $180
code
LABELV $164
line 204
;203:	case GT_FFA:
;204:		s = "Free For All";
ADDRLP4 8
ADDRGP4 $165
ASGNP4
line 205
;205:		break;
ADDRGP4 $161
JUMPV
LABELV $166
line 207
;206:	case GT_HOLOCRON:
;207:		s = "Holocron FFA";
ADDRLP4 8
ADDRGP4 $167
ASGNP4
line 208
;208:		break;
ADDRGP4 $161
JUMPV
LABELV $168
line 210
;209:	case GT_JEDIMASTER:
;210:		s = "Jedi Master";
ADDRLP4 8
ADDRGP4 $169
ASGNP4
line 211
;211:		break;
ADDRGP4 $161
JUMPV
LABELV $170
line 213
;212:	case GT_SINGLE_PLAYER:
;213:		s = "Single Player";
ADDRLP4 8
ADDRGP4 $171
ASGNP4
line 214
;214:		break;
ADDRGP4 $161
JUMPV
LABELV $172
line 216
;215:	case GT_TOURNAMENT:
;216:		s = "Duel";
ADDRLP4 8
ADDRGP4 $173
ASGNP4
line 217
;217:		break;
ADDRGP4 $161
JUMPV
LABELV $174
line 219
;218:	case GT_TEAM:
;219:		s = "Team FFA";
ADDRLP4 8
ADDRGP4 $175
ASGNP4
line 220
;220:		break;
ADDRGP4 $161
JUMPV
LABELV $176
line 222
;221:	case GT_SAGA:
;222:		s = "N/A";
ADDRLP4 8
ADDRGP4 $177
ASGNP4
line 223
;223:		break;
ADDRGP4 $161
JUMPV
LABELV $178
line 225
;224:	case GT_CTF:
;225:		s = "Capture The Flag";
ADDRLP4 8
ADDRGP4 $179
ASGNP4
line 226
;226:		break;
ADDRGP4 $161
JUMPV
LABELV $180
line 228
;227:	case GT_CTY:
;228:		s = "Capture The Ysalamiri";
ADDRLP4 8
ADDRGP4 $181
ASGNP4
line 229
;229:		break;
ADDRGP4 $161
JUMPV
LABELV $160
line 231
;230:	default:
;231:		s = "Unknown Gametype";
ADDRLP4 8
ADDRGP4 $182
ASGNP4
line 232
;232:		break;
LABELV $161
line 234
;233:	}
;234:	UI_DrawProportionalString( 320, y, s,
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 236
;235:		UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;236:	y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 238
;237:		
;238:	value = atoi( Info_ValueForKey( info, "timelimit" ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $184
ARGP4
ADDRLP4 1100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1104
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1104
INDIRI4
ASGNI4
line 239
;239:	if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $185
line 240
;240:		UI_DrawProportionalString( 320, y, va( "%s %i", CG_GetStripEdString("INGAMETEXT", "TIMELIMIT"), value ),
ADDRGP4 $147
ARGP4
ADDRGP4 $188
ARGP4
ADDRLP4 1108
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $187
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 242
;241:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;242:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 243
;243:	}
LABELV $185
line 245
;244:
;245:	if (cgs.gametype < GT_CTF ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
GEI4 $189
line 246
;246:		value = atoi( Info_ValueForKey( info, "fraglimit" ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $192
ARGP4
ADDRLP4 1108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1112
INDIRI4
ASGNI4
line 247
;247:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $193
line 248
;248:			UI_DrawProportionalString( 320, y, va( "%s %i", CG_GetStripEdString("INGAMETEXT", "FRAGLIMIT"), value ),
ADDRGP4 $147
ARGP4
ADDRGP4 $195
ARGP4
ADDRLP4 1116
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $187
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 250
;249:				UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;250:			y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 251
;251:		}
LABELV $193
line 253
;252:
;253:		if (cgs.gametype == GT_TOURNAMENT)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $196
line 254
;254:		{
line 255
;255:			value = atoi( Info_ValueForKey( info, "duel_fraglimit" ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 1116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1120
INDIRI4
ASGNI4
line 256
;256:			if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $200
line 257
;257:				UI_DrawProportionalString( 320, y, va( "%s %i", CG_GetStripEdString("INGAMETEXT", "WINLIMIT"), value ),
ADDRGP4 $147
ARGP4
ADDRGP4 $202
ARGP4
ADDRLP4 1124
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $187
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1128
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 259
;258:					UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;259:				y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 260
;260:			}
LABELV $200
line 261
;261:		}
LABELV $196
line 262
;262:	}
LABELV $189
line 264
;263:
;264:	if (cgs.gametype >= GT_CTF) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
LTI4 $203
line 265
;265:		value = atoi( Info_ValueForKey( info, "capturelimit" ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 1108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1112
INDIRI4
ASGNI4
line 266
;266:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $207
line 267
;267:			UI_DrawProportionalString( 320, y, va( "%s %i", CG_GetStripEdString("INGAMETEXT", "CAPTURELIMIT"), value ),
ADDRGP4 $147
ARGP4
ADDRGP4 $209
ARGP4
ADDRLP4 1116
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $187
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 269
;268:				UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;269:			y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 270
;270:		}
LABELV $207
line 271
;271:	}
LABELV $203
line 273
;272:
;273:	if (cgs.gametype >= GT_TEAM)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $210
line 274
;274:	{
line 275
;275:		value = atoi( Info_ValueForKey( info, "g_forceBasedTeams" ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 1108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1112
INDIRI4
ASGNI4
line 276
;276:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $214
line 277
;277:			UI_DrawProportionalString( 320, y, CG_GetStripEdString("INGAMETEXT", "FORCEBASEDTEAMS"),
ADDRGP4 $147
ARGP4
ADDRGP4 $216
ARGP4
ADDRLP4 1116
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1116
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 279
;278:				UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;279:			y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 280
;280:		}
LABELV $214
line 281
;281:	}
LABELV $210
line 283
;282:
;283:	valueNOFP = atoi( Info_ValueForKey( info, "g_forcePowerDisable" ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 1108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1112
INDIRI4
ASGNI4
line 285
;284:
;285:	value = atoi( Info_ValueForKey( info, "g_maxForceRank" ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $218
ARGP4
ADDRLP4 1116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1120
INDIRI4
ASGNI4
line 286
;286:	if ( value && !valueNOFP ) {
ADDRLP4 1124
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1124
INDIRI4
EQI4 $219
ADDRLP4 1044
INDIRI4
ADDRLP4 1124
INDIRI4
NEI4 $219
line 289
;287:		char fmStr[1024]; 
;288:
;289:		trap_SP_GetStringTextString("INGAMETEXT_MAXFORCERANK",fmStr, sizeof(fmStr));
ADDRGP4 $221
ARGP4
ADDRLP4 1128
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 291
;290:
;291:		UI_DrawProportionalString( 320, y, va( "%s %s", fmStr, CG_GetStripEdString("INGAMETEXT", forceMasteryLevels[value]) ),
ADDRGP4 $147
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryLevels
ADDP4
INDIRP4
ARGP4
ADDRLP4 2152
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $222
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 2152
INDIRP4
ARGP4
ADDRLP4 2156
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2156
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 293
;292:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;293:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 294
;294:	}
ADDRGP4 $220
JUMPV
LABELV $219
line 295
;295:	else if (!valueNOFP)
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $223
line 296
;296:	{
line 298
;297:		char fmStr[1024];
;298:		trap_SP_GetStringTextString("INGAMETEXT_MAXFORCERANK",fmStr, sizeof(fmStr));
ADDRGP4 $221
ARGP4
ADDRLP4 1128
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 300
;299:
;300:		UI_DrawProportionalString( 320, y, va( "%s %s", fmStr, (char *)CG_GetStripEdString("INGAMETEXT", forceMasteryLevels[7]) ),
ADDRGP4 $147
ARGP4
ADDRGP4 forceMasteryLevels+28
INDIRP4
ARGP4
ADDRLP4 2152
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $222
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 2152
INDIRP4
ARGP4
ADDRLP4 2156
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2156
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 302
;301:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;302:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 303
;303:	}
LABELV $223
LABELV $220
line 305
;304:
;305:	if (cgs.gametype == GT_TOURNAMENT)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $226
line 306
;306:	{
line 307
;307:		value = atoi( Info_ValueForKey( info, "g_duelWeaponDisable" ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $229
ARGP4
ADDRLP4 1128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1132
INDIRI4
ASGNI4
line 308
;308:	}
ADDRGP4 $227
JUMPV
LABELV $226
line 310
;309:	else
;310:	{
line 311
;311:		value = atoi( Info_ValueForKey( info, "g_weaponDisable" ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $230
ARGP4
ADDRLP4 1128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1132
INDIRI4
ASGNI4
line 312
;312:	}
LABELV $227
line 313
;313:	if ( cgs.gametype != GT_JEDIMASTER && value ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
EQI4 $231
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $231
line 314
;314:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "SABERONLYSET") ),
ADDRGP4 $147
ARGP4
ADDRGP4 $235
ARGP4
ADDRLP4 1128
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 316
;315:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;316:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 317
;317:	}
LABELV $231
line 319
;318:
;319:	if ( valueNOFP ) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $236
line 320
;320:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "NOFPSET") ),
ADDRGP4 $147
ARGP4
ADDRGP4 $238
ARGP4
ADDRLP4 1128
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 322
;321:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;322:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 323
;323:	}
LABELV $236
line 327
;324:
;325:
;326:	// Display the rules based on type
;327:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 328
;328:	switch ( cgs.gametype ) {
ADDRLP4 1128
ADDRGP4 cgs+32960
INDIRI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
LTI4 $240
ADDRLP4 1128
INDIRI4
CNSTI4 8
GTI4 $240
ADDRLP4 1128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $265
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $265
address $243
address $245
address $248
address $252
address $240
address $255
address $240
address $259
address $262
code
LABELV $243
line 330
;329:	case GT_FFA:					
;330:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_FFA_1")),
ADDRGP4 $147
ARGP4
ADDRGP4 $244
ARGP4
ADDRLP4 1136
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1140
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 332
;331:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;332:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 333
;333:		break;
ADDRGP4 $240
JUMPV
LABELV $245
line 335
;334:	case GT_HOLOCRON:
;335:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_HOLO_1")),
ADDRGP4 $147
ARGP4
ADDRGP4 $246
ARGP4
ADDRLP4 1144
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1148
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 337
;336:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;337:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 338
;338:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_HOLO_2")),
ADDRGP4 $147
ARGP4
ADDRGP4 $247
ARGP4
ADDRLP4 1152
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1156
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 340
;339:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;340:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 341
;341:		break;
ADDRGP4 $240
JUMPV
LABELV $248
line 343
;342:	case GT_JEDIMASTER:
;343:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_JEDI_1")),
ADDRGP4 $147
ARGP4
ADDRGP4 $249
ARGP4
ADDRLP4 1160
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1164
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 345
;344:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;345:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 346
;346:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_JEDI_2")),
ADDRGP4 $147
ARGP4
ADDRGP4 $250
ARGP4
ADDRLP4 1168
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1172
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1172
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 348
;347:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;348:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 349
;349:		break;
ADDRGP4 $240
JUMPV
line 351
;350:	case GT_SINGLE_PLAYER:
;351:		break;
LABELV $252
line 353
;352:	case GT_TOURNAMENT:
;353:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_DUEL_1")),
ADDRGP4 $147
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 1176
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1180
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1180
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 355
;354:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;355:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 356
;356:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_DUEL_2")),
ADDRGP4 $147
ARGP4
ADDRGP4 $254
ARGP4
ADDRLP4 1184
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1188
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 358
;357:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;358:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 359
;359:		break;
ADDRGP4 $240
JUMPV
LABELV $255
line 361
;360:	case GT_TEAM:
;361:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_TEAM_1")),
ADDRGP4 $147
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 1192
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1196
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 363
;362:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;363:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 364
;364:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_TEAM_2")),
ADDRGP4 $147
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 1200
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1204
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1204
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 366
;365:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;366:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 367
;367:		break;
ADDRGP4 $240
JUMPV
line 369
;368:	case GT_SAGA:
;369:		break;
LABELV $259
line 371
;370:	case GT_CTF:
;371:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_CTF_1")),
ADDRGP4 $147
ARGP4
ADDRGP4 $260
ARGP4
ADDRLP4 1208
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1212
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 373
;372:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;373:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 374
;374:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_CTF_2")),
ADDRGP4 $147
ARGP4
ADDRGP4 $261
ARGP4
ADDRLP4 1216
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1220
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 376
;375:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;376:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 377
;377:		break;
ADDRGP4 $240
JUMPV
LABELV $262
line 379
;378:	case GT_CTY:
;379:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_CTY_1")),
ADDRGP4 $147
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 1224
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 1228
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1228
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 381
;380:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;381:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 382
;382:		UI_DrawProportionalString( 320, y, va( "%s", (char *)CG_GetStripEdString("INGAMETEXT", "RULES_CTY_2")),
ADDRGP4 $147
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 1232
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $234
ARGP4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRLP4 1236
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1236
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 384
;383:			UI_CENTER|UI_INFOFONT|UI_DROPSHADOW, colorWhite );
;384:		y += iPropHeight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 385
;385:		break;
line 387
;386:	default:
;387:		break;
LABELV $240
line 389
;388:	}
;389:}
LABELV $127
endproc CG_DrawInformation 2160 20
export CG_LoadBar
proc CG_LoadBar 56 20
line 397
;390:
;391:/*
;392:===================
;393:CG_LoadBar
;394:===================
;395:*/
;396:void CG_LoadBar(void)
;397:{
line 398
;398:	const int numticks = 9, tickwidth = 40, tickheight = 8;
ADDRLP4 44
CNSTI4 9
ASGNI4
ADDRLP4 8
CNSTI4 40
ASGNI4
ADDRLP4 0
CNSTI4 8
ASGNI4
line 399
;399:	const int tickpadx = 20, tickpady = 12;
ADDRLP4 20
CNSTI4 20
ASGNI4
ADDRLP4 24
CNSTI4 12
ASGNI4
line 400
;400:	const int capwidth = 8;
ADDRLP4 4
CNSTI4 8
ASGNI4
line 401
;401:	const int barwidth = numticks*tickwidth+tickpadx*2+capwidth*2, barleft = ((640-barwidth)/2);
ADDRLP4 52
CNSTI4 1
ASGNI4
ADDRLP4 28
ADDRLP4 44
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 20
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDI4
ADDRLP4 4
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDI4
ASGNI4
ADDRLP4 32
CNSTI4 640
ADDRLP4 28
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 402
;402:	const int barheight = tickheight + tickpady*2, bartop = 480-barheight;
ADDRLP4 36
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
ADDRLP4 40
CNSTI4 480
ADDRLP4 36
INDIRI4
SUBI4
ASGNI4
line 403
;403:	const int capleft = barleft+tickpadx, tickleft = capleft+capwidth, ticktop = bartop+tickpady;
ADDRLP4 48
ADDRLP4 32
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
ADDRLP4 16
ADDRLP4 40
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 405
;404:
;405:	trap_R_SetColor( colorWhite );
ADDRGP4 colorWhite
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 407
;406:	// Draw background
;407:	CG_DrawPic(barleft, bartop, barwidth, barheight, cgs.media.loadBarLEDSurround);
ADDRLP4 32
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+70296+16
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 410
;408:
;409:	// Draw left cap (backwards)
;410:	CG_DrawPic(tickleft, ticktop, -capwidth, tickheight, cgs.media.loadBarLEDCap);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
NEGI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+70296+12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 413
;411:
;412:	// Draw bar
;413:	CG_DrawPic(tickleft, ticktop, tickwidth*cg.loadLCARSStage, tickheight, cgs.media.loadBarLED);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ADDRGP4 cg+13480
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+70296+8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 416
;414:
;415:	// Draw right cap
;416:	CG_DrawPic(tickleft+tickwidth*cg.loadLCARSStage, ticktop, capwidth, tickheight, cgs.media.loadBarLEDCap);
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
ADDRGP4 cg+13480
INDIRI4
MULI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+70296+12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 417
;417:}
LABELV $266
endproc CG_LoadBar 56 20
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
LABELV $264
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 67
char 1 84
char 1 89
char 1 95
char 1 50
char 1 0
align 1
LABELV $263
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 67
char 1 84
char 1 89
char 1 95
char 1 49
char 1 0
align 1
LABELV $261
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 50
char 1 0
align 1
LABELV $260
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 49
char 1 0
align 1
LABELV $257
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 50
char 1 0
align 1
LABELV $256
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 49
char 1 0
align 1
LABELV $254
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 68
char 1 85
char 1 69
char 1 76
char 1 95
char 1 50
char 1 0
align 1
LABELV $253
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 68
char 1 85
char 1 69
char 1 76
char 1 95
char 1 49
char 1 0
align 1
LABELV $250
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 74
char 1 69
char 1 68
char 1 73
char 1 95
char 1 50
char 1 0
align 1
LABELV $249
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 74
char 1 69
char 1 68
char 1 73
char 1 95
char 1 49
char 1 0
align 1
LABELV $247
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 72
char 1 79
char 1 76
char 1 79
char 1 95
char 1 50
char 1 0
align 1
LABELV $246
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 72
char 1 79
char 1 76
char 1 79
char 1 95
char 1 49
char 1 0
align 1
LABELV $244
char 1 82
char 1 85
char 1 76
char 1 69
char 1 83
char 1 95
char 1 70
char 1 70
char 1 65
char 1 95
char 1 49
char 1 0
align 1
LABELV $238
char 1 78
char 1 79
char 1 70
char 1 80
char 1 83
char 1 69
char 1 84
char 1 0
align 1
LABELV $235
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 79
char 1 78
char 1 76
char 1 89
char 1 83
char 1 69
char 1 84
char 1 0
align 1
LABELV $234
char 1 37
char 1 115
char 1 0
align 1
LABELV $230
char 1 103
char 1 95
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $229
char 1 103
char 1 95
char 1 100
char 1 117
char 1 101
char 1 108
char 1 87
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $222
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $221
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
char 1 77
char 1 65
char 1 88
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 82
char 1 65
char 1 78
char 1 75
char 1 0
align 1
LABELV $218
char 1 103
char 1 95
char 1 109
char 1 97
char 1 120
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 82
char 1 97
char 1 110
char 1 107
char 1 0
align 1
LABELV $217
char 1 103
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
LABELV $216
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 66
char 1 65
char 1 83
char 1 69
char 1 68
char 1 84
char 1 69
char 1 65
char 1 77
char 1 83
char 1 0
align 1
LABELV $213
char 1 103
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 66
char 1 97
char 1 115
char 1 101
char 1 100
char 1 84
char 1 101
char 1 97
char 1 109
char 1 115
char 1 0
align 1
LABELV $209
char 1 67
char 1 65
char 1 80
char 1 84
char 1 85
char 1 82
char 1 69
char 1 76
char 1 73
char 1 77
char 1 73
char 1 84
char 1 0
align 1
LABELV $206
char 1 99
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $202
char 1 87
char 1 73
char 1 78
char 1 76
char 1 73
char 1 77
char 1 73
char 1 84
char 1 0
align 1
LABELV $199
char 1 100
char 1 117
char 1 101
char 1 108
char 1 95
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
LABELV $195
char 1 70
char 1 82
char 1 65
char 1 71
char 1 76
char 1 73
char 1 77
char 1 73
char 1 84
char 1 0
align 1
LABELV $192
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
LABELV $188
char 1 84
char 1 73
char 1 77
char 1 69
char 1 76
char 1 73
char 1 77
char 1 73
char 1 84
char 1 0
align 1
LABELV $187
char 1 37
char 1 115
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $184
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
LABELV $182
char 1 85
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 71
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $181
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 84
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
LABELV $179
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 84
char 1 104
char 1 101
char 1 32
char 1 70
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $177
char 1 78
char 1 47
char 1 65
char 1 0
align 1
LABELV $175
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
LABELV $173
char 1 68
char 1 117
char 1 101
char 1 108
char 1 0
align 1
LABELV $171
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
LABELV $169
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
LABELV $167
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
LABELV $165
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
LABELV $159
char 1 67
char 1 72
char 1 69
char 1 65
char 1 84
char 1 83
char 1 65
char 1 82
char 1 69
char 1 69
char 1 78
char 1 65
char 1 66
char 1 76
char 1 69
char 1 68
char 1 0
align 1
LABELV $156
char 1 115
char 1 118
char 1 95
char 1 99
char 1 104
char 1 101
char 1 97
char 1 116
char 1 115
char 1 0
align 1
LABELV $151
char 1 99
char 1 108
char 1 95
char 1 109
char 1 111
char 1 116
char 1 100
char 1 83
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $148
char 1 80
char 1 85
char 1 82
char 1 69
char 1 95
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 0
align 1
LABELV $147
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
LABELV $144
char 1 115
char 1 118
char 1 95
char 1 112
char 1 117
char 1 114
char 1 101
char 1 0
align 1
LABELV $143
char 1 115
char 1 118
char 1 95
char 1 104
char 1 111
char 1 115
char 1 116
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $140
char 1 115
char 1 118
char 1 95
char 1 114
char 1 117
char 1 110
char 1 110
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $139
char 1 65
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 83
char 1 78
char 1 65
char 1 80
char 1 83
char 1 72
char 1 79
char 1 84
char 1 0
align 1
LABELV $137
char 1 76
char 1 79
char 1 65
char 1 68
char 1 73
char 1 78
char 1 71
char 1 95
char 1 77
char 1 65
char 1 80
char 1 78
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $136
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 0
align 1
LABELV $132
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $129
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 115
char 1 104
char 1 111
char 1 116
char 1 115
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $128
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $126
char 1 110
char 1 0
align 1
LABELV $124
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
