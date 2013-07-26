export vmMain
code
proc vmMain 12 8
file "../ui_main.c"
line 45
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:USER INTERFACE MAIN
;7:
;8:=======================================================================
;9:*/
;10:
;11:// use this to get a demo build without an explicit demo build, i.e. to get the demo ui files to build
;12://#define PRE_RELEASE_TADEMO
;13:
;14:#include "ui_local.h"
;15:#include "../qcommon/qfiles.h"
;16:#include "../qcommon/game_version.h"
;17:#include "ui_force.h"
;18:
;19:#if MAC_PORT
;20:#ifndef min
;21:#define min(a, b)	(a) < (b) ? a : b
;22:#endif
;23:#endif
;24:
;25:/*
;26:================
;27:vmMain
;28:
;29:This is the only way control passes into the module.
;30:!!! This MUST BE THE VERY FIRST FUNCTION compiled into the .qvm file !!!
;31:================
;32:*/
;33:vmCvar_t  ui_debug;
;34:vmCvar_t  ui_initialized;
;35:
;36:void _UI_Init( qboolean );
;37:void _UI_Shutdown( void );
;38:void _UI_KeyEvent( int key, qboolean down );
;39:void _UI_MouseEvent( int dx, int dy );
;40:void _UI_Refresh( int realtime );
;41:qboolean _UI_IsFullscreen( void );
;42:#if MAC_PORT && __MWERKS__
;43:#pragma export on
;44:#endif
;45:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 46
;46:  switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $150
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $150
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $163
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $163
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
address $161
address $162
code
LABELV $152
line 48
;47:	  case UI_GETAPIVERSION:
;48:		  return UI_API_VERSION;
CNSTI4 7
RETI4
ADDRGP4 $149
JUMPV
LABELV $153
line 51
;49:
;50:	  case UI_INIT:
;51:		  _UI_Init(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Init
CALLV
pop
line 52
;52:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $154
line 55
;53:
;54:	  case UI_SHUTDOWN:
;55:		  _UI_Shutdown();
ADDRGP4 _UI_Shutdown
CALLV
pop
line 56
;56:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $155
line 59
;57:
;58:	  case UI_KEY_EVENT:
;59:		  _UI_KeyEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_KeyEvent
CALLV
pop
line 60
;60:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $156
line 63
;61:
;62:	  case UI_MOUSE_EVENT:
;63:		  _UI_MouseEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_MouseEvent
CALLV
pop
line 64
;64:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $157
line 67
;65:
;66:	  case UI_REFRESH:
;67:		  _UI_Refresh( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Refresh
CALLV
pop
line 68
;68:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $158
line 71
;69:
;70:	  case UI_IS_FULLSCREEN:
;71:		  return _UI_IsFullscreen();
ADDRLP4 4
ADDRGP4 _UI_IsFullscreen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $149
JUMPV
LABELV $159
line 74
;72:
;73:	  case UI_SET_ACTIVE_MENU:
;74:		  _UI_SetActiveMenu( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 75
;75:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $160
line 78
;76:
;77:	  case UI_CONSOLE_COMMAND:
;78:		  return UI_ConsoleCommand(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $149
JUMPV
LABELV $161
line 81
;79:
;80:	  case UI_DRAW_CONNECT_SCREEN:
;81:		  UI_DrawConnectScreen( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawConnectScreen
CALLV
pop
line 82
;82:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $162
line 84
;83:	  case UI_HASUNIQUECDKEY: // mod authors need to observe this
;84:	    return qtrue; // bk010117 - change this to qfalse for mods!
CNSTI4 1
RETI4
ADDRGP4 $149
JUMPV
LABELV $150
line 88
;85:
;86:	}
;87:
;88:	return -1;
CNSTI4 -1
RETI4
LABELV $149
endproc vmMain 12 8
data
export holdSPString
align 1
LABELV holdSPString
char 1 0
skip 1023
export uiSkinColor
align 4
LABELV uiSkinColor
byte 4 0
lit
align 4
LABELV serverFilters
address $164
address $165
address $166
address $165
align 4
LABELV numServerFilters
byte 4 2
data
align 4
LABELV skillLevels
address $167
address $168
address $169
address $170
address $171
lit
align 4
LABELV numSkillLevels
byte 4 5
data
align 4
LABELV teamArenaGameTypes
address $172
address $173
address $174
address $175
address $176
address $177
address $178
address $179
address $180
address $181
lit
align 4
LABELV numTeamArenaGameTypes
byte 4 10
data
align 4
LABELV netnames
address $182
address $183
address $184
byte 4 0
align 4
LABELV gamecodetoui
byte 4 4
byte 4 2
byte 4 3
byte 4 0
byte 4 5
byte 4 1
byte 4 6
align 4
LABELV uitogamecode
byte 4 4
byte 4 6
byte 4 2
byte 4 3
byte 4 1
byte 4 5
byte 4 7
export UI_TeamName
code
proc UI_TeamName 0 0
line 168
;89:}
;90:#if MAC_PORT && __MWERKS__
;91:#pragma export reset
;92:#endif
;93:
;94:menuDef_t *Menus_FindByName(const char *p);
;95:void Menu_ShowItemByName(menuDef_t *menu, const char *p, qboolean bShow);
;96:void UpdateForceUsed();
;97:
;98:char holdSPString[1024]={0};
;99:
;100:uiInfo_t uiInfo;
;101:
;102:static void UI_StartServerRefresh(qboolean full);
;103:static void UI_StopServerRefresh( void );
;104:static void UI_DoServerRefresh( void );
;105:static void UI_BuildServerDisplayList(qboolean force);
;106:static void UI_BuildServerStatus(qboolean force);
;107:static void UI_BuildFindPlayerList(qboolean force);
;108:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 );
;109:static int UI_MapCountByGameType(qboolean singlePlayer);
;110:static int UI_HeadCountByTeam( void );
;111:static int UI_HeadCountByColor( void );
;112:static void UI_ParseGameInfo(const char *teamFile);
;113:static const char *UI_SelectedMap(int index, int *actual);
;114:static const char *UI_SelectedHead(int index, int *actual);
;115:static int UI_GetIndexFromSelection(int actual);
;116:
;117:int ProcessNewUI( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6 );
;118:int	uiSkinColor=TEAM_FREE;
;119:
;120:static const serverFilter_t serverFilters[] = {
;121:	{"All", "" },
;122:	{"Jedi Knight 2", "" },
;123:};
;124:static const int numServerFilters = sizeof(serverFilters) / sizeof(serverFilter_t);
;125:
;126:
;127:
;128:
;129:static const char *skillLevels[] = {
;130:  "SKILL1",//"I Can Win",
;131:  "SKILL2",//"Bring It On",
;132:  "SKILL3",//"Hurt Me Plenty",
;133:  "SKILL4",//"Hardcore",
;134:  "SKILL5"//"Nightmare"
;135:};
;136:static const int numSkillLevels = sizeof(skillLevels) / sizeof(const char*);
;137:
;138:
;139:
;140:static const char *teamArenaGameTypes[] = {
;141:	"FFA",
;142:	"HOLOCRON",
;143:	"JEDIMASTER",
;144:	"DUEL",
;145:	"SP",
;146:	"TEAM FFA",
;147:	"N/A",
;148:	"CTF",
;149:	"CTY",
;150:	"TEAMTOURNAMENT"
;151:};
;152:static int const numTeamArenaGameTypes = sizeof(teamArenaGameTypes) / sizeof(const char*);
;153:
;154:
;155:
;156:static char* netnames[] = {
;157:	"???",
;158:	"UDP",
;159:	"IPX",
;160:	NULL
;161:};
;162:
;163:static int gamecodetoui[] = {4,2,3,0,5,1,6};
;164:static int uitogamecode[] = {4,6,2,3,1,5,7};
;165:
;166:const char *UI_GetStripEdString(const char *refSection, const char *refName);
;167:
;168:const char *UI_TeamName(int team)  {
line 169
;169:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $186
line 170
;170:		return "RED";
ADDRGP4 $188
RETP4
ADDRGP4 $185
JUMPV
LABELV $186
line 171
;171:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $189
line 172
;172:		return "BLUE";
ADDRGP4 $191
RETP4
ADDRGP4 $185
JUMPV
LABELV $189
line 173
;173:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $192
line 174
;174:		return "SPECTATOR";
ADDRGP4 $194
RETP4
ADDRGP4 $185
JUMPV
LABELV $192
line 175
;175:	return "FREE";
ADDRGP4 $195
RETP4
LABELV $185
endproc UI_TeamName 0 0
bss
align 1
LABELV $197
skip 256
code
proc GetCRDelineatedString 20 8
line 181
;176:}
;177:
;178:// returns either string or NULL for OOR...
;179://
;180:static const char *GetCRDelineatedString( const char *psStripFileRef, const char *psStripStringRef, int iIndex)
;181:{
line 183
;182:	static char sTemp[256];
;183:	const char *psList = UI_GetStripEdString(psStripFileRef, psStripStringRef);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $199
JUMPV
LABELV $198
line 187
;184:	char *p;
;185:
;186:	while (iIndex--)
;187:	{
line 188
;188:		psList = strchr(psList,'\n');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 12
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 189
;189:		if (!psList){
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $201
line 190
;190:			return NULL;	// OOR
CNSTP4 0
RETP4
ADDRGP4 $196
JUMPV
LABELV $201
line 192
;191:		}
;192:		psList++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 193
;193:	}
LABELV $199
line 186
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $198
line 195
;194:
;195:	strcpy(sTemp,psList);
ADDRGP4 $197
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 196
;196:	p = strchr(sTemp,'\n');
ADDRGP4 $197
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 16
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 197
;197:	if (p) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $203
line 198
;198:		*p = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 199
;199:	}
LABELV $203
line 201
;200:
;201:	return sTemp;
ADDRGP4 $197
RETP4
LABELV $196
endproc GetCRDelineatedString 20 8
proc GetMonthAbbrevString 12 12
line 206
;202:}
;203:
;204:
;205:static const char *GetMonthAbbrevString( int iMonth )
;206:{
line 207
;207:	const char *p = GetCRDelineatedString("INGAMETEXT","MONTHS", iMonth);
ADDRGP4 $206
ARGP4
ADDRGP4 $207
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 209
;208:	
;209:	return p ? p : "Jan";	// sanity
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $210
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $210
ADDRLP4 8
ADDRGP4 $208
ASGNP4
LABELV $211
ADDRLP4 8
INDIRP4
RETP4
LABELV $205
endproc GetMonthAbbrevString 12 12
lit
align 4
LABELV numNetSources
byte 4 3
code
proc GetNetSourceString 12 12
line 226
;210:}
;211:
;212:
;213:
;214:
;215:/*
;216:static const char *netSources[] = {
;217:	"Local",
;218:	"Internet",
;219:	"Favorites"
;220://	"Mplayer"
;221:};
;222:static const int numNetSources = sizeof(netSources) / sizeof(const char*);
;223:*/
;224:static const int numNetSources = 3;	// now hard-entered in StripEd file
;225:static const char *GetNetSourceString(int iSource)
;226:{
line 227
;227:	const char *p = GetCRDelineatedString("INGAMETEXT","NET_SOURCES", iSource);
ADDRGP4 $206
ARGP4
ADDRGP4 $213
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 229
;228:
;229:	return p ? p : "??";
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $216
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $217
JUMPV
LABELV $216
ADDRLP4 8
ADDRGP4 $214
ASGNP4
LABELV $217
ADDRLP4 8
INDIRP4
RETP4
LABELV $212
endproc GetNetSourceString 12 12
export AssetCache
proc AssetCache 84 8
line 235
;230:}
;231:
;232:
;233:
;234:
;235:void AssetCache() {
line 241
;236:	int n;
;237:	//if (Assets.textFont == NULL) {
;238:	//}
;239:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;240:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;241:	uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
ADDRGP4 $221
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+28
ADDRLP4 4
INDIRI4
ASGNI4
line 242
;242:	uiInfo.uiDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $224
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+136
ADDRLP4 8
INDIRI4
ASGNI4
line 243
;243:	uiInfo.uiDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $227
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140
ADDRLP4 12
INDIRI4
ASGNI4
line 244
;244:	uiInfo.uiDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_ORANGE );//trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $231
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+4
ADDRLP4 16
INDIRI4
ASGNI4
line 245
;245:	uiInfo.uiDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );//trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $235
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+8
ADDRLP4 20
INDIRI4
ASGNI4
line 246
;246:	uiInfo.uiDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );//trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $239
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+12
ADDRLP4 24
INDIRI4
ASGNI4
line 247
;247:	uiInfo.uiDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $243
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+16
ADDRLP4 28
INDIRI4
ASGNI4
line 248
;248:	uiInfo.uiDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_PURPLE );//trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $247
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+20
ADDRLP4 32
INDIRI4
ASGNI4
line 249
;249:	uiInfo.uiDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $251
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+24
ADDRLP4 36
INDIRI4
ASGNI4
line 250
;250:	uiInfo.uiDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
ADDRGP4 $254
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+48
ADDRLP4 40
INDIRI4
ASGNI4
line 251
;251:	uiInfo.uiDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
ADDRGP4 $257
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+36
ADDRLP4 44
INDIRI4
ASGNI4
line 252
;252:	uiInfo.uiDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
ADDRGP4 $260
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+32
ADDRLP4 48
INDIRI4
ASGNI4
line 253
;253:	uiInfo.uiDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
ADDRGP4 $263
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+40
ADDRLP4 52
INDIRI4
ASGNI4
line 254
;254:	uiInfo.uiDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
ADDRGP4 $266
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+44
ADDRLP4 56
INDIRI4
ASGNI4
line 255
;255:	uiInfo.uiDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
ADDRGP4 $269
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+52
ADDRLP4 60
INDIRI4
ASGNI4
line 256
;256:	uiInfo.uiDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
ADDRGP4 $272
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+68
ADDRLP4 64
INDIRI4
ASGNI4
line 257
;257:	uiInfo.uiDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
ADDRGP4 $275
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+72
ADDRLP4 68
INDIRI4
ASGNI4
line 259
;258:
;259:	for( n = 0; n < NUM_CROSSHAIRS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 260
;260:		uiInfo.uiDC.Assets.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%c", 'a' + n ) );
ADDRGP4 $282
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+260+168
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 261
;261:	}
LABELV $277
line 259
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $276
line 263
;262:
;263:	uiInfo.newHighScoreSound = 0;//trap_S_RegisterSound("sound/feedback/voc_newhighscore.wav");
ADDRGP4 uiInfo+60864
CNSTI4 0
ASGNI4
line 264
;264:}
LABELV $218
endproc AssetCache 84 8
export _UI_DrawSides
proc _UI_DrawSides 12 36
line 266
;265:
;266:void _UI_DrawSides(float x, float y, float w, float h, float size) {
line 267
;267:	size *= uiInfo.uiDC.xscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+232
INDIRF4
MULF4
ASGNF4
line 268
;268:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+11800
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 269
;269:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+11800
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 270
;270:}
LABELV $284
endproc _UI_DrawSides 12 36
export _UI_DrawTopBottom
proc _UI_DrawTopBottom 12 36
line 272
;271:
;272:void _UI_DrawTopBottom(float x, float y, float w, float h, float size) {
line 273
;273:	size *= uiInfo.uiDC.yscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+228
INDIRF4
MULF4
ASGNF4
line 274
;274:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+11800
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 275
;275:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+11800
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 276
;276:}
LABELV $288
endproc _UI_DrawTopBottom 12 36
export _UI_DrawRect
proc _UI_DrawRect 0 20
line 284
;277:/*
;278:================
;279:UI_DrawRect
;280:
;281:Coordinates are 640*480 virtual values
;282:=================
;283:*/
;284:void _UI_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 285
;285:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 287
;286:
;287:  _UI_DrawTopBottom(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 _UI_DrawTopBottom
CALLV
pop
line 288
;288:  _UI_DrawSides(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 _UI_DrawSides
CALLV
pop
line 290
;289:
;290:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 291
;291:}
LABELV $292
endproc _UI_DrawRect 0 20
export MenuFontToHandle
proc MenuFontToHandle 4 0
line 294
;292:
;293:int MenuFontToHandle(int iMenuFont)
;294:{
line 295
;295:	switch (iMenuFont)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $296
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $299
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $302
ADDRGP4 $294
JUMPV
line 296
;296:	{
LABELV $296
line 297
;297:		case 1: return uiInfo.uiDC.Assets.qhSmallFont;
ADDRGP4 uiInfo+260+12
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $299
line 298
;298:		case 2: return uiInfo.uiDC.Assets.qhMediumFont;
ADDRGP4 uiInfo+260+16
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $302
line 299
;299:		case 3: return uiInfo.uiDC.Assets.qhBigFont;
ADDRGP4 uiInfo+260+20
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $294
line 302
;300:	}
;301:
;302:	return uiInfo.uiDC.Assets.qhMediumFont;	// 0;
ADDRGP4 uiInfo+260+16
INDIRI4
RETI4
LABELV $293
endproc MenuFontToHandle 4 0
export Text_Width
proc Text_Width 12 12
line 306
;303:}
;304:
;305:int Text_Width(const char *text, float scale, int iMenuFont) 
;306:{	
line 307
;307:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 309
;308:
;309:	return trap_R_Font_StrLenPixels(text, iFontIndex, scale);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $307
endproc Text_Width 12 12
export Text_Height
proc Text_Height 12 8
line 313
;310:}
;311:
;312:int Text_Height(const char *text, float scale, int iMenuFont) 
;313:{
line 314
;314:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 316
;315:
;316:	return trap_R_Font_HeightPixels(iFontIndex, scale);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 trap_R_Font_HeightPixels
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $308
endproc Text_Height 12 8
export Text_Paint
proc Text_Paint 20 28
line 320
;317:}
;318:
;319:void Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style, int iMenuFont)
;320:{
line 321
;321:	int iStyleOR = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 323
;322:
;323:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 32
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 327
;324:	//
;325:	// kludge.. convert JK2 menu styles to SOF2 printstring ctrl codes...
;326:	//	
;327:	switch (style)
ADDRLP4 12
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $310
ADDRLP4 12
INDIRI4
CNSTI4 6
GTI4 $310
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $319
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $319
address $312
address $313
address $314
address $315
address $316
address $317
address $318
code
line 328
;328:	{
LABELV $312
line 329
;329:	case  ITEM_TEXTSTYLE_NORMAL:			iStyleOR = 0;break;					// JK2 normal text
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $313
line 330
;330:	case  ITEM_TEXTSTYLE_BLINK:				iStyleOR = (int)STYLE_BLINK;break;		// JK2 fast blinking
ADDRLP4 0
CNSTI4 1073741824
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $314
line 331
;331:	case  ITEM_TEXTSTYLE_PULSE:				iStyleOR = (int)STYLE_BLINK;break;		// JK2 slow pulsing
ADDRLP4 0
CNSTI4 1073741824
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $315
line 332
;332:	case  ITEM_TEXTSTYLE_SHADOWED:			iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $316
line 333
;333:	case  ITEM_TEXTSTYLE_OUTLINED:			iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $317
line 334
;334:	case  ITEM_TEXTSTYLE_OUTLINESHADOWED:	iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $318
line 335
;335:	case  ITEM_TEXTSTYLE_SHADOWEDMORE:		iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
LABELV $310
LABELV $311
line 338
;336:	}
;337:
;338:	trap_R_Font_DrawString(	x,		// int ox
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
BORI4
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 0
NEI4 $321
ADDRLP4 16
CNSTI4 -1
ASGNI4
ADDRGP4 $322
JUMPV
LABELV $321
ADDRLP4 16
ADDRFP4 24
INDIRI4
ASGNI4
LABELV $322
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 trap_R_Font_DrawString
CALLV
pop
line 346
;339:							y,		// int oy
;340:							text,	// const char *text
;341:							color,	// paletteRGBA_c c
;342:							iStyleOR | iFontIndex,	// const int iFontHandle
;343:							!limit?-1:limit,		// iCharLimit (-1 = none)
;344:							scale	// const float scale = 1.0f
;345:							);
;346:}
LABELV $309
endproc Text_Paint 20 28
export Text_PaintWithCursor
proc Text_PaintWithCursor 1076 36
ADDRFP4 24
ADDRFP4 24
INDIRI4
CVII1 4
ASGNI1
line 350
;347:
;348:
;349:void Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style, int iMenuFont) 
;350:{
line 351
;351:	Text_Paint(x, y, scale, color, text, 0, limit, style, iMenuFont);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 355
;352:
;353:	// now print the cursor as well...  (excuse the braces, it's for porting C++ to C)
;354:	//
;355:	{
line 357
;356:		char sTemp[1024];
;357:		int iCopyCount = limit ? min(strlen(text), limit) : strlen(text);
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $326
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRFP4 28
INDIRI4
GEI4 $328
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $328
ADDRLP4 1032
ADDRFP4 28
INDIRI4
ASGNI4
LABELV $329
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRGP4 $327
JUMPV
LABELV $326
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1044
INDIRI4
ASGNI4
LABELV $327
ADDRLP4 0
ADDRLP4 1028
INDIRI4
ASGNI4
line 358
;358:			iCopyCount = min(iCopyCount,cursorPos);
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
GEI4 $331
ADDRLP4 1048
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $332
JUMPV
LABELV $331
ADDRLP4 1048
ADDRFP4 20
INDIRI4
ASGNI4
LABELV $332
ADDRLP4 0
ADDRLP4 1048
INDIRI4
ASGNI4
line 359
;359:			iCopyCount = min(iCopyCount,sizeof(sTemp));
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 1024
GEU4 $334
ADDRLP4 1052
ADDRLP4 0
INDIRI4
CVIU4 4
ASGNU4
ADDRGP4 $335
JUMPV
LABELV $334
ADDRLP4 1052
CNSTU4 1024
ASGNU4
LABELV $335
ADDRLP4 0
ADDRLP4 1052
INDIRU4
CVUI4 4
ASGNI4
line 363
;360:
;361:			// copy text into temp buffer for pixel measure...
;362:			//			
;363:			strncpy(sTemp,text,iCopyCount);
ADDRLP4 4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 364
;364:					sTemp[iCopyCount] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 366
;365:
;366:			{
line 367
;367:				int iFontIndex = MenuFontToHandle( iMenuFont );	
ADDRFP4 36
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 1056
ADDRLP4 1064
INDIRI4
ASGNI4
line 368
;368:				int iNextXpos  = trap_R_Font_StrLenPixels(sTemp, iFontIndex, scale );
ADDRLP4 4
ARGP4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 1068
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1068
INDIRI4
ASGNI4
line 370
;369:
;370:				Text_Paint(x+iNextXpos, y, scale, color, va("%c",cursor), 0, limit, style|ITEM_TEXTSTYLE_BLINK, iMenuFont);
ADDRGP4 $336
ARGP4
ADDRFP4 24
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRF4
ADDRLP4 1060
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
CNSTI4 1
BORI4
ARGI4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 371
;371:			}
line 372
;372:	}
line 373
;373:}
LABELV $323
endproc Text_PaintWithCursor 1076 36
lit
align 1
LABELV $340
char 1 0
skip 4095
code
proc Text_Paint_Limit 4144 36
line 379
;374:
;375:
;376:// maxX param is initially an X limit, but is also used as feedback. 0 = text was clipped to fit within, else maxX = next pos
;377://
;378:static void Text_Paint_Limit(float *maxX, float x, float y, float scale, vec4_t color, const char* text, float adjust, int limit, int iMenuFont) 
;379:{
line 382
;380:	// this is kinda dirty, but...
;381:	//
;382:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 32
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 385
;383:	
;384:	//float fMax = *maxX;
;385:	int iPixelLen = trap_R_Font_StrLenPixels(text, iFontIndex, scale);
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 386
;386:	if (x + iPixelLen > *maxX)
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDF4
ADDRFP4 0
INDIRP4
INDIRF4
LEF4 $338
line 387
;387:	{
line 391
;388:		// whole text won't fit, so we need to print just the amount that does...
;389:		//  Ok, this is slow and tacky, but only called occasionally, and it works...
;390:		//
;391:		char sTemp[4096]={0};	// lazy assumption
ADDRLP4 24
ADDRGP4 $340
INDIRB
ASGNB 4096
line 392
;392:		const char *psText = text;
ADDRLP4 4120
ADDRFP4 20
INDIRP4
ASGNP4
line 393
;393:		char *psOut = &sTemp[0];
ADDRLP4 16
ADDRLP4 24
ASGNP4
line 394
;394:		char *psOutLastGood = psOut;
ADDRLP4 4124
ADDRLP4 16
INDIRP4
ASGNP4
ADDRGP4 $342
JUMPV
LABELV $341
line 400
;395:		unsigned int uiLetter;
;396:
;397:		while (*psText && (x + trap_R_Font_StrLenPixels(sTemp, iFontIndex, scale)<=*maxX) 
;398:			   && psOut < &sTemp[sizeof(sTemp)-1]	// sanity
;399:				)
;400:		{
line 402
;401:			int iAdvanceCount;
;402:			psOutLastGood = psOut;
ADDRLP4 4124
ADDRLP4 16
INDIRP4
ASGNP4
line 404
;403:			
;404:			uiLetter = trap_AnyLanguage_ReadCharFromString(psText, &iAdvanceCount, NULL);
ADDRLP4 4120
INDIRP4
ARGP4
ADDRLP4 4128
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 4132
ADDRGP4 trap_AnyLanguage_ReadCharFromString
CALLU4
ASGNU4
ADDRLP4 20
ADDRLP4 4132
INDIRU4
ASGNU4
line 405
;405:			psText += iAdvanceCount;
ADDRLP4 4120
ADDRLP4 4128
INDIRI4
ADDRLP4 4120
INDIRP4
ADDP4
ASGNP4
line 407
;406:
;407:			if (uiLetter > 255)
ADDRLP4 20
INDIRU4
CNSTU4 255
LEU4 $345
line 408
;408:			{
line 409
;409:				*psOut++ = uiLetter>>8;
ADDRLP4 4136
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 4136
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4136
INDIRP4
ADDRLP4 20
INDIRU4
CNSTI4 8
RSHU4
CVUI4 4
CVII1 4
ASGNI1
line 410
;410:				*psOut++ = uiLetter&0xFF;
ADDRLP4 4140
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 4140
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4140
INDIRP4
ADDRLP4 20
INDIRU4
CNSTU4 255
BANDU4
CVUI4 4
CVII1 4
ASGNI1
line 411
;411:			}
ADDRGP4 $346
JUMPV
LABELV $345
line 413
;412:			else
;413:			{
line 414
;414:				*psOut++ = uiLetter&0xFF;
ADDRLP4 4136
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 4136
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4136
INDIRP4
ADDRLP4 20
INDIRU4
CNSTU4 255
BANDU4
CVUI4 4
CVII1 4
ASGNI1
line 415
;415:			}
LABELV $346
line 416
;416:		}
LABELV $342
line 397
ADDRLP4 4120
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $348
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 4128
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRFP4 4
INDIRF4
ADDRLP4 4128
INDIRI4
CVIF4 4
ADDF4
ADDRFP4 0
INDIRP4
INDIRF4
GTF4 $348
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 24+4095
CVPU4 4
LTU4 $341
LABELV $348
line 417
;417:		*psOutLastGood = '\0';
ADDRLP4 4124
INDIRP4
CNSTI1 0
ASGNI1
line 419
;418:
;419:		*maxX = 0;	// feedback
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 420
;420:		Text_Paint(x, y, scale, color, sTemp, adjust, limit, ITEM_TEXTSTYLE_NORMAL, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 421
;421:	}
ADDRGP4 $339
JUMPV
LABELV $338
line 423
;422:	else
;423:	{
line 426
;424:		// whole text fits fine, so print it all...
;425:		//
;426:		*maxX = x + iPixelLen;	// feedback the next position, as the caller expects		
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 427
;427:		Text_Paint(x, y, scale, color, text, adjust, limit, ITEM_TEXTSTYLE_NORMAL, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 428
;428:	}
LABELV $339
line 429
;429:}
LABELV $337
endproc Text_Paint_Limit 4144 36
export UI_ShowPostGame
proc UI_ShowPostGame 0 8
line 432
;430:
;431:
;432:void UI_ShowPostGame(qboolean newHigh) {
line 433
;433:	trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $350
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 434
;434:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $352
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 435
;435:	trap_Cvar_Set( "sv_killserver", "1" );
ADDRGP4 $353
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 436
;436:	uiInfo.soundHighScore = newHigh;
ADDRGP4 uiInfo+11836
ADDRFP4 0
INDIRI4
ASGNI4
line 437
;437:  _UI_SetActiveMenu(UIMENU_POSTGAME);
CNSTI4 5
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 438
;438:}
LABELV $349
endproc UI_ShowPostGame 0 8
export UI_DrawCenteredPic
proc UI_DrawCenteredPic 8 20
line 445
;439:/*
;440:=================
;441:_UI_Refresh
;442:=================
;443:*/
;444:
;445:void UI_DrawCenteredPic(qhandle_t image, int w, int h) {
line 447
;446:  int x, y;
;447:  x = (SCREEN_WIDTH - w) / 2;
ADDRLP4 0
CNSTI4 640
ADDRFP4 4
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 448
;448:  y = (SCREEN_HEIGHT - h) / 2;
ADDRLP4 4
CNSTI4 480
ADDRFP4 8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 449
;449:  UI_DrawHandlePic(x, y, w, h, image);
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 450
;450:}
LABELV $356
endproc UI_DrawCenteredPic 8 20
data
export frameCount
align 4
LABELV frameCount
byte 4 0
align 1
LABELV $358
char 1 0
skip 1023
export UI_GetStripEdString
code
proc UI_GetStripEdString 4 12
line 462
;451:
;452:int frameCount = 0;
;453:int startTime;
;454:
;455:vmCvar_t	ui_rankChange;
;456:static void UI_BuildPlayerList();
;457:char parsedFPMessage[1024];
;458:extern int FPMessageTime;
;459:void Text_PaintCenter(float x, float y, float scale, vec4_t color, const char *text, float adjust, int iMenuFont);
;460:
;461:const char *UI_GetStripEdString(const char *refSection, const char *refName)
;462:{
line 465
;463:	static char text[1024]={0};
;464:
;465:	trap_SP_GetStringTextString(va("%s_%s", refSection, refName), text, sizeof(text));
ADDRGP4 $359
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $358
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 466
;466:	return text;
ADDRGP4 $358
RETP4
LABELV $357
endproc UI_GetStripEdString 4 12
bss
align 4
LABELV $361
skip 4
align 4
LABELV $362
skip 16
export _UI_Refresh
code
proc _UI_Refresh 32 20
line 471
;467:}
;468:
;469:#define	UI_FPS_FRAMES	4
;470:void _UI_Refresh( int realtime )
;471:{
line 479
;472:	static int index;
;473:	static int	previousTimes[UI_FPS_FRAMES];
;474:
;475:	//if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
;476:	//	return;
;477:	//}
;478:
;479:	uiInfo.uiDC.frameTime = realtime - uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+244
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
SUBI4
ASGNI4
line 480
;480:	uiInfo.uiDC.realTime = realtime;
ADDRGP4 uiInfo+240
ADDRFP4 0
INDIRI4
ASGNI4
line 482
;481:
;482:	previousTimes[index % UI_FPS_FRAMES] = uiInfo.uiDC.frameTime;
ADDRGP4 $361
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $362
ADDP4
ADDRGP4 uiInfo+244
INDIRI4
ASGNI4
line 483
;483:	index++;
ADDRLP4 0
ADDRGP4 $361
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 484
;484:	if ( index > UI_FPS_FRAMES ) {
ADDRGP4 $361
INDIRI4
CNSTI4 4
LEI4 $367
line 487
;485:		int i, total;
;486:		// average multiple frames together to smooth changes out a bit
;487:		total = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 488
;488:		for ( i = 0 ; i < UI_FPS_FRAMES ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $369
line 489
;489:			total += previousTimes[i];
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $362
ADDP4
INDIRI4
ADDI4
ASGNI4
line 490
;490:		}
LABELV $370
line 488
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $369
line 491
;491:		if ( !total ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $373
line 492
;492:			total = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 493
;493:		}
LABELV $373
line 494
;494:		uiInfo.uiDC.FPS = 1000 * UI_FPS_FRAMES / total;
ADDRGP4 uiInfo+11812
CNSTI4 4000
ADDRLP4 8
INDIRI4
DIVI4
CVIF4 4
ASGNF4
line 495
;495:	}
LABELV $367
line 499
;496:
;497:
;498:
;499:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 501
;500:
;501:	if (Menu_Count() > 0) {
ADDRLP4 4
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $376
line 503
;502:		// paint all the menus
;503:		Menu_PaintAll();
ADDRGP4 Menu_PaintAll
CALLV
pop
line 505
;504:		// refresh server browser list
;505:		UI_DoServerRefresh();
ADDRGP4 UI_DoServerRefresh
CALLV
pop
line 507
;506:		// refresh server status
;507:		UI_BuildServerStatus(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 509
;508:		// refresh find player list
;509:		UI_BuildFindPlayerList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 510
;510:	} 
LABELV $376
line 513
;511:	
;512:	// draw cursor
;513:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 514
;514:	if (Menu_Count() > 0) {
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $378
line 515
;515:		UI_DrawHandlePic( uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory, 48, 48, uiInfo.uiDC.Assets.cursor);
ADDRGP4 uiInfo+248
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 uiInfo+252
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 uiInfo+260+24
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 516
;516:	}
LABELV $378
line 519
;517:
;518:#ifndef NDEBUG
;519:	if (uiInfo.uiDC.debug)
ADDRGP4 uiInfo+256
INDIRI4
CNSTI4 0
EQI4 $384
line 520
;520:	{
line 524
;521:		// cursor coordinates
;522:		//FIXME
;523:		//UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
;524:	}
LABELV $384
line 527
;525:#endif
;526:
;527:	if (ui_rankChange.integer)
ADDRGP4 ui_rankChange+12
INDIRI4
CNSTI4 0
EQI4 $387
line 528
;528:	{
line 529
;529:		FPMessageTime = realtime + 3000;
ADDRGP4 FPMessageTime
ADDRFP4 0
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 531
;530:
;531:		if (!parsedFPMessage[0] /*&& uiMaxRank > ui_rankChange.integer*/)
ADDRGP4 parsedFPMessage
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $390
line 532
;532:		{
line 533
;533:			const char *printMessage = UI_GetStripEdString("INGAMETEXT", "SET_NEW_RANK");
ADDRGP4 $206
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 28
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 535
;534:
;535:			int i = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 536
;536:			int p = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 537
;537:			int linecount = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $394
JUMPV
LABELV $393
line 540
;538:
;539:			while (printMessage[i] && p < 1024)
;540:			{
line 541
;541:				parsedFPMessage[p] = printMessage[i];
ADDRLP4 12
INDIRI4
ADDRGP4 parsedFPMessage
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 542
;542:				p++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 543
;543:				i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 544
;544:				linecount++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 546
;545:
;546:				if (linecount > 64 && printMessage[i] == ' ')
ADDRLP4 24
INDIRI4
CNSTI4 64
LEI4 $396
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $396
line 547
;547:				{
line 548
;548:					parsedFPMessage[p] = '\n';
ADDRLP4 12
INDIRI4
ADDRGP4 parsedFPMessage
ADDP4
CNSTI1 10
ASGNI1
line 549
;549:					p++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 550
;550:					linecount = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 551
;551:				}
LABELV $396
line 552
;552:			}
LABELV $394
line 539
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $398
ADDRLP4 12
INDIRI4
CNSTI4 1024
LTI4 $393
LABELV $398
line 553
;553:			parsedFPMessage[p] = '\0';
ADDRLP4 12
INDIRI4
ADDRGP4 parsedFPMessage
ADDP4
CNSTI1 0
ASGNI1
line 554
;554:		}
LABELV $390
line 557
;555:
;556:		//if (uiMaxRank > ui_rankChange.integer)
;557:		{
line 558
;558:			uiMaxRank = ui_rankChange.integer;
ADDRGP4 uiMaxRank
ADDRGP4 ui_rankChange+12
INDIRI4
ASGNI4
line 559
;559:			uiForceRank = uiMaxRank;
ADDRGP4 uiForceRank
ADDRGP4 uiMaxRank
INDIRI4
ASGNI4
line 573
;560:
;561:			/*
;562:			while (x < NUM_FORCE_POWERS)
;563:			{
;564:				//For now just go ahead and clear force powers upon rank change
;565:				uiForcePowersRank[x] = 0;
;566:				x++;
;567:			}
;568:			uiForcePowersRank[FP_LEVITATION] = 1;
;569:			uiForceUsed = 0;
;570:			*/
;571:
;572:			//Use BG_LegalizedForcePowers and transfer the result into the UI force settings
;573:			UI_ReadLegalForce();
ADDRGP4 UI_ReadLegalForce
CALLV
pop
line 574
;574:		}
line 576
;575:
;576:		if (ui_freeSaber.integer && uiForcePowersRank[FP_SABERATTACK] < 1)
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $400
ADDRGP4 uiForcePowersRank+60
INDIRI4
CNSTI4 1
GEI4 $400
line 577
;577:		{
line 578
;578:			uiForcePowersRank[FP_SABERATTACK] = 1;
ADDRGP4 uiForcePowersRank+60
CNSTI4 1
ASGNI4
line 579
;579:		}
LABELV $400
line 580
;580:		if (ui_freeSaber.integer && uiForcePowersRank[FP_SABERDEFEND] < 1)
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $405
ADDRGP4 uiForcePowersRank+64
INDIRI4
CNSTI4 1
GEI4 $405
line 581
;581:		{
line 582
;582:			uiForcePowersRank[FP_SABERDEFEND] = 1;
ADDRGP4 uiForcePowersRank+64
CNSTI4 1
ASGNI4
line 583
;583:		}
LABELV $405
line 584
;584:		trap_Cvar_Set("ui_rankChange", "0");
ADDRGP4 $410
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 587
;585:
;586:		//remember to update the force power count after changing the max rank
;587:		UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 588
;588:	}
LABELV $387
line 590
;589:
;590:	if (ui_freeSaber.integer)
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $411
line 591
;591:	{
line 592
;592:		bgForcePowerCost[FP_SABERATTACK][FORCE_LEVEL_1] = 0;
ADDRGP4 bgForcePowerCost+240+4
CNSTI4 0
ASGNI4
line 593
;593:		bgForcePowerCost[FP_SABERDEFEND][FORCE_LEVEL_1] = 0;
ADDRGP4 bgForcePowerCost+256+4
CNSTI4 0
ASGNI4
line 594
;594:	}
ADDRGP4 $412
JUMPV
LABELV $411
line 596
;595:	else
;596:	{
line 597
;597:		bgForcePowerCost[FP_SABERATTACK][FORCE_LEVEL_1] = 1;
ADDRGP4 bgForcePowerCost+240+4
CNSTI4 1
ASGNI4
line 598
;598:		bgForcePowerCost[FP_SABERDEFEND][FORCE_LEVEL_1] = 1;
ADDRGP4 bgForcePowerCost+256+4
CNSTI4 1
ASGNI4
line 599
;599:	}
LABELV $412
line 628
;600:
;601:	/*
;602:	if (parsedFPMessage[0] && FPMessageTime > realtime)
;603:	{
;604:		vec4_t txtCol;
;605:		int txtStyle = ITEM_TEXTSTYLE_SHADOWED;
;606:
;607:		if ((FPMessageTime - realtime) < 2000)
;608:		{
;609:			txtCol[0] = colorWhite[0];
;610:			txtCol[1] = colorWhite[1];
;611:			txtCol[2] = colorWhite[2];
;612:			txtCol[3] = (((float)FPMessageTime - (float)realtime)/2000);
;613:
;614:			txtStyle = 0;
;615:		}
;616:		else
;617:		{
;618:			txtCol[0] = colorWhite[0];
;619:			txtCol[1] = colorWhite[1];
;620:			txtCol[2] = colorWhite[2];
;621:			txtCol[3] = colorWhite[3];
;622:		}
;623:
;624:		Text_Paint(10, 0, 1, txtCol, parsedFPMessage, 0, 1024, txtStyle, FONT_MEDIUM);
;625:	}
;626:	*/
;627:	//For now, don't bother.
;628:}
LABELV $360
endproc _UI_Refresh 32 20
export _UI_Shutdown
proc _UI_Shutdown 0 0
line 635
;629:
;630:/*
;631:=================
;632:_UI_Shutdown
;633:=================
;634:*/
;635:void _UI_Shutdown( void ) {
line 636
;636:	trap_LAN_SaveCachedServers();
ADDRGP4 trap_LAN_SaveCachedServers
CALLV
pop
line 637
;637:}
LABELV $422
endproc _UI_Shutdown 0 0
data
export defaultMenu
align 4
LABELV defaultMenu
byte 4 0
bss
align 1
LABELV $424
skip 32768
export GetMenuBuffer
code
proc GetMenuBuffer 16 16
line 641
;638:
;639:char *defaultMenu = NULL;
;640:
;641:char *GetMenuBuffer(const char *filename) {
line 646
;642:	int	len;
;643:	fileHandle_t	f;
;644:	static char buf[MAX_MENUFILE];
;645:
;646:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 647
;647:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $425
line 648
;648:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
ADDRGP4 $427
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 649
;649:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $423
JUMPV
LABELV $425
line 651
;650:	}
;651:	if ( len >= MAX_MENUFILE ) {
ADDRLP4 0
INDIRI4
CNSTI4 32768
LTI4 $428
line 652
;652:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
ADDRGP4 $430
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 32768
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 653
;653:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 654
;654:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $423
JUMPV
LABELV $428
line 657
;655:	}
;656:
;657:	trap_FS_Read( buf, len, f );
ADDRGP4 $424
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 658
;658:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $424
ADDP4
CNSTI1 0
ASGNI1
line 659
;659:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 661
;660:	//COM_Compress(buf);
;661:  return buf;
ADDRGP4 $424
RETP4
LABELV $423
endproc GetMenuBuffer 16 16
export Asset_Parse
proc Asset_Parse 2152 12
line 665
;662:
;663:}
;664:
;665:qboolean Asset_Parse(int handle) {
line 670
;666:	char	stripedFile[MAX_STRING_CHARS];
;667:	pc_token_t token;
;668:	const char *tempStr;
;669:
;670:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 2068
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $432
line 671
;671:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $432
line 672
;672:	if (Q_stricmp(token.string, "{") != 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $437
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
EQI4 $439
line 673
;673:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $438
line 676
;674:	}
;675:    
;676:	while ( 1 ) {
line 678
;677:
;678:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 680
;679:
;680:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 2076
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $441
line 681
;681:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $441
line 683
;682:
;683:		if (Q_stricmp(token.string, "}") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $443
line 684
;684:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $431
JUMPV
LABELV $443
line 688
;685:		}
;686:
;687:		// font
;688:		if (Q_stricmp(token.string, "font") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $447
line 690
;689:			int pointSize;
;690:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2092
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
EQI4 $453
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 2088
ARGP4
ADDRLP4 2096
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $451
LABELV $453
line 691
;691:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $451
line 694
;692:			}			
;693:			//trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.textFont);
;694:			uiInfo.uiDC.Assets.qhMediumFont = trap_R_RegisterFont(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2100
ADDRGP4 trap_R_RegisterFont
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+16
ADDRLP4 2100
INDIRI4
ASGNI4
line 695
;695:			uiInfo.uiDC.Assets.fontRegistered = qtrue;
ADDRGP4 uiInfo+260+132
CNSTI4 1
ASGNI4
line 696
;696:			continue;
ADDRGP4 $439
JUMPV
LABELV $447
line 699
;697:		}
;698:
;699:		if (Q_stricmp(token.string, "smallFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $461
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $458
line 701
;700:			int pointSize;
;701:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2096
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
EQI4 $464
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 2092
ARGP4
ADDRLP4 2100
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $462
LABELV $464
line 702
;702:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $462
line 705
;703:			}
;704:			//trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.smallFont);
;705:			uiInfo.uiDC.Assets.qhSmallFont = trap_R_RegisterFont(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 trap_R_RegisterFont
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+12
ADDRLP4 2104
INDIRI4
ASGNI4
line 706
;706:			continue;
ADDRGP4 $439
JUMPV
LABELV $458
line 709
;707:		}
;708:
;709:		if (Q_stricmp(token.string, "bigFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $470
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $467
line 711
;710:			int pointSize;
;711:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2100
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
EQI4 $473
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 2096
ARGP4
ADDRLP4 2104
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $471
LABELV $473
line 712
;712:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $471
line 715
;713:			}
;714:			//trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.bigFont);
;715:			uiInfo.uiDC.Assets.qhBigFont = trap_R_RegisterFont(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2108
ADDRGP4 trap_R_RegisterFont
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+20
ADDRLP4 2108
INDIRI4
ASGNI4
line 716
;716:			continue;
ADDRGP4 $439
JUMPV
LABELV $467
line 719
;717:		}
;718:
;719:		if (Q_stricmp(token.string, "stripedFile") == 0) 
ADDRLP4 0+16
ARGP4
ADDRGP4 $479
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $476
line 720
;720:		{
line 721
;721:			if (!PC_String_Parse(handle, &tempStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2100
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $480
line 722
;722:			{
line 723
;723:				Com_Printf(S_COLOR_YELLOW,"Bad 1st parameter for keyword 'stripedFile'");
ADDRGP4 $482
ARGP4
ADDRGP4 $483
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 724
;724:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $480
line 726
;725:			}
;726:			Q_strncpyz( stripedFile, tempStr,  sizeof(stripedFile) );
ADDRLP4 1044
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 727
;727:			trap_SP_Register(stripedFile);
ADDRLP4 1044
ARGP4
ADDRGP4 trap_SP_Register
CALLI4
pop
line 728
;728:			continue;
ADDRGP4 $439
JUMPV
LABELV $476
line 731
;729:		}
;730:
;731:		if (Q_stricmp(token.string, "cursor") == 0) 
ADDRLP4 0+16
ARGP4
ADDRGP4 $487
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $484
line 732
;732:		{
line 733
;733:			if (!PC_String_Parse(handle, &uiInfo.uiDC.Assets.cursorStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+4
ARGP4
ADDRLP4 2104
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $488
line 734
;734:			{
line 735
;735:				Com_Printf(S_COLOR_YELLOW,"Bad 1st parameter for keyword 'cursor'");
ADDRGP4 $482
ARGP4
ADDRGP4 $492
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 736
;736:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $488
line 738
;737:			}
;738:			uiInfo.uiDC.Assets.cursor = trap_R_RegisterShaderNoMip( uiInfo.uiDC.Assets.cursorStr);
ADDRGP4 uiInfo+260+4
INDIRP4
ARGP4
ADDRLP4 2108
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+24
ADDRLP4 2108
INDIRI4
ASGNI4
line 739
;739:			continue;
ADDRGP4 $439
JUMPV
LABELV $484
line 743
;740:		}
;741:
;742:		// gradientbar
;743:		if (Q_stricmp(token.string, "gradientbar") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $500
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $497
line 744
;744:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2108
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $501
line 745
;745:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $501
line 747
;746:			}
;747:			uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2112
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+28
ADDRLP4 2112
INDIRI4
ASGNI4
line 748
;748:			continue;
ADDRGP4 $439
JUMPV
LABELV $497
line 752
;749:		}
;750:
;751:		// enterMenuSound
;752:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $508
ARGP4
ADDRLP4 2108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $505
line 753
;753:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2112
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $509
line 754
;754:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $509
line 756
;755:			}
;756:			uiInfo.uiDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2116
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+76
ADDRLP4 2116
INDIRI4
ASGNI4
line 757
;757:			continue;
ADDRGP4 $439
JUMPV
LABELV $505
line 761
;758:		}
;759:
;760:		// exitMenuSound
;761:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 2112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $513
line 762
;762:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2116
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2116
INDIRI4
CNSTI4 0
NEI4 $517
line 763
;763:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $517
line 765
;764:			}
;765:			uiInfo.uiDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2120
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+80
ADDRLP4 2120
INDIRI4
ASGNI4
line 766
;766:			continue;
ADDRGP4 $439
JUMPV
LABELV $513
line 770
;767:		}
;768:
;769:		// itemFocusSound
;770:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 2116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2116
INDIRI4
CNSTI4 0
NEI4 $521
line 771
;771:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2120
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2120
INDIRI4
CNSTI4 0
NEI4 $525
line 772
;772:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $525
line 774
;773:			}
;774:			uiInfo.uiDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2124
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+88
ADDRLP4 2124
INDIRI4
ASGNI4
line 775
;775:			continue;
ADDRGP4 $439
JUMPV
LABELV $521
line 779
;776:		}
;777:
;778:		// menuBuzzSound
;779:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $532
ARGP4
ADDRLP4 2120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2120
INDIRI4
CNSTI4 0
NEI4 $529
line 780
;780:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2124
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2124
INDIRI4
CNSTI4 0
NEI4 $533
line 781
;781:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $533
line 783
;782:			}
;783:			uiInfo.uiDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2128
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+84
ADDRLP4 2128
INDIRI4
ASGNI4
line 784
;784:			continue;
ADDRGP4 $439
JUMPV
LABELV $529
line 787
;785:		}
;786:
;787:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $540
ARGP4
ADDRLP4 2124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2124
INDIRI4
CNSTI4 0
NEI4 $537
line 788
;788:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeClamp)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+92
ARGP4
ADDRLP4 2128
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 2128
INDIRI4
CNSTI4 0
NEI4 $439
line 789
;789:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 791
;790:			}
;791:			continue;
LABELV $537
line 794
;792:		}
;793:
;794:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $548
ARGP4
ADDRLP4 2128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2128
INDIRI4
CNSTI4 0
NEI4 $545
line 795
;795:			if (!PC_Int_Parse(handle, &uiInfo.uiDC.Assets.fadeCycle)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+96
ARGP4
ADDRLP4 2132
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 2132
INDIRI4
CNSTI4 0
NEI4 $439
line 796
;796:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 798
;797:			}
;798:			continue;
LABELV $545
line 801
;799:		}
;800:
;801:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $556
ARGP4
ADDRLP4 2132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2132
INDIRI4
CNSTI4 0
NEI4 $553
line 802
;802:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeAmount)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+100
ARGP4
ADDRLP4 2136
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 2136
INDIRI4
CNSTI4 0
NEI4 $439
line 803
;803:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 805
;804:			}
;805:			continue;
LABELV $553
line 808
;806:		}
;807:
;808:		if (Q_stricmp(token.string, "shadowX") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $564
ARGP4
ADDRLP4 2136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2136
INDIRI4
CNSTI4 0
NEI4 $561
line 809
;809:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowX)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+104
ARGP4
ADDRLP4 2140
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 2140
INDIRI4
CNSTI4 0
NEI4 $439
line 810
;810:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 812
;811:			}
;812:			continue;
LABELV $561
line 815
;813:		}
;814:
;815:		if (Q_stricmp(token.string, "shadowY") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $572
ARGP4
ADDRLP4 2140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2140
INDIRI4
CNSTI4 0
NEI4 $569
line 816
;816:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowY)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+108
ARGP4
ADDRLP4 2144
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 2144
INDIRI4
CNSTI4 0
NEI4 $439
line 817
;817:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 819
;818:			}
;819:			continue;
LABELV $569
line 822
;820:		}
;821:
;822:		if (Q_stricmp(token.string, "shadowColor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $580
ARGP4
ADDRLP4 2144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2144
INDIRI4
CNSTI4 0
NEI4 $577
line 823
;823:			if (!PC_Color_Parse(handle, &uiInfo.uiDC.Assets.shadowColor)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+112
ARGP4
ADDRLP4 2148
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 2148
INDIRI4
CNSTI4 0
NEI4 $581
line 824
;824:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $581
line 826
;825:			}
;826:			uiInfo.uiDC.Assets.shadowFadeClamp = uiInfo.uiDC.Assets.shadowColor[3];
ADDRGP4 uiInfo+260+128
ADDRGP4 uiInfo+260+112+12
INDIRF4
ASGNF4
line 827
;827:			continue;
LABELV $577
line 830
;828:		}
;829:
;830:	}
LABELV $439
line 676
ADDRGP4 $438
JUMPV
line 831
;831:	return qfalse;
CNSTI4 0
RETI4
LABELV $431
endproc Asset_Parse 2152 12
export UI_Report
proc UI_Report 0 0
line 835
;832:}
;833:
;834:
;835:void UI_Report() {
line 836
;836:  String_Report();
ADDRGP4 String_Report
CALLV
pop
line 839
;837:  //Font_Report();
;838:
;839:}
LABELV $590
endproc UI_Report 0 0
export UI_ParseMenu
proc UI_ParseMenu 1060 12
line 841
;840:
;841:void UI_ParseMenu(const char *menuFile) {
line 845
;842:	int handle;
;843:	pc_token_t token;
;844:
;845:	Com_Printf("Parsing menu file:%s\n", menuFile);
ADDRGP4 $592
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 847
;846:
;847:	handle = trap_PC_LoadSource(menuFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1044
INDIRI4
ASGNI4
line 848
;848:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $596
line 849
;849:		return;
ADDRGP4 $591
JUMPV
LABELV $595
line 852
;850:	}
;851:
;852:	while ( 1 ) {
line 853
;853:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 854
;854:		if (!trap_PC_ReadToken( handle, &token )) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $598
line 855
;855:			break;
ADDRGP4 $597
JUMPV
LABELV $598
line 868
;856:		}
;857:
;858:		//if ( Q_stricmp( token, "{" ) ) {
;859:		//	Com_Printf( "Missing { in menu file\n" );
;860:		//	break;
;861:		//}
;862:
;863:		//if ( menuCount == MAX_MENUS ) {
;864:		//	Com_Printf( "Too many menus!\n" );
;865:		//	break;
;866:		//}
;867:
;868:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $600
line 869
;869:			break;
ADDRGP4 $597
JUMPV
LABELV $600
line 872
;870:		}
;871:
;872:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $606
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $603
line 873
;873:			if (Asset_Parse(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 Asset_Parse
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $597
line 874
;874:				continue;
ADDRGP4 $596
JUMPV
line 875
;875:			} else {
line 876
;876:				break;
LABELV $603
line 880
;877:			}
;878:		}
;879:
;880:		if (Q_stricmp(token.string, "menudef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $612
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $609
line 882
;881:			// start a new menu
;882:			Menu_New(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Menu_New
CALLV
pop
line 883
;883:		}
LABELV $609
line 884
;884:	}
LABELV $596
line 852
ADDRGP4 $595
JUMPV
LABELV $597
line 885
;885:	trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 886
;886:}
LABELV $591
endproc UI_ParseMenu 1060 12
export Load_Menu
proc Load_Menu 1048 8
line 888
;887:
;888:qboolean Load_Menu(int handle) {
line 891
;889:	pc_token_t token;
;890:
;891:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $614
line 892
;892:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $613
JUMPV
LABELV $614
line 893
;893:	if (token.string[0] != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $620
line 894
;894:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $613
JUMPV
LABELV $619
line 897
;895:	}
;896:
;897:	while ( 1 ) {
line 899
;898:
;899:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $622
line 900
;900:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $613
JUMPV
LABELV $622
line 902
;901:    
;902:		if ( token.string[0] == 0 ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $624
line 903
;903:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $613
JUMPV
LABELV $624
line 906
;904:		}
;905:
;906:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $627
line 907
;907:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $613
JUMPV
LABELV $627
line 910
;908:		}
;909:
;910:		UI_ParseMenu(token.string); 
ADDRLP4 0+16
ARGP4
ADDRGP4 UI_ParseMenu
CALLV
pop
line 911
;911:	}
LABELV $620
line 897
ADDRGP4 $619
JUMPV
line 912
;912:	return qfalse;
CNSTI4 0
RETI4
LABELV $613
endproc Load_Menu 1048 8
export UI_LoadMenus
proc UI_LoadMenus 1068 8
line 915
;913:}
;914:
;915:void UI_LoadMenus(const char *menuFile, qboolean reset) {
line 920
;916:	pc_token_t token;
;917:	int handle;
;918:	int start;
;919:
;920:	start = trap_Milliseconds();
ADDRLP4 1048
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1048
INDIRI4
ASGNI4
line 922
;921:
;922:	trap_PC_LoadGlobalDefines ( "ui/jk2mp/menudef.h" );
ADDRGP4 $632
ARGP4
ADDRGP4 trap_PC_LoadGlobalDefines
CALLI4
pop
line 924
;923:
;924:	handle = trap_PC_LoadSource( menuFile );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 925
;925:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $633
line 926
;926:		Com_Printf( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile );
ADDRGP4 $635
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 927
;927:		handle = trap_PC_LoadSource( "ui/jk2mpmenus.txt" );
ADDRGP4 $636
ARGP4
ADDRLP4 1056
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1056
INDIRI4
ASGNI4
line 928
;928:		if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $637
line 929
;929:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/menus.txt, unable to continue!\n", menuFile ) );
ADDRGP4 $639
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 930
;930:		}
LABELV $637
line 931
;931:	}
LABELV $633
line 933
;932:
;933:	if (reset) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $643
line 934
;934:		Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 935
;935:	}
ADDRGP4 $643
JUMPV
LABELV $642
line 937
;936:
;937:	while ( 1 ) {
line 938
;938:		if (!trap_PC_ReadToken(handle, &token))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1056
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $645
line 939
;939:			break;
ADDRGP4 $644
JUMPV
LABELV $645
line 940
;940:		if( token.string[0] == 0 || token.string[0] == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $651
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $647
LABELV $651
line 941
;941:			break;
ADDRGP4 $644
JUMPV
LABELV $647
line 944
;942:		}
;943:
;944:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $652
line 945
;945:			break;
ADDRGP4 $644
JUMPV
LABELV $652
line 948
;946:		}
;947:
;948:		if (Q_stricmp(token.string, "loadmenu") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $658
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $655
line 949
;949:			if (Load_Menu(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 Load_Menu
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $644
line 950
;950:				continue;
line 951
;951:			} else {
line 952
;952:				break;
LABELV $655
line 955
;953:			}
;954:		}
;955:	}
LABELV $643
line 937
ADDRGP4 $642
JUMPV
LABELV $644
line 957
;956:
;957:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
ADDRLP4 1056
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 $661
ARGP4
ADDRLP4 1056
INDIRI4
ADDRLP4 1044
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 959
;958:
;959:	trap_PC_FreeSource( handle );
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 961
;960:
;961:	trap_PC_RemoveAllGlobalDefines ( );
ADDRGP4 trap_PC_RemoveAllGlobalDefines
CALLV
pop
line 962
;962:}
LABELV $631
endproc UI_LoadMenus 1068 8
export UI_Load
proc UI_Load 1048 8
line 964
;963:
;964:void UI_Load() {
line 967
;965:	char *menuSet;
;966:	char lastName[1024];
;967:	menuDef_t *menu = Menu_GetFocused();
ADDRLP4 1032
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1032
INDIRP4
ASGNP4
line 969
;968:
;969:	if (menu && menu->window.name) {
ADDRLP4 1040
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 1040
INDIRU4
EQU4 $663
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1040
INDIRU4
EQU4 $663
line 970
;970:		strcpy(lastName, menu->window.name);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 971
;971:	}
ADDRGP4 $664
JUMPV
LABELV $663
line 973
;972:	else
;973:	{
line 974
;974:		lastName[0] = 0;
ADDRLP4 8
CNSTI1 0
ASGNI1
line 975
;975:	}
LABELV $664
line 977
;976:
;977:	if (uiInfo.inGameLoad)
ADDRGP4 uiInfo+95200
INDIRI4
CNSTI4 0
EQI4 $665
line 978
;978:	{
line 979
;979:		menuSet= "ui/jk2mpingame.txt";
ADDRLP4 0
ADDRGP4 $668
ASGNP4
line 980
;980:	}
ADDRGP4 $666
JUMPV
LABELV $665
line 982
;981:	else
;982:	{
line 983
;983:		menuSet= UI_Cvar_VariableString("ui_menuFilesMP");
ADDRGP4 $669
ARGP4
ADDRLP4 1044
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1044
INDIRP4
ASGNP4
line 984
;984:	}
LABELV $666
line 985
;985:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $672
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $670
LABELV $672
line 986
;986:		menuSet = "ui/jk2mpmenus.txt";
ADDRLP4 0
ADDRGP4 $636
ASGNP4
line 987
;987:	}
LABELV $670
line 989
;988:
;989:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 994
;990:
;991:#ifdef PRE_RELEASE_TADEMO
;992:	UI_ParseGameInfo("demogameinfo.txt");
;993:#else
;994:	UI_ParseGameInfo("ui/jk2mp/gameinfo.txt");
ADDRGP4 $673
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 996
;995:#endif
;996:	UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 997
;997:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 999
;998:
;999:	UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 1000
;1000:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 1001
;1001:	Menus_ActivateByName(lastName);
ADDRLP4 8
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 1003
;1002:
;1003:}
LABELV $662
endproc UI_Load 1048 8
data
align 4
LABELV handicapValues
address $674
address $675
address $676
address $677
address $678
address $679
address $680
address $681
address $682
address $683
address $684
address $685
address $686
address $687
address $688
address $689
address $690
address $691
address $692
address $693
byte 4 0
code
proc UI_DrawHandicap 20 36
line 1007
;1004:
;1005:static const char *handicapValues[] = {"None","95","90","85","80","75","70","65","60","55","50","45","40","35","30","25","20","15","10","5",NULL};
;1006:
;1007:static void UI_DrawHandicap(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1010
;1008:  int i, h;
;1009:
;1010:  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $695
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1011
;1011:  i = 20 - h / 5;
ADDRLP4 0
CNSTI4 20
ADDRLP4 4
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 1013
;1012:
;1013:  Text_Paint(rect->x, rect->y, scale, color, handicapValues[i], 0, 0, textStyle, iMenuFont);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1014
;1014:}
LABELV $694
endproc UI_DrawHandicap 20 36
proc UI_DrawClanName 8 36
line 1016
;1015:
;1016:static void UI_DrawClanName(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1017
;1017:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_teamName"), 0, 0, textStyle, iMenuFont);
ADDRGP4 $697
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1018
;1018:}
LABELV $696
endproc UI_DrawClanName 8 36
proc UI_SetCapFragLimits 16 8
line 1021
;1019:
;1020:
;1021:static void UI_SetCapFragLimits(qboolean uiVars) {
line 1022
;1022:	int cap = 5;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1023
;1023:	int frag = 10;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 1025
;1024:
;1025:	if (uiVars) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $699
line 1026
;1026:		trap_Cvar_Set("ui_captureLimit", va("%d", cap));
ADDRGP4 $702
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $701
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1027
;1027:		trap_Cvar_Set("ui_fragLimit", va("%d", frag));
ADDRGP4 $702
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $703
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1028
;1028:	} else {
ADDRGP4 $700
JUMPV
LABELV $699
line 1029
;1029:		trap_Cvar_Set("capturelimit", va("%d", cap));
ADDRGP4 $702
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $704
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1030
;1030:		trap_Cvar_Set("fraglimit", va("%d", frag));
ADDRGP4 $702
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $705
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1031
;1031:	}
LABELV $700
line 1032
;1032:}
LABELV $698
endproc UI_SetCapFragLimits 16 8
proc UI_DrawGameType 4 36
line 1034
;1033:// ui_gameType assumes gametype 0 is -1 ALL and will not show
;1034:static void UI_DrawGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1035
;1035:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_gameType.integer].gameType, 0, 0, textStyle, iMenuFont);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1036
;1036:}
LABELV $706
endproc UI_DrawGameType 4 36
proc UI_DrawNetGameType 4 36
line 1038
;1037:
;1038:static void UI_DrawNetGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1039
;1039:	if (ui_netGameType.integer < 0 || ui_netGameType.integer > uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $715
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
LEI4 $710
LABELV $715
line 1040
;1040:		trap_Cvar_Set("ui_netGameType", "0");
ADDRGP4 $716
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1041
;1041:		trap_Cvar_Set("ui_actualNetGameType", "0");
ADDRGP4 $717
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1042
;1042:	}
LABELV $710
line 1043
;1043:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_netGameType.integer].gameType , 0, 0, textStyle, iMenuFont);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1044
;1044:}
LABELV $709
endproc UI_DrawNetGameType 4 36
proc UI_DrawAutoSwitch 28 36
line 1046
;1045:
;1046:static void UI_DrawAutoSwitch(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1047
;1047:	int switchVal = trap_Cvar_VariableValue("cg_autoswitch");
ADDRGP4 $721
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1048
;1048:	const char *switchString = "AUTOSWITCH1";
ADDRLP4 4
ADDRGP4 $722
ASGNP4
line 1049
;1049:	const char *stripString = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1051
;1050:
;1051:	switch(switchVal)
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $729
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $725
ADDRLP4 16
INDIRI4
CNSTI4 3
EQI4 $727
ADDRGP4 $724
JUMPV
line 1052
;1052:	{
LABELV $725
line 1054
;1053:	case 2:
;1054:		switchString = "AUTOSWITCH2";
ADDRLP4 4
ADDRGP4 $726
ASGNP4
line 1055
;1055:		break;
ADDRGP4 $724
JUMPV
LABELV $727
line 1057
;1056:	case 3:
;1057:		switchString = "AUTOSWITCH3";
ADDRLP4 4
ADDRGP4 $728
ASGNP4
line 1058
;1058:		break;
ADDRGP4 $724
JUMPV
LABELV $729
line 1060
;1059:	case 0:
;1060:		switchString = "AUTOSWITCH0";
ADDRLP4 4
ADDRGP4 $730
ASGNP4
line 1061
;1061:		break;
line 1063
;1062:	default:
;1063:		break;
LABELV $724
line 1066
;1064:	}
;1065:
;1066:	stripString = UI_GetStripEdString("INGAMETEXT", (char *)switchString);
ADDRGP4 $206
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1068
;1067:
;1068:	if (stripString)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $731
line 1069
;1069:	{
line 1070
;1070:		Text_Paint(rect->x, rect->y, scale, color, stripString, 0, 0, textStyle, iMenuFont);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1071
;1071:	}
LABELV $731
line 1072
;1072:}
LABELV $720
endproc UI_DrawAutoSwitch 28 36
proc UI_DrawJoinGameType 4 36
line 1074
;1073:
;1074:static void UI_DrawJoinGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1075
;1075:	if (ui_joinGameType.integer < 0 || ui_joinGameType.integer > uiInfo.numJoinGameTypes) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
LTI4 $739
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+17876
INDIRI4
LEI4 $734
LABELV $739
line 1076
;1076:		trap_Cvar_Set("ui_joinGameType", "0");
ADDRGP4 $740
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1077
;1077:	}
LABELV $734
line 1078
;1078:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.joinGameTypes[ui_joinGameType.integer].gameType , 0, 0, textStyle, iMenuFont);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1079
;1079:}
LABELV $733
endproc UI_DrawJoinGameType 4 36
proc UI_TeamIndexFromName 12 8
line 1083
;1080:
;1081:
;1082:
;1083:static int UI_TeamIndexFromName(const char *name) {
line 1086
;1084:  int i;
;1085:
;1086:  if (name && *name) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $744
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $744
line 1087
;1087:    for (i = 0; i < uiInfo.teamCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $749
JUMPV
LABELV $746
line 1088
;1088:      if (Q_stricmp(name, uiInfo.teamList[i].teamName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $751
line 1089
;1089:        return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $743
JUMPV
LABELV $751
line 1091
;1090:      }
;1091:    }
LABELV $747
line 1087
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $749
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $746
line 1092
;1092:  } 
LABELV $744
line 1094
;1093:
;1094:  return 0;
CNSTI4 0
RETI4
LABELV $743
endproc UI_TeamIndexFromName 12 8
proc UI_DrawClanLogo 48 20
line 1098
;1095:
;1096:}
;1097:
;1098:static void UI_DrawClanLogo(rectDef_t *rect, float scale, vec4_t color) {
line 1100
;1099:  int i;
;1100:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1101
;1101:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $755
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $755
line 1102
;1102:  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1104
;1103:
;1104:		if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $758
line 1105
;1105:      uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 16
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1106
;1106:      uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 24
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1107
;1107:      uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 36
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 1108
;1108:		}
LABELV $758
line 1110
;1109:
;1110:  	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1111
;1111:    trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1112
;1112:  }
LABELV $755
line 1113
;1113:}
LABELV $754
endproc UI_DrawClanLogo 48 20
proc UI_DrawClanCinematic 32 24
line 1115
;1114:
;1115:static void UI_DrawClanCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1117
;1116:  int i;
;1117:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1118
;1118:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $779
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $779
line 1120
;1119:
;1120:		if (uiInfo.teamList[i].cinematic >= -2) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 -2
LTI4 $782
line 1121
;1121:			if (uiInfo.teamList[i].cinematic == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $786
line 1122
;1122:				uiInfo.teamList[i].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.teamList[i].imageName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 16
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
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
CNSTI4 10
ARGI4
ADDRLP4 28
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14160+52
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1123
;1123:			}
LABELV $786
line 1124
;1124:			if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 0
LTI4 $795
line 1125
;1125:			  trap_CIN_RunCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1126
;1126:				trap_CIN_SetExtents(uiInfo.teamList[i].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1127
;1127:	 			trap_CIN_DrawCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1128
;1128:			} else {
ADDRGP4 $783
JUMPV
LABELV $795
line 1129
;1129:			  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1130
;1130:				UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1131
;1131:				trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1132
;1132:				uiInfo.teamList[i].cinematic = -2;
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
CNSTI4 -2
ASGNI4
line 1133
;1133:			}
line 1134
;1134:		} else {
ADDRGP4 $783
JUMPV
LABELV $782
line 1135
;1135:	  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1136
;1136:			UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1137
;1137:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1138
;1138:		}
LABELV $783
line 1139
;1139:	}
LABELV $779
line 1141
;1140:
;1141:}
LABELV $778
endproc UI_DrawClanCinematic 32 24
proc UI_DrawPreviewCinematic 16 24
line 1143
;1142:
;1143:static void UI_DrawPreviewCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1144
;1144:	if (uiInfo.previewMovie > -2) {
ADDRGP4 uiInfo+36380
INDIRI4
CNSTI4 -2
LEI4 $812
line 1145
;1145:		uiInfo.previewMovie = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.movieList[uiInfo.movieIndex]), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRGP4 uiInfo+36376
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+35348
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+36380
ADDRLP4 8
INDIRI4
ASGNI4
line 1146
;1146:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+36380
INDIRI4
CNSTI4 0
LTI4 $818
line 1147
;1147:		  trap_CIN_RunCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1148
;1148:			trap_CIN_SetExtents(uiInfo.previewMovie, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1149
;1149: 			trap_CIN_DrawCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1150
;1150:		} else {
ADDRGP4 $819
JUMPV
LABELV $818
line 1151
;1151:			uiInfo.previewMovie = -2;
ADDRGP4 uiInfo+36380
CNSTI4 -2
ASGNI4
line 1152
;1152:		}
LABELV $819
line 1153
;1153:	} 
LABELV $812
line 1155
;1154:
;1155:}
LABELV $811
endproc UI_DrawPreviewCinematic 16 24
proc UI_DrawSkill 20 36
line 1157
;1156:
;1157:static void UI_DrawSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1159
;1158:  int i;
;1159:	i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1160
;1160:  if (i < 1 || i > numSkillLevels) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $829
ADDRLP4 0
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $827
LABELV $829
line 1161
;1161:    i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1162
;1162:  }
LABELV $827
line 1163
;1163:  Text_Paint(rect->x, rect->y, scale, color, (char *)UI_GetStripEdString("INGAMETEXT", (char *)skillLevels[i-1]),0, 0, textStyle, iMenuFont);
ADDRGP4 $206
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1164
;1164:}
LABELV $825
endproc UI_DrawSkill 20 36
proc UI_DrawGenericNum 268 36
line 1168
;1165:
;1166:
;1167:static void UI_DrawGenericNum(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int type,int iMenuFont) 
;1168:{
line 1172
;1169:	int i;
;1170:	char s[256];
;1171:
;1172:	i = val;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 1173
;1173:	if (i < min || i > max) 
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $834
ADDRLP4 0
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $832
LABELV $834
line 1174
;1174:	{
line 1175
;1175:		i = min;
ADDRLP4 0
ADDRFP4 20
INDIRI4
ASGNI4
line 1176
;1176:	}
LABELV $832
line 1178
;1177:
;1178:	Com_sprintf(s, sizeof(s), "%i\0", val);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $835
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1179
;1179:	Text_Paint(rect->x, rect->y, scale, color, s,0, 0, textStyle, iMenuFont);
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
INDIRF4
ARGF4
ADDRLP4 264
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1180
;1180:}
LABELV $831
endproc UI_DrawGenericNum 268 36
proc UI_DrawForceMastery 20 36
line 1183
;1181:
;1182:static void UI_DrawForceMastery(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int iMenuFont)
;1183:{
line 1187
;1184:	int i;
;1185:	char *s;
;1186:
;1187:	i = val;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 1188
;1188:	if (i < min || i > max) 
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $839
ADDRLP4 0
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $837
LABELV $839
line 1189
;1189:	{
line 1190
;1190:		i = min;
ADDRLP4 0
ADDRFP4 20
INDIRI4
ASGNI4
line 1191
;1191:	}
LABELV $837
line 1193
;1192:
;1193:	s = (char *)UI_GetStripEdString("INGAMETEXT", forceMasteryLevels[val]);
ADDRGP4 $206
ARGP4
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryLevels
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 1194
;1194:	Text_Paint(rect->x, rect->y, scale, color, s, 0, 0, textStyle, iMenuFont);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1195
;1195:}
LABELV $836
endproc UI_DrawForceMastery 20 36
proc UI_DrawSkinColor 272 36
line 1199
;1196:
;1197:
;1198:static void UI_DrawSkinColor(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int iMenuFont)
;1199:{
line 1203
;1200:	int i;
;1201:	char s[256];
;1202:
;1203:	i = val;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 1204
;1204:	if (i < min || i > max) 
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $843
ADDRLP4 0
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $841
LABELV $843
line 1205
;1205:	{
line 1206
;1206:		i = min;
ADDRLP4 0
ADDRFP4 20
INDIRI4
ASGNI4
line 1207
;1207:	}
LABELV $841
line 1209
;1208:
;1209:	switch(val)
ADDRLP4 264
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 1
EQI4 $846
ADDRLP4 264
INDIRI4
CNSTI4 2
EQI4 $848
ADDRGP4 $844
JUMPV
line 1210
;1210:	{
LABELV $846
line 1212
;1211:	case TEAM_RED:
;1212:		Com_sprintf(s, sizeof(s), "Red\0");
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $847
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1213
;1213:		break;
ADDRGP4 $845
JUMPV
LABELV $848
line 1215
;1214:	case TEAM_BLUE:
;1215:		Com_sprintf(s, sizeof(s), "Blue\0");
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $849
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1216
;1216:		break;
ADDRGP4 $845
JUMPV
LABELV $844
line 1218
;1217:	default:
;1218:		Com_sprintf(s, sizeof(s), "Default\0");
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $850
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1219
;1219:		break;
LABELV $845
line 1222
;1220:	}
;1221:
;1222:	Text_Paint(rect->x, rect->y, scale, color, s,0, 0, textStyle, iMenuFont);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
INDIRF4
ARGF4
ADDRLP4 268
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1223
;1223:}
LABELV $840
endproc UI_DrawSkinColor 272 36
proc UI_DrawForceSide 1312 36
line 1226
;1224:
;1225:static void UI_DrawForceSide(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int iMenuFont)
;1226:{
line 1233
;1227:	int i;
;1228:	char s[256];
;1229:	menuDef_t *menu;
;1230:	
;1231:	char info[MAX_INFO_VALUE];
;1232:
;1233:	i = val;
ADDRLP4 1028
ADDRFP4 16
INDIRI4
ASGNI4
line 1234
;1234:	if (i < min || i > max) 
ADDRLP4 1028
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $854
ADDRLP4 1028
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $852
LABELV $854
line 1235
;1235:	{
line 1236
;1236:		i = min;
ADDRLP4 1028
ADDRFP4 20
INDIRI4
ASGNI4
line 1237
;1237:	}
LABELV $852
line 1239
;1238:
;1239:	info[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1240
;1240:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1242
;1241:
;1242:	if (atoi( Info_ValueForKey( info, "g_forceBasedTeams" ) ))
ADDRLP4 4
ARGP4
ADDRGP4 $857
ARGP4
ADDRLP4 1292
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1292
INDIRP4
ARGP4
ADDRLP4 1296
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $855
line 1243
;1243:	{
line 1244
;1244:		switch((int)(trap_Cvar_VariableValue("ui_myteam")))
ADDRGP4 $860
ARGP4
ADDRLP4 1304
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1300
ADDRLP4 1304
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 1
EQI4 $862
ADDRLP4 1300
INDIRI4
CNSTI4 2
EQI4 $863
ADDRGP4 $859
JUMPV
line 1245
;1245:		{
LABELV $862
line 1247
;1246:		case TEAM_RED:
;1247:			uiForceSide = FORCE_DARKSIDE;
ADDRGP4 uiForceSide
CNSTI4 2
ASGNI4
line 1248
;1248:			color[0] = 0.2;
ADDRFP4 8
INDIRP4
CNSTF4 1045220557
ASGNF4
line 1249
;1249:			color[1] = 0.2;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1045220557
ASGNF4
line 1250
;1250:			color[2] = 0.2;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1045220557
ASGNF4
line 1251
;1251:			break;
ADDRGP4 $859
JUMPV
LABELV $863
line 1253
;1252:		case TEAM_BLUE:
;1253:			uiForceSide = FORCE_LIGHTSIDE;
ADDRGP4 uiForceSide
CNSTI4 1
ASGNI4
line 1254
;1254:			color[0] = 0.2;
ADDRFP4 8
INDIRP4
CNSTF4 1045220557
ASGNF4
line 1255
;1255:			color[1] = 0.2;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1045220557
ASGNF4
line 1256
;1256:			color[2] = 0.2;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1045220557
ASGNF4
line 1257
;1257:			break;
line 1259
;1258:		default:
;1259:			break;
LABELV $859
line 1261
;1260:		}
;1261:	}
LABELV $855
line 1263
;1262:
;1263:	if (val == FORCE_LIGHTSIDE)
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $864
line 1264
;1264:	{
line 1265
;1265:		trap_SP_GetStringTextString("MENUS3_FORCEDESC_LIGHT",s, sizeof(s));
ADDRGP4 $866
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1266
;1266:		menu = Menus_FindByName("forcealloc");
ADDRGP4 $867
ARGP4
ADDRLP4 1300
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1300
INDIRP4
ASGNP4
line 1267
;1267:		if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $868
line 1268
;1268:		{
line 1269
;1269:			Menu_ShowItemByName(menu, "lightpowers", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $870
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1270
;1270:			Menu_ShowItemByName(menu, "darkpowers", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $871
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1271
;1271:			Menu_ShowItemByName(menu, "darkpowers_team", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $872
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1273
;1272:
;1273:			Menu_ShowItemByName(menu, "lightpowers_team", qtrue);//(ui_gameType.integer >= GT_TEAM));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $873
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1275
;1274:
;1275:		}
LABELV $868
line 1276
;1276:		menu = Menus_FindByName("ingame_playerforce");
ADDRGP4 $874
ARGP4
ADDRLP4 1304
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1304
INDIRP4
ASGNP4
line 1277
;1277:		if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $865
line 1278
;1278:		{
line 1279
;1279:			Menu_ShowItemByName(menu, "lightpowers", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $870
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1280
;1280:			Menu_ShowItemByName(menu, "darkpowers", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $871
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1281
;1281:			Menu_ShowItemByName(menu, "darkpowers_team", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $872
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1283
;1282:
;1283:			Menu_ShowItemByName(menu, "lightpowers_team", qtrue);//(ui_gameType.integer >= GT_TEAM));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $873
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1284
;1284:		}
line 1285
;1285:	}
ADDRGP4 $865
JUMPV
LABELV $864
line 1287
;1286:	else
;1287:	{
line 1288
;1288:		trap_SP_GetStringTextString("MENUS3_FORCEDESC_DARK",s, sizeof(s));
ADDRGP4 $877
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1289
;1289:		menu = Menus_FindByName("forcealloc");
ADDRGP4 $867
ARGP4
ADDRLP4 1300
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1300
INDIRP4
ASGNP4
line 1290
;1290:		if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $878
line 1291
;1291:		{
line 1292
;1292:			Menu_ShowItemByName(menu, "lightpowers", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $870
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1293
;1293:			Menu_ShowItemByName(menu, "lightpowers_team", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $873
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1294
;1294:			Menu_ShowItemByName(menu, "darkpowers", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $871
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1296
;1295:
;1296:			Menu_ShowItemByName(menu, "darkpowers_team", qtrue);//(ui_gameType.integer >= GT_TEAM));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $872
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1297
;1297:		}
LABELV $878
line 1298
;1298:		menu = Menus_FindByName("ingame_playerforce");
ADDRGP4 $874
ARGP4
ADDRLP4 1304
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1304
INDIRP4
ASGNP4
line 1299
;1299:		if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $880
line 1300
;1300:		{
line 1301
;1301:			Menu_ShowItemByName(menu, "lightpowers", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $870
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1302
;1302:			Menu_ShowItemByName(menu, "lightpowers_team", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $873
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1303
;1303:			Menu_ShowItemByName(menu, "darkpowers", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $871
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1305
;1304:
;1305:			Menu_ShowItemByName(menu, "darkpowers_team", qtrue);//(ui_gameType.integer >= GT_TEAM));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $872
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1306
;1306:		}
LABELV $880
line 1307
;1307:	}
LABELV $865
line 1309
;1308:
;1309:	Text_Paint(rect->x, rect->y, scale, color, s,0, 0, textStyle, iMenuFont);
ADDRLP4 1300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1300
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1310
;1310:}
LABELV $851
endproc UI_DrawForceSide 1312 36
export UI_HasSetSaberOnly
proc UI_HasSetSaberOnly 1052 12
line 1313
;1311:
;1312:qboolean UI_HasSetSaberOnly( void )
;1313:{
line 1315
;1314:	char	info[MAX_INFO_STRING];
;1315:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1316
;1316:	int wDisable = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1317
;1317:	int	gametype = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 1319
;1318:
;1319:	gametype = atoi(Info_ValueForKey(info, "g_gametype"));
ADDRLP4 8
ARGP4
ADDRGP4 $883
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1040
INDIRI4
ASGNI4
line 1321
;1320:
;1321:	if ( gametype == GT_JEDIMASTER )
ADDRLP4 1032
INDIRI4
CNSTI4 2
NEI4 $884
line 1322
;1322:	{ //set to 0 
line 1323
;1323:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $882
JUMPV
LABELV $884
line 1326
;1324:	}
;1325:
;1326:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1328
;1327:
;1328:	if (gametype == GT_TOURNAMENT)
ADDRLP4 1032
INDIRI4
CNSTI4 3
NEI4 $886
line 1329
;1329:	{
line 1330
;1330:		wDisable = atoi(Info_ValueForKey(info, "g_duelWeaponDisable"));
ADDRLP4 8
ARGP4
ADDRGP4 $888
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1048
INDIRI4
ASGNI4
line 1331
;1331:	}
ADDRGP4 $891
JUMPV
LABELV $886
line 1333
;1332:	else
;1333:	{
line 1334
;1334:		wDisable = atoi(Info_ValueForKey(info, "g_weaponDisable"));
ADDRLP4 8
ARGP4
ADDRGP4 $889
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1048
INDIRI4
ASGNI4
line 1335
;1335:	}
ADDRGP4 $891
JUMPV
LABELV $890
line 1338
;1336:
;1337:	while (i < WP_NUM_WEAPONS)
;1338:	{
line 1339
;1339:		if (!(wDisable & (1 << i)) &&
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 1048
INDIRI4
NEI4 $893
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $893
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
EQI4 $893
line 1341
;1340:			i != WP_SABER && i != WP_NONE)
;1341:		{
line 1342
;1342:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $882
JUMPV
LABELV $893
line 1345
;1343:		}
;1344:
;1345:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1346
;1346:	}
LABELV $891
line 1337
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $890
line 1348
;1347:
;1348:	return qtrue;
CNSTI4 1
RETI4
LABELV $882
endproc UI_HasSetSaberOnly 1052 12
proc UI_AllForceDisabled 4 0
line 1352
;1349:}
;1350:
;1351:static qboolean UI_AllForceDisabled(int force)
;1352:{
line 1355
;1353:	int i;
;1354:
;1355:	if (force)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $896
line 1356
;1356:	{
line 1357
;1357:		for (i=0;i<NUM_FORCE_POWERS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $898
line 1358
;1358:		{
line 1359
;1359:			if (!(force & (1<<i)))
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $902
line 1360
;1360:			{
line 1361
;1361:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $895
JUMPV
LABELV $902
line 1363
;1362:			}
;1363:		}
LABELV $899
line 1357
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $898
line 1365
;1364:
;1365:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $895
JUMPV
LABELV $896
line 1368
;1366:	}
;1367:
;1368:	return qfalse;
CNSTI4 0
RETI4
LABELV $895
endproc UI_AllForceDisabled 4 0
export UI_TrueJediEnabled
proc UI_TrueJediEnabled 1084 12
line 1372
;1369:}
;1370:
;1371:qboolean UI_TrueJediEnabled( void )
;1372:{
line 1374
;1373:	char	info[MAX_INFO_STRING];
;1374:	int		gametype = 0, disabledForce = 0, trueJedi = 0;
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 1375
;1375:	qboolean saberOnly = qfalse, allForceDisabled = qfalse;
ADDRLP4 1036
CNSTI4 0
ASGNI4
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 1377
;1376:
;1377:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1382
;1378:
;1379:	//already have serverinfo at this point for stuff below. Don't bother trying to use ui_forcePowerDisable.
;1380:	//if (ui_forcePowerDisable.integer)
;1381:	//if (atoi(Info_ValueForKey(info, "g_forcePowerDisable")))
;1382:	disabledForce = atoi(Info_ValueForKey(info, "g_forcePowerDisable"));
ADDRLP4 0
ARGP4
ADDRGP4 $905
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1048
INDIRI4
ASGNI4
line 1383
;1383:	allForceDisabled = UI_AllForceDisabled(disabledForce);
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 1384
;1384:	gametype = atoi(Info_ValueForKey(info, "g_gametype"));
ADDRLP4 0
ARGP4
ADDRGP4 $883
ARGP4
ADDRLP4 1056
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1060
INDIRI4
ASGNI4
line 1385
;1385:	saberOnly = UI_HasSetSaberOnly();
ADDRLP4 1064
ADDRGP4 UI_HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1064
INDIRI4
ASGNI4
line 1387
;1386:
;1387:	if ( gametype == GT_HOLOCRON 
ADDRLP4 1024
INDIRI4
CNSTI4 1
EQI4 $910
ADDRLP4 1024
INDIRI4
CNSTI4 2
EQI4 $910
ADDRLP4 1072
CNSTI4 0
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRLP4 1072
INDIRI4
NEI4 $910
ADDRLP4 1040
INDIRI4
ADDRLP4 1072
INDIRI4
EQI4 $906
LABELV $910
line 1391
;1388:		|| gametype == GT_JEDIMASTER 
;1389:		|| saberOnly 
;1390:		|| allForceDisabled )
;1391:	{
line 1392
;1392:		trueJedi = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 1393
;1393:	}
ADDRGP4 $907
JUMPV
LABELV $906
line 1395
;1394:	else
;1395:	{
line 1396
;1396:		trueJedi = atoi( Info_ValueForKey( info, "g_jediVmerc" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $911
ARGP4
ADDRLP4 1076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1080
INDIRI4
ASGNI4
line 1397
;1397:	}
LABELV $907
line 1398
;1398:	return (trueJedi != 0);
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $913
ADDRLP4 1076
CNSTI4 1
ASGNI4
ADDRGP4 $914
JUMPV
LABELV $913
ADDRLP4 1076
CNSTI4 0
ASGNI4
LABELV $914
ADDRLP4 1076
INDIRI4
RETI4
LABELV $904
endproc UI_TrueJediEnabled 1084 12
proc UI_DrawJediNonJedi 1296 36
line 1402
;1399:}
;1400:
;1401:static void UI_DrawJediNonJedi(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int iMenuFont)
;1402:{
line 1409
;1403:	int i;
;1404:	char s[256];
;1405:	//menuDef_t *menu;
;1406:	
;1407:	char info[MAX_INFO_VALUE];
;1408:
;1409:	i = val;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 1410
;1410:	if (i < min || i > max) 
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $918
ADDRLP4 0
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $916
LABELV $918
line 1411
;1411:	{
line 1412
;1412:		i = min;
ADDRLP4 0
ADDRFP4 20
INDIRI4
ASGNI4
line 1413
;1413:	}
LABELV $916
line 1415
;1414:
;1415:	info[0] = '\0';
ADDRLP4 260
CNSTI1 0
ASGNI1
line 1416
;1416:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1418
;1417:
;1418:	if ( !UI_TrueJediEnabled() )
ADDRLP4 1288
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 0
NEI4 $919
line 1419
;1419:	{//true jedi mode is not on, do not draw this button type
line 1420
;1420:		return;
ADDRGP4 $915
JUMPV
LABELV $919
line 1423
;1421:	}
;1422:
;1423:	if ( val == FORCE_NONJEDI )
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $921
line 1424
;1424:	{
line 1425
;1425:		trap_SP_GetStringTextString("MENUS0_NO",s, sizeof(s));
ADDRGP4 $923
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1426
;1426:	}
ADDRGP4 $922
JUMPV
LABELV $921
line 1428
;1427:	else
;1428:	{
line 1429
;1429:		trap_SP_GetStringTextString("MENUS0_YES",s, sizeof(s));
ADDRGP4 $924
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1430
;1430:	}
LABELV $922
line 1432
;1431:
;1432:	Text_Paint(rect->x, rect->y, scale, color, s,0, 0, textStyle, iMenuFont);
ADDRLP4 1292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1292
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1433
;1433:}
LABELV $915
endproc UI_DrawJediNonJedi 1296 36
proc UI_DrawTeamName 32 36
line 1435
;1434:
;1435:static void UI_DrawTeamName(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int textStyle, int iMenuFont) {
line 1437
;1436:  int i;
;1437:  i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $929
ADDRLP4 4
ADDRGP4 $926
ASGNP4
ADDRGP4 $930
JUMPV
LABELV $929
ADDRLP4 4
ADDRGP4 $927
ASGNP4
LABELV $930
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1438
;1438:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $931
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $931
line 1439
;1439:    Text_Paint(rect->x, rect->y, scale, color, va("%s: %s", (blue) ? "Blue" : "Red", uiInfo.teamList[i].teamName),0, 0, textStyle, iMenuFont);
ADDRGP4 $934
ARGP4
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $939
ADDRLP4 20
ADDRGP4 $935
ASGNP4
ADDRGP4 $940
JUMPV
LABELV $939
ADDRLP4 20
ADDRGP4 $936
ASGNP4
LABELV $940
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1440
;1440:  }
LABELV $931
line 1441
;1441:}
LABELV $925
endproc UI_DrawTeamName 32 36
proc UI_DrawTeamMember 56 36
line 1444
;1442:
;1443:static void UI_DrawTeamMember(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int num, int textStyle, int iMenuFont) 
;1444:{
line 1448
;1445:	// 0 - None
;1446:	// 1 - Human
;1447:	// 2..NumCharacters - Bot
;1448:	int value = trap_Cvar_VariableValue(va(blue ? "ui_blueteam%i" : "ui_redteam%i", num));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $945
ADDRLP4 32
ADDRGP4 $942
ASGNP4
ADDRGP4 $946
JUMPV
LABELV $945
ADDRLP4 32
ADDRGP4 $943
ASGNP4
LABELV $946
ADDRLP4 32
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 1450
;1449:	const char *text;
;1450:	int maxcl = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $947
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
line 1452
;1451:	vec4_t finalColor;
;1452:	int numval = num;
ADDRLP4 20
ADDRFP4 16
INDIRI4
ASGNI4
line 1454
;1453:
;1454:	numval *= 2;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1456
;1455:
;1456:	if (blue)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $948
line 1457
;1457:	{
line 1458
;1458:		numval -= 1;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1459
;1459:	}
LABELV $948
line 1461
;1460:
;1461:	finalColor[0] = color[0];
ADDRLP4 0
ADDRFP4 8
INDIRP4
INDIRF4
ASGNF4
line 1462
;1462:	finalColor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1463
;1463:	finalColor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1464
;1464:	finalColor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1466
;1465:
;1466:	if (numval > maxcl)
ADDRLP4 20
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $953
line 1467
;1467:	{
line 1468
;1468:		finalColor[0] *= 0.2;
ADDRLP4 0
CNSTF4 1045220557
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1469
;1469:		finalColor[1] *= 0.2;
ADDRLP4 0+4
CNSTF4 1045220557
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
line 1470
;1470:		finalColor[2] *= 0.2;
ADDRLP4 0+8
CNSTF4 1045220557
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 1472
;1471:
;1472:		value = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 1473
;1473:	}
LABELV $953
line 1475
;1474:
;1475:	if (value <= 1) {
ADDRLP4 16
INDIRI4
CNSTI4 1
GTI4 $957
line 1476
;1476:		if (value == -1)
ADDRLP4 16
INDIRI4
CNSTI4 -1
NEI4 $959
line 1477
;1477:		{
line 1479
;1478:			//text = "Closed";
;1479:			text = UI_GetStripEdString("MENUS3", "CLOSED");
ADDRGP4 $961
ARGP4
ADDRGP4 $962
ARGP4
ADDRLP4 48
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 48
INDIRP4
ASGNP4
line 1480
;1480:		}
ADDRGP4 $958
JUMPV
LABELV $959
line 1482
;1481:		else
;1482:		{
line 1484
;1483:			//text = "Human";
;1484:			text = UI_GetStripEdString("MENUS3", "HUMAN");
ADDRGP4 $961
ARGP4
ADDRGP4 $963
ARGP4
ADDRLP4 48
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 48
INDIRP4
ASGNP4
line 1485
;1485:		}
line 1486
;1486:	} else {
ADDRGP4 $958
JUMPV
LABELV $957
line 1487
;1487:		value -= 2;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1495
;1488:
;1489:		/*if (ui_actualNetGameType.integer >= GT_TEAM) {
;1490:			if (value >= uiInfo.characterCount) {
;1491:				value = 0;
;1492:			}
;1493:			text = uiInfo.characterList[value].name;
;1494:		} else {*/
;1495:			if (value >= UI_GetNumBots()) {
ADDRLP4 48
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $964
line 1496
;1496:				value = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1497
;1497:			}
LABELV $964
line 1498
;1498:			text = UI_GetBotNameByNumber(value);
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 52
INDIRP4
ASGNP4
line 1500
;1499:		//}
;1500:	}
LABELV $958
line 1502
;1501:
;1502:  Text_Paint(rect->x, rect->y, scale, finalColor, text, 0, 0, textStyle, iMenuFont);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
INDIRF4
ARGF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1503
;1503:}
LABELV $941
endproc UI_DrawTeamMember 56 36
proc UI_DrawEffects 4 20
line 1506
;1504:
;1505:static void UI_DrawEffects(rectDef_t *rect, float scale, vec4_t color) 
;1506:{
line 1507
;1507:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiSaberColorShaders[uiInfo.effectsColor]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+95196
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiSaberColorShaders
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1508
;1508:}
LABELV $966
endproc UI_DrawEffects 4 20
proc UI_DrawMapPreview 20 20
line 1510
;1509:
;1510:static void UI_DrawMapPreview(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1511
;1511:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $972
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $973
JUMPV
LABELV $972
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $973
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1512
;1512:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $977
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LEI4 $974
LABELV $977
line 1513
;1513:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $978
line 1514
;1514:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1515
;1515:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $981
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1516
;1516:		} else {
ADDRGP4 $979
JUMPV
LABELV $978
line 1517
;1517:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1518
;1518:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $983
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1519
;1519:		}
LABELV $979
line 1520
;1520:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1521
;1521:	}
LABELV $974
line 1523
;1522:
;1523:	if (uiInfo.mapList[map].levelShot == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $984
line 1524
;1524:		uiInfo.mapList[map].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[map].imageName);
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1525
;1525:	}
LABELV $984
line 1527
;1526:
;1527:	if (uiInfo.mapList[map].levelShot > 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
CNSTI4 0
LEI4 $992
line 1528
;1528:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.mapList[map].levelShot);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1529
;1529:	} else {
ADDRGP4 $993
JUMPV
LABELV $992
line 1530
;1530:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $998
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1531
;1531:	}
LABELV $993
line 1532
;1532:}						 
LABELV $968
endproc UI_DrawMapPreview 20 20
proc UI_DrawMapTimeToBeat 20 36
line 1535
;1533:
;1534:
;1535:static void UI_DrawMapTimeToBeat(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1537
;1536:	int minutes, seconds, time;
;1537:	if (ui_currentMap.integer < 0 || ui_currentMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentMap+12
INDIRI4
CNSTI4 0
LTI4 $1005
ADDRGP4 ui_currentMap+12
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LEI4 $1000
LABELV $1005
line 1538
;1538:		ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1539
;1539:		trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $983
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1540
;1540:	}
LABELV $1000
line 1542
;1541:
;1542:	time = uiInfo.mapList[ui_currentMap.integer].timeToBeat[uiInfo.gameTypes[ui_gameType.integer].gtEnum];
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+28
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1544
;1543:
;1544:	minutes = time / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1545
;1545:	seconds = time % 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
MODI4
ASGNI4
line 1547
;1546:
;1547:  Text_Paint(rect->x, rect->y, scale, color, va("%02i:%02i", minutes, seconds), 0, 0, textStyle, iMenuFont);
ADDRGP4 $1013
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1548
;1548:}
LABELV $999
endproc UI_DrawMapTimeToBeat 20 36
proc UI_DrawMapCinematic 28 24
line 1552
;1549:
;1550:
;1551:
;1552:static void UI_DrawMapCinematic(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1554
;1553:
;1554:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer; 
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1018
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1019
JUMPV
LABELV $1018
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1019
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1555
;1555:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1023
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LEI4 $1020
LABELV $1023
line 1556
;1556:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1024
line 1557
;1557:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1558
;1558:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $981
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1559
;1559:		} else {
ADDRGP4 $1025
JUMPV
LABELV $1024
line 1560
;1560:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1561
;1561:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $983
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1562
;1562:		}
LABELV $1025
line 1563
;1563:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1564
;1564:	}
LABELV $1020
line 1566
;1565:
;1566:	if (uiInfo.mapList[map].cinematic >= -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 -1
LTI4 $1028
line 1567
;1567:		if (uiInfo.mapList[map].cinematic == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1032
line 1568
;1568:			uiInfo.mapList[map].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[map].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 24
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+24
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1569
;1569:		}
LABELV $1032
line 1570
;1570:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1040
line 1571
;1571:		  trap_CIN_RunCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1572
;1572:		  trap_CIN_SetExtents(uiInfo.mapList[map].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1573
;1573: 			trap_CIN_DrawCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1574
;1574:		} else {
ADDRGP4 $1029
JUMPV
LABELV $1040
line 1575
;1575:			uiInfo.mapList[map].cinematic = -2;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
CNSTI4 -2
ASGNI4
line 1576
;1576:		}
line 1577
;1577:	} else {
ADDRGP4 $1029
JUMPV
LABELV $1028
line 1578
;1578:		UI_DrawMapPreview(rect, scale, color, net);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 1579
;1579:	}
LABELV $1029
line 1580
;1580:}
LABELV $1014
endproc UI_DrawMapCinematic 28 24
proc UI_SetForceDisabled 8 0
line 1583
;1581:
;1582:static void UI_SetForceDisabled(int force)
;1583:{
line 1584
;1584:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1586
;1585:
;1586:	if (force)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1053
line 1587
;1587:	{
ADDRGP4 $1056
JUMPV
LABELV $1055
line 1589
;1588:		while (i < NUM_FORCE_POWERS)
;1589:		{
line 1590
;1590:			if (force & (1 << i))
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1058
line 1591
;1591:			{
line 1592
;1592:				uiForcePowersDisabled[i] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersDisabled
ADDP4
CNSTI4 1
ASGNI4
line 1594
;1593:
;1594:				if (i != FP_LEVITATION && i != FP_SABERATTACK && i != FP_SABERDEFEND)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1060
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $1060
ADDRLP4 0
INDIRI4
CNSTI4 16
EQI4 $1060
line 1595
;1595:				{
line 1596
;1596:					uiForcePowersRank[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 0
ASGNI4
line 1597
;1597:				}
ADDRGP4 $1059
JUMPV
LABELV $1060
line 1599
;1598:				else
;1599:				{
line 1600
;1600:					if (i == FP_LEVITATION)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1062
line 1601
;1601:					{
line 1602
;1602:						uiForcePowersRank[i] = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 1
ASGNI4
line 1603
;1603:					}
ADDRGP4 $1059
JUMPV
LABELV $1062
line 1605
;1604:					else
;1605:					{
line 1606
;1606:						uiForcePowersRank[i] = 3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 3
ASGNI4
line 1607
;1607:					}
line 1608
;1608:				}
line 1609
;1609:			}
ADDRGP4 $1059
JUMPV
LABELV $1058
line 1611
;1610:			else
;1611:			{
line 1612
;1612:				uiForcePowersDisabled[i] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersDisabled
ADDP4
CNSTI4 0
ASGNI4
line 1613
;1613:			}
LABELV $1059
line 1614
;1614:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1615
;1615:		}
LABELV $1056
line 1588
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1055
line 1616
;1616:	}
ADDRGP4 $1054
JUMPV
LABELV $1053
line 1618
;1617:	else
;1618:	{
line 1619
;1619:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1065
JUMPV
LABELV $1064
line 1622
;1620:
;1621:		while (i < NUM_FORCE_POWERS)
;1622:		{
line 1623
;1623:			uiForcePowersDisabled[i] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersDisabled
ADDP4
CNSTI4 0
ASGNI4
line 1624
;1624:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1625
;1625:		}
LABELV $1065
line 1621
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1064
line 1626
;1626:	}
LABELV $1054
line 1627
;1627:}
LABELV $1052
endproc UI_SetForceDisabled 8 0
export UpdateForceStatus
proc UpdateForceStatus 1084 12
line 1630
;1628:
;1629:void UpdateForceStatus()
;1630:{
line 1647
;1631:	menuDef_t *menu;
;1632:
;1633:	// Currently we don't make a distinction between those that wish to play Jedi of lower than maximum skill.
;1634:/*	if (ui_forcePowerDisable.integer)
;1635:	{
;1636:		uiForceRank = 0;
;1637:		uiForceAvailable = 0;
;1638:		uiForceUsed = 0;
;1639:	}
;1640:	else
;1641:	{
;1642:		uiForceRank = uiMaxRank;
;1643:		uiForceUsed = 0;
;1644:		uiForceAvailable = forceMasteryPoints[uiForceRank];
;1645:	}
;1646:*/
;1647:	menu = Menus_FindByName("ingame_player");
ADDRGP4 $1068
ARGP4
ADDRLP4 4
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1648
;1648:	if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1069
line 1649
;1649:	{
line 1651
;1650:		char	info[MAX_INFO_STRING];
;1651:		int		disabledForce = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1652
;1652:		qboolean trueJedi = qfalse, allForceDisabled = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1654
;1653:
;1654:		trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1659
;1655:
;1656:		//already have serverinfo at this point for stuff below. Don't bother trying to use ui_forcePowerDisable.
;1657:		//if (ui_forcePowerDisable.integer)
;1658:		//if (atoi(Info_ValueForKey(info, "g_forcePowerDisable")))
;1659:		disabledForce = atoi(Info_ValueForKey(info, "g_forcePowerDisable"));
ADDRLP4 20
ARGP4
ADDRGP4 $905
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1048
INDIRI4
ASGNI4
line 1660
;1660:		allForceDisabled = UI_AllForceDisabled(disabledForce);
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 1052
INDIRI4
ASGNI4
line 1661
;1661:		trueJedi = UI_TrueJediEnabled();
ADDRLP4 1056
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1056
INDIRI4
ASGNI4
line 1663
;1662:
;1663:		if ( !trueJedi || allForceDisabled )
ADDRLP4 1060
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 1060
INDIRI4
EQI4 $1073
ADDRLP4 12
INDIRI4
ADDRLP4 1060
INDIRI4
EQI4 $1071
LABELV $1073
line 1664
;1664:		{
line 1665
;1665:			Menu_ShowItemByName(menu, "jedinonjedi", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1074
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1666
;1666:		}
ADDRGP4 $1072
JUMPV
LABELV $1071
line 1668
;1667:		else
;1668:		{
line 1669
;1669:			Menu_ShowItemByName(menu, "jedinonjedi", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1074
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1670
;1670:		}
LABELV $1072
line 1671
;1671:		if ( allForceDisabled == qtrue || (trueJedi && uiJediNonJedi == FORCE_NONJEDI) )
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $1077
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 1064
INDIRI4
EQI4 $1075
ADDRGP4 uiJediNonJedi
INDIRI4
ADDRLP4 1064
INDIRI4
NEI4 $1075
LABELV $1077
line 1672
;1672:		{	// No force stuff
line 1673
;1673:			Menu_ShowItemByName(menu, "noforce", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1078
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1674
;1674:			Menu_ShowItemByName(menu, "yesforce", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1079
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1676
;1675:			// We don't want the saber explanation to say "configure saber attack 1" since we can't.
;1676:			Menu_ShowItemByName(menu, "sabernoneconfigme", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1080
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1677
;1677:		}
ADDRGP4 $1076
JUMPV
LABELV $1075
line 1679
;1678:		else
;1679:		{
line 1680
;1680:			UI_SetForceDisabled(disabledForce);
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 UI_SetForceDisabled
CALLV
pop
line 1681
;1681:			Menu_ShowItemByName(menu, "noforce", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1078
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1682
;1682:			Menu_ShowItemByName(menu, "yesforce", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1079
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1683
;1683:		}
LABELV $1076
line 1686
;1684:
;1685:		//Moved this to happen after it's done with force power disabling stuff
;1686:		if (uiForcePowersRank[FP_SABERATTACK] > 0 || ui_freeSaber.integer)
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRGP4 uiForcePowersRank+60
INDIRI4
ADDRLP4 1068
INDIRI4
GTI4 $1085
ADDRGP4 ui_freeSaber+12
INDIRI4
ADDRLP4 1068
INDIRI4
EQI4 $1081
LABELV $1085
line 1687
;1687:		{	// Show lightsaber stuff.
line 1688
;1688:			Menu_ShowItemByName(menu, "nosaber", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1086
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1689
;1689:			Menu_ShowItemByName(menu, "yessaber", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1087
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1690
;1690:		}
ADDRGP4 $1082
JUMPV
LABELV $1081
line 1692
;1691:		else
;1692:		{
line 1693
;1693:			Menu_ShowItemByName(menu, "nosaber", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1086
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1694
;1694:			Menu_ShowItemByName(menu, "yessaber", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1087
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1695
;1695:		}
LABELV $1082
line 1698
;1696:
;1697:		// The leftmost button should be "apply" unless you are in spectator, where you can join any team.
;1698:		if ((int)(trap_Cvar_VariableValue("ui_myteam")) != TEAM_SPECTATOR)
ADDRGP4 $860
ARGP4
ADDRLP4 1072
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1072
INDIRF4
CVFI4 4
CNSTI4 3
EQI4 $1088
line 1699
;1699:		{
line 1700
;1700:			Menu_ShowItemByName(menu, "playerapply", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1090
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1701
;1701:			Menu_ShowItemByName(menu, "playerforcejoin", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1091
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1702
;1702:			Menu_ShowItemByName(menu, "playerforcered", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1703
;1703:			Menu_ShowItemByName(menu, "playerforceblue", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1704
;1704:			Menu_ShowItemByName(menu, "playerforcespectate", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1094
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1705
;1705:		}
ADDRGP4 $1089
JUMPV
LABELV $1088
line 1707
;1706:		else
;1707:		{
line 1709
;1708:			// Set or reset buttons based on choices
;1709:			if (atoi(Info_ValueForKey(info, "g_gametype")) >= GT_TEAM)
ADDRLP4 20
ARGP4
ADDRGP4 $883
ARGP4
ADDRLP4 1076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 5
LTI4 $1095
line 1710
;1710:			{	// This is a team-based game.
line 1711
;1711:				Menu_ShowItemByName(menu, "playerforcespectate", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1094
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1714
;1712:				
;1713:				// This is disabled, always show both sides from spectator.
;1714:				if ( 0 && atoi(Info_ValueForKey(info, "g_forceBasedTeams")))
ADDRGP4 $1097
JUMPV
line 1715
;1715:				{	// Show red or blue based on what side is chosen.
line 1716
;1716:					if (uiForceSide==FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $1099
line 1717
;1717:					{
line 1718
;1718:						Menu_ShowItemByName(menu, "playerforcered", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1719
;1719:						Menu_ShowItemByName(menu, "playerforceblue", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1720
;1720:					}
ADDRGP4 $1096
JUMPV
LABELV $1099
line 1721
;1721:					else if (uiForceSide==FORCE_DARKSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 2
NEI4 $1101
line 1722
;1722:					{
line 1723
;1723:						Menu_ShowItemByName(menu, "playerforcered", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1724
;1724:						Menu_ShowItemByName(menu, "playerforceblue", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1725
;1725:					}
ADDRGP4 $1096
JUMPV
LABELV $1101
line 1727
;1726:					else
;1727:					{
line 1728
;1728:						Menu_ShowItemByName(menu, "playerforcered", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1729
;1729:						Menu_ShowItemByName(menu, "playerforceblue", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1730
;1730:					}
line 1731
;1731:				}
ADDRGP4 $1096
JUMPV
LABELV $1097
line 1733
;1732:				else
;1733:				{
line 1734
;1734:					Menu_ShowItemByName(menu, "playerforcered", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1735
;1735:					Menu_ShowItemByName(menu, "playerforceblue", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1736
;1736:				}
line 1737
;1737:			}
ADDRGP4 $1096
JUMPV
LABELV $1095
line 1739
;1738:			else
;1739:			{
line 1740
;1740:				Menu_ShowItemByName(menu, "playerforcered", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1741
;1741:				Menu_ShowItemByName(menu, "playerforceblue", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1742
;1742:			}
LABELV $1096
line 1744
;1743:
;1744:			Menu_ShowItemByName(menu, "playerapply", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1090
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1745
;1745:			Menu_ShowItemByName(menu, "playerforcejoin", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1091
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1746
;1746:			Menu_ShowItemByName(menu, "playerforcespectate", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1094
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1747
;1747:		}
LABELV $1089
line 1748
;1748:	}
LABELV $1069
line 1751
;1749:
;1750:
;1751:	if ( !UI_TrueJediEnabled() )
ADDRLP4 8
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1103
line 1752
;1752:	{// Take the current team and force a skin color based on it.
line 1753
;1753:		switch((int)(trap_Cvar_VariableValue("ui_myteam")))
ADDRGP4 $860
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $1108
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $1110
ADDRGP4 $1105
JUMPV
line 1754
;1754:		{
LABELV $1108
line 1756
;1755:		case TEAM_RED:
;1756:			uiSkinColor = TEAM_RED;
ADDRGP4 uiSkinColor
CNSTI4 1
ASGNI4
line 1757
;1757:			uiInfo.effectsColor = SABER_RED;
ADDRGP4 uiInfo+95196
CNSTI4 0
ASGNI4
line 1758
;1758:			break;
ADDRGP4 $1106
JUMPV
LABELV $1110
line 1760
;1759:		case TEAM_BLUE:
;1760:			uiSkinColor = TEAM_BLUE;
ADDRGP4 uiSkinColor
CNSTI4 2
ASGNI4
line 1761
;1761:			uiInfo.effectsColor = SABER_BLUE;
ADDRGP4 uiInfo+95196
CNSTI4 4
ASGNI4
line 1762
;1762:			break;
ADDRGP4 $1106
JUMPV
LABELV $1105
line 1764
;1763:		default:
;1764:			uiSkinColor = TEAM_FREE;
ADDRGP4 uiSkinColor
CNSTI4 0
ASGNI4
line 1765
;1765:			break;
LABELV $1106
line 1767
;1766:		}
;1767:	}
LABELV $1103
line 1768
;1768:}
LABELV $1067
endproc UpdateForceStatus 1084 12
data
align 4
LABELV updateModel
byte 4 1
align 4
LABELV q3Model
byte 4 0
code
proc UI_DrawNetSource 12 36
line 1819
;1769:
;1770:
;1771:
;1772:static qboolean updateModel = qtrue;
;1773:static qboolean q3Model = qfalse;
;1774:/*
;1775:
;1776:static void UI_DrawPlayerModel(rectDef_t *rect) {
;1777:  static playerInfo_t info;
;1778:  char model[MAX_QPATH];
;1779:  char team[256];
;1780:	char head[256];
;1781:	vec3_t	viewangles;
;1782:	vec3_t	moveangles;
;1783:
;1784:	  if (trap_Cvar_VariableValue("ui_Q3Model")) {
;1785:	  strcpy(model, UI_Cvar_VariableString("model"));
;1786:		strcpy(head, UI_Cvar_VariableString("headmodel"));
;1787:		if (!q3Model) {
;1788:			q3Model = qtrue;
;1789:			updateModel = qtrue;
;1790:		}
;1791:		team[0] = '\0';
;1792:	} else {
;1793:
;1794:		strcpy(team, UI_Cvar_VariableString("ui_teamName"));
;1795:		strcpy(model, UI_Cvar_VariableString("team_model"));
;1796:		strcpy(head, UI_Cvar_VariableString("team_headmodel"));
;1797:		if (q3Model) {
;1798:			q3Model = qfalse;
;1799:			updateModel = qtrue;
;1800:		}
;1801:	}
;1802:  if (updateModel) {
;1803:  	memset( &info, 0, sizeof(playerInfo_t) );
;1804:  	viewangles[YAW]   = 180 - 10;
;1805:  	viewangles[PITCH] = 0;
;1806:  	viewangles[ROLL]  = 0;
;1807:  	VectorClear( moveangles );
;1808:    UI_PlayerInfo_SetModel( &info, model, head, team);
;1809:    UI_PlayerInfo_SetInfo( &info, TORSO_WEAPONREADY3, TORSO_WEAPONREADY3, viewangles, vec3_origin, WP_BRYAR_PISTOL, qfalse );
;1810://		UI_RegisterClientModelname( &info, model, head, team);
;1811:    updateModel = qfalse;
;1812:  }
;1813:
;1814:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info, uiInfo.uiDC.realTime / 2);
;1815:
;1816:}
;1817:*/
;1818:static void UI_DrawNetSource(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) 
;1819:{
line 1820
;1820:	if (ui_netSource.integer < 0 || ui_netSource.integer > uiInfo.numGameTypes) 
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1118
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
LEI4 $1113
LABELV $1118
line 1821
;1821:	{
line 1822
;1822:		ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 1823
;1823:	}
LABELV $1113
line 1825
;1824:
;1825:	trap_SP_GetStringTextString("MENUS3_SOURCE", holdSPString, sizeof(holdSPString) );
ADDRGP4 $1120
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1826
;1826:	Text_Paint(rect->x, rect->y, scale, color, va("%s %s",holdSPString,
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 GetNetSourceString
CALLP4
ASGNP4
ADDRGP4 $1121
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1828
;1827:		 GetNetSourceString(ui_netSource.integer)), 0, 0, textStyle, iMenuFont);
;1828:}
LABELV $1112
endproc UI_DrawNetSource 12 36
proc UI_DrawNetMapPreview 8 20
line 1830
;1829:
;1830:static void UI_DrawNetMapPreview(rectDef_t *rect, float scale, vec4_t color) {
line 1832
;1831:
;1832:	if (uiInfo.serverStatus.currentServerPreview > 0) {
ADDRGP4 uiInfo+40740+10428
INDIRI4
CNSTI4 0
LEI4 $1124
line 1833
;1833:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.serverStatus.currentServerPreview);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+40740+10428
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1834
;1834:	} else {
ADDRGP4 $1125
JUMPV
LABELV $1124
line 1835
;1835:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $998
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1836
;1836:	}
LABELV $1125
line 1837
;1837:}
LABELV $1123
endproc UI_DrawNetMapPreview 8 20
proc UI_DrawNetMapCinematic 4 20
line 1839
;1838:
;1839:static void UI_DrawNetMapCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1840
;1840:	if (ui_currentNetMap.integer < 0 || ui_currentNetMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $1136
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LEI4 $1131
LABELV $1136
line 1841
;1841:		ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1842
;1842:		trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $981
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1843
;1843:	}
LABELV $1131
line 1845
;1844:
;1845:	if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+40740+10432
INDIRI4
CNSTI4 0
LTI4 $1138
line 1846
;1846:	  trap_CIN_RunCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1847
;1847:	  trap_CIN_SetExtents(uiInfo.serverStatus.currentServerCinematic, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1848
;1848: 	  trap_CIN_DrawCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1849
;1849:	} else {
ADDRGP4 $1139
JUMPV
LABELV $1138
line 1850
;1850:		UI_DrawNetMapPreview(rect, scale, color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 1851
;1851:	}
LABELV $1139
line 1852
;1852:}
LABELV $1130
endproc UI_DrawNetMapCinematic 4 20
proc UI_DrawNetFilter 8 36
line 1857
;1853:
;1854:
;1855:
;1856:static void UI_DrawNetFilter(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) 
;1857:{
line 1858
;1858:	if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) 
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1153
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1149
LABELV $1153
line 1859
;1859:	{
line 1860
;1860:		ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 1861
;1861:	}
LABELV $1149
line 1863
;1862:
;1863:	trap_SP_GetStringTextString("MENUS3_GAME", holdSPString, sizeof(holdSPString));
ADDRGP4 $1155
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1864
;1864:	Text_Paint(rect->x, rect->y, scale, color, va("%s %s",holdSPString,
ADDRGP4 $1121
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1866
;1865:		 serverFilters[ui_serverFilterType.integer].description), 0, 0, textStyle, iMenuFont);
;1866:}
LABELV $1148
endproc UI_DrawNetFilter 8 36
proc UI_DrawTier 20 36
line 1869
;1867:
;1868:
;1869:static void UI_DrawTier(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1871
;1870:  int i;
;1871:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1158
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1872
;1872:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1162
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+33148
INDIRI4
LTI4 $1159
LABELV $1162
line 1873
;1873:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1874
;1874:  }
LABELV $1159
line 1875
;1875:  Text_Paint(rect->x, rect->y, scale, color, va("Tier: %s", uiInfo.tierList[i].tierName),0, 0, textStyle, iMenuFont);
ADDRGP4 $1163
ARGP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1876
;1876:}
LABELV $1157
endproc UI_DrawTier 20 36
proc UI_DrawTierMap 28 20
line 1878
;1877:
;1878:static void UI_DrawTierMap(rectDef_t *rect, int index) {
line 1880
;1879:  int i;
;1880:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1158
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1881
;1881:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1169
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+33148
INDIRI4
LTI4 $1166
LABELV $1169
line 1882
;1882:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1883
;1883:  }
LABELV $1166
line 1885
;1884:
;1885:	if (uiInfo.tierList[i].mapHandles[index] == -1) {
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152+28
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1170
line 1886
;1886:		uiInfo.tierList[i].mapHandles[index] = trap_R_RegisterShaderNoMip(va("levelshots/%s", uiInfo.tierList[i].maps[index]));
ADDRGP4 $1176
ARGP4
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+33152+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+33152+28
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1887
;1887:	}
LABELV $1170
line 1889
;1888:												 
;1889:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.tierList[i].mapHandles[index]);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152+28
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1890
;1890:}
LABELV $1165
endproc UI_DrawTierMap 28 20
proc UI_EnglishMapName 8 8
line 1892
;1891:
;1892:static const char *UI_EnglishMapName(const char *map) {
line 1894
;1893:	int i;
;1894:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1185
JUMPV
LABELV $1182
line 1895
;1895:		if (Q_stricmp(map, uiInfo.mapList[i].mapLoadName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1187
line 1896
;1896:			return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
INDIRP4
RETP4
ADDRGP4 $1181
JUMPV
LABELV $1187
line 1898
;1897:		}
;1898:	}
LABELV $1183
line 1894
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1185
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $1182
line 1899
;1899:	return "";
ADDRGP4 $165
RETP4
LABELV $1181
endproc UI_EnglishMapName 8 8
proc UI_DrawTierMapName 32 36
line 1902
;1900:}
;1901:
;1902:static void UI_DrawTierMapName(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1904
;1903:  int i, j;
;1904:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1158
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1905
;1905:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1196
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+33148
INDIRI4
LTI4 $1193
LABELV $1196
line 1906
;1906:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1907
;1907:  }
LABELV $1193
line 1908
;1908:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $983
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1909
;1909:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1199
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1197
LABELV $1199
line 1910
;1910:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1911
;1911:	}
LABELV $1197
line 1913
;1912:
;1913:  Text_Paint(rect->x, rect->y, scale, color, UI_EnglishMapName(uiInfo.tierList[i].maps[j]), 0, 0, textStyle, iMenuFont);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_EnglishMapName
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1914
;1914:}
LABELV $1192
endproc UI_DrawTierMapName 32 36
proc UI_DrawTierGameType 28 36
line 1916
;1915:
;1916:static void UI_DrawTierGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1918
;1917:  int i, j;
;1918:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1158
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1919
;1919:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1206
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+33148
INDIRI4
LTI4 $1203
LABELV $1206
line 1920
;1920:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1921
;1921:  }
LABELV $1203
line 1922
;1922:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $983
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1923
;1923:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1209
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1207
LABELV $1209
line 1924
;1924:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1925
;1925:	}
LABELV $1207
line 1927
;1926:
;1927:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[uiInfo.tierList[i].gameTypes[j]].gameType , 0, 0, textStyle,iMenuFont);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152+16
ADDP4
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1928
;1928:}
LABELV $1202
endproc UI_DrawTierGameType 28 36
proc UI_AIFromName 8 8
line 1931
;1929:
;1930:
;1931:static const char *UI_AIFromName(const char *name) {
line 1933
;1932:	int j;
;1933:	for (j = 0; j < uiInfo.aliasCount; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1217
JUMPV
LABELV $1214
line 1934
;1934:		if (Q_stricmp(uiInfo.aliasList[j].name, name) == 0) {
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1219
line 1935
;1935:			return uiInfo.aliasList[j].ai;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+13388+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1213
JUMPV
LABELV $1219
line 1937
;1936:		}
;1937:	}
LABELV $1215
line 1933
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1217
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+13384
INDIRI4
LTI4 $1214
line 1938
;1938:	return "Kyle";
ADDRGP4 $1224
RETP4
LABELV $1213
endproc UI_AIFromName 8 8
proc UI_NextOpponent 24 8
line 1973
;1939:}
;1940:
;1941:
;1942:/*
;1943:static qboolean updateOpponentModel = qtrue;
;1944:static void UI_DrawOpponent(rectDef_t *rect) {
;1945:  static playerInfo_t info2;
;1946:  char model[MAX_QPATH];
;1947:  char headmodel[MAX_QPATH];
;1948:  char team[256];
;1949:	vec3_t	viewangles;
;1950:	vec3_t	moveangles;
;1951:  
;1952:	if (updateOpponentModel) {
;1953:		
;1954:		strcpy(model, UI_Cvar_VariableString("ui_opponentModel"));
;1955:	  strcpy(headmodel, UI_Cvar_VariableString("ui_opponentModel"));
;1956:		team[0] = '\0';
;1957:
;1958:  	memset( &info2, 0, sizeof(playerInfo_t) );
;1959:  	viewangles[YAW]   = 180 - 10;
;1960:  	viewangles[PITCH] = 0;
;1961:  	viewangles[ROLL]  = 0;
;1962:  	VectorClear( moveangles );
;1963:    UI_PlayerInfo_SetModel( &info2, model, headmodel, "");
;1964:    UI_PlayerInfo_SetInfo( &info2, TORSO_WEAPONREADY3, TORSO_WEAPONREADY3, viewangles, vec3_origin, WP_BRYAR_PISTOL, qfalse );
;1965:		UI_RegisterClientModelname( &info2, model, headmodel, team);
;1966:    updateOpponentModel = qfalse;
;1967:  }
;1968:
;1969:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info2, uiInfo.uiDC.realTime / 2);
;1970:
;1971:}
;1972:*/
;1973:static void UI_NextOpponent() {
line 1974
;1974:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1975
;1975:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 1976
;1976:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1977
;1977:	if (i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $1227
line 1978
;1978:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1979
;1979:	}
LABELV $1227
line 1980
;1980:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1230
line 1981
;1981:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1982
;1982:		if ( i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $1232
line 1983
;1983:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1984
;1984:		}
LABELV $1232
line 1985
;1985:	}
LABELV $1230
line 1986
;1986: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $1226
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1987
;1987:}
LABELV $1225
endproc UI_NextOpponent 24 8
proc UI_PriorOpponent 24 8
line 1989
;1988:
;1989:static void UI_PriorOpponent() {
line 1990
;1990:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1991
;1991:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 1992
;1992:	i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1993
;1993:	if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1237
line 1994
;1994:		i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+14156
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1995
;1995:	}
LABELV $1237
line 1996
;1996:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1240
line 1997
;1997:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1998
;1998:		if ( i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1242
line 1999
;1999:			i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+14156
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2000
;2000:		}
LABELV $1242
line 2001
;2001:	}
LABELV $1240
line 2002
;2002: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $1226
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2003
;2003:}
LABELV $1236
endproc UI_PriorOpponent 24 8
proc UI_DrawPlayerLogo 44 20
line 2005
;2004:
;2005:static void	UI_DrawPlayerLogo(rectDef_t *rect, vec3_t color) {
line 2006
;2006:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2008
;2007:
;2008:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1247
line 2009
;2009:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2010
;2010:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2011
;2011:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2012
;2012:	}
LABELV $1247
line 2014
;2013:
;2014: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2015
;2015:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2016
;2016: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2017
;2017:}
LABELV $1246
endproc UI_DrawPlayerLogo 44 20
proc UI_DrawPlayerLogoMetal 44 20
line 2019
;2018:
;2019:static void	UI_DrawPlayerLogoMetal(rectDef_t *rect, vec3_t color) {
line 2020
;2020:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2021
;2021:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1266
line 2022
;2022:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2023
;2023:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2024
;2024:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2025
;2025:	}
LABELV $1266
line 2027
;2026:
;2027: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2028
;2028:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2029
;2029: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2030
;2030:}
LABELV $1265
endproc UI_DrawPlayerLogoMetal 44 20
proc UI_DrawPlayerLogoName 44 20
line 2032
;2031:
;2032:static void	UI_DrawPlayerLogoName(rectDef_t *rect, vec3_t color) {
line 2033
;2033:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2034
;2034:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1285
line 2035
;2035:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2036
;2036:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2037
;2037:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2038
;2038:	}
LABELV $1285
line 2040
;2039:
;2040: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2041
;2041:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2042
;2042: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2043
;2043:}
LABELV $1284
endproc UI_DrawPlayerLogoName 44 20
proc UI_DrawOpponentLogo 44 20
line 2045
;2044:
;2045:static void	UI_DrawOpponentLogo(rectDef_t *rect, vec3_t color) {
line 2046
;2046:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2047
;2047:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1304
line 2048
;2048:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2049
;2049:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2050
;2050:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2051
;2051:	}
LABELV $1304
line 2053
;2052:
;2053: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2054
;2054:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2055
;2055: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2056
;2056:}
LABELV $1303
endproc UI_DrawOpponentLogo 44 20
proc UI_DrawOpponentLogoMetal 44 20
line 2058
;2057:
;2058:static void	UI_DrawOpponentLogoMetal(rectDef_t *rect, vec3_t color) {
line 2059
;2059:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2060
;2060:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1323
line 2061
;2061:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2062
;2062:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2063
;2063:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2064
;2064:	}
LABELV $1323
line 2066
;2065:
;2066: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2067
;2067:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2068
;2068: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2069
;2069:}
LABELV $1322
endproc UI_DrawOpponentLogoMetal 44 20
proc UI_DrawOpponentLogoName 44 20
line 2071
;2070:
;2071:static void	UI_DrawOpponentLogoName(rectDef_t *rect, vec3_t color) {
line 2072
;2072:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2073
;2073:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1342
line 2074
;2074:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2075
;2075:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2076
;2076:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2077
;2077:	}
LABELV $1342
line 2079
;2078:
;2079: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2080
;2080:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2081
;2081: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2082
;2082:}
LABELV $1341
endproc UI_DrawOpponentLogoName 44 20
proc UI_DrawAllMapsSelection 16 36
line 2084
;2083:
;2084:static void UI_DrawAllMapsSelection(rectDef_t *rect, float scale, vec4_t color, int textStyle, qboolean net, int iMenuFont) {
line 2085
;2085:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1364
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1365
JUMPV
LABELV $1364
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1365
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2086
;2086:	if (map >= 0 && map < uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1366
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
GEI4 $1366
line 2087
;2087:	  Text_Paint(rect->x, rect->y, scale, color, uiInfo.mapList[map].mapName, 0, 0, textStyle, iMenuFont);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2088
;2088:	}
LABELV $1366
line 2089
;2089:}
LABELV $1360
endproc UI_DrawAllMapsSelection 16 36
proc UI_DrawOpponentName 8 36
line 2091
;2090:
;2091:static void UI_DrawOpponentName(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 2092
;2092:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_opponentName"), 0, 0, textStyle, iMenuFont);
ADDRGP4 $1226
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2093
;2093:}
LABELV $1370
endproc UI_DrawOpponentName 8 36
proc UI_OwnerDrawWidth 156 12
line 2095
;2094:
;2095:static int UI_OwnerDrawWidth(int ownerDraw, float scale) {
line 2096
;2096:	int i, h, value, findex, iUse = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2098
;2097:	const char *text;
;2098:	const char *s = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2101
;2099:
;2100:
;2101:  switch (ownerDraw) {
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 200
LTI4 $1373
ADDRLP4 28
INDIRI4
CNSTI4 289
GTI4 $1373
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1475-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1475
address $1374
address $1373
address $1373
address $1407
address $1373
address $1408
address $1373
address $1411
address $1416
address $1421
address $1426
address $1426
address $1426
address $1426
address $1426
address $1437
address $1437
address $1437
address $1437
address $1437
address $1446
address $1373
address $1455
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1472
address $1373
address $1373
address $1468
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1381
address $1398
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1373
address $1373
address $1373
address $1426
address $1426
address $1426
address $1437
address $1437
address $1437
address $1373
address $1375
address $1373
address $1389
code
LABELV $1374
line 2103
;2102:    case UI_HANDICAP:
;2103:			  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $695
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 2104
;2104:				i = 20 - h / 5;
ADDRLP4 4
CNSTI4 20
ADDRLP4 24
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 2105
;2105:				s = handicapValues[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ASGNP4
line 2106
;2106:      break;
ADDRGP4 $1373
JUMPV
LABELV $1375
line 2108
;2107:    case UI_SKIN_COLOR:
;2108:		switch(uiSkinColor)
ADDRLP4 40
ADDRGP4 uiSkinColor
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
EQI4 $1378
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $1379
ADDRGP4 $1376
JUMPV
line 2109
;2109:		{
LABELV $1378
line 2111
;2110:		case TEAM_RED:
;2111:			s = "Red";
ADDRLP4 0
ADDRGP4 $936
ASGNP4
line 2112
;2112:			break;
ADDRGP4 $1373
JUMPV
LABELV $1379
line 2114
;2113:		case TEAM_BLUE:
;2114:			s = "Blue";
ADDRLP4 0
ADDRGP4 $935
ASGNP4
line 2115
;2115:			break;
ADDRGP4 $1373
JUMPV
LABELV $1376
line 2117
;2116:		default:
;2117:			s = "Default";
ADDRLP4 0
ADDRGP4 $1380
ASGNP4
line 2118
;2118:			break;
line 2120
;2119:		}
;2120:		break;
ADDRGP4 $1373
JUMPV
LABELV $1381
line 2122
;2121:    case UI_FORCE_SIDE:
;2122:		i = uiForceSide;
ADDRLP4 4
ADDRGP4 uiForceSide
INDIRI4
ASGNI4
line 2123
;2123:		if (i < 1 || i > 2) {
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $1384
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $1382
LABELV $1384
line 2124
;2124:			i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2125
;2125:		}
LABELV $1382
line 2127
;2126:
;2127:		if (i == FORCE_LIGHTSIDE)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1385
line 2128
;2128:		{
line 2130
;2129://			s = "Light";
;2130:			s = (char *)UI_GetStripEdString("MENUS3", "FORCEDESC_LIGHT");
ADDRGP4 $961
ARGP4
ADDRGP4 $1387
ARGP4
ADDRLP4 48
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
line 2131
;2131:		}
ADDRGP4 $1373
JUMPV
LABELV $1385
line 2133
;2132:		else
;2133:		{
line 2135
;2134://			s = "Dark";
;2135:			s = (char *)UI_GetStripEdString("MENUS3", "FORCEDESC_DARK");
ADDRGP4 $961
ARGP4
ADDRGP4 $1388
ARGP4
ADDRLP4 48
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
line 2136
;2136:		}
line 2137
;2137:		break;
ADDRGP4 $1373
JUMPV
LABELV $1389
line 2139
;2138:    case UI_JEDI_NONJEDI:
;2139:		i = uiJediNonJedi;
ADDRLP4 4
ADDRGP4 uiJediNonJedi
INDIRI4
ASGNI4
line 2140
;2140:		if (i < 0 || i > 1)
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1392
ADDRLP4 4
INDIRI4
CNSTI4 1
LEI4 $1390
LABELV $1392
line 2141
;2141:		{
line 2142
;2142:			i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2143
;2143:		}
LABELV $1390
line 2145
;2144:
;2145:		if (i == FORCE_NONJEDI)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1393
line 2146
;2146:		{
line 2148
;2147://			s = "Non-Jedi";
;2148:			s = (char *)UI_GetStripEdString("MENUS0", "NO");
ADDRGP4 $1395
ARGP4
ADDRGP4 $1396
ARGP4
ADDRLP4 52
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 2149
;2149:		}
ADDRGP4 $1373
JUMPV
LABELV $1393
line 2151
;2150:		else
;2151:		{
line 2153
;2152://			s = "Jedi";
;2153:			s = (char *)UI_GetStripEdString("MENUS0", "YES");
ADDRGP4 $1395
ARGP4
ADDRGP4 $1397
ARGP4
ADDRLP4 52
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 2154
;2154:		}
line 2155
;2155:		break;
ADDRGP4 $1373
JUMPV
LABELV $1398
line 2157
;2156:    case UI_FORCE_RANK:
;2157:		i = uiForceRank;
ADDRLP4 4
ADDRGP4 uiForceRank
INDIRI4
ASGNI4
line 2158
;2158:		if (i < 1 || i > MAX_FORCE_RANK) {
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $1401
ADDRLP4 4
INDIRI4
CNSTI4 7
LEI4 $1399
LABELV $1401
line 2159
;2159:			i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2160
;2160:		}
LABELV $1399
line 2162
;2161:
;2162:		s = (char *)UI_GetStripEdString("INGAMETEXT", forceMasteryLevels[i]);
ADDRGP4 $206
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryLevels
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 2163
;2163:		break;
ADDRGP4 $1373
JUMPV
LABELV $1402
line 2182
;2164:	case UI_FORCE_RANK_HEAL:
;2165:	case UI_FORCE_RANK_LEVITATION:
;2166:	case UI_FORCE_RANK_SPEED:
;2167:	case UI_FORCE_RANK_PUSH:
;2168:	case UI_FORCE_RANK_PULL:
;2169:	case UI_FORCE_RANK_TELEPATHY:
;2170:	case UI_FORCE_RANK_GRIP:
;2171:	case UI_FORCE_RANK_LIGHTNING:
;2172:	case UI_FORCE_RANK_RAGE:
;2173:	case UI_FORCE_RANK_PROTECT:
;2174:	case UI_FORCE_RANK_ABSORB:
;2175:	case UI_FORCE_RANK_TEAM_HEAL:
;2176:	case UI_FORCE_RANK_TEAM_FORCE:
;2177:	case UI_FORCE_RANK_DRAIN:
;2178:	case UI_FORCE_RANK_SEE:
;2179:	case UI_FORCE_RANK_SABERATTACK:
;2180:	case UI_FORCE_RANK_SABERDEFEND:
;2181:	case UI_FORCE_RANK_SABERTHROW:
;2182:		findex = (ownerDraw - UI_FORCE_RANK)-1;
ADDRLP4 20
ADDRFP4 0
INDIRI4
CNSTI4 258
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 2184
;2183:		//this will give us the index as long as UI_FORCE_RANK is always one below the first force rank index
;2184:		i = uiForcePowersRank[findex];
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ASGNI4
line 2186
;2185:
;2186:		if (i < 0 || i > NUM_FORCE_POWER_LEVELS-1)
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1405
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1403
LABELV $1405
line 2187
;2187:		{
line 2188
;2188:			i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2189
;2189:		}
LABELV $1403
line 2191
;2190:
;2191:		s = va("%i", uiForcePowersRank[findex]);
ADDRGP4 $1406
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 64
INDIRP4
ASGNP4
line 2192
;2192:		break;
ADDRGP4 $1373
JUMPV
LABELV $1407
line 2194
;2193:    case UI_CLANNAME:
;2194:				s = UI_Cvar_VariableString("ui_teamName");
ADDRGP4 $697
ARGP4
ADDRLP4 68
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 2195
;2195:      break;
ADDRGP4 $1373
JUMPV
LABELV $1408
line 2197
;2196:    case UI_GAMETYPE:
;2197:				s = uiInfo.gameTypes[ui_gameType.integer].gameType;
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
INDIRP4
ASGNP4
line 2198
;2198:      break;
ADDRGP4 $1373
JUMPV
LABELV $1411
line 2200
;2199:    case UI_SKILL:
;2200:				i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 72
INDIRF4
CVFI4 4
ASGNI4
line 2201
;2201:				if (i < 1 || i > numSkillLevels) {
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $1414
ADDRLP4 4
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1412
LABELV $1414
line 2202
;2202:					i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2203
;2203:				}
LABELV $1412
line 2204
;2204:			  s = (char *)UI_GetStripEdString("INGAMETEXT", (char *)skillLevels[i-1]);
ADDRGP4 $206
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
ASGNP4
line 2205
;2205:      break;
ADDRGP4 $1373
JUMPV
LABELV $1416
line 2207
;2206:    case UI_BLUETEAMNAME:
;2207:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_blueTeam"));
ADDRGP4 $926
ARGP4
ADDRLP4 84
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 88
INDIRI4
ASGNI4
line 2208
;2208:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1373
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $1373
line 2209
;2209:			    s = va("%s: %s", "Blue", uiInfo.teamList[i].teamName);
ADDRGP4 $934
ARGP4
ADDRGP4 $935
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 96
INDIRP4
ASGNP4
line 2210
;2210:			  }
line 2211
;2211:      break;
ADDRGP4 $1373
JUMPV
LABELV $1421
line 2213
;2212:    case UI_REDTEAMNAME:
;2213:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_redTeam"));
ADDRGP4 $927
ARGP4
ADDRLP4 96
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 100
INDIRI4
ASGNI4
line 2214
;2214:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1373
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $1373
line 2215
;2215:			    s = va("%s: %s", "Red", uiInfo.teamList[i].teamName);
ADDRGP4 $934
ARGP4
ADDRGP4 $936
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 2216
;2216:			  }
line 2217
;2217:      break;
ADDRGP4 $1373
JUMPV
LABELV $1426
line 2226
;2218:    case UI_BLUETEAM1:
;2219:		case UI_BLUETEAM2:
;2220:		case UI_BLUETEAM3:
;2221:		case UI_BLUETEAM4:
;2222:		case UI_BLUETEAM5:
;2223:		case UI_BLUETEAM6:
;2224:		case UI_BLUETEAM7:
;2225:		case UI_BLUETEAM8:
;2226:			if (ownerDraw <= UI_BLUETEAM5)
ADDRFP4 0
INDIRI4
CNSTI4 214
GTI4 $1427
line 2227
;2227:			{
line 2228
;2228:			  iUse = ownerDraw-UI_BLUETEAM1 + 1;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2229
;2229:			}
ADDRGP4 $1428
JUMPV
LABELV $1427
line 2231
;2230:			else
;2231:			{
line 2232
;2232:			  iUse = ownerDraw-274; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 274
SUBI4
ASGNI4
line 2233
;2233:			}
LABELV $1428
line 2235
;2234:
;2235:			value = trap_Cvar_VariableValue(va("ui_blueteam%i", iUse));
ADDRGP4 $942
ARGP4
ADDRLP4 8
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
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 112
INDIRF4
CVFI4 4
ASGNI4
line 2236
;2236:			if (value <= 1) {
ADDRLP4 12
INDIRI4
CNSTI4 1
GTI4 $1429
line 2237
;2237:				text = "Human";
ADDRLP4 16
ADDRGP4 $1431
ASGNP4
line 2238
;2238:			} else {
ADDRGP4 $1430
JUMPV
LABELV $1429
line 2239
;2239:				value -= 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2240
;2240:				if (value >= uiInfo.aliasCount) {
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+13384
INDIRI4
LTI4 $1432
line 2241
;2241:					value = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2242
;2242:				}
LABELV $1432
line 2243
;2243:				text = uiInfo.aliasList[value].name;
ADDRLP4 16
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
INDIRP4
ASGNP4
line 2244
;2244:			}
LABELV $1430
line 2245
;2245:			s = va("%i. %s", iUse, text);
ADDRGP4 $1436
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
line 2246
;2246:      break;
ADDRGP4 $1373
JUMPV
LABELV $1437
line 2255
;2247:    case UI_REDTEAM1:
;2248:		case UI_REDTEAM2:
;2249:		case UI_REDTEAM3:
;2250:		case UI_REDTEAM4:
;2251:		case UI_REDTEAM5:
;2252:		case UI_REDTEAM6:
;2253:		case UI_REDTEAM7:
;2254:		case UI_REDTEAM8:
;2255:			if (ownerDraw <= UI_REDTEAM5)
ADDRFP4 0
INDIRI4
CNSTI4 219
GTI4 $1438
line 2256
;2256:			{
line 2257
;2257:			  iUse = ownerDraw-UI_REDTEAM1 + 1;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2258
;2258:			}
ADDRGP4 $1439
JUMPV
LABELV $1438
line 2260
;2259:			else
;2260:			{
line 2261
;2261:			  iUse = ownerDraw-277; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 277
SUBI4
ASGNI4
line 2262
;2262:			}
LABELV $1439
line 2264
;2263:
;2264:			value = trap_Cvar_VariableValue(va("ui_redteam%i", iUse));
ADDRGP4 $943
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 124
INDIRF4
CVFI4 4
ASGNI4
line 2265
;2265:			if (value <= 1) {
ADDRLP4 12
INDIRI4
CNSTI4 1
GTI4 $1440
line 2266
;2266:				text = "Human";
ADDRLP4 16
ADDRGP4 $1431
ASGNP4
line 2267
;2267:			} else {
ADDRGP4 $1441
JUMPV
LABELV $1440
line 2268
;2268:				value -= 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2269
;2269:				if (value >= uiInfo.aliasCount) {
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+13384
INDIRI4
LTI4 $1442
line 2270
;2270:					value = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2271
;2271:				}
LABELV $1442
line 2272
;2272:				text = uiInfo.aliasList[value].name;
ADDRLP4 16
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
INDIRP4
ASGNP4
line 2273
;2273:			}
LABELV $1441
line 2274
;2274:			s = va("%i. %s", iUse, text);
ADDRGP4 $1436
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 128
INDIRP4
ASGNP4
line 2275
;2275:      break;
ADDRGP4 $1373
JUMPV
LABELV $1446
line 2277
;2276:		case UI_NETSOURCE:
;2277:			if (ui_netSource.integer < 0 || ui_netSource.integer > uiInfo.numJoinGameTypes) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1452
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 uiInfo+17876
INDIRI4
LEI4 $1447
LABELV $1452
line 2278
;2278:				ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 2279
;2279:			}
LABELV $1447
line 2280
;2280:			trap_SP_GetStringTextString("MENUS3_SOURCE", holdSPString, sizeof(holdSPString));
ADDRGP4 $1120
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 2281
;2281:			s = va("%s %s", holdSPString, GetNetSourceString(ui_netSource.integer));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 GetNetSourceString
CALLP4
ASGNP4
ADDRGP4 $1121
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 136
INDIRP4
ASGNP4
line 2282
;2282:			break;
ADDRGP4 $1373
JUMPV
LABELV $1455
line 2284
;2283:		case UI_NETFILTER:
;2284:			if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1460
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1456
LABELV $1460
line 2285
;2285:				ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 2286
;2286:			}
LABELV $1456
line 2287
;2287:			trap_SP_GetStringTextString("MENUS3_GAME", holdSPString, sizeof(holdSPString));
ADDRGP4 $1155
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 2288
;2288:			s = va("%s %s", holdSPString, serverFilters[ui_serverFilterType.integer].description );
ADDRGP4 $1121
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 140
INDIRP4
ASGNP4
line 2289
;2289:			break;
ADDRGP4 $1373
JUMPV
line 2291
;2290:		case UI_TIER:
;2291:			break;
line 2293
;2292:		case UI_TIER_MAPNAME:
;2293:			break;
line 2295
;2294:		case UI_TIER_GAMETYPE:
;2295:			break;
line 2297
;2296:		case UI_ALLMAPS_SELECTION:
;2297:			break;
line 2299
;2298:		case UI_OPPONENT_NAME:
;2299:			break;
LABELV $1468
line 2301
;2300:		case UI_KEYBINDSTATUS:
;2301:			if (Display_KeyBindPending()) {
ADDRLP4 144
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1373
line 2302
;2302:				s = UI_GetStripEdString("INGAMETEXT", "WAITING_FOR_NEW_KEY");
ADDRGP4 $206
ARGP4
ADDRGP4 $1471
ARGP4
ADDRLP4 148
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 148
INDIRP4
ASGNP4
line 2303
;2303:			} else {
line 2305
;2304:			//	s = "Press ENTER or CLICK to change, Press BACKSPACE to clear";
;2305:			}
line 2306
;2306:			break;
ADDRGP4 $1373
JUMPV
LABELV $1472
line 2308
;2307:		case UI_SERVERREFRESHDATE:
;2308:			s = UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer));
ADDRGP4 $1473
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 152
INDIRP4
ASGNP4
line 2309
;2309:			break;
line 2311
;2310:    default:
;2311:      break;
LABELV $1373
line 2314
;2312:  }
;2313:
;2314:	if (s) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1477
line 2315
;2315:		return Text_Width(s, scale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $1371
JUMPV
LABELV $1477
line 2317
;2316:	}
;2317:	return 0;
CNSTI4 0
RETI4
LABELV $1371
endproc UI_OwnerDrawWidth 156 12
proc UI_DrawBotName 20 36
line 2321
;2318:}
;2319:
;2320:static void UI_DrawBotName(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) 
;2321:{
line 2322
;2322:	int value = uiInfo.botIndex;
ADDRLP4 0
ADDRGP4 uiInfo+11844
INDIRI4
ASGNI4
line 2324
;2323://	int game = trap_Cvar_VariableValue("g_gametype");
;2324:	const char *text = "";
ADDRLP4 4
ADDRGP4 $165
ASGNP4
line 2333
;2325:	/*
;2326:	if (game >= GT_TEAM) {
;2327:		if (value >= uiInfo.characterCount) {
;2328:			value = 0;
;2329:		}
;2330:		text = uiInfo.characterList[value].name;
;2331:	} else {
;2332:	*/
;2333:		if (value >= UI_GetNumBots()) {
ADDRLP4 8
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1481
line 2334
;2334:			value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2335
;2335:		}
LABELV $1481
line 2336
;2336:		text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 2339
;2337:	//}
;2338://  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
;2339:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle,iMenuFont);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2340
;2340:}
LABELV $1479
endproc UI_DrawBotName 20 36
proc UI_DrawBotSkill 8 36
line 2343
;2341:
;2342:static void UI_DrawBotSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) 
;2343:{
line 2344
;2344:	if (uiInfo.skillIndex >= 0 && uiInfo.skillIndex < numSkillLevels) 
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 0
LTI4 $1484
ADDRGP4 uiInfo+33792
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
GEI4 $1484
line 2345
;2345:	{
line 2346
;2346:		Text_Paint(rect->x, rect->y, scale, color, (char *)UI_GetStripEdString("INGAMETEXT", (char *)skillLevels[uiInfo.skillIndex]), 0, 0, textStyle,iMenuFont);
ADDRGP4 $206
ARGP4
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2347
;2347:	}
LABELV $1484
line 2348
;2348:}
LABELV $1483
endproc UI_DrawBotSkill 8 36
proc UI_DrawRedBlue 8 36
line 2351
;2349:
;2350:static void UI_DrawRedBlue(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) 
;2351:{
line 2352
;2352:	Text_Paint(rect->x, rect->y, scale, color, (uiInfo.redBlue == 0) ? "Red" : "Blue", 0, 0, textStyle,iMenuFont);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+18008
INDIRI4
CNSTI4 0
NEI4 $1492
ADDRLP4 0
ADDRGP4 $936
ASGNP4
ADDRGP4 $1493
JUMPV
LABELV $1492
ADDRLP4 0
ADDRGP4 $935
ASGNP4
LABELV $1493
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2353
;2353:}
LABELV $1489
endproc UI_DrawRedBlue 8 36
proc UI_DrawCrosshair 4 20
line 2355
;2354:
;2355:static void UI_DrawCrosshair(rectDef_t *rect, float scale, vec4_t color) {
line 2356
;2356: 	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2357
;2357:	if (uiInfo.currentCrosshair < 0 || uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 0
LTI4 $1499
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 10
LTI4 $1495
LABELV $1499
line 2358
;2358:		uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+60856
CNSTI4 0
ASGNI4
line 2359
;2359:	}
LABELV $1495
line 2360
;2360:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.uiDC.Assets.crosshairShader[uiInfo.currentCrosshair]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+260+168
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2361
;2361: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2362
;2362:}
LABELV $1494
endproc UI_DrawCrosshair 4 20
proc UI_BuildPlayerList 4176 12
line 2369
;2363:
;2364:/*
;2365:===============
;2366:UI_BuildPlayerList
;2367:===============
;2368:*/
;2369:static void UI_BuildPlayerList() {
line 2374
;2370:	uiClientState_t	cs;
;2371:	int		n, count, team, team2, playerTeamNumber;
;2372:	char	info[MAX_INFO_STRING];
;2373:
;2374:	trap_GetClientState( &cs );
ADDRLP4 1040
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 2375
;2375:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1040+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2376
;2376:	uiInfo.playerNumber = cs.clientNum;
ADDRGP4 uiInfo+18032
ADDRLP4 1040+8
INDIRI4
ASGNI4
line 2377
;2377:	uiInfo.teamLeader = atoi(Info_ValueForKey(info, "tl"));
ADDRLP4 4
ARGP4
ADDRGP4 $1509
ARGP4
ADDRLP4 4128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4128
INDIRP4
ARGP4
ADDRLP4 4132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiInfo+18036
ADDRLP4 4132
INDIRI4
ASGNI4
line 2378
;2378:	team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1510
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4136
INDIRP4
ARGP4
ADDRLP4 4140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 4140
INDIRI4
ASGNI4
line 2379
;2379:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2380
;2380:	count = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $1511
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 4148
INDIRI4
ASGNI4
line 2381
;2381:	uiInfo.playerCount = 0;
ADDRGP4 uiInfo+18012
CNSTI4 0
ASGNI4
line 2382
;2382:	uiInfo.myTeamCount = 0;
ADDRGP4 uiInfo+18016
CNSTI4 0
ASGNI4
line 2383
;2383:	playerTeamNumber = 0;
ADDRLP4 4124
CNSTI4 0
ASGNI4
line 2384
;2384:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1517
JUMPV
LABELV $1514
line 2385
;2385:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2387
;2386:
;2387:		if (info[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1518
line 2388
;2388:			Q_strncpyz( uiInfo.playerNames[uiInfo.playerCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1522
ARGP4
ADDRLP4 4152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+18012
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+18040
ADDP4
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2389
;2389:			Q_CleanStr( uiInfo.playerNames[uiInfo.playerCount] );
ADDRGP4 uiInfo+18012
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+18040
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2390
;2390:			uiInfo.playerIndexes[uiInfo.playerCount] = n;
ADDRGP4 uiInfo+18012
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20216
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2391
;2391:			uiInfo.playerCount++;
ADDRLP4 4156
ADDRGP4 uiInfo+18012
ASGNP4
ADDRLP4 4156
INDIRP4
ADDRLP4 4156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2392
;2392:			team2 = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1510
ARGP4
ADDRLP4 4160
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 4164
INDIRI4
ASGNI4
line 2393
;2393:			if (team2 == team && n != uiInfo.playerNumber) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
NEI4 $1528
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+18032
INDIRI4
EQI4 $1528
line 2394
;2394:				Q_strncpyz( uiInfo.teamNames[uiInfo.myTeamCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1522
ARGP4
ADDRLP4 4168
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+18016
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2395
;2395:				Q_CleanStr( uiInfo.teamNames[uiInfo.myTeamCount] );
ADDRGP4 uiInfo+18016
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2396
;2396:				uiInfo.teamClientNums[uiInfo.myTeamCount] = n;
ADDRGP4 uiInfo+18016
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2397
;2397:				if (uiInfo.playerNumber == n) {
ADDRGP4 uiInfo+18032
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1537
line 2398
;2398:					playerTeamNumber = uiInfo.myTeamCount;
ADDRLP4 4124
ADDRGP4 uiInfo+18016
INDIRI4
ASGNI4
line 2399
;2399:				}
LABELV $1537
line 2400
;2400:				uiInfo.myTeamCount++;
ADDRLP4 4172
ADDRGP4 uiInfo+18016
ASGNP4
ADDRLP4 4172
INDIRP4
ADDRLP4 4172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2401
;2401:			}
LABELV $1528
line 2402
;2402:		}
LABELV $1518
line 2403
;2403:	}
LABELV $1515
line 2384
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1517
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
LTI4 $1514
line 2405
;2404:
;2405:	if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+18036
INDIRI4
CNSTI4 0
NEI4 $1542
line 2406
;2406:		trap_Cvar_Set("cg_selectedPlayer", va("%d", playerTeamNumber));
ADDRGP4 $702
ARGP4
ADDRLP4 4124
INDIRI4
ARGI4
ADDRLP4 4152
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1545
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2407
;2407:	}
LABELV $1542
line 2409
;2408:
;2409:	n = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 4152
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4152
INDIRF4
CVFI4 4
ASGNI4
line 2410
;2410:	if (n < 0 || n > uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1549
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
LEI4 $1546
LABELV $1549
line 2411
;2411:		n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2412
;2412:	}
LABELV $1546
line 2415
;2413:
;2414:
;2415:	if (n < uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $1550
line 2416
;2416:		trap_Cvar_Set("cg_selectedPlayerName", uiInfo.teamNames[n]);
ADDRGP4 $1553
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2417
;2417:	}
ADDRGP4 $1551
JUMPV
LABELV $1550
line 2419
;2418:	else
;2419:	{
line 2420
;2420:		trap_Cvar_Set("cg_selectedPlayerName", "Everyone");
ADDRGP4 $1553
ARGP4
ADDRGP4 $1555
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2421
;2421:	}
LABELV $1551
line 2423
;2422:
;2423:	if (!team || team == TEAM_SPECTATOR || !uiInfo.teamLeader)
ADDRLP4 4164
CNSTI4 0
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRLP4 4164
INDIRI4
EQI4 $1560
ADDRLP4 1036
INDIRI4
CNSTI4 3
EQI4 $1560
ADDRGP4 uiInfo+18036
INDIRI4
ADDRLP4 4164
INDIRI4
NEI4 $1556
LABELV $1560
line 2424
;2424:	{
line 2425
;2425:		n = uiInfo.myTeamCount;
ADDRLP4 0
ADDRGP4 uiInfo+18016
INDIRI4
ASGNI4
line 2426
;2426:		trap_Cvar_Set("cg_selectedPlayer", va("%d", n));
ADDRGP4 $702
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4168
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1545
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2427
;2427:		trap_Cvar_Set("cg_selectedPlayerName", "N/A");
ADDRGP4 $1553
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2428
;2428:	}
LABELV $1556
line 2429
;2429:}
LABELV $1504
endproc UI_BuildPlayerList 4176 12
proc UI_DrawSelectedPlayer 8 36
line 2432
;2430:
;2431:
;2432:static void UI_DrawSelectedPlayer(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 2433
;2433:	if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+18024
INDIRI4
LEI4 $1563
line 2434
;2434:		uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+18024
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 2435
;2435:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 2436
;2436:	}
LABELV $1563
line 2437
;2437:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("cg_selectedPlayerName"), 0, 0, textStyle, iMenuFont);
ADDRGP4 $1553
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2438
;2438:}
LABELV $1562
endproc UI_DrawSelectedPlayer 8 36
proc UI_DrawServerRefreshDate 80 36
line 2441
;2439:
;2440:static void UI_DrawServerRefreshDate(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) 
;2441:{
line 2442
;2442:	if (uiInfo.serverStatus.refreshActive) 
ADDRGP4 uiInfo+40740+2212
INDIRI4
CNSTI4 0
EQI4 $1570
line 2443
;2443:	{
line 2445
;2444:		vec4_t lowLight, newColor;
;2445:		lowLight[0] = 0.8 * color[0]; 
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2446
;2446:		lowLight[1] = 0.8 * color[1]; 
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2447
;2447:		lowLight[2] = 0.8 * color[2]; 
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2448
;2448:		lowLight[3] = 0.8 * color[3]; 
ADDRLP4 0+12
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 2449
;2449:		LerpColor(color,lowLight,newColor,0.5+0.5*sin(uiInfo.uiDC.realTime / PULSE_DIVISOR));
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1056964608
ADDRLP4 32
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 2451
;2450:
;2451:		trap_SP_GetStringTextString("INGAMETEXT_GETTINGINFOFORSERVERS", holdSPString, sizeof(holdSPString));
ADDRGP4 $1578
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 2452
;2452:		Text_Paint(rect->x, rect->y, scale, newColor, va((char *) holdSPString, trap_LAN_GetServerCount(ui_netSource.integer)), 0, 0, textStyle, iMenuFont);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 holdSPString
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2453
;2453:	} 
ADDRGP4 $1571
JUMPV
LABELV $1570
line 2455
;2454:	else 
;2455:	{
line 2457
;2456:		char buff[64];
;2457:		Q_strncpyz(buff, UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer)), 64);
ADDRGP4 $1473
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2458
;2458:		trap_SP_GetStringTextString("INGAMETEXT_SERVER_REFRESHTIME", holdSPString, sizeof(holdSPString));
ADDRGP4 $1581
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 2460
;2459:
;2460:		Text_Paint(rect->x, rect->y, scale, color, va("%s: %s", holdSPString, buff), 0, 0, textStyle, iMenuFont);
ADDRGP4 $934
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2461
;2461:	}
LABELV $1571
line 2462
;2462:}
LABELV $1569
endproc UI_DrawServerRefreshDate 80 36
proc UI_DrawServerMOTD 24 36
line 2464
;2463:
;2464:static void UI_DrawServerMOTD(rectDef_t *rect, float scale, vec4_t color, int iMenuFont) {
line 2465
;2465:	if (uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+40740+10436
INDIRI4
CNSTI4 0
EQI4 $1583
line 2468
;2466:		float maxX;
;2467:	 
;2468:		if (uiInfo.serverStatus.motdWidth == -1) {
ADDRGP4 uiInfo+40740+10440
INDIRI4
CNSTI4 -1
NEI4 $1587
line 2469
;2469:			uiInfo.serverStatus.motdWidth = 0;
ADDRGP4 uiInfo+40740+10440
CNSTI4 0
ASGNI4
line 2470
;2470:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+40740+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 2471
;2471:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+40740+10448
CNSTI4 -1
ASGNI4
line 2472
;2472:		}
LABELV $1587
line 2474
;2473:
;2474:		if (uiInfo.serverStatus.motdOffset > uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+40740+10452
INDIRI4
ADDRGP4 uiInfo+40740+10436
INDIRI4
LEI4 $1597
line 2475
;2475:			uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+40740+10452
CNSTI4 0
ASGNI4
line 2476
;2476:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+40740+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 2477
;2477:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+40740+10448
CNSTI4 -1
ASGNI4
line 2478
;2478:		}
LABELV $1597
line 2480
;2479:
;2480:		if (uiInfo.uiDC.realTime > uiInfo.serverStatus.motdTime) {
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+40740+10456
INDIRI4
LEI4 $1609
line 2481
;2481:			uiInfo.serverStatus.motdTime = uiInfo.uiDC.realTime + 10;
ADDRGP4 uiInfo+40740+10456
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 2482
;2482:			if (uiInfo.serverStatus.motdPaintX <= rect->x + 2) {
ADDRGP4 uiInfo+40740+10444
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
GTF4 $1617
line 2483
;2483:				if (uiInfo.serverStatus.motdOffset < uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+40740+10452
INDIRI4
ADDRGP4 uiInfo+40740+10436
INDIRI4
GEI4 $1621
line 2484
;2484:					uiInfo.serverStatus.motdPaintX += Text_Width(&uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], scale, 1) - 1;
ADDRGP4 uiInfo+40740+10452
INDIRI4
ADDRGP4 uiInfo+40740+10460
ADDP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 uiInfo+40740+10444
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
line 2485
;2485:					uiInfo.serverStatus.motdOffset++;
ADDRLP4 12
ADDRGP4 uiInfo+40740+10452
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2486
;2486:				} else {
ADDRGP4 $1618
JUMPV
LABELV $1621
line 2487
;2487:					uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+40740+10452
CNSTI4 0
ASGNI4
line 2488
;2488:					if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+40740+10448
INDIRI4
CNSTI4 0
LTI4 $1637
line 2489
;2489:						uiInfo.serverStatus.motdPaintX = uiInfo.serverStatus.motdPaintX2;
ADDRGP4 uiInfo+40740+10444
ADDRGP4 uiInfo+40740+10448
INDIRI4
ASGNI4
line 2490
;2490:					} else {
ADDRGP4 $1638
JUMPV
LABELV $1637
line 2491
;2491:						uiInfo.serverStatus.motdPaintX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+40740+10444
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 2492
;2492:					}
LABELV $1638
line 2493
;2493:					uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+40740+10448
CNSTI4 -1
ASGNI4
line 2494
;2494:				}
line 2495
;2495:			} else {
ADDRGP4 $1618
JUMPV
LABELV $1617
line 2497
;2496:				//serverStatus.motdPaintX--;
;2497:				uiInfo.serverStatus.motdPaintX -= 2;
ADDRLP4 4
ADDRGP4 uiInfo+40740+10444
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2498
;2498:				if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+40740+10448
INDIRI4
CNSTI4 0
LTI4 $1651
line 2500
;2499:					//serverStatus.motdPaintX2--;
;2500:					uiInfo.serverStatus.motdPaintX2 -= 2;
ADDRLP4 8
ADDRGP4 uiInfo+40740+10448
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2501
;2501:				}
LABELV $1651
line 2502
;2502:			}
LABELV $1618
line 2503
;2503:		}
LABELV $1609
line 2505
;2504:
;2505:		maxX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2506
;2506:		Text_Paint_Limit(&maxX, uiInfo.serverStatus.motdPaintX, rect->y + rect->h - 3, scale, color, &uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], 0, 0, iMenuFont); 
ADDRLP4 0
ARGP4
ADDRGP4 uiInfo+40740+10444
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+40740+10452
INDIRI4
ADDRGP4 uiInfo+40740+10460
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 2507
;2507:		if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+40740+10448
INDIRI4
CNSTI4 0
LTI4 $1663
line 2508
;2508:			float maxX2 = rect->x + rect->w - 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2509
;2509:			Text_Paint_Limit(&maxX2, uiInfo.serverStatus.motdPaintX2, rect->y + rect->h - 3, scale, color, uiInfo.serverStatus.motd, 0, uiInfo.serverStatus.motdOffset, iMenuFont); 
ADDRLP4 12
ARGP4
ADDRGP4 uiInfo+40740+10448
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+40740+10460
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 uiInfo+40740+10452
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 2510
;2510:		}
LABELV $1663
line 2511
;2511:		if (uiInfo.serverStatus.motdOffset && maxX > 0) {
ADDRGP4 uiInfo+40740+10452
INDIRI4
CNSTI4 0
EQI4 $1673
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1673
line 2513
;2512:			// if we have an offset ( we are skipping the first part of the string ) and we fit the string
;2513:			if (uiInfo.serverStatus.motdPaintX2 == -1) {
ADDRGP4 uiInfo+40740+10448
INDIRI4
CNSTI4 -1
NEI4 $1674
line 2514
;2514:						uiInfo.serverStatus.motdPaintX2 = rect->x + rect->w - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+40740+10448
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 2515
;2515:			}
line 2516
;2516:		} else {
ADDRGP4 $1674
JUMPV
LABELV $1673
line 2517
;2517:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+40740+10448
CNSTI4 -1
ASGNI4
line 2518
;2518:		}
LABELV $1674
line 2520
;2519:
;2520:	}
LABELV $1583
line 2521
;2521:}
LABELV $1582
endproc UI_DrawServerMOTD 24 36
proc UI_DrawKeyBindStatus 12 36
line 2523
;2522:
;2523:static void UI_DrawKeyBindStatus(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) {
line 2525
;2524://	int ofs = 0; TTimo: unused
;2525:	if (Display_KeyBindPending()) 
ADDRLP4 0
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1686
line 2526
;2526:	{
line 2527
;2527:		Text_Paint(rect->x, rect->y, scale, color, UI_GetStripEdString("INGAMETEXT", "WAITING_FOR_NEW_KEY"), 0, 0, textStyle,iMenuFont);
ADDRGP4 $206
ARGP4
ADDRGP4 $1471
ARGP4
ADDRLP4 4
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2528
;2528:	} else {
LABELV $1686
line 2530
;2529://		Text_Paint(rect->x, rect->y, scale, color, "Press ENTER or CLICK to change, Press BACKSPACE to clear", 0, 0, textStyle,iMenuFont);
;2530:	}
LABELV $1687
line 2531
;2531:}
LABELV $1685
endproc UI_DrawKeyBindStatus 12 36
proc UI_DrawGLInfo 4664 36
line 2534
;2532:
;2533:static void UI_DrawGLInfo(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) 
;2534:{
line 2540
;2535:	char * eptr;
;2536:	char buff[4096];
;2537:	const char *lines[128];
;2538:	int y, numLines, i;
;2539:
;2540:	Text_Paint(rect->x + 2, rect->y, scale, color, va("GL_VENDOR: %s", uiInfo.uiDC.glconfig.vendor_string), 0, 30, textStyle,iMenuFont);
ADDRGP4 $1689
ARGP4
ADDRGP4 uiInfo+468+1024
ARGP4
ADDRLP4 4624
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4628
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4628
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4624
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2541
;2541:	Text_Paint(rect->x + 2, rect->y + 15, scale, color, va("GL_VERSION: %s: %s", uiInfo.uiDC.glconfig.version_string,uiInfo.uiDC.glconfig.renderer_string), 0, 30, textStyle,iMenuFont);
ADDRGP4 $1692
ARGP4
ADDRGP4 uiInfo+468+2048
ARGP4
ADDRGP4 uiInfo+468
ARGP4
ADDRLP4 4632
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4636
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4636
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1097859072
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4632
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2542
;2542:	Text_Paint(rect->x + 2, rect->y + 30, scale, color, va ("GL_PIXELFORMAT: color(%d-bits) Z(%d-bits) stencil(%d-bits)", uiInfo.uiDC.glconfig.colorBits, uiInfo.uiDC.glconfig.depthBits, uiInfo.uiDC.glconfig.stencilBits), 0, 30, textStyle,iMenuFont);
ADDRGP4 $1696
ARGP4
ADDRGP4 uiInfo+468+11272
INDIRI4
ARGI4
ADDRGP4 uiInfo+468+11276
INDIRI4
ARGI4
ADDRGP4 uiInfo+468+11280
INDIRI4
ARGI4
ADDRLP4 4640
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4644
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4644
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1106247680
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4640
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2545
;2543:
;2544:	// build null terminated extension strings
;2545:	Q_strncpyz(buff, uiInfo.uiDC.glconfig.extensions_string, 4096);
ADDRLP4 528
ARGP4
ADDRGP4 uiInfo+468+3072
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2546
;2546:	eptr = buff;
ADDRLP4 0
ADDRLP4 528
ASGNP4
line 2547
;2547:	y = rect->y + 45;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1110704128
ADDF4
CVFI4 4
ASGNI4
line 2548
;2548:	numLines = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1706
JUMPV
line 2550
;2549:	while ( y < rect->y + rect->h && *eptr )
;2550:	{
LABELV $1708
line 2552
;2551:		while ( *eptr && *eptr == ' ' )
;2552:			*eptr++ = '\0';
ADDRLP4 4648
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4648
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4648
INDIRP4
CNSTI1 0
ASGNI1
LABELV $1709
line 2551
ADDRLP4 4652
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4652
INDIRI4
CNSTI4 0
EQI4 $1711
ADDRLP4 4652
INDIRI4
CNSTI4 32
EQI4 $1708
LABELV $1711
line 2555
;2553:
;2554:		// track start of valid string
;2555:		if (*eptr && *eptr != ' ') 
ADDRLP4 4656
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4656
INDIRI4
CNSTI4 0
EQI4 $1715
ADDRLP4 4656
INDIRI4
CNSTI4 32
EQI4 $1715
line 2556
;2556:		{
line 2557
;2557:			lines[numLines++] = eptr;
ADDRLP4 4660
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 4660
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4660
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2558
;2558:		}
ADDRGP4 $1715
JUMPV
LABELV $1714
line 2561
;2559:
;2560:		while ( *eptr && *eptr != ' ' )
;2561:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1715
line 2560
ADDRLP4 4660
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4660
INDIRI4
CNSTI4 0
EQI4 $1717
ADDRLP4 4660
INDIRI4
CNSTI4 32
NEI4 $1714
LABELV $1717
line 2562
;2562:	}
LABELV $1706
line 2549
ADDRLP4 4648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 4648
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4648
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
GEF4 $1718
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1709
LABELV $1718
line 2564
;2563:
;2564:	i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1720
JUMPV
LABELV $1719
line 2566
;2565:	while (i < numLines) 
;2566:	{
line 2567
;2567:		Text_Paint(rect->x + 2, y, scale, color, lines[i++], 0, 20, textStyle,iMenuFont);
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4652
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 4652
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4652
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2568
;2568:		if (i < numLines) 
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $1722
line 2569
;2569:		{
line 2570
;2570:			Text_Paint(rect->x + rect->w / 2, y, scale, color, lines[i++], 0, 20, textStyle,iMenuFont);
ADDRLP4 4660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4660
INDIRP4
INDIRF4
ADDRLP4 4660
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4656
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 4656
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4656
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2571
;2571:		}
LABELV $1722
line 2572
;2572:		y += 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 2573
;2573:		if (y > rect->y + rect->h - 11) 
ADDRLP4 4656
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 4656
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4656
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1093664768
SUBF4
LEF4 $1724
line 2574
;2574:		{
line 2575
;2575:			break;
ADDRGP4 $1721
JUMPV
LABELV $1724
line 2577
;2576:		}
;2577:	}
LABELV $1720
line 2565
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $1719
LABELV $1721
line 2580
;2578:
;2579:
;2580:}
LABELV $1688
endproc UI_DrawGLInfo 4664 36
proc UI_Version 16 36
line 2588
;2581:
;2582:/*
;2583:=================
;2584:UI_Version
;2585:=================
;2586:*/
;2587:static void UI_Version(rectDef_t *rect, float scale, vec4_t color, int iMenuFont) 
;2588:{
line 2591
;2589:	int width;
;2590:	
;2591:	width = uiInfo.uiDC.textWidth(Q3_VERSION, scale, iMenuFont);
ADDRGP4 $1728
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 uiInfo+20
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2593
;2592:
;2593:	uiInfo.uiDC.drawText(rect->x - width, rect->y, scale, color, Q3_VERSION, 0, 0, 0, iMenuFont);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1728
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiInfo+16
INDIRP4
CALLV
pop
line 2594
;2594:}
LABELV $1726
endproc UI_Version 16 36
proc UI_OwnerDraw 48 36
line 2604
;2595:
;2596:/*
;2597:=================
;2598:UI_OwnerDraw
;2599:=================
;2600:*/
;2601:// FIXME: table drive
;2602://
;2603:static void UI_OwnerDraw(float x, float y, float w, float h, float text_x, float text_y, int ownerDraw, int ownerDrawFlags, int align, float special, float scale, vec4_t color, qhandle_t shader, int textStyle,int iMenuFont) 
;2604:{
line 2607
;2605:	rectDef_t rect;
;2606:	int findex;
;2607:	int drawRank = 0, iUse = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2609
;2608:
;2609:	rect.x = x + text_x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 2610
;2610:	rect.y = y + text_y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
ADDRFP4 20
INDIRF4
ADDF4
ASGNF4
line 2611
;2611:	rect.w = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
ASGNF4
line 2612
;2612:	rect.h = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 2614
;2613:
;2614:  switch (ownerDraw) 
ADDRLP4 28
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 200
LTI4 $1735
ADDRLP4 28
INDIRI4
CNSTI4 289
GTI4 $1735
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1801-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1801
address $1736
address $1747
address $1735
address $1749
address $1750
address $1753
address $1757
address $1761
address $1763
address $1764
address $1765
address $1765
address $1765
address $1765
address $1765
address $1768
address $1768
address $1768
address $1768
address $1768
address $1771
address $1772
address $1774
address $1775
address $1735
address $1777
address $1778
address $1779
address $1780
address $1783
address $1781
address $1784
address $1782
address $1785
address $1786
address $1787
address $1788
address $1790
address $1735
address $1791
address $1792
address $1793
address $1794
address $1795
address $1759
address $1754
address $1773
address $1796
address $1797
address $1798
address $1799
address $1751
address $1758
address $1756
address $1752
address $1760
address $1789
address $1738
address $1743
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1800
address $1735
address $1755
address $1765
address $1765
address $1765
address $1768
address $1768
address $1768
address $1742
address $1737
address $1740
address $1739
code
line 2615
;2615:  {
LABELV $1736
line 2617
;2616:    case UI_HANDICAP:
;2617:      UI_DrawHandicap(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandicap
CALLV
pop
line 2618
;2618:      break;
ADDRGP4 $1735
JUMPV
LABELV $1737
line 2620
;2619:    case UI_SKIN_COLOR:
;2620:      UI_DrawSkinColor(&rect, scale, color, textStyle, uiSkinColor, TEAM_FREE, TEAM_BLUE, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiSkinColor
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawSkinColor
CALLV
pop
line 2621
;2621:      break;
ADDRGP4 $1735
JUMPV
LABELV $1738
line 2623
;2622:	case UI_FORCE_SIDE:
;2623:      UI_DrawForceSide(&rect, scale, color, textStyle, uiForceSide, 1, 2, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiForceSide
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 2
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawForceSide
CALLV
pop
line 2624
;2624:      break;
ADDRGP4 $1735
JUMPV
LABELV $1739
line 2626
;2625:	case UI_JEDI_NONJEDI:
;2626:      UI_DrawJediNonJedi(&rect, scale, color, textStyle, uiJediNonJedi, 0, 1, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiJediNonJedi
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawJediNonJedi
CALLV
pop
line 2627
;2627:      break;
ADDRGP4 $1735
JUMPV
LABELV $1740
line 2629
;2628:    case UI_FORCE_POINTS:
;2629:      UI_DrawGenericNum(&rect, scale, color, textStyle, uiForceAvailable, 1, forceMasteryPoints[MAX_FORCE_RANK], ownerDraw,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiForceAvailable
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 forceMasteryPoints+28
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawGenericNum
CALLV
pop
line 2630
;2630:      break;
ADDRGP4 $1735
JUMPV
LABELV $1742
line 2632
;2631:	case UI_FORCE_MASTERY_SET:
;2632:      UI_DrawForceMastery(&rect, scale, color, textStyle, uiForceRank, 0, MAX_FORCE_RANK, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiForceRank
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawForceMastery
CALLV
pop
line 2633
;2633:      break;
ADDRGP4 $1735
JUMPV
LABELV $1743
line 2635
;2634:    case UI_FORCE_RANK:
;2635:      UI_DrawForceMastery(&rect, scale, color, textStyle, uiForceRank, 0, MAX_FORCE_RANK, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiForceRank
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawForceMastery
CALLV
pop
line 2636
;2636:      break;
ADDRGP4 $1735
JUMPV
LABELV $1744
line 2670
;2637:	case UI_FORCE_RANK_HEAL:
;2638:	case UI_FORCE_RANK_LEVITATION:
;2639:	case UI_FORCE_RANK_SPEED:
;2640:	case UI_FORCE_RANK_PUSH:
;2641:	case UI_FORCE_RANK_PULL:
;2642:	case UI_FORCE_RANK_TELEPATHY:
;2643:	case UI_FORCE_RANK_GRIP:
;2644:	case UI_FORCE_RANK_LIGHTNING:
;2645:	case UI_FORCE_RANK_RAGE:
;2646:	case UI_FORCE_RANK_PROTECT:
;2647:	case UI_FORCE_RANK_ABSORB:
;2648:	case UI_FORCE_RANK_TEAM_HEAL:
;2649:	case UI_FORCE_RANK_TEAM_FORCE:
;2650:	case UI_FORCE_RANK_DRAIN:
;2651:	case UI_FORCE_RANK_SEE:
;2652:	case UI_FORCE_RANK_SABERATTACK:
;2653:	case UI_FORCE_RANK_SABERDEFEND:
;2654:	case UI_FORCE_RANK_SABERTHROW:
;2655:
;2656://		uiForceRank
;2657:/*
;2658:		uiForceUsed
;2659:		// Only fields for white stars
;2660:		if (uiForceUsed<3)
;2661:		{
;2662:		    Menu_ShowItemByName(menu, "lightpowers_team", qtrue);
;2663:		}
;2664:		else if (uiForceUsed<6)
;2665:		{
;2666:		    Menu_ShowItemByName(menu, "lightpowers_team", qtrue);
;2667:		}
;2668:*/
;2669:
;2670:		findex = (ownerDraw - UI_FORCE_RANK)-1;
ADDRLP4 24
ADDRFP4 24
INDIRI4
CNSTI4 258
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 2672
;2671:		//this will give us the index as long as UI_FORCE_RANK is always one below the first force rank index
;2672:		if (uiForcePowerDarkLight[findex] && uiForceSide != uiForcePowerDarkLight[findex])
ADDRLP4 32
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1745
ADDRGP4 uiForceSide
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1745
line 2673
;2673:		{
line 2674
;2674:			color[0] *= 0.5;
ADDRLP4 36
ADDRFP4 44
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1056964608
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2675
;2675:			color[1] *= 0.5;
ADDRLP4 40
ADDRFP4 44
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1056964608
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2676
;2676:			color[2] *= 0.5;
ADDRLP4 44
ADDRFP4 44
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTF4 1056964608
ADDRLP4 44
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2677
;2677:		}
LABELV $1745
line 2678
;2678:/*		else if (uiForceRank < UI_ForceColorMinRank[bgForcePowerCost[findex][FORCE_LEVEL_1]])
ADDRLP4 20
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ASGNI4
line 2686
;2679:		{
;2680:			color[0] *= 0.5;
;2681:			color[1] *= 0.5;
;2682:			color[2] *= 0.5;
;2683:		}
;2684:*/		drawRank = uiForcePowersRank[findex];
;2685:
;2686:		UI_DrawForceStars(&rect, scale, color, textStyle, findex, drawRank, 0, NUM_FORCE_POWER_LEVELS-1);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 UI_DrawForceStars
CALLV
pop
line 2687
;2687:		break;
ADDRGP4 $1735
JUMPV
LABELV $1747
line 2689
;2688:    case UI_EFFECTS:
;2689:      UI_DrawEffects(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawEffects
CALLV
pop
line 2690
;2690:      break;
ADDRGP4 $1735
JUMPV
line 2693
;2691:    case UI_PLAYERMODEL:
;2692:      //UI_DrawPlayerModel(&rect);
;2693:      break;
LABELV $1749
line 2695
;2694:    case UI_CLANNAME:
;2695:      UI_DrawClanName(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawClanName
CALLV
pop
line 2696
;2696:      break;
ADDRGP4 $1735
JUMPV
LABELV $1750
line 2698
;2697:    case UI_CLANLOGO:
;2698:      UI_DrawClanLogo(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanLogo
CALLV
pop
line 2699
;2699:      break;
ADDRGP4 $1735
JUMPV
LABELV $1751
line 2701
;2700:    case UI_CLANCINEMATIC:
;2701:      UI_DrawClanCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanCinematic
CALLV
pop
line 2702
;2702:      break;
ADDRGP4 $1735
JUMPV
LABELV $1752
line 2704
;2703:    case UI_PREVIEWCINEMATIC:
;2704:      UI_DrawPreviewCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPreviewCinematic
CALLV
pop
line 2705
;2705:      break;
ADDRGP4 $1735
JUMPV
LABELV $1753
line 2707
;2706:    case UI_GAMETYPE:
;2707:      UI_DrawGameType(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawGameType
CALLV
pop
line 2708
;2708:      break;
ADDRGP4 $1735
JUMPV
LABELV $1754
line 2710
;2709:    case UI_NETGAMETYPE:
;2710:      UI_DrawNetGameType(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetGameType
CALLV
pop
line 2711
;2711:      break;
ADDRGP4 $1735
JUMPV
LABELV $1755
line 2713
;2712:    case UI_AUTOSWITCHLIST:
;2713:      UI_DrawAutoSwitch(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawAutoSwitch
CALLV
pop
line 2714
;2714:      break;
ADDRGP4 $1735
JUMPV
LABELV $1756
line 2716
;2715:    case UI_JOINGAMETYPE:
;2716:	  UI_DrawJoinGameType(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawJoinGameType
CALLV
pop
line 2717
;2717:	  break;
ADDRGP4 $1735
JUMPV
LABELV $1757
line 2719
;2718:    case UI_MAPPREVIEW:
;2719:      UI_DrawMapPreview(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 2720
;2720:      break;
ADDRGP4 $1735
JUMPV
LABELV $1758
line 2722
;2721:    case UI_MAP_TIMETOBEAT:
;2722:      UI_DrawMapTimeToBeat(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapTimeToBeat
CALLV
pop
line 2723
;2723:      break;
ADDRGP4 $1735
JUMPV
LABELV $1759
line 2725
;2724:    case UI_MAPCINEMATIC:
;2725:      UI_DrawMapCinematic(&rect, scale, color, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2726
;2726:      break;
ADDRGP4 $1735
JUMPV
LABELV $1760
line 2728
;2727:    case UI_STARTMAPCINEMATIC:
;2728:      UI_DrawMapCinematic(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2729
;2729:      break;
ADDRGP4 $1735
JUMPV
LABELV $1761
line 2731
;2730:    case UI_SKILL:
;2731:      UI_DrawSkill(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawSkill
CALLV
pop
line 2732
;2732:      break;
ADDRGP4 $1735
JUMPV
line 2735
;2733:    case UI_TOTALFORCESTARS:
;2734://      UI_DrawTotalForceStars(&rect, scale, color, textStyle);
;2735:      break;
LABELV $1763
line 2737
;2736:    case UI_BLUETEAMNAME:
;2737:      UI_DrawTeamName(&rect, scale, color, qtrue, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2738
;2738:      break;
ADDRGP4 $1735
JUMPV
LABELV $1764
line 2740
;2739:    case UI_REDTEAMNAME:
;2740:      UI_DrawTeamName(&rect, scale, color, qfalse, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2741
;2741:      break;
ADDRGP4 $1735
JUMPV
LABELV $1765
line 2750
;2742:    case UI_BLUETEAM1:
;2743:		case UI_BLUETEAM2:
;2744:		case UI_BLUETEAM3:
;2745:		case UI_BLUETEAM4:
;2746:		case UI_BLUETEAM5:
;2747:		case UI_BLUETEAM6:
;2748:		case UI_BLUETEAM7:
;2749:		case UI_BLUETEAM8:
;2750:	if (ownerDraw <= UI_BLUETEAM5)
ADDRFP4 24
INDIRI4
CNSTI4 214
GTI4 $1766
line 2751
;2751:	{
line 2752
;2752:	  iUse = ownerDraw-UI_BLUETEAM1 + 1;
ADDRLP4 16
ADDRFP4 24
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2753
;2753:	}
ADDRGP4 $1767
JUMPV
LABELV $1766
line 2755
;2754:	else
;2755:	{
line 2756
;2756:	  iUse = ownerDraw-274; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 16
ADDRFP4 24
INDIRI4
CNSTI4 274
SUBI4
ASGNI4
line 2757
;2757:	}
LABELV $1767
line 2758
;2758:      UI_DrawTeamMember(&rect, scale, color, qtrue, iUse, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2759
;2759:      break;
ADDRGP4 $1735
JUMPV
LABELV $1768
line 2768
;2760:    case UI_REDTEAM1:
;2761:		case UI_REDTEAM2:
;2762:		case UI_REDTEAM3:
;2763:		case UI_REDTEAM4:
;2764:		case UI_REDTEAM5:
;2765:		case UI_REDTEAM6:
;2766:		case UI_REDTEAM7:
;2767:		case UI_REDTEAM8:
;2768:	if (ownerDraw <= UI_REDTEAM5)
ADDRFP4 24
INDIRI4
CNSTI4 219
GTI4 $1769
line 2769
;2769:	{
line 2770
;2770:	  iUse = ownerDraw-UI_REDTEAM1 + 1;
ADDRLP4 16
ADDRFP4 24
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2771
;2771:	}
ADDRGP4 $1770
JUMPV
LABELV $1769
line 2773
;2772:	else
;2773:	{
line 2774
;2774:	  iUse = ownerDraw-277; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 16
ADDRFP4 24
INDIRI4
CNSTI4 277
SUBI4
ASGNI4
line 2775
;2775:	}
LABELV $1770
line 2776
;2776:      UI_DrawTeamMember(&rect, scale, color, qfalse, iUse, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2777
;2777:      break;
ADDRGP4 $1735
JUMPV
LABELV $1771
line 2779
;2778:		case UI_NETSOURCE:
;2779:      UI_DrawNetSource(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetSource
CALLV
pop
line 2780
;2780:			break;
ADDRGP4 $1735
JUMPV
LABELV $1772
line 2782
;2781:    case UI_NETMAPPREVIEW:
;2782:      UI_DrawNetMapPreview(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 2783
;2783:      break;
ADDRGP4 $1735
JUMPV
LABELV $1773
line 2785
;2784:    case UI_NETMAPCINEMATIC:
;2785:      UI_DrawNetMapCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapCinematic
CALLV
pop
line 2786
;2786:      break;
ADDRGP4 $1735
JUMPV
LABELV $1774
line 2788
;2787:		case UI_NETFILTER:
;2788:      UI_DrawNetFilter(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetFilter
CALLV
pop
line 2789
;2789:			break;
ADDRGP4 $1735
JUMPV
LABELV $1775
line 2791
;2790:		case UI_TIER:
;2791:			UI_DrawTier(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTier
CALLV
pop
line 2792
;2792:			break;
ADDRGP4 $1735
JUMPV
line 2795
;2793:		case UI_OPPONENTMODEL:
;2794:			//UI_DrawOpponent(&rect);
;2795:			break;
LABELV $1777
line 2797
;2796:		case UI_TIERMAP1:
;2797:			UI_DrawTierMap(&rect, 0);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2798
;2798:			break;
ADDRGP4 $1735
JUMPV
LABELV $1778
line 2800
;2799:		case UI_TIERMAP2:
;2800:			UI_DrawTierMap(&rect, 1);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2801
;2801:			break;
ADDRGP4 $1735
JUMPV
LABELV $1779
line 2803
;2802:		case UI_TIERMAP3:
;2803:			UI_DrawTierMap(&rect, 2);
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2804
;2804:			break;
ADDRGP4 $1735
JUMPV
LABELV $1780
line 2806
;2805:		case UI_PLAYERLOGO:
;2806:			UI_DrawPlayerLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogo
CALLV
pop
line 2807
;2807:			break;
ADDRGP4 $1735
JUMPV
LABELV $1781
line 2809
;2808:		case UI_PLAYERLOGO_METAL:
;2809:			UI_DrawPlayerLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoMetal
CALLV
pop
line 2810
;2810:			break;
ADDRGP4 $1735
JUMPV
LABELV $1782
line 2812
;2811:		case UI_PLAYERLOGO_NAME:
;2812:			UI_DrawPlayerLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoName
CALLV
pop
line 2813
;2813:			break;
ADDRGP4 $1735
JUMPV
LABELV $1783
line 2815
;2814:		case UI_OPPONENTLOGO:
;2815:			UI_DrawOpponentLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogo
CALLV
pop
line 2816
;2816:			break;
ADDRGP4 $1735
JUMPV
LABELV $1784
line 2818
;2817:		case UI_OPPONENTLOGO_METAL:
;2818:			UI_DrawOpponentLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoMetal
CALLV
pop
line 2819
;2819:			break;
ADDRGP4 $1735
JUMPV
LABELV $1785
line 2821
;2820:		case UI_OPPONENTLOGO_NAME:
;2821:			UI_DrawOpponentLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoName
CALLV
pop
line 2822
;2822:			break;
ADDRGP4 $1735
JUMPV
LABELV $1786
line 2824
;2823:		case UI_TIER_MAPNAME:
;2824:			UI_DrawTierMapName(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierMapName
CALLV
pop
line 2825
;2825:			break;
ADDRGP4 $1735
JUMPV
LABELV $1787
line 2827
;2826:		case UI_TIER_GAMETYPE:
;2827:			UI_DrawTierGameType(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierGameType
CALLV
pop
line 2828
;2828:			break;
ADDRGP4 $1735
JUMPV
LABELV $1788
line 2830
;2829:		case UI_ALLMAPS_SELECTION:
;2830:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qtrue, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2831
;2831:			break;
ADDRGP4 $1735
JUMPV
LABELV $1789
line 2833
;2832:		case UI_MAPS_SELECTION:
;2833:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qfalse, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2834
;2834:			break;
ADDRGP4 $1735
JUMPV
LABELV $1790
line 2836
;2835:		case UI_OPPONENT_NAME:
;2836:			UI_DrawOpponentName(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawOpponentName
CALLV
pop
line 2837
;2837:			break;
ADDRGP4 $1735
JUMPV
LABELV $1791
line 2839
;2838:		case UI_BOTNAME:
;2839:			UI_DrawBotName(&rect, scale, color, textStyle,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotName
CALLV
pop
line 2840
;2840:			break;
ADDRGP4 $1735
JUMPV
LABELV $1792
line 2842
;2841:		case UI_BOTSKILL:
;2842:			UI_DrawBotSkill(&rect, scale, color, textStyle,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotSkill
CALLV
pop
line 2843
;2843:			break;
ADDRGP4 $1735
JUMPV
LABELV $1793
line 2845
;2844:		case UI_REDBLUE:
;2845:			UI_DrawRedBlue(&rect, scale, color, textStyle,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawRedBlue
CALLV
pop
line 2846
;2846:			break;
ADDRGP4 $1735
JUMPV
LABELV $1794
line 2848
;2847:		case UI_CROSSHAIR:
;2848:			UI_DrawCrosshair(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawCrosshair
CALLV
pop
line 2849
;2849:			break;
ADDRGP4 $1735
JUMPV
LABELV $1795
line 2851
;2850:		case UI_SELECTEDPLAYER:
;2851:			UI_DrawSelectedPlayer(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawSelectedPlayer
CALLV
pop
line 2852
;2852:			break;
ADDRGP4 $1735
JUMPV
LABELV $1796
line 2854
;2853:		case UI_SERVERREFRESHDATE:
;2854:			UI_DrawServerRefreshDate(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawServerRefreshDate
CALLV
pop
line 2855
;2855:			break;
ADDRGP4 $1735
JUMPV
LABELV $1797
line 2857
;2856:		case UI_SERVERMOTD:
;2857:			UI_DrawServerMOTD(&rect, scale, color, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawServerMOTD
CALLV
pop
line 2858
;2858:			break;
ADDRGP4 $1735
JUMPV
LABELV $1798
line 2860
;2859:		case UI_GLINFO:
;2860:			UI_DrawGLInfo(&rect,scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawGLInfo
CALLV
pop
line 2861
;2861:			break;
ADDRGP4 $1735
JUMPV
LABELV $1799
line 2863
;2862:		case UI_KEYBINDSTATUS:
;2863:			UI_DrawKeyBindStatus(&rect,scale, color, textStyle,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawKeyBindStatus
CALLV
pop
line 2864
;2864:			break;
ADDRGP4 $1735
JUMPV
LABELV $1800
line 2866
;2865:		case UI_VERSION:
;2866:			UI_Version(&rect, scale, color, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_Version
CALLV
pop
line 2867
;2867:			break;
line 2869
;2868:    default:
;2869:      break;
LABELV $1735
line 2872
;2870:  }
;2871:
;2872:}
LABELV $1730
endproc UI_OwnerDraw 48 36
proc UI_OwnerDrawVisible 16 4
line 2874
;2873:
;2874:static qboolean UI_OwnerDrawVisible(int flags) {
line 2875
;2875:	qboolean vis = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1805
JUMPV
LABELV $1804
line 2877
;2876:
;2877:	while (flags) {
line 2879
;2878:
;2879:		if (flags & UI_SHOW_FFA) {
ADDRFP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1807
line 2880
;2880:			if (trap_Cvar_VariableValue("g_gametype") != GT_FFA && trap_Cvar_VariableValue("g_gametype") != GT_HOLOCRON && trap_Cvar_VariableValue("g_gametype") != GT_JEDIMASTER) {
ADDRGP4 $883
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
EQF4 $1809
ADDRGP4 $883
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
EQF4 $1809
ADDRGP4 $883
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1073741824
EQF4 $1809
line 2881
;2881:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2882
;2882:			}
LABELV $1809
line 2883
;2883:			flags &= ~UI_SHOW_FFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 2884
;2884:		}
LABELV $1807
line 2886
;2885:
;2886:		if (flags & UI_SHOW_NOTFFA) {
ADDRFP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1811
line 2887
;2887:			if (trap_Cvar_VariableValue("g_gametype") == GT_FFA || trap_Cvar_VariableValue("g_gametype") == GT_HOLOCRON || trap_Cvar_VariableValue("g_gametype") != GT_JEDIMASTER) {
ADDRGP4 $883
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
EQF4 $1816
ADDRGP4 $883
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
EQF4 $1816
ADDRGP4 $883
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1073741824
EQF4 $1813
LABELV $1816
line 2888
;2888:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2889
;2889:			}
LABELV $1813
line 2890
;2890:			flags &= ~UI_SHOW_NOTFFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2891
;2891:		}
LABELV $1811
line 2893
;2892:
;2893:		if (flags & UI_SHOW_LEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1817
line 2895
;2894:			// these need to show when this client can give orders to a player or a group
;2895:			if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+18036
INDIRI4
CNSTI4 0
NEI4 $1819
line 2896
;2896:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2897
;2897:			} else {
ADDRGP4 $1820
JUMPV
LABELV $1819
line 2899
;2898:				// if showing yourself
;2899:				if (ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $1822
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
INDIRI4
ADDRGP4 uiInfo+18032
INDIRI4
NEI4 $1822
line 2900
;2900:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2901
;2901:				}
LABELV $1822
line 2902
;2902:			}
LABELV $1820
line 2903
;2903:			flags &= ~UI_SHOW_LEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2904
;2904:		} 
LABELV $1817
line 2905
;2905:		if (flags & UI_SHOW_NOTLEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1829
line 2907
;2906:			// these need to show when this client is assigning their own status or they are NOT the leader
;2907:			if (uiInfo.teamLeader) {
ADDRGP4 uiInfo+18036
INDIRI4
CNSTI4 0
EQI4 $1831
line 2909
;2908:				// if not showing yourself
;2909:				if (!(ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber)) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $1841
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
INDIRI4
ADDRGP4 uiInfo+18032
INDIRI4
EQI4 $1834
LABELV $1841
line 2910
;2910:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2911
;2911:				}
LABELV $1834
line 2913
;2912:				// these need to show when this client can give orders to a player or a group
;2913:			}
LABELV $1831
line 2914
;2914:			flags &= ~UI_SHOW_NOTLEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2915
;2915:		} 
LABELV $1829
line 2916
;2916:		if (flags & UI_SHOW_FAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1842
line 2918
;2917:			// this assumes you only put this type of display flag on something showing in the proper context
;2918:			if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $1844
line 2919
;2919:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2920
;2920:			}
LABELV $1844
line 2921
;2921:			flags &= ~UI_SHOW_FAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2922
;2922:		} 
LABELV $1842
line 2923
;2923:		if (flags & UI_SHOW_NOTFAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1847
line 2925
;2924:			// this assumes you only put this type of display flag on something showing in the proper context
;2925:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $1849
line 2926
;2926:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2927
;2927:			}
LABELV $1849
line 2928
;2928:			flags &= ~UI_SHOW_NOTFAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 2929
;2929:		} 
LABELV $1847
line 2930
;2930:		if (flags & UI_SHOW_ANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1852
line 2931
;2931:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum <= GT_TEAM ) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 5
GTI4 $1854
line 2932
;2932:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2933
;2933:			}
LABELV $1854
line 2934
;2934:			flags &= ~UI_SHOW_ANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2935
;2935:		} 
LABELV $1852
line 2936
;2936:		if (flags & UI_SHOW_ANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1859
line 2937
;2937:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum > GT_TEAM ) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1861
line 2938
;2938:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2939
;2939:			}
LABELV $1861
line 2940
;2940:			flags &= ~UI_SHOW_ANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2941
;2941:		} 
LABELV $1859
line 2942
;2942:		if (flags & UI_SHOW_NETANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1866
line 2943
;2943:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum <= GT_TEAM ) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 5
GTI4 $1868
line 2944
;2944:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2945
;2945:			}
LABELV $1868
line 2946
;2946:			flags &= ~UI_SHOW_NETANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2947
;2947:		} 
LABELV $1866
line 2948
;2948:		if (flags & UI_SHOW_NETANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1873
line 2949
;2949:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum > GT_TEAM ) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1875
line 2950
;2950:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2951
;2951:			}
LABELV $1875
line 2952
;2952:			flags &= ~UI_SHOW_NETANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 2953
;2953:		} 
LABELV $1873
line 2954
;2954:		if (flags & UI_SHOW_NEWHIGHSCORE) {
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1880
line 2955
;2955:			if (uiInfo.newHighScoreTime < uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+11816
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
GEI4 $1882
line 2956
;2956:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2957
;2957:			} else {
ADDRGP4 $1883
JUMPV
LABELV $1882
line 2958
;2958:				if (uiInfo.soundHighScore) {
ADDRGP4 uiInfo+11836
INDIRI4
CNSTI4 0
EQI4 $1886
line 2959
;2959:					if (trap_Cvar_VariableValue("sv_killserver") == 0) {
ADDRGP4 $353
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1889
line 2962
;2960:						// wait on server to go down before playing sound
;2961:						//trap_S_StartLocalSound(uiInfo.newHighScoreSound, CHAN_ANNOUNCER);
;2962:						uiInfo.soundHighScore = qfalse;
ADDRGP4 uiInfo+11836
CNSTI4 0
ASGNI4
line 2963
;2963:					}
LABELV $1889
line 2964
;2964:				}
LABELV $1886
line 2965
;2965:			}
LABELV $1883
line 2966
;2966:			flags &= ~UI_SHOW_NEWHIGHSCORE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 2967
;2967:		} 
LABELV $1880
line 2968
;2968:		if (flags & UI_SHOW_NEWBESTTIME) {
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1892
line 2969
;2969:			if (uiInfo.newBestTime < uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+11820
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
GEI4 $1894
line 2970
;2970:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2971
;2971:			}
LABELV $1894
line 2972
;2972:			flags &= ~UI_SHOW_NEWBESTTIME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 2973
;2973:		} 
LABELV $1892
line 2974
;2974:		if (flags & UI_SHOW_DEMOAVAILABLE) {
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1898
line 2975
;2975:			if (!uiInfo.demoAvailable) {
ADDRGP4 uiInfo+11832
INDIRI4
CNSTI4 0
NEI4 $1900
line 2976
;2976:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2977
;2977:			}
LABELV $1900
line 2978
;2978:			flags &= ~UI_SHOW_DEMOAVAILABLE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 2979
;2979:		} else {
ADDRGP4 $1899
JUMPV
LABELV $1898
line 2980
;2980:			flags = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 2981
;2981:		}
LABELV $1899
line 2982
;2982:	}
LABELV $1805
line 2877
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1804
line 2983
;2983:  return vis;
ADDRLP4 0
INDIRI4
RETI4
LABELV $1803
endproc UI_OwnerDrawVisible 16 4
proc UI_Handicap_HandleKey 20 12
line 2986
;2984:}
;2985:
;2986:static qboolean UI_Handicap_HandleKey(int flags, float *special, int key) {
line 2987
;2987:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $1908
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $1908
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1908
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $1904
LABELV $1908
line 2989
;2988:    int h;
;2989:    h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $695
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2990
;2990:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $1909
line 2991
;2991:	    h -= 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 2992
;2992:		} else {
ADDRGP4 $1910
JUMPV
LABELV $1909
line 2993
;2993:	    h += 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 2994
;2994:		}
LABELV $1910
line 2995
;2995:    if (h > 100) {
ADDRLP4 4
INDIRI4
CNSTI4 100
LEI4 $1911
line 2996
;2996:      h = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 2997
;2997:    } else if (h < 0) {
ADDRGP4 $1912
JUMPV
LABELV $1911
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1913
line 2998
;2998:			h = 100;
ADDRLP4 4
CNSTI4 100
ASGNI4
line 2999
;2999:		}
LABELV $1913
LABELV $1912
line 3000
;3000:  	trap_Cvar_Set( "handicap", va( "%i", h) );
ADDRGP4 $1406
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $695
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3001
;3001:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1903
JUMPV
LABELV $1904
line 3003
;3002:  }
;3003:  return qfalse;
CNSTI4 0
RETI4
LABELV $1903
endproc UI_Handicap_HandleKey 20 12
proc UI_Effects_HandleKey 20 8
line 3006
;3004:}
;3005:
;3006:static qboolean UI_Effects_HandleKey(int flags, float *special, int key) {
line 3007
;3007:	if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $1920
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $1920
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1920
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $1916
LABELV $1920
line 3009
;3008:		
;3009:		if ( !UI_TrueJediEnabled() )
ADDRLP4 4
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1921
line 3010
;3010:		{
line 3011
;3011:			int team = (int)(trap_Cvar_VariableValue("ui_myteam"));
ADDRGP4 $860
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 3013
;3012:					
;3013:			if (team == TEAM_RED || team==TEAM_BLUE)
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $1925
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $1923
LABELV $1925
line 3014
;3014:			{
line 3015
;3015:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1915
JUMPV
LABELV $1923
line 3017
;3016:			}
;3017:		}
LABELV $1921
line 3019
;3018:				
;3019:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $1926
line 3020
;3020:			uiInfo.effectsColor--;
ADDRLP4 8
ADDRGP4 uiInfo+95196
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3021
;3021:		} else {
ADDRGP4 $1927
JUMPV
LABELV $1926
line 3022
;3022:			uiInfo.effectsColor++;
ADDRLP4 8
ADDRGP4 uiInfo+95196
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3023
;3023:		}
LABELV $1927
line 3025
;3024:		
;3025:		if( uiInfo.effectsColor > 5 ) {
ADDRGP4 uiInfo+95196
INDIRI4
CNSTI4 5
LEI4 $1930
line 3026
;3026:			uiInfo.effectsColor = 0;
ADDRGP4 uiInfo+95196
CNSTI4 0
ASGNI4
line 3027
;3027:		} else if (uiInfo.effectsColor < 0) {
ADDRGP4 $1931
JUMPV
LABELV $1930
ADDRGP4 uiInfo+95196
INDIRI4
CNSTI4 0
GEI4 $1934
line 3028
;3028:			uiInfo.effectsColor = 5;
ADDRGP4 uiInfo+95196
CNSTI4 5
ASGNI4
line 3029
;3029:		}
LABELV $1934
LABELV $1931
line 3031
;3030:		
;3031:		trap_Cvar_SetValue( "color1", /*uitogamecode[uiInfo.effectsColor]*/uiInfo.effectsColor );
ADDRGP4 $1938
ARGP4
ADDRGP4 uiInfo+95196
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3032
;3032:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1915
JUMPV
LABELV $1916
line 3034
;3033:	}
;3034:	return qfalse;
CNSTI4 0
RETI4
LABELV $1915
endproc UI_Effects_HandleKey 20 8
proc UI_ClanName_HandleKey 16 8
line 3037
;3035:}
;3036:
;3037:static qboolean UI_ClanName_HandleKey(int flags, float *special, int key) {
line 3038
;3038:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $1945
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $1945
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1945
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $1941
LABELV $1945
line 3040
;3039:    int i;
;3040:    i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3041
;3041:		if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1946
line 3042
;3042:		  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 3043
;3043:			uiInfo.teamList[i].cinematic = -1;
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
CNSTI4 -1
ASGNI4
line 3044
;3044:		}
LABELV $1946
line 3045
;3045:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $1954
line 3046
;3046:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3047
;3047:		} else {
ADDRGP4 $1955
JUMPV
LABELV $1954
line 3048
;3048:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3049
;3049:		}
LABELV $1955
line 3050
;3050:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $1956
line 3051
;3051:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3052
;3052:    } else if (i < 0) {
ADDRGP4 $1957
JUMPV
LABELV $1956
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1959
line 3053
;3053:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+14156
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3054
;3054:		}
LABELV $1959
LABELV $1957
line 3055
;3055:  	trap_Cvar_Set( "ui_teamName", uiInfo.teamList[i].teamName);
ADDRGP4 $697
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3056
;3056:	UI_HeadCountByTeam();
ADDRGP4 UI_HeadCountByTeam
CALLI4
pop
line 3057
;3057:	UI_FeederSelection(FEEDER_HEADS, 0);
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLI4
pop
line 3058
;3058:	updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 3059
;3059:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1940
JUMPV
LABELV $1941
line 3061
;3060:  }
;3061:  return qfalse;
CNSTI4 0
RETI4
LABELV $1940
endproc UI_ClanName_HandleKey 16 8
proc UI_GameType_HandleKey 24 16
line 3064
;3062:}
;3063:
;3064:static qboolean UI_GameType_HandleKey(int flags, float *special, int key, qboolean resetMap) {
line 3065
;3065:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $1968
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $1968
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1968
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $1964
LABELV $1968
line 3066
;3066:		int oldCount = UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 3069
;3067:
;3068:		// hard coded mess here
;3069:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $1969
line 3070
;3070:			ui_gameType.integer--;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3071
;3071:			if (ui_gameType.integer == 2) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $1972
line 3072
;3072:				ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 3073
;3073:			} else if (ui_gameType.integer < 2) {
ADDRGP4 $1970
JUMPV
LABELV $1972
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
GEI4 $1970
line 3074
;3074:				ui_gameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_gameType+12
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3075
;3075:			}
line 3076
;3076:		} else {
ADDRGP4 $1970
JUMPV
LABELV $1969
line 3077
;3077:			ui_gameType.integer++;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3078
;3078:			if (ui_gameType.integer >= uiInfo.numGameTypes) {
ADDRGP4 ui_gameType+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
LTI4 $1982
line 3079
;3079:				ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 3080
;3080:			} else if (ui_gameType.integer == 2) {
ADDRGP4 $1983
JUMPV
LABELV $1982
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $1987
line 3081
;3081:				ui_gameType.integer = 3;
ADDRGP4 ui_gameType+12
CNSTI4 3
ASGNI4
line 3082
;3082:			}
LABELV $1987
LABELV $1983
line 3083
;3083:		}
LABELV $1970
line 3085
;3084:    
;3085:		if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_TOURNAMENT) {
ADDRLP4 12
CNSTI4 3
ASGNI4
ADDRGP4 ui_gameType+12
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1991
line 3086
;3086:			trap_Cvar_Set("ui_Q3Model", "1");
ADDRGP4 $1996
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3087
;3087:		} else {
ADDRGP4 $1992
JUMPV
LABELV $1991
line 3088
;3088:			trap_Cvar_Set("ui_Q3Model", "0");
ADDRGP4 $1996
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3089
;3089:		}
LABELV $1992
line 3091
;3090:
;3091:		trap_Cvar_Set("ui_gameType", va("%d", ui_gameType.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1997
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3092
;3092:		UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 3093
;3093:		UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 3094
;3094:		if (resetMap && oldCount != UI_MapCountByGameType(qtrue)) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2005
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2005
line 3095
;3095:	  	trap_Cvar_Set( "ui_currentMap", "0");
ADDRGP4 $983
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3096
;3096:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3097
;3097:		}
LABELV $2005
line 3098
;3098:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1963
JUMPV
LABELV $1964
line 3100
;3099:  }
;3100:  return qfalse;
CNSTI4 0
RETI4
LABELV $1963
endproc UI_GameType_HandleKey 24 16
proc UI_NetGameType_HandleKey 12 16
line 3103
;3101:}
;3102:
;3103:static qboolean UI_NetGameType_HandleKey(int flags, float *special, int key) {
line 3104
;3104:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2012
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2012
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2012
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2008
LABELV $2012
line 3106
;3105:
;3106:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2013
line 3107
;3107:			ui_netGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3108
;3108:		} else {
ADDRGP4 $2014
JUMPV
LABELV $2013
line 3109
;3109:			ui_netGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3110
;3110:		}
LABELV $2014
line 3112
;3111:
;3112:    if (ui_netGameType.integer < 0) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
GEI4 $2017
line 3113
;3113:      ui_netGameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_netGameType+12
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3114
;3114:		} else if (ui_netGameType.integer >= uiInfo.numGameTypes) {
ADDRGP4 $2018
JUMPV
LABELV $2017
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
LTI4 $2022
line 3115
;3115:      ui_netGameType.integer = 0;
ADDRGP4 ui_netGameType+12
CNSTI4 0
ASGNI4
line 3116
;3116:    } 
LABELV $2022
LABELV $2018
line 3118
;3117:
;3118:  	trap_Cvar_Set( "ui_netGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $716
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3119
;3119:  	trap_Cvar_Set( "ui_actualnetGameType", va("%d", uiInfo.gameTypes[ui_netGameType.integer].gtEnum));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2028
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3120
;3120:  	trap_Cvar_Set( "ui_currentNetMap", "0");
ADDRGP4 $981
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3121
;3121:		UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3122
;3122:		Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3123
;3123:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2007
JUMPV
LABELV $2008
line 3125
;3124:  }
;3125:  return qfalse;
CNSTI4 0
RETI4
LABELV $2007
endproc UI_NetGameType_HandleKey 12 16
proc UI_AutoSwitch_HandleKey 16 8
line 3128
;3126:}
;3127:
;3128:static qboolean UI_AutoSwitch_HandleKey(int flags, float *special, int key) {
line 3129
;3129:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2037
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2037
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2037
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2033
LABELV $2037
line 3130
;3130:	 int switchVal = trap_Cvar_VariableValue("cg_autoswitch");
ADDRGP4 $721
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 3132
;3131:
;3132:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2038
line 3133
;3133:			switchVal--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3134
;3134:		} else {
ADDRGP4 $2039
JUMPV
LABELV $2038
line 3135
;3135:			switchVal++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3136
;3136:		}
LABELV $2039
line 3138
;3137:
;3138:    if (switchVal < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2040
line 3139
;3139:	{
line 3140
;3140:		switchVal = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 3141
;3141:	}
ADDRGP4 $2041
JUMPV
LABELV $2040
line 3142
;3142:	else if (switchVal >= 3)
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $2042
line 3143
;3143:	{
line 3144
;3144:      switchVal = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3145
;3145:    } 
LABELV $2042
LABELV $2041
line 3147
;3146:
;3147:  	trap_Cvar_Set( "cg_autoswitch", va("%i", switchVal));
ADDRGP4 $1406
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $721
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3148
;3148:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2032
JUMPV
LABELV $2033
line 3150
;3149:  }
;3150:  return qfalse;
CNSTI4 0
RETI4
LABELV $2032
endproc UI_AutoSwitch_HandleKey 16 8
proc UI_JoinGameType_HandleKey 8 8
line 3153
;3151:}
;3152:
;3153:static qboolean UI_JoinGameType_HandleKey(int flags, float *special, int key) {
line 3154
;3154:	if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2049
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2049
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2049
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2045
LABELV $2049
line 3156
;3155:
;3156:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2050
line 3157
;3157:			ui_joinGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3158
;3158:		} else {
ADDRGP4 $2051
JUMPV
LABELV $2050
line 3159
;3159:			ui_joinGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3160
;3160:		}
LABELV $2051
line 3162
;3161:
;3162:		if (ui_joinGameType.integer < 0) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
GEI4 $2054
line 3163
;3163:			ui_joinGameType.integer = uiInfo.numJoinGameTypes - 1;
ADDRGP4 ui_joinGameType+12
ADDRGP4 uiInfo+17876
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3164
;3164:		} else if (ui_joinGameType.integer >= uiInfo.numJoinGameTypes) {
ADDRGP4 $2055
JUMPV
LABELV $2054
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+17876
INDIRI4
LTI4 $2059
line 3165
;3165:			ui_joinGameType.integer = 0;
ADDRGP4 ui_joinGameType+12
CNSTI4 0
ASGNI4
line 3166
;3166:		}
LABELV $2059
LABELV $2055
line 3168
;3167:
;3168:		trap_Cvar_Set( "ui_joinGameType", va("%d", ui_joinGameType.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $740
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3169
;3169:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3170
;3170:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2044
JUMPV
LABELV $2045
line 3172
;3171:	}
;3172:	return qfalse;
CNSTI4 0
RETI4
LABELV $2044
endproc UI_JoinGameType_HandleKey 8 8
proc UI_Skill_HandleKey 16 8
line 3177
;3173:}
;3174:
;3175:
;3176:
;3177:static qboolean UI_Skill_HandleKey(int flags, float *special, int key) {
line 3178
;3178:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2070
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2070
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2070
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2066
LABELV $2070
line 3179
;3179:  	int i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 3181
;3180:
;3181:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2071
line 3182
;3182:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3183
;3183:		} else {
ADDRGP4 $2072
JUMPV
LABELV $2071
line 3184
;3184:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3185
;3185:		}
LABELV $2072
line 3187
;3186:
;3187:    if (i < 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $2073
line 3188
;3188:			i = numSkillLevels;
ADDRLP4 4
ADDRGP4 numSkillLevels
INDIRI4
ASGNI4
line 3189
;3189:		} else if (i > numSkillLevels) {
ADDRGP4 $2074
JUMPV
LABELV $2073
ADDRLP4 4
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $2075
line 3190
;3190:      i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3191
;3191:    }
LABELV $2075
LABELV $2074
line 3193
;3192:
;3193:    trap_Cvar_Set("g_spSkill", va("%i", i));
ADDRGP4 $1406
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $826
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3194
;3194:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2065
JUMPV
LABELV $2066
line 3196
;3195:  }
;3196:  return qfalse;
CNSTI4 0
RETI4
LABELV $2065
endproc UI_Skill_HandleKey 16 8
proc UI_TeamName_HandleKey 24 8
line 3200
;3197:}
;3198:
;3199:
;3200:static qboolean UI_TeamName_HandleKey(int flags, float *special, int key, qboolean blue) {
line 3201
;3201:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2082
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2082
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2082
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2078
LABELV $2082
line 3203
;3202:    int i;
;3203:    i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2084
ADDRLP4 8
ADDRGP4 $926
ASGNP4
ADDRGP4 $2085
JUMPV
LABELV $2084
ADDRLP4 8
ADDRGP4 $927
ASGNP4
LABELV $2085
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 3205
;3204:
;3205:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2086
line 3206
;3206:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3207
;3207:		} else {
ADDRGP4 $2087
JUMPV
LABELV $2086
line 3208
;3208:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3209
;3209:		}
LABELV $2087
line 3211
;3210:
;3211:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $2088
line 3212
;3212:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3213
;3213:    } else if (i < 0) {
ADDRGP4 $2089
JUMPV
LABELV $2088
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2091
line 3214
;3214:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+14156
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3215
;3215:		}
LABELV $2091
LABELV $2089
line 3217
;3216:
;3217:    trap_Cvar_Set( (blue) ? "ui_blueTeam" : "ui_redTeam", uiInfo.teamList[i].teamName);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2096
ADDRLP4 20
ADDRGP4 $926
ASGNP4
ADDRGP4 $2097
JUMPV
LABELV $2096
ADDRLP4 20
ADDRGP4 $927
ASGNP4
LABELV $2097
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3219
;3218:
;3219:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2077
JUMPV
LABELV $2078
line 3221
;3220:  }
;3221:  return qfalse;
CNSTI4 0
RETI4
LABELV $2077
endproc UI_TeamName_HandleKey 24 8
proc UI_TeamMember_HandleKey 44 8
line 3224
;3222:}
;3223:
;3224:static qboolean UI_TeamMember_HandleKey(int flags, float *special, int key, qboolean blue, int num) {
line 3225
;3225:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2103
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2103
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2103
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2099
LABELV $2103
line 3229
;3226:		// 0 - None
;3227:		// 1 - Human
;3228:		// 2..NumCharacters - Bot
;3229:		char *cvar = va(blue ? "ui_blueteam%i" : "ui_redteam%i", num);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2105
ADDRLP4 20
ADDRGP4 $942
ASGNP4
ADDRGP4 $2106
JUMPV
LABELV $2105
ADDRLP4 20
ADDRGP4 $943
ASGNP4
LABELV $2106
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 3230
;3230:		int value = trap_Cvar_VariableValue(cvar);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 3231
;3231:		int maxcl = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $947
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 3232
;3232:		int numval = num;
ADDRLP4 8
ADDRFP4 16
INDIRI4
ASGNI4
line 3234
;3233:
;3234:		numval *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3236
;3235:
;3236:		if (blue)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2107
line 3237
;3237:		{
line 3238
;3238:			numval -= 1;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3239
;3239:		}
LABELV $2107
line 3241
;3240:
;3241:		if (numval > maxcl)
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $2109
line 3242
;3242:		{
line 3243
;3243:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2098
JUMPV
LABELV $2109
line 3246
;3244:		}
;3245:
;3246:		if (value < 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $2111
line 3247
;3247:		{
line 3248
;3248:			value = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3249
;3249:		}
LABELV $2111
line 3251
;3250:
;3251:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2113
line 3252
;3252:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3253
;3253:		} else {
ADDRGP4 $2114
JUMPV
LABELV $2113
line 3254
;3254:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3255
;3255:		}
LABELV $2114
line 3264
;3256:
;3257:		/*if (ui_actualNetGameType.integer >= GT_TEAM) {
;3258:			if (value >= uiInfo.characterCount + 2) {
;3259:				value = 0;
;3260:			} else if (value < 0) {
;3261:				value = uiInfo.characterCount + 2 - 1;
;3262:			}
;3263:		} else {*/
;3264:			if (value >= UI_GetNumBots() + 2) {
ADDRLP4 36
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2115
line 3265
;3265:				value = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3266
;3266:			} else if (value < 1) {
ADDRGP4 $2116
JUMPV
LABELV $2115
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $2117
line 3267
;3267:				value = UI_GetNumBots() + 2 - 1;
ADDRLP4 40
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 3268
;3268:			}
LABELV $2117
LABELV $2116
line 3271
;3269:		//}
;3270:
;3271:		trap_Cvar_Set(cvar, va("%i", value));
ADDRGP4 $1406
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3272
;3272:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2098
JUMPV
LABELV $2099
line 3274
;3273:  }
;3274:  return qfalse;
CNSTI4 0
RETI4
LABELV $2098
endproc UI_TeamMember_HandleKey 44 8
proc UI_NetSource_HandleKey 8 8
line 3277
;3275:}
;3276:
;3277:static qboolean UI_NetSource_HandleKey(int flags, float *special, int key) {
line 3278
;3278:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2124
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2124
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2124
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2120
LABELV $2124
line 3280
;3279:		
;3280:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2125
line 3281
;3281:			ui_netSource.integer--;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3282
;3282:		} else {
ADDRGP4 $2126
JUMPV
LABELV $2125
line 3283
;3283:			ui_netSource.integer++;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3284
;3284:		}
LABELV $2126
line 3286
;3285:    
;3286:		if (ui_netSource.integer >= numNetSources) {
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LTI4 $2129
line 3287
;3287:      ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 3288
;3288:    } else if (ui_netSource.integer < 0) {
ADDRGP4 $2130
JUMPV
LABELV $2129
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
GEI4 $2133
line 3289
;3289:      ui_netSource.integer = numNetSources - 1;
ADDRGP4 ui_netSource+12
ADDRGP4 numNetSources
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3290
;3290:		}
LABELV $2133
LABELV $2130
line 3292
;3291:
;3292:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3293
;3293:		if (ui_netSource.integer != AS_GLOBAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
EQI4 $2137
line 3294
;3294:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 3295
;3295:		}
LABELV $2137
line 3296
;3296:  	trap_Cvar_Set( "ui_netSource", va("%d", ui_netSource.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2140
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3297
;3297:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2119
JUMPV
LABELV $2120
line 3299
;3298:  }
;3299:  return qfalse;
CNSTI4 0
RETI4
LABELV $2119
endproc UI_NetSource_HandleKey 8 8
proc UI_NetFilter_HandleKey 8 4
line 3302
;3300:}
;3301:
;3302:static qboolean UI_NetFilter_HandleKey(int flags, float *special, int key) {
line 3303
;3303:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2147
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2147
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2147
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2143
LABELV $2147
line 3305
;3304:
;3305:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2148
line 3306
;3306:			ui_serverFilterType.integer--;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3307
;3307:		} else {
ADDRGP4 $2149
JUMPV
LABELV $2148
line 3308
;3308:			ui_serverFilterType.integer++;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3309
;3309:		}
LABELV $2149
line 3311
;3310:
;3311:    if (ui_serverFilterType.integer >= numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LTI4 $2152
line 3312
;3312:      ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 3313
;3313:    } else if (ui_serverFilterType.integer < 0) {
ADDRGP4 $2153
JUMPV
LABELV $2152
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
GEI4 $2156
line 3314
;3314:      ui_serverFilterType.integer = numServerFilters - 1;
ADDRGP4 ui_serverFilterType+12
ADDRGP4 numServerFilters
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3315
;3315:		}
LABELV $2156
LABELV $2153
line 3316
;3316:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3317
;3317:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2142
JUMPV
LABELV $2143
line 3319
;3318:  }
;3319:  return qfalse;
CNSTI4 0
RETI4
LABELV $2142
endproc UI_NetFilter_HandleKey 8 4
proc UI_OpponentName_HandleKey 4 0
line 3322
;3320:}
;3321:
;3322:static qboolean UI_OpponentName_HandleKey(int flags, float *special, int key) {
line 3323
;3323:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2165
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2165
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2165
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2161
LABELV $2165
line 3324
;3324:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2166
line 3325
;3325:			UI_PriorOpponent();
ADDRGP4 UI_PriorOpponent
CALLV
pop
line 3326
;3326:		} else {
ADDRGP4 $2167
JUMPV
LABELV $2166
line 3327
;3327:			UI_NextOpponent();
ADDRGP4 UI_NextOpponent
CALLV
pop
line 3328
;3328:		}
LABELV $2167
line 3329
;3329:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2160
JUMPV
LABELV $2161
line 3331
;3330:  }
;3331:  return qfalse;
CNSTI4 0
RETI4
LABELV $2160
endproc UI_OpponentName_HandleKey 4 0
proc UI_BotName_HandleKey 16 0
line 3334
;3332:}
;3333:
;3334:static qboolean UI_BotName_HandleKey(int flags, float *special, int key) {
line 3335
;3335:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2173
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2173
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2173
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2169
LABELV $2173
line 3337
;3336://		int game = trap_Cvar_VariableValue("g_gametype");
;3337:		int value = uiInfo.botIndex;
ADDRLP4 4
ADDRGP4 uiInfo+11844
INDIRI4
ASGNI4
line 3339
;3338:
;3339:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2175
line 3340
;3340:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3341
;3341:		} else {
ADDRGP4 $2176
JUMPV
LABELV $2175
line 3342
;3342:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3343
;3343:		}
LABELV $2176
line 3354
;3344:
;3345:		/*
;3346:		if (game >= GT_TEAM) {
;3347:			if (value >= uiInfo.characterCount + 2) {
;3348:				value = 0;
;3349:			} else if (value < 0) {
;3350:				value = uiInfo.characterCount + 2 - 1;
;3351:			}
;3352:		} else {
;3353:		*/
;3354:			if (value >= UI_GetNumBots()/* + 2*/) {
ADDRLP4 8
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2177
line 3355
;3355:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3356
;3356:			} else if (value < 0) {
ADDRGP4 $2178
JUMPV
LABELV $2177
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2179
line 3357
;3357:				value = UI_GetNumBots()/* + 2*/ - 1;
ADDRLP4 12
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3358
;3358:			}
LABELV $2179
LABELV $2178
line 3360
;3359:		//}
;3360:		uiInfo.botIndex = value;
ADDRGP4 uiInfo+11844
ADDRLP4 4
INDIRI4
ASGNI4
line 3361
;3361:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2169
line 3363
;3362:  }
;3363:  return qfalse;
CNSTI4 0
RETI4
LABELV $2168
endproc UI_BotName_HandleKey 16 0
proc UI_BotSkill_HandleKey 8 0
line 3366
;3364:}
;3365:
;3366:static qboolean UI_BotSkill_HandleKey(int flags, float *special, int key) {
line 3367
;3367:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2187
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2187
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2187
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2183
LABELV $2187
line 3368
;3368:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2188
line 3369
;3369:			uiInfo.skillIndex--;
ADDRLP4 4
ADDRGP4 uiInfo+33792
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3370
;3370:		} else {
ADDRGP4 $2189
JUMPV
LABELV $2188
line 3371
;3371:			uiInfo.skillIndex++;
ADDRLP4 4
ADDRGP4 uiInfo+33792
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3372
;3372:		}
LABELV $2189
line 3373
;3373:		if (uiInfo.skillIndex >= numSkillLevels) {
ADDRGP4 uiInfo+33792
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LTI4 $2192
line 3374
;3374:			uiInfo.skillIndex = 0;
ADDRGP4 uiInfo+33792
CNSTI4 0
ASGNI4
line 3375
;3375:		} else if (uiInfo.skillIndex < 0) {
ADDRGP4 $2193
JUMPV
LABELV $2192
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 0
GEI4 $2196
line 3376
;3376:			uiInfo.skillIndex = numSkillLevels-1;
ADDRGP4 uiInfo+33792
ADDRGP4 numSkillLevels
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3377
;3377:		}
LABELV $2196
LABELV $2193
line 3378
;3378:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2182
JUMPV
LABELV $2183
line 3380
;3379:  }
;3380:	return qfalse;
CNSTI4 0
RETI4
LABELV $2182
endproc UI_BotSkill_HandleKey 8 0
proc UI_RedBlue_HandleKey 8 0
line 3383
;3381:}
;3382:
;3383:static qboolean UI_RedBlue_HandleKey(int flags, float *special, int key) {
line 3384
;3384:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2205
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2205
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2205
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2201
LABELV $2205
line 3385
;3385:		uiInfo.redBlue ^= 1;
ADDRLP4 4
ADDRGP4 uiInfo+18008
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 3386
;3386:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2200
JUMPV
LABELV $2201
line 3388
;3387:	}
;3388:	return qfalse;
CNSTI4 0
RETI4
LABELV $2200
endproc UI_RedBlue_HandleKey 8 0
proc UI_Crosshair_HandleKey 8 8
line 3391
;3389:}
;3390:
;3391:static qboolean UI_Crosshair_HandleKey(int flags, float *special, int key) {
line 3392
;3392:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2212
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2212
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2212
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2208
LABELV $2212
line 3393
;3393:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2213
line 3394
;3394:			uiInfo.currentCrosshair--;
ADDRLP4 4
ADDRGP4 uiInfo+60856
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3395
;3395:		} else {
ADDRGP4 $2214
JUMPV
LABELV $2213
line 3396
;3396:			uiInfo.currentCrosshair++;
ADDRLP4 4
ADDRGP4 uiInfo+60856
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3397
;3397:		}
LABELV $2214
line 3399
;3398:
;3399:		if (uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 10
LTI4 $2217
line 3400
;3400:			uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+60856
CNSTI4 0
ASGNI4
line 3401
;3401:		} else if (uiInfo.currentCrosshair < 0) {
ADDRGP4 $2218
JUMPV
LABELV $2217
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 0
GEI4 $2221
line 3402
;3402:			uiInfo.currentCrosshair = NUM_CROSSHAIRS - 1;
ADDRGP4 uiInfo+60856
CNSTI4 9
ASGNI4
line 3403
;3403:		}
LABELV $2221
LABELV $2218
line 3404
;3404:		trap_Cvar_Set("cg_drawCrosshair", va("%d", uiInfo.currentCrosshair)); 
ADDRGP4 $702
ARGP4
ADDRGP4 uiInfo+60856
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2225
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3405
;3405:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2207
JUMPV
LABELV $2208
line 3407
;3406:	}
;3407:	return qfalse;
CNSTI4 0
RETI4
LABELV $2207
endproc UI_Crosshair_HandleKey 8 8
proc UI_SelectedPlayer_HandleKey 16 8
line 3412
;3408:}
;3409:
;3410:
;3411:
;3412:static qboolean UI_SelectedPlayer_HandleKey(int flags, float *special, int key) {
line 3413
;3413:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2232
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2232
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2232
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2228
LABELV $2232
line 3416
;3414:		int selected;
;3415:
;3416:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 3417
;3417:		if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+18036
INDIRI4
CNSTI4 0
NEI4 $2233
line 3418
;3418:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2227
JUMPV
LABELV $2233
line 3420
;3419:		}
;3420:		selected = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 3422
;3421:		
;3422:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2236
line 3423
;3423:			selected--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3424
;3424:		} else {
ADDRGP4 $2237
JUMPV
LABELV $2236
line 3425
;3425:			selected++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3426
;3426:		}
LABELV $2237
line 3428
;3427:
;3428:		if (selected > uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
LEI4 $2238
line 3429
;3429:			selected = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3430
;3430:		} else if (selected < 0) {
ADDRGP4 $2239
JUMPV
LABELV $2238
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2241
line 3431
;3431:			selected = uiInfo.myTeamCount;
ADDRLP4 4
ADDRGP4 uiInfo+18016
INDIRI4
ASGNI4
line 3432
;3432:		}
LABELV $2241
LABELV $2239
line 3434
;3433:
;3434:		if (selected == uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
NEI4 $2244
line 3435
;3435:		 	trap_Cvar_Set( "cg_selectedPlayerName", "Everyone");
ADDRGP4 $1553
ARGP4
ADDRGP4 $1555
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3436
;3436:		} else {
ADDRGP4 $2245
JUMPV
LABELV $2244
line 3437
;3437:		 	trap_Cvar_Set( "cg_selectedPlayerName", uiInfo.teamNames[selected]);
ADDRGP4 $1553
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3438
;3438:		}
LABELV $2245
line 3439
;3439:	 	trap_Cvar_Set( "cg_selectedPlayer", va("%d", selected));
ADDRGP4 $702
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1545
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3440
;3440:	}
LABELV $2228
line 3441
;3441:	return qfalse;
CNSTI4 0
RETI4
LABELV $2227
endproc UI_SelectedPlayer_HandleKey 16 8
proc UI_OwnerDrawHandleKey 80 28
line 3445
;3442:}
;3443:
;3444:
;3445:static qboolean UI_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
line 3446
;3446:	int findex, iUse = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3448
;3447:
;3448:  switch (ownerDraw) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 200
LTI4 $2250
ADDRLP4 8
INDIRI4
CNSTI4 289
GTI4 $2250
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2281-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2281
address $2251
address $2258
address $2250
address $2259
address $2250
address $2260
address $2250
address $2264
address $2265
address $2266
address $2267
address $2267
address $2267
address $2267
address $2267
address $2270
address $2270
address $2270
address $2270
address $2270
address $2273
address $2250
address $2274
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2275
address $2250
address $2276
address $2277
address $2278
address $2279
address $2280
address $2250
address $2261
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2263
address $2250
address $2250
address $2250
address $2253
address $2250
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2250
address $2250
address $2262
address $2267
address $2267
address $2267
address $2270
address $2270
address $2270
address $2255
address $2252
address $2250
address $2254
code
LABELV $2251
line 3450
;3449:    case UI_HANDICAP:
;3450:      return UI_Handicap_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_Handicap_HandleKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3451
;3451:      break;
LABELV $2252
line 3453
;3452:    case UI_SKIN_COLOR:
;3453:      return UI_SkinColor_HandleKey(flags, special, key, uiSkinColor, TEAM_FREE, TEAM_BLUE, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiSkinColor
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_SkinColor_HandleKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3454
;3454:      break;
LABELV $2253
line 3456
;3455:    case UI_FORCE_SIDE:
;3456:      return UI_ForceSide_HandleKey(flags, special, key, uiForceSide, 1, 2, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiForceSide
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 2
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_ForceSide_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3457
;3457:      break;
LABELV $2254
line 3459
;3458:    case UI_JEDI_NONJEDI:
;3459:      return UI_JediNonJedi_HandleKey(flags, special, key, uiJediNonJedi, 0, 1, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiJediNonJedi
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_JediNonJedi_HandleKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3460
;3460:      break;
LABELV $2255
line 3462
;3461:	case UI_FORCE_MASTERY_SET:
;3462:      return UI_ForceMaxRank_HandleKey(flags, special, key, uiForceRank, 1, MAX_FORCE_RANK, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiForceRank
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 7
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_ForceMaxRank_HandleKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3463
;3463:      break;
line 3465
;3464:    case UI_FORCE_RANK:
;3465:		break;		
LABELV $2257
line 3484
;3466:	case UI_FORCE_RANK_HEAL:
;3467:	case UI_FORCE_RANK_LEVITATION:
;3468:	case UI_FORCE_RANK_SPEED:
;3469:	case UI_FORCE_RANK_PUSH:
;3470:	case UI_FORCE_RANK_PULL:
;3471:	case UI_FORCE_RANK_TELEPATHY:
;3472:	case UI_FORCE_RANK_GRIP:
;3473:	case UI_FORCE_RANK_LIGHTNING:
;3474:	case UI_FORCE_RANK_RAGE:
;3475:	case UI_FORCE_RANK_PROTECT:
;3476:	case UI_FORCE_RANK_ABSORB:
;3477:	case UI_FORCE_RANK_TEAM_HEAL:
;3478:	case UI_FORCE_RANK_TEAM_FORCE:
;3479:	case UI_FORCE_RANK_DRAIN:
;3480:	case UI_FORCE_RANK_SEE:
;3481:	case UI_FORCE_RANK_SABERATTACK:
;3482:	case UI_FORCE_RANK_SABERDEFEND:
;3483:	case UI_FORCE_RANK_SABERTHROW:
;3484:		findex = (ownerDraw - UI_FORCE_RANK)-1;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 258
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 3486
;3485:		//this will give us the index as long as UI_FORCE_RANK is always one below the first force rank index
;3486:		return UI_ForcePowerRank_HandleKey(flags, special, key, uiForcePowersRank[findex], 0, NUM_FORCE_POWER_LEVELS-1, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 UI_ForcePowerRank_HandleKey
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3487
;3487:		break;
LABELV $2258
line 3489
;3488:    case UI_EFFECTS:
;3489:      return UI_Effects_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_Effects_HandleKey
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3490
;3490:      break;
LABELV $2259
line 3492
;3491:    case UI_CLANNAME:
;3492:      return UI_ClanName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 UI_ClanName_HandleKey
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3493
;3493:      break;
LABELV $2260
line 3495
;3494:    case UI_GAMETYPE:
;3495:      return UI_GameType_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 44
ADDRGP4 UI_GameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3496
;3496:      break;
LABELV $2261
line 3498
;3497:    case UI_NETGAMETYPE:
;3498:      return UI_NetGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 UI_NetGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3499
;3499:      break;
LABELV $2262
line 3501
;3500:    case UI_AUTOSWITCHLIST:
;3501:      return UI_AutoSwitch_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 UI_AutoSwitch_HandleKey
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3502
;3502:      break;
LABELV $2263
line 3504
;3503:    case UI_JOINGAMETYPE:
;3504:      return UI_JoinGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 UI_JoinGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3505
;3505:      break;
LABELV $2264
line 3507
;3506:    case UI_SKILL:
;3507:      return UI_Skill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 UI_Skill_HandleKey
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3508
;3508:      break;
LABELV $2265
line 3510
;3509:    case UI_BLUETEAMNAME:
;3510:      return UI_TeamName_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3511
;3511:      break;
LABELV $2266
line 3513
;3512:    case UI_REDTEAMNAME:
;3513:      return UI_TeamName_HandleKey(flags, special, key, qfalse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 68
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3514
;3514:      break;
LABELV $2267
line 3523
;3515:    case UI_BLUETEAM1:
;3516:		case UI_BLUETEAM2:
;3517:		case UI_BLUETEAM3:
;3518:		case UI_BLUETEAM4:
;3519:		case UI_BLUETEAM5:
;3520:		case UI_BLUETEAM6:
;3521:		case UI_BLUETEAM7:
;3522:		case UI_BLUETEAM8:
;3523:	if (ownerDraw <= UI_BLUETEAM5)
ADDRFP4 0
INDIRI4
CNSTI4 214
GTI4 $2268
line 3524
;3524:	{
line 3525
;3525:	  iUse = ownerDraw-UI_BLUETEAM1 + 1;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 3526
;3526:	}
ADDRGP4 $2269
JUMPV
LABELV $2268
line 3528
;3527:	else
;3528:	{
line 3529
;3529:	  iUse = ownerDraw-274; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 274
SUBI4
ASGNI4
line 3530
;3530:	}
LABELV $2269
line 3532
;3531:
;3532:      UI_TeamMember_HandleKey(flags, special, key, qtrue, iUse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 3533
;3533:      break;
ADDRGP4 $2250
JUMPV
LABELV $2270
line 3542
;3534:    case UI_REDTEAM1:
;3535:		case UI_REDTEAM2:
;3536:		case UI_REDTEAM3:
;3537:		case UI_REDTEAM4:
;3538:		case UI_REDTEAM5:
;3539:		case UI_REDTEAM6:
;3540:		case UI_REDTEAM7:
;3541:		case UI_REDTEAM8:
;3542:	if (ownerDraw <= UI_REDTEAM5)
ADDRFP4 0
INDIRI4
CNSTI4 219
GTI4 $2271
line 3543
;3543:	{
line 3544
;3544:	  iUse = ownerDraw-UI_REDTEAM1 + 1;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 3545
;3545:	}
ADDRGP4 $2272
JUMPV
LABELV $2271
line 3547
;3546:	else
;3547:	{
line 3548
;3548:	  iUse = ownerDraw-277; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 277
SUBI4
ASGNI4
line 3549
;3549:	}
LABELV $2272
line 3550
;3550:      UI_TeamMember_HandleKey(flags, special, key, qfalse, iUse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 3551
;3551:      break;
ADDRGP4 $2250
JUMPV
LABELV $2273
line 3553
;3552:		case UI_NETSOURCE:
;3553:      UI_NetSource_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetSource_HandleKey
CALLI4
pop
line 3554
;3554:			break;
ADDRGP4 $2250
JUMPV
LABELV $2274
line 3556
;3555:		case UI_NETFILTER:
;3556:      UI_NetFilter_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetFilter_HandleKey
CALLI4
pop
line 3557
;3557:			break;
ADDRGP4 $2250
JUMPV
LABELV $2275
line 3559
;3558:		case UI_OPPONENT_NAME:
;3559:			UI_OpponentName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_OpponentName_HandleKey
CALLI4
pop
line 3560
;3560:			break;
ADDRGP4 $2250
JUMPV
LABELV $2276
line 3562
;3561:		case UI_BOTNAME:
;3562:			return UI_BotName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 UI_BotName_HandleKey
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3563
;3563:			break;
LABELV $2277
line 3565
;3564:		case UI_BOTSKILL:
;3565:			return UI_BotSkill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 UI_BotSkill_HandleKey
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3566
;3566:			break;
LABELV $2278
line 3568
;3567:		case UI_REDBLUE:
;3568:			UI_RedBlue_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_RedBlue_HandleKey
CALLI4
pop
line 3569
;3569:			break;
ADDRGP4 $2250
JUMPV
LABELV $2279
line 3571
;3570:		case UI_CROSSHAIR:
;3571:			UI_Crosshair_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_Crosshair_HandleKey
CALLI4
pop
line 3572
;3572:			break;
ADDRGP4 $2250
JUMPV
LABELV $2280
line 3574
;3573:		case UI_SELECTEDPLAYER:
;3574:			UI_SelectedPlayer_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_SelectedPlayer_HandleKey
CALLI4
pop
line 3575
;3575:			break;
line 3577
;3576:    default:
;3577:      break;
LABELV $2250
line 3580
;3578:  }
;3579:
;3580:  return qfalse;
CNSTI4 0
RETI4
LABELV $2248
endproc UI_OwnerDrawHandleKey 80 28
proc UI_GetValue 0 0
line 3584
;3581:}
;3582:
;3583:
;3584:static float UI_GetValue(int ownerDraw) {
line 3585
;3585:  return 0;
CNSTF4 0
RETF4
LABELV $2283
endproc UI_GetValue 0 0
proc UI_ServersQsortCompare 4 20
line 3593
;3586:}
;3587:
;3588:/*
;3589:=================
;3590:UI_ServersQsortCompare
;3591:=================
;3592:*/
;3593:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 ) {
line 3594
;3594:	return trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey, uiInfo.serverStatus.sortDir, *(int*)arg1, *(int*)arg2);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2284
endproc UI_ServersQsortCompare 4 20
export UI_ServersSort
proc UI_ServersSort 0 16
line 3603
;3595:}
;3596:
;3597:
;3598:/*
;3599:=================
;3600:UI_ServersSort
;3601:=================
;3602:*/
;3603:void UI_ServersSort(int column, qboolean force) {
line 3605
;3604:
;3605:	if ( !force ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2291
line 3606
;3606:		if ( uiInfo.serverStatus.sortKey == column ) {
ADDRGP4 uiInfo+40740+2200
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2293
line 3607
;3607:			return;
ADDRGP4 $2290
JUMPV
LABELV $2293
line 3609
;3608:		}
;3609:	}
LABELV $2291
line 3611
;3610:
;3611:	uiInfo.serverStatus.sortKey = column;
ADDRGP4 uiInfo+40740+2200
ADDRFP4 0
INDIRI4
ASGNI4
line 3612
;3612:	qsort( &uiInfo.serverStatus.displayServers[0], uiInfo.serverStatus.numDisplayServers, sizeof(int), UI_ServersQsortCompare);
ADDRGP4 uiInfo+40740+2220
ARGP4
ADDRGP4 uiInfo+40740+10412
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_ServersQsortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 3613
;3613:}
LABELV $2290
endproc UI_ServersSort 0 16
proc UI_LoadMods 2092 16
line 3660
;3614:
;3615:/*
;3616:static void UI_StartSinglePlayer() {
;3617:	int i,j, k, skill;
;3618:	char buff[1024];
;3619:	i = trap_Cvar_VariableValue( "ui_currentTier" );
;3620:  if (i < 0 || i >= tierCount) {
;3621:    i = 0;
;3622:  }
;3623:	j = trap_Cvar_VariableValue("ui_currentMap");
;3624:	if (j < 0 || j > MAPS_PER_TIER) {
;3625:		j = 0;
;3626:	}
;3627:
;3628: 	trap_Cvar_SetValue( "singleplayer", 1 );
;3629: 	trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 7, tierList[i].gameTypes[j] ) );
;3630:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", tierList[i].maps[j] ) );
;3631:	skill = trap_Cvar_VariableValue( "g_spSkill" );
;3632:
;3633:	if (j == MAPS_PER_TIER-1) {
;3634:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;3635:		Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[0]), skill, "", teamList[k].teamMembers[0]);
;3636:	} else {
;3637:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;3638:		for (i = 0; i < PLAYERS_PER_TEAM; i++) {
;3639:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Blue", teamList[k].teamMembers[i]);
;3640:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;3641:		}
;3642:
;3643:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
;3644:		for (i = 1; i < PLAYERS_PER_TEAM; i++) {
;3645:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Red", teamList[k].teamMembers[i]);
;3646:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;3647:		}
;3648:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team Red\n" );
;3649:	}
;3650:	
;3651:
;3652:}
;3653:*/
;3654:
;3655:/*
;3656:===============
;3657:UI_LoadMods
;3658:===============
;3659:*/
;3660:static void UI_LoadMods() {
line 3668
;3661:	int		numdirs;
;3662:	char	dirlist[2048];
;3663:	char	*dirptr;
;3664:  char  *descptr;
;3665:	int		i;
;3666:	int		dirlen;
;3667:
;3668:	uiInfo.modCount = 0;
ADDRGP4 uiInfo+34308
CNSTI4 0
ASGNI4
line 3669
;3669:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $2305
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
line 3670
;3670:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 3671
;3671:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $2309
JUMPV
LABELV $2306
line 3672
;3672:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3673
;3673:    descptr = dirptr + dirlen;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 3674
;3674:		uiInfo.modList[uiInfo.modCount].modName = String_Alloc(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+34308
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796
ADDP4
ADDRLP4 2076
INDIRP4
ASGNP4
line 3675
;3675:		uiInfo.modList[uiInfo.modCount].modDescr = String_Alloc(descptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+34308
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796+4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 3676
;3676:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2084
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 3677
;3677:		uiInfo.modCount++;
ADDRLP4 2088
ADDRGP4 uiInfo+34308
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3678
;3678:		if (uiInfo.modCount >= MAX_MODS) {
ADDRGP4 uiInfo+34308
INDIRI4
CNSTI4 64
LTI4 $2316
line 3679
;3679:			break;
ADDRGP4 $2308
JUMPV
LABELV $2316
line 3681
;3680:		}
;3681:	}
LABELV $2307
line 3671
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2309
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2306
LABELV $2308
line 3683
;3682:
;3683:}
LABELV $2303
endproc UI_LoadMods 2092 16
proc UI_LoadMovies 4124 16
line 3691
;3684:
;3685:
;3686:/*
;3687:===============
;3688:UI_LoadMovies
;3689:===============
;3690:*/
;3691:static void UI_LoadMovies() {
line 3696
;3692:	char	movielist[4096];
;3693:	char	*moviename;
;3694:	int		i, len;
;3695:
;3696:	uiInfo.movieCount = trap_FS_GetFileList( "video", "roq", movielist, 4096 );
ADDRGP4 $2321
ARGP4
ADDRGP4 $2322
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4108
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+36372
ADDRLP4 4108
INDIRI4
ASGNI4
line 3698
;3697:
;3698:	if (uiInfo.movieCount) {
ADDRGP4 uiInfo+36372
INDIRI4
CNSTI4 0
EQI4 $2323
line 3699
;3699:		if (uiInfo.movieCount > MAX_MOVIES) {
ADDRGP4 uiInfo+36372
INDIRI4
CNSTI4 256
LEI4 $2326
line 3700
;3700:			uiInfo.movieCount = MAX_MOVIES;
ADDRGP4 uiInfo+36372
CNSTI4 256
ASGNI4
line 3701
;3701:		}
LABELV $2326
line 3702
;3702:		moviename = movielist;
ADDRLP4 0
ADDRLP4 12
ASGNP4
line 3703
;3703:		for ( i = 0; i < uiInfo.movieCount; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2333
JUMPV
LABELV $2330
line 3704
;3704:			len = strlen( moviename );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4112
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4112
INDIRI4
ASGNI4
line 3705
;3705:			if (!Q_stricmp(moviename +  len - 4,".roq")) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $2337
ARGP4
ADDRLP4 4116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4116
INDIRI4
CNSTI4 0
NEI4 $2335
line 3706
;3706:				moviename[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 3707
;3707:			}
LABELV $2335
line 3708
;3708:			Q_strupr(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 3709
;3709:			uiInfo.movieList[i] = String_Alloc(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+35348
ADDP4
ADDRLP4 4120
INDIRP4
ASGNP4
line 3710
;3710:			moviename += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 3711
;3711:		}
LABELV $2331
line 3703
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2333
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+36372
INDIRI4
LTI4 $2330
line 3712
;3712:	}
LABELV $2323
line 3714
;3713:
;3714:}
LABELV $2319
endproc UI_LoadMovies 4124 16
proc UI_LoadDemos 4168 16
line 3723
;3715:
;3716:
;3717:
;3718:/*
;3719:===============
;3720:UI_LoadDemos
;3721:===============
;3722:*/
;3723:static void UI_LoadDemos() {
line 3729
;3724:	char	demolist[4096];
;3725:	char demoExt[32];
;3726:	char	*demoname;
;3727:	int		i, len;
;3728:
;3729:	Com_sprintf(demoExt, sizeof(demoExt), "dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2341
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2340
ARGP4
ADDRLP4 4140
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3731
;3730:
;3731:	uiInfo.demoCount = trap_FS_GetFileList( "demos", demoExt, demolist, 4096 );
ADDRGP4 $2343
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4144
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+35340
ADDRLP4 4144
INDIRI4
ASGNI4
line 3733
;3732:
;3733:	Com_sprintf(demoExt, sizeof(demoExt), ".dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2341
ARGP4
ADDRLP4 4148
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2344
ARGP4
ADDRLP4 4148
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3735
;3734:
;3735:	if (uiInfo.demoCount) {
ADDRGP4 uiInfo+35340
INDIRI4
CNSTI4 0
EQI4 $2345
line 3736
;3736:		if (uiInfo.demoCount > MAX_DEMOS) {
ADDRGP4 uiInfo+35340
INDIRI4
CNSTI4 256
LEI4 $2348
line 3737
;3737:			uiInfo.demoCount = MAX_DEMOS;
ADDRGP4 uiInfo+35340
CNSTI4 256
ASGNI4
line 3738
;3738:		}
LABELV $2348
line 3739
;3739:		demoname = demolist;
ADDRLP4 0
ADDRLP4 44
ASGNP4
line 3740
;3740:		for ( i = 0; i < uiInfo.demoCount; i++ ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $2355
JUMPV
LABELV $2352
line 3741
;3741:			len = strlen( demoname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 4152
INDIRI4
ASGNI4
line 3742
;3742:			if (!Q_stricmp(demoname +  len - strlen(demoExt), demoExt)) {
ADDRLP4 4
ARGP4
ADDRLP4 4156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 4156
INDIRI4
SUBP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4160
INDIRI4
CNSTI4 0
NEI4 $2357
line 3743
;3743:				demoname[len-strlen(demoExt)] = '\0';
ADDRLP4 4
ARGP4
ADDRLP4 4164
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 4164
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 3744
;3744:			}
LABELV $2357
line 3745
;3745:			Q_strupr(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 3746
;3746:			uiInfo.demoList[i] = String_Alloc(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+34316
ADDP4
ADDRLP4 4164
INDIRP4
ASGNP4
line 3747
;3747:			demoname += len + 1;
ADDRLP4 0
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 3748
;3748:		}
LABELV $2353
line 3740
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2355
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+35340
INDIRI4
LTI4 $2352
line 3749
;3749:	}
LABELV $2345
line 3751
;3750:
;3751:}
LABELV $2339
endproc UI_LoadDemos 4168 16
proc UI_SetNextMap 8 16
line 3754
;3752:
;3753:
;3754:static qboolean UI_SetNextMap(int actual, int index) {
line 3756
;3755:	int i;
;3756:	for (i = actual + 1; i < uiInfo.mapCount; i++) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2364
JUMPV
LABELV $2361
line 3757
;3757:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2366
line 3758
;3758:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, index + 1, "skirmish");
CNSTP4 0
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ARGI4
ADDRGP4 $2370
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3759
;3759:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2360
JUMPV
LABELV $2366
line 3761
;3760:		}
;3761:	}
LABELV $2362
line 3756
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2364
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $2361
line 3762
;3762:	return qfalse;
CNSTI4 0
RETI4
LABELV $2360
endproc UI_SetNextMap 8 16
proc UI_StartSkirmish 1180 32
line 3766
;3763:}
;3764:
;3765:
;3766:static void UI_StartSkirmish(qboolean next) {
line 3771
;3767:	int i, k, g, delay, temp;
;3768:	float skill;
;3769:	char buff[MAX_STRING_CHARS];
;3770:
;3771:	temp = trap_Cvar_VariableValue( "g_gametype" );
ADDRGP4 $883
ARGP4
ADDRLP4 1048
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1048
INDIRF4
CVFI4 4
ASGNI4
line 3772
;3772:	trap_Cvar_Set("ui_gameType", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1997
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3774
;3773:
;3774:	if (next) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2372
line 3776
;3775:		int actual;
;3776:		int index = trap_Cvar_VariableValue("ui_mapIndex");
ADDRGP4 $2374
ARGP4
ADDRLP4 1064
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1056
ADDRLP4 1064
INDIRF4
CVFI4 4
ASGNI4
line 3777
;3777:	 	UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3778
;3778:		UI_SelectedMap(index, &actual);
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1060
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 3779
;3779:		if (UI_SetNextMap(actual, index)) {
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 UI_SetNextMap
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $2375
line 3780
;3780:		} else {
ADDRGP4 $2376
JUMPV
LABELV $2375
line 3781
;3781:			UI_GameType_HandleKey(0, 0, A_MOUSE1, qfalse);
ADDRLP4 1072
CNSTI4 0
ASGNI4
ADDRLP4 1072
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 141
ARGI4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 3782
;3782:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3783
;3783:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $2370
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3784
;3784:		}
LABELV $2376
line 3785
;3785:	}
LABELV $2372
line 3787
;3786:
;3787:	g = uiInfo.gameTypes[ui_gameType.integer].gtEnum;
ADDRLP4 1040
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ASGNI4
line 3788
;3788:	trap_Cvar_SetValue( "g_gametype", g );
ADDRGP4 $883
ARGP4
ADDRLP4 1040
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3789
;3789:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName) );
ADDRGP4 $2380
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3790
;3790:	skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 1060
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1060
INDIRF4
ASGNF4
line 3791
;3791:	trap_Cvar_Set("ui_scoreMap", uiInfo.mapList[ui_currentMap.integer].mapName);
ADDRGP4 $2384
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3793
;3792:
;3793:	k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 1064
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1068
INDIRI4
ASGNI4
line 3795
;3794:
;3795:	trap_Cvar_Set("ui_singlePlayerActive", "1");
ADDRGP4 $2387
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3798
;3796:
;3797:	// set up sp overrides, will be replaced on postgame
;3798:	temp = trap_Cvar_VariableValue( "capturelimit" );
ADDRGP4 $704
ARGP4
ADDRLP4 1072
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1072
INDIRF4
CVFI4 4
ASGNI4
line 3799
;3799:	trap_Cvar_Set("ui_saveCaptureLimit", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2388
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3800
;3800:	temp = trap_Cvar_VariableValue( "fraglimit" );
ADDRGP4 $705
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1080
INDIRF4
CVFI4 4
ASGNI4
line 3801
;3801:	trap_Cvar_Set("ui_saveFragLimit", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2389
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3802
;3802:	temp = trap_Cvar_VariableValue( "duel_fraglimit" );
ADDRGP4 $2390
ARGP4
ADDRLP4 1088
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1088
INDIRF4
CVFI4 4
ASGNI4
line 3803
;3803:	trap_Cvar_Set("ui_saveDuelLimit", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2391
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3805
;3804:
;3805:	UI_SetCapFragLimits(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 3807
;3806:
;3807:	temp = trap_Cvar_VariableValue( "cg_drawTimer" );
ADDRGP4 $2392
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1096
INDIRF4
CVFI4 4
ASGNI4
line 3808
;3808:	trap_Cvar_Set("ui_drawTimer", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2393
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3809
;3809:	temp = trap_Cvar_VariableValue( "g_doWarmup" );
ADDRGP4 $2394
ARGP4
ADDRLP4 1104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1104
INDIRF4
CVFI4 4
ASGNI4
line 3810
;3810:	trap_Cvar_Set("ui_doWarmup", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2395
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3811
;3811:	temp = trap_Cvar_VariableValue( "g_friendlyFire" );
ADDRGP4 $2396
ARGP4
ADDRLP4 1112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1112
INDIRF4
CVFI4 4
ASGNI4
line 3812
;3812:	trap_Cvar_Set("ui_friendlyFire", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2397
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3813
;3813:	temp = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $947
ARGP4
ADDRLP4 1120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1120
INDIRF4
CVFI4 4
ASGNI4
line 3814
;3814:	trap_Cvar_Set("ui_maxClients", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2398
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3815
;3815:	temp = trap_Cvar_VariableValue( "g_warmup" );
ADDRGP4 $2399
ARGP4
ADDRLP4 1128
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1128
INDIRF4
CVFI4 4
ASGNI4
line 3816
;3816:	trap_Cvar_Set("ui_Warmup", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1132
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2400
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3817
;3817:	temp = trap_Cvar_VariableValue( "sv_pure" );
ADDRGP4 $2401
ARGP4
ADDRLP4 1136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1136
INDIRF4
CVFI4 4
ASGNI4
line 3818
;3818:	trap_Cvar_Set("ui_pure", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2402
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3820
;3819:
;3820:	trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $350
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3821
;3821:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $352
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3822
;3822:	trap_Cvar_Set("cg_drawTimer", "1");
ADDRGP4 $2392
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3823
;3823:	trap_Cvar_Set("g_doWarmup", "1");
ADDRGP4 $2394
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3824
;3824:	trap_Cvar_Set("g_warmup", "15");
ADDRGP4 $2399
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3825
;3825:	trap_Cvar_Set("sv_pure", "0");
ADDRGP4 $2401
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3826
;3826:	trap_Cvar_Set("g_friendlyFire", "0");
ADDRGP4 $2396
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3827
;3827:	trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 1144
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2403
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3828
;3828:	trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 1148
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2404
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3830
;3829:
;3830:	if (trap_Cvar_VariableValue("ui_recordSPDemo")) {
ADDRGP4 $2407
ARGP4
ADDRLP4 1152
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1152
INDIRF4
CNSTF4 0
EQF4 $2405
line 3831
;3831:		Com_sprintf(buff, MAX_STRING_CHARS, "%s_%i", uiInfo.mapList[ui_currentMap.integer].mapLoadName, g);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2408
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3832
;3832:		trap_Cvar_Set("ui_recordSPDemoName", buff);
ADDRGP4 $2412
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3833
;3833:	}
LABELV $2405
line 3835
;3834:
;3835:	delay = 500;
ADDRLP4 1036
CNSTI4 500
ASGNI4
line 3837
;3836:
;3837:	if (g == GT_TOURNAMENT) {
ADDRLP4 1040
INDIRI4
CNSTI4 3
NEI4 $2413
line 3838
;3838:		temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1028
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3839
;3839:		trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $702
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1156
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $947
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3840
;3840:		Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %f "", %i \n", uiInfo.mapList[ui_currentMap.integer].opponentName, skill, delay);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2418
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3841
;3841:		trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3842
;3842:	} else if (g == GT_HOLOCRON || g == GT_JEDIMASTER) {
ADDRGP4 $2414
JUMPV
LABELV $2413
ADDRLP4 1040
INDIRI4
CNSTI4 1
EQI4 $2424
ADDRLP4 1040
INDIRI4
CNSTI4 2
NEI4 $2422
LABELV $2424
line 3843
;3843:		temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1028
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3844
;3844:		trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $702
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $947
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3845
;3845:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2431
JUMPV
LABELV $2428
line 3846
;3846:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_HOLOCRON) ? "" : "Blue", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2435
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 1
NEI4 $2441
ADDRLP4 1164
ADDRGP4 $165
ASGNP4
ADDRGP4 $2442
JUMPV
LABELV $2441
ADDRLP4 1164
ADDRGP4 $935
ASGNP4
LABELV $2442
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3847
;3847:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3848
;3848:			delay += 500;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3849
;3849:		}
LABELV $2429
line 3845
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2431
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
LTI4 $2428
line 3850
;3850:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 1164
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1168
INDIRI4
ASGNI4
line 3851
;3851:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers-1; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2446
JUMPV
LABELV $2443
line 3852
;3852:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_HOLOCRON) ? "" : "Red", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1176
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2435
ARGP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 1
NEI4 $2455
ADDRLP4 1172
ADDRGP4 $165
ASGNP4
ADDRGP4 $2456
JUMPV
LABELV $2455
ADDRLP4 1172
ADDRGP4 $936
ASGNP4
LABELV $2456
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3853
;3853:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3854
;3854:			delay += 500;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3855
;3855:		}
LABELV $2444
line 3851
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2446
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LTI4 $2443
line 3856
;3856:	} else {
ADDRGP4 $2423
JUMPV
LABELV $2422
line 3857
;3857:		temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1028
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3858
;3858:		trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $702
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $947
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3859
;3859:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2463
JUMPV
LABELV $2460
line 3860
;3860:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "Blue", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2435
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2472
ADDRLP4 1164
ADDRGP4 $165
ASGNP4
ADDRGP4 $2473
JUMPV
LABELV $2472
ADDRLP4 1164
ADDRGP4 $935
ASGNP4
LABELV $2473
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3861
;3861:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3862
;3862:			delay += 500;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3863
;3863:		}
LABELV $2461
line 3859
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2463
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
LTI4 $2460
line 3864
;3864:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 1164
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1168
INDIRI4
ASGNI4
line 3865
;3865:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers-1; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2477
JUMPV
LABELV $2474
line 3866
;3866:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "Red", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1176
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2435
ARGP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2486
ADDRLP4 1172
ADDRGP4 $165
ASGNP4
ADDRGP4 $2487
JUMPV
LABELV $2486
ADDRLP4 1172
ADDRGP4 $936
ASGNP4
LABELV $2487
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3867
;3867:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3868
;3868:			delay += 500;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3869
;3869:		}
LABELV $2475
line 3865
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2477
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LTI4 $2474
line 3870
;3870:	}
LABELV $2423
LABELV $2414
line 3871
;3871:	if (g >= GT_TEAM ) {
ADDRLP4 1040
INDIRI4
CNSTI4 5
LTI4 $2488
line 3872
;3872:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team Red\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2490
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3873
;3873:	}
LABELV $2488
line 3874
;3874:}
LABELV $2371
endproc UI_StartSkirmish 1180 32
proc UI_Update 40 8
line 3876
;3875:
;3876:static void UI_Update(const char *name) {
line 3877
;3877:	int	val = trap_Cvar_VariableValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 3879
;3878:
;3879:	if (Q_stricmp(name, "s_khz") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2494
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2492
line 3880
;3880:	{
line 3881
;3881:		trap_Cmd_ExecuteText( EXEC_APPEND, "snd_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2495
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3882
;3882:		return;
ADDRGP4 $2491
JUMPV
LABELV $2492
line 3885
;3883:	}
;3884:
;3885: 	if (Q_stricmp(name, "ui_SetName") == 0) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2498
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2496
line 3886
;3886:		trap_Cvar_Set( "name", UI_Cvar_VariableString("ui_Name"));
ADDRGP4 $2500
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2499
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3887
;3887: 	} else if (Q_stricmp(name, "ui_setRate") == 0) {
ADDRGP4 $2497
JUMPV
LABELV $2496
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2503
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2501
line 3888
;3888:		float rate = trap_Cvar_VariableValue("rate");
ADDRGP4 $2504
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 24
INDIRF4
ASGNF4
line 3889
;3889:		if (rate >= 5000) {
ADDRLP4 20
INDIRF4
CNSTF4 1167867904
LTF4 $2505
line 3890
;3890:			trap_Cvar_Set("cl_maxpackets", "30");
ADDRGP4 $2507
ARGP4
ADDRGP4 $688
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3891
;3891:			trap_Cvar_Set("cl_packetdup", "1");
ADDRGP4 $2508
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3892
;3892:		} else if (rate >= 4000) {
ADDRGP4 $2502
JUMPV
LABELV $2505
ADDRLP4 20
INDIRF4
CNSTF4 1165623296
LTF4 $2509
line 3893
;3893:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2507
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3894
;3894:			trap_Cvar_Set("cl_packetdup", "2");		// favor less prediction errors when there's packet loss
ADDRGP4 $2508
ARGP4
ADDRGP4 $2511
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3895
;3895:		} else {
ADDRGP4 $2502
JUMPV
LABELV $2509
line 3896
;3896:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2507
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3897
;3897:			trap_Cvar_Set("cl_packetdup", "1");		// favor lower bandwidth
ADDRGP4 $2508
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3898
;3898:		}
line 3899
;3899: 	} 
ADDRGP4 $2502
JUMPV
LABELV $2501
line 3900
;3900:	else if (Q_stricmp(name, "ui_GetName") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2514
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2512
line 3901
;3901:	{
line 3902
;3902:		trap_Cvar_Set( "ui_Name", UI_Cvar_VariableString("name"));
ADDRGP4 $2499
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2500
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3903
;3903:	}
ADDRGP4 $2513
JUMPV
LABELV $2512
line 3904
;3904:	else if (Q_stricmp(name, "ui_r_colorbits") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2517
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2515
line 3905
;3905:	{
line 3906
;3906:		switch (val) 
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 32
CNSTI4 16
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $2522
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $2525
LABELV $2524
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2520
ADDRGP4 $2516
JUMPV
LABELV $2525
ADDRLP4 0
INDIRI4
CNSTI4 32
EQI4 $2523
ADDRGP4 $2516
JUMPV
line 3907
;3907:		{
LABELV $2520
line 3909
;3908:			case 0:
;3909:				trap_Cvar_SetValue( "ui_r_depthbits", 0 );
ADDRGP4 $2521
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3910
;3910:				break;
ADDRGP4 $2516
JUMPV
LABELV $2522
line 3913
;3911:
;3912:			case 16:
;3913:				trap_Cvar_SetValue( "ui_r_depthbits", 16 );
ADDRGP4 $2521
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3914
;3914:				break;
ADDRGP4 $2516
JUMPV
LABELV $2523
line 3917
;3915:
;3916:			case 32:
;3917:				trap_Cvar_SetValue( "ui_r_depthbits", 24 );
ADDRGP4 $2521
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3918
;3918:				break;
line 3920
;3919:		}
;3920:	} 
ADDRGP4 $2516
JUMPV
LABELV $2515
line 3921
;3921:	else if (Q_stricmp(name, "ui_r_lodbias") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2528
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2526
line 3922
;3922:	{
line 3923
;3923:		switch (val) 
ADDRLP4 32
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2531
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $2533
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $2534
ADDRGP4 $2527
JUMPV
line 3924
;3924:		{
LABELV $2531
line 3926
;3925:			case 0:
;3926:				trap_Cvar_SetValue( "ui_r_subdivisions", 4 );
ADDRGP4 $2532
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3927
;3927:				break;
ADDRGP4 $2527
JUMPV
LABELV $2533
line 3929
;3928:			case 1:
;3929:				trap_Cvar_SetValue( "ui_r_subdivisions", 12 );
ADDRGP4 $2532
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3930
;3930:				break;
ADDRGP4 $2527
JUMPV
LABELV $2534
line 3933
;3931:
;3932:			case 2:
;3933:				trap_Cvar_SetValue( "ui_r_subdivisions", 20 );
ADDRGP4 $2532
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3934
;3934:				break;
line 3936
;3935:		}
;3936:	} 
ADDRGP4 $2527
JUMPV
LABELV $2526
line 3937
;3937:	else if (Q_stricmp(name, "ui_r_glCustom") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2537
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2535
line 3938
;3938:	{
line 3939
;3939:		switch (val) 
ADDRLP4 36
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $2536
ADDRLP4 36
INDIRI4
CNSTI4 3
GTI4 $2536
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2553
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2553
address $2540
address $2549
address $2550
address $2552
code
line 3940
;3940:		{
LABELV $2540
line 3943
;3941:			case 0:	// high quality
;3942:
;3943:				trap_Cvar_SetValue( "ui_r_fullScreen", 1 );
ADDRGP4 $2541
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3944
;3944:				trap_Cvar_SetValue( "ui_r_subdivisions", 4 );
ADDRGP4 $2532
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3945
;3945:				trap_Cvar_SetValue( "ui_r_lodbias", 0 );
ADDRGP4 $2528
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3946
;3946:				trap_Cvar_SetValue( "ui_r_colorbits", 32 );
ADDRGP4 $2517
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3947
;3947:				trap_Cvar_SetValue( "ui_r_depthbits", 24 );
ADDRGP4 $2521
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3948
;3948:				trap_Cvar_SetValue( "ui_r_picmip", 0 );
ADDRGP4 $2542
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3949
;3949:				trap_Cvar_SetValue( "ui_r_mode", 4 );
ADDRGP4 $2543
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3950
;3950:				trap_Cvar_SetValue( "ui_r_texturebits", 32 );
ADDRGP4 $2544
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3951
;3951:				trap_Cvar_SetValue( "ui_r_fastSky", 0 );
ADDRGP4 $2545
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3952
;3952:				trap_Cvar_SetValue( "ui_r_inGameVideo", 1 );
ADDRGP4 $2546
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3954
;3953:				//trap_Cvar_SetValue( "ui_cg_shadows", 2 );//stencil
;3954:				trap_Cvar_Set( "ui_r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $2547
ARGP4
ADDRGP4 $2548
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3955
;3955:				break;
ADDRGP4 $2536
JUMPV
LABELV $2549
line 3958
;3956:
;3957:			case 1: // normal 
;3958:				trap_Cvar_SetValue( "ui_r_fullScreen", 1 );
ADDRGP4 $2541
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3959
;3959:				trap_Cvar_SetValue( "ui_r_subdivisions", 4 );
ADDRGP4 $2532
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3960
;3960:				trap_Cvar_SetValue( "ui_r_lodbias", 0 );
ADDRGP4 $2528
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3961
;3961:				trap_Cvar_SetValue( "ui_r_colorbits", 0 );
ADDRGP4 $2517
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3962
;3962:				trap_Cvar_SetValue( "ui_r_depthbits", 24 );
ADDRGP4 $2521
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3963
;3963:				trap_Cvar_SetValue( "ui_r_picmip", 1 );
ADDRGP4 $2542
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3964
;3964:				trap_Cvar_SetValue( "ui_r_mode", 3 );
ADDRGP4 $2543
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3965
;3965:				trap_Cvar_SetValue( "ui_r_texturebits", 0 );
ADDRGP4 $2544
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3966
;3966:				trap_Cvar_SetValue( "ui_r_fastSky", 0 );
ADDRGP4 $2545
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3967
;3967:				trap_Cvar_SetValue( "ui_r_inGameVideo", 1 );
ADDRGP4 $2546
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3969
;3968:				//trap_Cvar_SetValue( "ui_cg_shadows", 2 );
;3969:				trap_Cvar_Set( "ui_r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $2547
ARGP4
ADDRGP4 $2548
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3970
;3970:				break;
ADDRGP4 $2536
JUMPV
LABELV $2550
line 3974
;3971:
;3972:			case 2: // fast
;3973:
;3974:				trap_Cvar_SetValue( "ui_r_fullScreen", 1 );
ADDRGP4 $2541
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3975
;3975:				trap_Cvar_SetValue( "ui_r_subdivisions", 12 );
ADDRGP4 $2532
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3976
;3976:				trap_Cvar_SetValue( "ui_r_lodbias", 1 );
ADDRGP4 $2528
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3977
;3977:				trap_Cvar_SetValue( "ui_r_colorbits", 0 );
ADDRGP4 $2517
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3978
;3978:				trap_Cvar_SetValue( "ui_r_depthbits", 0 );
ADDRGP4 $2521
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3979
;3979:				trap_Cvar_SetValue( "ui_r_picmip", 2 );
ADDRGP4 $2542
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3980
;3980:				trap_Cvar_SetValue( "ui_r_mode", 3 );
ADDRGP4 $2543
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3981
;3981:				trap_Cvar_SetValue( "ui_r_texturebits", 0 );
ADDRGP4 $2544
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3982
;3982:				trap_Cvar_SetValue( "ui_r_fastSky", 1 );
ADDRGP4 $2545
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3983
;3983:				trap_Cvar_SetValue( "ui_r_inGameVideo", 0 );
ADDRGP4 $2546
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3985
;3984:				//trap_Cvar_SetValue( "ui_cg_shadows", 1 );
;3985:				trap_Cvar_Set( "ui_r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $2547
ARGP4
ADDRGP4 $2551
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3986
;3986:				break;
ADDRGP4 $2536
JUMPV
LABELV $2552
line 3990
;3987:
;3988:			case 3: // fastest
;3989:
;3990:				trap_Cvar_SetValue( "ui_r_fullScreen", 1 );
ADDRGP4 $2541
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3991
;3991:				trap_Cvar_SetValue( "ui_r_subdivisions", 20 );
ADDRGP4 $2532
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3992
;3992:				trap_Cvar_SetValue( "ui_r_lodbias", 2 );
ADDRGP4 $2528
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3993
;3993:				trap_Cvar_SetValue( "ui_r_colorbits", 16 );
ADDRGP4 $2517
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3994
;3994:				trap_Cvar_SetValue( "ui_r_depthbits", 16 );
ADDRGP4 $2521
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3995
;3995:				trap_Cvar_SetValue( "ui_r_mode", 3 );
ADDRGP4 $2543
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3996
;3996:				trap_Cvar_SetValue( "ui_r_picmip", 3 );
ADDRGP4 $2542
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3997
;3997:				trap_Cvar_SetValue( "ui_r_texturebits", 16 );
ADDRGP4 $2544
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3998
;3998:				trap_Cvar_SetValue( "ui_r_fastSky", 1 );
ADDRGP4 $2545
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3999
;3999:				trap_Cvar_SetValue( "ui_r_inGameVideo", 0 );
ADDRGP4 $2546
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4001
;4000:				//trap_Cvar_SetValue( "ui_cg_shadows", 0 );
;4001:				trap_Cvar_Set( "ui_r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $2547
ARGP4
ADDRGP4 $2551
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4002
;4002:			break;
line 4004
;4003:		}
;4004:	} 
ADDRGP4 $2536
JUMPV
LABELV $2535
line 4005
;4005:	else if (Q_stricmp(name, "ui_mousePitch") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2556
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $2554
line 4006
;4006:	{
line 4007
;4007:		if (val == 0) 
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2557
line 4008
;4008:		{
line 4009
;4009:			trap_Cvar_SetValue( "m_pitch", 0.022f );
ADDRGP4 $2559
ARGP4
CNSTF4 1018444120
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4010
;4010:		} 
ADDRGP4 $2558
JUMPV
LABELV $2557
line 4012
;4011:		else 
;4012:		{
line 4013
;4013:			trap_Cvar_SetValue( "m_pitch", -0.022f );
ADDRGP4 $2559
ARGP4
CNSTF4 3165927768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4014
;4014:		}
LABELV $2558
line 4015
;4015:	}
LABELV $2554
LABELV $2536
LABELV $2527
LABELV $2516
LABELV $2513
LABELV $2502
LABELV $2497
line 4016
;4016:}
LABELV $2491
endproc UI_Update 40 8
data
export gUISelectedMap
align 4
LABELV gUISelectedMap
byte 4 0
code
proc UI_DeferMenuScript 32 8
line 4028
;4017:
;4018:int gUISelectedMap = 0;
;4019:
;4020:/*
;4021:===============
;4022:UI_DeferMenuScript
;4023:
;4024:Return true if the menu script should be deferred for later
;4025:===============
;4026:*/
;4027:static qboolean UI_DeferMenuScript ( char **args )
;4028:{
line 4032
;4029:	const char* name;
;4030:
;4031:	// Whats the reason for being deferred?
;4032:	if (!String_Parse( (char**)args, &name)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2561
line 4033
;4033:	{
line 4034
;4034:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2560
JUMPV
LABELV $2561
line 4038
;4035:	}
;4036:
;4037:	// Handle the custom cases
;4038:	if ( !Q_stricmp ( name, "VideoSetup" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $2565
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2563
line 4039
;4039:	{
line 4044
;4040:		const char* warningMenuName;
;4041:		qboolean	deferred;
;4042:
;4043:		// No warning menu specified
;4044:		if ( !String_Parse( (char**)args, &warningMenuName) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2566
line 4045
;4045:		{
line 4046
;4046:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2560
JUMPV
LABELV $2566
line 4050
;4047:		}
;4048:
;4049:		// Defer if the video options were modified
;4050:		deferred = trap_Cvar_VariableValue ( "ui_r_modified" ) ? qtrue : qfalse;
ADDRGP4 $2568
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
EQF4 $2570
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $2571
JUMPV
LABELV $2570
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $2571
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 4052
;4051:
;4052:		if ( deferred )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2572
line 4053
;4053:		{
line 4055
;4054:			// Open the warning menu
;4055:			Menus_OpenByName(warningMenuName);
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 4056
;4056:		}
LABELV $2572
line 4058
;4057:
;4058:		return deferred;
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $2560
JUMPV
LABELV $2563
line 4060
;4059:	}
;4060:	else if ( !Q_stricmp ( name, "RulesBackout" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $2576
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2574
line 4061
;4061:	{
line 4064
;4062:		qboolean deferred;
;4063:		
;4064:		deferred = trap_Cvar_VariableValue ( "ui_rules_backout" ) ? qtrue : qfalse ;
ADDRGP4 $2577
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $2579
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $2580
JUMPV
LABELV $2579
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $2580
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 4066
;4065:
;4066:		trap_Cvar_Set ( "ui_rules_backout", "0" );
ADDRGP4 $2577
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4068
;4067:
;4068:		return deferred;
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $2560
JUMPV
LABELV $2574
line 4071
;4069:	}
;4070:
;4071:	return qfalse;
CNSTI4 0
RETI4
LABELV $2560
endproc UI_DeferMenuScript 32 8
export UI_UpdateVideoSetup
proc UI_UpdateVideoSetup 60 8
line 4084
;4072:}
;4073:
;4074:/*
;4075:=================
;4076:UI_UpdateVideoSetup
;4077:
;4078:Copies the temporary user interface version of the video cvars into
;4079:their real counterparts.  This is to create a interface which allows 
;4080:you to discard your changes if you did something you didnt want
;4081:=================
;4082:*/
;4083:void UI_UpdateVideoSetup ( void )
;4084:{
line 4085
;4085:	trap_Cvar_Set ( "r_mode", UI_Cvar_VariableString ( "ui_r_mode" ) );
ADDRGP4 $2543
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2582
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4086
;4086:	trap_Cvar_Set ( "r_fullscreen", UI_Cvar_VariableString ( "ui_r_fullscreen" ) );
ADDRGP4 $2584
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2583
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4087
;4087:	trap_Cvar_Set ( "r_colorbits", UI_Cvar_VariableString ( "ui_r_colorbits" ) );
ADDRGP4 $2517
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2585
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4088
;4088:	trap_Cvar_Set ( "r_lodbias", UI_Cvar_VariableString ( "ui_r_lodbias" ) );
ADDRGP4 $2528
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2586
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4089
;4089:	trap_Cvar_Set ( "r_picmip", UI_Cvar_VariableString ( "ui_r_picmip" ) );
ADDRGP4 $2542
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2587
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4090
;4090:	trap_Cvar_Set ( "r_texturebits", UI_Cvar_VariableString ( "ui_r_texturebits" ) );
ADDRGP4 $2544
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2588
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4091
;4091:	trap_Cvar_Set ( "r_texturemode", UI_Cvar_VariableString ( "ui_r_texturemode" ) );
ADDRGP4 $2547
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2589
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4092
;4092:	trap_Cvar_Set ( "r_detailtextures", UI_Cvar_VariableString ( "ui_r_detailtextures" ) );
ADDRGP4 $2591
ARGP4
ADDRLP4 28
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2590
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4093
;4093:	trap_Cvar_Set ( "r_ext_compress_textures", UI_Cvar_VariableString ( "ui_r_ext_compress_textures" ) );
ADDRGP4 $2593
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2592
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4094
;4094:	trap_Cvar_Set ( "r_depthbits", UI_Cvar_VariableString ( "ui_r_depthbits" ) );
ADDRGP4 $2521
ARGP4
ADDRLP4 36
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2594
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4095
;4095:	trap_Cvar_Set ( "r_subdivisions", UI_Cvar_VariableString ( "ui_r_subdivisions" ) );
ADDRGP4 $2532
ARGP4
ADDRLP4 40
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2595
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4096
;4096:	trap_Cvar_Set ( "r_fastSky", UI_Cvar_VariableString ( "ui_r_fastSky" ) );
ADDRGP4 $2545
ARGP4
ADDRLP4 44
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2596
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4097
;4097:	trap_Cvar_Set ( "r_inGameVideo", UI_Cvar_VariableString ( "ui_r_inGameVideo" ) );
ADDRGP4 $2546
ARGP4
ADDRLP4 48
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2597
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4098
;4098:	trap_Cvar_Set ( "r_allowExtensions", UI_Cvar_VariableString ( "ui_r_allowExtensions" ) );
ADDRGP4 $2599
ARGP4
ADDRLP4 52
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2598
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4099
;4099:	trap_Cvar_Set ( "cg_shadows", UI_Cvar_VariableString ( "ui_cg_shadows" ) );
ADDRGP4 $2601
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2600
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4100
;4100:	trap_Cvar_Set ( "ui_r_modified", "0" );
ADDRGP4 $2568
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4102
;4101:
;4102:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2602
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4103
;4103:}
LABELV $2581
endproc UI_UpdateVideoSetup 60 8
export UI_GetVideoSetup
proc UI_GetVideoSetup 60 16
line 4114
;4104:
;4105:/*
;4106:=================
;4107:UI_GetVideoSetup
;4108:
;4109:Retrieves the current actual video settings into the temporary user
;4110:interface versions of the cvars.
;4111:=================
;4112:*/
;4113:void UI_GetVideoSetup ( void )
;4114:{
line 4116
;4115:	// Make sure the cvars are registered as read only.
;4116:	trap_Cvar_Register ( NULL, "ui_r_glCustom",				"4", CVAR_ROM|CVAR_INTERNAL|CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $2537
ARGP4
ADDRGP4 $2604
ARGP4
CNSTI4 2113
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4118
;4117:
;4118:	trap_Cvar_Register ( NULL, "ui_r_mode",					"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2543
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4119
;4119:	trap_Cvar_Register ( NULL, "ui_r_fullscreen",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2584
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4120
;4120:	trap_Cvar_Register ( NULL, "ui_r_colorbits",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2517
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4121
;4121:	trap_Cvar_Register ( NULL, "ui_r_lodbias",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2528
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4122
;4122:	trap_Cvar_Register ( NULL, "ui_r_picmip",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2542
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4123
;4123:	trap_Cvar_Register ( NULL, "ui_r_texturebits",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2544
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4124
;4124:	trap_Cvar_Register ( NULL, "ui_r_texturemode",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2547
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4125
;4125:	trap_Cvar_Register ( NULL, "ui_r_detailtextures",		"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2591
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4126
;4126:	trap_Cvar_Register ( NULL, "ui_r_ext_compress_textures","0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2593
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4127
;4127:	trap_Cvar_Register ( NULL, "ui_r_depthbits",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2521
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4128
;4128:	trap_Cvar_Register ( NULL, "ui_r_subdivisions",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2532
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4129
;4129:	trap_Cvar_Register ( NULL, "ui_r_fastSky",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2545
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4130
;4130:	trap_Cvar_Register ( NULL, "ui_r_inGameVideo",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2546
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4131
;4131:	trap_Cvar_Register ( NULL, "ui_r_allowExtensions",		"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2599
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4132
;4132:	trap_Cvar_Register ( NULL, "ui_cg_shadows",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2601
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4133
;4133:	trap_Cvar_Register ( NULL, "ui_r_modified",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2568
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4136
;4134:	
;4135:	// Copy over the real video cvars into their temporary counterparts
;4136:	trap_Cvar_Set ( "ui_r_mode",		UI_Cvar_VariableString ( "r_mode" ) );
ADDRGP4 $2582
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2543
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4137
;4137:	trap_Cvar_Set ( "ui_r_colorbits",	UI_Cvar_VariableString ( "r_colorbits" ) );
ADDRGP4 $2585
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2517
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4138
;4138:	trap_Cvar_Set ( "ui_r_fullscreen",	UI_Cvar_VariableString ( "r_fullscreen" ) );
ADDRGP4 $2583
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2584
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4139
;4139:	trap_Cvar_Set ( "ui_r_lodbias",		UI_Cvar_VariableString ( "r_lodbias" ) );
ADDRGP4 $2586
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2528
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4140
;4140:	trap_Cvar_Set ( "ui_r_picmip",		UI_Cvar_VariableString ( "r_picmip" ) );
ADDRGP4 $2587
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2542
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4141
;4141:	trap_Cvar_Set ( "ui_r_texturebits", UI_Cvar_VariableString ( "r_texturebits" ) );
ADDRGP4 $2588
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2544
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4142
;4142:	trap_Cvar_Set ( "ui_r_texturemode", UI_Cvar_VariableString ( "r_texturemode" ) );
ADDRGP4 $2589
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2547
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4143
;4143:	trap_Cvar_Set ( "ui_r_detailtextures", UI_Cvar_VariableString ( "r_detailtextures" ) );
ADDRGP4 $2590
ARGP4
ADDRLP4 28
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2591
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4144
;4144:	trap_Cvar_Set ( "ui_r_ext_compress_textures", UI_Cvar_VariableString ( "r_ext_compress_textures" ) );
ADDRGP4 $2592
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2593
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4145
;4145:	trap_Cvar_Set ( "ui_r_depthbits", UI_Cvar_VariableString ( "r_depthbits" ) );
ADDRGP4 $2594
ARGP4
ADDRLP4 36
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2521
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4146
;4146:	trap_Cvar_Set ( "ui_r_subdivisions", UI_Cvar_VariableString ( "r_subdivisions" ) );
ADDRGP4 $2595
ARGP4
ADDRLP4 40
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2532
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4147
;4147:	trap_Cvar_Set ( "ui_r_fastSky", UI_Cvar_VariableString ( "r_fastSky" ) );
ADDRGP4 $2596
ARGP4
ADDRLP4 44
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2545
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4148
;4148:	trap_Cvar_Set ( "ui_r_inGameVideo", UI_Cvar_VariableString ( "r_inGameVideo" ) );
ADDRGP4 $2597
ARGP4
ADDRLP4 48
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2546
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4149
;4149:	trap_Cvar_Set ( "ui_r_allowExtensions", UI_Cvar_VariableString ( "r_allowExtensions" ) );
ADDRGP4 $2598
ARGP4
ADDRLP4 52
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2599
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4150
;4150:	trap_Cvar_Set ( "ui_cg_shadows", UI_Cvar_VariableString ( "cg_shadows" ) );
ADDRGP4 $2600
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2601
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4151
;4151:	trap_Cvar_Set ( "ui_r_modified", "0" );
ADDRGP4 $2568
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4152
;4152:}
LABELV $2603
endproc UI_GetVideoSetup 60 16
proc UI_RunMenuScript 1300 24
line 4155
;4153:
;4154:static void UI_RunMenuScript(char **args) 
;4155:{
line 4159
;4156:	const char *name, *name2;
;4157:	char buff[1024];
;4158:
;4159:	if (String_Parse(args, &name)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1032
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $2606
line 4160
;4160:	{
line 4161
;4161:		if (Q_stricmp(name, "StartServer") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2610
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $2608
line 4162
;4162:		{
line 4163
;4163:			int i, added = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 4165
;4164:			float skill;
;4165:			int warmupTime = 0;
ADDRLP4 1048
CNSTI4 0
ASGNI4
line 4166
;4166:			int doWarmup = 0;
ADDRLP4 1056
CNSTI4 0
ASGNI4
line 4168
;4167:
;4168:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $352
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4169
;4169:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $350
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4170
;4170:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2387
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4171
;4171:			trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, ui_dedicated.integer ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRGP4 ui_dedicated+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1060
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $2611
ARGP4
ADDRLP4 1060
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4172
;4172:			trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 8, uiInfo.gameTypes[ui_netGameType.integer].gtEnum ) );
CNSTF4 0
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1064
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $883
ARGP4
ADDRLP4 1064
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4173
;4173:			trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 1068
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2403
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4174
;4174:			trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 1072
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2404
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4175
;4175:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName ) );
ADDRGP4 $2380
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4176
;4176:			skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1052
ADDRLP4 1080
INDIRF4
ASGNF4
line 4179
;4177:
;4178:			//Cap the warmup values in case the user tries a dumb setting.
;4179:			warmupTime = trap_Cvar_VariableValue( "g_warmup" );
ADDRGP4 $2399
ARGP4
ADDRLP4 1084
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1048
ADDRLP4 1084
INDIRF4
CVFI4 4
ASGNI4
line 4180
;4180:			doWarmup = trap_Cvar_VariableValue( "g_doWarmup" );
ADDRGP4 $2394
ARGP4
ADDRLP4 1088
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1056
ADDRLP4 1088
INDIRF4
CVFI4 4
ASGNI4
line 4182
;4181:
;4182:			if (doWarmup && warmupTime < 1)
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $2619
ADDRLP4 1048
INDIRI4
CNSTI4 1
GEI4 $2619
line 4183
;4183:			{
line 4184
;4184:				trap_Cvar_Set("g_doWarmup", "0");
ADDRGP4 $2394
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4185
;4185:			}
LABELV $2619
line 4186
;4186:			if (warmupTime < 5)
ADDRLP4 1048
INDIRI4
CNSTI4 5
GEI4 $2621
line 4187
;4187:			{
line 4188
;4188:				trap_Cvar_Set("g_warmup", "5");
ADDRGP4 $2399
ARGP4
ADDRGP4 $693
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4189
;4189:			}
LABELV $2621
line 4190
;4190:			if (warmupTime > 120)
ADDRLP4 1048
INDIRI4
CNSTI4 120
LEI4 $2623
line 4191
;4191:			{
line 4192
;4192:				trap_Cvar_Set("g_warmup", "120");
ADDRGP4 $2399
ARGP4
ADDRGP4 $2625
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4193
;4193:			}
LABELV $2623
line 4195
;4194:
;4195:			if (trap_Cvar_VariableValue( "g_gametype" ) == GT_TOURNAMENT)
ADDRGP4 $883
ARGP4
ADDRLP4 1092
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1092
INDIRF4
CNSTF4 1077936128
NEF4 $2626
line 4196
;4196:			{ //always set fraglimit 1 when starting a duel game
line 4197
;4197:				trap_Cvar_Set("fraglimit", "1");
ADDRGP4 $705
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4198
;4198:			}
LABELV $2626
line 4200
;4199:
;4200:			for (i = 0; i < PLAYERS_PER_TEAM; i++) 
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $2628
line 4201
;4201:			{
line 4202
;4202:				int bot = trap_Cvar_VariableValue( va("ui_blueteam%i", i+1));
ADDRGP4 $942
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1096
ADDRLP4 1108
INDIRF4
CVFI4 4
ASGNI4
line 4203
;4203:				int maxcl = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $947
ARGP4
ADDRLP4 1112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1100
ADDRLP4 1112
INDIRF4
CVFI4 4
ASGNI4
line 4205
;4204:
;4205:				if (bot > 1) 
ADDRLP4 1096
INDIRI4
CNSTI4 1
LEI4 $2632
line 4206
;4206:				{
line 4207
;4207:					int numval = i+1;
ADDRLP4 1116
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4209
;4208:
;4209:					numval *= 2;
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 4211
;4210:
;4211:					numval -= 1;
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4213
;4212:
;4213:					if (numval <= maxcl)
ADDRLP4 1116
INDIRI4
ADDRLP4 1100
INDIRI4
GTI4 $2634
line 4214
;4214:					{
line 4215
;4215:						if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 5
LTI4 $2636
line 4216
;4216:							Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", UI_GetBotNameByNumber(bot-2), skill, "Blue");
ADDRLP4 1096
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1120
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2639
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 $935
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4217
;4217:						} else {
ADDRGP4 $2637
JUMPV
LABELV $2636
line 4218
;4218:							Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1096
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1120
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2640
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 4219
;4219:						}
LABELV $2637
line 4220
;4220:						trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4221
;4221:						added++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4222
;4222:					}
LABELV $2634
line 4223
;4223:				}
LABELV $2632
line 4224
;4224:				bot = trap_Cvar_VariableValue( va("ui_redteam%i", i+1));
ADDRGP4 $943
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1096
ADDRLP4 1120
INDIRF4
CVFI4 4
ASGNI4
line 4225
;4225:				if (bot > 1) {
ADDRLP4 1096
INDIRI4
CNSTI4 1
LEI4 $2641
line 4226
;4226:					int numval = i+1;
ADDRLP4 1124
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4228
;4227:
;4228:					numval *= 2;
ADDRLP4 1124
ADDRLP4 1124
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 4230
;4229:
;4230:					if (numval <= maxcl)
ADDRLP4 1124
INDIRI4
ADDRLP4 1100
INDIRI4
GTI4 $2643
line 4231
;4231:					{
line 4232
;4232:						if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 5
LTI4 $2645
line 4233
;4233:							Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", UI_GetBotNameByNumber(bot-2), skill, "Red");
ADDRLP4 1096
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1128
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2639
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 $936
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4234
;4234:						} else {
ADDRGP4 $2646
JUMPV
LABELV $2645
line 4235
;4235:							Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1096
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1128
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2640
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 4236
;4236:						}
LABELV $2646
line 4237
;4237:						trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4238
;4238:						added++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4239
;4239:					}
LABELV $2643
line 4240
;4240:				}
LABELV $2641
line 4241
;4241:				if (added >= maxcl)
ADDRLP4 1044
INDIRI4
ADDRLP4 1100
INDIRI4
LTI4 $2648
line 4242
;4242:				{ //this means the client filled up all their slots in the UI with bots. So stretch out an extra slot for them, and then stop adding bots.
line 4243
;4243:					trap_Cvar_Set("sv_maxClients", va("%i", added+1));
ADDRGP4 $1406
ARGP4
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $947
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4244
;4244:					break;
ADDRGP4 $2609
JUMPV
LABELV $2648
line 4246
;4245:				}
;4246:			}
LABELV $2629
line 4200
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 8
LTI4 $2628
line 4247
;4247:		} else if (Q_stricmp(name, "updateSPMenu") == 0) {
ADDRGP4 $2609
JUMPV
LABELV $2608
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2652
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2650
line 4248
;4248:			UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 4249
;4249:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 4250
;4250:			ui_mapIndex.integer = UI_GetIndexFromSelection(ui_currentMap.integer);
ADDRGP4 ui_currentMap+12
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 UI_GetIndexFromSelection
CALLI4
ASGNI4
ADDRGP4 ui_mapIndex+12
ADDRLP4 1044
INDIRI4
ASGNI4
line 4251
;4251:			trap_Cvar_Set("ui_mapIndex", va("%d", ui_mapIndex.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2374
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4252
;4252:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, ui_mapIndex.integer, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRGP4 $2370
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4253
;4253:			UI_GameType_HandleKey(0, 0, A_MOUSE1, qfalse);
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 141
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 4254
;4254:			UI_GameType_HandleKey(0, 0, A_MOUSE2, qfalse);
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 142
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 4255
;4255:		} else if (Q_stricmp(name, "resetDefaults") == 0) {
ADDRGP4 $2651
JUMPV
LABELV $2650
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2659
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2657
line 4256
;4256:			trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $2660
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4257
;4257:			trap_Cmd_ExecuteText( EXEC_APPEND, "exec mpdefault.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $2661
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4258
;4258:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2662
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4259
;4259:			trap_Cvar_Set("com_introPlayed", "1" );
ADDRGP4 $2663
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4293
;4260:#ifdef USE_CD_KEY
;4261:		} else if (Q_stricmp(name, "getCDKey") == 0) {
;4262:			char out[17];
;4263:			trap_GetCDKey(buff, 17);
;4264:			trap_Cvar_Set("cdkey1", "");
;4265:			trap_Cvar_Set("cdkey2", "");
;4266:			trap_Cvar_Set("cdkey3", "");
;4267:			trap_Cvar_Set("cdkey4", "");
;4268:			if (strlen(buff) == CDKEY_LEN) {
;4269:				Q_strncpyz(out, buff, 5);
;4270:				trap_Cvar_Set("cdkey1", out);
;4271:				Q_strncpyz(out, buff + 4, 5);
;4272:				trap_Cvar_Set("cdkey2", out);
;4273:				Q_strncpyz(out, buff + 8, 5);
;4274:				trap_Cvar_Set("cdkey3", out);
;4275:				Q_strncpyz(out, buff + 12, 5);
;4276:				trap_Cvar_Set("cdkey4", out);
;4277:			}
;4278:
;4279:		} else if (Q_stricmp(name, "verifyCDKey") == 0) {
;4280:			buff[0] = '\0';
;4281:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey1")); 
;4282:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey2")); 
;4283:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey3")); 
;4284:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey4")); 
;4285:			trap_Cvar_Set("cdkey", buff);
;4286:			if (trap_VerifyCDKey(buff, UI_Cvar_VariableString("cdkeychecksum"))) {
;4287:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key Appears to be valid.");
;4288:				trap_SetCDKey(buff);
;4289:			} else {
;4290:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key does not appear to be valid.");
;4291:			}
;4292:#endif // USE_CD_KEY
;4293:		} else if (Q_stricmp(name, "loadArenas") == 0) {
ADDRGP4 $2658
JUMPV
LABELV $2657
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2666
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2664
line 4294
;4294:			UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 4295
;4295:			UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 4296
;4296:			Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, gUISelectedMap, "createserver");
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 gUISelectedMap
INDIRI4
ARGI4
ADDRGP4 $2667
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4297
;4297:			uiForceRank = trap_Cvar_VariableValue("g_maxForceRank");
ADDRGP4 $2668
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiForceRank
ADDRLP4 1052
INDIRF4
CVFI4 4
ASGNI4
line 4298
;4298:		} else if (Q_stricmp(name, "saveControls") == 0) {
ADDRGP4 $2665
JUMPV
LABELV $2664
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2671
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2669
line 4299
;4299:			Controls_SetConfig(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 4300
;4300:		} else if (Q_stricmp(name, "loadControls") == 0) {
ADDRGP4 $2670
JUMPV
LABELV $2669
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2674
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2672
line 4301
;4301:			Controls_GetConfig();
ADDRGP4 Controls_GetConfig
CALLV
pop
line 4302
;4302:		} else if (Q_stricmp(name, "clearError") == 0) {
ADDRGP4 $2673
JUMPV
LABELV $2672
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2677
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2675
line 4303
;4303:			trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2678
ARGP4
ADDRGP4 $165
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4304
;4304:		} else if (Q_stricmp(name, "loadGameInfo") == 0) {
ADDRGP4 $2676
JUMPV
LABELV $2675
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2681
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2679
line 4308
;4305:#ifdef PRE_RELEASE_TADEMO
;4306:			UI_ParseGameInfo("demogameinfo.txt");
;4307:#else
;4308:			UI_ParseGameInfo("ui/jk2mp/gameinfo.txt");
ADDRGP4 $673
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 4310
;4309:#endif
;4310:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 4311
;4311:		} else if (Q_stricmp(name, "resetScores") == 0) {
ADDRGP4 $2680
JUMPV
LABELV $2679
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2690
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $2688
line 4312
;4312:			UI_ClearScores();
ADDRGP4 UI_ClearScores
CALLV
pop
line 4313
;4313:		} else if (Q_stricmp(name, "RefreshServers") == 0) {
ADDRGP4 $2689
JUMPV
LABELV $2688
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2693
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $2691
line 4314
;4314:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4315
;4315:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4316
;4316:		} else if (Q_stricmp(name, "RefreshFilter") == 0) {
ADDRGP4 $2692
JUMPV
LABELV $2691
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2696
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $2694
line 4317
;4317:			UI_StartServerRefresh(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4318
;4318:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4319
;4319:		} else if (Q_stricmp(name, "RunSPDemo") == 0) {
ADDRGP4 $2695
JUMPV
LABELV $2694
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2699
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $2697
line 4320
;4320:			if (uiInfo.demoAvailable) {
ADDRGP4 uiInfo+11832
INDIRI4
CNSTI4 0
EQI4 $2698
line 4321
;4321:			  trap_Cmd_ExecuteText( EXEC_APPEND, va("demo %s_%i\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum));
ADDRGP4 $2703
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4322
;4322:			}
line 4323
;4323:		} else if (Q_stricmp(name, "LoadDemos") == 0) {
ADDRGP4 $2698
JUMPV
LABELV $2697
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2712
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $2710
line 4324
;4324:			UI_LoadDemos();
ADDRGP4 UI_LoadDemos
CALLV
pop
line 4325
;4325:		} else if (Q_stricmp(name, "LoadMovies") == 0) {
ADDRGP4 $2711
JUMPV
LABELV $2710
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2715
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $2713
line 4326
;4326:			UI_LoadMovies();
ADDRGP4 UI_LoadMovies
CALLV
pop
line 4327
;4327:		} else if (Q_stricmp(name, "LoadMods") == 0) {
ADDRGP4 $2714
JUMPV
LABELV $2713
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2718
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $2716
line 4328
;4328:			UI_LoadMods();
ADDRGP4 UI_LoadMods
CALLV
pop
line 4329
;4329:		} else if (Q_stricmp(name, "playMovie") == 0) {
ADDRGP4 $2717
JUMPV
LABELV $2716
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2721
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $2719
line 4330
;4330:			if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+36380
INDIRI4
CNSTI4 0
LTI4 $2722
line 4331
;4331:			  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4332
;4332:			}
LABELV $2722
line 4333
;4333:			trap_Cmd_ExecuteText( EXEC_APPEND, va("cinematic %s.roq 2\n", uiInfo.movieList[uiInfo.movieIndex]));
ADDRGP4 $2726
ARGP4
ADDRGP4 uiInfo+36376
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+35348
ADDP4
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4334
;4334:		} else if (Q_stricmp(name, "RunMod") == 0) {
ADDRGP4 $2720
JUMPV
LABELV $2719
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2731
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $2729
line 4335
;4335:			trap_Cvar_Set( "fs_game", uiInfo.modList[uiInfo.modIndex].modName);
ADDRGP4 $2732
ARGP4
ADDRGP4 uiInfo+34312
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4336
;4336:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2602
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4337
;4337:		} else if (Q_stricmp(name, "RunDemo") == 0) {
ADDRGP4 $2730
JUMPV
LABELV $2729
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2737
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $2735
line 4338
;4338:			trap_Cmd_ExecuteText( EXEC_APPEND, va("demo \"%s\"\n", uiInfo.demoList[uiInfo.demoIndex]));
ADDRGP4 $2738
ARGP4
ADDRGP4 uiInfo+35344
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+34316
ADDP4
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4339
;4339:		} else if (Q_stricmp(name, "Quake3") == 0) {
ADDRGP4 $2736
JUMPV
LABELV $2735
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2743
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $2741
line 4340
;4340:			trap_Cvar_Set( "fs_game", "");
ADDRGP4 $2732
ARGP4
ADDRGP4 $165
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4341
;4341:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2602
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4342
;4342:		} else if (Q_stricmp(name, "closeJoin") == 0) {
ADDRGP4 $2742
JUMPV
LABELV $2741
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2746
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2744
line 4343
;4343:			if (uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+40740+2212
INDIRI4
CNSTI4 0
EQI4 $2747
line 4344
;4344:				UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 4345
;4345:				uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+40740+10420
CNSTI4 0
ASGNI4
line 4346
;4346:				uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+55524
CNSTI4 0
ASGNI4
line 4347
;4347:				uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+60852
CNSTI4 0
ASGNI4
line 4348
;4348:				UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4349
;4349:			} else {
ADDRGP4 $2745
JUMPV
LABELV $2747
line 4350
;4350:				Menus_CloseByName("joinserver");
ADDRGP4 $2755
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 4351
;4351:				Menus_OpenByName("main");
ADDRGP4 $2756
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 4352
;4352:			}
line 4353
;4353:		} else if (Q_stricmp(name, "StopRefresh") == 0) {
ADDRGP4 $2745
JUMPV
LABELV $2744
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2759
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2757
line 4354
;4354:			UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 4355
;4355:			uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+40740+10420
CNSTI4 0
ASGNI4
line 4356
;4356:			uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+55524
CNSTI4 0
ASGNI4
line 4357
;4357:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+60852
CNSTI4 0
ASGNI4
line 4358
;4358:		} else if (Q_stricmp(name, "UpdateFilter") == 0) {
ADDRGP4 $2758
JUMPV
LABELV $2757
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2766
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2764
line 4359
;4359:			if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $2767
line 4360
;4360:				UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4361
;4361:			}
LABELV $2767
line 4362
;4362:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4363
;4363:			UI_FeederSelection(FEEDER_SERVERS, 0);
CNSTF4 1073741824
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLI4
pop
line 4364
;4364:		} else if (Q_stricmp(name, "ServerStatus") == 0) {
ADDRGP4 $2765
JUMPV
LABELV $2764
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2772
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $2770
line 4365
;4365:			trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], uiInfo.serverStatusAddress, sizeof(uiInfo.serverStatusAddress));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 uiInfo+52224
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 4366
;4366:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 4367
;4367:		} else if (Q_stricmp(name, "FoundPlayerServerStatus") == 0) {
ADDRGP4 $2771
JUMPV
LABELV $2770
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2782
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $2780
line 4368
;4368:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+52224
ARGP4
ADDRGP4 uiInfo+60844
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+58796
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4369
;4369:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 4370
;4370:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4371
;4371:		} else if (Q_stricmp(name, "FindPlayer") == 0) {
ADDRGP4 $2781
JUMPV
LABELV $2780
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2789
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $2787
line 4372
;4372:			UI_BuildFindPlayerList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 4374
;4373:			// clear the displayed server status info
;4374:			uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+52288+3232
CNSTI4 0
ASGNI4
line 4375
;4375:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4376
;4376:		} else if (Q_stricmp(name, "JoinServer") == 0) {
ADDRGP4 $2788
JUMPV
LABELV $2787
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2794
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $2792
line 4377
;4377:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $352
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4378
;4378:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $350
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4379
;4379:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2387
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4380
;4380:			if (uiInfo.serverStatus.currentServer >= 0 && uiInfo.serverStatus.currentServer < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 0
LTI4 $2793
ADDRGP4 uiInfo+40740+2216
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
GEI4 $2793
line 4381
;4381:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, 1024);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 4382
;4382:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", buff ) );
ADDRGP4 $2808
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4383
;4383:			}
line 4384
;4384:		} else if (Q_stricmp(name, "FoundPlayerJoinServer") == 0) {
ADDRGP4 $2793
JUMPV
LABELV $2792
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2811
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $2809
line 4385
;4385:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2387
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4386
;4386:			if (uiInfo.currentFoundPlayerServer >= 0 && uiInfo.currentFoundPlayerServer < uiInfo.numFoundPlayerServers) {
ADDRGP4 uiInfo+60844
INDIRI4
CNSTI4 0
LTI4 $2810
ADDRGP4 uiInfo+60844
INDIRI4
ADDRGP4 uiInfo+60848
INDIRI4
GEI4 $2810
line 4387
;4387:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer] ) );
ADDRGP4 $2808
ARGP4
ADDRGP4 uiInfo+60844
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+58796
ADDP4
ARGP4
ADDRLP4 1144
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4388
;4388:			}
line 4389
;4389:		} else if (Q_stricmp(name, "Quit") == 0) {
ADDRGP4 $2810
JUMPV
LABELV $2809
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2821
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $2819
line 4390
;4390:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2387
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4391
;4391:			trap_Cmd_ExecuteText( EXEC_NOW, "quit");
CNSTI4 0
ARGI4
ADDRGP4 $2822
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4392
;4392:		} else if (Q_stricmp(name, "Controls") == 0) {
ADDRGP4 $2820
JUMPV
LABELV $2819
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2825
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $2823
line 4393
;4393:		  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4394
;4394:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4395
;4395:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4396
;4396:			Menus_ActivateByName("setup_menu2");
ADDRGP4 $2827
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 4397
;4397:		} 
ADDRGP4 $2824
JUMPV
LABELV $2823
line 4398
;4398:		else if (Q_stricmp(name, "Leave") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2830
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $2828
line 4399
;4399:		{
line 4400
;4400:			trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2831
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4401
;4401:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4402
;4402:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4403
;4403:			Menus_ActivateByName("main");
ADDRGP4 $2756
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 4404
;4404:		} 
ADDRGP4 $2829
JUMPV
LABELV $2828
line 4405
;4405:		else if (Q_stricmp(name, "getvideosetup") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2834
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $2832
line 4406
;4406:		{
line 4407
;4407:			UI_GetVideoSetup ( );
ADDRGP4 UI_GetVideoSetup
CALLV
pop
line 4408
;4408:		}
ADDRGP4 $2833
JUMPV
LABELV $2832
line 4409
;4409:		else if (Q_stricmp(name, "updatevideosetup") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2837
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $2835
line 4410
;4410:		{
line 4411
;4411:			UI_UpdateVideoSetup ( );
ADDRGP4 UI_UpdateVideoSetup
CALLV
pop
line 4412
;4412:		}
ADDRGP4 $2836
JUMPV
LABELV $2835
line 4413
;4413:		else if (Q_stricmp(name, "ServerSort") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2840
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $2838
line 4414
;4414:		{
line 4416
;4415:			int sortColumn;
;4416:			if (Int_Parse(args, &sortColumn)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1168
ARGP4
ADDRLP4 1172
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
EQI4 $2839
line 4418
;4417:				// if same column we're already sorting on then flip the direction
;4418:				if (sortColumn == uiInfo.serverStatus.sortKey) {
ADDRLP4 1168
INDIRI4
ADDRGP4 uiInfo+40740+2200
INDIRI4
NEI4 $2843
line 4419
;4419:					uiInfo.serverStatus.sortDir = !uiInfo.serverStatus.sortDir;
ADDRGP4 uiInfo+40740+2204
INDIRI4
CNSTI4 0
NEI4 $2852
ADDRLP4 1176
CNSTI4 1
ASGNI4
ADDRGP4 $2853
JUMPV
LABELV $2852
ADDRLP4 1176
CNSTI4 0
ASGNI4
LABELV $2853
ADDRGP4 uiInfo+40740+2204
ADDRLP4 1176
INDIRI4
ASGNI4
line 4420
;4420:				}
LABELV $2843
line 4422
;4421:				// make sure we sort again
;4422:				UI_ServersSort(sortColumn, qtrue);
ADDRLP4 1168
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_ServersSort
CALLV
pop
line 4423
;4423:			}
line 4424
;4424:		} else if (Q_stricmp(name, "nextSkirmish") == 0) {
ADDRGP4 $2839
JUMPV
LABELV $2838
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2856
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $2854
line 4425
;4425:			UI_StartSkirmish(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 4426
;4426:		} else if (Q_stricmp(name, "SkirmishStart") == 0) {
ADDRGP4 $2855
JUMPV
LABELV $2854
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2859
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $2857
line 4427
;4427:			UI_StartSkirmish(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 4428
;4428:		} else if (Q_stricmp(name, "closeingame") == 0) {
ADDRGP4 $2858
JUMPV
LABELV $2857
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2862
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $2860
line 4429
;4429:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1180
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4430
;4430:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4431
;4431:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4432
;4432:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4433
;4433:		} else if (Q_stricmp(name, "voteMap") == 0) {
ADDRGP4 $2861
JUMPV
LABELV $2860
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2865
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $2863
line 4434
;4434:			if (ui_currentNetMap.integer >=0 && ui_currentNetMap.integer < uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $2864
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
GEI4 $2864
line 4435
;4435:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote map %s\n",uiInfo.mapList[ui_currentNetMap.integer].mapLoadName) );
ADDRGP4 $2871
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4436
;4436:			}
line 4437
;4437:		} else if (Q_stricmp(name, "voteKick") == 0) {
ADDRGP4 $2864
JUMPV
LABELV $2863
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2877
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $2875
line 4438
;4438:			if (uiInfo.playerIndex >= 0 && uiInfo.playerIndex < uiInfo.playerCount) {
ADDRGP4 uiInfo+18028
INDIRI4
CNSTI4 0
LTI4 $2876
ADDRGP4 uiInfo+18028
INDIRI4
ADDRGP4 uiInfo+18012
INDIRI4
GEI4 $2876
line 4440
;4439:				//trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote kick \"%s\"\n",uiInfo.playerNames[uiInfo.playerIndex]) );
;4440:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote clientkick \"%i\"\n",uiInfo.playerIndexes[uiInfo.playerIndex]) );
ADDRGP4 $2883
ARGP4
ADDRGP4 uiInfo+18028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20216
ADDP4
INDIRI4
ARGI4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4441
;4441:			}
line 4442
;4442:		} else if (Q_stricmp(name, "voteGame") == 0) {
ADDRGP4 $2876
JUMPV
LABELV $2875
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2888
ARGP4
ADDRLP4 1188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
NEI4 $2886
line 4443
;4443:			if (ui_netGameType.integer >= 0 && ui_netGameType.integer < uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $2887
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
GEI4 $2887
line 4444
;4444:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote g_gametype %i\n",uiInfo.gameTypes[ui_netGameType.integer].gtEnum) );
ADDRGP4 $2894
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1192
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4445
;4445:			}
line 4446
;4446:		} else if (Q_stricmp(name, "voteLeader") == 0) {
ADDRGP4 $2887
JUMPV
LABELV $2886
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2900
ARGP4
ADDRLP4 1192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
NEI4 $2898
line 4447
;4447:			if (uiInfo.teamIndex >= 0 && uiInfo.teamIndex < uiInfo.myTeamCount) {
ADDRGP4 uiInfo+18020
INDIRI4
CNSTI4 0
LTI4 $2899
ADDRGP4 uiInfo+18020
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $2899
line 4448
;4448:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callteamvote leader \"%s\"\n",uiInfo.teamNames[uiInfo.teamIndex]) );
ADDRGP4 $2906
ARGP4
ADDRGP4 uiInfo+18020
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4449
;4449:			}
line 4450
;4450:		} else if (Q_stricmp(name, "addBot") == 0) {
ADDRGP4 $2899
JUMPV
LABELV $2898
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2911
ARGP4
ADDRLP4 1196
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
NEI4 $2909
line 4451
;4451:			if (trap_Cvar_VariableValue("g_gametype") >= GT_TEAM) {
ADDRGP4 $883
ARGP4
ADDRLP4 1200
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1200
INDIRF4
CNSTF4 1084227584
LTF4 $2912
line 4452
;4452:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", UI_GetBotNameByNumber(uiInfo.botIndex), uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "Red" : "Blue") );
ADDRGP4 uiInfo+11844
INDIRI4
ARGI4
ADDRLP4 1208
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRGP4 $2914
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+18008
INDIRI4
CNSTI4 0
NEI4 $2919
ADDRLP4 1204
ADDRGP4 $936
ASGNP4
ADDRGP4 $2920
JUMPV
LABELV $2919
ADDRLP4 1204
ADDRGP4 $935
ASGNP4
LABELV $2920
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4453
;4453:			} else {
ADDRGP4 $2910
JUMPV
LABELV $2912
line 4454
;4454:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", UI_GetBotNameByNumber(uiInfo.botIndex), uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "Red" : "Blue") );
ADDRGP4 uiInfo+11844
INDIRI4
ARGI4
ADDRLP4 1208
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRGP4 $2914
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+18008
INDIRI4
CNSTI4 0
NEI4 $2925
ADDRLP4 1204
ADDRGP4 $936
ASGNP4
ADDRGP4 $2926
JUMPV
LABELV $2925
ADDRLP4 1204
ADDRGP4 $935
ASGNP4
LABELV $2926
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4455
;4455:			}
line 4456
;4456:		} else if (Q_stricmp(name, "addFavorite") == 0) 
ADDRGP4 $2910
JUMPV
LABELV $2909
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2929
ARGP4
ADDRLP4 1200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $2927
line 4457
;4457:		{
line 4458
;4458:			if (ui_netSource.integer != AS_FAVORITES) 
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $2928
line 4459
;4459:			{
line 4464
;4460:				char name[MAX_NAME_LENGTH];
;4461:				char addr[MAX_NAME_LENGTH];
;4462:				int res;
;4463:
;4464:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4465
;4465:				name[0] = addr[0] = '\0';
ADDRLP4 1272
CNSTI1 0
ASGNI1
ADDRLP4 1204
ADDRLP4 1272
INDIRI1
ASGNI1
ADDRLP4 1236
ADDRLP4 1272
INDIRI1
ASGNI1
line 4466
;4466:				Q_strncpyz(name, 	Info_ValueForKey(buff, "hostname"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 1276
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1236
ARGP4
ADDRLP4 1276
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4467
;4467:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2939
ARGP4
ADDRLP4 1280
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1204
ARGP4
ADDRLP4 1280
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4468
;4468:				if (strlen(name) > 0 && strlen(addr) > 0) 
ADDRLP4 1236
ARGP4
ADDRLP4 1284
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 0
LEI4 $2928
ADDRLP4 1204
ARGP4
ADDRLP4 1288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 0
LEI4 $2928
line 4469
;4469:				{
line 4470
;4470:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 2
ARGI4
ADDRLP4 1236
ARGP4
ADDRLP4 1204
ARGP4
ADDRLP4 1292
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1268
ADDRLP4 1292
INDIRI4
ASGNI4
line 4471
;4471:					if (res == 0) 
ADDRLP4 1268
INDIRI4
CNSTI4 0
NEI4 $2942
line 4472
;4472:					{
line 4474
;4473:						// server already in the list
;4474:						Com_Printf("Favorite already in list\n");
ADDRGP4 $2944
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4475
;4475:					}
ADDRGP4 $2928
JUMPV
LABELV $2942
line 4476
;4476:					else if (res == -1) 
ADDRLP4 1268
INDIRI4
CNSTI4 -1
NEI4 $2945
line 4477
;4477:					{
line 4479
;4478:						// list full
;4479:						Com_Printf("Favorite list full\n");
ADDRGP4 $2947
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4480
;4480:					}
ADDRGP4 $2928
JUMPV
LABELV $2945
line 4482
;4481:					else 
;4482:					{
line 4484
;4483:						// successfully added
;4484:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $2948
ARGP4
ADDRLP4 1204
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4490
;4485:
;4486:
;4487://						trap_SP_GetStringTextString((char *)va("%s_GETTINGINFOFORSERVERS",uiInfo.uiDC.Assets.stripedFile), holdSPString, sizeof(holdSPString));
;4488://						Text_Paint(rect->x, rect->y, scale, newColor, va((char *) holdSPString, trap_LAN_GetServerCount(ui_netSource.integer)), 0, 0, textStyle);
;4489:
;4490:					}
line 4491
;4491:				}
line 4492
;4492:			}
line 4493
;4493:		} 
ADDRGP4 $2928
JUMPV
LABELV $2927
line 4494
;4494:		else if (Q_stricmp(name, "deleteFavorite") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2951
ARGP4
ADDRLP4 1204
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $2949
line 4495
;4495:		{
line 4496
;4496:			if (ui_netSource.integer == AS_FAVORITES) 
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $2950
line 4497
;4497:			{
line 4499
;4498:				char addr[MAX_NAME_LENGTH];
;4499:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4500
;4500:				addr[0] = '\0';
ADDRLP4 1208
CNSTI1 0
ASGNI1
line 4501
;4501:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2939
ARGP4
ADDRLP4 1240
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1208
ARGP4
ADDRLP4 1240
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4502
;4502:				if (strlen(addr) > 0) 
ADDRLP4 1208
ARGP4
ADDRLP4 1244
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
LEI4 $2950
line 4503
;4503:				{
line 4504
;4504:					trap_LAN_RemoveServer(AS_FAVORITES, addr);
CNSTI4 2
ARGI4
ADDRLP4 1208
ARGP4
ADDRGP4 trap_LAN_RemoveServer
CALLV
pop
line 4505
;4505:				}
line 4506
;4506:			}
line 4507
;4507:		} 
ADDRGP4 $2950
JUMPV
LABELV $2949
line 4508
;4508:		else if (Q_stricmp(name, "createFavorite") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2964
ARGP4
ADDRLP4 1208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
NEI4 $2962
line 4509
;4509:		{
line 4512
;4510:		//	if (ui_netSource.integer == AS_FAVORITES) 
;4511:		//rww - don't know why this check was here.. why would you want to only add new favorites when the filter was favorites?
;4512:			{
line 4517
;4513:				char name[MAX_NAME_LENGTH];
;4514:				char addr[MAX_NAME_LENGTH];
;4515:				int res;
;4516:
;4517:				name[0] = addr[0] = '\0';
ADDRLP4 1280
CNSTI1 0
ASGNI1
ADDRLP4 1212
ADDRLP4 1280
INDIRI1
ASGNI1
ADDRLP4 1244
ADDRLP4 1280
INDIRI1
ASGNI1
line 4518
;4518:				Q_strncpyz(name, 	UI_Cvar_VariableString("ui_favoriteName"), MAX_NAME_LENGTH);
ADDRGP4 $2965
ARGP4
ADDRLP4 1284
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1244
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4519
;4519:				Q_strncpyz(addr, 	UI_Cvar_VariableString("ui_favoriteAddress"), MAX_NAME_LENGTH);
ADDRGP4 $2966
ARGP4
ADDRLP4 1288
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1212
ARGP4
ADDRLP4 1288
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4520
;4520:				if (/*strlen(name) > 0 &&*/ strlen(addr) > 0) {
ADDRLP4 1212
ARGP4
ADDRLP4 1292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
CNSTI4 0
LEI4 $2963
line 4521
;4521:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 2
ARGI4
ADDRLP4 1244
ARGP4
ADDRLP4 1212
ARGP4
ADDRLP4 1296
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1276
ADDRLP4 1296
INDIRI4
ASGNI4
line 4522
;4522:					if (res == 0) {
ADDRLP4 1276
INDIRI4
CNSTI4 0
NEI4 $2969
line 4524
;4523:						// server already in the list
;4524:						Com_Printf("Favorite already in list\n");
ADDRGP4 $2944
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4525
;4525:					}
ADDRGP4 $2963
JUMPV
LABELV $2969
line 4526
;4526:					else if (res == -1) {
ADDRLP4 1276
INDIRI4
CNSTI4 -1
NEI4 $2971
line 4528
;4527:						// list full
;4528:						Com_Printf("Favorite list full\n");
ADDRGP4 $2947
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4529
;4529:					}
ADDRGP4 $2963
JUMPV
LABELV $2971
line 4530
;4530:					else {
line 4532
;4531:						// successfully added
;4532:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $2948
ARGP4
ADDRLP4 1212
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4533
;4533:					}
line 4534
;4534:				}
line 4535
;4535:			}
line 4536
;4536:		} else if (Q_stricmp(name, "orders") == 0) {
ADDRGP4 $2963
JUMPV
LABELV $2962
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2975
ARGP4
ADDRLP4 1212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
NEI4 $2973
line 4538
;4537:			const char *orders;
;4538:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1216
ARGP4
ADDRLP4 1220
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
EQI4 $2974
line 4539
;4539:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 1228
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1224
ADDRLP4 1228
INDIRF4
CVFI4 4
ASGNI4
line 4540
;4540:				if (selectedPlayer < uiInfo.myTeamCount) {
ADDRLP4 1224
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $2978
line 4541
;4541:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4542
;4542:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4543
;4543:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2982
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4544
;4544:				} else {
ADDRGP4 $2979
JUMPV
LABELV $2978
line 4546
;4545:					int i;
;4546:					for (i = 0; i < uiInfo.myTeamCount; i++) {
ADDRLP4 1232
CNSTI4 0
ASGNI4
ADDRGP4 $2986
JUMPV
LABELV $2983
line 4547
;4547:						if (Q_stricmp(UI_Cvar_VariableString("name"), uiInfo.teamNames[i]) == 0) {
ADDRGP4 $2499
ARGP4
ADDRLP4 1236
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $2988
line 4548
;4548:							continue;
ADDRGP4 $2984
JUMPV
LABELV $2988
line 4550
;4549:						}
;4550:						strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4551
;4551:						trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamNames[i]) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRLP4 1244
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1244
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4552
;4552:						trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2982
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4553
;4553:					}
LABELV $2984
line 4546
ADDRLP4 1232
ADDRLP4 1232
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2986
ADDRLP4 1232
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
LTI4 $2983
line 4554
;4554:				}
LABELV $2979
line 4555
;4555:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1232
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4556
;4556:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4557
;4557:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4558
;4558:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4559
;4559:			}
line 4560
;4560:		} else if (Q_stricmp(name, "voiceOrdersTeam") == 0) {
ADDRGP4 $2974
JUMPV
LABELV $2973
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2994
ARGP4
ADDRLP4 1216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 0
NEI4 $2992
line 4562
;4561:			const char *orders;
;4562:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1220
ARGP4
ADDRLP4 1224
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
EQI4 $2993
line 4563
;4563:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 1232
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1228
ADDRLP4 1232
INDIRF4
CVFI4 4
ASGNI4
line 4564
;4564:				if (selectedPlayer == uiInfo.myTeamCount) {
ADDRLP4 1228
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
NEI4 $2997
line 4565
;4565:					trap_Cmd_ExecuteText( EXEC_APPEND, orders );
CNSTI4 2
ARGI4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4566
;4566:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2982
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4567
;4567:				}
LABELV $2997
line 4568
;4568:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1236
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4569
;4569:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4570
;4570:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4571
;4571:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4572
;4572:			}
line 4573
;4573:		} else if (Q_stricmp(name, "voiceOrders") == 0) {
ADDRGP4 $2993
JUMPV
LABELV $2992
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3002
ARGP4
ADDRLP4 1220
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
NEI4 $3000
line 4575
;4574:			const char *orders;
;4575:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 1228
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
EQI4 $3001
line 4576
;4576:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 1236
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1232
ADDRLP4 1236
INDIRF4
CVFI4 4
ASGNI4
line 4578
;4577:
;4578:				if (selectedPlayer == uiInfo.myTeamCount)
ADDRLP4 1232
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
NEI4 $3005
line 4579
;4579:				{
line 4580
;4580:					selectedPlayer = -1;
ADDRLP4 1232
CNSTI4 -1
ASGNI4
line 4581
;4581:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4582
;4582:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, selectedPlayer) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
ARGI4
ADDRLP4 1240
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1240
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4583
;4583:				}
ADDRGP4 $3006
JUMPV
LABELV $3005
line 4585
;4584:				else
;4585:				{
line 4586
;4586:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4587
;4587:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
INDIRI4
ARGI4
ADDRLP4 1240
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1240
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4588
;4588:				}
LABELV $3006
line 4589
;4589:				trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2982
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4591
;4590:
;4591:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1240
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4592
;4592:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4593
;4593:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4594
;4594:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4595
;4595:			}
line 4596
;4596:		}
ADDRGP4 $3001
JUMPV
LABELV $3000
line 4597
;4597:		else if (Q_stricmp(name, "setForce") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3011
ARGP4
ADDRLP4 1224
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
NEI4 $3009
line 4598
;4598:		{
line 4601
;4599:			const char *teamArg;
;4600:
;4601:			if (String_Parse(args, &teamArg))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1228
ARGP4
ADDRLP4 1232
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $3012
line 4602
;4602:			{
line 4603
;4603:				if ( Q_stricmp( "none", teamArg ) == 0 )
ADDRGP4 $3016
ARGP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1236
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $3014
line 4604
;4604:				{
line 4605
;4605:					UI_UpdateClientForcePowers(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4606
;4606:				}
ADDRGP4 $3010
JUMPV
LABELV $3014
line 4607
;4607:				else if ( Q_stricmp( "same", teamArg ) == 0 )
ADDRGP4 $3019
ARGP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $3017
line 4608
;4608:				{//stay on current team
line 4609
;4609:					int myTeam = (int)(trap_Cvar_VariableValue("ui_myteam"));
ADDRGP4 $860
ARGP4
ADDRLP4 1248
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1244
ADDRLP4 1248
INDIRF4
CVFI4 4
ASGNI4
line 4610
;4610:					if ( myTeam != TEAM_SPECTATOR )
ADDRLP4 1244
INDIRI4
CNSTI4 3
EQI4 $3020
line 4611
;4611:					{
line 4612
;4612:						UI_UpdateClientForcePowers(UI_TeamName(myTeam));//will cause him to respawn, if it's been 5 seconds since last one
ADDRLP4 1244
INDIRI4
ARGI4
ADDRLP4 1252
ADDRGP4 UI_TeamName
CALLP4
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4613
;4613:					}
ADDRGP4 $3010
JUMPV
LABELV $3020
line 4615
;4614:					else
;4615:					{
line 4616
;4616:						UI_UpdateClientForcePowers(NULL);//just update powers
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4617
;4617:					}
line 4618
;4618:				}
ADDRGP4 $3010
JUMPV
LABELV $3017
line 4620
;4619:				else
;4620:				{
line 4621
;4621:					UI_UpdateClientForcePowers(teamArg);
ADDRLP4 1228
INDIRP4
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4622
;4622:				}
line 4623
;4623:			}
ADDRGP4 $3010
JUMPV
LABELV $3012
line 4625
;4624:			else
;4625:			{
line 4626
;4626:				UI_UpdateClientForcePowers(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4627
;4627:			}
line 4628
;4628:		}
ADDRGP4 $3010
JUMPV
LABELV $3009
line 4629
;4629:		else if (Q_stricmp(name, "saveTemplate") == 0) {
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3024
ARGP4
ADDRLP4 1228
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $3022
line 4630
;4630:			UI_SaveForceTemplate();
ADDRGP4 UI_SaveForceTemplate
CALLV
pop
line 4631
;4631:		} else if (Q_stricmp(name, "refreshForce") == 0) {
ADDRGP4 $3023
JUMPV
LABELV $3022
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3027
ARGP4
ADDRLP4 1232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $3025
line 4632
;4632:			UI_UpdateForcePowers();
ADDRGP4 UI_UpdateForcePowers
CALLV
pop
line 4633
;4633:		} else if (Q_stricmp(name, "glCustom") == 0) {
ADDRGP4 $3026
JUMPV
LABELV $3025
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3030
ARGP4
ADDRLP4 1236
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $3028
line 4634
;4634:			trap_Cvar_Set("ui_r_glCustom", "4");
ADDRGP4 $2537
ARGP4
ADDRGP4 $2604
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4635
;4635:		} 
ADDRGP4 $3029
JUMPV
LABELV $3028
line 4636
;4636:		else if (Q_stricmp(name, "forcePowersDisable") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3033
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $3031
line 4637
;4637:		{
line 4640
;4638:			int	forcePowerDisable,i;
;4639:
;4640:			forcePowerDisable = trap_Cvar_VariableValue("g_forcePowerDisable");
ADDRGP4 $905
ARGP4
ADDRLP4 1252
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1248
ADDRLP4 1252
INDIRF4
CVFI4 4
ASGNI4
line 4643
;4641:
;4642:			// It was set to something, so might as well make sure it got all flags set.
;4643:			if (forcePowerDisable)
ADDRLP4 1248
INDIRI4
CNSTI4 0
EQI4 $3032
line 4644
;4644:			{
line 4645
;4645:				for (i=0;i<NUM_FORCE_POWERS;i++)
ADDRLP4 1244
CNSTI4 0
ASGNI4
LABELV $3036
line 4646
;4646:				{
line 4647
;4647:					forcePowerDisable |= (1<<i);
ADDRLP4 1248
ADDRLP4 1248
INDIRI4
CNSTI4 1
ADDRLP4 1244
INDIRI4
LSHI4
BORI4
ASGNI4
line 4648
;4648:				}
LABELV $3037
line 4645
ADDRLP4 1244
ADDRLP4 1244
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 18
LTI4 $3036
line 4650
;4649:
;4650:				trap_Cvar_Set("g_forcePowerDisable", va("%i",forcePowerDisable));
ADDRGP4 $1406
ARGP4
ADDRLP4 1248
INDIRI4
ARGI4
ADDRLP4 1256
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $905
ARGP4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4651
;4651:			}
line 4653
;4652:
;4653:		} 
ADDRGP4 $3032
JUMPV
LABELV $3031
line 4654
;4654:		else if (Q_stricmp(name, "weaponDisable") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3042
ARGP4
ADDRLP4 1244
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
NEI4 $3040
line 4655
;4655:		{
line 4659
;4656:			int	weaponDisable,i;
;4657:			const char *cvarString;
;4658:
;4659:			if (ui_netGameType.integer == GT_TOURNAMENT)
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
NEI4 $3043
line 4660
;4660:			{
line 4661
;4661:				cvarString = "g_duelWeaponDisable";
ADDRLP4 1256
ADDRGP4 $888
ASGNP4
line 4662
;4662:			}
ADDRGP4 $3044
JUMPV
LABELV $3043
line 4664
;4663:			else
;4664:			{
line 4665
;4665:				cvarString = "g_weaponDisable";
ADDRLP4 1256
ADDRGP4 $889
ASGNP4
line 4666
;4666:			}
LABELV $3044
line 4668
;4667:
;4668:			weaponDisable = trap_Cvar_VariableValue(cvarString);
ADDRLP4 1256
INDIRP4
ARGP4
ADDRLP4 1260
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1252
ADDRLP4 1260
INDIRF4
CVFI4 4
ASGNI4
line 4671
;4669:
;4670:			// It was set to something, so might as well make sure it got all flags set.
;4671:			if (weaponDisable)
ADDRLP4 1252
INDIRI4
CNSTI4 0
EQI4 $3041
line 4672
;4672:			{
line 4673
;4673:				for (i=0;i<WP_NUM_WEAPONS;i++)
ADDRLP4 1248
CNSTI4 0
ASGNI4
LABELV $3048
line 4674
;4674:				{
line 4675
;4675:					if (i!=WP_SABER)
ADDRLP4 1248
INDIRI4
CNSTI4 2
EQI4 $3052
line 4676
;4676:					{
line 4677
;4677:						weaponDisable |= (1<<i);
ADDRLP4 1252
ADDRLP4 1252
INDIRI4
CNSTI4 1
ADDRLP4 1248
INDIRI4
LSHI4
BORI4
ASGNI4
line 4678
;4678:					}
LABELV $3052
line 4679
;4679:				}
LABELV $3049
line 4673
ADDRLP4 1248
ADDRLP4 1248
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 16
LTI4 $3048
line 4681
;4680:
;4681:				trap_Cvar_Set(cvarString, va("%i",weaponDisable));
ADDRGP4 $1406
ARGP4
ADDRLP4 1252
INDIRI4
ARGI4
ADDRLP4 1264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4682
;4682:			}
line 4683
;4683:		} 
ADDRGP4 $3041
JUMPV
LABELV $3040
line 4684
;4684:		else if (Q_stricmp(name, "updateForceStatus") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3056
ARGP4
ADDRLP4 1248
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 0
NEI4 $3054
line 4685
;4685:		{
line 4686
;4686:			UpdateForceStatus();
ADDRGP4 UpdateForceStatus
CALLV
pop
line 4687
;4687:		}
ADDRGP4 $3055
JUMPV
LABELV $3054
line 4688
;4688:		else if (Q_stricmp(name, "update") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3059
ARGP4
ADDRLP4 1252
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
NEI4 $3057
line 4689
;4689:		{
line 4690
;4690:			if (String_Parse(args, &name2)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1256
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1256
INDIRI4
CNSTI4 0
EQI4 $3058
line 4691
;4691:			{
line 4692
;4692:				UI_Update(name2);
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 UI_Update
CALLV
pop
line 4693
;4693:			}
line 4694
;4694:		}
ADDRGP4 $3058
JUMPV
LABELV $3057
line 4696
;4695:		else 
;4696:		{
line 4697
;4697:			Com_Printf("unknown UI script %s\n", name);
ADDRGP4 $3062
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4698
;4698:		}
LABELV $3058
LABELV $3055
LABELV $3041
LABELV $3032
LABELV $3029
LABELV $3026
LABELV $3023
LABELV $3010
LABELV $3001
LABELV $2993
LABELV $2974
LABELV $2963
LABELV $2950
LABELV $2928
LABELV $2910
LABELV $2899
LABELV $2887
LABELV $2876
LABELV $2864
LABELV $2861
LABELV $2858
LABELV $2855
LABELV $2839
LABELV $2836
LABELV $2833
LABELV $2829
LABELV $2824
LABELV $2820
LABELV $2810
LABELV $2793
LABELV $2788
LABELV $2781
LABELV $2771
LABELV $2765
LABELV $2758
LABELV $2745
LABELV $2742
LABELV $2736
LABELV $2730
LABELV $2720
LABELV $2717
LABELV $2714
LABELV $2711
LABELV $2698
LABELV $2695
LABELV $2692
LABELV $2689
LABELV $2680
LABELV $2676
LABELV $2673
LABELV $2670
LABELV $2665
LABELV $2658
LABELV $2651
LABELV $2609
line 4699
;4699:	}
LABELV $2606
line 4700
;4700:}
LABELV $2605
endproc UI_RunMenuScript 1300 24
proc UI_GetTeamColor 0 0
line 4702
;4701:
;4702:static void UI_GetTeamColor(vec4_t *color) {
line 4703
;4703:}
LABELV $3063
endproc UI_GetTeamColor 0 0
proc UI_MapCountByGameType 20 0
line 4710
;4704:
;4705:/*
;4706:==================
;4707:UI_MapCountByGameType
;4708:==================
;4709:*/
;4710:static int UI_MapCountByGameType(qboolean singlePlayer) {
line 4712
;4711:	int i, c, game;
;4712:	c = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4713
;4713:	game = singlePlayer ? uiInfo.gameTypes[ui_gameType.integer].gtEnum : uiInfo.gameTypes[ui_netGameType.integer].gtEnum;
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3072
ADDRLP4 12
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $3073
JUMPV
LABELV $3072
ADDRLP4 12
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ASGNI4
LABELV $3073
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 4714
;4714:	if (game == GT_SINGLE_PLAYER) {
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $3074
line 4715
;4715:		game++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4716
;4716:	} 
LABELV $3074
line 4717
;4717:	if (game == GT_TEAM) {
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $3076
line 4718
;4718:		game = GT_FFA;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4719
;4719:	}
LABELV $3076
line 4720
;4720:	if (game == GT_HOLOCRON || game == GT_JEDIMASTER) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $3080
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $3078
LABELV $3080
line 4721
;4721:		game = GT_FFA;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4722
;4722:	}
LABELV $3078
line 4724
;4723:
;4724:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3084
JUMPV
LABELV $3081
line 4725
;4725:		uiInfo.mapList[i].active = qfalse;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
CNSTI4 0
ASGNI4
line 4726
;4726:		if ( uiInfo.mapList[i].typeBits & (1 << game)) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3088
line 4727
;4727:			if (singlePlayer) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3092
line 4728
;4728:				if (!(uiInfo.mapList[i].typeBits & (1 << GT_SINGLE_PLAYER))) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $3094
line 4729
;4729:					continue;
ADDRGP4 $3082
JUMPV
LABELV $3094
line 4731
;4730:				}
;4731:			}
LABELV $3092
line 4732
;4732:			c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4733
;4733:			uiInfo.mapList[i].active = qtrue;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
CNSTI4 1
ASGNI4
line 4734
;4734:		}
LABELV $3088
line 4735
;4735:	}
LABELV $3082
line 4724
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3084
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $3081
line 4736
;4736:	return c;
ADDRLP4 8
INDIRI4
RETI4
LABELV $3064
endproc UI_MapCountByGameType 20 0
export UI_hasSkinForBase
proc UI_hasSkinForBase 1028 20
line 4739
;4737:}
;4738:
;4739:qboolean UI_hasSkinForBase(const char *base, const char *team) {
line 4743
;4740:	char	test[1024];
;4741:	fileHandle_t	f;
;4742:	
;4743:	Com_sprintf( test, sizeof( test ), "models/players/%s/%s/lower_default.skin", base, team );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3101
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
line 4744
;4744:	trap_FS_FOpenFile(test, &f, FS_READ);
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 4745
;4745:	if (f != 0) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $3102
line 4746
;4746:		trap_FS_FCloseFile(f);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 4747
;4747:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3100
JUMPV
LABELV $3102
line 4749
;4748:	}
;4749:	Com_sprintf( test, sizeof( test ), "models/players/characters/%s/%s/lower_default.skin", base, team );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3104
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
line 4750
;4750:	trap_FS_FOpenFile(test, &f, FS_READ);
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 4751
;4751:	if (f != 0) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $3105
line 4752
;4752:		trap_FS_FCloseFile(f);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 4753
;4753:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3100
JUMPV
LABELV $3105
line 4755
;4754:	}
;4755:	return qfalse;
CNSTI4 0
RETI4
LABELV $3100
endproc UI_hasSkinForBase 1028 20
data
align 4
LABELV $3108
byte 4 0
code
proc UI_HeadCountByTeam 40 8
line 4763
;4756:}
;4757:
;4758:/*
;4759:==================
;4760:UI_MapCountByTeam
;4761:==================
;4762:*/
;4763:static int UI_HeadCountByTeam() {
line 4767
;4764:	static int init = 0;
;4765:	int i, j, k, c, tIndex;
;4766:	
;4767:	c = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 4768
;4768:	if (!init) {
ADDRGP4 $3108
INDIRI4
CNSTI4 0
NEI4 $3109
line 4769
;4769:		for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3114
JUMPV
LABELV $3111
line 4770
;4770:			uiInfo.characterList[i].reference = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+20
ADDP4
CNSTI4 0
ASGNI4
line 4771
;4771:			for (j = 0; j < uiInfo.teamCount; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $3121
JUMPV
LABELV $3118
line 4772
;4772:			  if (UI_hasSkinForBase(uiInfo.characterList[i].base, uiInfo.teamList[j].teamName)) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+12
ADDP4
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_hasSkinForBase
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3123
line 4773
;4773:					uiInfo.characterList[i].reference |= (1<<j);
ADDRLP4 24
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 8
INDIRI4
LSHI4
BORI4
ASGNI4
line 4774
;4774:			  }
LABELV $3123
line 4775
;4775:			}
LABELV $3119
line 4771
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3121
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $3118
line 4776
;4776:		}
LABELV $3112
line 4769
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3114
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
LTI4 $3111
line 4777
;4777:		init = 1;
ADDRGP4 $3108
CNSTI4 1
ASGNI4
line 4778
;4778:	}
LABELV $3109
line 4780
;4779:
;4780:	tIndex = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 4783
;4781:
;4782:	// do names
;4783:	for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3133
JUMPV
LABELV $3130
line 4784
;4784:		uiInfo.characterList[i].active = qfalse;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
CNSTI4 0
ASGNI4
line 4785
;4785:		for(j = 0; j < TEAM_MEMBERS; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $3137
line 4786
;4786:			if (uiInfo.teamList[tIndex].teamMembers[j] != NULL) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3141
line 4787
;4787:				if (uiInfo.characterList[i].reference&(1<<tIndex)) {// && Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.characterList[i].name)==0) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3145
line 4788
;4788:					uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
CNSTI4 1
ASGNI4
line 4789
;4789:					c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4790
;4790:					break;
ADDRGP4 $3139
JUMPV
LABELV $3145
line 4792
;4791:				}
;4792:			}
LABELV $3141
line 4793
;4793:		}
LABELV $3138
line 4785
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 8
LTI4 $3137
LABELV $3139
line 4794
;4794:	}
LABELV $3131
line 4783
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3133
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
LTI4 $3130
line 4797
;4795:
;4796:	// and then aliases
;4797:	for(j = 0; j < TEAM_MEMBERS; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $3151
line 4798
;4798:		for(k = 0; k < uiInfo.aliasCount; k++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3158
JUMPV
LABELV $3155
line 4799
;4799:			if (uiInfo.aliasList[k].name != NULL) {
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3160
line 4800
;4800:				if (Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.aliasList[k].name)==0) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3163
line 4801
;4801:					for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3171
JUMPV
LABELV $3168
line 4802
;4802:						if (uiInfo.characterList[i].headImage != -1 && uiInfo.characterList[i].reference&(1<<tIndex) && Q_stricmp(uiInfo.aliasList[k].ai, uiInfo.characterList[i].name)==0) {
ADDRLP4 32
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+11848+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3173
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+11848+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3173
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+13388+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+11848
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $3173
line 4803
;4803:							if (uiInfo.characterList[i].active == qfalse) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3170
line 4804
;4804:								uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
CNSTI4 1
ASGNI4
line 4805
;4805:								c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4806
;4806:							}
line 4807
;4807:							break;
ADDRGP4 $3170
JUMPV
LABELV $3173
line 4809
;4808:						}
;4809:					}
LABELV $3169
line 4801
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3171
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
LTI4 $3168
LABELV $3170
line 4810
;4810:				}
LABELV $3163
line 4811
;4811:			}
LABELV $3160
line 4812
;4812:		}
LABELV $3156
line 4798
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3158
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+13384
INDIRI4
LTI4 $3155
line 4813
;4813:	}
LABELV $3152
line 4797
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 8
LTI4 $3151
line 4814
;4814:	return c;
ADDRLP4 16
INDIRI4
RETI4
LABELV $3107
endproc UI_HeadCountByTeam 40 8
proc UI_HeadCountByColor 24 8
line 4822
;4815:}
;4816:
;4817:/*
;4818:==================
;4819:UI_HeadCountByColor
;4820:==================
;4821:*/
;4822:static int UI_HeadCountByColor() {
line 4826
;4823:	int i, c;
;4824:	char *teamname;
;4825:
;4826:	c = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4828
;4827:
;4828:	switch(uiSkinColor)
ADDRLP4 12
ADDRGP4 uiSkinColor
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $3193
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $3191
ADDRGP4 $3189
JUMPV
line 4829
;4829:	{
LABELV $3191
line 4831
;4830:		case TEAM_BLUE:
;4831:			teamname = "/blue";
ADDRLP4 4
ADDRGP4 $3192
ASGNP4
line 4832
;4832:			break;
ADDRGP4 $3190
JUMPV
LABELV $3193
line 4834
;4833:		case TEAM_RED:
;4834:			teamname = "/red";
ADDRLP4 4
ADDRGP4 $3194
ASGNP4
line 4835
;4835:			break;
ADDRGP4 $3190
JUMPV
LABELV $3189
line 4837
;4836:		default:
;4837:			teamname = "/default";
ADDRLP4 4
ADDRGP4 $3195
ASGNP4
line 4838
;4838:	}
LABELV $3190
line 4841
;4839:
;4840:	// Count each head with this color
;4841:	for (i=0; i<uiInfo.q3HeadCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3199
JUMPV
LABELV $3196
line 4842
;4842:	{
line 4843
;4843:		if (uiInfo.q3HeadNames[i] && strstr(uiInfo.q3HeadNames[i], teamname))
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+60872
ADDP4
CVPU4 4
CNSTU4 0
EQU4 $3201
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3201
line 4844
;4844:		{
line 4845
;4845:			c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4846
;4846:		}
LABELV $3201
line 4847
;4847:	}
LABELV $3197
line 4841
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3199
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
LTI4 $3196
line 4848
;4848:	return c;
ADDRLP4 8
INDIRI4
RETI4
LABELV $3188
endproc UI_HeadCountByColor 24 8
proc UI_InsertServerIntoDisplayList 16 0
line 4856
;4849:}
;4850:
;4851:/*
;4852:==================
;4853:UI_InsertServerIntoDisplayList
;4854:==================
;4855:*/
;4856:static void UI_InsertServerIntoDisplayList(int num, int position) {
line 4859
;4857:	int i;
;4858:
;4859:	if (position < 0 || position > uiInfo.serverStatus.numDisplayServers ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3210
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
LEI4 $3206
LABELV $3210
line 4860
;4860:		return;
ADDRGP4 $3205
JUMPV
LABELV $3206
line 4863
;4861:	}
;4862:	//
;4863:	uiInfo.serverStatus.numDisplayServers++;
ADDRLP4 8
ADDRGP4 uiInfo+40740+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4864
;4864:	for (i = uiInfo.serverStatus.numDisplayServers; i > position; i--) {
ADDRLP4 0
ADDRGP4 uiInfo+40740+10412
INDIRI4
ASGNI4
ADDRGP4 $3216
JUMPV
LABELV $3213
line 4865
;4865:		uiInfo.serverStatus.displayServers[i] = uiInfo.serverStatus.displayServers[i-1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+40740+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+40740+2220-4
ADDP4
INDIRI4
ASGNI4
line 4866
;4866:	}
LABELV $3214
line 4864
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $3216
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $3213
line 4867
;4867:	uiInfo.serverStatus.displayServers[position] = num;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 4868
;4868:}
LABELV $3205
endproc UI_InsertServerIntoDisplayList 16 0
proc UI_RemoveServerFromDisplayList 16 0
line 4875
;4869:
;4870:/*
;4871:==================
;4872:UI_RemoveServerFromDisplayList
;4873:==================
;4874:*/
;4875:static void UI_RemoveServerFromDisplayList(int num) {
line 4878
;4876:	int i, j;
;4877:
;4878:	for (i = 0; i < uiInfo.serverStatus.numDisplayServers; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3230
JUMPV
LABELV $3227
line 4879
;4879:		if (uiInfo.serverStatus.displayServers[i] == num) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3233
line 4880
;4880:			uiInfo.serverStatus.numDisplayServers--;
ADDRLP4 8
ADDRGP4 uiInfo+40740+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4881
;4881:			for (j = i; j < uiInfo.serverStatus.numDisplayServers; j++) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $3242
JUMPV
LABELV $3239
line 4882
;4882:				uiInfo.serverStatus.displayServers[j] = uiInfo.serverStatus.displayServers[j+1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+40740+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+40740+2220+4
ADDP4
INDIRI4
ASGNI4
line 4883
;4883:			}
LABELV $3240
line 4881
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3242
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
LTI4 $3239
line 4884
;4884:			return;
ADDRGP4 $3226
JUMPV
LABELV $3233
line 4886
;4885:		}
;4886:	}
LABELV $3228
line 4878
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3230
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
LTI4 $3227
line 4887
;4887:}
LABELV $3226
endproc UI_RemoveServerFromDisplayList 16 0
proc UI_BinaryServerInsertion 20 20
line 4894
;4888:
;4889:/*
;4890:==================
;4891:UI_BinaryServerInsertion
;4892:==================
;4893:*/
;4894:static void UI_BinaryServerInsertion(int num) {
line 4898
;4895:	int mid, offset, res, len;
;4896:
;4897:	// use binary search to insert server
;4898:	len = uiInfo.serverStatus.numDisplayServers;
ADDRLP4 12
ADDRGP4 uiInfo+40740+10412
INDIRI4
ASGNI4
line 4899
;4899:	mid = len;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 4900
;4900:	offset = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4901
;4901:	res = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3254
JUMPV
LABELV $3253
line 4902
;4902:	while(mid > 0) {
line 4903
;4903:		mid = len >> 1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
RSHI4
ASGNI4
line 4905
;4904:		//
;4905:		res = trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey,
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 4908
;4906:					uiInfo.serverStatus.sortDir, num, uiInfo.serverStatus.displayServers[offset+mid]);
;4907:		// if equal
;4908:		if (res == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3263
line 4909
;4909:			UI_InsertServerIntoDisplayList(num, offset+mid);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 4910
;4910:			return;
ADDRGP4 $3250
JUMPV
LABELV $3263
line 4913
;4911:		}
;4912:		// if larger
;4913:		else if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $3265
line 4914
;4914:			offset += mid;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 4915
;4915:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 4916
;4916:		}
ADDRGP4 $3266
JUMPV
LABELV $3265
line 4918
;4917:		// if smaller
;4918:		else {
line 4919
;4919:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 4920
;4920:		}
LABELV $3266
line 4921
;4921:	}
LABELV $3254
line 4902
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $3253
line 4922
;4922:	if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $3267
line 4923
;4923:		offset++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4924
;4924:	}
LABELV $3267
line 4925
;4925:	UI_InsertServerIntoDisplayList(num, offset);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 4926
;4926:}
LABELV $3250
endproc UI_BinaryServerInsertion 20 20
bss
align 4
LABELV $3270
skip 4
code
proc UI_BuildServerDisplayList 1100 16
line 4933
;4927:
;4928:/*
;4929:==================
;4930:UI_BuildServerDisplayList
;4931:==================
;4932:*/
;4933:static void UI_BuildServerDisplayList(qboolean force) {
line 4939
;4934:	int i, count, clients, maxClients, ping, game, len, visible;
;4935:	char info[MAX_STRING_CHARS];
;4936://	qboolean startRefresh = qtrue; TTimo: unused
;4937:	static int numinvisible;
;4938:
;4939:	if (!(force || uiInfo.uiDC.realTime > uiInfo.serverStatus.nextDisplayRefresh)) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3271
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+40740+10420
INDIRI4
GTI4 $3271
line 4940
;4940:		return;
ADDRGP4 $3269
JUMPV
LABELV $3271
line 4943
;4941:	}
;4942:	// if we shouldn't reset
;4943:	if ( force == 2 ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $3276
line 4944
;4944:		force = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 4945
;4945:	}
LABELV $3276
line 4948
;4946:
;4947:	// do motd updates here too
;4948:	trap_Cvar_VariableStringBuffer( "cl_motdString", uiInfo.serverStatus.motd, sizeof(uiInfo.serverStatus.motd) );
ADDRGP4 $3278
ARGP4
ADDRGP4 uiInfo+40740+10460
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4949
;4949:	len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+40740+10460
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1056
INDIRI4
ASGNI4
line 4950
;4950:	if (len == 0) {
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $3285
line 4951
;4951:		strcpy(uiInfo.serverStatus.motd, "Welcome to JK2MP!");
ADDRGP4 uiInfo+40740+10460
ARGP4
ADDRGP4 $3289
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4952
;4952:		len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+40740+10460
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1060
INDIRI4
ASGNI4
line 4953
;4953:	} 
LABELV $3285
line 4954
;4954:	if (len != uiInfo.serverStatus.motdLen) {
ADDRLP4 1052
INDIRI4
ADDRGP4 uiInfo+40740+10436
INDIRI4
EQI4 $3292
line 4955
;4955:		uiInfo.serverStatus.motdLen = len;
ADDRGP4 uiInfo+40740+10436
ADDRLP4 1052
INDIRI4
ASGNI4
line 4956
;4956:		uiInfo.serverStatus.motdWidth = -1;
ADDRGP4 uiInfo+40740+10440
CNSTI4 -1
ASGNI4
line 4957
;4957:	} 
LABELV $3292
line 4959
;4958:
;4959:	if (force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3300
line 4960
;4960:		numinvisible = 0;
ADDRGP4 $3270
CNSTI4 0
ASGNI4
line 4962
;4961:		// clear number of displayed servers
;4962:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+40740+10412
CNSTI4 0
ASGNI4
line 4963
;4963:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+40740+10416
CNSTI4 0
ASGNI4
line 4965
;4964:		// set list box index to zero
;4965:		Menu_SetFeederSelection(NULL, FEEDER_SERVERS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4967
;4966:		// mark all servers as visible so we store ping updates for them
;4967:		trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 4968
;4968:	}
LABELV $3300
line 4971
;4969:
;4970:	// get the server count (comes from the master)
;4971:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1060
INDIRI4
ASGNI4
line 4972
;4972:	if (count == -1 || (ui_netSource.integer == AS_LOCAL && count == 0) ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
EQI4 $3311
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRGP4 ui_netSource+12
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $3308
ADDRLP4 1036
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $3308
LABELV $3311
line 4974
;4973:		// still waiting on a response from the master
;4974:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+40740+10412
CNSTI4 0
ASGNI4
line 4975
;4975:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+40740+10416
CNSTI4 0
ASGNI4
line 4976
;4976:		uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+40740+10420
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4977
;4977:		return;
ADDRGP4 $3269
JUMPV
LABELV $3308
line 4980
;4978:	}
;4979:
;4980:	visible = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 4981
;4981:	for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3322
JUMPV
LABELV $3319
line 4983
;4982:		// if we already got info for this server
;4983:		if (!trap_LAN_ServerIsVisible(ui_netSource.integer, i)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 trap_LAN_ServerIsVisible
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $3323
line 4984
;4984:			continue;
ADDRGP4 $3320
JUMPV
LABELV $3323
line 4986
;4985:		}
;4986:		visible = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 4988
;4987:		// get the ping for this server
;4988:		ping = trap_LAN_GetServerPing(ui_netSource.integer, i);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 trap_LAN_GetServerPing
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1076
INDIRI4
ASGNI4
line 4989
;4989:		if (ping > 0 || ui_netSource.integer == AS_FAVORITES) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $3330
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $3327
LABELV $3330
line 4991
;4990:
;4991:			trap_LAN_GetServerInfo(ui_netSource.integer, i, info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4993
;4992:
;4993:			clients = atoi(Info_ValueForKey(info, "clients"));
ADDRLP4 8
ARGP4
ADDRGP4 $3332
ARGP4
ADDRLP4 1080
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1084
INDIRI4
ASGNI4
line 4994
;4994:			uiInfo.serverStatus.numPlayersOnServers += clients;
ADDRLP4 1088
ADDRGP4 uiInfo+40740+10416
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 4996
;4995:
;4996:			if (ui_browserShowEmpty.integer == 0) {
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CNSTI4 0
NEI4 $3335
line 4997
;4997:				if (clients == 0) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $3338
line 4998
;4998:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 4999
;4999:					continue;
ADDRGP4 $3320
JUMPV
LABELV $3338
line 5001
;5000:				}
;5001:			}
LABELV $3335
line 5003
;5002:
;5003:			if (ui_browserShowFull.integer == 0) {
ADDRGP4 ui_browserShowFull+12
INDIRI4
CNSTI4 0
NEI4 $3341
line 5004
;5004:				maxClients = atoi(Info_ValueForKey(info, "sv_maxclients"));
ADDRLP4 8
ARGP4
ADDRGP4 $1511
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1096
INDIRI4
ASGNI4
line 5005
;5005:				if (clients == maxClients) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $3344
line 5006
;5006:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5007
;5007:					continue;
ADDRGP4 $3320
JUMPV
LABELV $3344
line 5009
;5008:				}
;5009:			}
LABELV $3341
line 5011
;5010:
;5011:			if (uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum != -1) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880+4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3347
line 5012
;5012:				game = atoi(Info_ValueForKey(info, "gametype"));
ADDRLP4 8
ARGP4
ADDRGP4 $3352
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1096
INDIRI4
ASGNI4
line 5013
;5013:				if (game != uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum) {
ADDRLP4 1048
INDIRI4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880+4
ADDP4
INDIRI4
EQI4 $3353
line 5014
;5014:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5015
;5015:					continue;
ADDRGP4 $3320
JUMPV
LABELV $3353
line 5017
;5016:				}
;5017:			}
LABELV $3347
line 5019
;5018:				
;5019:			if (ui_serverFilterType.integer > 0) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LEI4 $3359
line 5020
;5020:				if (Q_stricmp(Info_ValueForKey(info, "game"), serverFilters[ui_serverFilterType.integer].basedir) != 0) {
ADDRLP4 8
ARGP4
ADDRGP4 $3364
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $3362
line 5021
;5021:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5022
;5022:					continue;
ADDRGP4 $3320
JUMPV
LABELV $3362
line 5024
;5023:				}
;5024:			}
LABELV $3359
line 5026
;5025:			// make sure we never add a favorite server twice
;5026:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $3368
line 5027
;5027:				UI_RemoveServerFromDisplayList(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_RemoveServerFromDisplayList
CALLV
pop
line 5028
;5028:			}
LABELV $3368
line 5030
;5029:			// insert the server into the list
;5030:			UI_BinaryServerInsertion(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_BinaryServerInsertion
CALLV
pop
line 5032
;5031:			// done with this server
;5032:			if (ping > 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $3371
line 5033
;5033:				trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5034
;5034:				numinvisible++;
ADDRLP4 1092
ADDRGP4 $3270
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5035
;5035:			}
LABELV $3371
line 5036
;5036:		}
LABELV $3327
line 5037
;5037:	}
LABELV $3320
line 4981
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3322
ADDRLP4 0
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $3319
line 5039
;5038:
;5039:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
ASGNI4
line 5042
;5040:
;5041:	// if there were no servers visible for ping updates
;5042:	if (!visible) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $3377
line 5045
;5043://		UI_StopServerRefresh();
;5044://		uiInfo.serverStatus.nextDisplayRefresh = 0;
;5045:	}
LABELV $3377
line 5046
;5046:}
LABELV $3269
endproc UI_BuildServerDisplayList 1100 16
data
export serverStatusCvars
align 4
LABELV serverStatusCvars
address $3380
address $3381
address $3382
address $165
address $3383
address $3384
address $883
address $3385
address $3386
address $3387
address $3388
address $165
address $2341
address $165
address $3389
address $165
address $705
address $165
byte 4 0
byte 4 0
code
proc UI_SortServerStatusInfo 56 8
line 5071
;5047:
;5048:typedef struct
;5049:{
;5050:	char *name, *altName;
;5051:} serverStatusCvar_t;
;5052:
;5053:serverStatusCvar_t serverStatusCvars[] = {
;5054:	{"sv_hostname", "Name"},
;5055:	{"Address", ""},
;5056:	{"gamename", "Game name"},
;5057:	{"g_gametype", "Game type"},
;5058:	{"mapname", "Map"},
;5059:	{"version", ""},
;5060:	{"protocol", ""},
;5061:	{"timelimit", ""},
;5062:	{"fraglimit", ""},
;5063:	{NULL, NULL}
;5064:};
;5065:
;5066:/*
;5067:==================
;5068:UI_SortServerStatusInfo
;5069:==================
;5070:*/
;5071:static void UI_SortServerStatusInfo( serverStatusInfo_t *info ) {
line 5078
;5072:	int i, j, index;
;5073:	char *tmp1, *tmp2;
;5074:
;5075:	// FIXME: if "gamename" == "base" or "missionpack" then
;5076:	// replace the gametype number by FFA, CTF etc.
;5077:	//
;5078:	index = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5079
;5079:	for (i = 0; serverStatusCvars[i].name; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $3394
JUMPV
LABELV $3391
line 5080
;5080:		for (j = 0; j < info->numLines; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3398
JUMPV
LABELV $3395
line 5081
;5081:			if ( !info->lines[j][1] || info->lines[j][1][0] ) {
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3401
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3399
LABELV $3401
line 5082
;5082:				continue;
ADDRGP4 $3396
JUMPV
LABELV $3399
line 5084
;5083:			}
;5084:			if ( !Q_stricmp(serverStatusCvars[i].name, info->lines[j][0]) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3402
line 5086
;5085:				// swap lines
;5086:				tmp1 = info->lines[index][0];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ASGNP4
line 5087
;5087:				tmp2 = info->lines[index][3];
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 5088
;5088:				info->lines[index][0] = info->lines[j][0];
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 5089
;5089:				info->lines[index][3] = info->lines[j][3];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 48
CNSTI4 12
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 5090
;5090:				info->lines[j][0] = tmp1;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 5091
;5091:				info->lines[j][3] = tmp2;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 5093
;5092:				//
;5093:				if ( strlen(serverStatusCvars[i].altName) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $3404
line 5094
;5094:					info->lines[index][0] = serverStatusCvars[i].altName;
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ASGNP4
line 5095
;5095:				}
LABELV $3404
line 5096
;5096:				index++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5097
;5097:			}
LABELV $3402
line 5098
;5098:		}
LABELV $3396
line 5080
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3398
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
LTI4 $3395
line 5099
;5099:	}
LABELV $3392
line 5079
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3394
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3391
line 5100
;5100:}
LABELV $3390
endproc UI_SortServerStatusInfo 56 8
proc UI_GetServerStatusInfo 168 16
line 5107
;5101:
;5102:/*
;5103:==================
;5104:UI_GetServerStatusInfo
;5105:==================
;5106:*/
;5107:static int UI_GetServerStatusInfo( const char *serverAddress, serverStatusInfo_t *info ) {
line 5111
;5108:	char *p, *score, *ping, *name;
;5109:	int i, len;
;5110:
;5111:	if (!info) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3409
line 5112
;5112:		trap_LAN_ServerStatus( serverAddress, NULL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 5113
;5113:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3408
JUMPV
LABELV $3409
line 5115
;5114:	}
;5115:	memset(info, 0, sizeof(*info));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3236
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5116
;5116:	if ( trap_LAN_ServerStatus( serverAddress, info->text, sizeof(info->text)) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 24
ADDRGP4 trap_LAN_ServerStatus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3411
line 5117
;5117:		Q_strncpyz(info->address, serverAddress, sizeof(info->address));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5118
;5118:		p = info->text;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ASGNP4
line 5119
;5119:		info->numLines = 0;
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
CNSTI4 0
ASGNI4
line 5120
;5120:		info->lines[info->numLines][0] = "Address";
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3382
ASGNP4
line 5121
;5121:		info->lines[info->numLines][1] = "";
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRGP4 $165
ASGNP4
line 5122
;5122:		info->lines[info->numLines][2] = "";
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $165
ASGNP4
line 5123
;5123:		info->lines[info->numLines][3] = info->address;
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 5124
;5124:		info->numLines++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $3414
JUMPV
LABELV $3413
line 5126
;5125:		// get the cvars
;5126:		while (p && *p) {
line 5127
;5127:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 52
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 5128
;5128:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3416
ADDRGP4 $3415
JUMPV
LABELV $3416
line 5129
;5129:			*p++ = '\0';
ADDRLP4 56
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI1 0
ASGNI1
line 5130
;5130:			if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3418
line 5131
;5131:				break;
ADDRGP4 $3415
JUMPV
LABELV $3418
line 5132
;5132:			info->lines[info->numLines][0] = p;
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 5133
;5133:			info->lines[info->numLines][1] = "";
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRGP4 $165
ASGNP4
line 5134
;5134:			info->lines[info->numLines][2] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $165
ASGNP4
line 5135
;5135:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 76
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 5136
;5136:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3420
ADDRGP4 $3415
JUMPV
LABELV $3420
line 5137
;5137:			*p++ = '\0';
ADDRLP4 80
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI1 0
ASGNI1
line 5138
;5138:			info->lines[info->numLines][3] = p;
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 5140
;5139:
;5140:			info->numLines++;
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 3232
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
line 5141
;5141:			if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3422
line 5142
;5142:				break;
ADDRGP4 $3415
JUMPV
LABELV $3422
line 5143
;5143:		}
LABELV $3414
line 5126
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3424
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3413
LABELV $3424
LABELV $3415
line 5145
;5144:		// get the player list
;5145:		if (info->numLines < MAX_SERVERSTATUS_LINES-3) {
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 125
GEI4 $3425
line 5147
;5146:			// empty line
;5147:			info->lines[info->numLines][0] = "";
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $165
ASGNP4
line 5148
;5148:			info->lines[info->numLines][1] = "";
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRGP4 $165
ASGNP4
line 5149
;5149:			info->lines[info->numLines][2] = "";
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $165
ASGNP4
line 5150
;5150:			info->lines[info->numLines][3] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $165
ASGNP4
line 5151
;5151:			info->numLines++;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5153
;5152:			// header
;5153:			info->lines[info->numLines][0] = "num";
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 80
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3427
ASGNP4
line 5154
;5154:			info->lines[info->numLines][1] = "score";
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRGP4 $3428
ASGNP4
line 5155
;5155:			info->lines[info->numLines][2] = "ping";
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 92
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $3429
ASGNP4
line 5156
;5156:			info->lines[info->numLines][3] = "name";
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 96
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $2499
ASGNP4
line 5157
;5157:			info->numLines++;
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 3232
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
line 5159
;5158:			// parse players
;5159:			i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5160
;5160:			len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3431
JUMPV
LABELV $3430
line 5161
;5161:			while (p && *p) {
line 5162
;5162:				if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3433
line 5163
;5163:					*p++ = '\0';
ADDRLP4 104
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 104
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI1 0
ASGNI1
LABELV $3433
line 5164
;5164:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3435
line 5165
;5165:					break;
ADDRGP4 $3432
JUMPV
LABELV $3435
line 5166
;5166:				score = p;
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
line 5167
;5167:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 108
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 5168
;5168:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3437
line 5169
;5169:					break;
ADDRGP4 $3432
JUMPV
LABELV $3437
line 5170
;5170:				*p++ = '\0';
ADDRLP4 112
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 112
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI1 0
ASGNI1
line 5171
;5171:				ping = p;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
line 5172
;5172:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 116
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
line 5173
;5173:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3439
line 5174
;5174:					break;
ADDRGP4 $3432
JUMPV
LABELV $3439
line 5175
;5175:				*p++ = '\0';
ADDRLP4 120
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 120
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI1 0
ASGNI1
line 5176
;5176:				name = p;
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
line 5177
;5177:				Com_sprintf(&info->pings[len], sizeof(info->pings)-len, "%d", i);
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
CNSTU4 96
ADDRLP4 4
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 $702
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5178
;5178:				info->lines[info->numLines][0] = &info->pings[len];
ADDRLP4 128
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 128
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 128
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ASGNP4
line 5179
;5179:				len += strlen(&info->pings[len]) + 1;
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 5180
;5180:				info->lines[info->numLines][1] = score;
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
CNSTI4 4
ASGNI4
ADDRLP4 140
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
LSHI4
ADDRLP4 140
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 144
INDIRI4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 5181
;5181:				info->lines[info->numLines][2] = ping;
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 5182
;5182:				info->lines[info->numLines][3] = name;
ADDRLP4 152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 5183
;5183:				info->numLines++;
ADDRLP4 156
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5184
;5184:				if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3441
line 5185
;5185:					break;
ADDRGP4 $3432
JUMPV
LABELV $3441
line 5186
;5186:				p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
line 5187
;5187:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3443
line 5188
;5188:					break;
ADDRGP4 $3432
JUMPV
LABELV $3443
line 5189
;5189:				*p++ = '\0';
ADDRLP4 164
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI1 0
ASGNI1
line 5191
;5190:				//
;5191:				i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5192
;5192:			}
LABELV $3431
line 5161
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3445
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3430
LABELV $3445
LABELV $3432
line 5193
;5193:		}
LABELV $3425
line 5194
;5194:		UI_SortServerStatusInfo( info );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 UI_SortServerStatusInfo
CALLV
pop
line 5195
;5195:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3408
JUMPV
LABELV $3411
line 5197
;5196:	}
;5197:	return qfalse;
CNSTI4 0
RETI4
LABELV $3408
endproc UI_GetServerStatusInfo 168 16
proc stristr 12 4
line 5205
;5198:}
;5199:
;5200:/*
;5201:==================
;5202:stristr
;5203:==================
;5204:*/
;5205:static char *stristr(char *str, char *charset) {
ADDRGP4 $3448
JUMPV
LABELV $3447
line 5208
;5206:	int i;
;5207:
;5208:	while(*str) {
line 5209
;5209:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3453
JUMPV
LABELV $3450
line 5210
;5210:			if (toupper(charset[i]) != toupper(str[i])) break;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $3454
ADDRGP4 $3452
JUMPV
LABELV $3454
line 5211
;5211:		}
LABELV $3451
line 5209
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3453
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $3456
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $3450
LABELV $3456
LABELV $3452
line 5212
;5212:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3457
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $3446
JUMPV
LABELV $3457
line 5213
;5213:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5214
;5214:	}
LABELV $3448
line 5208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3447
line 5215
;5215:	return NULL;
CNSTP4 0
RETP4
LABELV $3446
endproc stristr 12 4
bss
align 4
LABELV $3460
skip 4
align 4
LABELV $3461
skip 4
code
proc UI_BuildFindPlayerList 4328 24
line 5223
;5216:}
;5217:
;5218:/*
;5219:==================
;5220:UI_BuildFindPlayerList
;5221:==================
;5222:*/
;5223:static void UI_BuildFindPlayerList(qboolean force) {
line 5230
;5224:	static int numFound, numTimeOuts;
;5225:	int i, j, resend;
;5226:	serverStatusInfo_t info;
;5227:	char name[MAX_NAME_LENGTH+2];
;5228:	char infoString[MAX_STRING_CHARS];
;5229:
;5230:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3462
line 5231
;5231:		if (!uiInfo.nextFindPlayerRefresh || uiInfo.nextFindPlayerRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+60852
INDIRI4
CNSTI4 0
EQI4 $3469
ADDRGP4 uiInfo+60852
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
LEI4 $3463
LABELV $3469
line 5232
;5232:			return;
ADDRGP4 $3459
JUMPV
line 5234
;5233:		}
;5234:	}
LABELV $3462
line 5235
;5235:	else {
line 5236
;5236:		memset(&uiInfo.pendingServerStatus, 0, sizeof(uiInfo.pendingServerStatus));
ADDRGP4 uiInfo+55528
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5237
;5237:		uiInfo.numFoundPlayerServers = 0;
ADDRGP4 uiInfo+60848
CNSTI4 0
ASGNI4
line 5238
;5238:		uiInfo.currentFoundPlayerServer = 0;
ADDRGP4 uiInfo+60844
CNSTI4 0
ASGNI4
line 5239
;5239:		trap_Cvar_VariableStringBuffer( "ui_findPlayer", uiInfo.findPlayerName, sizeof(uiInfo.findPlayerName));
ADDRGP4 $3474
ARGP4
ADDRGP4 uiInfo+57772
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5240
;5240:		Q_CleanStr(uiInfo.findPlayerName);
ADDRGP4 uiInfo+57772
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 5242
;5241:		// should have a string of some length
;5242:		if (!strlen(uiInfo.findPlayerName)) {
ADDRGP4 uiInfo+57772
ARGP4
ADDRLP4 4308
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4308
INDIRI4
CNSTI4 0
NEI4 $3478
line 5243
;5243:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+60852
CNSTI4 0
ASGNI4
line 5244
;5244:			return;
ADDRGP4 $3459
JUMPV
LABELV $3478
line 5247
;5245:		}
;5246:		// set resend time
;5247:		resend = ui_serverStatusTimeOut.integer / 2 - 10;
ADDRLP4 4304
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 10
SUBI4
ASGNI4
line 5248
;5248:		if (resend < 50) {
ADDRLP4 4304
INDIRI4
CNSTI4 50
GEI4 $3483
line 5249
;5249:			resend = 50;
ADDRLP4 4304
CNSTI4 50
ASGNI4
line 5250
;5250:		}
LABELV $3483
line 5251
;5251:		trap_Cvar_Set("cl_serverStatusResendTime", va("%d", resend));
ADDRGP4 $702
ARGP4
ADDRLP4 4304
INDIRI4
ARGI4
ADDRLP4 4312
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $3485
ARGP4
ADDRLP4 4312
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5253
;5252:		// reset all server status requests
;5253:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 5255
;5254:		//
;5255:		uiInfo.numFoundPlayerServers = 1;
ADDRGP4 uiInfo+60848
CNSTI4 1
ASGNI4
line 5256
;5256:		Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3493
ARGP4
ADDRGP4 uiInfo+55528
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5259
;5257:						sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;5258:							"searching %d...", uiInfo.pendingServerStatus.num);
;5259:		numFound = 0;
ADDRGP4 $3460
CNSTI4 0
ASGNI4
line 5260
;5260:		numTimeOuts++;
ADDRLP4 4316
ADDRGP4 $3461
ASGNP4
ADDRLP4 4316
INDIRP4
ADDRLP4 4316
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5261
;5261:	}
LABELV $3463
line 5262
;5262:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3495
line 5264
;5263:		// if this pending server is valid
;5264:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3499
line 5266
;5265:			// try to get the server status for this server
;5266:			if (UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, &info ) ) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4308
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4308
INDIRI4
CNSTI4 0
EQI4 $3504
line 5268
;5267:				//
;5268:				numFound++;
ADDRLP4 4312
ADDRGP4 $3460
ASGNP4
ADDRLP4 4312
INDIRP4
ADDRLP4 4312
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5270
;5269:				// parse through the server status lines
;5270:				for (j = 0; j < info.numLines; j++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3511
JUMPV
LABELV $3508
line 5272
;5271:					// should have ping info
;5272:					if ( !info.lines[j][2] || !info.lines[j][2][0] ) {
ADDRLP4 4316
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 4316
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3519
ADDRLP4 4316
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3513
LABELV $3519
line 5273
;5273:						continue;
ADDRGP4 $3509
JUMPV
LABELV $3513
line 5276
;5274:					}
;5275:					// clean string first
;5276:					Q_strncpyz(name, info.lines[j][3], sizeof(name));
ADDRLP4 3244
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 8+64+12
ADDP4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5277
;5277:					Q_CleanStr(name);
ADDRLP4 3244
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 5279
;5278:					// if the player name is a substring
;5279:					if (stristr(name, uiInfo.findPlayerName)) {
ADDRLP4 3244
ARGP4
ADDRGP4 uiInfo+57772
ARGP4
ADDRLP4 4320
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 4320
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3522
line 5281
;5280:						// add to found server list if we have space (always leave space for a line with the number found)
;5281:						if (uiInfo.numFoundPlayerServers < MAX_FOUNDPLAYER_SERVERS-1) {
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 15
GEI4 $3525
line 5283
;5282:							//
;5283:							Q_strncpyz(uiInfo.foundPlayerServerAddresses[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+58796-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5286
;5284:										uiInfo.pendingServerStatus.server[i].adrstr,
;5285:											sizeof(uiInfo.foundPlayerServerAddresses[0]));
;5286:							Q_strncpyz(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5289
;5287:										uiInfo.pendingServerStatus.server[i].name,
;5288:											sizeof(uiInfo.foundPlayerServerNames[0]));
;5289:							uiInfo.numFoundPlayerServers++;
ADDRLP4 4324
ADDRGP4 uiInfo+60848
ASGNP4
ADDRLP4 4324
INDIRP4
ADDRLP4 4324
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5290
;5290:						}
ADDRGP4 $3526
JUMPV
LABELV $3525
line 5291
;5291:						else {
line 5293
;5292:							// can't add any more so we're done
;5293:							uiInfo.pendingServerStatus.num = uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+55528
ADDRGP4 uiInfo+40740+10412
INDIRI4
ASGNI4
line 5294
;5294:						}
LABELV $3526
line 5295
;5295:					}
LABELV $3522
line 5296
;5296:				}
LABELV $3509
line 5270
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3511
ADDRLP4 4
INDIRI4
ADDRLP4 8+3232
INDIRI4
LTI4 $3508
line 5297
;5297:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3551
ARGP4
ADDRGP4 uiInfo+55528
INDIRI4
ARGI4
ADDRGP4 $3460
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5301
;5298:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;5299:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;5300:				// retrieved the server status so reuse this spot
;5301:				uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
CNSTI4 0
ASGNI4
line 5302
;5302:			}
LABELV $3504
line 5303
;5303:		}
LABELV $3499
line 5305
;5304:		// if empty pending slot or timed out
;5305:		if (!uiInfo.pendingServerStatus.server[i].valid ||
ADDRLP4 4308
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4308
INDIRI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3566
ADDRLP4 4308
INDIRI4
ADDRGP4 uiInfo+55528+4+128
ADDP4
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
SUBI4
GEI4 $3556
LABELV $3566
line 5306
;5306:			uiInfo.pendingServerStatus.server[i].startTime < uiInfo.uiDC.realTime - ui_serverStatusTimeOut.integer) {
line 5307
;5307:			if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3567
line 5308
;5308:				numTimeOuts++;
ADDRLP4 4312
ADDRGP4 $3461
ASGNP4
ADDRLP4 4312
INDIRP4
ADDRLP4 4312
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5309
;5309:			}
LABELV $3567
line 5311
;5310:			// reset server status request for this address
;5311:			UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, NULL );
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 5313
;5312:			// reuse pending slot
;5313:			uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
CNSTI4 0
ASGNI4
line 5315
;5314:			// if we didn't try to get the status of all servers in the main browser yet
;5315:			if (uiInfo.pendingServerStatus.num < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+55528
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
GEI4 $3577
line 5316
;5316:				uiInfo.pendingServerStatus.server[i].startTime = uiInfo.uiDC.realTime;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+128
ADDP4
ADDRGP4 uiInfo+240
INDIRI4
ASGNI4
line 5317
;5317:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num],
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+55528
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 5319
;5318:							uiInfo.pendingServerStatus.server[i].adrstr, sizeof(uiInfo.pendingServerStatus.server[i].adrstr));
;5319:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num], infoString, sizeof(infoString));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+55528
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 3278
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5320
;5320:				Q_strncpyz(uiInfo.pendingServerStatus.server[i].name, Info_ValueForKey(infoString, "hostname"), sizeof(uiInfo.pendingServerStatus.server[0].name));
ADDRLP4 3278
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 4312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+64
ADDP4
ARGP4
ADDRLP4 4312
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5321
;5321:				uiInfo.pendingServerStatus.server[i].valid = qtrue;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
CNSTI4 1
ASGNI4
line 5322
;5322:				uiInfo.pendingServerStatus.num++;
ADDRLP4 4316
ADDRGP4 uiInfo+55528
ASGNP4
ADDRLP4 4316
INDIRP4
ADDRLP4 4316
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5323
;5323:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3551
ARGP4
ADDRGP4 uiInfo+55528
INDIRI4
ARGI4
ADDRGP4 $3460
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5326
;5324:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;5325:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;5326:			}
LABELV $3577
line 5327
;5327:		}
LABELV $3556
line 5328
;5328:	}
LABELV $3496
line 5262
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3495
line 5329
;5329:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3615
line 5330
;5330:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3619
line 5331
;5331:			break;
ADDRGP4 $3617
JUMPV
LABELV $3619
line 5333
;5332:		}
;5333:	}
LABELV $3616
line 5329
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3615
LABELV $3617
line 5335
;5334:	// if still trying to retrieve server status info
;5335:	if (i < MAX_SERVERSTATUSREQUESTS) {
ADDRLP4 0
INDIRI4
CNSTI4 16
GEI4 $3624
line 5336
;5336:		uiInfo.nextFindPlayerRefresh = uiInfo.uiDC.realTime + 25;
ADDRGP4 uiInfo+60852
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 5337
;5337:	}
ADDRGP4 $3625
JUMPV
LABELV $3624
line 5338
;5338:	else {
line 5340
;5339:		// add a line that shows the number of servers found
;5340:		if (!uiInfo.numFoundPlayerServers) 
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 0
NEI4 $3628
line 5341
;5341:		{
line 5342
;5342:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]), "no servers found");
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3635
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5343
;5343:		}
ADDRGP4 $3629
JUMPV
LABELV $3628
line 5345
;5344:		else 
;5345:		{
line 5346
;5346:			trap_SP_GetStringTextString("MENUS3_SERVERS_FOUNDWITH", holdSPString, sizeof(holdSPString));
ADDRGP4 $3636
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 5347
;5347:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]),
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 holdSPString
ARGP4
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 2
NEI4 $3646
ADDRLP4 4308
ADDRGP4 $165
ASGNP4
ADDRGP4 $3647
JUMPV
LABELV $3646
ADDRLP4 4308
ADDRGP4 $3643
ASGNP4
LABELV $3647
ADDRLP4 4308
INDIRP4
ARGP4
ADDRGP4 uiInfo+57772
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5350
;5348:						holdSPString, uiInfo.numFoundPlayerServers-1,
;5349:						uiInfo.numFoundPlayerServers == 2 ? "":"s", uiInfo.findPlayerName);
;5350:		}
LABELV $3629
line 5351
;5351:		uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+60852
CNSTI4 0
ASGNI4
line 5353
;5352:		// show the server status info for the selected server
;5353:		UI_FeederSelection(FEEDER_FINDPLAYER, uiInfo.currentFoundPlayerServer);
CNSTF4 1096810496
ARGF4
ADDRGP4 uiInfo+60844
INDIRI4
ARGI4
ADDRGP4 UI_FeederSelection
CALLI4
pop
line 5354
;5354:	}
LABELV $3625
line 5355
;5355:}
LABELV $3459
endproc UI_BuildFindPlayerList 4328 24
proc UI_BuildServerStatus 8 16
line 5362
;5356:
;5357:/*
;5358:==================
;5359:UI_BuildServerStatus
;5360:==================
;5361:*/
;5362:static void UI_BuildServerStatus(qboolean force) {
line 5364
;5363:
;5364:	if (uiInfo.nextFindPlayerRefresh) {
ADDRGP4 uiInfo+60852
INDIRI4
CNSTI4 0
EQI4 $3651
line 5365
;5365:		return;
ADDRGP4 $3650
JUMPV
LABELV $3651
line 5367
;5366:	}
;5367:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3654
line 5368
;5368:		if (!uiInfo.nextServerStatusRefresh || uiInfo.nextServerStatusRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+55524
INDIRI4
CNSTI4 0
EQI4 $3661
ADDRGP4 uiInfo+55524
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
LEI4 $3655
LABELV $3661
line 5369
;5369:			return;
ADDRGP4 $3650
JUMPV
line 5371
;5370:		}
;5371:	}
LABELV $3654
line 5372
;5372:	else {
line 5373
;5373:		Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5374
;5374:		uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+52288+3232
CNSTI4 0
ASGNI4
line 5376
;5375:		// reset all server status requests
;5376:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 5377
;5377:	}
LABELV $3655
line 5378
;5378:	if (uiInfo.serverStatus.currentServer < 0 || uiInfo.serverStatus.currentServer > uiInfo.serverStatus.numDisplayServers || uiInfo.serverStatus.numDisplayServers == 0) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $3675
ADDRGP4 uiInfo+40740+2216
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
GTI4 $3675
ADDRGP4 uiInfo+40740+10412
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $3664
LABELV $3675
line 5379
;5379:		return;
ADDRGP4 $3650
JUMPV
LABELV $3664
line 5381
;5380:	}
;5381:	if (UI_GetServerStatusInfo( uiInfo.serverStatusAddress, &uiInfo.serverStatusInfo ) ) {
ADDRGP4 uiInfo+52224
ARGP4
ADDRGP4 uiInfo+52288
ARGP4
ADDRLP4 4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $3676
line 5382
;5382:		uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+55524
CNSTI4 0
ASGNI4
line 5383
;5383:		UI_GetServerStatusInfo( uiInfo.serverStatusAddress, NULL );
ADDRGP4 uiInfo+52224
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 5384
;5384:	}
ADDRGP4 $3677
JUMPV
LABELV $3676
line 5385
;5385:	else {
line 5386
;5386:		uiInfo.nextServerStatusRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+55524
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5387
;5387:	}
LABELV $3677
line 5388
;5388:}
LABELV $3650
endproc UI_BuildServerStatus 8 16
proc UI_FeederCount 20 4
line 5396
;5389:
;5390:/*
;5391:==================
;5392:UI_FeederCount
;5393:==================
;5394:*/
;5395:static int UI_FeederCount(float feederID) 
;5396:{
line 5397
;5397:	switch ( (int)feederID )
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $3685
ADDRLP4 0
INDIRI4
CNSTI4 16
GTI4 $3685
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3729-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3729
address $3697
address $3701
address $3685
address $3697
address $3685
address $3685
address $3709
address $3717
address $3725
address $3727
address $3685
address $3688
address $3704
address $3707
address $3695
address $3689
code
line 5398
;5398:	{
LABELV $3688
line 5403
;5399://		case FEEDER_HEADS:
;5400://			return UI_HeadCountByTeam();
;5401:
;5402:		case FEEDER_Q3HEADS:
;5403:			return UI_HeadCountByColor();
ADDRLP4 8
ADDRGP4 UI_HeadCountByColor
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3689
line 5406
;5404:
;5405:		case FEEDER_FORCECFG:
;5406:			if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $3690
line 5407
;5407:			{
line 5408
;5408:				return uiInfo.forceConfigCount-uiInfo.forceConfigLightIndexBegin;
ADDRGP4 uiInfo+78284
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
SUBI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3690
line 5411
;5409:			}
;5410:			else
;5411:			{
line 5412
;5412:				return uiInfo.forceConfigLightIndexBegin+1;
ADDRGP4 uiInfo+95192
INDIRI4
CNSTI4 1
ADDI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3695
line 5417
;5413:			}
;5414:			//return uiInfo.forceConfigCount;
;5415:
;5416:		case FEEDER_CINEMATICS:
;5417:			return uiInfo.movieCount;
ADDRGP4 uiInfo+36372
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3697
line 5421
;5418:
;5419:		case FEEDER_MAPS:
;5420:		case FEEDER_ALLMAPS:
;5421:			return UI_MapCountByGameType(feederID == FEEDER_MAPS ? qtrue : qfalse);
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $3699
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $3700
JUMPV
LABELV $3699
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $3700
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3701
line 5424
;5422:	
;5423:		case FEEDER_SERVERS:
;5424:			return uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+40740+10412
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3704
line 5427
;5425:	
;5426:		case FEEDER_SERVERSTATUS:
;5427:			return uiInfo.serverStatusInfo.numLines;
ADDRGP4 uiInfo+52288+3232
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3707
line 5430
;5428:	
;5429:		case FEEDER_FINDPLAYER:
;5430:			return uiInfo.numFoundPlayerServers;
ADDRGP4 uiInfo+60848
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3709
line 5433
;5431:
;5432:		case FEEDER_PLAYER_LIST:
;5433:			if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) 
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+18024
INDIRI4
LEI4 $3710
line 5434
;5434:			{
line 5435
;5435:				uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+18024
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 5436
;5436:				UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 5437
;5437:			}
LABELV $3710
line 5438
;5438:			return uiInfo.playerCount;
ADDRGP4 uiInfo+18012
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3717
line 5441
;5439:
;5440:		case FEEDER_TEAM_LIST:
;5441:			if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) 
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+18024
INDIRI4
LEI4 $3718
line 5442
;5442:			{
line 5443
;5443:				uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+18024
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 5444
;5444:				UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 5445
;5445:			}
LABELV $3718
line 5446
;5446:			return uiInfo.myTeamCount;
ADDRGP4 uiInfo+18016
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3725
line 5449
;5447:
;5448:		case FEEDER_MODS:
;5449:			return uiInfo.modCount;
ADDRGP4 uiInfo+34308
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3727
line 5452
;5450:	
;5451:		case FEEDER_DEMOS:
;5452:			return uiInfo.demoCount;
ADDRGP4 uiInfo+35340
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3685
line 5455
;5453:	}
;5454:
;5455:	return 0;
CNSTI4 0
RETI4
LABELV $3684
endproc UI_FeederCount 20 4
proc UI_SelectedMap 8 0
line 5458
;5456:}
;5457:
;5458:static const char *UI_SelectedMap(int index, int *actual) {
line 5460
;5459:	int i, c;
;5460:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5461
;5461:	*actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 5463
;5462:
;5463:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3735
JUMPV
LABELV $3732
line 5464
;5464:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3737
line 5465
;5465:			if (c == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3741
line 5466
;5466:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5467
;5467:				return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
INDIRP4
RETP4
ADDRGP4 $3731
JUMPV
LABELV $3741
line 5468
;5468:			} else {
line 5469
;5469:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5470
;5470:			}
line 5471
;5471:		}
LABELV $3737
line 5472
;5472:	}
LABELV $3733
line 5463
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3735
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $3732
line 5473
;5473:	return "";
ADDRGP4 $165
RETP4
LABELV $3731
endproc UI_SelectedMap 8 0
proc UI_SelectedHead 8 0
line 5476
;5474:}
;5475:
;5476:static const char *UI_SelectedHead(int index, int *actual) {
line 5478
;5477:	int i, c;
;5478:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5479
;5479:	*actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 5480
;5480:	for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3748
JUMPV
LABELV $3745
line 5481
;5481:		if (uiInfo.characterList[i].active) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3750
line 5482
;5482:			if (c == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3754
line 5483
;5483:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5484
;5484:				return uiInfo.characterList[i].name;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848
ADDP4
INDIRP4
RETP4
ADDRGP4 $3744
JUMPV
LABELV $3754
line 5485
;5485:			} else {
line 5486
;5486:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5487
;5487:			}
line 5488
;5488:		}
LABELV $3750
line 5489
;5489:	}
LABELV $3746
line 5480
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3748
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
LTI4 $3745
line 5490
;5490:	return "";
ADDRGP4 $165
RETP4
LABELV $3744
endproc UI_SelectedHead 8 0
proc UI_SelectedTeamHead 24 8
line 5498
;5491:}
;5492:
;5493:/*
;5494:==================
;5495:UI_HeadCountByColor
;5496:==================
;5497:*/
;5498:static const char *UI_SelectedTeamHead(int index, int *actual) {
line 5500
;5499:	char *teamname;
;5500:	int i,c=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5502
;5501:
;5502:	switch(uiSkinColor)
ADDRLP4 12
ADDRGP4 uiSkinColor
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $3761
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $3760
ADDRGP4 $3758
JUMPV
line 5503
;5503:	{
LABELV $3760
line 5505
;5504:		case TEAM_BLUE:
;5505:			teamname = "/blue";
ADDRLP4 4
ADDRGP4 $3192
ASGNP4
line 5506
;5506:			break;
ADDRGP4 $3759
JUMPV
LABELV $3761
line 5508
;5507:		case TEAM_RED:
;5508:			teamname = "/red";
ADDRLP4 4
ADDRGP4 $3194
ASGNP4
line 5509
;5509:			break;
ADDRGP4 $3759
JUMPV
LABELV $3758
line 5511
;5510:		default:
;5511:			teamname = "/default";
ADDRLP4 4
ADDRGP4 $3195
ASGNP4
line 5512
;5512:			break;
LABELV $3759
line 5517
;5513:	}
;5514:
;5515:	// Count each head with this color
;5516:
;5517:	for (i=0; i<uiInfo.q3HeadCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3765
JUMPV
LABELV $3762
line 5518
;5518:	{
line 5519
;5519:		if (uiInfo.q3HeadNames[i] && strstr(uiInfo.q3HeadNames[i], teamname))
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+60872
ADDP4
CVPU4 4
CNSTU4 0
EQU4 $3767
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3767
line 5520
;5520:		{
line 5521
;5521:			if (c==index)
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3771
line 5522
;5522:			{
line 5523
;5523:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5524
;5524:				return uiInfo.q3HeadNames[i];
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
RETP4
ADDRGP4 $3757
JUMPV
LABELV $3771
line 5527
;5525:			}
;5526:			else
;5527:			{
line 5528
;5528:				c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5529
;5529:			}
line 5530
;5530:		}
LABELV $3767
line 5531
;5531:	}
LABELV $3763
line 5517
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3765
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
LTI4 $3762
line 5532
;5532:	return "";
ADDRGP4 $165
RETP4
LABELV $3757
endproc UI_SelectedTeamHead 24 8
proc UI_GetIndexFromSelection 8 0
line 5536
;5533:}
;5534:
;5535:
;5536:static int UI_GetIndexFromSelection(int actual) {
line 5538
;5537:	int i, c;
;5538:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5539
;5539:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3778
JUMPV
LABELV $3775
line 5540
;5540:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3780
line 5541
;5541:			if (i == actual) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3784
line 5542
;5542:				return c;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $3774
JUMPV
LABELV $3784
line 5544
;5543:			}
;5544:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5545
;5545:		}
LABELV $3780
line 5546
;5546:	}
LABELV $3776
line 5539
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3778
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $3775
line 5547
;5547:  return 0;
CNSTI4 0
RETI4
LABELV $3774
endproc UI_GetIndexFromSelection 8 0
proc UI_UpdatePendingPings 0 4
line 5550
;5548:}
;5549:
;5550:static void UI_UpdatePendingPings() { 
line 5551
;5551:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 5552
;5552:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+40740+2212
CNSTI4 1
ASGNI4
line 5553
;5553:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5555
;5554:
;5555:}
LABELV $3786
endproc UI_UpdatePendingPings 0 4
bss
align 1
LABELV $3794
skip 1024
align 1
LABELV $3795
skip 1024
align 1
LABELV $3796
skip 32
align 1
LABELV $3797
skip 32
data
align 4
LABELV $3798
byte 4 -1
align 4
LABELV $3799
byte 4 0
code
proc UI_FeederItemText 112 20
line 5558
;5556:
;5557:static const char *UI_FeederItemText(float feederID, int index, int column, 
;5558:									 qhandle_t *handle1, qhandle_t *handle2, qhandle_t *handle3) {
line 5565
;5559:	static char info[MAX_STRING_CHARS];
;5560:	static char hostname[1024];
;5561:	static char clientBuff[32];
;5562:	static char needPass[32];
;5563:	static int lastColumn = -1;
;5564:	static int lastTime = 0;
;5565:	*handle1 = *handle2 = *handle3 = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5566
;5566:	if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3800
line 5568
;5567:		int actual;
;5568:		return UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 UI_SelectedHead
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3800
line 5569
;5569:	} else if (feederID == FEEDER_Q3HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3802
line 5571
;5570:		int actual;
;5571:		return UI_SelectedTeamHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 UI_SelectedTeamHead
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3802
line 5572
;5572:	} else if (feederID == FEEDER_FORCECFG) {
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $3804
line 5573
;5573:		if (index >= 0 && index < uiInfo.forceConfigCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3805
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
GEI4 $3805
line 5574
;5574:			if (index == 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $3809
line 5575
;5575:			{ //always show "custom"
line 5576
;5576:				return uiInfo.forceConfigNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3809
line 5579
;5577:			}
;5578:			else
;5579:			{
line 5580
;5580:				if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $3812
line 5581
;5581:				{
line 5582
;5582:					index += uiInfo.forceConfigLightIndexBegin;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
ADDI4
ASGNI4
line 5583
;5583:					if (index < 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $3815
line 5584
;5584:					{
line 5585
;5585:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3815
line 5587
;5586:					}
;5587:					if (index >= uiInfo.forceConfigCount)
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
LTI4 $3817
line 5588
;5588:					{
line 5589
;5589:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3817
line 5591
;5590:					}
;5591:					return uiInfo.forceConfigNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3812
line 5593
;5592:				}
;5593:				else if (uiForceSide == FORCE_DARKSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 2
NEI4 $3821
line 5594
;5594:				{
line 5595
;5595:					index += uiInfo.forceConfigDarkIndexBegin;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+95188
INDIRI4
ADDI4
ASGNI4
line 5596
;5596:					if (index < 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $3824
line 5597
;5597:					{
line 5598
;5598:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3824
line 5600
;5599:					}
;5600:					if (index > uiInfo.forceConfigLightIndexBegin)
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
LEI4 $3826
line 5601
;5601:					{ //dark gets read in before light
line 5602
;5602:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3826
line 5604
;5603:					}
;5604:					if (index >= uiInfo.forceConfigCount)
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
LTI4 $3829
line 5605
;5605:					{
line 5606
;5606:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3829
line 5608
;5607:					}
;5608:					return uiInfo.forceConfigNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3821
line 5611
;5609:				}
;5610:				else
;5611:				{
line 5612
;5612:					return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
line 5616
;5613:				}
;5614:			}
;5615:		}
;5616:	} else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
LABELV $3804
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
EQF4 $3835
ADDRLP4 4
INDIRF4
CNSTF4 1082130432
NEF4 $3833
LABELV $3835
line 5618
;5617:		int actual;
;5618:		return UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ADDRGP4 UI_SelectedMap
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3833
line 5619
;5619:	} else if (feederID == FEEDER_SERVERS) {
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3836
line 5620
;5620:		if (index >= 0 && index < uiInfo.serverStatus.numDisplayServers) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3837
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
GEI4 $3837
line 5622
;5621:			int ping, game;
;5622:			if (lastColumn != column || lastTime > uiInfo.uiDC.realTime + 5000) {
ADDRGP4 $3798
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $3845
ADDRGP4 $3799
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 5000
ADDI4
LEI4 $3842
LABELV $3845
line 5623
;5623:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $3794
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5624
;5624:				lastColumn = column;
ADDRGP4 $3798
ADDRFP4 8
INDIRI4
ASGNI4
line 5625
;5625:				lastTime = uiInfo.uiDC.realTime;
ADDRGP4 $3799
ADDRGP4 uiInfo+240
INDIRI4
ASGNI4
line 5626
;5626:			}
LABELV $3842
line 5627
;5627:			ping = atoi(Info_ValueForKey(info, "ping"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3429
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 5628
;5628:			if (ping == -1) {
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $3850
line 5631
;5629:				// if we ever see a ping that is out of date, do a server refresh
;5630:				// UI_UpdatePendingPings();
;5631:			}
LABELV $3850
line 5632
;5632:			switch (column) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $3837
ADDRLP4 28
INDIRI4
CNSTI4 4
GTI4 $3837
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3909
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3909
address $3854
address $3895
address $3896
address $3898
address $3905
code
LABELV $3854
line 5634
;5633:				case SORT_HOST : 
;5634:					if (ping <= 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $3855
line 5635
;5635:						return Info_ValueForKey(info, "addr");
ADDRGP4 $3794
ARGP4
ADDRGP4 $2939
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3855
line 5636
;5636:					} else {
line 5637
;5637:						int gametype = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 5639
;5638:						//check for password
;5639:						if ( atoi(Info_ValueForKey(info, "needpass")) )
ADDRGP4 $3794
ARGP4
ADDRGP4 $3859
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $3857
line 5640
;5640:						{
line 5641
;5641:							*handle3 = trap_R_RegisterShaderNoMip( "gfx/menus/needpass" );
ADDRGP4 $3860
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 44
INDIRI4
ASGNI4
line 5642
;5642:						}
LABELV $3857
line 5644
;5643:						//check for saberonly and restricted force powers
;5644:						gametype = atoi(Info_ValueForKey(info, "gametype"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3352
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 48
INDIRI4
ASGNI4
line 5645
;5645:						if ( gametype != GT_JEDIMASTER )
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $3861
line 5646
;5646:						{
line 5647
;5647:							qboolean saberOnly = qtrue;
ADDRLP4 56
CNSTI4 1
ASGNI4
line 5648
;5648:							qboolean restrictedForce = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 5649
;5649:							qboolean allForceDisabled = qfalse;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 5650
;5650:							int wDisable, i = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 5653
;5651:
;5652:							//check force
;5653:							restrictedForce = atoi(Info_ValueForKey(info, "fdisable"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3863
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
line 5654
;5654:							if ( UI_AllForceDisabled( restrictedForce ) )
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 UI_AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $3864
line 5655
;5655:							{//all force powers are disabled
line 5656
;5656:								allForceDisabled = qtrue;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 5657
;5657:								*handle2 = trap_R_RegisterShaderNoMip( "gfx/menus/noforce" );
ADDRGP4 $3866
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 84
INDIRI4
ASGNI4
line 5658
;5658:							}
ADDRGP4 $3865
JUMPV
LABELV $3864
line 5659
;5659:							else if ( restrictedForce )
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $3867
line 5660
;5660:							{//at least one force power is disabled
line 5661
;5661:								*handle2 = trap_R_RegisterShaderNoMip( "gfx/menus/forcerestrict" );
ADDRGP4 $3869
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 84
INDIRI4
ASGNI4
line 5662
;5662:							}
LABELV $3867
LABELV $3865
line 5665
;5663:							
;5664:							//check weaps
;5665:							wDisable = atoi(Info_ValueForKey(info, "wdisable"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3870
ARGP4
ADDRLP4 84
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 88
INDIRI4
ASGNI4
ADDRGP4 $3872
JUMPV
LABELV $3871
line 5668
;5666:
;5667:							while ( i < WP_NUM_WEAPONS )
;5668:							{
line 5669
;5669:								if ( !(wDisable & (1 << i)) && i != WP_SABER && i != WP_NONE )
ADDRLP4 92
ADDRLP4 52
INDIRI4
ASGNI4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDRLP4 92
INDIRI4
LSHI4
BANDI4
ADDRLP4 96
INDIRI4
NEI4 $3874
ADDRLP4 92
INDIRI4
CNSTI4 2
EQI4 $3874
ADDRLP4 92
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $3874
line 5670
;5670:								{
line 5671
;5671:									saberOnly = qfalse;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 5672
;5672:								}
LABELV $3874
line 5674
;5673:
;5674:								i++;
ADDRLP4 52
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5675
;5675:							}
LABELV $3872
line 5667
ADDRLP4 52
INDIRI4
CNSTI4 16
LTI4 $3871
line 5676
;5676:							if ( saberOnly )
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $3876
line 5677
;5677:							{
line 5678
;5678:								*handle1 = trap_R_RegisterShaderNoMip( "gfx/menus/saberonly" );
ADDRGP4 $3878
ARGP4
ADDRLP4 92
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 92
INDIRI4
ASGNI4
line 5679
;5679:							}
ADDRGP4 $3877
JUMPV
LABELV $3876
line 5680
;5680:							else if ( atoi(Info_ValueForKey(info, "truejedi")) != 0 )
ADDRGP4 $3794
ARGP4
ADDRGP4 $3881
ARGP4
ADDRLP4 92
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $3879
line 5681
;5681:							{
line 5682
;5682:								if ( gametype != GT_HOLOCRON 
ADDRLP4 100
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $3882
ADDRLP4 100
INDIRI4
CNSTI4 2
EQI4 $3882
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $3882
ADDRLP4 64
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $3882
line 5686
;5683:									&& gametype != GT_JEDIMASTER 
;5684:									&& !saberOnly 
;5685:									&& !allForceDisabled )
;5686:								{//truejedi is on and allowed in this mode
line 5687
;5687:									*handle1 = trap_R_RegisterShaderNoMip( "gfx/menus/truejedi" );
ADDRGP4 $3884
ARGP4
ADDRLP4 108
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 108
INDIRI4
ASGNI4
line 5688
;5688:								}
LABELV $3882
line 5689
;5689:							}
LABELV $3879
LABELV $3877
line 5690
;5690:						}
LABELV $3861
line 5691
;5691:						if ( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $3885
line 5692
;5692:							Com_sprintf( hostname, sizeof(hostname), "%s [%s]",
ADDRGP4 $3794
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 52
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3794
ARGP4
ADDRGP4 $3889
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $3795
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3888
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5695
;5693:											Info_ValueForKey(info, "hostname"),
;5694:											netnames[atoi(Info_ValueForKey(info, "nettype"))] );
;5695:							return hostname;
ADDRGP4 $3795
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3885
line 5697
;5696:						}
;5697:						else {
line 5698
;5698:							if (atoi(Info_ValueForKey(info, "sv_allowAnonymous")) != 0) {				// anonymous server
ADDRGP4 $3794
ARGP4
ADDRGP4 $3892
ARGP4
ADDRLP4 52
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $3890
line 5699
;5699:								Com_sprintf( hostname, sizeof(hostname), "(A) %s",
ADDRGP4 $3794
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3795
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3893
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5701
;5700:												Info_ValueForKey(info, "hostname"));
;5701:							} else {
ADDRGP4 $3891
JUMPV
LABELV $3890
line 5702
;5702:								Com_sprintf( hostname, sizeof(hostname), "%s",
ADDRGP4 $3794
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3795
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3894
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5704
;5703:												Info_ValueForKey(info, "hostname"));
;5704:							}
LABELV $3891
line 5705
;5705:							return hostname;
ADDRGP4 $3795
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3895
line 5709
;5706:						}
;5707:					}
;5708:				case SORT_MAP : 
;5709:					return Info_ValueForKey(info, "mapname");
ADDRGP4 $3794
ARGP4
ADDRGP4 $3386
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3896
line 5711
;5710:				case SORT_CLIENTS : 
;5711:					Com_sprintf( clientBuff, sizeof(clientBuff), "%s (%s)", Info_ValueForKey(info, "clients"), Info_ValueForKey(info, "sv_maxclients"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3332
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3794
ARGP4
ADDRGP4 $1511
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3796
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $3897
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5712
;5712:					return clientBuff;
ADDRGP4 $3796
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3898
line 5714
;5713:				case SORT_GAME : 
;5714:					game = atoi(Info_ValueForKey(info, "gametype"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3352
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 48
INDIRI4
ASGNI4
line 5715
;5715:					if (game >= 0 && game < numTeamArenaGameTypes) {
ADDRLP4 52
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $3899
ADDRLP4 52
INDIRI4
ADDRGP4 numTeamArenaGameTypes
INDIRI4
GEI4 $3899
line 5716
;5716:						strcpy(needPass,teamArenaGameTypes[game]);
ADDRGP4 $3797
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamArenaGameTypes
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5717
;5717:					} else {
ADDRGP4 $3900
JUMPV
LABELV $3899
line 5718
;5718:						if (ping <= 0)
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $3901
line 5719
;5719:						{
line 5720
;5720:							strcpy(needPass,"Inactive");
ADDRGP4 $3797
ARGP4
ADDRGP4 $3903
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5721
;5721:						}
LABELV $3901
line 5722
;5722:						strcpy(needPass,"Unknown");
ADDRGP4 $3797
ARGP4
ADDRGP4 $3904
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5723
;5723:					}
LABELV $3900
line 5725
;5724:
;5725:					return needPass;
ADDRGP4 $3797
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3905
line 5727
;5726:				case SORT_PING : 
;5727:					if (ping <= 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $3906
line 5728
;5728:						return "...";
ADDRGP4 $3908
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3906
line 5729
;5729:					} else {
line 5730
;5730:						return Info_ValueForKey(info, "ping");
ADDRGP4 $3794
ARGP4
ADDRGP4 $3429
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
line 5733
;5731:					}
;5732:			}
;5733:		}
line 5734
;5734:	} else if (feederID == FEEDER_SERVERSTATUS) {
LABELV $3836
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $3910
line 5735
;5735:		if ( index >= 0 && index < uiInfo.serverStatusInfo.numLines ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3911
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+52288+3232
INDIRI4
GEI4 $3911
line 5736
;5736:			if ( column >= 0 && column < 4 ) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $3911
ADDRLP4 12
INDIRI4
CNSTI4 4
GEI4 $3911
line 5737
;5737:				return uiInfo.serverStatusInfo.lines[index][column];
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+52288+64
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
line 5739
;5738:			}
;5739:		}
line 5740
;5740:	} else if (feederID == FEEDER_FINDPLAYER) {
LABELV $3910
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $3920
line 5741
;5741:		if ( index >= 0 && index < uiInfo.numFoundPlayerServers ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3921
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+60848
INDIRI4
GEI4 $3921
line 5743
;5742:			//return uiInfo.foundPlayerServerAddresses[index];
;5743:			return uiInfo.foundPlayerServerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
line 5745
;5744:		}
;5745:	} else if (feederID == FEEDER_PLAYER_LIST) {
LABELV $3920
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $3926
line 5746
;5746:		if (index >= 0 && index < uiInfo.playerCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3927
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+18012
INDIRI4
GEI4 $3927
line 5747
;5747:			return uiInfo.playerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+18040
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
line 5749
;5748:		}
;5749:	} else if (feederID == FEEDER_TEAM_LIST) {
LABELV $3926
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $3932
line 5750
;5750:		if (index >= 0 && index < uiInfo.myTeamCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3933
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $3933
line 5751
;5751:			return uiInfo.teamNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
line 5753
;5752:		}
;5753:	} else if (feederID == FEEDER_MODS) {
LABELV $3932
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $3938
line 5754
;5754:		if (index >= 0 && index < uiInfo.modCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3939
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+34308
INDIRI4
GEI4 $3939
line 5755
;5755:			if (uiInfo.modList[index].modDescr && *uiInfo.modList[index].modDescr) {
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+33796+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3943
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+33796+4
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3943
line 5756
;5756:				return uiInfo.modList[index].modDescr;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3943
line 5757
;5757:			} else {
line 5758
;5758:				return uiInfo.modList[index].modName;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
line 5761
;5759:			}
;5760:		}
;5761:	} else if (feederID == FEEDER_CINEMATICS) {
LABELV $3938
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $3952
line 5762
;5762:		if (index >= 0 && index < uiInfo.movieCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3953
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+36372
INDIRI4
GEI4 $3953
line 5763
;5763:			return uiInfo.movieList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+35348
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
line 5765
;5764:		}
;5765:	} else if (feederID == FEEDER_DEMOS) {
LABELV $3952
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $3958
line 5766
;5766:		if (index >= 0 && index < uiInfo.demoCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3960
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+35340
INDIRI4
GEI4 $3960
line 5767
;5767:			return uiInfo.demoList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+34316
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3960
line 5769
;5768:		}
;5769:	} 
LABELV $3958
LABELV $3953
LABELV $3939
LABELV $3933
LABELV $3927
LABELV $3921
LABELV $3911
LABELV $3837
LABELV $3805
line 5770
;5770:	return "";
ADDRGP4 $165
RETP4
LABELV $3793
endproc UI_FeederItemText 112 20
proc UI_FeederItemImage 296 16
line 5774
;5771:}
;5772:
;5773:
;5774:static qhandle_t UI_FeederItemImage(float feederID, int index) {
line 5775
;5775:	if (feederID == FEEDER_HEADS) 
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3965
line 5776
;5776:	{
line 5778
;5777:		int actual;
;5778:		UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 5779
;5779:		index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 5780
;5780:		if (index >= 0 && index < uiInfo.characterCount) 
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3966
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
GEI4 $3966
line 5781
;5781:		{
line 5782
;5782:			if (uiInfo.characterList[index].headImage == -1) 
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $3970
line 5783
;5783:			{
line 5784
;5784:				uiInfo.characterList[index].headImage = trap_R_RegisterShaderNoMip(uiInfo.characterList[index].imageName);
ADDRLP4 8
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+11848+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+11848+8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 5785
;5785:			}
LABELV $3970
line 5786
;5786:			return uiInfo.characterList[index].headImage;
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+8
ADDP4
INDIRI4
RETI4
ADDRGP4 $3964
JUMPV
line 5788
;5787:		}
;5788:	} 
LABELV $3965
line 5789
;5789:	else if (feederID == FEEDER_Q3HEADS) 
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3980
line 5790
;5790:	{
line 5792
;5791:		int actual;
;5792:		UI_SelectedTeamHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedTeamHead
CALLP4
pop
line 5793
;5793:		index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 5795
;5794:
;5795:		if (index >= 0 && index < uiInfo.q3HeadCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3981
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
GEI4 $3981
line 5796
;5796:		{ //we want it to load them as it draws them, like the TA feeder
line 5798
;5797:		      //return uiInfo.q3HeadIcons[index];
;5798:			int selModel = trap_Cvar_VariableValue("ui_selectedModelIndex");
ADDRGP4 $3985
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 5800
;5799:
;5800:			if (selModel != -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $3986
line 5801
;5801:			{
line 5802
;5802:				if (uiInfo.q3SelectedHead != selModel)
ADDRGP4 uiInfo+78280
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $3988
line 5803
;5803:				{
line 5804
;5804:					uiInfo.q3SelectedHead = selModel;
ADDRGP4 uiInfo+78280
ADDRLP4 8
INDIRI4
ASGNI4
line 5806
;5805:					//UI_FeederSelection(FEEDER_Q3HEADS, uiInfo.q3SelectedHead);
;5806:					Menu_SetFeederSelection(NULL, FEEDER_Q3HEADS, selModel, NULL);
CNSTP4 0
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5807
;5807:				}
LABELV $3988
line 5808
;5808:			}
LABELV $3986
line 5810
;5809:
;5810:			if (!uiInfo.q3HeadIcons[index])
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+77256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3992
line 5811
;5811:			{ //this isn't the best way of doing this I guess, but I didn't want a whole seperate string array
line 5815
;5812:			  //for storing shader names. I can't just replace q3HeadNames with the shader name, because we
;5813:			  //print what's in q3HeadNames and the icon name would look funny.
;5814:				char iconNameFromSkinName[256];
;5815:				int i = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5818
;5816:				int skinPlace;
;5817:
;5818:				i = strlen(uiInfo.q3HeadNames[index]);
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRLP4 280
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 280
INDIRI4
ASGNI4
ADDRGP4 $3997
JUMPV
LABELV $3996
line 5821
;5819:
;5820:				while (uiInfo.q3HeadNames[index][i] != '/')
;5821:				{
line 5822
;5822:					i--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5823
;5823:				}
LABELV $3997
line 5820
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $3996
line 5825
;5824:
;5825:				i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5826
;5826:				skinPlace = i; //remember that this is where the skin name begins
ADDRLP4 20
ADDRLP4 16
INDIRI4
ASGNI4
line 5829
;5827:
;5828:				//now, build a full path out of what's in q3HeadNames, into iconNameFromSkinName
;5829:				Com_sprintf(iconNameFromSkinName, sizeof(iconNameFromSkinName), "models/players/%s", uiInfo.q3HeadNames[index]);
ADDRLP4 24
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $4000
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5831
;5830:
;5831:				i = strlen(iconNameFromSkinName);
ADDRLP4 24
ARGP4
ADDRLP4 284
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 284
INDIRI4
ASGNI4
ADDRGP4 $4003
JUMPV
LABELV $4002
line 5834
;5832:
;5833:				while (iconNameFromSkinName[i] != '/')
;5834:				{
line 5835
;5835:					i--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5836
;5836:				}
LABELV $4003
line 5833
ADDRLP4 16
INDIRI4
ADDRLP4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $4002
line 5838
;5837:				
;5838:				i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5839
;5839:				iconNameFromSkinName[i] = 0; //terminate, and append..
ADDRLP4 16
INDIRI4
ADDRLP4 24
ADDP4
CNSTI1 0
ASGNI1
line 5840
;5840:				Q_strcat(iconNameFromSkinName, 256, "icon_");
ADDRLP4 24
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $4005
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 5843
;5841:
;5842:				//and now, for the final step, append the skin name from q3HeadNames onto the end of iconNameFromSkinName
;5843:				i = strlen(iconNameFromSkinName);
ADDRLP4 24
ARGP4
ADDRLP4 288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 288
INDIRI4
ASGNI4
ADDRGP4 $4007
JUMPV
LABELV $4006
line 5846
;5844:
;5845:				while (uiInfo.q3HeadNames[index][skinPlace])
;5846:				{
line 5847
;5847:					iconNameFromSkinName[i] = uiInfo.q3HeadNames[index][skinPlace];
ADDRLP4 16
INDIRI4
ADDRLP4 24
ADDP4
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ADDP4
INDIRI1
ASGNI1
line 5848
;5848:					i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5849
;5849:					skinPlace++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5850
;5850:				}
LABELV $4007
line 5845
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4006
line 5851
;5851:				iconNameFromSkinName[i] = 0;
ADDRLP4 16
INDIRI4
ADDRLP4 24
ADDP4
CNSTI1 0
ASGNI1
line 5854
;5852:
;5853:				//and now we are ready to register (thankfully this will only happen once)
;5854:				uiInfo.q3HeadIcons[index] = trap_R_RegisterShaderNoMip(iconNameFromSkinName);
ADDRLP4 24
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+77256
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 5855
;5855:			}
LABELV $3992
line 5856
;5856:			return uiInfo.q3HeadIcons[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+77256
ADDP4
INDIRI4
RETI4
ADDRGP4 $3964
JUMPV
line 5858
;5857:		}
;5858:    }
LABELV $3980
line 5859
;5859:	else if (feederID == FEEDER_ALLMAPS || feederID == FEEDER_MAPS) 
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
EQF4 $4015
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $4013
LABELV $4015
line 5860
;5860:	{
line 5862
;5861:		int actual;
;5862:		UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 5863
;5863:		index = actual;
ADDRFP4 4
ADDRLP4 4
INDIRI4
ASGNI4
line 5864
;5864:		if (index >= 0 && index < uiInfo.mapCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $4016
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
GEI4 $4016
line 5865
;5865:			if (uiInfo.mapList[index].levelShot == -1) {
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $4019
line 5866
;5866:				uiInfo.mapList[index].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[index].imageName);
ADDRLP4 12
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5867
;5867:			}
LABELV $4019
line 5868
;5868:			return uiInfo.mapList[index].levelShot;
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
RETI4
ADDRGP4 $3964
JUMPV
LABELV $4016
line 5870
;5869:		}
;5870:	}
LABELV $4013
LABELV $3981
LABELV $3966
line 5871
;5871:  return 0;
CNSTI4 0
RETI4
LABELV $3964
endproc UI_FeederItemImage 296 16
bss
align 1
LABELV $4030
skip 1024
export UI_FeederSelection
code
proc UI_FeederSelection 52 24
line 5874
;5872:}
;5873:
;5874:qboolean UI_FeederSelection(float feederID, int index) {
line 5876
;5875:	static char info[MAX_STRING_CHARS];
;5876:	if (feederID == FEEDER_HEADS) 
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $4031
line 5877
;5877:	{
line 5879
;5878:		int actual;
;5879:		UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 5880
;5880:		index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 5881
;5881:		if (index >= 0 && index < uiInfo.characterCount) 
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4032
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
GEI4 $4032
line 5882
;5882:		{
line 5883
;5883:			trap_Cvar_Set( "team_model", va("%s", uiInfo.characterList[index].base));
ADDRGP4 $3894
ARGP4
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4036
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5885
;5884:			//trap_Cvar_Set( "team_headmodel", va("*%s", uiInfo.characterList[index].name)); 
;5885:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 5886
;5886:		}
line 5887
;5887:	} 
ADDRGP4 $4032
JUMPV
LABELV $4031
line 5888
;5888:	else if (feederID == FEEDER_Q3HEADS) 
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $4039
line 5889
;5889:	{
line 5891
;5890:		int actual;
;5891:		UI_SelectedTeamHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedTeamHead
CALLP4
pop
line 5892
;5892:		uiInfo.q3SelectedHead = index;
ADDRGP4 uiInfo+78280
ADDRFP4 4
INDIRI4
ASGNI4
line 5893
;5893:		trap_Cvar_Set("ui_selectedModelIndex", va("%i", index));
ADDRGP4 $1406
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $3985
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5894
;5894:		index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 5895
;5895:		if (index >= 0 && index < uiInfo.q3HeadCount) 
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $4040
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
GEI4 $4040
line 5896
;5896:		{
line 5897
;5897:			trap_Cvar_Set( "model", uiInfo.q3HeadNames[index]);
ADDRGP4 $4045
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5901
;5898:			//trap_Cvar_Set( "headmodel", uiInfo.q3HeadNames[index]);
;5899:
;5900:			//Update team_model for now here also, because we're using a different team skin system
;5901:			trap_Cvar_Set( "team_model", uiInfo.q3HeadNames[index]);
ADDRGP4 $4036
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5904
;5902:			//trap_Cvar_Set( "team_headmodel", uiInfo.q3HeadNames[index]); 
;5903:
;5904:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 5905
;5905:		}
line 5906
;5906:	} 
ADDRGP4 $4040
JUMPV
LABELV $4039
line 5907
;5907:	else if (feederID == FEEDER_FORCECFG) 
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $4048
line 5908
;5908:	{
line 5909
;5909:		int newindex = index;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 5911
;5910:
;5911:		if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $4050
line 5912
;5912:		{
line 5913
;5913:			newindex += uiInfo.forceConfigLightIndexBegin;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
ADDI4
ASGNI4
line 5914
;5914:			if (newindex >= uiInfo.forceConfigCount)
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
LTI4 $4051
line 5915
;5915:			{
line 5916
;5916:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4029
JUMPV
line 5918
;5917:			}
;5918:		}
LABELV $4050
line 5920
;5919:		else
;5920:		{ //else dark
line 5921
;5921:			newindex += uiInfo.forceConfigDarkIndexBegin;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95188
INDIRI4
ADDI4
ASGNI4
line 5922
;5922:			if (newindex >= uiInfo.forceConfigCount || newindex > uiInfo.forceConfigLightIndexBegin)
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
GEI4 $4061
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
LEI4 $4057
LABELV $4061
line 5923
;5923:			{ //dark gets read in before light
line 5924
;5924:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4029
JUMPV
LABELV $4057
line 5926
;5925:			}
;5926:		}
LABELV $4051
line 5928
;5927:
;5928:		if (index >= 0 && index < uiInfo.forceConfigCount) 
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4049
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
GEI4 $4049
line 5929
;5929:		{
line 5930
;5930:				UI_ForceConfigHandle(uiInfo.forceConfigSelected, index);
ADDRGP4 uiInfo+78288
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceConfigHandle
CALLV
pop
line 5931
;5931:				uiInfo.forceConfigSelected = index;
ADDRGP4 uiInfo+78288
ADDRFP4 4
INDIRI4
ASGNI4
line 5932
;5932:		}
line 5933
;5933:	} 
ADDRGP4 $4049
JUMPV
LABELV $4048
line 5934
;5934:	else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) 
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $4069
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4067
LABELV $4069
line 5935
;5935:	{
line 5937
;5936:		int actual, map;
;5937:		const char *checkValid = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 5939
;5938:
;5939:		map = (feederID == FEEDER_ALLMAPS) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4073
ADDRLP4 16
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $4074
JUMPV
LABELV $4073
ADDRLP4 16
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $4074
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 5940
;5940:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4075
line 5941
;5941:		  trap_CIN_StopCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 5942
;5942:		  uiInfo.mapList[map].cinematic = -1;
CNSTI4 100
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
CNSTI4 -1
ASGNI4
line 5943
;5943:		}
LABELV $4075
line 5944
;5944:		checkValid = UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 20
ADDRGP4 UI_SelectedMap
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 5946
;5945:
;5946:		if (!checkValid || !checkValid[0])
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4085
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4083
LABELV $4085
line 5947
;5947:		{ //this isn't a valid map to select, so reselect the current
line 5948
;5948:			index = ui_mapIndex.integer;
ADDRFP4 4
ADDRGP4 ui_mapIndex+12
INDIRI4
ASGNI4
line 5949
;5949:			UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 5950
;5950:		}
LABELV $4083
line 5952
;5951:
;5952:		trap_Cvar_Set("ui_mapIndex", va("%d", index));
ADDRGP4 $702
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2374
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5953
;5953:		gUISelectedMap = index;
ADDRGP4 gUISelectedMap
ADDRFP4 4
INDIRI4
ASGNI4
line 5954
;5954:		ui_mapIndex.integer = index;
ADDRGP4 ui_mapIndex+12
ADDRFP4 4
INDIRI4
ASGNI4
line 5956
;5955:
;5956:		if (feederID == FEEDER_MAPS) {
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $4088
line 5957
;5957:			ui_currentMap.integer = actual;
ADDRGP4 ui_currentMap+12
ADDRLP4 8
INDIRI4
ASGNI4
line 5958
;5958:			trap_Cvar_Set("ui_currentMap", va("%d", actual));
ADDRGP4 $702
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $983
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5959
;5959:		uiInfo.mapList[ui_currentMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 48
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 5960
;5960:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 5963
;5961:			//trap_Cvar_Set("ui_opponentModel", uiInfo.mapList[ui_currentMap.integer].opponentName);
;5962:			//updateOpponentModel = qtrue;
;5963:		} else {
ADDRGP4 $4068
JUMPV
LABELV $4088
line 5964
;5964:			ui_currentNetMap.integer = actual;
ADDRGP4 ui_currentNetMap+12
ADDRLP4 8
INDIRI4
ASGNI4
line 5965
;5965:			trap_Cvar_Set("ui_currentNetMap", va("%d", actual));
ADDRGP4 $702
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $981
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5966
;5966:		uiInfo.mapList[ui_currentNetMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 48
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 5967
;5967:		}
line 5969
;5968:
;5969:	} else if (feederID == FEEDER_SERVERS) {
ADDRGP4 $4068
JUMPV
LABELV $4067
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $4110
line 5970
;5970:		const char *mapName = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 5971
;5971:		uiInfo.serverStatus.currentServer = index;
ADDRGP4 uiInfo+40740+2216
ADDRFP4 4
INDIRI4
ASGNI4
line 5972
;5972:		trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $4030
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5973
;5973:		uiInfo.serverStatus.currentServerPreview = trap_R_RegisterShaderNoMip(va("levelshots/%s", Info_ValueForKey(info, "mapname")));
ADDRGP4 $4030
ARGP4
ADDRGP4 $3386
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $1176
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+40740+10428
ADDRLP4 16
INDIRI4
ASGNI4
line 5974
;5974:		if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+40740+10432
INDIRI4
CNSTI4 0
LTI4 $4119
line 5975
;5975:		  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 5976
;5976:			uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+40740+10432
CNSTI4 -1
ASGNI4
line 5977
;5977:		}
LABELV $4119
line 5978
;5978:		mapName = Info_ValueForKey(info, "mapname");
ADDRGP4 $4030
ARGP4
ADDRGP4 $3386
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 5979
;5979:		if (mapName && *mapName) {
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4111
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4111
line 5980
;5980:			uiInfo.serverStatus.currentServerCinematic = trap_CIN_PlayCinematic(va("%s.roq", mapName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+40740+10432
ADDRLP4 36
INDIRI4
ASGNI4
line 5981
;5981:		}
line 5982
;5982:	} else if (feederID == FEEDER_SERVERSTATUS) {
ADDRGP4 $4111
JUMPV
LABELV $4110
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $4131
line 5984
;5983:		//
;5984:	} else if (feederID == FEEDER_FINDPLAYER) {
ADDRGP4 $4132
JUMPV
LABELV $4131
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $4133
line 5985
;5985:	  uiInfo.currentFoundPlayerServer = index;
ADDRGP4 uiInfo+60844
ADDRFP4 4
INDIRI4
ASGNI4
line 5987
;5986:	  //
;5987:	  if ( index < uiInfo.numFoundPlayerServers-1) {
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 1
SUBI4
GEI4 $4134
line 5989
;5988:			// build a new server status for this server
;5989:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+52224
ARGP4
ADDRGP4 uiInfo+60844
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+58796
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5990
;5990:			Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5991
;5991:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 5992
;5992:	  }
line 5993
;5993:	} else if (feederID == FEEDER_PLAYER_LIST) {
ADDRGP4 $4134
JUMPV
LABELV $4133
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $4143
line 5994
;5994:		uiInfo.playerIndex = index;
ADDRGP4 uiInfo+18028
ADDRFP4 4
INDIRI4
ASGNI4
line 5995
;5995:	} else if (feederID == FEEDER_TEAM_LIST) {
ADDRGP4 $4144
JUMPV
LABELV $4143
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $4146
line 5996
;5996:		uiInfo.teamIndex = index;
ADDRGP4 uiInfo+18020
ADDRFP4 4
INDIRI4
ASGNI4
line 5997
;5997:	} else if (feederID == FEEDER_MODS) {
ADDRGP4 $4147
JUMPV
LABELV $4146
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $4149
line 5998
;5998:		uiInfo.modIndex = index;
ADDRGP4 uiInfo+34312
ADDRFP4 4
INDIRI4
ASGNI4
line 5999
;5999:	} else if (feederID == FEEDER_CINEMATICS) {
ADDRGP4 $4150
JUMPV
LABELV $4149
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $4152
line 6000
;6000:		uiInfo.movieIndex = index;
ADDRGP4 uiInfo+36376
ADDRFP4 4
INDIRI4
ASGNI4
line 6001
;6001:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+36380
INDIRI4
CNSTI4 0
LTI4 $4155
line 6002
;6002:		  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6003
;6003:		}
LABELV $4155
line 6004
;6004:		uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+36380
CNSTI4 -1
ASGNI4
line 6005
;6005:	} else if (feederID == FEEDER_DEMOS) {
ADDRGP4 $4153
JUMPV
LABELV $4152
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $4160
line 6006
;6006:		uiInfo.demoIndex = index;
ADDRGP4 uiInfo+35344
ADDRFP4 4
INDIRI4
ASGNI4
line 6007
;6007:	}
LABELV $4160
LABELV $4153
LABELV $4150
LABELV $4147
LABELV $4144
LABELV $4134
LABELV $4132
LABELV $4111
LABELV $4068
LABELV $4049
LABELV $4040
LABELV $4032
line 6009
;6008:
;6009:	return qtrue;
CNSTI4 1
RETI4
LABELV $4029
endproc UI_FeederSelection 52 24
proc GameType_Parse 28 8
line 6013
;6010:}
;6011:
;6012:
;6013:static qboolean GameType_Parse(char **p, qboolean join) {
line 6016
;6014:	char *token;
;6015:
;6016:	token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6018
;6017:
;6018:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $4164
line 6019
;6019:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4164
line 6022
;6020:	}
;6021:
;6022:	if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4166
line 6023
;6023:		uiInfo.numJoinGameTypes = 0;
ADDRGP4 uiInfo+17876
CNSTI4 0
ASGNI4
line 6024
;6024:	} else {
ADDRGP4 $4171
JUMPV
LABELV $4166
line 6025
;6025:		uiInfo.numGameTypes = 0;
ADDRGP4 uiInfo+17744
CNSTI4 0
ASGNI4
line 6026
;6026:	}
ADDRGP4 $4171
JUMPV
LABELV $4170
line 6028
;6027:
;6028:	while ( 1 ) {
line 6029
;6029:		token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 6031
;6030:
;6031:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4173
line 6032
;6032:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4173
line 6035
;6033:		}
;6034:
;6035:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4177
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4175
LABELV $4177
line 6036
;6036:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4175
line 6039
;6037:		}
;6038:
;6039:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $4178
line 6041
;6040:			// two tokens per line, character name and sex
;6041:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4180
line 6042
;6042:				if (!String_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gameType) || !Int_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+17876
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4189
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+17876
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $4181
LABELV $4189
line 6043
;6043:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
line 6045
;6044:				}
;6045:			} else {
LABELV $4180
line 6046
;6046:				if (!String_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gameType) || !Int_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4197
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $4190
LABELV $4197
line 6047
;6047:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4190
line 6049
;6048:				}
;6049:			}
LABELV $4181
line 6051
;6050:    
;6051:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4198
line 6052
;6052:				if (uiInfo.numJoinGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+17876
INDIRI4
CNSTI4 16
GEI4 $4200
line 6053
;6053:					uiInfo.numJoinGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+17876
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6054
;6054:				} else {
ADDRGP4 $4199
JUMPV
LABELV $4200
line 6055
;6055:					Com_Printf("Too many net game types, last one replace!\n");
ADDRGP4 $4204
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6056
;6056:				}		
line 6057
;6057:			} else {
ADDRGP4 $4199
JUMPV
LABELV $4198
line 6058
;6058:				if (uiInfo.numGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 16
GEI4 $4205
line 6059
;6059:					uiInfo.numGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+17744
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6060
;6060:				} else {
ADDRGP4 $4206
JUMPV
LABELV $4205
line 6061
;6061:					Com_Printf("Too many game types, last one replace!\n");
ADDRGP4 $4209
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6062
;6062:				}		
LABELV $4206
line 6063
;6063:			}
LABELV $4199
line 6065
;6064:     
;6065:			token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 6066
;6066:			if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $4210
line 6067
;6067:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4210
line 6069
;6068:			}
;6069:		}
LABELV $4178
line 6070
;6070:	}
LABELV $4171
line 6028
ADDRGP4 $4170
JUMPV
line 6071
;6071:	return qfalse;
CNSTI4 0
RETI4
LABELV $4163
endproc GameType_Parse 28 8
proc MapList_Parse 52 8
line 6074
;6072:}
;6073:
;6074:static qboolean MapList_Parse(char **p) {
line 6077
;6075:	char *token;
;6076:
;6077:	token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6079
;6078:
;6079:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $4213
line 6080
;6080:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4213
line 6083
;6081:	}
;6082:
;6083:	uiInfo.mapCount = 0;
ADDRGP4 uiInfo+20344
CNSTI4 0
ASGNI4
ADDRGP4 $4217
JUMPV
LABELV $4216
line 6085
;6084:
;6085:	while ( 1 ) {
line 6086
;6086:		token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 6088
;6087:
;6088:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4219
line 6089
;6089:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4219
line 6092
;6090:		}
;6091:
;6092:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4223
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4221
LABELV $4223
line 6093
;6093:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4221
line 6096
;6094:		}
;6095:
;6096:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $4224
line 6097
;6097:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapName) || !String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapLoadName) 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4237
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4237
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4226
LABELV $4237
line 6098
;6098:				||!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].teamMembers) ) {
line 6099
;6099:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4226
line 6102
;6100:			}
;6101:
;6102:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].opponentName)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+12
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4238
line 6103
;6103:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4238
line 6106
;6104:			}
;6105:
;6106:			uiInfo.mapList[uiInfo.mapCount].typeBits = 0;
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+20
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $4247
JUMPV
LABELV $4246
line 6108
;6107:
;6108:			while (1) {
line 6109
;6109:				token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 6110
;6110:				if (token[0] >= '0' && token[0] <= '9') {
ADDRLP4 40
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $4248
ADDRLP4 40
INDIRI4
CNSTI4 57
GTI4 $4248
line 6111
;6111:					uiInfo.mapList[uiInfo.mapCount].typeBits |= (1 << (token[0] - 0x030));
ADDRLP4 44
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+20
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
LSHI4
BORI4
ASGNI4
line 6112
;6112:					if (!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].timeToBeat[token[0] - 0x30])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 2
LSHI4
CNSTI4 192
SUBI4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+28
ADDP4
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $4250
line 6113
;6113:						return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
line 6115
;6114:					}
;6115:				} else {
line 6116
;6116:					break;
LABELV $4250
line 6118
;6117:				} 
;6118:			}
LABELV $4247
line 6108
ADDRGP4 $4246
JUMPV
LABELV $4248
line 6125
;6119:
;6120:			//mapList[mapCount].imageName = String_Alloc(va("levelshots/%s", mapList[mapCount].mapLoadName));
;6121:			//if (uiInfo.mapCount == 0) {
;6122:			  // only load the first cinematic, selection loads the others
;6123:  			//  uiInfo.mapList[uiInfo.mapCount].cinematic = trap_CIN_PlayCinematic(va("%s.roq",uiInfo.mapList[uiInfo.mapCount].mapLoadName), qfalse, qfalse, qtrue, 0, 0, 0, 0);
;6124:			//}
;6125:  		uiInfo.mapList[uiInfo.mapCount].cinematic = -1;
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
CNSTI4 -1
ASGNI4
line 6126
;6126:			uiInfo.mapList[uiInfo.mapCount].levelShot = trap_R_RegisterShaderNoMip(va("levelshots/%s_small", uiInfo.mapList[uiInfo.mapCount].mapLoadName));
ADDRGP4 $4265
ARGP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 6128
;6127:
;6128:			if (uiInfo.mapCount < MAX_MAPS) {
ADDRGP4 uiInfo+20344
INDIRI4
CNSTI4 128
GEI4 $4269
line 6129
;6129:				uiInfo.mapCount++;
ADDRLP4 48
ADDRGP4 uiInfo+20344
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6130
;6130:			} else {
ADDRGP4 $4270
JUMPV
LABELV $4269
line 6131
;6131:				Com_Printf("Too many maps, last one replaced!\n");
ADDRGP4 $4273
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6132
;6132:			}
LABELV $4270
line 6133
;6133:		}
LABELV $4224
line 6134
;6134:	}
LABELV $4217
line 6085
ADDRGP4 $4216
JUMPV
line 6135
;6135:	return qfalse;
CNSTI4 0
RETI4
LABELV $4212
endproc MapList_Parse 52 8
proc UI_ParseGameInfo 44 8
line 6138
;6136:}
;6137:
;6138:static void UI_ParseGameInfo(const char *teamFile) {
line 6141
;6139:	char	*token;
;6140:	char *p;
;6141:	char *buff = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 6144
;6142:	//int mode = 0; TTimo: unused
;6143:
;6144:	buff = GetMenuBuffer(teamFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 GetMenuBuffer
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 6145
;6145:	if (!buff) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $4275
line 6146
;6146:		return;
ADDRGP4 $4274
JUMPV
LABELV $4275
line 6149
;6147:	}
;6148:
;6149:	p = buff;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $4278
JUMPV
LABELV $4277
line 6151
;6150:
;6151:	while ( 1 ) {
line 6152
;6152:		token = COM_ParseExt( (const char **)(&p), qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 6153
;6153:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4283
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4283
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $4280
LABELV $4283
line 6154
;6154:			break;
ADDRGP4 $4279
JUMPV
LABELV $4280
line 6157
;6155:		}
;6156:
;6157:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4284
line 6158
;6158:			break;
ADDRGP4 $4279
JUMPV
LABELV $4284
line 6161
;6159:		}
;6160:
;6161:		if (Q_stricmp(token, "gametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4288
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4286
line 6163
;6162:
;6163:			if (GameType_Parse(&p, qfalse)) {
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $4279
line 6164
;6164:				continue;
ADDRGP4 $4278
JUMPV
line 6165
;6165:			} else {
line 6166
;6166:				break;
LABELV $4286
line 6170
;6167:			}
;6168:		}
;6169:
;6170:		if (Q_stricmp(token, "joingametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4293
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $4291
line 6172
;6171:
;6172:			if (GameType_Parse(&p, qtrue)) {
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $4279
line 6173
;6173:				continue;
ADDRGP4 $4278
JUMPV
line 6174
;6174:			} else {
line 6175
;6175:				break;
LABELV $4291
line 6179
;6176:			}
;6177:		}
;6178:
;6179:		if (Q_stricmp(token, "maps") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4298
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $4296
line 6181
;6180:			// start a new menu
;6181:			MapList_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 MapList_Parse
CALLI4
pop
line 6182
;6182:		}
LABELV $4296
line 6184
;6183:
;6184:	}
LABELV $4278
line 6151
ADDRGP4 $4277
JUMPV
LABELV $4279
line 6185
;6185:}
LABELV $4274
endproc UI_ParseGameInfo 44 8
proc UI_Pause 4 8
line 6187
;6186:
;6187:static void UI_Pause(qboolean b) {
line 6188
;6188:	if (b) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $4300
line 6190
;6189:		// pause the game and set the ui keycatcher
;6190:	  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6191
;6191:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6192
;6192:	} else {
ADDRGP4 $4301
JUMPV
LABELV $4300
line 6194
;6193:		// unpause the game and clear the ui keycatcher
;6194:		trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6195
;6195:		trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 6196
;6196:		trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6197
;6197:	}
LABELV $4301
line 6198
;6198:}
LABELV $4299
endproc UI_Pause 4 8
proc UI_PlayCinematic 4 24
line 6200
;6199:
;6200:static int UI_PlayCinematic(const char *name, float x, float y, float w, float h) {
line 6201
;6201:  return trap_CIN_PlayCinematic(name, x, y, w, h, (CIN_loop | CIN_silent));
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 0
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4302
endproc UI_PlayCinematic 4 24
proc UI_StopCinematic 20 4
line 6204
;6202:}
;6203:
;6204:static void UI_StopCinematic(int handle) {
line 6205
;6205:	if (handle >= 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
LTI4 $4304
line 6206
;6206:	  trap_CIN_StopCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6207
;6207:	} else {
ADDRGP4 $4305
JUMPV
LABELV $4304
line 6208
;6208:		handle = abs(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 abs
CALLI4
ASGNI4
ADDRFP4 0
ADDRLP4 0
INDIRI4
ASGNI4
line 6209
;6209:		if (handle == UI_MAPCINEMATIC) {
ADDRFP4 0
INDIRI4
CNSTI4 244
NEI4 $4306
line 6210
;6210:			if (uiInfo.mapList[ui_currentMap.integer].cinematic >= 0) {
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4307
line 6211
;6211:			  trap_CIN_StopCinematic(uiInfo.mapList[ui_currentMap.integer].cinematic);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6212
;6212:			  uiInfo.mapList[ui_currentMap.integer].cinematic = -1;
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
CNSTI4 -1
ASGNI4
line 6213
;6213:			}
line 6214
;6214:		} else if (handle == UI_NETMAPCINEMATIC) {
ADDRGP4 $4307
JUMPV
LABELV $4306
ADDRFP4 0
INDIRI4
CNSTI4 246
NEI4 $4319
line 6215
;6215:			if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+40740+10432
INDIRI4
CNSTI4 0
LTI4 $4320
line 6216
;6216:			  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6217
;6217:				uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+40740+10432
CNSTI4 -1
ASGNI4
line 6218
;6218:			}
line 6219
;6219:		} else if (handle == UI_CLANCINEMATIC) {
ADDRGP4 $4320
JUMPV
LABELV $4319
ADDRFP4 0
INDIRI4
CNSTI4 251
NEI4 $4329
line 6220
;6220:		  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 6221
;6221:		  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $4331
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $4331
line 6222
;6222:				if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4334
line 6223
;6223:				  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6224
;6224:					uiInfo.teamList[i].cinematic = -1;
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
CNSTI4 -1
ASGNI4
line 6225
;6225:				}
LABELV $4334
line 6226
;6226:			}
LABELV $4331
line 6227
;6227:		}
LABELV $4329
LABELV $4320
LABELV $4307
line 6228
;6228:	}
LABELV $4305
line 6229
;6229:}
LABELV $4303
endproc UI_StopCinematic 20 4
proc UI_DrawCinematic 0 20
line 6231
;6230:
;6231:static void UI_DrawCinematic(int handle, float x, float y, float w, float h) {
line 6232
;6232:	trap_CIN_SetExtents(handle, x, y, w, h);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 6233
;6233:  trap_CIN_DrawCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 6234
;6234:}
LABELV $4342
endproc UI_DrawCinematic 0 20
proc UI_RunCinematicFrame 0 4
line 6236
;6235:
;6236:static void UI_RunCinematicFrame(int handle) {
line 6237
;6237:  trap_CIN_RunCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 6238
;6238:}
LABELV $4343
endproc UI_RunCinematicFrame 0 4
export UI_LoadForceConfig_List
proc UI_LoadForceConfig_List 2208 16
line 6248
;6239:
;6240:
;6241:/*
;6242:=================
;6243:UI_LoadForceConfig_List
;6244:=================
;6245:Looks in the directory for force config files (.fcf) and loads the name in
;6246:*/
;6247:void UI_LoadForceConfig_List( void )
;6248:{
line 6249
;6249:	int			numfiles = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 6252
;6250:	char		filelist[2048];
;6251:	char		configname[128];
;6252:	char		*fileptr = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 6253
;6253:	int			j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 6254
;6254:	int			filelen = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 6255
;6255:	qboolean	lightSearch = qfalse;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 6257
;6256:
;6257:	uiInfo.forceConfigCount = 0;
ADDRGP4 uiInfo+78284
CNSTI4 0
ASGNI4
line 6258
;6258:	Com_sprintf( uiInfo.forceConfigNames[uiInfo.forceConfigCount], sizeof(uiInfo.forceConfigNames[uiInfo.forceConfigCount]), "Custom");
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $4350
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6259
;6259:	uiInfo.forceConfigCount++;
ADDRLP4 2196
ADDRGP4 uiInfo+78284
ASGNP4
ADDRLP4 2196
INDIRP4
ADDRLP4 2196
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $4352
line 6263
;6260:	//Always reserve index 0 as the "custom" config
;6261:
;6262:nextSearch:
;6263:	if (lightSearch)
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $4353
line 6264
;6264:	{ //search light side folder
line 6265
;6265:		numfiles = trap_FS_GetFileList("forcecfg/light", "fcf", filelist, 2048 );
ADDRGP4 $4355
ARGP4
ADDRGP4 $4356
ARGP4
ADDRLP4 148
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2200
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 2200
INDIRI4
ASGNI4
line 6266
;6266:		uiInfo.forceConfigLightIndexBegin = uiInfo.forceConfigCount-1;
ADDRGP4 uiInfo+95192
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6267
;6267:	}
ADDRGP4 $4354
JUMPV
LABELV $4353
line 6269
;6268:	else
;6269:	{ //search dark side folder
line 6270
;6270:		numfiles = trap_FS_GetFileList("forcecfg/dark", "fcf", filelist, 2048 );
ADDRGP4 $4359
ARGP4
ADDRGP4 $4356
ARGP4
ADDRLP4 148
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2200
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 2200
INDIRI4
ASGNI4
line 6271
;6271:		uiInfo.forceConfigDarkIndexBegin = uiInfo.forceConfigCount-1;
ADDRGP4 uiInfo+95188
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6272
;6272:	}
LABELV $4354
line 6274
;6273:
;6274:	fileptr = filelist;
ADDRLP4 0
ADDRLP4 148
ASGNP4
line 6276
;6275:
;6276:	for (j=0; j<numfiles && uiInfo.forceConfigCount < MAX_FORCE_CONFIGS;j++,fileptr+=filelen+1)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $4365
JUMPV
LABELV $4362
line 6277
;6277:	{
line 6278
;6278:		filelen = strlen(fileptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2200
INDIRI4
ASGNI4
line 6279
;6279:		COM_StripExtension(fileptr, configname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 6281
;6280:
;6281:		if (lightSearch)
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $4367
line 6282
;6282:		{
line 6283
;6283:			uiInfo.forceConfigSide[uiInfo.forceConfigCount] = qtrue; //light side config
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+94676
ADDP4
CNSTI4 1
ASGNI4
line 6284
;6284:		}
ADDRGP4 $4368
JUMPV
LABELV $4367
line 6286
;6285:		else
;6286:		{
line 6287
;6287:			uiInfo.forceConfigSide[uiInfo.forceConfigCount] = qfalse; //dark side config
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+94676
ADDP4
CNSTI4 0
ASGNI4
line 6288
;6288:		}
LABELV $4368
line 6290
;6289:
;6290:		Com_sprintf( uiInfo.forceConfigNames[uiInfo.forceConfigCount], sizeof(uiInfo.forceConfigNames[uiInfo.forceConfigCount]), configname);
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6291
;6291:		uiInfo.forceConfigCount++;
ADDRLP4 2204
ADDRGP4 uiInfo+78284
ASGNP4
ADDRLP4 2204
INDIRP4
ADDRLP4 2204
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6292
;6292:	}
LABELV $4363
line 6276
ADDRLP4 2200
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 2200
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2200
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $4365
ADDRLP4 4
INDIRI4
ADDRLP4 144
INDIRI4
GEI4 $4378
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 128
LTI4 $4362
LABELV $4378
line 6294
;6293:
;6294:	if (!lightSearch)
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $4379
line 6295
;6295:	{
line 6296
;6296:		lightSearch = qtrue;
ADDRLP4 140
CNSTI4 1
ASGNI4
line 6297
;6297:		goto nextSearch;
ADDRGP4 $4352
JUMPV
LABELV $4379
line 6299
;6298:	}
;6299:}
LABELV $4344
endproc UI_LoadForceConfig_List 2208 16
proc UI_BuildQ3Model_List 6320 20
line 6308
;6300:
;6301:
;6302:/*
;6303:=================
;6304:PlayerModel_BuildList
;6305:=================
;6306:*/
;6307:static void UI_BuildQ3Model_List( void )
;6308:{
line 6321
;6309:	int		numdirs;
;6310:	int		numfiles;
;6311:	char	dirlist[2048];
;6312:	char	filelist[2048];
;6313:	char	skinname[64];
;6314:	char*	dirptr;
;6315:	char*	fileptr;
;6316:	int		i;
;6317:	int		j, k, p, s;
;6318:	int		dirlen;
;6319:	int		filelen;
;6320:
;6321:	uiInfo.q3HeadCount = 0;
ADDRGP4 uiInfo+60868
CNSTI4 0
ASGNI4
line 6324
;6322:
;6323:	// iterate directory of all player models
;6324:	numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048 );
ADDRGP4 $4383
ARGP4
ADDRGP4 $4384
ARGP4
ADDRLP4 2156
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4204
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2152
ADDRLP4 4204
INDIRI4
ASGNI4
line 6325
;6325:	dirptr  = dirlist;
ADDRLP4 76
ADDRLP4 2156
ASGNP4
line 6326
;6326:	for (i=0; i<numdirs && uiInfo.q3HeadCount < MAX_PLAYERMODELS; i++,dirptr+=dirlen+1)
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 $4388
JUMPV
LABELV $4385
line 6327
;6327:	{
line 6328
;6328:		int f = 0;
ADDRLP4 4208
CNSTI4 0
ASGNI4
line 6331
;6329:		char fpath[2048];
;6330:
;6331:		dirlen = strlen(dirptr);
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 6260
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 6260
INDIRI4
ASGNI4
line 6333
;6332:		
;6333:		if (dirlen && dirptr[dirlen-1]=='/') dirptr[dirlen-1]='\0';
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $4390
ADDRLP4 96
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $4390
ADDRLP4 96
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $4390
line 6335
;6334:
;6335:		if (!strcmp(dirptr,".") || !strcmp(dirptr,".."))
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $4394
ARGP4
ADDRLP4 6268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6268
INDIRI4
CNSTI4 0
EQI4 $4396
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $4395
ARGP4
ADDRLP4 6272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6272
INDIRI4
CNSTI4 0
NEI4 $4392
LABELV $4396
line 6336
;6336:			continue;
ADDRGP4 $4386
JUMPV
LABELV $4392
line 6339
;6337:			
;6338:
;6339:		numfiles = trap_FS_GetFileList( va("models/players/%s",dirptr), "skin", filelist, 2048 );
ADDRGP4 $4000
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 6276
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6276
INDIRP4
ARGP4
ADDRGP4 $4397
ARGP4
ADDRLP4 104
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 6280
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 92
ADDRLP4 6280
INDIRI4
ASGNI4
line 6340
;6340:		fileptr  = filelist;
ADDRLP4 80
ADDRLP4 104
ASGNP4
line 6341
;6341:		for (j=0; j<numfiles && uiInfo.q3HeadCount < MAX_PLAYERMODELS;j++,fileptr+=filelen+1)
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 $4401
JUMPV
LABELV $4398
line 6342
;6342:		{
line 6343
;6343:			int skinLen = 0;
ADDRLP4 6284
CNSTI4 0
ASGNI4
line 6345
;6344:
;6345:			filelen = strlen(fileptr);
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 6288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 6288
INDIRI4
ASGNI4
line 6347
;6346:
;6347:			COM_StripExtension(fileptr,skinname);
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 6349
;6348:
;6349:			skinLen = strlen(skinname);
ADDRLP4 4
ARGP4
ADDRLP4 6292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 6284
ADDRLP4 6292
INDIRI4
ASGNI4
line 6350
;6350:			k = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $4404
JUMPV
LABELV $4403
line 6352
;6351:			while (k < skinLen && skinname[k] && skinname[k] != '_')
;6352:			{
line 6353
;6353:				k++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6354
;6354:			}
LABELV $4404
line 6351
ADDRLP4 0
INDIRI4
ADDRLP4 6284
INDIRI4
GEI4 $4407
ADDRLP4 6300
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 6300
INDIRI4
CNSTI4 0
EQI4 $4407
ADDRLP4 6300
INDIRI4
CNSTI4 95
NEI4 $4403
LABELV $4407
line 6355
;6355:			if (skinname[k] == '_')
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $4408
line 6356
;6356:			{
line 6357
;6357:				p = 0;
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRGP4 $4411
JUMPV
LABELV $4410
line 6360
;6358:
;6359:				while (skinname[k])
;6360:				{
line 6361
;6361:					skinname[p] = skinname[k];
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
ASGNI1
line 6362
;6362:					k++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6363
;6363:					p++;
ADDRLP4 72
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6364
;6364:				}
LABELV $4411
line 6359
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4410
line 6365
;6365:				skinname[p] = '\0';
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 6366
;6366:			}
LABELV $4408
line 6368
;6367:
;6368:			Com_sprintf(fpath, 2048, "models/players/%s/icon%s.jpg", dirptr, skinname);
ADDRLP4 4212
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 $4413
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6370
;6369:
;6370:			trap_FS_FOpenFile(fpath, &f, FS_READ);
ADDRLP4 4212
ARGP4
ADDRLP4 4208
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 6372
;6371:
;6372:			if (f)
ADDRLP4 4208
INDIRI4
CNSTI4 0
EQI4 $4414
line 6373
;6373:			{ //if it exists
line 6374
;6374:				qboolean iconExists = qfalse;
ADDRLP4 6304
CNSTI4 0
ASGNI4
line 6376
;6375:
;6376:				trap_FS_FCloseFile(f);
ADDRLP4 4208
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 6378
;6377:
;6378:				if (skinname[0] == '_')
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $4416
line 6379
;6379:				{ //change character to append properly
line 6380
;6380:					skinname[0] = '/';
ADDRLP4 4
CNSTI1 47
ASGNI1
line 6381
;6381:				}
LABELV $4416
line 6383
;6382:
;6383:				s = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $4419
JUMPV
LABELV $4418
line 6386
;6384:
;6385:				while (s < uiInfo.q3HeadCount)
;6386:				{ //check for dupes
line 6387
;6387:					if (!Q_stricmp(va("%s%s", dirptr, skinname), uiInfo.q3HeadNames[s]))
ADDRGP4 $4424
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 6308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6308
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRLP4 6312
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6312
INDIRI4
CNSTI4 0
NEI4 $4422
line 6388
;6388:					{
line 6389
;6389:						iconExists = qtrue;
ADDRLP4 6304
CNSTI4 1
ASGNI4
line 6390
;6390:						break;
ADDRGP4 $4420
JUMPV
LABELV $4422
line 6392
;6391:					}
;6392:					s++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6393
;6393:				}
LABELV $4419
line 6385
ADDRLP4 68
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
LTI4 $4418
LABELV $4420
line 6395
;6394:
;6395:				if (iconExists)
ADDRLP4 6304
INDIRI4
CNSTI4 0
EQI4 $4426
line 6396
;6396:				{
line 6397
;6397:					continue;
ADDRGP4 $4399
JUMPV
LABELV $4426
line 6400
;6398:				}
;6399:
;6400:				Com_sprintf( uiInfo.q3HeadNames[uiInfo.q3HeadCount], sizeof(uiInfo.q3HeadNames[uiInfo.q3HeadCount]), va("%s%s", dirptr, skinname));
ADDRGP4 $4424
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 6308
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 uiInfo+60868
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 6308
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6401
;6401:				uiInfo.q3HeadIcons[uiInfo.q3HeadCount++] = 0;//trap_R_RegisterShaderNoMip(fpath);
ADDRLP4 6316
ADDRGP4 uiInfo+60868
ASGNP4
ADDRLP4 6312
ADDRLP4 6316
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 6316
INDIRP4
ADDRLP4 6312
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 6312
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+77256
ADDP4
CNSTI4 0
ASGNI4
line 6403
;6402:				//rww - we are now registering them as they are drawn like the TA feeder, so as to decrease UI load time.
;6403:			}
LABELV $4414
line 6405
;6404:
;6405:			if (uiInfo.q3HeadCount >= MAX_PLAYERMODELS)
ADDRGP4 uiInfo+60868
INDIRI4
CNSTI4 256
LTI4 $4434
line 6406
;6406:			{
line 6407
;6407:				return;
ADDRGP4 $4381
JUMPV
LABELV $4434
line 6409
;6408:			}
;6409:		}
LABELV $4399
line 6341
ADDRLP4 6284
CNSTI4 1
ASGNI4
ADDRLP4 84
ADDRLP4 84
INDIRI4
ADDRLP4 6284
INDIRI4
ADDI4
ASGNI4
ADDRLP4 80
ADDRLP4 88
INDIRI4
ADDRLP4 6284
INDIRI4
ADDI4
ADDRLP4 80
INDIRP4
ADDP4
ASGNP4
LABELV $4401
ADDRLP4 84
INDIRI4
ADDRLP4 92
INDIRI4
GEI4 $4437
ADDRGP4 uiInfo+60868
INDIRI4
CNSTI4 256
LTI4 $4398
LABELV $4437
line 6410
;6410:	}	
LABELV $4386
line 6326
ADDRLP4 4208
CNSTI4 1
ASGNI4
ADDRLP4 100
ADDRLP4 100
INDIRI4
ADDRLP4 4208
INDIRI4
ADDI4
ASGNI4
ADDRLP4 76
ADDRLP4 96
INDIRI4
ADDRLP4 4208
INDIRI4
ADDI4
ADDRLP4 76
INDIRP4
ADDP4
ASGNP4
LABELV $4388
ADDRLP4 100
INDIRI4
ADDRLP4 2152
INDIRI4
GEI4 $4438
ADDRGP4 uiInfo+60868
INDIRI4
CNSTI4 256
LTI4 $4385
LABELV $4438
line 6412
;6411:
;6412:}
LABELV $4381
endproc UI_BuildQ3Model_List 6320 20
export _UI_Init
proc _UI_Init 52 16
line 6421
;6413:
;6414:
;6415:
;6416:/*
;6417:=================
;6418:UI_Init
;6419:=================
;6420:*/
;6421:void _UI_Init( qboolean inGameLoad ) {
line 6426
;6422:	int i;
;6423:	const char *menuSet;
;6424:	int start;
;6425:
;6426:	uiInfo.inGameLoad = inGameLoad;
ADDRGP4 uiInfo+95200
ADDRFP4 0
INDIRI4
ASGNI4
line 6428
;6427:
;6428:	UI_UpdateForcePowers();
ADDRGP4 UI_UpdateForcePowers
CALLV
pop
line 6430
;6429:
;6430:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 6431
;6431:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 6434
;6432:
;6433:	// cache redundant calulations
;6434:	trap_GetGlconfig( &uiInfo.uiDC.glconfig );
ADDRGP4 uiInfo+468
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 6437
;6435:
;6436:	// for 640x480 virtualized screen
;6437:	uiInfo.uiDC.yscale = uiInfo.uiDC.glconfig.vidHeight * (1.0/480.0);
ADDRGP4 uiInfo+228
CNSTF4 990414985
ADDRGP4 uiInfo+468+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 6438
;6438:	uiInfo.uiDC.xscale = uiInfo.uiDC.glconfig.vidWidth * (1.0/640.0);
ADDRGP4 uiInfo+232
CNSTF4 986500301
ADDRGP4 uiInfo+468+11304
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 6439
;6439:	if ( uiInfo.uiDC.glconfig.vidWidth * 480 > uiInfo.uiDC.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uiInfo+468+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uiInfo+468+11308
INDIRI4
MULI4
LEI4 $4448
line 6441
;6440:		// wide screen
;6441:		uiInfo.uiDC.bias = 0.5 * ( uiInfo.uiDC.glconfig.vidWidth - ( uiInfo.uiDC.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 uiInfo+236
CNSTF4 1056964608
ADDRGP4 uiInfo+468+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uiInfo+468+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 6442
;6442:	}
ADDRGP4 $4449
JUMPV
LABELV $4448
line 6443
;6443:	else {
line 6445
;6444:		// no wide screen
;6445:		uiInfo.uiDC.bias = 0;
ADDRGP4 uiInfo+236
CNSTF4 0
ASGNF4
line 6446
;6446:	}
LABELV $4449
line 6450
;6447:
;6448:
;6449:  //UI_Load();
;6450:	uiInfo.uiDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
ADDRGP4 uiInfo
ADDRGP4 trap_R_RegisterShaderNoMip
ASGNP4
line 6451
;6451:	uiInfo.uiDC.setColor = &UI_SetColor;
ADDRGP4 uiInfo+4
ADDRGP4 UI_SetColor
ASGNP4
line 6452
;6452:	uiInfo.uiDC.drawHandlePic = &UI_DrawHandlePic;
ADDRGP4 uiInfo+8
ADDRGP4 UI_DrawHandlePic
ASGNP4
line 6453
;6453:	uiInfo.uiDC.drawStretchPic = &trap_R_DrawStretchPic;
ADDRGP4 uiInfo+12
ADDRGP4 trap_R_DrawStretchPic
ASGNP4
line 6454
;6454:	uiInfo.uiDC.drawText = &Text_Paint;
ADDRGP4 uiInfo+16
ADDRGP4 Text_Paint
ASGNP4
line 6455
;6455:	uiInfo.uiDC.textWidth = &Text_Width;
ADDRGP4 uiInfo+20
ADDRGP4 Text_Width
ASGNP4
line 6456
;6456:	uiInfo.uiDC.textHeight = &Text_Height;
ADDRGP4 uiInfo+24
ADDRGP4 Text_Height
ASGNP4
line 6457
;6457:	uiInfo.uiDC.registerModel = &trap_R_RegisterModel;
ADDRGP4 uiInfo+28
ADDRGP4 trap_R_RegisterModel
ASGNP4
line 6458
;6458:	uiInfo.uiDC.modelBounds = &trap_R_ModelBounds;
ADDRGP4 uiInfo+32
ADDRGP4 trap_R_ModelBounds
ASGNP4
line 6459
;6459:	uiInfo.uiDC.fillRect = &UI_FillRect;
ADDRGP4 uiInfo+36
ADDRGP4 UI_FillRect
ASGNP4
line 6460
;6460:	uiInfo.uiDC.drawRect = &_UI_DrawRect;
ADDRGP4 uiInfo+40
ADDRGP4 _UI_DrawRect
ASGNP4
line 6461
;6461:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 6462
;6462:	uiInfo.uiDC.drawTopBottom = &_UI_DrawTopBottom;
ADDRGP4 uiInfo+48
ADDRGP4 _UI_DrawTopBottom
ASGNP4
line 6463
;6463:	uiInfo.uiDC.clearScene = &trap_R_ClearScene;
ADDRGP4 uiInfo+52
ADDRGP4 trap_R_ClearScene
ASGNP4
line 6464
;6464:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 6465
;6465:	uiInfo.uiDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
ADDRGP4 uiInfo+56
ADDRGP4 trap_R_AddRefEntityToScene
ASGNP4
line 6466
;6466:	uiInfo.uiDC.renderScene = &trap_R_RenderScene;
ADDRGP4 uiInfo+60
ADDRGP4 trap_R_RenderScene
ASGNP4
line 6467
;6467:	uiInfo.uiDC.RegisterFont = &trap_R_RegisterFont;
ADDRGP4 uiInfo+64
ADDRGP4 trap_R_RegisterFont
ASGNP4
line 6468
;6468:	uiInfo.uiDC.Font_StrLenPixels = trap_R_Font_StrLenPixels;
ADDRGP4 uiInfo+68
ADDRGP4 trap_R_Font_StrLenPixels
ASGNP4
line 6469
;6469:	uiInfo.uiDC.Font_StrLenChars = trap_R_Font_StrLenChars;
ADDRGP4 uiInfo+72
ADDRGP4 trap_R_Font_StrLenChars
ASGNP4
line 6470
;6470:	uiInfo.uiDC.Font_HeightPixels = trap_R_Font_HeightPixels;
ADDRGP4 uiInfo+76
ADDRGP4 trap_R_Font_HeightPixels
ASGNP4
line 6471
;6471:	uiInfo.uiDC.Font_DrawString = trap_R_Font_DrawString;
ADDRGP4 uiInfo+80
ADDRGP4 trap_R_Font_DrawString
ASGNP4
line 6472
;6472:	uiInfo.uiDC.Language_IsAsian = trap_Language_IsAsian;
ADDRGP4 uiInfo+84
ADDRGP4 trap_Language_IsAsian
ASGNP4
line 6473
;6473:	uiInfo.uiDC.Language_UsesSpaces = trap_Language_UsesSpaces;
ADDRGP4 uiInfo+88
ADDRGP4 trap_Language_UsesSpaces
ASGNP4
line 6474
;6474:	uiInfo.uiDC.AnyLanguage_ReadCharFromString = trap_AnyLanguage_ReadCharFromString;
ADDRGP4 uiInfo+92
ADDRGP4 trap_AnyLanguage_ReadCharFromString
ASGNP4
line 6475
;6475:	uiInfo.uiDC.ownerDrawItem = &UI_OwnerDraw;
ADDRGP4 uiInfo+96
ADDRGP4 UI_OwnerDraw
ASGNP4
line 6476
;6476:	uiInfo.uiDC.getValue = &UI_GetValue;
ADDRGP4 uiInfo+100
ADDRGP4 UI_GetValue
ASGNP4
line 6477
;6477:	uiInfo.uiDC.ownerDrawVisible = &UI_OwnerDrawVisible;
ADDRGP4 uiInfo+104
ADDRGP4 UI_OwnerDrawVisible
ASGNP4
line 6478
;6478:	uiInfo.uiDC.runScript = &UI_RunMenuScript;
ADDRGP4 uiInfo+108
ADDRGP4 UI_RunMenuScript
ASGNP4
line 6479
;6479:	uiInfo.uiDC.deferScript = &UI_DeferMenuScript;
ADDRGP4 uiInfo+112
ADDRGP4 UI_DeferMenuScript
ASGNP4
line 6480
;6480:	uiInfo.uiDC.getTeamColor = &UI_GetTeamColor;
ADDRGP4 uiInfo+116
ADDRGP4 UI_GetTeamColor
ASGNP4
line 6481
;6481:	uiInfo.uiDC.setCVar = trap_Cvar_Set;
ADDRGP4 uiInfo+128
ADDRGP4 trap_Cvar_Set
ASGNP4
line 6482
;6482:	uiInfo.uiDC.getCVarString = trap_Cvar_VariableStringBuffer;
ADDRGP4 uiInfo+120
ADDRGP4 trap_Cvar_VariableStringBuffer
ASGNP4
line 6483
;6483:	uiInfo.uiDC.getCVarValue = trap_Cvar_VariableValue;
ADDRGP4 uiInfo+124
ADDRGP4 trap_Cvar_VariableValue
ASGNP4
line 6484
;6484:	uiInfo.uiDC.drawTextWithCursor = &Text_PaintWithCursor;
ADDRGP4 uiInfo+132
ADDRGP4 Text_PaintWithCursor
ASGNP4
line 6485
;6485:	uiInfo.uiDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
ADDRGP4 uiInfo+136
ADDRGP4 trap_Key_SetOverstrikeMode
ASGNP4
line 6486
;6486:	uiInfo.uiDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
ADDRGP4 uiInfo+140
ADDRGP4 trap_Key_GetOverstrikeMode
ASGNP4
line 6487
;6487:	uiInfo.uiDC.startLocalSound = &trap_S_StartLocalSound;
ADDRGP4 uiInfo+144
ADDRGP4 trap_S_StartLocalSound
ASGNP4
line 6488
;6488:	uiInfo.uiDC.ownerDrawHandleKey = &UI_OwnerDrawHandleKey;
ADDRGP4 uiInfo+148
ADDRGP4 UI_OwnerDrawHandleKey
ASGNP4
line 6489
;6489:	uiInfo.uiDC.feederCount = &UI_FeederCount;
ADDRGP4 uiInfo+152
ADDRGP4 UI_FeederCount
ASGNP4
line 6490
;6490:	uiInfo.uiDC.feederItemImage = &UI_FeederItemImage;
ADDRGP4 uiInfo+160
ADDRGP4 UI_FeederItemImage
ASGNP4
line 6491
;6491:	uiInfo.uiDC.feederItemText = &UI_FeederItemText;
ADDRGP4 uiInfo+156
ADDRGP4 UI_FeederItemText
ASGNP4
line 6492
;6492:	uiInfo.uiDC.feederSelection = &UI_FeederSelection;
ADDRGP4 uiInfo+164
ADDRGP4 UI_FeederSelection
ASGNP4
line 6493
;6493:	uiInfo.uiDC.setBinding = &trap_Key_SetBinding;
ADDRGP4 uiInfo+176
ADDRGP4 trap_Key_SetBinding
ASGNP4
line 6494
;6494:	uiInfo.uiDC.getBindingBuf = &trap_Key_GetBindingBuf;
ADDRGP4 uiInfo+172
ADDRGP4 trap_Key_GetBindingBuf
ASGNP4
line 6495
;6495:	uiInfo.uiDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
ADDRGP4 uiInfo+168
ADDRGP4 trap_Key_KeynumToStringBuf
ASGNP4
line 6496
;6496:	uiInfo.uiDC.executeText = &trap_Cmd_ExecuteText;
ADDRGP4 uiInfo+180
ADDRGP4 trap_Cmd_ExecuteText
ASGNP4
line 6497
;6497:	uiInfo.uiDC.Error = &Com_Error; 
ADDRGP4 uiInfo+184
ADDRGP4 Com_Error
ASGNP4
line 6498
;6498:	uiInfo.uiDC.Print = &Com_Printf; 
ADDRGP4 uiInfo+188
ADDRGP4 Com_Printf
ASGNP4
line 6499
;6499:	uiInfo.uiDC.Pause = &UI_Pause;
ADDRGP4 uiInfo+192
ADDRGP4 UI_Pause
ASGNP4
line 6500
;6500:	uiInfo.uiDC.ownerDrawWidth = &UI_OwnerDrawWidth;
ADDRGP4 uiInfo+196
ADDRGP4 UI_OwnerDrawWidth
ASGNP4
line 6501
;6501:	uiInfo.uiDC.registerSound = &trap_S_RegisterSound;
ADDRGP4 uiInfo+200
ADDRGP4 trap_S_RegisterSound
ASGNP4
line 6502
;6502:	uiInfo.uiDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
ADDRGP4 uiInfo+204
ADDRGP4 trap_S_StartBackgroundTrack
ASGNP4
line 6503
;6503:	uiInfo.uiDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
ADDRGP4 uiInfo+208
ADDRGP4 trap_S_StopBackgroundTrack
ASGNP4
line 6504
;6504:	uiInfo.uiDC.playCinematic = &UI_PlayCinematic;
ADDRGP4 uiInfo+212
ADDRGP4 UI_PlayCinematic
ASGNP4
line 6505
;6505:	uiInfo.uiDC.stopCinematic = &UI_StopCinematic;
ADDRGP4 uiInfo+216
ADDRGP4 UI_StopCinematic
ASGNP4
line 6506
;6506:	uiInfo.uiDC.drawCinematic = &UI_DrawCinematic;
ADDRGP4 uiInfo+220
ADDRGP4 UI_DrawCinematic
ASGNP4
line 6507
;6507:	uiInfo.uiDC.runCinematicFrame = &UI_RunCinematicFrame;
ADDRGP4 uiInfo+224
ADDRGP4 UI_RunCinematicFrame
ASGNP4
line 6509
;6508:
;6509:	for (i=0; i<10; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $4517
line 6510
;6510:	{
line 6511
;6511:		if (!trap_SP_Register(va("menus%d",i)))	//, /*SP_REGISTER_REQUIRED|*/SP_REGISTER_MENU))
ADDRGP4 $4523
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_SP_Register
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $4521
line 6512
;6512:			break;
ADDRGP4 $4519
JUMPV
LABELV $4521
line 6513
;6513:	}
LABELV $4518
line 6509
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $4517
LABELV $4519
line 6516
;6514:
;6515:
;6516:	Init_Display(&uiInfo.uiDC);
ADDRGP4 uiInfo
ARGP4
ADDRGP4 Init_Display
CALLV
pop
line 6518
;6517:
;6518:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 6520
;6519:  
;6520:	uiInfo.uiDC.cursor	= trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $4525
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+11808
ADDRLP4 12
INDIRI4
ASGNI4
line 6521
;6521:	uiInfo.uiDC.whiteShader = trap_R_RegisterShaderNoMip( "white" );
ADDRGP4 $4527
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+11800
ADDRLP4 16
INDIRI4
ASGNI4
line 6523
;6522:
;6523:	AssetCache();
ADDRGP4 AssetCache
CALLV
pop
line 6525
;6524:
;6525:	start = trap_Milliseconds();
ADDRLP4 20
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 6527
;6526:
;6527:  uiInfo.teamCount = 0;
ADDRGP4 uiInfo+14156
CNSTI4 0
ASGNI4
line 6528
;6528:  uiInfo.characterCount = 0;
ADDRGP4 uiInfo+11840
CNSTI4 0
ASGNI4
line 6529
;6529:  uiInfo.aliasCount = 0;
ADDRGP4 uiInfo+13384
CNSTI4 0
ASGNI4
line 6537
;6530:
;6531:#ifdef PRE_RELEASE_TADEMO
;6532://	UI_ParseTeamInfo("demoteaminfo.txt");
;6533:	UI_ParseGameInfo("demogameinfo.txt");
;6534:#else
;6535://	UI_ParseTeamInfo("ui/jk2mp/teaminfo.txt");
;6536://	UI_LoadTeams();
;6537:	UI_ParseGameInfo("ui/jk2mp/gameinfo.txt");
ADDRGP4 $673
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 6541
;6538:#endif
;6539:
;6540:
;6541:	menuSet = UI_Cvar_VariableString("ui_menuFilesMP");
ADDRGP4 $669
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 6542
;6542:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4533
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4531
LABELV $4533
line 6543
;6543:		menuSet = "ui/jk2mpmenus.txt";
ADDRLP4 4
ADDRGP4 $636
ASGNP4
line 6544
;6544:	}
LABELV $4531
line 6547
;6545:
;6546:#if 1
;6547:	if (inGameLoad)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $4534
line 6548
;6548:	{
line 6549
;6549:		UI_LoadMenus("ui/jk2mpingame.txt", qtrue);
ADDRGP4 $668
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6550
;6550:	}
ADDRGP4 $4535
JUMPV
LABELV $4534
line 6552
;6551:	else
;6552:	{
line 6553
;6553:		UI_LoadMenus(menuSet, qtrue);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6554
;6554:	}
LABELV $4535
line 6560
;6555:#else //this was adding quite a giant amount of time to the load time
;6556:	UI_LoadMenus(menuSet, qtrue);
;6557:	UI_LoadMenus("ui/jk2mpingame.txt", qtrue);
;6558:#endif
;6559:	
;6560:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6562
;6561:
;6562:	trap_LAN_LoadCachedServers();
ADDRGP4 trap_LAN_LoadCachedServers
CALLV
pop
line 6563
;6563:	UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 6565
;6564:
;6565:	UI_BuildQ3Model_List();
ADDRGP4 UI_BuildQ3Model_List
CALLV
pop
line 6566
;6566:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 6568
;6567:
;6568:	UI_LoadForceConfig_List();
ADDRGP4 UI_LoadForceConfig_List
CALLV
pop
line 6570
;6569:
;6570:	UI_InitForceShaders();
ADDRGP4 UI_InitForceShaders
CALLV
pop
line 6573
;6571:
;6572:	// sets defaults for ui temp cvars
;6573:	uiInfo.effectsColor = /*gamecodetoui[*/(int)trap_Cvar_VariableValue("color1");//-1];
ADDRGP4 $1938
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+95196
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 6574
;6574:	uiInfo.currentCrosshair = (int)trap_Cvar_VariableValue("cg_drawCrosshair");
ADDRGP4 $2225
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+60856
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 6575
;6575:	trap_Cvar_Set("ui_mousePitch", (trap_Cvar_VariableValue("m_pitch") >= 0) ? "0" : "1");
ADDRGP4 $2559
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
LTF4 $4545
ADDRLP4 40
ADDRGP4 $351
ASGNP4
ADDRGP4 $4546
JUMPV
LABELV $4545
ADDRLP4 40
ADDRGP4 $354
ASGNP4
LABELV $4546
ADDRGP4 $2556
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6577
;6576:
;6577:	uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+40740+10432
CNSTI4 -1
ASGNI4
line 6578
;6578:	uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+36380
CNSTI4 -1
ASGNI4
line 6580
;6579:
;6580:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $4550
ARGP4
ADDRGP4 $165
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 6581
;6581:	trap_Cvar_Register(NULL, "ui_hidelang",	"0", CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $4551
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 6583
;6582:
;6583:	trap_Cvar_Set("ui_actualNetGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $717
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6584
;6584:}
LABELV $4439
endproc _UI_Init 52 16
export _UI_KeyEvent
proc _UI_KeyEvent 16 12
line 6592
;6585:
;6586:
;6587:/*
;6588:=================
;6589:UI_KeyEvent
;6590:=================
;6591:*/
;6592:void _UI_KeyEvent( int key, qboolean down ) {
line 6594
;6593:
;6594:  if (Menu_Count() > 0) {
ADDRLP4 0
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $4554
line 6595
;6595:    menuDef_t *menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 6596
;6596:		if (menu) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4556
line 6597
;6597:			if (key == A_ESCAPE && down && !Menus_AnyFullScreenVisible()) {
ADDRFP4 0
INDIRI4
CNSTI4 27
NEI4 $4558
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4558
ADDRLP4 12
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4558
line 6598
;6598:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6599
;6599:			} else {
ADDRGP4 $4557
JUMPV
LABELV $4558
line 6600
;6600:				Menu_HandleKey(menu, key, down );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_HandleKey
CALLV
pop
line 6601
;6601:			}
line 6602
;6602:		} else {
ADDRGP4 $4557
JUMPV
LABELV $4556
line 6603
;6603:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 12
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6604
;6604:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 6605
;6605:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6606
;6606:		}
LABELV $4557
line 6607
;6607:  }
LABELV $4554
line 6612
;6608:
;6609:  //if ((s > 0) && (s != menu_null_sound)) {
;6610:	//  trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
;6611:  //}
;6612:}
LABELV $4553
endproc _UI_KeyEvent 16 12
export _UI_MouseEvent
proc _UI_MouseEvent 12 12
line 6620
;6613:
;6614:/*
;6615:=================
;6616:UI_MouseEvent
;6617:=================
;6618:*/
;6619:void _UI_MouseEvent( int dx, int dy )
;6620:{
line 6622
;6621:	// update mouse screen position
;6622:	uiInfo.uiDC.cursorx += dx;
ADDRLP4 0
ADDRGP4 uiInfo+248
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 6623
;6623:	if (uiInfo.uiDC.cursorx < 0)
ADDRGP4 uiInfo+248
INDIRI4
CNSTI4 0
GEI4 $4562
line 6624
;6624:		uiInfo.uiDC.cursorx = 0;
ADDRGP4 uiInfo+248
CNSTI4 0
ASGNI4
ADDRGP4 $4563
JUMPV
LABELV $4562
line 6625
;6625:	else if (uiInfo.uiDC.cursorx > SCREEN_WIDTH)
ADDRGP4 uiInfo+248
INDIRI4
CNSTI4 640
LEI4 $4566
line 6626
;6626:		uiInfo.uiDC.cursorx = SCREEN_WIDTH;
ADDRGP4 uiInfo+248
CNSTI4 640
ASGNI4
LABELV $4566
LABELV $4563
line 6628
;6627:
;6628:	uiInfo.uiDC.cursory += dy;
ADDRLP4 4
ADDRGP4 uiInfo+252
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 6629
;6629:	if (uiInfo.uiDC.cursory < 0)
ADDRGP4 uiInfo+252
INDIRI4
CNSTI4 0
GEI4 $4571
line 6630
;6630:		uiInfo.uiDC.cursory = 0;
ADDRGP4 uiInfo+252
CNSTI4 0
ASGNI4
ADDRGP4 $4572
JUMPV
LABELV $4571
line 6631
;6631:	else if (uiInfo.uiDC.cursory > SCREEN_HEIGHT)
ADDRGP4 uiInfo+252
INDIRI4
CNSTI4 480
LEI4 $4575
line 6632
;6632:		uiInfo.uiDC.cursory = SCREEN_HEIGHT;
ADDRGP4 uiInfo+252
CNSTI4 480
ASGNI4
LABELV $4575
LABELV $4572
line 6634
;6633:
;6634:  if (Menu_Count() > 0) {
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $4579
line 6637
;6635:    //menuDef_t *menu = Menu_GetFocused();
;6636:    //Menu_HandleMouseMove(menu, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
;6637:		Display_MouseMove(NULL, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
CNSTP4 0
ARGP4
ADDRGP4 uiInfo+248
INDIRI4
ARGI4
ADDRGP4 uiInfo+252
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 6638
;6638:  }
LABELV $4579
line 6640
;6639:
;6640:}
LABELV $4560
endproc _UI_MouseEvent 12 12
export UI_LoadNonIngame
proc UI_LoadNonIngame 12 8
line 6642
;6641:
;6642:void UI_LoadNonIngame() {
line 6643
;6643:	const char *menuSet = UI_Cvar_VariableString("ui_menuFilesMP");
ADDRGP4 $669
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6644
;6644:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4586
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4584
LABELV $4586
line 6645
;6645:		menuSet = "ui/jk2mpmenus.txt";
ADDRLP4 0
ADDRGP4 $636
ASGNP4
line 6646
;6646:	}
LABELV $4584
line 6647
;6647:	UI_LoadMenus(menuSet, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6648
;6648:	uiInfo.inGameLoad = qfalse;
ADDRGP4 uiInfo+95200
CNSTI4 0
ASGNI4
line 6649
;6649:}
LABELV $4583
endproc UI_LoadNonIngame 12 8
export _UI_SetActiveMenu
proc _UI_SetActiveMenu 304 12
line 6651
;6650:
;6651:void _UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 6656
;6652:	char buf[256];
;6653:
;6654:	// this should be the ONLY way the menu system is brought up
;6655:	// enusure minumum menu data is cached
;6656:  if (Menu_Count() > 0) {
ADDRLP4 256
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
LEI4 $4589
line 6658
;6657:		vec3_t v;
;6658:		v[0] = v[1] = v[2] = 0;
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 260+8
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260
ADDRLP4 272
INDIRF4
ASGNF4
line 6659
;6659:	  switch ( menu ) {
ADDRLP4 276
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
LTI4 $4593
ADDRLP4 276
INDIRI4
CNSTI4 6
GTI4 $4593
ADDRLP4 276
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4625
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4625
address $4596
address $4597
address $4621
address $4623
address $4614
address $4616
address $4624
code
LABELV $4596
line 6661
;6660:	  case UIMENU_NONE:
;6661:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 284
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6662
;6662:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 6663
;6663:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6664
;6664:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6666
;6665:
;6666:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4597
line 6668
;6667:	  case UIMENU_MAIN:
;6668:		{
line 6669
;6669:			qboolean active = qfalse;
ADDRLP4 288
CNSTI4 0
ASGNI4
line 6672
;6670:
;6671:			//trap_Cvar_Set( "sv_killserver", "1" );
;6672:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6675
;6673:			//trap_S_StartLocalSound( trap_S_RegisterSound("sound/misc/menu_background.wav", qfalse) , CHAN_LOCAL_SOUND );
;6674:			//trap_S_StartBackgroundTrack("sound/misc/menu_background.wav", NULL);
;6675:			if (uiInfo.inGameLoad) 
ADDRGP4 uiInfo+95200
INDIRI4
CNSTI4 0
EQI4 $4598
line 6676
;6676:			{
line 6678
;6677://				UI_LoadNonIngame();
;6678:			}
LABELV $4598
line 6680
;6679:			
;6680:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6681
;6681:			Menus_ActivateByName("main");
ADDRGP4 $2756
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6682
;6682:			trap_Cvar_VariableStringBuffer("com_errorMessage", buf, sizeof(buf));
ADDRGP4 $2678
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 6684
;6683:			
;6684:			if (strlen(buf)) 
ADDRLP4 0
ARGP4
ADDRLP4 292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $4601
line 6685
;6685:			{
line 6686
;6686:				if (!ui_singlePlayerActive.integer) 
ADDRGP4 ui_singlePlayerActive+12
INDIRI4
CNSTI4 0
NEI4 $4603
line 6687
;6687:				{
line 6688
;6688:					Menus_ActivateByName("error_popmenu");
ADDRGP4 $4606
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6689
;6689:					active = qtrue;
ADDRLP4 288
CNSTI4 1
ASGNI4
line 6690
;6690:				} 
ADDRGP4 $4604
JUMPV
LABELV $4603
line 6692
;6691:				else 
;6692:				{
line 6693
;6693:					trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2678
ARGP4
ADDRGP4 $165
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6694
;6694:				}
LABELV $4604
line 6695
;6695:			}
LABELV $4601
line 6697
;6696:
;6697:			if ( !active && (int)trap_Cvar_VariableValue ( "com_othertasks" ) )
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $4588
ADDRGP4 $4609
ARGP4
ADDRLP4 296
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 296
INDIRF4
CVFI4 4
CNSTI4 0
EQI4 $4588
line 6698
;6698:			{
line 6699
;6699:				trap_Cvar_Set("com_othertasks", "0");
ADDRGP4 $4609
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6700
;6700:				if ( !(int)trap_Cvar_VariableValue ( "com_ignoreothertasks" ) )
ADDRGP4 $4612
ARGP4
ADDRLP4 300
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 300
INDIRF4
CVFI4 4
CNSTI4 0
NEI4 $4588
line 6701
;6701:				{
line 6702
;6702:					Menus_ActivateByName("backgroundtask_popmenu");
ADDRGP4 $4613
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6703
;6703:					active = qtrue;
ADDRLP4 288
CNSTI4 1
ASGNI4
line 6704
;6704:				}
line 6705
;6705:			}
line 6707
;6706:
;6707:			return;
ADDRGP4 $4588
JUMPV
LABELV $4614
line 6711
;6708:		}
;6709:
;6710:	  case UIMENU_TEAM:
;6711:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6712
;6712:      Menus_ActivateByName("team");
ADDRGP4 $4615
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6713
;6713:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4616
line 6716
;6714:	  case UIMENU_POSTGAME:
;6715:			//trap_Cvar_Set( "sv_killserver", "1" );
;6716:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6717
;6717:			if (uiInfo.inGameLoad) {
ADDRGP4 uiInfo+95200
INDIRI4
CNSTI4 0
EQI4 $4617
line 6719
;6718://				UI_LoadNonIngame();
;6719:			}
LABELV $4617
line 6720
;6720:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6721
;6721:			Menus_ActivateByName("endofgame");
ADDRGP4 $4620
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6723
;6722:		  //UI_ConfirmMenu( "Bad CD Key", NULL, NeedCDKeyAction );
;6723:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4621
line 6725
;6724:	  case UIMENU_INGAME:
;6725:		  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6726
;6726:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6727
;6727:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 6728
;6728:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6729
;6729:			Menus_ActivateByName("ingame");
ADDRGP4 $4622
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6730
;6730:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4623
line 6733
;6731:	  case UIMENU_PLAYERCONFIG:
;6732:		 // trap_Cvar_Set( "cl_paused", "1" );
;6733:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6734
;6734:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 6735
;6735:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6736
;6736:			Menus_ActivateByName("ingame_player");
ADDRGP4 $1068
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6737
;6737:			UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 6738
;6738:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4624
line 6741
;6739:	  case UIMENU_PLAYERFORCE:
;6740:		 // trap_Cvar_Set( "cl_paused", "1" );
;6741:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6742
;6742:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 6743
;6743:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6744
;6744:			Menus_ActivateByName("ingame_playerforce");
ADDRGP4 $874
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6745
;6745:			UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 6746
;6746:		  return;
LABELV $4593
line 6748
;6747:	  }
;6748:  }
LABELV $4589
line 6749
;6749:}
LABELV $4588
endproc _UI_SetActiveMenu 304 12
export _UI_IsFullscreen
proc _UI_IsFullscreen 4 0
line 6751
;6750:
;6751:qboolean _UI_IsFullscreen( void ) {
line 6752
;6752:	return Menus_AnyFullScreenVisible();
ADDRLP4 0
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4626
endproc _UI_IsFullscreen 4 0
proc UI_ReadableSize 16 16
line 6761
;6753:}
;6754:
;6755:
;6756:
;6757:static connstate_t	lastConnState;
;6758:static char			lastLoadingText[MAX_INFO_VALUE];
;6759:
;6760:static void UI_ReadableSize ( char *buf, int bufsize, int value )
;6761:{
line 6762
;6762:	if (value > 1024*1024*1024 ) { // gigs
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
LEI4 $4628
line 6763
;6763:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $702
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6764
;6764:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d GB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4630
ARGP4
ADDRLP4 12
CNSTI4 1073741824
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6766
;6765:			(value % (1024*1024*1024))*100 / (1024*1024*1024) );
;6766:	} else if (value > 1024*1024 ) { // megs
ADDRGP4 $4629
JUMPV
LABELV $4628
ADDRFP4 8
INDIRI4
CNSTI4 1048576
LEI4 $4631
line 6767
;6767:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $702
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6768
;6768:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d MB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4633
ARGP4
ADDRLP4 12
CNSTI4 1048576
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6770
;6769:			(value % (1024*1024))*100 / (1024*1024) );
;6770:	} else if (value > 1024 ) { // kilos
ADDRGP4 $4632
JUMPV
LABELV $4631
ADDRFP4 8
INDIRI4
CNSTI4 1024
LEI4 $4634
line 6771
;6771:		Com_sprintf( buf, bufsize, "%d KB", value / 1024 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4636
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1024
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6772
;6772:	} else { // bytes
ADDRGP4 $4635
JUMPV
LABELV $4634
line 6773
;6773:		Com_sprintf( buf, bufsize, "%d bytes", value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4637
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6774
;6774:	}
LABELV $4635
LABELV $4632
LABELV $4629
line 6775
;6775:}
LABELV $4627
endproc UI_ReadableSize 16 16
proc UI_PrintTime 8 20
line 6778
;6776:
;6777:// Assumes time is in msec
;6778:static void UI_PrintTime ( char *buf, int bufsize, int time ) {
line 6779
;6779:	time /= 1000;  // change to seconds
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 6781
;6780:
;6781:	if (time > 3600) { // in the hours range
ADDRFP4 8
INDIRI4
CNSTI4 3600
LEI4 $4639
line 6782
;6782:		Com_sprintf( buf, bufsize, "%d hr %2d min", time / 3600, (time % 3600) / 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4641
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 3600
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 60
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6783
;6783:	} else if (time > 60) { // mins
ADDRGP4 $4640
JUMPV
LABELV $4639
ADDRFP4 8
INDIRI4
CNSTI4 60
LEI4 $4642
line 6784
;6784:		Com_sprintf( buf, bufsize, "%2d min %2d sec", time / 60, time % 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4644
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6785
;6785:	} else  { // secs
ADDRGP4 $4643
JUMPV
LABELV $4642
line 6786
;6786:		Com_sprintf( buf, bufsize, "%2d sec", time );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4645
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6787
;6787:	}
LABELV $4643
LABELV $4640
line 6788
;6788:}
LABELV $4638
endproc UI_PrintTime 8 20
export Text_PaintCenter
proc Text_PaintCenter 8 36
line 6790
;6789:
;6790:void Text_PaintCenter(float x, float y, float scale, vec4_t color, const char *text, float adjust, int iMenuFont) {
line 6791
;6791:	int len = Text_Width(text, scale, iMenuFont);
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 6792
;6792:	Text_Paint(x - len / 2, y, scale, color, text, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE, iMenuFont);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 6793
;6793:}
LABELV $4646
endproc Text_PaintCenter 8 36
lit
align 4
LABELV $4648
byte 4 0
byte 4 0
byte 4 0
byte 4 1056964608
code
proc UI_DisplayDownloadInfo 1444 28
line 6796
;6794:
;6795:
;6796:static void UI_DisplayDownloadInfo( const char *downloadName, float centerPoint, float yStart, float scale, int iMenuFont) {
line 6810
;6797:	char sDownLoading[256];
;6798:	char sEstimatedTimeLeft[256];
;6799:	char sTransferRate[256];
;6800:	char sOf[20];
;6801:	char sCopied[256];
;6802:	char sSec[20];
;6803:	//
;6804:	int downloadSize, downloadCount, downloadTime;
;6805:	char dlSizeBuf[64], totalSizeBuf[64], xferRateBuf[64], dlTimeBuf[64];
;6806:	int xferRate;
;6807:	int leftWidth;
;6808:	const char *s;
;6809:
;6810:	vec4_t colorLtGreyAlpha = {0, 0, 0, .5};
ADDRLP4 1176
ADDRGP4 $4648
INDIRB
ASGNB 16
line 6812
;6811:
;6812:	UI_FillRect( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, colorLtGreyAlpha );
ADDRLP4 1360
CNSTF4 0
ASGNF4
ADDRLP4 1360
INDIRF4
ARGF4
ADDRLP4 1360
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 1176
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 6814
;6813:
;6814:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 0);	// "Downloading:"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1364
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1364
INDIRP4
ASGNP4
line 6815
;6815:	strcpy(sDownLoading,s?s:"");
ADDRLP4 152
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4651
ADDRLP4 1368
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4652
JUMPV
LABELV $4651
ADDRLP4 1368
ADDRGP4 $165
ASGNP4
LABELV $4652
ADDRLP4 1368
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6816
;6816:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 1);	// "Estimated time left:"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1372
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1372
INDIRP4
ASGNP4
line 6817
;6817:	strcpy(sEstimatedTimeLeft,s?s:"");
ADDRLP4 408
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4654
ADDRLP4 1376
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4655
JUMPV
LABELV $4654
ADDRLP4 1376
ADDRGP4 $165
ASGNP4
LABELV $4655
ADDRLP4 1376
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6818
;6818:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 2);	// "Transfer rate:"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1380
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1380
INDIRP4
ASGNP4
line 6819
;6819:	strcpy(sTransferRate,s?s:"");
ADDRLP4 664
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4657
ADDRLP4 1384
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4658
JUMPV
LABELV $4657
ADDRLP4 1384
ADDRGP4 $165
ASGNP4
LABELV $4658
ADDRLP4 1384
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6820
;6820:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 3);	// "of"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1388
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1388
INDIRP4
ASGNP4
line 6821
;6821:	strcpy(sOf,s?s:"");
ADDRLP4 1192
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4660
ADDRLP4 1392
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4661
JUMPV
LABELV $4660
ADDRLP4 1392
ADDRGP4 $165
ASGNP4
LABELV $4661
ADDRLP4 1392
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6822
;6822:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 4);	// "copied"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1396
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1396
INDIRP4
ASGNP4
line 6823
;6823:	strcpy(sCopied,s?s:"");
ADDRLP4 920
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4663
ADDRLP4 1400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4664
JUMPV
LABELV $4663
ADDRLP4 1400
ADDRGP4 $165
ASGNP4
LABELV $4664
ADDRLP4 1400
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6824
;6824:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 5);	// "sec."
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 1404
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1404
INDIRP4
ASGNP4
line 6825
;6825:	strcpy(sSec,s?s:"");
ADDRLP4 1212
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4666
ADDRLP4 1408
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4667
JUMPV
LABELV $4666
ADDRLP4 1408
ADDRGP4 $165
ASGNP4
LABELV $4667
ADDRLP4 1408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6827
;6826:
;6827:	downloadSize = trap_Cvar_VariableValue( "cl_downloadSize" );
ADDRGP4 $4668
ARGP4
ADDRLP4 1412
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 1412
INDIRF4
CVFI4 4
ASGNI4
line 6828
;6828:	downloadCount = trap_Cvar_VariableValue( "cl_downloadCount" );
ADDRGP4 $4669
ARGP4
ADDRLP4 1416
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 1416
INDIRF4
CVFI4 4
ASGNI4
line 6829
;6829:	downloadTime = trap_Cvar_VariableValue( "cl_downloadTime" );
ADDRGP4 $4670
ARGP4
ADDRLP4 1420
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 1420
INDIRF4
CVFI4 4
ASGNI4
line 6831
;6830:
;6831:	leftWidth = 320;
ADDRLP4 12
CNSTI4 320
ASGNI4
line 6833
;6832:
;6833:	UI_SetColor(colorWhite);
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 6835
;6834:
;6835:	Text_PaintCenter(centerPoint, yStart + 112, scale, colorWhite, sDownLoading, 0, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1121976320
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 152
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6836
;6836:	Text_PaintCenter(centerPoint, yStart + 192, scale, colorWhite, sEstimatedTimeLeft, 0, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1128267776
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 408
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6837
;6837:	Text_PaintCenter(centerPoint, yStart + 248, scale, colorWhite, sTransferRate, 0, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1131937792
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 664
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6839
;6838:
;6839:	if (downloadSize > 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $4671
line 6840
;6840:		s = va( "%s (%d%%)", downloadName, downloadCount * 100 / downloadSize );
ADDRGP4 $4673
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 1424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1424
INDIRP4
ASGNP4
line 6841
;6841:	} else {
ADDRGP4 $4672
JUMPV
LABELV $4671
line 6842
;6842:		s = downloadName;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 6843
;6843:	}
LABELV $4672
line 6845
;6844:
;6845:	Text_PaintCenter(centerPoint, yStart+136, scale, colorWhite, s, 0, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1124597760
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6847
;6846:
;6847:	UI_ReadableSize( dlSizeBuf,		sizeof dlSizeBuf,		downloadCount );
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 6848
;6848:	UI_ReadableSize( totalSizeBuf,	sizeof totalSizeBuf,	downloadSize );
ADDRLP4 80
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 6850
;6849:
;6850:	if (downloadCount < 4096 || !downloadTime) {
ADDRLP4 8
INDIRI4
CNSTI4 4096
LTI4 $4676
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $4674
LABELV $4676
line 6851
;6851:		Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, "estimating", 0, iMenuFont);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4677
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6852
;6852:		Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s %s %s %s)", dlSizeBuf, sOf, totalSizeBuf, sCopied), 0, iMenuFont);
ADDRGP4 $4678
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1192
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 920
ARGP4
ADDRLP4 1424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1424
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6853
;6853:	} else {
ADDRGP4 $4675
JUMPV
LABELV $4674
line 6854
;6854:		if ((uiInfo.uiDC.realTime - downloadTime) / 1000) {
ADDRGP4 uiInfo+240
INDIRI4
ADDRLP4 144
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 0
EQI4 $4679
line 6855
;6855:			xferRate = downloadCount / ((uiInfo.uiDC.realTime - downloadTime) / 1000);
ADDRLP4 148
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
ADDRLP4 144
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
DIVI4
ASGNI4
line 6856
;6856:		} else {
ADDRGP4 $4680
JUMPV
LABELV $4679
line 6857
;6857:			xferRate = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 6858
;6858:		}
LABELV $4680
line 6859
;6859:		UI_ReadableSize( xferRateBuf, sizeof xferRateBuf, xferRate );
ADDRLP4 1232
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 6862
;6860:
;6861:		// Extrapolate estimated completion time
;6862:		if (downloadSize && xferRate) {
ADDRLP4 1424
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1424
INDIRI4
EQI4 $4683
ADDRLP4 148
INDIRI4
ADDRLP4 1424
INDIRI4
EQI4 $4683
line 6863
;6863:			int n = downloadSize / xferRate; // estimated time for entire d/l in secs
ADDRLP4 1428
ADDRLP4 4
INDIRI4
ADDRLP4 148
INDIRI4
DIVI4
ASGNI4
line 6866
;6864:
;6865:			// We do it in K (/1024) because we'd overflow around 4MB
;6866:			UI_PrintTime ( dlTimeBuf, sizeof dlTimeBuf, 
ADDRLP4 1296
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 1432
ADDRLP4 1428
INDIRI4
ASGNI4
ADDRLP4 1436
CNSTI4 1024
ASGNI4
CNSTI4 1000
ADDRLP4 1432
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 1436
INDIRI4
DIVI4
ADDRLP4 1432
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
ADDRLP4 1436
INDIRI4
DIVI4
DIVI4
SUBI4
MULI4
ARGI4
ADDRGP4 UI_PrintTime
CALLV
pop
line 6869
;6867:				(n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000);
;6868:
;6869:			Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, dlTimeBuf, 0, iMenuFont);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1296
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6870
;6870:			Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s %s %s %s)", dlSizeBuf, sOf, totalSizeBuf, sCopied), 0, iMenuFont);
ADDRGP4 $4678
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1192
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 920
ARGP4
ADDRLP4 1440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1440
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6871
;6871:		} else {
ADDRGP4 $4684
JUMPV
LABELV $4683
line 6872
;6872:			Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, "estimating", 0, iMenuFont);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4677
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6873
;6873:			if (downloadSize) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $4685
line 6874
;6874:				Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s %s %s %s)", dlSizeBuf, sOf, totalSizeBuf, sCopied), 0, iMenuFont);
ADDRGP4 $4678
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1192
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 920
ARGP4
ADDRLP4 1428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1428
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6875
;6875:			} else {
ADDRGP4 $4686
JUMPV
LABELV $4685
line 6876
;6876:				Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s %s)", dlSizeBuf, sCopied), 0, iMenuFont);
ADDRGP4 $4687
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 920
ARGP4
ADDRLP4 1428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1428
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6877
;6877:			}
LABELV $4686
line 6878
;6878:		}
LABELV $4684
line 6880
;6879:
;6880:		if (xferRate) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $4688
line 6881
;6881:			Text_PaintCenter(leftWidth, yStart+272, scale, colorWhite, va("%s/%s", xferRateBuf,sSec), 0, iMenuFont);
ADDRGP4 $4690
ARGP4
ADDRLP4 1232
ARGP4
ADDRLP4 1212
ARGP4
ADDRLP4 1428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1132986368
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1428
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6882
;6882:		}
LABELV $4688
line 6883
;6883:	}
LABELV $4675
line 6884
;6884:}
LABELV $4647
endproc UI_DisplayDownloadInfo 1444 28
export UI_DrawConnectScreen
proc UI_DrawConnectScreen 5688 28
line 6894
;6885:
;6886:/*
;6887:========================
;6888:UI_DrawConnectScreen
;6889:
;6890:This will also be overlaid on the cgame info screen during loading
;6891:to prevent it from blinking away too rapidly on local or lan games.
;6892:========================
;6893:*/
;6894:void UI_DrawConnectScreen( qboolean overlay ) {
line 6903
;6895:	const char *s;
;6896:	uiClientState_t	cstate;
;6897:	char			info[MAX_INFO_VALUE];
;6898:	char text[256];
;6899:	float centerPoint, yStart, scale;
;6900:
;6901:	char sStripEdTemp[256];
;6902:
;6903:	menuDef_t *menu = Menus_FindByName("Connect");
ADDRGP4 $4692
ARGP4
ADDRLP4 4640
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 4376
ADDRLP4 4640
INDIRP4
ASGNP4
line 6906
;6904:
;6905:
;6906:	if ( !overlay && menu ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4693
ADDRLP4 4376
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4693
line 6907
;6907:		Menu_Paint(menu, qtrue);
ADDRLP4 4376
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 6908
;6908:	}
LABELV $4693
line 6910
;6909:
;6910:	if (!overlay) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4695
line 6911
;6911:		centerPoint = 320;
ADDRLP4 3340
CNSTF4 1134559232
ASGNF4
line 6912
;6912:		yStart = 130;
ADDRLP4 3348
CNSTF4 1124204544
ASGNF4
line 6913
;6913:		scale = 1.0f;	// -ste
ADDRLP4 3344
CNSTF4 1065353216
ASGNF4
line 6914
;6914:	} else {
ADDRGP4 $4696
JUMPV
LABELV $4695
line 6915
;6915:		centerPoint = 320;
ADDRLP4 3340
CNSTF4 1134559232
ASGNF4
line 6916
;6916:		yStart = 32;
ADDRLP4 3348
CNSTF4 1107296256
ASGNF4
line 6917
;6917:		scale = 1.0f;	// -ste
ADDRLP4 3344
CNSTF4 1065353216
ASGNF4
line 6918
;6918:		return;
ADDRGP4 $4691
JUMPV
LABELV $4696
line 6922
;6919:	}
;6920:
;6921:	// see what information we should display
;6922:	trap_GetClientState( &cstate );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 6925
;6923:
;6924:
;6925:	info[0] = '\0';
ADDRLP4 3352
CNSTI1 0
ASGNI1
line 6926
;6926:	if( trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) ) ) {
CNSTI4 0
ARGI4
ADDRLP4 3352
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4644
ADDRGP4 trap_GetConfigString
CALLI4
ASGNI4
ADDRLP4 4644
INDIRI4
CNSTI4 0
EQI4 $4697
line 6927
;6927:		trap_SP_GetStringTextString("MENUS3_LOADING_MAPNAME", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4699
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6928
;6928:		Text_PaintCenter(centerPoint, yStart, scale, colorWhite, va( /*"Loading %s"*/sStripEdTemp, Info_ValueForKey( info, "mapname" )), 0, FONT_MEDIUM);
ADDRLP4 3352
ARGP4
ADDRGP4 $3386
ARGP4
ADDRLP4 4648
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3084
ARGP4
ADDRLP4 4648
INDIRP4
ARGP4
ADDRLP4 4652
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4652
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6929
;6929:	}
LABELV $4697
line 6931
;6930:
;6931:	if (!Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $4703
ARGP4
ADDRLP4 4648
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4648
INDIRI4
CNSTI4 0
NEI4 $4700
line 6932
;6932:		trap_SP_GetStringTextString("MENUS3_STARTING_UP", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4704
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6933
;6933:		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite, sStripEdTemp, ITEM_TEXTSTYLE_SHADOWEDMORE, FONT_MEDIUM);
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 3084
ARGP4
CNSTF4 1086324736
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6934
;6934:	} else {
ADDRGP4 $4701
JUMPV
LABELV $4700
line 6935
;6935:		trap_SP_GetStringTextString("MENUS3_CONNECTING_TO", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4705
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6936
;6936:		strcpy(text, va(/*"Connecting to %s"*/sStripEdTemp, cstate.servername));
ADDRLP4 3084
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 4652
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ARGP4
ADDRLP4 4652
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6937
;6937:		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite,text , ITEM_TEXTSTYLE_SHADOWEDMORE, FONT_MEDIUM);
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4380
ARGP4
CNSTF4 1086324736
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6938
;6938:	}
LABELV $4701
line 6943
;6939:
;6940:	//UI_DrawProportionalString( 320, 96, "Press Esc to abort", UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
;6941:
;6942:	// display global MOTD at bottom
;6943:	Text_PaintCenter(centerPoint, 425, scale, colorWhite, Info_ValueForKey( cstate.updateInfoString, "motd" ), 0, FONT_MEDIUM);
ADDRLP4 0+1036
ARGP4
ADDRGP4 $4708
ARGP4
ADDRLP4 4652
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3340
INDIRF4
ARGF4
CNSTF4 1137999872
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4652
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6945
;6944:	// print any server info (server full, bad version, etc)
;6945:	if ( cstate.connState < CA_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $4709
line 6946
;6946:		Text_PaintCenter(centerPoint, yStart + 176, scale, colorWhite, cstate.messageString, 0, FONT_MEDIUM);
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
CNSTF4 1127219200
ADDF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0+2060
ARGP4
CNSTF4 0
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6947
;6947:	}
LABELV $4709
line 6949
;6948:
;6949:	if ( lastConnState > cstate.connState ) {
ADDRGP4 lastConnState
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $4712
line 6950
;6950:		lastLoadingText[0] = '\0';
ADDRGP4 lastLoadingText
CNSTI1 0
ASGNI1
line 6951
;6951:	}
LABELV $4712
line 6952
;6952:	lastConnState = cstate.connState;
ADDRGP4 lastConnState
ADDRLP4 0
INDIRI4
ASGNI4
line 6954
;6953:
;6954:	switch ( cstate.connState ) {
ADDRLP4 4656
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4656
INDIRI4
CNSTI4 3
LTI4 $4691
ADDRLP4 4656
INDIRI4
CNSTI4 7
GTI4 $4691
ADDRLP4 4656
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4730-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4730
address $4717
address $4720
address $4723
address $4691
address $4691
code
LABELV $4717
line 6956
;6955:	case CA_CONNECTING:
;6956:		{
line 6957
;6957:			trap_SP_GetStringTextString("MENUS3_AWAITING_CONNECTION", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4718
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6958
;6958:			s = va(/*"Awaiting connection...%i"*/sStripEdTemp, cstate.connectPacketCount);
ADDRLP4 3084
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4664
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4636
ADDRLP4 4664
INDIRP4
ASGNP4
line 6959
;6959:		}
line 6960
;6960:		break;
ADDRGP4 $4715
JUMPV
LABELV $4720
line 6962
;6961:	case CA_CHALLENGING:
;6962:		{
line 6963
;6963:			trap_SP_GetStringTextString("MENUS3_AWAITING_CHALLENGE", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4721
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6964
;6964:			s = va(/*"Awaiting challenge...%i"*/sStripEdTemp, cstate.connectPacketCount);
ADDRLP4 3084
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4664
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4636
ADDRLP4 4664
INDIRP4
ASGNP4
line 6965
;6965:		}
line 6966
;6966:		break;
ADDRGP4 $4715
JUMPV
LABELV $4723
line 6967
;6967:	case CA_CONNECTED: {
line 6970
;6968:		char downloadName[MAX_INFO_VALUE];
;6969:
;6970:			trap_Cvar_VariableStringBuffer( "cl_downloadName", downloadName, sizeof(downloadName) );
ADDRGP4 $4724
ARGP4
ADDRLP4 4664
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 6971
;6971:			if (*downloadName) {
ADDRLP4 4664
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4725
line 6972
;6972:				UI_DisplayDownloadInfo( downloadName, centerPoint, yStart, scale, FONT_MEDIUM );
ADDRLP4 4664
ARGP4
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 UI_DisplayDownloadInfo
CALLV
pop
line 6973
;6973:				return;
ADDRGP4 $4691
JUMPV
LABELV $4725
line 6975
;6974:			}
;6975:		}
line 6976
;6976:		trap_SP_GetStringTextString("MENUS3_AWAITING_GAMESTATE", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4727
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6977
;6977:		s = /*"Awaiting gamestate..."*/sStripEdTemp;
ADDRLP4 4636
ADDRLP4 3084
ASGNP4
line 6978
;6978:		break;
line 6980
;6979:	case CA_LOADING:
;6980:		return;
line 6982
;6981:	case CA_PRIMED:
;6982:		return;
line 6984
;6983:	default:
;6984:		return;
LABELV $4715
line 6987
;6985:	}
;6986:
;6987:	if (Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $4703
ARGP4
ADDRLP4 4664
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4664
INDIRI4
CNSTI4 0
EQI4 $4732
line 6988
;6988:		Text_PaintCenter(centerPoint, yStart + 80, scale, colorWhite, s, 0, FONT_MEDIUM);
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
CNSTF4 1117782016
ADDF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4636
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6989
;6989:	}
LABELV $4732
line 6992
;6990:
;6991:	// password required / connection rejected information goes here
;6992:}
LABELV $4691
endproc UI_DrawConnectScreen 5688 28
data
align 4
LABELV cvarTable
address ui_ffa_fraglimit
address $4736
address $690
byte 4 1
address ui_ffa_timelimit
address $4737
address $351
byte 4 1
address ui_tourney_fraglimit
address $4738
address $351
byte 4 1
address ui_tourney_timelimit
address $4739
address $691
byte 4 1
address ui_selectedModelIndex
address $3985
address $4740
byte 4 1
address ui_team_fraglimit
address $4741
address $351
byte 4 1
address ui_team_timelimit
address $4742
address $690
byte 4 1
address ui_team_friendly
address $4743
address $354
byte 4 1
address ui_ctf_capturelimit
address $4744
address $4745
byte 4 1
address ui_ctf_timelimit
address $4746
address $688
byte 4 1
address ui_ctf_friendly
address $4747
address $351
byte 4 1
address ui_arenasFile
address $4748
address $165
byte 4 80
address ui_botsFile
address $4749
address $165
byte 4 80
address ui_spScores1
address $4750
address $165
byte 4 65
address ui_spScores2
address $4751
address $165
byte 4 65
address ui_spScores3
address $4752
address $165
byte 4 65
address ui_spScores4
address $4753
address $165
byte 4 65
address ui_spScores5
address $4754
address $165
byte 4 65
address ui_spAwards
address $4755
address $165
byte 4 65
address ui_spVideos
address $4756
address $165
byte 4 65
address ui_spSkill
address $826
address $2511
byte 4 1
address ui_spSelection
address $4757
address $165
byte 4 64
address ui_browserMaster
address $4758
address $351
byte 4 1
address ui_browserGameType
address $4759
address $351
byte 4 1
address ui_browserSortKey
address $4760
address $2604
byte 4 1
address ui_browserShowFull
address $4761
address $354
byte 4 1
address ui_browserShowEmpty
address $4762
address $354
byte 4 1
address ui_drawCrosshair
address $2225
address $354
byte 4 1
address ui_drawCrosshairNames
address $4763
address $354
byte 4 1
address ui_marks
address $4764
address $354
byte 4 1
address ui_server1
address $4765
address $165
byte 4 1
address ui_server2
address $4766
address $165
byte 4 1
address ui_server3
address $4767
address $165
byte 4 1
address ui_server4
address $4768
address $165
byte 4 1
address ui_server5
address $4769
address $165
byte 4 1
address ui_server6
address $4770
address $165
byte 4 1
address ui_server7
address $4771
address $165
byte 4 1
address ui_server8
address $4772
address $165
byte 4 1
address ui_server9
address $4773
address $165
byte 4 1
address ui_server10
address $4774
address $165
byte 4 1
address ui_server11
address $4775
address $165
byte 4 1
address ui_server12
address $4776
address $165
byte 4 1
address ui_server13
address $4777
address $165
byte 4 1
address ui_server14
address $4778
address $165
byte 4 1
address ui_server15
address $4779
address $165
byte 4 1
address ui_server16
address $4780
address $165
byte 4 1
address ui_cdkeychecked
address $4781
address $351
byte 4 64
address ui_debug
address $4782
address $351
byte 4 256
address ui_initialized
address $4783
address $351
byte 4 256
address ui_teamName
address $697
address $4784
byte 4 1
address ui_opponentName
address $1226
address $4785
byte 4 1
address ui_rankChange
address $410
address $351
byte 4 1
address ui_freeSaber
address $4786
address $351
byte 4 1
address ui_forcePowerDisable
address $4787
address $351
byte 4 1
address ui_redteam
address $4788
address $4784
byte 4 1
address ui_blueteam
address $4789
address $4785
byte 4 1
address ui_dedicated
address $4790
address $351
byte 4 1
address ui_gameType
address $4791
address $351
byte 4 1
address ui_joinGameType
address $4792
address $351
byte 4 1
address ui_netGameType
address $4793
address $351
byte 4 1
address ui_actualNetGameType
address $4794
address $4795
byte 4 1
address ui_redteam1
address $4796
address $354
byte 4 1
address ui_redteam2
address $4797
address $354
byte 4 1
address ui_redteam3
address $4798
address $354
byte 4 1
address ui_redteam4
address $4799
address $354
byte 4 1
address ui_redteam5
address $4800
address $354
byte 4 1
address ui_redteam6
address $4801
address $354
byte 4 1
address ui_redteam7
address $4802
address $354
byte 4 1
address ui_redteam8
address $4803
address $354
byte 4 1
address ui_blueteam1
address $4804
address $354
byte 4 1
address ui_blueteam2
address $4805
address $354
byte 4 1
address ui_blueteam3
address $4806
address $354
byte 4 1
address ui_blueteam4
address $4807
address $354
byte 4 1
address ui_blueteam5
address $4808
address $354
byte 4 1
address ui_blueteam6
address $4809
address $354
byte 4 1
address ui_blueteam7
address $4810
address $354
byte 4 1
address ui_blueteam8
address $4811
address $354
byte 4 1
address ui_netSource
address $2140
address $351
byte 4 1
address ui_menuFiles
address $669
address $636
byte 4 1
address ui_currentTier
address $1158
address $351
byte 4 1
address ui_currentMap
address $983
address $351
byte 4 1
address ui_currentNetMap
address $981
address $351
byte 4 1
address ui_mapIndex
address $2374
address $351
byte 4 1
address ui_currentOpponent
address $4812
address $351
byte 4 1
address ui_selectedPlayer
address $1545
address $351
byte 4 1
address ui_selectedPlayerName
address $1553
address $165
byte 4 1
address ui_lastServerRefresh_0
address $4813
address $165
byte 4 1
address ui_lastServerRefresh_1
address $4814
address $165
byte 4 1
address ui_lastServerRefresh_2
address $4815
address $165
byte 4 1
address ui_lastServerRefresh_3
address $4816
address $165
byte 4 1
address ui_singlePlayerActive
address $2387
address $351
byte 4 0
address ui_scoreAccuracy
address $4817
address $351
byte 4 1
address ui_scoreImpressives
address $4818
address $351
byte 4 1
address ui_scoreExcellents
address $4819
address $351
byte 4 1
address ui_scoreCaptures
address $4820
address $351
byte 4 1
address ui_scoreDefends
address $4821
address $351
byte 4 1
address ui_scoreAssists
address $4822
address $351
byte 4 1
address ui_scoreGauntlets
address $4823
address $351
byte 4 1
address ui_scoreScore
address $4824
address $351
byte 4 1
address ui_scorePerfect
address $4825
address $351
byte 4 1
address ui_scoreTeam
address $4826
address $4827
byte 4 1
address ui_scoreBase
address $4828
address $351
byte 4 1
address ui_scoreTime
address $4829
address $4830
byte 4 1
address ui_scoreTimeBonus
address $4831
address $351
byte 4 1
address ui_scoreSkillBonus
address $4832
address $351
byte 4 1
address ui_scoreShutoutBonus
address $4833
address $351
byte 4 1
address ui_fragLimit
address $703
address $692
byte 4 0
address ui_captureLimit
address $701
address $693
byte 4 0
address ui_smallFont
address $4834
address $4835
byte 4 1
address ui_bigFont
address $4836
address $4837
byte 4 1
address ui_findPlayer
address $3474
address $1224
byte 4 1
address ui_Q3Model
address $4838
address $351
byte 4 1
address ui_recordSPDemo
address $2407
address $351
byte 4 1
address ui_realWarmUp
address $2399
address $690
byte 4 1
address ui_realCaptureLimit
address $704
address $4745
byte 4 1029
address ui_serverStatusTimeOut
address $4839
address $4840
byte 4 1
address s_language
address $4841
address $4842
byte 4 1025
align 4
LABELV cvarTableSize
byte 4 117
export UI_RegisterCvars
code
proc UI_RegisterCvars 12 16
line 7273
;6993:
;6994:
;6995:/*
;6996:================
;6997:cvars
;6998:================
;6999:*/
;7000:
;7001:typedef struct {
;7002:	vmCvar_t	*vmCvar;
;7003:	char		*cvarName;
;7004:	char		*defaultString;
;7005:	int			cvarFlags;
;7006:} cvarTable_t;
;7007:
;7008:vmCvar_t	ui_ffa_fraglimit;
;7009:vmCvar_t	ui_ffa_timelimit;
;7010:
;7011:vmCvar_t	ui_tourney_fraglimit;
;7012:vmCvar_t	ui_tourney_timelimit;
;7013:
;7014:vmCvar_t	ui_selectedModelIndex;
;7015:
;7016:vmCvar_t	ui_team_fraglimit;
;7017:vmCvar_t	ui_team_timelimit;
;7018:vmCvar_t	ui_team_friendly;
;7019:
;7020:vmCvar_t	ui_ctf_capturelimit;
;7021:vmCvar_t	ui_ctf_timelimit;
;7022:vmCvar_t	ui_ctf_friendly;
;7023:
;7024:vmCvar_t	ui_arenasFile;
;7025:vmCvar_t	ui_botsFile;
;7026:vmCvar_t	ui_spScores1;
;7027:vmCvar_t	ui_spScores2;
;7028:vmCvar_t	ui_spScores3;
;7029:vmCvar_t	ui_spScores4;
;7030:vmCvar_t	ui_spScores5;
;7031:vmCvar_t	ui_spAwards;
;7032:vmCvar_t	ui_spVideos;
;7033:vmCvar_t	ui_spSkill;
;7034:
;7035:vmCvar_t	ui_spSelection;
;7036:
;7037:vmCvar_t	ui_browserMaster;
;7038:vmCvar_t	ui_browserGameType;
;7039:vmCvar_t	ui_browserSortKey;
;7040:vmCvar_t	ui_browserShowFull;
;7041:vmCvar_t	ui_browserShowEmpty;
;7042:
;7043:vmCvar_t	ui_drawCrosshair;
;7044:vmCvar_t	ui_drawCrosshairNames;
;7045:vmCvar_t	ui_marks;
;7046:
;7047:vmCvar_t	ui_server1;
;7048:vmCvar_t	ui_server2;
;7049:vmCvar_t	ui_server3;
;7050:vmCvar_t	ui_server4;
;7051:vmCvar_t	ui_server5;
;7052:vmCvar_t	ui_server6;
;7053:vmCvar_t	ui_server7;
;7054:vmCvar_t	ui_server8;
;7055:vmCvar_t	ui_server9;
;7056:vmCvar_t	ui_server10;
;7057:vmCvar_t	ui_server11;
;7058:vmCvar_t	ui_server12;
;7059:vmCvar_t	ui_server13;
;7060:vmCvar_t	ui_server14;
;7061:vmCvar_t	ui_server15;
;7062:vmCvar_t	ui_server16;
;7063:
;7064:vmCvar_t	ui_cdkeychecked;
;7065:
;7066:vmCvar_t	ui_redteam;
;7067:vmCvar_t	ui_redteam1;
;7068:vmCvar_t	ui_redteam2;
;7069:vmCvar_t	ui_redteam3;
;7070:vmCvar_t	ui_redteam4;
;7071:vmCvar_t	ui_redteam5;
;7072:vmCvar_t	ui_redteam6;
;7073:vmCvar_t	ui_redteam7;
;7074:vmCvar_t	ui_redteam8;
;7075:vmCvar_t	ui_blueteam;
;7076:vmCvar_t	ui_blueteam1;
;7077:vmCvar_t	ui_blueteam2;
;7078:vmCvar_t	ui_blueteam3;
;7079:vmCvar_t	ui_blueteam4;
;7080:vmCvar_t	ui_blueteam5;
;7081:vmCvar_t	ui_blueteam6;
;7082:vmCvar_t	ui_blueteam7;
;7083:vmCvar_t	ui_blueteam8;
;7084:vmCvar_t	ui_teamName;
;7085:vmCvar_t	ui_dedicated;
;7086:vmCvar_t	ui_gameType;
;7087:vmCvar_t	ui_netGameType;
;7088:vmCvar_t	ui_actualNetGameType;
;7089:vmCvar_t	ui_joinGameType;
;7090:vmCvar_t	ui_netSource;
;7091:vmCvar_t	ui_serverFilterType;
;7092:vmCvar_t	ui_opponentName;
;7093:vmCvar_t	ui_menuFiles;
;7094:vmCvar_t	ui_currentTier;
;7095:vmCvar_t	ui_currentMap;
;7096:vmCvar_t	ui_currentNetMap;
;7097:vmCvar_t	ui_mapIndex;
;7098:vmCvar_t	ui_currentOpponent;
;7099:vmCvar_t	ui_selectedPlayer;
;7100:vmCvar_t	ui_selectedPlayerName;
;7101:vmCvar_t	ui_lastServerRefresh_0;
;7102:vmCvar_t	ui_lastServerRefresh_1;
;7103:vmCvar_t	ui_lastServerRefresh_2;
;7104:vmCvar_t	ui_lastServerRefresh_3;
;7105:vmCvar_t	ui_singlePlayerActive;
;7106:vmCvar_t	ui_scoreAccuracy;
;7107:vmCvar_t	ui_scoreImpressives;
;7108:vmCvar_t	ui_scoreExcellents;
;7109:vmCvar_t	ui_scoreCaptures;
;7110:vmCvar_t	ui_scoreDefends;
;7111:vmCvar_t	ui_scoreAssists;
;7112:vmCvar_t	ui_scoreGauntlets;
;7113:vmCvar_t	ui_scoreScore;
;7114:vmCvar_t	ui_scorePerfect;
;7115:vmCvar_t	ui_scoreTeam;
;7116:vmCvar_t	ui_scoreBase;
;7117:vmCvar_t	ui_scoreTimeBonus;
;7118:vmCvar_t	ui_scoreSkillBonus;
;7119:vmCvar_t	ui_scoreShutoutBonus;
;7120:vmCvar_t	ui_scoreTime;
;7121:vmCvar_t	ui_captureLimit;
;7122:vmCvar_t	ui_fragLimit;
;7123:vmCvar_t	ui_smallFont;
;7124:vmCvar_t	ui_bigFont;
;7125:vmCvar_t	ui_findPlayer;
;7126:vmCvar_t	ui_Q3Model;
;7127:vmCvar_t	ui_hudFiles;
;7128:vmCvar_t	ui_recordSPDemo;
;7129:vmCvar_t	ui_realCaptureLimit;
;7130:vmCvar_t	ui_realWarmUp;
;7131:vmCvar_t	ui_serverStatusTimeOut;
;7132:vmCvar_t	s_language;
;7133:
;7134:// bk001129 - made static to avoid aliasing
;7135:static cvarTable_t		cvarTable[] = {
;7136:	{ &ui_ffa_fraglimit, "ui_ffa_fraglimit", "20", CVAR_ARCHIVE },
;7137:	{ &ui_ffa_timelimit, "ui_ffa_timelimit", "0", CVAR_ARCHIVE },
;7138:
;7139:	{ &ui_tourney_fraglimit, "ui_tourney_fraglimit", "0", CVAR_ARCHIVE },
;7140:	{ &ui_tourney_timelimit, "ui_tourney_timelimit", "15", CVAR_ARCHIVE },
;7141:
;7142:	{ &ui_selectedModelIndex, "ui_selectedModelIndex", "16", CVAR_ARCHIVE },
;7143:
;7144:	{ &ui_team_fraglimit, "ui_team_fraglimit", "0", CVAR_ARCHIVE },
;7145:	{ &ui_team_timelimit, "ui_team_timelimit", "20", CVAR_ARCHIVE },
;7146:	{ &ui_team_friendly, "ui_team_friendly",  "1", CVAR_ARCHIVE },
;7147:
;7148:	{ &ui_ctf_capturelimit, "ui_ctf_capturelimit", "8", CVAR_ARCHIVE },
;7149:	{ &ui_ctf_timelimit, "ui_ctf_timelimit", "30", CVAR_ARCHIVE },
;7150:	{ &ui_ctf_friendly, "ui_ctf_friendly",  "0", CVAR_ARCHIVE },
;7151:
;7152:	{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM },
;7153:	{ &ui_botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM },
;7154:	{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE | CVAR_ROM },
;7155:	{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE | CVAR_ROM },
;7156:	{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE | CVAR_ROM },
;7157:	{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE | CVAR_ROM },
;7158:	{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE | CVAR_ROM },
;7159:	{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE | CVAR_ROM },
;7160:	{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE | CVAR_ROM },
;7161:	{ &ui_spSkill, "g_spSkill", "2", CVAR_ARCHIVE },
;7162:
;7163:	{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },
;7164:
;7165:	{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
;7166:	{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
;7167:	{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
;7168:	{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
;7169:	{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },
;7170:
;7171:	{ &ui_drawCrosshair, "cg_drawCrosshair", "1", CVAR_ARCHIVE },
;7172:	{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;7173:	{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },
;7174:
;7175:	{ &ui_server1, "server1", "", CVAR_ARCHIVE },
;7176:	{ &ui_server2, "server2", "", CVAR_ARCHIVE },
;7177:	{ &ui_server3, "server3", "", CVAR_ARCHIVE },
;7178:	{ &ui_server4, "server4", "", CVAR_ARCHIVE },
;7179:	{ &ui_server5, "server5", "", CVAR_ARCHIVE },
;7180:	{ &ui_server6, "server6", "", CVAR_ARCHIVE },
;7181:	{ &ui_server7, "server7", "", CVAR_ARCHIVE },
;7182:	{ &ui_server8, "server8", "", CVAR_ARCHIVE },
;7183:	{ &ui_server9, "server9", "", CVAR_ARCHIVE },
;7184:	{ &ui_server10, "server10", "", CVAR_ARCHIVE },
;7185:	{ &ui_server11, "server11", "", CVAR_ARCHIVE },
;7186:	{ &ui_server12, "server12", "", CVAR_ARCHIVE },
;7187:	{ &ui_server13, "server13", "", CVAR_ARCHIVE },
;7188:	{ &ui_server14, "server14", "", CVAR_ARCHIVE },
;7189:	{ &ui_server15, "server15", "", CVAR_ARCHIVE },
;7190:	{ &ui_server16, "server16", "", CVAR_ARCHIVE },
;7191:	{ &ui_cdkeychecked, "ui_cdkeychecked", "0", CVAR_ROM },
;7192:	{ &ui_debug, "ui_debug", "0", CVAR_TEMP },
;7193:	{ &ui_initialized, "ui_initialized", "0", CVAR_TEMP },
;7194:	{ &ui_teamName, "ui_teamName", "Empire", CVAR_ARCHIVE },
;7195:	{ &ui_opponentName, "ui_opponentName", "Rebellion", CVAR_ARCHIVE },
;7196:	{ &ui_rankChange, "ui_rankChange", "0", CVAR_ARCHIVE },
;7197:	{ &ui_freeSaber, "ui_freeSaber", "0", CVAR_ARCHIVE },
;7198:	{ &ui_forcePowerDisable, "ui_forcePowerDisable", "0", CVAR_ARCHIVE },
;7199:	{ &ui_redteam, "ui_redteam", "Empire", CVAR_ARCHIVE },
;7200:	{ &ui_blueteam, "ui_blueteam", "Rebellion", CVAR_ARCHIVE },
;7201:	{ &ui_dedicated, "ui_dedicated", "0", CVAR_ARCHIVE },
;7202:	{ &ui_gameType, "ui_gametype", "0", CVAR_ARCHIVE },
;7203:	{ &ui_joinGameType, "ui_joinGametype", "0", CVAR_ARCHIVE },
;7204:	{ &ui_netGameType, "ui_netGametype", "0", CVAR_ARCHIVE },
;7205:	{ &ui_actualNetGameType, "ui_actualNetGametype", "3", CVAR_ARCHIVE },
;7206:	{ &ui_redteam1, "ui_redteam1", "1", CVAR_ARCHIVE }, //rww - these used to all default to 0 (closed).. I changed them to 1 (human)
;7207:	{ &ui_redteam2, "ui_redteam2", "1", CVAR_ARCHIVE },
;7208:	{ &ui_redteam3, "ui_redteam3", "1", CVAR_ARCHIVE },
;7209:	{ &ui_redteam4, "ui_redteam4", "1", CVAR_ARCHIVE },
;7210:	{ &ui_redteam5, "ui_redteam5", "1", CVAR_ARCHIVE },
;7211:	{ &ui_redteam6, "ui_redteam6", "1", CVAR_ARCHIVE },
;7212:	{ &ui_redteam7, "ui_redteam7", "1", CVAR_ARCHIVE },
;7213:	{ &ui_redteam8, "ui_redteam8", "1", CVAR_ARCHIVE },
;7214:	{ &ui_blueteam1, "ui_blueteam1", "1", CVAR_ARCHIVE },
;7215:	{ &ui_blueteam2, "ui_blueteam2", "1", CVAR_ARCHIVE },
;7216:	{ &ui_blueteam3, "ui_blueteam3", "1", CVAR_ARCHIVE },
;7217:	{ &ui_blueteam4, "ui_blueteam4", "1", CVAR_ARCHIVE },
;7218:	{ &ui_blueteam5, "ui_blueteam5", "1", CVAR_ARCHIVE },
;7219:	{ &ui_blueteam6, "ui_blueteam6", "1", CVAR_ARCHIVE },
;7220:	{ &ui_blueteam7, "ui_blueteam7", "1", CVAR_ARCHIVE },
;7221:	{ &ui_blueteam8, "ui_blueteam8", "1", CVAR_ARCHIVE },
;7222:	{ &ui_netSource, "ui_netSource", "0", CVAR_ARCHIVE },
;7223:	{ &ui_menuFiles, "ui_menuFilesMP", "ui/jk2mpmenus.txt", CVAR_ARCHIVE },
;7224:	{ &ui_currentTier, "ui_currentTier", "0", CVAR_ARCHIVE },
;7225:	{ &ui_currentMap, "ui_currentMap", "0", CVAR_ARCHIVE },
;7226:	{ &ui_currentNetMap, "ui_currentNetMap", "0", CVAR_ARCHIVE },
;7227:	{ &ui_mapIndex, "ui_mapIndex", "0", CVAR_ARCHIVE },
;7228:	{ &ui_currentOpponent, "ui_currentOpponent", "0", CVAR_ARCHIVE },
;7229:	{ &ui_selectedPlayer, "cg_selectedPlayer", "0", CVAR_ARCHIVE},
;7230:	{ &ui_selectedPlayerName, "cg_selectedPlayerName", "", CVAR_ARCHIVE},
;7231:	{ &ui_lastServerRefresh_0, "ui_lastServerRefresh_0", "", CVAR_ARCHIVE},
;7232:	{ &ui_lastServerRefresh_1, "ui_lastServerRefresh_1", "", CVAR_ARCHIVE},
;7233:	{ &ui_lastServerRefresh_2, "ui_lastServerRefresh_2", "", CVAR_ARCHIVE},
;7234:	{ &ui_lastServerRefresh_3, "ui_lastServerRefresh_3", "", CVAR_ARCHIVE},
;7235:	{ &ui_singlePlayerActive, "ui_singlePlayerActive", "0", 0},
;7236:	{ &ui_scoreAccuracy, "ui_scoreAccuracy", "0", CVAR_ARCHIVE},
;7237:	{ &ui_scoreImpressives, "ui_scoreImpressives", "0", CVAR_ARCHIVE},
;7238:	{ &ui_scoreExcellents, "ui_scoreExcellents", "0", CVAR_ARCHIVE},
;7239:	{ &ui_scoreCaptures, "ui_scoreCaptures", "0", CVAR_ARCHIVE},
;7240:	{ &ui_scoreDefends, "ui_scoreDefends", "0", CVAR_ARCHIVE},
;7241:	{ &ui_scoreAssists, "ui_scoreAssists", "0", CVAR_ARCHIVE},
;7242:	{ &ui_scoreGauntlets, "ui_scoreGauntlets", "0",CVAR_ARCHIVE},
;7243:	{ &ui_scoreScore, "ui_scoreScore", "0", CVAR_ARCHIVE},
;7244:	{ &ui_scorePerfect, "ui_scorePerfect", "0", CVAR_ARCHIVE},
;7245:	{ &ui_scoreTeam, "ui_scoreTeam", "0 to 0", CVAR_ARCHIVE},
;7246:	{ &ui_scoreBase, "ui_scoreBase", "0", CVAR_ARCHIVE},
;7247:	{ &ui_scoreTime, "ui_scoreTime", "00:00", CVAR_ARCHIVE},
;7248:	{ &ui_scoreTimeBonus, "ui_scoreTimeBonus", "0", CVAR_ARCHIVE},
;7249:	{ &ui_scoreSkillBonus, "ui_scoreSkillBonus", "0", CVAR_ARCHIVE},
;7250:	{ &ui_scoreShutoutBonus, "ui_scoreShutoutBonus", "0", CVAR_ARCHIVE},
;7251:	{ &ui_fragLimit, "ui_fragLimit", "10", 0},
;7252:	{ &ui_captureLimit, "ui_captureLimit", "5", 0},
;7253:	{ &ui_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;7254:	{ &ui_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;7255:	{ &ui_findPlayer, "ui_findPlayer", "Kyle", CVAR_ARCHIVE},
;7256:	{ &ui_Q3Model, "ui_q3model", "0", CVAR_ARCHIVE},
;7257:	{ &ui_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;7258:	{ &ui_realWarmUp, "g_warmup", "20", CVAR_ARCHIVE},
;7259:	{ &ui_realCaptureLimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART},
;7260:	{ &ui_serverStatusTimeOut, "ui_serverStatusTimeOut", "7000", CVAR_ARCHIVE},
;7261:	{ &s_language, "s_language", "english", CVAR_ARCHIVE | CVAR_NORESTART},
;7262:};
;7263:
;7264:// bk001129 - made static to avoid aliasing
;7265:static int		cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
;7266:
;7267:
;7268:/*
;7269:=================
;7270:UI_RegisterCvars
;7271:=================
;7272:*/
;7273:void UI_RegisterCvars( void ) {
line 7277
;7274:	int			i;
;7275:	cvarTable_t	*cv;
;7276:
;7277:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4847
JUMPV
LABELV $4844
line 7278
;7278:		trap_Cvar_Register( cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7279
;7279:	}
LABELV $4845
line 7277
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4847
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4844
line 7280
;7280:}
LABELV $4843
endproc UI_RegisterCvars 12 16
export UI_UpdateCvars
proc UI_UpdateCvars 8 4
line 7287
;7281:
;7282:/*
;7283:=================
;7284:UI_UpdateCvars
;7285:=================
;7286:*/
;7287:void UI_UpdateCvars( void ) {
line 7291
;7288:	int			i;
;7289:	cvarTable_t	*cv;
;7290:
;7291:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4852
JUMPV
LABELV $4849
line 7292
;7292:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 7293
;7293:	}
LABELV $4850
line 7291
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4852
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4849
line 7294
;7294:}
LABELV $4848
endproc UI_UpdateCvars 8 4
proc UI_StopServerRefresh 12 12
line 7303
;7295:
;7296:
;7297:/*
;7298:=================
;7299:ArenaServers_StopRefresh
;7300:=================
;7301:*/
;7302:static void UI_StopServerRefresh( void )
;7303:{
line 7306
;7304:	int count;
;7305:
;7306:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+40740+2212
INDIRI4
CNSTI4 0
NEI4 $4854
line 7308
;7307:		// not currently refreshing
;7308:		return;
ADDRGP4 $4853
JUMPV
LABELV $4854
line 7310
;7309:	}
;7310:	uiInfo.serverStatus.refreshActive = qfalse;
ADDRGP4 uiInfo+40740+2212
CNSTI4 0
ASGNI4
line 7311
;7311:	Com_Printf("%d servers listed in browser with %d players.\n",
ADDRGP4 $4860
ARGP4
ADDRGP4 uiInfo+40740+10412
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+10416
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 7314
;7312:					uiInfo.serverStatus.numDisplayServers,
;7313:					uiInfo.serverStatus.numPlayersOnServers);
;7314:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 7315
;7315:	if (count - uiInfo.serverStatus.numDisplayServers > 0) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
SUBI4
CNSTI4 0
LEI4 $4866
line 7316
;7316:		Com_Printf("%d servers not listed due to packet loss or pings higher than %d\n",
ADDRGP4 $4873
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4870
ARGP4
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 7319
;7317:						count - uiInfo.serverStatus.numDisplayServers,
;7318:						(int) trap_Cvar_VariableValue("cl_maxPing"));
;7319:	}
LABELV $4866
line 7321
;7320:
;7321:}
LABELV $4853
endproc UI_StopServerRefresh 12 12
proc UI_DoServerRefresh 8 4
line 7330
;7322:
;7323:
;7324:/*
;7325:=================
;7326:UI_DoServerRefresh
;7327:=================
;7328:*/
;7329:static void UI_DoServerRefresh( void )
;7330:{
line 7331
;7331:	qboolean wait = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 7333
;7332:
;7333:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+40740+2212
INDIRI4
CNSTI4 0
NEI4 $4875
line 7334
;7334:		return;
ADDRGP4 $4874
JUMPV
LABELV $4875
line 7336
;7335:	}
;7336:	if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $4879
line 7337
;7337:		if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4882
line 7338
;7338:			if (!trap_LAN_GetServerCount(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $4883
line 7339
;7339:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 7340
;7340:			}
line 7341
;7341:		} else {
ADDRGP4 $4883
JUMPV
LABELV $4882
line 7342
;7342:			if (trap_LAN_GetServerCount(ui_netSource.integer) < 0) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $4888
line 7343
;7343:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 7344
;7344:			}
LABELV $4888
line 7345
;7345:		}
LABELV $4883
line 7346
;7346:	}
LABELV $4879
line 7348
;7347:
;7348:	if (uiInfo.uiDC.realTime < uiInfo.serverStatus.refreshtime) {
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+40740+2192
INDIRI4
GEI4 $4891
line 7349
;7349:		if (wait) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $4896
line 7350
;7350:			return;
ADDRGP4 $4874
JUMPV
LABELV $4896
line 7352
;7351:		}
;7352:	}
LABELV $4891
line 7355
;7353:
;7354:	// if still trying to retrieve pings
;7355:	if (trap_LAN_UpdateVisiblePings(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_UpdateVisiblePings
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $4898
line 7356
;7356:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7357
;7357:	} else if (!wait) {
ADDRGP4 $4899
JUMPV
LABELV $4898
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $4904
line 7359
;7358:		// get the last servers in the list
;7359:		UI_BuildServerDisplayList(2);
CNSTI4 2
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 7361
;7360:		// stop the refresh
;7361:		UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 7362
;7362:	}
LABELV $4904
LABELV $4899
line 7364
;7363:	//
;7364:	UI_BuildServerDisplayList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 7365
;7365:}
LABELV $4874
endproc UI_DoServerRefresh 8 4
proc UI_StartServerRefresh 72 24
line 7373
;7366:
;7367:/*
;7368:=================
;7369:UI_StartServerRefresh
;7370:=================
;7371:*/
;7372:static void UI_StartServerRefresh(qboolean full)
;7373:{
line 7378
;7374:	int		i;
;7375:	char	*ptr;
;7376:
;7377:	qtime_t q;
;7378:	trap_RealTime(&q);
ADDRLP4 0
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 7379
;7379: 	trap_Cvar_Set( va("ui_lastServerRefresh_%i", ui_netSource.integer), va("%s-%i, %i @ %i:%2i", GetMonthAbbrevString(q.tm_mon),q.tm_mday, 1900+q.tm_year,q.tm_hour,q.tm_min));
ADDRGP4 $1473
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 GetMonthAbbrevString
CALLP4
ASGNP4
ADDRGP4 $4908
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 0+12
INDIRI4
ARGI4
ADDRLP4 0+20
INDIRI4
CNSTI4 1900
ADDI4
ARGI4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7381
;7380:
;7381:	if (!full) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4914
line 7382
;7382:		UI_UpdatePendingPings();
ADDRGP4 UI_UpdatePendingPings
CALLV
pop
line 7383
;7383:		return;
ADDRGP4 $4906
JUMPV
LABELV $4914
line 7386
;7384:	}
;7385:
;7386:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+40740+2212
CNSTI4 1
ASGNI4
line 7387
;7387:	uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+40740+10420
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7389
;7388:	// clear number of displayed servers
;7389:	uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+40740+10412
CNSTI4 0
ASGNI4
line 7390
;7390:	uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+40740+10416
CNSTI4 0
ASGNI4
line 7392
;7391:	// mark all servers as visible so we store ping updates for them
;7392:	trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 7394
;7393:	// reset all the pings
;7394:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 7396
;7395:	//
;7396:	if( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4927
line 7397
;7397:		trap_Cmd_ExecuteText( EXEC_NOW, "localservers\n" );
CNSTI4 0
ARGI4
ADDRGP4 $4930
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7398
;7398:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7399
;7399:		return;
ADDRGP4 $4906
JUMPV
LABELV $4927
line 7402
;7400:	}
;7401:
;7402:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 5000;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 7403
;7403:	if( ui_netSource.integer == AS_GLOBAL || ui_netSource.integer == AS_MPLAYER ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
EQI4 $4941
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $4937
LABELV $4941
line 7404
;7404:		if( ui_netSource.integer == AS_GLOBAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $4942
line 7405
;7405:			i = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 7406
;7406:		}
ADDRGP4 $4943
JUMPV
LABELV $4942
line 7407
;7407:		else {
line 7408
;7408:			i = 1;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 7409
;7409:		}
LABELV $4943
line 7411
;7410:
;7411:		ptr = UI_Cvar_VariableString("debug_protocol");
ADDRGP4 $4550
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 56
INDIRP4
ASGNP4
line 7412
;7412:		if (strlen(ptr)) {
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $4945
line 7413
;7413:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %s\n", i, ptr));
ADDRGP4 $4947
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7414
;7414:		}
ADDRGP4 $4946
JUMPV
LABELV $4945
line 7415
;7415:		else {
line 7416
;7416:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %d\n", i, (int)trap_Cvar_VariableValue( "protocol" ) ) );
ADDRGP4 $2341
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4948
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 64
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7417
;7417:		}
LABELV $4946
line 7418
;7418:	}
LABELV $4937
line 7419
;7419:}
LABELV $4906
endproc UI_StartServerRefresh 72 24
bss
export s_language
align 4
LABELV s_language
skip 272
export ui_realWarmUp
align 4
LABELV ui_realWarmUp
skip 272
export ui_realCaptureLimit
align 4
LABELV ui_realCaptureLimit
skip 272
export ui_recordSPDemo
align 4
LABELV ui_recordSPDemo
skip 272
export ui_hudFiles
align 4
LABELV ui_hudFiles
skip 272
export ui_Q3Model
align 4
LABELV ui_Q3Model
skip 272
export ui_findPlayer
align 4
LABELV ui_findPlayer
skip 272
export ui_scoreCaptures
align 4
LABELV ui_scoreCaptures
skip 272
export ui_teamName
align 4
LABELV ui_teamName
skip 272
export ui_blueteam8
align 4
LABELV ui_blueteam8
skip 272
export ui_blueteam7
align 4
LABELV ui_blueteam7
skip 272
export ui_blueteam6
align 4
LABELV ui_blueteam6
skip 272
export ui_blueteam5
align 4
LABELV ui_blueteam5
skip 272
export ui_blueteam4
align 4
LABELV ui_blueteam4
skip 272
export ui_blueteam3
align 4
LABELV ui_blueteam3
skip 272
export ui_blueteam2
align 4
LABELV ui_blueteam2
skip 272
export ui_blueteam1
align 4
LABELV ui_blueteam1
skip 272
export ui_blueteam
align 4
LABELV ui_blueteam
skip 272
export ui_redteam8
align 4
LABELV ui_redteam8
skip 272
export ui_redteam7
align 4
LABELV ui_redteam7
skip 272
export ui_redteam6
align 4
LABELV ui_redteam6
skip 272
export ui_redteam5
align 4
LABELV ui_redteam5
skip 272
export ui_redteam4
align 4
LABELV ui_redteam4
skip 272
export ui_redteam3
align 4
LABELV ui_redteam3
skip 272
export ui_redteam2
align 4
LABELV ui_redteam2
skip 272
export ui_redteam1
align 4
LABELV ui_redteam1
skip 272
export ui_redteam
align 4
LABELV ui_redteam
skip 272
align 1
LABELV lastLoadingText
skip 1024
align 4
LABELV lastConnState
skip 4
import FPMessageTime
export parsedFPMessage
align 1
LABELV parsedFPMessage
skip 1024
export ui_rankChange
align 4
LABELV ui_rankChange
skip 272
export startTime
align 4
LABELV startTime
skip 4
import ProcessNewUI
import UpdateForceUsed
import Menu_ShowItemByName
export ui_initialized
align 4
LABELV ui_initialized
skip 272
export ui_debug
align 4
LABELV ui_debug
skip 272
import UI_ForceConfigHandle
import UI_ForcePowerRank_HandleKey
import UI_ForceMaxRank_HandleKey
import UI_JediNonJedi_HandleKey
import UI_ForceSide_HandleKey
import UI_SkinColor_HandleKey
import UI_UpdateForcePowers
import UI_SaveForceTemplate
import UI_UpdateClientForcePowers
import UI_DrawForceStars
import UI_DrawTotalForceStars
import UI_ReadLegalForce
import UI_InitForceShaders
import ui_forcePowerDisable
import ui_freeSaber
import uiSaberColorShaders
import uiForcePowerDarkLight
import uiForcePowersRank
import uiForcePowersDisabled
import gTouchedForce
import uiForceAvailable
import uiForceUsed
import uiMaxRank
import uiForceRank
import uiJediNonJedi
import uiForceSide
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetBotNameByNumber
import UI_LoadBots
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_G2API_SetBoneAngles
import trap_R_RemapShader
import trap_RealTime
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_S_StartBackgroundTrack
import trap_S_StopBackgroundTrack
import trap_R_RegisterFont
import trap_MemoryRemaining
import trap_LAN_CompareServers
import trap_LAN_ServerStatus
import trap_LAN_ResetPings
import trap_LAN_RemoveServer
import trap_LAN_AddServer
import trap_LAN_UpdateVisiblePings
import trap_LAN_ServerIsVisible
import trap_LAN_MarkServerVisible
import trap_LAN_SaveCachedServers
import trap_LAN_LoadCachedServers
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerPing
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import UI_LoadBestScores
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawSides
import UI_DrawTopBottom
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
export uiInfo
align 4
LABELV uiInfo
skip 95204
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_MainMenu
import MainMenu_Cache
import UI_LoadArenas
import UI_ClearScores
import UI_AdjustTimeByGame
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
export ui_serverStatusTimeOut
align 4
LABELV ui_serverStatusTimeOut
skip 272
export ui_bigFont
align 4
LABELV ui_bigFont
skip 272
export ui_smallFont
align 4
LABELV ui_smallFont
skip 272
export ui_scoreTime
align 4
LABELV ui_scoreTime
skip 272
export ui_scoreShutoutBonus
align 4
LABELV ui_scoreShutoutBonus
skip 272
export ui_scoreSkillBonus
align 4
LABELV ui_scoreSkillBonus
skip 272
export ui_scoreTimeBonus
align 4
LABELV ui_scoreTimeBonus
skip 272
export ui_scoreBase
align 4
LABELV ui_scoreBase
skip 272
export ui_scoreTeam
align 4
LABELV ui_scoreTeam
skip 272
export ui_scorePerfect
align 4
LABELV ui_scorePerfect
skip 272
export ui_scoreScore
align 4
LABELV ui_scoreScore
skip 272
export ui_scoreGauntlets
align 4
LABELV ui_scoreGauntlets
skip 272
export ui_scoreAssists
align 4
LABELV ui_scoreAssists
skip 272
export ui_scoreDefends
align 4
LABELV ui_scoreDefends
skip 272
export ui_scoreExcellents
align 4
LABELV ui_scoreExcellents
skip 272
export ui_scoreImpressives
align 4
LABELV ui_scoreImpressives
skip 272
export ui_scoreAccuracy
align 4
LABELV ui_scoreAccuracy
skip 272
export ui_singlePlayerActive
align 4
LABELV ui_singlePlayerActive
skip 272
export ui_lastServerRefresh_3
align 4
LABELV ui_lastServerRefresh_3
skip 272
export ui_lastServerRefresh_2
align 4
LABELV ui_lastServerRefresh_2
skip 272
export ui_lastServerRefresh_1
align 4
LABELV ui_lastServerRefresh_1
skip 272
export ui_lastServerRefresh_0
align 4
LABELV ui_lastServerRefresh_0
skip 272
export ui_selectedPlayerName
align 4
LABELV ui_selectedPlayerName
skip 272
export ui_selectedPlayer
align 4
LABELV ui_selectedPlayer
skip 272
export ui_currentOpponent
align 4
LABELV ui_currentOpponent
skip 272
export ui_mapIndex
align 4
LABELV ui_mapIndex
skip 272
export ui_currentNetMap
align 4
LABELV ui_currentNetMap
skip 272
export ui_currentMap
align 4
LABELV ui_currentMap
skip 272
export ui_currentTier
align 4
LABELV ui_currentTier
skip 272
export ui_menuFiles
align 4
LABELV ui_menuFiles
skip 272
export ui_opponentName
align 4
LABELV ui_opponentName
skip 272
export ui_dedicated
align 4
LABELV ui_dedicated
skip 272
export ui_serverFilterType
align 4
LABELV ui_serverFilterType
skip 272
export ui_netSource
align 4
LABELV ui_netSource
skip 272
export ui_joinGameType
align 4
LABELV ui_joinGameType
skip 272
export ui_actualNetGameType
align 4
LABELV ui_actualNetGameType
skip 272
export ui_netGameType
align 4
LABELV ui_netGameType
skip 272
export ui_gameType
align 4
LABELV ui_gameType
skip 272
export ui_fragLimit
align 4
LABELV ui_fragLimit
skip 272
export ui_captureLimit
align 4
LABELV ui_captureLimit
skip 272
export ui_cdkeychecked
align 4
LABELV ui_cdkeychecked
skip 272
import ui_cdkey
export ui_server16
align 4
LABELV ui_server16
skip 272
export ui_server15
align 4
LABELV ui_server15
skip 272
export ui_server14
align 4
LABELV ui_server14
skip 272
export ui_server13
align 4
LABELV ui_server13
skip 272
export ui_server12
align 4
LABELV ui_server12
skip 272
export ui_server11
align 4
LABELV ui_server11
skip 272
export ui_server10
align 4
LABELV ui_server10
skip 272
export ui_server9
align 4
LABELV ui_server9
skip 272
export ui_server8
align 4
LABELV ui_server8
skip 272
export ui_server7
align 4
LABELV ui_server7
skip 272
export ui_server6
align 4
LABELV ui_server6
skip 272
export ui_server5
align 4
LABELV ui_server5
skip 272
export ui_server4
align 4
LABELV ui_server4
skip 272
export ui_server3
align 4
LABELV ui_server3
skip 272
export ui_server2
align 4
LABELV ui_server2
skip 272
export ui_server1
align 4
LABELV ui_server1
skip 272
export ui_marks
align 4
LABELV ui_marks
skip 272
export ui_drawCrosshairNames
align 4
LABELV ui_drawCrosshairNames
skip 272
export ui_drawCrosshair
align 4
LABELV ui_drawCrosshair
skip 272
export ui_browserShowEmpty
align 4
LABELV ui_browserShowEmpty
skip 272
export ui_browserShowFull
align 4
LABELV ui_browserShowFull
skip 272
export ui_browserSortKey
align 4
LABELV ui_browserSortKey
skip 272
export ui_browserGameType
align 4
LABELV ui_browserGameType
skip 272
export ui_browserMaster
align 4
LABELV ui_browserMaster
skip 272
export ui_spSelection
align 4
LABELV ui_spSelection
skip 272
export ui_spSkill
align 4
LABELV ui_spSkill
skip 272
export ui_spVideos
align 4
LABELV ui_spVideos
skip 272
export ui_spAwards
align 4
LABELV ui_spAwards
skip 272
export ui_spScores5
align 4
LABELV ui_spScores5
skip 272
export ui_spScores4
align 4
LABELV ui_spScores4
skip 272
export ui_spScores3
align 4
LABELV ui_spScores3
skip 272
export ui_spScores2
align 4
LABELV ui_spScores2
skip 272
export ui_spScores1
align 4
LABELV ui_spScores1
skip 272
export ui_botsFile
align 4
LABELV ui_botsFile
skip 272
export ui_arenasFile
align 4
LABELV ui_arenasFile
skip 272
export ui_ctf_friendly
align 4
LABELV ui_ctf_friendly
skip 272
export ui_ctf_timelimit
align 4
LABELV ui_ctf_timelimit
skip 272
export ui_ctf_capturelimit
align 4
LABELV ui_ctf_capturelimit
skip 272
export ui_team_friendly
align 4
LABELV ui_team_friendly
skip 272
export ui_team_timelimit
align 4
LABELV ui_team_timelimit
skip 272
export ui_team_fraglimit
align 4
LABELV ui_team_fraglimit
skip 272
export ui_selectedModelIndex
align 4
LABELV ui_selectedModelIndex
skip 272
export ui_tourney_timelimit
align 4
LABELV ui_tourney_timelimit
skip 272
export ui_tourney_fraglimit
align 4
LABELV ui_tourney_fraglimit
skip 272
export ui_ffa_timelimit
align 4
LABELV ui_ffa_timelimit
skip 272
export ui_ffa_fraglimit
align 4
LABELV ui_ffa_fraglimit
skip 272
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_AnyLanguage_ReadCharFromString
import trap_Language_UsesSpaces
import trap_Language_IsAsian
import trap_R_Font_DrawString
import trap_R_Font_HeightPixels
import trap_R_Font_StrLenChars
import trap_R_Font_StrLenPixels
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
LABELV $4948
char 1 103
char 1 108
char 1 111
char 1 98
char 1 97
char 1 108
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $4947
char 1 103
char 1 108
char 1 111
char 1 98
char 1 97
char 1 108
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $4930
char 1 108
char 1 111
char 1 99
char 1 97
char 1 108
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 10
char 1 0
align 1
LABELV $4908
char 1 37
char 1 115
char 1 45
char 1 37
char 1 105
char 1 44
char 1 32
char 1 37
char 1 105
char 1 32
char 1 64
char 1 32
char 1 37
char 1 105
char 1 58
char 1 37
char 1 50
char 1 105
char 1 0
align 1
LABELV $4873
char 1 99
char 1 108
char 1 95
char 1 109
char 1 97
char 1 120
char 1 80
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $4870
char 1 37
char 1 100
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 101
char 1 100
char 1 32
char 1 100
char 1 117
char 1 101
char 1 32
char 1 116
char 1 111
char 1 32
char 1 112
char 1 97
char 1 99
char 1 107
char 1 101
char 1 116
char 1 32
char 1 108
char 1 111
char 1 115
char 1 115
char 1 32
char 1 111
char 1 114
char 1 32
char 1 112
char 1 105
char 1 110
char 1 103
char 1 115
char 1 32
char 1 104
char 1 105
char 1 103
char 1 104
char 1 101
char 1 114
char 1 32
char 1 116
char 1 104
char 1 97
char 1 110
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $4860
char 1 37
char 1 100
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 101
char 1 100
char 1 32
char 1 105
char 1 110
char 1 32
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 37
char 1 100
char 1 32
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $4842
char 1 101
char 1 110
char 1 103
char 1 108
char 1 105
char 1 115
char 1 104
char 1 0
align 1
LABELV $4841
char 1 115
char 1 95
char 1 108
char 1 97
char 1 110
char 1 103
char 1 117
char 1 97
char 1 103
char 1 101
char 1 0
align 1
LABELV $4840
char 1 55
char 1 48
char 1 48
char 1 48
char 1 0
align 1
LABELV $4839
char 1 117
char 1 105
char 1 95
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 84
char 1 105
char 1 109
char 1 101
char 1 79
char 1 117
char 1 116
char 1 0
align 1
LABELV $4838
char 1 117
char 1 105
char 1 95
char 1 113
char 1 51
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $4837
char 1 48
char 1 46
char 1 52
char 1 0
align 1
LABELV $4836
char 1 117
char 1 105
char 1 95
char 1 98
char 1 105
char 1 103
char 1 70
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $4835
char 1 48
char 1 46
char 1 50
char 1 53
char 1 0
align 1
LABELV $4834
char 1 117
char 1 105
char 1 95
char 1 115
char 1 109
char 1 97
char 1 108
char 1 108
char 1 70
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $4833
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 104
char 1 117
char 1 116
char 1 111
char 1 117
char 1 116
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 0
align 1
LABELV $4832
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 107
char 1 105
char 1 108
char 1 108
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 0
align 1
LABELV $4831
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 0
align 1
LABELV $4830
char 1 48
char 1 48
char 1 58
char 1 48
char 1 48
char 1 0
align 1
LABELV $4829
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $4828
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 66
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $4827
char 1 48
char 1 32
char 1 116
char 1 111
char 1 32
char 1 48
char 1 0
align 1
LABELV $4826
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $4825
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 80
char 1 101
char 1 114
char 1 102
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $4824
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $4823
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 71
char 1 97
char 1 117
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 115
char 1 0
align 1
LABELV $4822
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 65
char 1 115
char 1 115
char 1 105
char 1 115
char 1 116
char 1 115
char 1 0
align 1
LABELV $4821
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 68
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 115
char 1 0
align 1
LABELV $4820
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $4819
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 69
char 1 120
char 1 99
char 1 101
char 1 108
char 1 108
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $4818
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 73
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 105
char 1 118
char 1 101
char 1 115
char 1 0
align 1
LABELV $4817
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 65
char 1 99
char 1 99
char 1 117
char 1 114
char 1 97
char 1 99
char 1 121
char 1 0
align 1
LABELV $4816
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 51
char 1 0
align 1
LABELV $4815
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 50
char 1 0
align 1
LABELV $4814
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 49
char 1 0
align 1
LABELV $4813
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 48
char 1 0
align 1
LABELV $4812
char 1 117
char 1 105
char 1 95
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 79
char 1 112
char 1 112
char 1 111
char 1 110
char 1 101
char 1 110
char 1 116
char 1 0
align 1
LABELV $4811
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 56
char 1 0
align 1
LABELV $4810
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 55
char 1 0
align 1
LABELV $4809
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 54
char 1 0
align 1
LABELV $4808
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 53
char 1 0
align 1
LABELV $4807
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 52
char 1 0
align 1
LABELV $4806
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 51
char 1 0
align 1
LABELV $4805
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 50
char 1 0
align 1
LABELV $4804
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 49
char 1 0
align 1
LABELV $4803
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 56
char 1 0
align 1
LABELV $4802
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 55
char 1 0
align 1
LABELV $4801
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 54
char 1 0
align 1
LABELV $4800
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 53
char 1 0
align 1
LABELV $4799
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 52
char 1 0
align 1
LABELV $4798
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 51
char 1 0
align 1
LABELV $4797
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 50
char 1 0
align 1
LABELV $4796
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 49
char 1 0
align 1
LABELV $4795
char 1 51
char 1 0
align 1
LABELV $4794
char 1 117
char 1 105
char 1 95
char 1 97
char 1 99
char 1 116
char 1 117
char 1 97
char 1 108
char 1 78
char 1 101
char 1 116
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
LABELV $4793
char 1 117
char 1 105
char 1 95
char 1 110
char 1 101
char 1 116
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
LABELV $4792
char 1 117
char 1 105
char 1 95
char 1 106
char 1 111
char 1 105
char 1 110
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
LABELV $4791
char 1 117
char 1 105
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
LABELV $4790
char 1 117
char 1 105
char 1 95
char 1 100
char 1 101
char 1 100
char 1 105
char 1 99
char 1 97
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $4789
char 1 117
char 1 105
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
LABELV $4788
char 1 117
char 1 105
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
LABELV $4787
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
LABELV $4786
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
LABELV $4785
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
LABELV $4784
char 1 69
char 1 109
char 1 112
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $4783
char 1 117
char 1 105
char 1 95
char 1 105
char 1 110
char 1 105
char 1 116
char 1 105
char 1 97
char 1 108
char 1 105
char 1 122
char 1 101
char 1 100
char 1 0
align 1
LABELV $4782
char 1 117
char 1 105
char 1 95
char 1 100
char 1 101
char 1 98
char 1 117
char 1 103
char 1 0
align 1
LABELV $4781
char 1 117
char 1 105
char 1 95
char 1 99
char 1 100
char 1 107
char 1 101
char 1 121
char 1 99
char 1 104
char 1 101
char 1 99
char 1 107
char 1 101
char 1 100
char 1 0
align 1
LABELV $4780
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 54
char 1 0
align 1
LABELV $4779
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 53
char 1 0
align 1
LABELV $4778
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 52
char 1 0
align 1
LABELV $4777
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 51
char 1 0
align 1
LABELV $4776
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 50
char 1 0
align 1
LABELV $4775
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 49
char 1 0
align 1
LABELV $4774
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 48
char 1 0
align 1
LABELV $4773
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 57
char 1 0
align 1
LABELV $4772
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 56
char 1 0
align 1
LABELV $4771
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 55
char 1 0
align 1
LABELV $4770
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 54
char 1 0
align 1
LABELV $4769
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 53
char 1 0
align 1
LABELV $4768
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 52
char 1 0
align 1
LABELV $4767
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 51
char 1 0
align 1
LABELV $4766
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 50
char 1 0
align 1
LABELV $4765
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 0
align 1
LABELV $4764
char 1 99
char 1 103
char 1 95
char 1 109
char 1 97
char 1 114
char 1 107
char 1 115
char 1 0
align 1
LABELV $4763
char 1 99
char 1 103
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 67
char 1 114
char 1 111
char 1 115
char 1 115
char 1 104
char 1 97
char 1 105
char 1 114
char 1 78
char 1 97
char 1 109
char 1 101
char 1 115
char 1 0
align 1
LABELV $4762
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 83
char 1 104
char 1 111
char 1 119
char 1 69
char 1 109
char 1 112
char 1 116
char 1 121
char 1 0
align 1
LABELV $4761
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 83
char 1 104
char 1 111
char 1 119
char 1 70
char 1 117
char 1 108
char 1 108
char 1 0
align 1
LABELV $4760
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 83
char 1 111
char 1 114
char 1 116
char 1 75
char 1 101
char 1 121
char 1 0
align 1
LABELV $4759
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $4758
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 77
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $4757
char 1 117
char 1 105
char 1 95
char 1 115
char 1 112
char 1 83
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $4756
char 1 103
char 1 95
char 1 115
char 1 112
char 1 86
char 1 105
char 1 100
char 1 101
char 1 111
char 1 115
char 1 0
align 1
LABELV $4755
char 1 103
char 1 95
char 1 115
char 1 112
char 1 65
char 1 119
char 1 97
char 1 114
char 1 100
char 1 115
char 1 0
align 1
LABELV $4754
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 53
char 1 0
align 1
LABELV $4753
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 52
char 1 0
align 1
LABELV $4752
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 51
char 1 0
align 1
LABELV $4751
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 50
char 1 0
align 1
LABELV $4750
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 49
char 1 0
align 1
LABELV $4749
char 1 103
char 1 95
char 1 98
char 1 111
char 1 116
char 1 115
char 1 70
char 1 105
char 1 108
char 1 101
char 1 0
align 1
LABELV $4748
char 1 103
char 1 95
char 1 97
char 1 114
char 1 101
char 1 110
char 1 97
char 1 115
char 1 70
char 1 105
char 1 108
char 1 101
char 1 0
align 1
LABELV $4747
char 1 117
char 1 105
char 1 95
char 1 99
char 1 116
char 1 102
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 0
align 1
LABELV $4746
char 1 117
char 1 105
char 1 95
char 1 99
char 1 116
char 1 102
char 1 95
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
LABELV $4745
char 1 56
char 1 0
align 1
LABELV $4744
char 1 117
char 1 105
char 1 95
char 1 99
char 1 116
char 1 102
char 1 95
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
LABELV $4743
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 0
align 1
LABELV $4742
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
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
LABELV $4741
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
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
LABELV $4740
char 1 49
char 1 54
char 1 0
align 1
LABELV $4739
char 1 117
char 1 105
char 1 95
char 1 116
char 1 111
char 1 117
char 1 114
char 1 110
char 1 101
char 1 121
char 1 95
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
LABELV $4738
char 1 117
char 1 105
char 1 95
char 1 116
char 1 111
char 1 117
char 1 114
char 1 110
char 1 101
char 1 121
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
LABELV $4737
char 1 117
char 1 105
char 1 95
char 1 102
char 1 102
char 1 97
char 1 95
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
LABELV $4736
char 1 117
char 1 105
char 1 95
char 1 102
char 1 102
char 1 97
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
LABELV $4727
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 65
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 71
char 1 65
char 1 77
char 1 69
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 0
align 1
LABELV $4724
char 1 99
char 1 108
char 1 95
char 1 100
char 1 111
char 1 119
char 1 110
char 1 108
char 1 111
char 1 97
char 1 100
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $4721
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 65
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
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
LABELV $4718
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 65
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 67
char 1 79
char 1 78
char 1 78
char 1 69
char 1 67
char 1 84
char 1 73
char 1 79
char 1 78
char 1 0
align 1
LABELV $4708
char 1 109
char 1 111
char 1 116
char 1 100
char 1 0
align 1
LABELV $4705
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 67
char 1 79
char 1 78
char 1 78
char 1 69
char 1 67
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 84
char 1 79
char 1 0
align 1
LABELV $4704
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 85
char 1 80
char 1 0
align 1
LABELV $4703
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
LABELV $4699
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
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
LABELV $4692
char 1 67
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $4690
char 1 37
char 1 115
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $4687
char 1 40
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 41
char 1 0
align 1
LABELV $4678
char 1 40
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 41
char 1 0
align 1
LABELV $4677
char 1 101
char 1 115
char 1 116
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $4673
char 1 37
char 1 115
char 1 32
char 1 40
char 1 37
char 1 100
char 1 37
char 1 37
char 1 41
char 1 0
align 1
LABELV $4670
char 1 99
char 1 108
char 1 95
char 1 100
char 1 111
char 1 119
char 1 110
char 1 108
char 1 111
char 1 97
char 1 100
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $4669
char 1 99
char 1 108
char 1 95
char 1 100
char 1 111
char 1 119
char 1 110
char 1 108
char 1 111
char 1 97
char 1 100
char 1 67
char 1 111
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $4668
char 1 99
char 1 108
char 1 95
char 1 100
char 1 111
char 1 119
char 1 110
char 1 108
char 1 111
char 1 97
char 1 100
char 1 83
char 1 105
char 1 122
char 1 101
char 1 0
align 1
LABELV $4649
char 1 68
char 1 79
char 1 87
char 1 78
char 1 76
char 1 79
char 1 65
char 1 68
char 1 95
char 1 83
char 1 84
char 1 85
char 1 70
char 1 70
char 1 0
align 1
LABELV $4645
char 1 37
char 1 50
char 1 100
char 1 32
char 1 115
char 1 101
char 1 99
char 1 0
align 1
LABELV $4644
char 1 37
char 1 50
char 1 100
char 1 32
char 1 109
char 1 105
char 1 110
char 1 32
char 1 37
char 1 50
char 1 100
char 1 32
char 1 115
char 1 101
char 1 99
char 1 0
align 1
LABELV $4641
char 1 37
char 1 100
char 1 32
char 1 104
char 1 114
char 1 32
char 1 37
char 1 50
char 1 100
char 1 32
char 1 109
char 1 105
char 1 110
char 1 0
align 1
LABELV $4637
char 1 37
char 1 100
char 1 32
char 1 98
char 1 121
char 1 116
char 1 101
char 1 115
char 1 0
align 1
LABELV $4636
char 1 37
char 1 100
char 1 32
char 1 75
char 1 66
char 1 0
align 1
LABELV $4633
char 1 46
char 1 37
char 1 48
char 1 50
char 1 100
char 1 32
char 1 77
char 1 66
char 1 0
align 1
LABELV $4630
char 1 46
char 1 37
char 1 48
char 1 50
char 1 100
char 1 32
char 1 71
char 1 66
char 1 0
align 1
LABELV $4622
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $4620
char 1 101
char 1 110
char 1 100
char 1 111
char 1 102
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $4615
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $4613
char 1 98
char 1 97
char 1 99
char 1 107
char 1 103
char 1 114
char 1 111
char 1 117
char 1 110
char 1 100
char 1 116
char 1 97
char 1 115
char 1 107
char 1 95
char 1 112
char 1 111
char 1 112
char 1 109
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $4612
char 1 99
char 1 111
char 1 109
char 1 95
char 1 105
char 1 103
char 1 110
char 1 111
char 1 114
char 1 101
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 116
char 1 97
char 1 115
char 1 107
char 1 115
char 1 0
align 1
LABELV $4609
char 1 99
char 1 111
char 1 109
char 1 95
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 116
char 1 97
char 1 115
char 1 107
char 1 115
char 1 0
align 1
LABELV $4606
char 1 101
char 1 114
char 1 114
char 1 111
char 1 114
char 1 95
char 1 112
char 1 111
char 1 112
char 1 109
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $4551
char 1 117
char 1 105
char 1 95
char 1 104
char 1 105
char 1 100
char 1 101
char 1 108
char 1 97
char 1 110
char 1 103
char 1 0
align 1
LABELV $4550
char 1 100
char 1 101
char 1 98
char 1 117
char 1 103
char 1 95
char 1 112
char 1 114
char 1 111
char 1 116
char 1 111
char 1 99
char 1 111
char 1 108
char 1 0
align 1
LABELV $4527
char 1 119
char 1 104
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $4525
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 51
char 1 95
char 1 99
char 1 117
char 1 114
char 1 115
char 1 111
char 1 114
char 1 50
char 1 0
align 1
LABELV $4523
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 37
char 1 100
char 1 0
align 1
LABELV $4424
char 1 37
char 1 115
char 1 37
char 1 115
char 1 0
align 1
LABELV $4413
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
char 1 37
char 1 115
char 1 46
char 1 106
char 1 112
char 1 103
char 1 0
align 1
LABELV $4397
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $4395
char 1 46
char 1 46
char 1 0
align 1
LABELV $4394
char 1 46
char 1 0
align 1
LABELV $4384
char 1 47
char 1 0
align 1
LABELV $4383
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
char 1 0
align 1
LABELV $4359
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 102
char 1 103
char 1 47
char 1 100
char 1 97
char 1 114
char 1 107
char 1 0
align 1
LABELV $4356
char 1 102
char 1 99
char 1 102
char 1 0
align 1
LABELV $4355
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 102
char 1 103
char 1 47
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $4350
char 1 67
char 1 117
char 1 115
char 1 116
char 1 111
char 1 109
char 1 0
align 1
LABELV $4298
char 1 109
char 1 97
char 1 112
char 1 115
char 1 0
align 1
LABELV $4293
char 1 106
char 1 111
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 115
char 1 0
align 1
LABELV $4288
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 115
char 1 0
align 1
LABELV $4273
char 1 84
char 1 111
char 1 111
char 1 32
char 1 109
char 1 97
char 1 110
char 1 121
char 1 32
char 1 109
char 1 97
char 1 112
char 1 115
char 1 44
char 1 32
char 1 108
char 1 97
char 1 115
char 1 116
char 1 32
char 1 111
char 1 110
char 1 101
char 1 32
char 1 114
char 1 101
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 33
char 1 10
char 1 0
align 1
LABELV $4265
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
char 1 95
char 1 115
char 1 109
char 1 97
char 1 108
char 1 108
char 1 0
align 1
LABELV $4209
char 1 84
char 1 111
char 1 111
char 1 32
char 1 109
char 1 97
char 1 110
char 1 121
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 32
char 1 116
char 1 121
char 1 112
char 1 101
char 1 115
char 1 44
char 1 32
char 1 108
char 1 97
char 1 115
char 1 116
char 1 32
char 1 111
char 1 110
char 1 101
char 1 32
char 1 114
char 1 101
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 33
char 1 10
char 1 0
align 1
LABELV $4204
char 1 84
char 1 111
char 1 111
char 1 32
char 1 109
char 1 97
char 1 110
char 1 121
char 1 32
char 1 110
char 1 101
char 1 116
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 32
char 1 116
char 1 121
char 1 112
char 1 101
char 1 115
char 1 44
char 1 32
char 1 108
char 1 97
char 1 115
char 1 116
char 1 32
char 1 111
char 1 110
char 1 101
char 1 32
char 1 114
char 1 101
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 33
char 1 10
char 1 0
align 1
LABELV $4045
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $4036
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
LABELV $4005
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 0
align 1
LABELV $4000
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
char 1 0
align 1
LABELV $3985
char 1 117
char 1 105
char 1 95
char 1 115
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 77
char 1 111
char 1 100
char 1 101
char 1 108
char 1 73
char 1 110
char 1 100
char 1 101
char 1 120
char 1 0
align 1
LABELV $3908
char 1 46
char 1 46
char 1 46
char 1 0
align 1
LABELV $3904
char 1 85
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 0
align 1
LABELV $3903
char 1 73
char 1 110
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $3897
char 1 37
char 1 115
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 0
align 1
LABELV $3894
char 1 37
char 1 115
char 1 0
align 1
LABELV $3893
char 1 40
char 1 65
char 1 41
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $3892
char 1 115
char 1 118
char 1 95
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 65
char 1 110
char 1 111
char 1 110
char 1 121
char 1 109
char 1 111
char 1 117
char 1 115
char 1 0
align 1
LABELV $3889
char 1 110
char 1 101
char 1 116
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $3888
char 1 37
char 1 115
char 1 32
char 1 91
char 1 37
char 1 115
char 1 93
char 1 0
align 1
LABELV $3884
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 116
char 1 114
char 1 117
char 1 101
char 1 106
char 1 101
char 1 100
char 1 105
char 1 0
align 1
LABELV $3881
char 1 116
char 1 114
char 1 117
char 1 101
char 1 106
char 1 101
char 1 100
char 1 105
char 1 0
align 1
LABELV $3878
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 111
char 1 110
char 1 108
char 1 121
char 1 0
align 1
LABELV $3870
char 1 119
char 1 100
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $3869
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 114
char 1 101
char 1 115
char 1 116
char 1 114
char 1 105
char 1 99
char 1 116
char 1 0
align 1
LABELV $3866
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 110
char 1 111
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $3863
char 1 102
char 1 100
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $3860
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 110
char 1 101
char 1 101
char 1 100
char 1 112
char 1 97
char 1 115
char 1 115
char 1 0
align 1
LABELV $3859
char 1 110
char 1 101
char 1 101
char 1 100
char 1 112
char 1 97
char 1 115
char 1 115
char 1 0
align 1
LABELV $3643
char 1 115
char 1 0
align 1
LABELV $3636
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 83
char 1 95
char 1 70
char 1 79
char 1 85
char 1 78
char 1 68
char 1 87
char 1 73
char 1 84
char 1 72
char 1 0
align 1
LABELV $3635
char 1 110
char 1 111
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $3551
char 1 115
char 1 101
char 1 97
char 1 114
char 1 99
char 1 104
char 1 105
char 1 110
char 1 103
char 1 32
char 1 37
char 1 100
char 1 47
char 1 37
char 1 100
char 1 46
char 1 46
char 1 46
char 1 0
align 1
LABELV $3493
char 1 115
char 1 101
char 1 97
char 1 114
char 1 99
char 1 104
char 1 105
char 1 110
char 1 103
char 1 32
char 1 37
char 1 100
char 1 46
char 1 46
char 1 46
char 1 0
align 1
LABELV $3485
char 1 99
char 1 108
char 1 95
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 82
char 1 101
char 1 115
char 1 101
char 1 110
char 1 100
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $3474
char 1 117
char 1 105
char 1 95
char 1 102
char 1 105
char 1 110
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $3429
char 1 112
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $3428
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $3427
char 1 110
char 1 117
char 1 109
char 1 0
align 1
LABELV $3389
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
LABELV $3388
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $3387
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $3386
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3385
char 1 71
char 1 97
char 1 109
char 1 101
char 1 32
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $3384
char 1 71
char 1 97
char 1 109
char 1 101
char 1 32
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3383
char 1 103
char 1 97
char 1 109
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3382
char 1 65
char 1 100
char 1 100
char 1 114
char 1 101
char 1 115
char 1 115
char 1 0
align 1
LABELV $3381
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3380
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
LABELV $3364
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3352
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
LABELV $3332
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $3289
char 1 87
char 1 101
char 1 108
char 1 99
char 1 111
char 1 109
char 1 101
char 1 32
char 1 116
char 1 111
char 1 32
char 1 74
char 1 75
char 1 50
char 1 77
char 1 80
char 1 33
char 1 0
align 1
LABELV $3278
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
LABELV $3195
char 1 47
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $3194
char 1 47
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $3192
char 1 47
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $3104
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
char 1 99
char 1 104
char 1 97
char 1 114
char 1 97
char 1 99
char 1 116
char 1 101
char 1 114
char 1 115
char 1 47
char 1 37
char 1 115
char 1 47
char 1 37
char 1 115
char 1 47
char 1 108
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 46
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $3101
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
char 1 37
char 1 115
char 1 47
char 1 108
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 46
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $3062
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 85
char 1 73
char 1 32
char 1 115
char 1 99
char 1 114
char 1 105
char 1 112
char 1 116
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $3059
char 1 117
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $3056
char 1 117
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 0
align 1
LABELV $3042
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
LABELV $3033
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
char 1 115
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $3030
char 1 103
char 1 108
char 1 67
char 1 117
char 1 115
char 1 116
char 1 111
char 1 109
char 1 0
align 1
LABELV $3027
char 1 114
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $3024
char 1 115
char 1 97
char 1 118
char 1 101
char 1 84
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $3019
char 1 115
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3016
char 1 110
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $3011
char 1 115
char 1 101
char 1 116
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $3002
char 1 118
char 1 111
char 1 105
char 1 99
char 1 101
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $2994
char 1 118
char 1 111
char 1 105
char 1 99
char 1 101
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 115
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $2982
char 1 10
char 1 0
align 1
LABELV $2975
char 1 111
char 1 114
char 1 100
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $2966
char 1 117
char 1 105
char 1 95
char 1 102
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 65
char 1 100
char 1 100
char 1 114
char 1 101
char 1 115
char 1 115
char 1 0
align 1
LABELV $2965
char 1 117
char 1 105
char 1 95
char 1 102
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2964
char 1 99
char 1 114
char 1 101
char 1 97
char 1 116
char 1 101
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $2951
char 1 100
char 1 101
char 1 108
char 1 101
char 1 116
char 1 101
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $2948
char 1 65
char 1 100
char 1 100
char 1 101
char 1 100
char 1 32
char 1 102
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2947
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 32
char 1 102
char 1 117
char 1 108
char 1 108
char 1 10
char 1 0
align 1
LABELV $2944
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 105
char 1 110
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 10
char 1 0
align 1
LABELV $2939
char 1 97
char 1 100
char 1 100
char 1 114
char 1 0
align 1
LABELV $2938
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
LABELV $2929
char 1 97
char 1 100
char 1 100
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $2914
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2911
char 1 97
char 1 100
char 1 100
char 1 66
char 1 111
char 1 116
char 1 0
align 1
LABELV $2906
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
char 1 32
char 1 108
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 10
char 1 0
align 1
LABELV $2900
char 1 118
char 1 111
char 1 116
char 1 101
char 1 76
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $2894
char 1 99
char 1 97
char 1 108
char 1 108
char 1 118
char 1 111
char 1 116
char 1 101
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
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $2888
char 1 118
char 1 111
char 1 116
char 1 101
char 1 71
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2883
char 1 99
char 1 97
char 1 108
char 1 108
char 1 118
char 1 111
char 1 116
char 1 101
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
char 1 34
char 1 37
char 1 105
char 1 34
char 1 10
char 1 0
align 1
LABELV $2877
char 1 118
char 1 111
char 1 116
char 1 101
char 1 75
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $2871
char 1 99
char 1 97
char 1 108
char 1 108
char 1 118
char 1 111
char 1 116
char 1 101
char 1 32
char 1 109
char 1 97
char 1 112
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2865
char 1 118
char 1 111
char 1 116
char 1 101
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $2862
char 1 99
char 1 108
char 1 111
char 1 115
char 1 101
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2859
char 1 83
char 1 107
char 1 105
char 1 114
char 1 109
char 1 105
char 1 115
char 1 104
char 1 83
char 1 116
char 1 97
char 1 114
char 1 116
char 1 0
align 1
LABELV $2856
char 1 110
char 1 101
char 1 120
char 1 116
char 1 83
char 1 107
char 1 105
char 1 114
char 1 109
char 1 105
char 1 115
char 1 104
char 1 0
align 1
LABELV $2840
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 111
char 1 114
char 1 116
char 1 0
align 1
LABELV $2837
char 1 117
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 118
char 1 105
char 1 100
char 1 101
char 1 111
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 0
align 1
LABELV $2834
char 1 103
char 1 101
char 1 116
char 1 118
char 1 105
char 1 100
char 1 101
char 1 111
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 0
align 1
LABELV $2831
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
char 1 10
char 1 0
align 1
LABELV $2830
char 1 76
char 1 101
char 1 97
char 1 118
char 1 101
char 1 0
align 1
LABELV $2827
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 95
char 1 109
char 1 101
char 1 110
char 1 117
char 1 50
char 1 0
align 1
LABELV $2826
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
align 1
LABELV $2825
char 1 67
char 1 111
char 1 110
char 1 116
char 1 114
char 1 111
char 1 108
char 1 115
char 1 0
align 1
LABELV $2822
char 1 113
char 1 117
char 1 105
char 1 116
char 1 0
align 1
LABELV $2821
char 1 81
char 1 117
char 1 105
char 1 116
char 1 0
align 1
LABELV $2811
char 1 70
char 1 111
char 1 117
char 1 110
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 74
char 1 111
char 1 105
char 1 110
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2808
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2794
char 1 74
char 1 111
char 1 105
char 1 110
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2789
char 1 70
char 1 105
char 1 110
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $2782
char 1 70
char 1 111
char 1 117
char 1 110
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 0
align 1
LABELV $2772
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 0
align 1
LABELV $2766
char 1 85
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 70
char 1 105
char 1 108
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $2759
char 1 83
char 1 116
char 1 111
char 1 112
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 0
align 1
LABELV $2756
char 1 109
char 1 97
char 1 105
char 1 110
char 1 0
align 1
LABELV $2755
char 1 106
char 1 111
char 1 105
char 1 110
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2746
char 1 99
char 1 108
char 1 111
char 1 115
char 1 101
char 1 74
char 1 111
char 1 105
char 1 110
char 1 0
align 1
LABELV $2743
char 1 81
char 1 117
char 1 97
char 1 107
char 1 101
char 1 51
char 1 0
align 1
LABELV $2738
char 1 100
char 1 101
char 1 109
char 1 111
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 10
char 1 0
align 1
LABELV $2737
char 1 82
char 1 117
char 1 110
char 1 68
char 1 101
char 1 109
char 1 111
char 1 0
align 1
LABELV $2732
char 1 102
char 1 115
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2731
char 1 82
char 1 117
char 1 110
char 1 77
char 1 111
char 1 100
char 1 0
align 1
LABELV $2726
char 1 99
char 1 105
char 1 110
char 1 101
char 1 109
char 1 97
char 1 116
char 1 105
char 1 99
char 1 32
char 1 37
char 1 115
char 1 46
char 1 114
char 1 111
char 1 113
char 1 32
char 1 50
char 1 10
char 1 0
align 1
LABELV $2721
char 1 112
char 1 108
char 1 97
char 1 121
char 1 77
char 1 111
char 1 118
char 1 105
char 1 101
char 1 0
align 1
LABELV $2718
char 1 76
char 1 111
char 1 97
char 1 100
char 1 77
char 1 111
char 1 100
char 1 115
char 1 0
align 1
LABELV $2715
char 1 76
char 1 111
char 1 97
char 1 100
char 1 77
char 1 111
char 1 118
char 1 105
char 1 101
char 1 115
char 1 0
align 1
LABELV $2712
char 1 76
char 1 111
char 1 97
char 1 100
char 1 68
char 1 101
char 1 109
char 1 111
char 1 115
char 1 0
align 1
LABELV $2703
char 1 100
char 1 101
char 1 109
char 1 111
char 1 32
char 1 37
char 1 115
char 1 95
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $2699
char 1 82
char 1 117
char 1 110
char 1 83
char 1 80
char 1 68
char 1 101
char 1 109
char 1 111
char 1 0
align 1
LABELV $2696
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 70
char 1 105
char 1 108
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $2693
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $2690
char 1 114
char 1 101
char 1 115
char 1 101
char 1 116
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2681
char 1 108
char 1 111
char 1 97
char 1 100
char 1 71
char 1 97
char 1 109
char 1 101
char 1 73
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $2678
char 1 99
char 1 111
char 1 109
char 1 95
char 1 101
char 1 114
char 1 114
char 1 111
char 1 114
char 1 77
char 1 101
char 1 115
char 1 115
char 1 97
char 1 103
char 1 101
char 1 0
align 1
LABELV $2677
char 1 99
char 1 108
char 1 101
char 1 97
char 1 114
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 0
align 1
LABELV $2674
char 1 108
char 1 111
char 1 97
char 1 100
char 1 67
char 1 111
char 1 110
char 1 116
char 1 114
char 1 111
char 1 108
char 1 115
char 1 0
align 1
LABELV $2671
char 1 115
char 1 97
char 1 118
char 1 101
char 1 67
char 1 111
char 1 110
char 1 116
char 1 114
char 1 111
char 1 108
char 1 115
char 1 0
align 1
LABELV $2668
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
LABELV $2667
char 1 99
char 1 114
char 1 101
char 1 97
char 1 116
char 1 101
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2666
char 1 108
char 1 111
char 1 97
char 1 100
char 1 65
char 1 114
char 1 101
char 1 110
char 1 97
char 1 115
char 1 0
align 1
LABELV $2663
char 1 99
char 1 111
char 1 109
char 1 95
char 1 105
char 1 110
char 1 116
char 1 114
char 1 111
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 100
char 1 0
align 1
LABELV $2662
char 1 118
char 1 105
char 1 100
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 10
char 1 0
align 1
LABELV $2661
char 1 101
char 1 120
char 1 101
char 1 99
char 1 32
char 1 109
char 1 112
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
char 1 10
char 1 0
align 1
LABELV $2660
char 1 99
char 1 118
char 1 97
char 1 114
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 10
char 1 0
align 1
LABELV $2659
char 1 114
char 1 101
char 1 115
char 1 101
char 1 116
char 1 68
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 115
char 1 0
align 1
LABELV $2652
char 1 117
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 83
char 1 80
char 1 77
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $2640
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 102
char 1 32
char 1 10
char 1 0
align 1
LABELV $2639
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2625
char 1 49
char 1 50
char 1 48
char 1 0
align 1
LABELV $2611
char 1 100
char 1 101
char 1 100
char 1 105
char 1 99
char 1 97
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $2610
char 1 83
char 1 116
char 1 97
char 1 114
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2604
char 1 52
char 1 0
align 1
LABELV $2602
char 1 118
char 1 105
char 1 100
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 59
char 1 0
align 1
LABELV $2601
char 1 117
char 1 105
char 1 95
char 1 99
char 1 103
char 1 95
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 115
char 1 0
align 1
LABELV $2600
char 1 99
char 1 103
char 1 95
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 115
char 1 0
align 1
LABELV $2599
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 69
char 1 120
char 1 116
char 1 101
char 1 110
char 1 115
char 1 105
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $2598
char 1 114
char 1 95
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 69
char 1 120
char 1 116
char 1 101
char 1 110
char 1 115
char 1 105
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $2597
char 1 114
char 1 95
char 1 105
char 1 110
char 1 71
char 1 97
char 1 109
char 1 101
char 1 86
char 1 105
char 1 100
char 1 101
char 1 111
char 1 0
align 1
LABELV $2596
char 1 114
char 1 95
char 1 102
char 1 97
char 1 115
char 1 116
char 1 83
char 1 107
char 1 121
char 1 0
align 1
LABELV $2595
char 1 114
char 1 95
char 1 115
char 1 117
char 1 98
char 1 100
char 1 105
char 1 118
char 1 105
char 1 115
char 1 105
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $2594
char 1 114
char 1 95
char 1 100
char 1 101
char 1 112
char 1 116
char 1 104
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2593
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 101
char 1 120
char 1 116
char 1 95
char 1 99
char 1 111
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2592
char 1 114
char 1 95
char 1 101
char 1 120
char 1 116
char 1 95
char 1 99
char 1 111
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2591
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 100
char 1 101
char 1 116
char 1 97
char 1 105
char 1 108
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2590
char 1 114
char 1 95
char 1 100
char 1 101
char 1 116
char 1 97
char 1 105
char 1 108
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2589
char 1 114
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $2588
char 1 114
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2587
char 1 114
char 1 95
char 1 112
char 1 105
char 1 99
char 1 109
char 1 105
char 1 112
char 1 0
align 1
LABELV $2586
char 1 114
char 1 95
char 1 108
char 1 111
char 1 100
char 1 98
char 1 105
char 1 97
char 1 115
char 1 0
align 1
LABELV $2585
char 1 114
char 1 95
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2584
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 102
char 1 117
char 1 108
char 1 108
char 1 115
char 1 99
char 1 114
char 1 101
char 1 101
char 1 110
char 1 0
align 1
LABELV $2583
char 1 114
char 1 95
char 1 102
char 1 117
char 1 108
char 1 108
char 1 115
char 1 99
char 1 114
char 1 101
char 1 101
char 1 110
char 1 0
align 1
LABELV $2582
char 1 114
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $2577
char 1 117
char 1 105
char 1 95
char 1 114
char 1 117
char 1 108
char 1 101
char 1 115
char 1 95
char 1 98
char 1 97
char 1 99
char 1 107
char 1 111
char 1 117
char 1 116
char 1 0
align 1
LABELV $2576
char 1 82
char 1 117
char 1 108
char 1 101
char 1 115
char 1 66
char 1 97
char 1 99
char 1 107
char 1 111
char 1 117
char 1 116
char 1 0
align 1
LABELV $2568
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 109
char 1 111
char 1 100
char 1 105
char 1 102
char 1 105
char 1 101
char 1 100
char 1 0
align 1
LABELV $2565
char 1 86
char 1 105
char 1 100
char 1 101
char 1 111
char 1 83
char 1 101
char 1 116
char 1 117
char 1 112
char 1 0
align 1
LABELV $2559
char 1 109
char 1 95
char 1 112
char 1 105
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $2556
char 1 117
char 1 105
char 1 95
char 1 109
char 1 111
char 1 117
char 1 115
char 1 101
char 1 80
char 1 105
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $2551
char 1 71
char 1 76
char 1 95
char 1 76
char 1 73
char 1 78
char 1 69
char 1 65
char 1 82
char 1 95
char 1 77
char 1 73
char 1 80
char 1 77
char 1 65
char 1 80
char 1 95
char 1 78
char 1 69
char 1 65
char 1 82
char 1 69
char 1 83
char 1 84
char 1 0
align 1
LABELV $2548
char 1 71
char 1 76
char 1 95
char 1 76
char 1 73
char 1 78
char 1 69
char 1 65
char 1 82
char 1 95
char 1 77
char 1 73
char 1 80
char 1 77
char 1 65
char 1 80
char 1 95
char 1 76
char 1 73
char 1 78
char 1 69
char 1 65
char 1 82
char 1 0
align 1
LABELV $2547
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $2546
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 105
char 1 110
char 1 71
char 1 97
char 1 109
char 1 101
char 1 86
char 1 105
char 1 100
char 1 101
char 1 111
char 1 0
align 1
LABELV $2545
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 102
char 1 97
char 1 115
char 1 116
char 1 83
char 1 107
char 1 121
char 1 0
align 1
LABELV $2544
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2543
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $2542
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 112
char 1 105
char 1 99
char 1 109
char 1 105
char 1 112
char 1 0
align 1
LABELV $2541
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 102
char 1 117
char 1 108
char 1 108
char 1 83
char 1 99
char 1 114
char 1 101
char 1 101
char 1 110
char 1 0
align 1
LABELV $2537
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 103
char 1 108
char 1 67
char 1 117
char 1 115
char 1 116
char 1 111
char 1 109
char 1 0
align 1
LABELV $2532
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 115
char 1 117
char 1 98
char 1 100
char 1 105
char 1 118
char 1 105
char 1 115
char 1 105
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $2528
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 108
char 1 111
char 1 100
char 1 98
char 1 105
char 1 97
char 1 115
char 1 0
align 1
LABELV $2521
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 100
char 1 101
char 1 112
char 1 116
char 1 104
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2517
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2514
char 1 117
char 1 105
char 1 95
char 1 71
char 1 101
char 1 116
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2511
char 1 50
char 1 0
align 1
LABELV $2508
char 1 99
char 1 108
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 101
char 1 116
char 1 100
char 1 117
char 1 112
char 1 0
align 1
LABELV $2507
char 1 99
char 1 108
char 1 95
char 1 109
char 1 97
char 1 120
char 1 112
char 1 97
char 1 99
char 1 107
char 1 101
char 1 116
char 1 115
char 1 0
align 1
LABELV $2504
char 1 114
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $2503
char 1 117
char 1 105
char 1 95
char 1 115
char 1 101
char 1 116
char 1 82
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $2500
char 1 117
char 1 105
char 1 95
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2499
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2498
char 1 117
char 1 105
char 1 95
char 1 83
char 1 101
char 1 116
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2495
char 1 115
char 1 110
char 1 100
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 10
char 1 0
align 1
LABELV $2494
char 1 115
char 1 95
char 1 107
char 1 104
char 1 122
char 1 0
align 1
LABELV $2490
char 1 119
char 1 97
char 1 105
char 1 116
char 1 32
char 1 53
char 1 59
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 82
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $2435
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2418
char 1 119
char 1 97
char 1 105
char 1 116
char 1 32
char 1 59
char 1 32
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 102
char 1 32
char 1 44
char 1 32
char 1 37
char 1 105
char 1 32
char 1 10
char 1 0
align 1
LABELV $2412
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 99
char 1 111
char 1 114
char 1 100
char 1 83
char 1 80
char 1 68
char 1 101
char 1 109
char 1 111
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2408
char 1 37
char 1 115
char 1 95
char 1 37
char 1 105
char 1 0
align 1
LABELV $2407
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 99
char 1 111
char 1 114
char 1 100
char 1 83
char 1 80
char 1 68
char 1 101
char 1 109
char 1 111
char 1 0
align 1
LABELV $2404
char 1 103
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $2403
char 1 103
char 1 95
char 1 114
char 1 101
char 1 100
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $2402
char 1 117
char 1 105
char 1 95
char 1 112
char 1 117
char 1 114
char 1 101
char 1 0
align 1
LABELV $2401
char 1 115
char 1 118
char 1 95
char 1 112
char 1 117
char 1 114
char 1 101
char 1 0
align 1
LABELV $2400
char 1 117
char 1 105
char 1 95
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $2399
char 1 103
char 1 95
char 1 119
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $2398
char 1 117
char 1 105
char 1 95
char 1 109
char 1 97
char 1 120
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $2397
char 1 117
char 1 105
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 70
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $2396
char 1 103
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 70
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $2395
char 1 117
char 1 105
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
LABELV $2394
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
LABELV $2393
char 1 117
char 1 105
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 84
char 1 105
char 1 109
char 1 101
char 1 114
char 1 0
align 1
LABELV $2392
char 1 99
char 1 103
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 84
char 1 105
char 1 109
char 1 101
char 1 114
char 1 0
align 1
LABELV $2391
char 1 117
char 1 105
char 1 95
char 1 115
char 1 97
char 1 118
char 1 101
char 1 68
char 1 117
char 1 101
char 1 108
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $2390
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
LABELV $2389
char 1 117
char 1 105
char 1 95
char 1 115
char 1 97
char 1 118
char 1 101
char 1 70
char 1 114
char 1 97
char 1 103
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $2388
char 1 117
char 1 105
char 1 95
char 1 115
char 1 97
char 1 118
char 1 101
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $2387
char 1 117
char 1 105
char 1 95
char 1 115
char 1 105
char 1 110
char 1 103
char 1 108
char 1 101
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 65
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $2384
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $2380
char 1 119
char 1 97
char 1 105
char 1 116
char 1 32
char 1 59
char 1 32
char 1 119
char 1 97
char 1 105
char 1 116
char 1 32
char 1 59
char 1 32
char 1 109
char 1 97
char 1 112
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2374
char 1 117
char 1 105
char 1 95
char 1 109
char 1 97
char 1 112
char 1 73
char 1 110
char 1 100
char 1 101
char 1 120
char 1 0
align 1
LABELV $2370
char 1 115
char 1 107
char 1 105
char 1 114
char 1 109
char 1 105
char 1 115
char 1 104
char 1 0
align 1
LABELV $2344
char 1 46
char 1 100
char 1 109
char 1 95
char 1 37
char 1 100
char 1 0
align 1
LABELV $2343
char 1 100
char 1 101
char 1 109
char 1 111
char 1 115
char 1 0
align 1
LABELV $2341
char 1 112
char 1 114
char 1 111
char 1 116
char 1 111
char 1 99
char 1 111
char 1 108
char 1 0
align 1
LABELV $2340
char 1 100
char 1 109
char 1 95
char 1 37
char 1 100
char 1 0
align 1
LABELV $2337
char 1 46
char 1 114
char 1 111
char 1 113
char 1 0
align 1
LABELV $2322
char 1 114
char 1 111
char 1 113
char 1 0
align 1
LABELV $2321
char 1 118
char 1 105
char 1 100
char 1 101
char 1 111
char 1 0
align 1
LABELV $2305
char 1 36
char 1 109
char 1 111
char 1 100
char 1 108
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $2225
char 1 99
char 1 103
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 67
char 1 114
char 1 111
char 1 115
char 1 115
char 1 104
char 1 97
char 1 105
char 1 114
char 1 0
align 1
LABELV $2140
char 1 117
char 1 105
char 1 95
char 1 110
char 1 101
char 1 116
char 1 83
char 1 111
char 1 117
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $2028
char 1 117
char 1 105
char 1 95
char 1 97
char 1 99
char 1 116
char 1 117
char 1 97
char 1 108
char 1 110
char 1 101
char 1 116
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $1997
char 1 117
char 1 105
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $1996
char 1 117
char 1 105
char 1 95
char 1 81
char 1 51
char 1 77
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $1938
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 49
char 1 0
align 1
LABELV $1728
char 1 74
char 1 75
char 1 50
char 1 77
char 1 80
char 1 58
char 1 32
char 1 118
char 1 49
char 1 46
char 1 48
char 1 51
char 1 97
char 1 0
align 1
LABELV $1696
char 1 71
char 1 76
char 1 95
char 1 80
char 1 73
char 1 88
char 1 69
char 1 76
char 1 70
char 1 79
char 1 82
char 1 77
char 1 65
char 1 84
char 1 58
char 1 32
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 40
char 1 37
char 1 100
char 1 45
char 1 98
char 1 105
char 1 116
char 1 115
char 1 41
char 1 32
char 1 90
char 1 40
char 1 37
char 1 100
char 1 45
char 1 98
char 1 105
char 1 116
char 1 115
char 1 41
char 1 32
char 1 115
char 1 116
char 1 101
char 1 110
char 1 99
char 1 105
char 1 108
char 1 40
char 1 37
char 1 100
char 1 45
char 1 98
char 1 105
char 1 116
char 1 115
char 1 41
char 1 0
align 1
LABELV $1692
char 1 71
char 1 76
char 1 95
char 1 86
char 1 69
char 1 82
char 1 83
char 1 73
char 1 79
char 1 78
char 1 58
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1689
char 1 71
char 1 76
char 1 95
char 1 86
char 1 69
char 1 78
char 1 68
char 1 79
char 1 82
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1581
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
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 95
char 1 82
char 1 69
char 1 70
char 1 82
char 1 69
char 1 83
char 1 72
char 1 84
char 1 73
char 1 77
char 1 69
char 1 0
align 1
LABELV $1578
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
char 1 71
char 1 69
char 1 84
char 1 84
char 1 73
char 1 78
char 1 71
char 1 73
char 1 78
char 1 70
char 1 79
char 1 70
char 1 79
char 1 82
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 83
char 1 0
align 1
LABELV $1555
char 1 69
char 1 118
char 1 101
char 1 114
char 1 121
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $1553
char 1 99
char 1 103
char 1 95
char 1 115
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $1545
char 1 99
char 1 103
char 1 95
char 1 115
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $1522
char 1 110
char 1 0
align 1
LABELV $1511
char 1 115
char 1 118
char 1 95
char 1 109
char 1 97
char 1 120
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $1510
char 1 116
char 1 0
align 1
LABELV $1509
char 1 116
char 1 108
char 1 0
align 1
LABELV $1473
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 37
char 1 105
char 1 0
align 1
LABELV $1471
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 70
char 1 79
char 1 82
char 1 95
char 1 78
char 1 69
char 1 87
char 1 95
char 1 75
char 1 69
char 1 89
char 1 0
align 1
LABELV $1436
char 1 37
char 1 105
char 1 46
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1431
char 1 72
char 1 117
char 1 109
char 1 97
char 1 110
char 1 0
align 1
LABELV $1406
char 1 37
char 1 105
char 1 0
align 1
LABELV $1397
char 1 89
char 1 69
char 1 83
char 1 0
align 1
LABELV $1396
char 1 78
char 1 79
char 1 0
align 1
LABELV $1395
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 48
char 1 0
align 1
LABELV $1388
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 68
char 1 69
char 1 83
char 1 67
char 1 95
char 1 68
char 1 65
char 1 82
char 1 75
char 1 0
align 1
LABELV $1387
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 68
char 1 69
char 1 83
char 1 67
char 1 95
char 1 76
char 1 73
char 1 71
char 1 72
char 1 84
char 1 0
align 1
LABELV $1380
char 1 68
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $1226
char 1 117
char 1 105
char 1 95
char 1 111
char 1 112
char 1 112
char 1 111
char 1 110
char 1 101
char 1 110
char 1 116
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $1224
char 1 75
char 1 121
char 1 108
char 1 101
char 1 0
align 1
LABELV $1176
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
LABELV $1163
char 1 84
char 1 105
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1158
char 1 117
char 1 105
char 1 95
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 84
char 1 105
char 1 101
char 1 114
char 1 0
align 1
LABELV $1155
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $1121
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1120
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 83
char 1 79
char 1 85
char 1 82
char 1 67
char 1 69
char 1 0
align 1
LABELV $1094
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $1093
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $1092
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $1091
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 106
char 1 111
char 1 105
char 1 110
char 1 0
align 1
LABELV $1090
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 97
char 1 112
char 1 112
char 1 108
char 1 121
char 1 0
align 1
LABELV $1087
char 1 121
char 1 101
char 1 115
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $1086
char 1 110
char 1 111
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $1080
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 110
char 1 111
char 1 110
char 1 101
char 1 99
char 1 111
char 1 110
char 1 102
char 1 105
char 1 103
char 1 109
char 1 101
char 1 0
align 1
LABELV $1079
char 1 121
char 1 101
char 1 115
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $1078
char 1 110
char 1 111
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $1074
char 1 106
char 1 101
char 1 100
char 1 105
char 1 110
char 1 111
char 1 110
char 1 106
char 1 101
char 1 100
char 1 105
char 1 0
align 1
LABELV $1068
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $1013
char 1 37
char 1 48
char 1 50
char 1 105
char 1 58
char 1 37
char 1 48
char 1 50
char 1 105
char 1 0
align 1
LABELV $998
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
LABELV $983
char 1 117
char 1 105
char 1 95
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $981
char 1 117
char 1 105
char 1 95
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 78
char 1 101
char 1 116
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $963
char 1 72
char 1 85
char 1 77
char 1 65
char 1 78
char 1 0
align 1
LABELV $962
char 1 67
char 1 76
char 1 79
char 1 83
char 1 69
char 1 68
char 1 0
align 1
LABELV $961
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 0
align 1
LABELV $947
char 1 115
char 1 118
char 1 95
char 1 109
char 1 97
char 1 120
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $943
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 37
char 1 105
char 1 0
align 1
LABELV $942
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 37
char 1 105
char 1 0
align 1
LABELV $936
char 1 82
char 1 101
char 1 100
char 1 0
align 1
LABELV $935
char 1 66
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $934
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $927
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $926
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $924
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 48
char 1 95
char 1 89
char 1 69
char 1 83
char 1 0
align 1
LABELV $923
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 48
char 1 95
char 1 78
char 1 79
char 1 0
align 1
LABELV $911
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
LABELV $905
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
LABELV $889
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
LABELV $888
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
LABELV $883
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
LABELV $877
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 68
char 1 69
char 1 83
char 1 67
char 1 95
char 1 68
char 1 65
char 1 82
char 1 75
char 1 0
align 1
LABELV $874
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $873
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $872
char 1 100
char 1 97
char 1 114
char 1 107
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $871
char 1 100
char 1 97
char 1 114
char 1 107
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $870
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $867
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 97
char 1 108
char 1 108
char 1 111
char 1 99
char 1 0
align 1
LABELV $866
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 68
char 1 69
char 1 83
char 1 67
char 1 95
char 1 76
char 1 73
char 1 71
char 1 72
char 1 84
char 1 0
align 1
LABELV $860
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
LABELV $857
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
LABELV $850
char 1 68
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 0
char 1 0
align 1
LABELV $849
char 1 66
char 1 108
char 1 117
char 1 101
char 1 0
char 1 0
align 1
LABELV $847
char 1 82
char 1 101
char 1 100
char 1 0
char 1 0
align 1
LABELV $835
char 1 37
char 1 105
char 1 0
char 1 0
align 1
LABELV $826
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $792
char 1 37
char 1 115
char 1 46
char 1 114
char 1 111
char 1 113
char 1 0
align 1
LABELV $773
char 1 37
char 1 115
char 1 95
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $768
char 1 37
char 1 115
char 1 95
char 1 109
char 1 101
char 1 116
char 1 97
char 1 108
char 1 0
align 1
LABELV $740
char 1 117
char 1 105
char 1 95
char 1 106
char 1 111
char 1 105
char 1 110
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $730
char 1 65
char 1 85
char 1 84
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 48
char 1 0
align 1
LABELV $728
char 1 65
char 1 85
char 1 84
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 51
char 1 0
align 1
LABELV $726
char 1 65
char 1 85
char 1 84
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 50
char 1 0
align 1
LABELV $722
char 1 65
char 1 85
char 1 84
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 49
char 1 0
align 1
LABELV $721
char 1 99
char 1 103
char 1 95
char 1 97
char 1 117
char 1 116
char 1 111
char 1 115
char 1 119
char 1 105
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $717
char 1 117
char 1 105
char 1 95
char 1 97
char 1 99
char 1 116
char 1 117
char 1 97
char 1 108
char 1 78
char 1 101
char 1 116
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $716
char 1 117
char 1 105
char 1 95
char 1 110
char 1 101
char 1 116
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $705
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
LABELV $704
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
LABELV $703
char 1 117
char 1 105
char 1 95
char 1 102
char 1 114
char 1 97
char 1 103
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $702
char 1 37
char 1 100
char 1 0
align 1
LABELV $701
char 1 117
char 1 105
char 1 95
char 1 99
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $697
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $695
char 1 104
char 1 97
char 1 110
char 1 100
char 1 105
char 1 99
char 1 97
char 1 112
char 1 0
align 1
LABELV $693
char 1 53
char 1 0
align 1
LABELV $692
char 1 49
char 1 48
char 1 0
align 1
LABELV $691
char 1 49
char 1 53
char 1 0
align 1
LABELV $690
char 1 50
char 1 48
char 1 0
align 1
LABELV $689
char 1 50
char 1 53
char 1 0
align 1
LABELV $688
char 1 51
char 1 48
char 1 0
align 1
LABELV $687
char 1 51
char 1 53
char 1 0
align 1
LABELV $686
char 1 52
char 1 48
char 1 0
align 1
LABELV $685
char 1 52
char 1 53
char 1 0
align 1
LABELV $684
char 1 53
char 1 48
char 1 0
align 1
LABELV $683
char 1 53
char 1 53
char 1 0
align 1
LABELV $682
char 1 54
char 1 48
char 1 0
align 1
LABELV $681
char 1 54
char 1 53
char 1 0
align 1
LABELV $680
char 1 55
char 1 48
char 1 0
align 1
LABELV $679
char 1 55
char 1 53
char 1 0
align 1
LABELV $678
char 1 56
char 1 48
char 1 0
align 1
LABELV $677
char 1 56
char 1 53
char 1 0
align 1
LABELV $676
char 1 57
char 1 48
char 1 0
align 1
LABELV $675
char 1 57
char 1 53
char 1 0
align 1
LABELV $674
char 1 78
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $673
char 1 117
char 1 105
char 1 47
char 1 106
char 1 107
char 1 50
char 1 109
char 1 112
char 1 47
char 1 103
char 1 97
char 1 109
char 1 101
char 1 105
char 1 110
char 1 102
char 1 111
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $669
char 1 117
char 1 105
char 1 95
char 1 109
char 1 101
char 1 110
char 1 117
char 1 70
char 1 105
char 1 108
char 1 101
char 1 115
char 1 77
char 1 80
char 1 0
align 1
LABELV $668
char 1 117
char 1 105
char 1 47
char 1 106
char 1 107
char 1 50
char 1 109
char 1 112
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $661
char 1 85
char 1 73
char 1 32
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
char 1 108
char 1 111
char 1 97
char 1 100
char 1 32
char 1 116
char 1 105
char 1 109
char 1 101
char 1 32
char 1 61
char 1 32
char 1 37
char 1 100
char 1 32
char 1 109
char 1 105
char 1 108
char 1 108
char 1 105
char 1 32
char 1 115
char 1 101
char 1 99
char 1 111
char 1 110
char 1 100
char 1 115
char 1 10
char 1 0
align 1
LABELV $658
char 1 108
char 1 111
char 1 97
char 1 100
char 1 109
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $639
char 1 94
char 1 49
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 32
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 58
char 1 32
char 1 117
char 1 105
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 46
char 1 116
char 1 120
char 1 116
char 1 44
char 1 32
char 1 117
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 32
char 1 116
char 1 111
char 1 32
char 1 99
char 1 111
char 1 110
char 1 116
char 1 105
char 1 110
char 1 117
char 1 101
char 1 33
char 1 10
char 1 0
align 1
LABELV $636
char 1 117
char 1 105
char 1 47
char 1 106
char 1 107
char 1 50
char 1 109
char 1 112
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $635
char 1 94
char 1 51
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 117
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 10
char 1 0
align 1
LABELV $632
char 1 117
char 1 105
char 1 47
char 1 106
char 1 107
char 1 50
char 1 109
char 1 112
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 100
char 1 101
char 1 102
char 1 46
char 1 104
char 1 0
align 1
LABELV $612
char 1 109
char 1 101
char 1 110
char 1 117
char 1 100
char 1 101
char 1 102
char 1 0
align 1
LABELV $606
char 1 97
char 1 115
char 1 115
char 1 101
char 1 116
char 1 71
char 1 108
char 1 111
char 1 98
char 1 97
char 1 108
char 1 68
char 1 101
char 1 102
char 1 0
align 1
LABELV $592
char 1 80
char 1 97
char 1 114
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 58
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $580
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 67
char 1 111
char 1 108
char 1 111
char 1 114
char 1 0
align 1
LABELV $572
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 89
char 1 0
align 1
LABELV $564
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 88
char 1 0
align 1
LABELV $556
char 1 102
char 1 97
char 1 100
char 1 101
char 1 65
char 1 109
char 1 111
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $548
char 1 102
char 1 97
char 1 100
char 1 101
char 1 67
char 1 121
char 1 99
char 1 108
char 1 101
char 1 0
align 1
LABELV $540
char 1 102
char 1 97
char 1 100
char 1 101
char 1 67
char 1 108
char 1 97
char 1 109
char 1 112
char 1 0
align 1
LABELV $532
char 1 109
char 1 101
char 1 110
char 1 117
char 1 66
char 1 117
char 1 122
char 1 122
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $524
char 1 105
char 1 116
char 1 101
char 1 109
char 1 70
char 1 111
char 1 99
char 1 117
char 1 115
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $516
char 1 109
char 1 101
char 1 110
char 1 117
char 1 69
char 1 120
char 1 105
char 1 116
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $508
char 1 109
char 1 101
char 1 110
char 1 117
char 1 69
char 1 110
char 1 116
char 1 101
char 1 114
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $500
char 1 103
char 1 114
char 1 97
char 1 100
char 1 105
char 1 101
char 1 110
char 1 116
char 1 98
char 1 97
char 1 114
char 1 0
align 1
LABELV $492
char 1 66
char 1 97
char 1 100
char 1 32
char 1 49
char 1 115
char 1 116
char 1 32
char 1 112
char 1 97
char 1 114
char 1 97
char 1 109
char 1 101
char 1 116
char 1 101
char 1 114
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 107
char 1 101
char 1 121
char 1 119
char 1 111
char 1 114
char 1 100
char 1 32
char 1 39
char 1 99
char 1 117
char 1 114
char 1 115
char 1 111
char 1 114
char 1 39
char 1 0
align 1
LABELV $487
char 1 99
char 1 117
char 1 114
char 1 115
char 1 111
char 1 114
char 1 0
align 1
LABELV $483
char 1 66
char 1 97
char 1 100
char 1 32
char 1 49
char 1 115
char 1 116
char 1 32
char 1 112
char 1 97
char 1 114
char 1 97
char 1 109
char 1 101
char 1 116
char 1 101
char 1 114
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 107
char 1 101
char 1 121
char 1 119
char 1 111
char 1 114
char 1 100
char 1 32
char 1 39
char 1 115
char 1 116
char 1 114
char 1 105
char 1 112
char 1 101
char 1 100
char 1 70
char 1 105
char 1 108
char 1 101
char 1 39
char 1 0
align 1
LABELV $482
char 1 94
char 1 51
char 1 0
align 1
LABELV $479
char 1 115
char 1 116
char 1 114
char 1 105
char 1 112
char 1 101
char 1 100
char 1 70
char 1 105
char 1 108
char 1 101
char 1 0
align 1
LABELV $470
char 1 98
char 1 105
char 1 103
char 1 70
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $461
char 1 115
char 1 109
char 1 97
char 1 108
char 1 108
char 1 70
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $450
char 1 102
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $446
char 1 125
char 1 0
align 1
LABELV $437
char 1 123
char 1 0
align 1
LABELV $430
char 1 94
char 1 49
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 116
char 1 111
char 1 111
char 1 32
char 1 108
char 1 97
char 1 114
char 1 103
char 1 101
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 37
char 1 105
char 1 44
char 1 32
char 1 109
char 1 97
char 1 120
char 1 32
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 101
char 1 100
char 1 32
char 1 105
char 1 115
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $427
char 1 94
char 1 49
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 117
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 10
char 1 0
align 1
LABELV $410
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
LABELV $392
char 1 83
char 1 69
char 1 84
char 1 95
char 1 78
char 1 69
char 1 87
char 1 95
char 1 82
char 1 65
char 1 78
char 1 75
char 1 0
align 1
LABELV $359
char 1 37
char 1 115
char 1 95
char 1 37
char 1 115
char 1 0
align 1
LABELV $354
char 1 49
char 1 0
align 1
LABELV $353
char 1 115
char 1 118
char 1 95
char 1 107
char 1 105
char 1 108
char 1 108
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $352
char 1 99
char 1 103
char 1 95
char 1 116
char 1 104
char 1 105
char 1 114
char 1 100
char 1 80
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 0
align 1
LABELV $351
char 1 48
char 1 0
align 1
LABELV $350
char 1 99
char 1 103
char 1 95
char 1 99
char 1 97
char 1 109
char 1 101
char 1 114
char 1 97
char 1 79
char 1 114
char 1 98
char 1 105
char 1 116
char 1 0
align 1
LABELV $336
char 1 37
char 1 99
char 1 0
align 1
LABELV $282
char 1 103
char 1 102
char 1 120
char 1 47
char 1 50
char 1 100
char 1 47
char 1 99
char 1 114
char 1 111
char 1 115
char 1 115
char 1 104
char 1 97
char 1 105
char 1 114
char 1 37
char 1 99
char 1 0
align 1
LABELV $275
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 110
char 1 101
char 1 119
char 1 47
char 1 115
char 1 108
char 1 105
char 1 100
char 1 101
char 1 114
char 1 116
char 1 104
char 1 117
char 1 109
char 1 98
char 1 0
align 1
LABELV $272
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 110
char 1 101
char 1 119
char 1 47
char 1 115
char 1 108
char 1 105
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $269
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 116
char 1 104
char 1 117
char 1 109
char 1 98
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $266
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 97
char 1 114
char 1 114
char 1 111
char 1 119
char 1 95
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $263
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 97
char 1 114
char 1 114
char 1 111
char 1 119
char 1 95
char 1 108
char 1 101
char 1 102
char 1 116
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $260
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 97
char 1 114
char 1 114
char 1 111
char 1 119
char 1 95
char 1 117
char 1 112
char 1 95
char 1 97
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $257
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 97
char 1 114
char 1 114
char 1 111
char 1 119
char 1 95
char 1 100
char 1 119
char 1 110
char 1 95
char 1 97
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $254
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $251
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 119
char 1 104
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $247
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 112
char 1 117
char 1 114
char 1 112
char 1 108
char 1 101
char 1 0
align 1
LABELV $243
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $239
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 103
char 1 114
char 1 110
char 1 0
align 1
LABELV $235
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 121
char 1 101
char 1 108
char 1 0
align 1
LABELV $231
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 111
char 1 114
char 1 97
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $227
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $224
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 98
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $221
char 1 117
char 1 105
char 1 47
char 1 97
char 1 115
char 1 115
char 1 101
char 1 116
char 1 115
char 1 47
char 1 103
char 1 114
char 1 97
char 1 100
char 1 105
char 1 101
char 1 110
char 1 116
char 1 98
char 1 97
char 1 114
char 1 50
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $214
char 1 63
char 1 63
char 1 0
align 1
LABELV $213
char 1 78
char 1 69
char 1 84
char 1 95
char 1 83
char 1 79
char 1 85
char 1 82
char 1 67
char 1 69
char 1 83
char 1 0
align 1
LABELV $208
char 1 74
char 1 97
char 1 110
char 1 0
align 1
LABELV $207
char 1 77
char 1 79
char 1 78
char 1 84
char 1 72
char 1 83
char 1 0
align 1
LABELV $206
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
LABELV $195
char 1 70
char 1 82
char 1 69
char 1 69
char 1 0
align 1
LABELV $194
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
LABELV $191
char 1 66
char 1 76
char 1 85
char 1 69
char 1 0
align 1
LABELV $188
char 1 82
char 1 69
char 1 68
char 1 0
align 1
LABELV $184
char 1 73
char 1 80
char 1 88
char 1 0
align 1
LABELV $183
char 1 85
char 1 68
char 1 80
char 1 0
align 1
LABELV $182
char 1 63
char 1 63
char 1 63
char 1 0
align 1
LABELV $181
char 1 84
char 1 69
char 1 65
char 1 77
char 1 84
char 1 79
char 1 85
char 1 82
char 1 78
char 1 65
char 1 77
char 1 69
char 1 78
char 1 84
char 1 0
align 1
LABELV $180
char 1 67
char 1 84
char 1 89
char 1 0
align 1
LABELV $179
char 1 67
char 1 84
char 1 70
char 1 0
align 1
LABELV $178
char 1 78
char 1 47
char 1 65
char 1 0
align 1
LABELV $177
char 1 84
char 1 69
char 1 65
char 1 77
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $176
char 1 83
char 1 80
char 1 0
align 1
LABELV $175
char 1 68
char 1 85
char 1 69
char 1 76
char 1 0
align 1
LABELV $174
char 1 74
char 1 69
char 1 68
char 1 73
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $173
char 1 72
char 1 79
char 1 76
char 1 79
char 1 67
char 1 82
char 1 79
char 1 78
char 1 0
align 1
LABELV $172
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $171
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 53
char 1 0
align 1
LABELV $170
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 52
char 1 0
align 1
LABELV $169
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 51
char 1 0
align 1
LABELV $168
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 50
char 1 0
align 1
LABELV $167
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 49
char 1 0
align 1
LABELV $166
char 1 74
char 1 101
char 1 100
char 1 105
char 1 32
char 1 75
char 1 110
char 1 105
char 1 103
char 1 104
char 1 116
char 1 32
char 1 50
char 1 0
align 1
LABELV $165
char 1 0
align 1
LABELV $164
char 1 65
char 1 108
char 1 108
char 1 0
